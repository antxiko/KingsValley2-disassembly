#!/usr/bin/env python3
"""El mismo codigo en los dos cartuchos: que instruccion de uno es cual del otro.

Los bancos propios con codigo (0-3 y 12) llevan en los dos cartuchos casi el
mismo programa, pero desplazado: el de MSX2 mete o cambia trozos (los
graficos) y todo lo de detras se mueve, hasta de banco (1-2-3 van siempre
juntos, y hay rutinas del 2 de MSX1 que en MSX2 estan en el 3). Por eso los
bancos 0-3 se alinean como un solo chorro, y el 12 aparte. Esta herramienta alinea los dos
listados de un banco instruccion a instruccion, con los operandos de 16 bits
tapados (las direcciones cambian de uno a otro; los registros, los saltos
relativos y los valores de un byte no), y da el mapa direccion de MSX1 <->
direccion de MSX2 de las instrucciones que casan.

Sirve para comentar una vez y llevar el comentario al otro (tools/lleva.py),
y para ver lo que cambia de verdad de un cartucho a otro.

Uso: paralelo.py                    resumen por banco
     paralelo.py --escribe          y work/paralelo.json: {"pNN:XXXX" de MSX1: "pMM:YYYY" de MSX2}
     paralelo.py --distinto         los tramos que no casan
"""
import difflib
import json
import os
import re
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
RAIZ = os.path.dirname(AQUI)
sys.path.insert(0, AQUI)

from paginas import PREFIJO   # noqa: E402

CHORROS = ((0, 1, 2, 3), (12,))
MIN_TRAMO = 4
INSTR = re.compile(r"^\t([a-z][^\t;]*?)\s*;([0-9a-f]{4})")


def listado(v, b):
    return os.path.join(RAIZ, "src", v, "%s_%s_p%02d.asm" % (PREFIJO, v, b))


def instrucciones(v, b):
    """[(banco, direccion, texto, normalizado)] del listado del banco b."""
    out = []
    for ln in open(listado(v, b), encoding="utf-8"):
        m = INSTR.match(ln)
        if not m or ln.startswith(("\tdefb", "\tdefw", "\tdefs", "\torg")):
            continue
        t = m.group(1).strip()
        n = re.sub(r"\bL_[0-9A-F]{4}\b", "nn", t)
        # solo se tapan las direcciones del cartucho: la RAM, la VRAM y las
        # constantes tienen que ser las mismas (si no, cualquier tira de
        # `ld hl,nn / ld de,nn / call nn` casaria con cualquier otra)
        n = re.sub(r"\b0?([0-9a-f]{4})h\b",
                   lambda m: "nn" if 0x4000 <= int(m.group(1), 16) < 0xC000 else m.group(0), n)
        n = re.sub(r"\$[+-]\d+", "r", n)
        out.append((b, int(m.group(2), 16), t, n))
    return out


def chorro(v, bancos):
    return [x for b in bancos for x in instrucciones(v, b)]


def alinea(bancos):
    a, c = chorro("msx1", bancos), chorro("msx2", bancos)
    sm = difflib.SequenceMatcher(None, [x[3] for x in a], [x[3] for x in c], autojunk=False)
    mapa = {}
    usados_a, usados_c = set(), set()
    for i, j, n in sm.get_matching_blocks():
        # un tramo de menos de 4 instrucciones iguales es casualidad (un
        # `push bc` suelto casa con cualquier otro): no se cuenta
        if n < MIN_TRAMO:
            continue
        for k in range(n):
            mapa[a[i + k][:2]] = c[j + k][:2]
            usados_a.add(i + k)
            usados_c.add(j + k)
    # Segunda pasada: lo que no ha casado en orden puede estar cambiado de
    # sitio (una rutina que en un cartucho va antes y en el otro despues).
    # Se alinea lo suelto de uno con lo suelto del otro, en tramos largos.
    for _ in range(3):
        ra = [i for i in range(len(a)) if i not in usados_a]
        rc = [j for j in range(len(c)) if j not in usados_c]
        sm2 = difflib.SequenceMatcher(None, [a[i][3] for i in ra], [c[j][3] for j in rc],
                                      autojunk=False)
        nuevos = 0
        for i, j, n in sm2.get_matching_blocks():
            if n < 8:
                continue
            for k in range(n):
                mapa[a[ra[i + k]][:2]] = c[rc[j + k]][:2]
                usados_a.add(ra[i + k])
                usados_c.add(rc[j + k])
            nuevos += n
        if not nuevos:
            break
    return a, c, mapa, sm


def clave(x):
    return "p%02d:%04X" % x


def main(argv):
    if "--distinto" in argv:
        for ch in CHORROS:
            a, c, mapa, sm = alinea(ch)
            for op, i1, i2, j1, j2 in sm.get_opcodes():
                if op == "equal":
                    continue
                print("%-7s msx1 %s  msx2 %s" % (
                    op, "%s-%04X (%d)" % (clave(a[i1][:2]), a[i2 - 1][1], i2 - i1) if i2 > i1 else "-",
                    "%s-%04X (%d)" % (clave(c[j1][:2]), c[j2 - 1][1], j2 - j1) if j2 > j1 else "-"))
        return 0
    todo = {}
    for ch in CHORROS:
        a, c, mapa, sm = alinea(ch)
        todo.update({clave(k): clave(v) for k, v in mapa.items()})
        for b in ch:
            n1 = len([x for x in a if x[0] == b])
            n2 = len([x for x in c if x[0] == b])
            m1 = len([k for k in mapa if k[0] == b])
            m2 = len([v for v in mapa.values() if v[0] == b])
            print("p%02d: %5d instrucciones en MSX1 (%5.1f %% casan), %5d en MSX2 (%5.1f %%)" % (
                b, n1, 100.0 * m1 / max(1, n1), n2, 100.0 * m2 / max(1, n2)))
    if "--escribe" in argv:
        json.dump(todo, open(os.path.join(RAIZ, "work", "paralelo.json"), "w"), indent=0)
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
