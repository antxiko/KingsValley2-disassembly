#!/usr/bin/env python3
"""Coteja los comentarios escritos a mano de MSX1 contra su propio codigo.

Casi todos salen de MSX2 (tools/lleva.py), y un comentario llevado puede
decir algo que solo es verdad en MSX2. Dos cosas se miran:

- DIRECCIONES: toda 0xXXXX del cartucho (0x4000-0xBFFF) que cite un
  comentario de MSX1 tiene que existir en algun listado de MSX1 (como
  instruccion, etiqueta u operando). Si no, es la de MSX2.
- CONSTANTES VECINAS: un comentario que resume varias instrucciones puede
  citar un numero de una vecina que en MSX1 es otro (0x26 en MSX2, 0x1C en
  MSX1). Si el numero esta en las 10 instrucciones desde la comentada en
  MSX2 y no en las de MSX1, se avisa. Necesita work/paralelo.json (de
  tools/paralelo.py --escribe); sin el, esto no se mira.

Sale con 1 si hay alguno.

Uso: coteja_llevados.py
"""
import glob
import json
import os
import re
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
RAIZ = os.path.dirname(AQUI)
sys.path.insert(0, AQUI)
from lleva import FIJAS, listado   # noqa: E402

HEX = re.compile(r"\b0?([0-9a-f]{2,4})h\b")
NUM = re.compile(r"(?<![\w:])0x([0-9A-F]{2,4})\b")
INI = "# --- A MANO"
FIN = "# --- fin de lo escrito a mano"
PROPIOS = (0, 1, 2, 3, 12)


def a_mano(b):
    s = open(os.path.join(RAIZ, "src", "msx1", "p%02d.notes" % b), encoding="utf-8").read()
    s = s[s.find(INI):s.find(FIN)]
    return [(int(m.group(1), 16), m.group(2))
            for m in re.finditer(r"^C\s+0x([0-9A-F]{4})\s+(.*)$", s, re.M)]


def todo_msx1():
    s = set()
    for f in glob.glob(os.path.join(RAIZ, "src", "msx1", "*.asm")) + \
            glob.glob(os.path.join(RAIZ, "src", "comun", "*.asm")):
        for ln in open(f, encoding="utf-8"):
            code = ln.split(";")[0]
            for m in re.finditer(r"\b0?([0-9a-f]{4})h\b|L_([0-9A-F]{4})", code):
                s.add(int(m.group(1) or m.group(2), 16))
            m = re.search(r";([0-9a-f]{4})\s", ln)
            if m:
                s.add(int(m.group(1), 16))
    return s


def main():
    malos = []
    hay = todo_msx1()
    ruta = os.path.join(RAIZ, "work", "paralelo.json")
    # el mapa lo hace tools/paralelo.py --escribe; sin el, solo las direcciones
    m = json.load(open(ruta)) if os.path.exists(ruta) else {}
    for b in PROPIOS:
        l1, l2 = listado("msx1", b), listado("msx2", b)
        a1, a2 = sorted(l1), sorted(l2)
        for a, txt in a_mano(b):
            for h in NUM.findall(txt):
                v = int(h, 16)
                if len(h) == 4 and 0x4000 <= v <= 0xBFFF and v not in FIJAS and v not in hay:
                    malos.append("p%02d:%04X  0x%04X no esta en MSX1: %s" % (b, a, v, txt[:70]))
            k = m.get("p%02d:%04X" % (b, a))
            if not k or a not in l1:
                continue
            x2 = int(k.split(":")[1], 16)
            if x2 not in l2:
                continue
            v1, v2 = set(), set()
            for t in (l1[x] for x in a1[a1.index(a):a1.index(a) + 10]):
                v1 |= {int(x, 16) for x in HEX.findall(t)}
            for t in (l2[x] for x in a2[a2.index(x2):a2.index(x2) + 10]):
                v2 |= {int(x, 16) for x in HEX.findall(t)}
            for h in NUM.findall(txt):
                v = int(h, 16)
                if v in v2 and v not in v1:
                    malos.append("p%02d:%04X  0x%X es de MSX2: %s" % (b, a, v, txt[:70]))
    for x in malos:
        print(x)
    print("comentarios de MSX1 que dicen algo de MSX2: %d" % len(malos))
    return 1 if malos else 0


if __name__ == "__main__":
    sys.exit(main())
