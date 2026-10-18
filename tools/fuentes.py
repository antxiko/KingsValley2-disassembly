#!/usr/bin/env python3
"""Donde esta cada fichero del desensamblado, para los dos cartuchos.

Los bancos que son iguales byte a byte en los dos cartuchos (paginas.COMUNES)
se desensamblan UNA vez, en src/comun y work/comun; el resto, en
src/<variante> y work/<variante> (tools/variante.py). Asi un banco comun
lleva un solo listado y unas solas notas, y los dos `make verify` lo usan.

    src/msx1/pNN.entries .nocode .notes   <prefijo>_msx1_pNN.asm
    src/msx2/...                          <prefijo>_msx2_pNN.asm
    src/comun/...                         <prefijo>_pNN.asm
    src/<variante>/semillas.txt sitios.txt tablas.txt datos.txt
                                          lo que lee tools/bancos.py

Uso como programa (para el Makefile):
    fuentes.py listado <n>      la ruta del listado del banco n
    fuentes.py src <n>          la carpeta de src del banco n
    fuentes.py work <n>         la carpeta de work del banco n
"""
import os
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
RAIZ = os.path.dirname(AQUI)
sys.path.insert(0, AQUI)

from paginas import COMUNES, N_PAGINAS, PREFIJO, nombre   # noqa: E402
from variante import actual                               # noqa: E402


def es_comun(p):
    return p in COMUNES


def parte(p):
    """'comun' o la variante en curso."""
    return "comun" if es_comun(p) else actual()


def rom():
    """La ROM de la variante en curso: <prefijo>_<variante>.rom en la raiz."""
    return os.path.join(RAIZ, "%s_%s.rom" % (PREFIJO, actual()))


def src(p=None):
    """src/comun o src/<variante>; sin banco, la de la variante (config)."""
    return os.path.join(RAIZ, "src", actual() if p is None else parte(p))


def work(p=None):
    return os.path.join(RAIZ, "work", actual() if p is None else parte(p))


def fichero(p, ext):
    """src/<parte>/pNN.<ext> (entries, nocode, notes)."""
    return os.path.join(src(p), "%s.%s" % (nombre(p), ext))


def traza(p):
    return os.path.join(work(p), "%s.trace.json" % nombre(p))


def binario(p):
    return os.path.join(work(p), "%s.bin" % nombre(p))


def listado(p):
    if es_comun(p):
        return os.path.join(src(p), "%s_%s.asm" % (PREFIJO, nombre(p)))
    return os.path.join(src(p), "%s_%s_%s.asm" % (PREFIJO, actual(), nombre(p)))


def listados():
    return [listado(p) for p in range(N_PAGINAS)]


def main(argv):
    if len(argv) < 3:
        sys.exit(__doc__)
    p = int(argv[2], 10)
    if argv[1] == "listado":
        print(os.path.relpath(listado(p), RAIZ).replace(os.sep, "/"))
    elif argv[1] == "src":
        print(os.path.relpath(src(p), RAIZ).replace(os.sep, "/"))
    elif argv[1] == "work":
        print(os.path.relpath(work(p), RAIZ).replace(os.sep, "/"))
    else:
        sys.exit(__doc__)


if __name__ == "__main__":
    main(sys.argv)
