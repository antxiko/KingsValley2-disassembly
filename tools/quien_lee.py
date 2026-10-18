#!/usr/bin/env python3
"""Cada hueco sin explicar y las instrucciones que lo apuntan CON SU BANCO PUESTO.

tools/huecos.py da por buena cualquier instruccion de un banco de la misma
ranura; en un cartucho de 32 bancos eso es ruido: en 0x8000 hay once bancos
distintos. Aqui solo cuenta una instruccion si el trazador de cartucho entero
(tools/bancos.py) la ha visto ejecutarse con el banco del hueco en su ranura
(o si esta en el propio banco), y solo instrucciones que cargan un puntero
-no los `call`/`jp`, que en un hueco de datos son de otro banco-.

Uso: quien_lee.py [pNN ...]
"""
import os
import sys
from collections import defaultdict

AQUI = os.path.dirname(os.path.abspath(__file__))
RAIZ = os.path.dirname(AQUI)
sys.path.insert(0, AQUI)
import fuentes                                  # noqa: E402
import bancos                                                   # noqa: E402
from paginas import ORG, TAM_PAGINA, N_PAGINAS, nombre           # noqa: E402
from rom import ROM                                              # noqa: E402

CARGA = {0x01: "ld bc,", 0x11: "ld de,", 0x21: "ld hl,", 0x31: "ld sp,",
         0x22: "ld (%04X),hl", 0x2A: "ld hl,(%04X)", 0x32: "ld (%04X),a",
         0x3A: "ld a,(%04X)"}
CARGA_IX = {0x21: "ld %s,", 0x2A: "ld %s,(%04X)", 0x22: "ld (%04X),%s"}
CARGA_ED = {0x4B: "ld bc,(%04X)", 0x5B: "ld de,(%04X)", 0x7B: "ld sp,(%04X)"}


def apuntadores(t):
    """{(banco, direccion): [(banco_de_la_instruccion, pc, texto)]}"""
    fuera = defaultdict(list)
    for b, pc in sorted(t.arranques):
        o = b * TAM_PAGINA + (pc & 0x1FFF)
        if (pc & 0x1FFF) + 4 > TAM_PAGINA:
            continue
        op = ROM[o]
        w = txt = None
        if op in CARGA:
            w = ROM[o + 1] | (ROM[o + 2] << 8)
            txt = CARGA[op]
        elif op in (0xDD, 0xFD) and ROM[o + 1] in CARGA_IX:
            w = ROM[o + 2] | (ROM[o + 3] << 8)
            txt = CARGA_IX[ROM[o + 1]]
        elif op == 0xED and ROM[o + 1] in CARGA_ED:
            w = ROM[o + 2] | (ROM[o + 3] << 8)
            txt = CARGA_ED[ROM[o + 1]]
        if w is None:
            continue
        # Dentro de un trozo que se ejecuta en RAM (src/reubica.txt), un
        # puntero a su rango de ejecucion apunta a sus propios bytes.
        w2 = bancos.traduce(b, pc, w) if hasattr(bancos, "traduce") else w
        if w2 != w:
            fuera[(b, w2)].append((b, pc, "%s %04X (en RAM; aqui %04X)" % (
                txt.split(",")[0] if "%" in txt else txt.rstrip(","), w, w2)))
            continue
        if not 0x4000 <= w < 0xC000:
            continue
        if w < 0x6000:
            destinos = {0}
        else:
            r = (w - 0x6000) >> 13
            destinos = {s[r] for s in t.config_de[(b, pc)]}
            if ORG[b] == (w & 0xE000):
                destinos.add(b)
        for d in destinos:
            if d is not None and d < N_PAGINAS:
                fuera[(d, w)].append((b, pc, "%s %04X" % (txt.split(",")[0] if "%" in txt else txt.rstrip(","), w)))
    return fuera


def main(argv):
    t, _ = bancos.traza_completa(ROM, fuentes.src())
    ap = apuntadores(t)
    import presupuesto
    quiero = {int(a[1:]) for a in argv[1:]} or set(range(N_PAGINAS))
    sin = presupuesto.sin_explicar(fuentes.work(), fuentes.src()) \
        if hasattr(presupuesto, "sin_explicar") else None
    if sin is None:
        sys.exit("presupuesto.py no exporta sin_explicar()")
    for p, ini, fin in sin:
        if p not in quiero:
            continue
        print("%s %04X..%04X %5d B  %s" % (nombre(p), ini, fin - 1, fin - ini,
              ROM[p * TAM_PAGINA + ini - ORG[p]:p * TAM_PAGINA + ini - ORG[p] + 8].hex(" ")))
        ls = sorted((w, b, pc, txt) for (d, w), xs in ap.items() if d == p and ini <= w < fin
                    for b, pc, txt in xs)
        for w, b, pc, txt in ls[:12]:
            print("      %04X <- %s:%04X  %s" % (w, nombre(b), pc, txt))
        if len(ls) > 12:
            print("      ... y %d mas" % (len(ls) - 12))
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
