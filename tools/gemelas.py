#!/usr/bin/env python3
"""Reparte cada nombre de tools/anotaciones.py a sus copias en otros bancos.

Este cartucho lleva codigo repetido: el menu de p00/p01 (con la RAM en
0xF2xx) esta otra vez en p02/p03 (con la RAM en 0xD3xx), y la biblioteca
grafica de p05 esta en p07 y en p09. Una rutina es gemela de otra si sus
instrucciones, desde la etiqueta hasta el primer `ret` o `jp` sin condicion,
son las mismas con los operandos de 16 bits tapados (las direcciones cambian
de una copia a otra; los registros, los saltos relativos y los valores de un
byte no). Solo se reparte si la gemela es UNICA en su banco y tiene al menos
cuatro instrucciones.

Escribe src/gemelas.txt: 'pNN XXXX nombre que hace (gemela de pMM:YYYY)'.

Uso: gemelas.py [--escribe]
"""
import glob
import os
import re
import sys
from collections import defaultdict

AQUI = os.path.dirname(os.path.abspath(__file__))
RAIZ = os.path.dirname(AQUI)
sys.path.insert(0, AQUI)
import fuentes                                  # noqa: E402

MIN = 4
MAX = 48


def instrucciones(b):
    ruta = fuentes.listado(b)
    out = []
    for ln in open(ruta, encoding="utf-8"):
        m = re.match(r"\t([a-z][^\t;]*?)\s*;([0-9a-f]{4})", ln)
        if m and not ln.startswith(("\tdefb", "\tdefw")):
            out.append((int(m.group(2), 16), m.group(1).strip()))
    return out


def tapa(t):
    """Tapa las direcciones de ROM y de RAM (de 0x4000 arriba), que cambian de
    una copia a otra; las de VRAM, los contadores y la BIOS se quedan."""
    t = re.sub(r"\bL_[0-9A-F]{4}\b", "NN", t)
    t = re.sub(r"\b[a-z_][a-z_0-9]*_[a-z0-9_]*\b", "NN", t)       # nombres ya puestos
    return re.sub(r"\b0([4-9a-f][0-9a-f]{3})h\b", "NN", t)


def firma(ins, k):
    f = []
    for j in range(k, min(len(ins), k + MAX)):
        t = ins[j][1]
        f.append(tapa(t))
        if t == "ret" or (t.startswith("jp ") and "," not in t) or t.startswith("jp (") \
                or (t.startswith("jr ") and "," not in t and not t.startswith("jr $")):
            return tuple(f)
    return None


def propias(f):
    """Cuantas instrucciones no son `call`, `jp` ni `ret`: una rutina hecha
    solo de llamadas no dice nada con las direcciones tapadas."""
    return sum(1 for t in f if not t.startswith(("call", "jp", "ret")))


def main(argv):
    import anotaciones as A
    propios = dict(A.RUTINAS_A_MANO)
    bancos = A.BANCOS
    ins = {b: instrucciones(b) for b in bancos}
    por_firma = {b: defaultdict(list) for b in bancos}
    for b in bancos:
        for k, (a, _) in enumerate(ins[b]):
            f = firma(ins[b], k)
            if f and len(f) >= MIN:
                por_firma[b][f].append(a)
    lineas = []
    for (b, a), (nom, que) in sorted(propios.items()):
        pos = {x: k for k, (x, _) in enumerate(ins[b])}
        if a not in pos:
            continue
        f = firma(ins[b], pos[a])
        if not f or len(f) < MIN:
            continue
        for b2 in bancos:
            if b2 == b:
                continue
            hay = por_firma[b2].get(f, [])
            if len(hay) == 1 and (b2, hay[0]) not in propios and propias(f) >= 3:
                lineas.append("p%02d %04X %s %s (gemela de p%02d:%04X)" % (b2, hay[0], nom, que, b, a))
    # una misma direccion puede salir de dos originales: se queda la primera;
    # y un nombre que ya existe en el banco de destino no se repite (pasmo no
    # admite dos etiquetas iguales en un mismo fichero)
    vistas, fuera = set(), []
    usados = {(b, nom) for (b, _), (nom, _) in propios.items()}
    for ln in lineas:
        k = tuple(ln.split()[:2])
        nb = (int(k[0][1:]), ln.split()[2])
        if k not in vistas and nb not in usados:
            vistas.add(k)
            usados.add(nb)
            fuera.append(ln)
    print("%d gemelas" % len(fuera))
    if "--escribe" in argv:
        with open(os.path.join(fuentes.src(), "gemelas.txt"), "w", encoding="utf-8", newline="\n") as f:
            f.write("# Nombres repartidos a las copias (tools/gemelas.py; no editar a mano)\n")
            f.write("\n".join(fuera) + "\n")
    copia_comentarios(bancos, ins, por_firma, "--escribe" in argv)
    return 0


