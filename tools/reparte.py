#!/usr/bin/env python3
"""Pone en su sitio lo que escriben las herramientas de cartucho entero.

  reparte.py corta
      Corta la ROM de la variante en curso en sus 16 bancos: los propios a
      work/<variante>/pNN.bin y los comunes a work/comun/pNN.bin. Si el comun
      ya esta (cortado de la otra ROM), tiene que ser identico byte a byte.

  reparte.py semillas
      tools/bancos.py escribe los .entries y .nocode de los 16 bancos en
      work/<variante>/semillas. Los de los bancos propios van tal cual a
      src/<variante>; los de los comunes se JUNTAN con los de la otra
      variante (hace falta haber trazado las dos) y van a src/comun: un banco
      comun se ejecuta en los dos cartuchos, y sus entradas son las de los dos.
      Una entrada a la que se llega en los dos lleva las dos justificaciones.
"""
import os
import re
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, AQUI)

import fuentes                                            # noqa: E402
from paginas import N_PAGINAS, TAM_PAGINA, nombre          # noqa: E402
from variante import VARIANTES, actual                    # noqa: E402


def corta():
    d = open(fuentes.rom(), "rb").read()
    if len(d) != TAM_PAGINA * N_PAGINAS:
        sys.exit("la ROM mide %d bytes y no %d" % (len(d), TAM_PAGINA * N_PAGINAS))
    for p in range(N_PAGINAS):
        os.makedirs(fuentes.work(p), exist_ok=True)
        blq = d[p * TAM_PAGINA:(p + 1) * TAM_PAGINA]
        ruta = fuentes.binario(p)
        if fuentes.es_comun(p) and os.path.exists(ruta):
            if open(ruta, "rb").read() != blq:
                sys.exit("%s: el banco comun no es igual en las dos ROM" % nombre(p))
            continue
        with open(ruta, "wb") as f:
            f.write(blq)
    print("%s: 16 bancos cortados" % actual())


def cabecera_y_lineas(ruta):
    cab, lineas = [], []
    for ln in open(ruta, encoding="utf-8"):
        ln = ln.rstrip("\n")
        if ln.startswith("#") and not lineas:
            cab.append(ln)
        elif ln.strip():
            lineas.append(ln)
    return cab, lineas


def clave(ln, ext):
    crudo = ln.partition("#")[0].split()
    if ext == "entries":
        return tuple(crudo)                       # '0xADDR' o '!ajeno 0xPC'
    return tuple(crudo[:2])                       # '0xINI 0xFIN'


def semillas():
    v = actual()
    origen = os.path.join(fuentes.RAIZ, "work", v, "semillas")
    for p in range(N_PAGINAS):
        for ext in ("entries", "nocode"):
            ruta = os.path.join(origen, "%s.%s" % (nombre(p), ext))
            destino = fuentes.fichero(p, ext)
            os.makedirs(os.path.dirname(destino), exist_ok=True)
            if not fuentes.es_comun(p):
                open(destino, "w", encoding="utf-8", newline="\n").write(
                    open(ruta, encoding="utf-8").read())
                continue
            juntas, cab = {}, None
            for w in VARIANTES:
                r = os.path.join(fuentes.RAIZ, "work", w, "semillas", "%s.%s" % (nombre(p), ext))
                if not os.path.exists(r):
                    sys.exit("%s: falta %s (hay que trazar las dos variantes)" % (nombre(p), r))
                c, lineas = cabecera_y_lineas(r)
                cab = cab or c
                for ln in lineas:
                    if ln.startswith("#"):
                        continue
                    k = clave(ln, ext)
                    datos, _, por = ln.partition("#")
                    por = por.strip()
                    if ext == "nocode":
                        datos, por = ln, ""
                    e = juntas.setdefault(k, [datos.rstrip(), []])
                    if por:
                        e[1].append("%s %s" % (w, por))
            with open(destino, "w", encoding="utf-8", newline="\n") as f:
                f.write("\n".join(cab) + "\n")
                f.write("#\n# BANCO COMUN a los dos cartuchos: las entradas de los dos"
                        " (tools/reparte.py).\n")
                for k in sorted(juntas, key=lambda k: [int(x, 0) if x.startswith("0x") else x for x in k]):
                    datos, por = juntas[k]
                    f.write("%s%s\n" % (datos, ("   # " + " | ".join(por)) if por else ""))
    print("%s: semillas repartidas" % v)


if __name__ == "__main__":
    if len(sys.argv) < 2 or sys.argv[1] not in ("corta", "semillas"):
        sys.exit(__doc__)
    {"corta": corta, "semillas": semillas}[sys.argv[1]]()
