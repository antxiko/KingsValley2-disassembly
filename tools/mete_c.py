#!/usr/bin/env python3
"""Mete comentarios escritos a mano en la seccion A MANO de src/pNN.notes.

El fichero de entrada lleva 'pNN 0xADDR texto' por linea. Una C que ya
estaba en la seccion se sustituye; las demas se anaden. La seccion va justo
detras de la primera linea de las notas, antes de las que reescriben
bloques.py y anota.py, que no la tocan.

Uso: mete_c.py <fichero>
"""
import os
import re
import sys
import fuentes
from collections import defaultdict

AQUI = os.path.dirname(os.path.abspath(__file__))
RAIZ = os.path.dirname(AQUI)
INI = "# --- A MANO: comentarios escritos leyendo el codigo ---"
FIN = "# --- fin de lo escrito a mano ---"


def main(argv):
    nuevas = defaultdict(dict)
    for ln in open(argv[1], encoding="utf-8"):
        m = re.match(r"^p(\d\d)\s+(0x[0-9A-Fa-f]{4})\s+(.+)$", ln.rstrip("\n"))
        if m:
            # los listados de la serie van en ASCII: fuera los signos de
            # apertura y cualquier otra cosa de mas de 7 bits
            txt = m.group(3).replace("¿", "").replace("¡", "")
            nuevas[int(m.group(1))][int(m.group(2), 16)] = "".join(
                c for c in txt if ord(c) < 128).strip()
    total = 0
    for b, cs in sorted(nuevas.items()):
        ruta = fuentes.fichero(b, "notes")
        filas = open(ruta, encoding="utf-8").read().split("\n")
        if INI not in filas:
            filas[1:1] = ["", INI, FIN]
        i, f = filas.index(INI), filas.index(FIN)
        viejas = {}
        for ln in filas[i + 1:f]:
            m = re.match(r"^C (0x[0-9A-Fa-f]{4}) (.*)$", ln)
            if m:
                viejas[int(m.group(1), 16)] = m.group(2)
        viejas.update(cs)
        cuerpo = ["C 0x%04X %s" % (a, t) for a, t in sorted(viejas.items())]
        filas[i:f + 1] = [INI] + cuerpo + [FIN]
        open(ruta, "w", encoding="utf-8", newline="\n").write("\n".join(filas))
        total += len(cs)
        print("p%02d: %d comentarios (%d en la seccion)" % (b, len(cs), len(viejas)))
    print("en total %d" % total)


if __name__ == "__main__":
    main(sys.argv)
