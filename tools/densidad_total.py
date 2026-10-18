#!/usr/bin/env python3
"""La densidad de comentarios del cartucho entero y las rutinas flojas.

Suma lo que tools/densidad.py cuenta banco a banco: instrucciones, cuantas
llevan comentario de linea y cuantas rutinas (de 6 instrucciones o mas) se
quedan por debajo del 10 %.

Uso: densidad_total.py
"""
import glob
import os
import re
import subprocess
import sys
import fuentes

AQUI = os.path.dirname(os.path.abspath(__file__))
RAIZ = os.path.dirname(AQUI)


def main():
    ti = tc = tf = tr = 0
    for f in fuentes.listados():
        r = subprocess.run([sys.executable, os.path.join(AQUI, "densidad.py"), f],
                           capture_output=True, text=True).stdout
        m = re.search(r"(\d+) rutinas por debajo del 10 %, de (\d+)", r)
        n = re.search(r"en total: (\d+) instrucciones, (\d+) comentarios", r)
        if not n:
            continue
        i, c = int(n.group(1)), int(n.group(2))
        fl, ru = (int(m.group(1)), int(m.group(2))) if m else (0, 0)
        ti += i; tc += c; tf += fl; tr += ru
        print("%s  %5d instrucciones  %5d comentarios  %5.1f %%  flojas %d de %d"
              % (os.path.basename(f), i, c, 100.0 * c / i if i else 0, fl, ru))
    print("TOTAL %d instrucciones, %d comentarios, %.2f %%, flojas %d de %d"
          % (ti, tc, 100.0 * tc / ti, tf, tr))


if __name__ == "__main__":
    main()