INI_C = "# --- COMENTARIOS COPIADOS DE LAS GEMELAS (tools/gemelas.py; no editar a mano) ---"
FIN_C = "# --- fin de los comentarios copiados ---"
A_MANO = "# --- A MANO: comentarios escritos leyendo el codigo ---"
FIN_A_MANO = "# --- fin de lo escrito a mano ---"
# Un comentario que nombra una direccion de ROM o de RAM (0x4000 arriba) o
# una rutina por su banco no vale en la copia, donde las direcciones son otras.
NO_SE_COPIA = re.compile(r"0x[4-9A-Fa-f][0-9A-Fa-f]{3}|p\d\d:")


def a_mano(b):
    """Los comentarios de la seccion A MANO del banco: {direccion: texto}."""
    ruta = fuentes.fichero(b, "notes")
    fuera, dentro = {}, False
    for ln in open(ruta, encoding="utf-8"):
        if ln.startswith(A_MANO):
            dentro = True
        elif ln.startswith(FIN_A_MANO):
            dentro = False
        elif dentro and ln.startswith("C "):
            p = ln.rstrip("\n").split(None, 2)
            fuera[int(p[1], 0)] = p[2] if len(p) > 2 else ""
    return fuera


def etiquetas(b):
    """La primera instruccion detras de cada etiqueta del listado."""
    ruta = fuentes.listado(b)
    fuera, pendiente = [], False
    for ln in open(ruta, encoding="utf-8"):
        if re.match(r"^[A-Za-z_][A-Za-z_0-9]*:", ln):
            pendiente = True
            continue
        m = re.match(r"\t([a-z][^\t;]*?)\s*;([0-9a-f]{4})", ln)
        if m and pendiente and not ln.startswith(("\tdefb", "\tdefw")):
            fuera.append(int(m.group(2), 16))
            pendiente = False
    return fuera


def copia_comentarios(bancos, ins, por_firma, escribe):
    """Los comentarios escritos a mano en una rutina pasan a su gemela,
    instruccion por instruccion, si la gemela no lleva ya uno a mano."""
    manos = {b: a_mano(b) for b in bancos}
    nuevos = defaultdict(dict)
    for b in bancos:
        if not manos[b]:
            continue
        pos = {x: k for k, (x, _) in enumerate(ins[b])}
        for a in etiquetas(b):
            k = pos.get(a)
            if k is None:
                continue
            f = firma(ins[b], k)
            if not f or len(f) < MIN or propias(f) < 3:
                continue
            for b2 in bancos:
                if b2 == b:
                    continue
                hay = por_firma[b2].get(f, [])
                if len(hay) != 1:
                    continue
                pos2 = {x: j for j, (x, _) in enumerate(ins[b2])}
                k2 = pos2[hay[0]]
                for i in range(len(f)):
                    a1, a2 = ins[b][k + i][0], ins[b2][k2 + i][0]
                    txt = manos[b].get(a1)
                    if txt and a2 not in manos[b2] and not NO_SE_COPIA.search(txt):
                        nuevos[b2].setdefault(a2, txt)
    print("%d comentarios copiados a las gemelas" % sum(len(v) for v in nuevos.values()))
    if not escribe:
        return
    for b in bancos:
        ruta = fuentes.fichero(b, "notes")
        filas = open(ruta, encoding="utf-8").read().split("\n")
        if INI_C in filas:
            i, f = filas.index(INI_C), filas.index(FIN_C)
            del filas[i:f + 1]
        cuerpo = ["C 0x%04X %s" % (a, t) for a, t in sorted(nuevos[b].items())]
        if cuerpo:
            filas[1:1] = [INI_C] + cuerpo + [FIN_C]
        open(ruta, "w", encoding="utf-8", newline="\n").write("\n".join(filas))


if __name__ == "__main__":
    sys.exit(main(sys.argv))
