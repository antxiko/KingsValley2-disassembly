#!/usr/bin/env python3
"""Codigo huerfano: los huecos sin explicar que desensamblan a una rutina
entera y que no alcanza nadie.

Para cada hueco de un banco de codigo se decodifica desde su primer byte. Se
propone como punto de entrada solo si se cumplen las tres cosas que pide la
norma (Circus Charlie, RC-712):
  - el trazado no entra (es un hueco del presupuesto);
  - las instrucciones encajan hasta un `ret`, `jp`, `jr` sin condicion o
    `jp (hl)` antes del final del hueco o justo en el, sin bytes 0xFF de
    relleno por medio;
  - ninguna instruccion del listado salta, llama o carga su direccion con
    una constante. (Que ninguna palabra de la ROM la valga no se puede pedir:
    en 128 KB cualquier direccion sale como palabra por casualidad.)

Uso: huerfanas.py            lista lo que encuentra
     huerfanas.py --semillas  lineas para src/semillas.txt
"""
import glob
import os
import re
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
RAIZ = os.path.dirname(AQUI)
sys.path.insert(0, AQUI)
import fuentes                                  # noqa: E402
import bancos                                   # noqa: E402
import presupuesto                              # noqa: E402
from paginas import ORG, nombre                 # noqa: E402

ROM = open(fuentes.rom(), "rb").read()
from cartucho import CODIGO                     # noqa: E402  los bancos de codigo y su reparto
FIN = {0xC9, 0xC3, 0x18, 0xE9}


def largo(o):
    op = ROM[o]
    if op == 0xCB:
        return 2
    if op == 0xED:
        return 4 if ROM[o + 1] in bancos.ED_LEN4 else 2
    if op in (0xDD, 0xFD):
        o2 = ROM[o + 1]
        return 4 if o2 == 0xCB else 1 + bancos.BASE_LEN[o2] + (1 if o2 in bancos.IDX_DISP else 0)
    return bancos.BASE_LEN[op]


def inmediatos():
    """{direccion} cargadas con una constante en algun listado."""
    out = set()
    for f in fuentes.listados():
        for ln in open(f, encoding="utf-8"):
            if ln.startswith("\tdef"):
                continue
            for m in re.finditer(r"\b0([0-9a-f]{4})h", ln.split(";")[0]):
                out.add(int(m.group(1), 16))
            for m in re.finditer(r"\bL_([0-9A-F]{4})\b", ln.split(";")[0]):
                out.add(int(m.group(1), 16))
    return out


def palabras():
    return {ROM[i] | ROM[i + 1] << 8 for i in range(len(ROM) - 1)}


def rutina(p, ini, fin):
    """El final de la rutina si encaja, o None."""
    o = p * 0x2000 + ini - ORG[p]
    a = ini
    while a < fin:
        op = ROM[o]
        if op == 0xFF:
            return None
        n = largo(o)
        if a + n > fin:
            return None
        if op in FIN or (op == 0xDD and ROM[o + 1] == 0xE9):
            return a + n
        a += n
        o += n
    return None


def main(argv):
    cargadas = inmediatos()
    for p, ini, fin in presupuesto.sin_explicar(fuentes.work(), fuentes.src()):
        if p not in CODIGO:
            continue
        trozos = []
        a = ini
        while a < fin:
            f = rutina(p, a, fin)
            if f is None or a in cargadas:
                trozos = None
                break
            trozos.append((a, f))
            a = f
        if not trozos:
            continue
        s = CODIGO[p]
        for a, f in trozos:
            if "--semillas" in argv:
                print("%s 0x%04X %d %d %d  # codigo huerfano: %d bytes que acaban en %s; el "
                      "trazado no entra y ninguna instruccion salta, llama o carga 0x%04X" % (
                          nombre(p), a, s[0], s[1], s[2], f - a,
                          "ret" if ROM[p * 0x2000 + f - 1 - ORG[p]] == 0xC9 else "un salto", a))
            else:
                print("%s %04X-%04X  rutina de %d bytes" % (nombre(p), a, f, f - a))


if __name__ == "__main__":
    main(sys.argv)
