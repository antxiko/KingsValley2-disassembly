#!/usr/bin/env python3
"""Los textos del juego: todos los letreros que pinta p00:51D0, en letras.

Cada letrero es [x][y] y caracteres; 0xFE trae otra posicion [x][y] y 0xFF
acaba (tools/lectores.py los declara, cada uno con quien lo lee). Los
caracteres son numeros de la fuente que haya puesta en ese momento, y hay dos:

- la de los menus y el juego: 0xE1 = A ... 0xFA = Z, 0xD0-0xD9 las cifras;
- la de las secuencias de las piramides y del final, corrida cuatro: 0xDD = A.

Que fuente lleva cada letrero no esta en el letrero: se dice aqui (FINAL) por
el sitio que lo pinta (las secuencias de p01:6F5D y p01:734D), y se comprueba
mirando las pantallas pintadas por tools/imagenes.py.

Uso: textos.py [msx1|msx2]     (por defecto msx2)
"""
import glob
import os
import re
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
RAIZ = os.path.dirname(AQUI)
sys.path.insert(0, AQUI)
from paginas import ORG   # noqa: E402

# los que se pintan con la fuente de las secuencias (0xDD = A)
FINAL = ("del final", "el final", "de cada piramide acabada")
SIGNOS = {0x00: " ", 0xDB: "!", 0xF7: ".", 0xFC: "-", 0xFD: "?"}


def letra(x, base):
    if base <= x < base + 26:
        return chr(ord("A") + x - base)
    if 0xD0 <= x <= 0xD9:                      # las cifras, igual en las dos (ROOM 1008)
        return chr(ord("0") + x - 0xD0)
    if base == 0xDD and x in (0xFA, 0xFB):    # VICK XIII: X, 0xFA y 0xFB
        return {0xFA: "I", 0xFB: "II"}[x]
    if base == 0xE1 and x == 0xFB:            # el hueco de lo que se escribe
        return "_"
    return SIGNOS.get(x, "{%02X}" % x)


def letrero(rom, b, a, base):
    o = b * 0x2000 - ORG[b]
    i = a + 2
    lineas, cur = [], ""
    while True:
        x = rom[o + i]
        i += 1
        if x == 0xFF:
            break
        if x == 0xFE:
            lineas.append(cur.rstrip())
            cur = ""
            i += 2
            continue
        cur += letra(x, base)
    lineas.append(cur.rstrip())
    return [ln for ln in lineas if ln]


def letreros(v):
    rom = open(os.path.join(RAIZ, "kv2_%s.rom" % v), "rb").read()
    out = []
    for f in sorted(glob.glob(os.path.join(RAIZ, "src", v, "p*.notes")) +
                    glob.glob(os.path.join(RAIZ, "src", "comun", "p*.notes"))):
        b = int(re.search(r"p(\d\d)\.notes", f).group(1))
        for ln in open(f, encoding="utf-8"):
            m = re.match(r"D 0x([0-9A-F]{4}) 0x[0-9A-F]{4} (letrero_\w+)\s+letrero \((.*?)\): ", ln)
            if m:
                a, que = int(m.group(1), 16), m.group(3)
                if "titulo" in que:          # el logotipo hecho con caracteres: no es texto
                    continue
                base = 0xDD if any(k in que for k in FINAL) else 0xE1
                out.append((b, a, que, letrero(rom, b, a, base)))
    return out


def main(argv):
    v = argv[1] if len(argv) > 1 else "msx2"
    for b, a, que, ls in letreros(v):
        print("p%02d:%04X  (%s)" % (b, a, que))
        for ln in ls:
            print("    " + ln)
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
