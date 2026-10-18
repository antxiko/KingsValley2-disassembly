#!/usr/bin/env python3
"""Rehace lo escrito a mano de MSX1 desde MSX2 y lo propio de MSX1.

Los comentarios se escriben en MSX2; los de MSX1 salen de llevarlos por el
alineado de las dos ediciones (tools/paralelo.py, tools/lleva.py), y encima
van los propios de MSX1 (work/c_m1_*.txt, por orden de nombre: los ultimos
mandan). Como lleva.py no pisa lo que ya hay, para que una correccion hecha
en MSX2 llegue a MSX1 hay que vaciar antes la seccion A MANO de MSX1.

Despues: VARIANTE=msx1 tools/anota.py --escribe, make listado y make verify.

Uso: rehace_msx1.py
"""
import glob
import os
import subprocess
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
RAIZ = os.path.dirname(AQUI)
INI = "# --- A MANO: comentarios escritos leyendo el codigo ---"
FIN = "# --- fin de lo escrito a mano ---"
PROPIOS = (0, 1, 2, 3, 12)


def corre(*args, variante=None):
    env = dict(os.environ)
    if variante:
        env["VARIANTE"] = variante
    r = subprocess.run([sys.executable] + list(args), cwd=RAIZ, env=env,
                       capture_output=True, text=True)
    if r.returncode:
        sys.stderr.write(r.stdout + r.stderr)
        sys.exit(r.returncode)
    return r.stdout


def main():
    for b in PROPIOS:
        ruta = os.path.join(RAIZ, "src", "msx1", "p%02d.notes" % b)
        s = open(ruta, encoding="utf-8").read()
        i = s.index(INI) + len(INI)
        j = s.index(FIN)
        open(ruta, "w", encoding="utf-8", newline="").write(s[:i] + "\n" + s[j:])
    corre("tools/paralelo.py", "--escribe")
    print(corre("tools/lleva.py", "msx2", "msx1", "--escribe").splitlines()[0])
    ficheros = ["work/lleva_msx1_p%02d.txt" % b for b in PROPIOS]
    ficheros = [f for f in ficheros if os.path.exists(os.path.join(RAIZ, f))]
    ficheros += sorted(os.path.relpath(f, RAIZ).replace(os.sep, "/")
                       for f in glob.glob(os.path.join(RAIZ, "work", "c_m1_*.txt")))
    for f in ficheros:
        corre("tools/mete_c.py", f, variante="msx1")
    print("metidos:", ", ".join(os.path.basename(f) for f in ficheros))
    return 0


if __name__ == "__main__":
    sys.exit(main())
