#!/usr/bin/env python3
"""Lleva los comentarios escritos a mano de un cartucho al otro.

Con el mapa de tools/paralelo.py (work/paralelo.json, que hay que regenerar
antes con `paralelo.py --escribe`), cada C de la seccion A MANO de las notas
de un banco propio de un cartucho se copia a la instruccion que le casa en el
otro. Las direcciones "pNN:XXXX" del texto se traducen por el mismo mapa; si
alguna no se puede traducir (cae en codigo que no casa), el comentario NO se
lleva y se avisa: diria una direccion falsa.

No pisa: si el otro ya tiene una C en esa direccion, se queda la suya.

Uso: lleva.py <de> <a> [--escribe]     (msx1 msx2 o msx2 msx1)
"""
import json
import os
import re
import sys
from collections import defaultdict

AQUI = os.path.dirname(os.path.abspath(__file__))
RAIZ = os.path.dirname(AQUI)
sys.path.insert(0, AQUI)

from paginas import COMUNES   # noqa: E402

INI = "# --- A MANO: comentarios escritos leyendo el codigo ---"
FIN = "# --- fin de lo escrito a mano ---"
DIR = re.compile(r"\bp(\d\d):([0-9A-F]{4})\b")


def notas(v, b):
    return os.path.join(RAIZ, "src", v, "p%02d.notes" % b)


def a_mano(v, b):
    """{direccion: texto} de la seccion A MANO."""
    out = {}
    ruta = notas(v, b)
    if not os.path.exists(ruta):
        return out
    dentro = False
    for ln in open(ruta, encoding="utf-8"):
        ln = ln.rstrip("\n")
        if ln == INI:
            dentro = True
        elif ln == FIN:
            dentro = False
        elif dentro and ln.startswith("C "):
            _, a, txt = ln.split(" ", 2)
            out[int(a, 0)] = txt
    return out


def main(argv):
    de, a_ = argv[1], argv[2]
    m = json.load(open(os.path.join(RAIZ, "work", "paralelo.json")))
    if de == "msx2":
        m = {v: k for k, v in m.items()}
    llevados, sin, ya = defaultdict(list), [], 0
    for b in (0, 1, 2, 3, 12):
        for a, txt in sorted(a_mano(de, b).items()):
            k = "p%02d:%04X" % (b, a)
            if k not in m:
                sin.append((k, "la instruccion no casa", txt))
                continue

            malas = []

            def traduce(mm):
                kk = "p%s:%s" % (mm.group(1), mm.group(2))
                if int(mm.group(1)) in COMUNES:
                    return kk
                if kk in m:
                    return m[kk]
                malas.append(kk)
                return kk
            t2 = DIR.sub(traduce, txt)
            if malas:
                sin.append((k, "no se traduce %s" % ", ".join(malas), txt))
                continue
            bb, aa = m[k].split(":")
            llevados[int(bb[1:])].append((int(aa, 16), t2))
    n = 0
    for b, cs in sorted(llevados.items()):
        suyos = a_mano(a_, b)
        nuevos = [(a, t) for a, t in cs if a not in suyos]
        ya += len(cs) - len(nuevos)
        n += len(nuevos)
        if "--escribe" in argv and nuevos:
            ruta = os.path.join(RAIZ, "work", "lleva_%s_p%02d.txt" % (a_, b))
            open(ruta, "w", encoding="utf-8", newline="\n").write(
                "".join("p%02d 0x%04X %s\n" % (b, a, t) for a, t in nuevos))
    print("%s -> %s: %d comentarios llevados, %d ya tenian el suyo, %d sin llevar"
          % (de, a_, n, ya, len(sin)))
    for k, por, txt in sin[:40]:
        print("  %s  %s: %s" % (k, por, txt[:70]))
    if "--escribe" in argv:
        print("ficheros en work/lleva_%s_pNN.txt: meterlos con VARIANTE=%s tools/mete_c.py" % (a_, a_))
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
