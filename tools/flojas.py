#!/usr/bin/env python3
"""Las rutinas con menos de un comentario por cada diez instrucciones, con su
codigo, para comentarlas a mano. Herramienta de mano: no escribe nada.

Uso: flojas.py <banco> [desde] [cuantas] [--todas] [--huecos]
     --todas: tambien las que ya llegan al 10 %, para subir la densidad
"""
import glob
import os
import re
import sys
import fuentes

AQUI = os.path.dirname(os.path.abspath(__file__))
RAIZ = os.path.dirname(AQUI)


def rutinas(b):
    ruta = fuentes.listado(b)
    out, nombre, cuerpo = [], "(cabecera)", []
    for ln in open(ruta, encoding="utf-8"):
        m = re.match(r"^([A-Za-z_][A-Za-z_0-9]*):", ln)
        if m:
            if cuerpo:
                out.append((nombre, cuerpo))
            nombre, cuerpo = m.group(1), []
            continue
        m = re.match(r"^\t([a-z][^\t;]*?)\s*;([0-9a-f]{4})(.*)$", ln)
        if m and not ln.startswith("\tdefb"):
            com = m.group(3).strip()
            com = com[1:].strip() if com.startswith(";") else com
            cuerpo.append((int(m.group(2), 16), m.group(1).strip(), com))
    if cuerpo:
        out.append((nombre, cuerpo))
    return out


def main(argv):
    b = int(argv[1])
    desde = int(argv[2]) if len(argv) > 2 and not argv[2].startswith("-") else 0
    cuantas = int(argv[3]) if len(argv) > 3 and not argv[3].startswith("-") else 15
    todas = "--todas" in argv
    sel = []
    for nom, cu in rutinas(b):
        n = len(cu)
        c = sum(1 for _, _, x in cu if x)
        if n >= 6 and (todas or c * 10 < n):
            sel.append((nom, cu, c))
    if "--huecos" in argv:
        # primero las que tienen mas instrucciones sin comentar
        sel.sort(key=lambda r: -(len(r[1]) - r[2]))
    print("%d rutinas" % len(sel))
    for nom, cu, c in sel[desde:desde + cuantas]:
        print("== %s (%d instrucciones, %d comentarios)" % (nom, len(cu), c))
        for a, t, x in cu:
            print("  %04X  %-26s %s" % (a, t, ("; " + x) if x else ""))


if __name__ == "__main__":
    main(sys.argv)
