#!/usr/bin/env python3
"""Lleva los comentarios escritos a mano de un cartucho al otro.

Con el mapa de tools/paralelo.py (work/paralelo.json, que hay que regenerar
antes con `paralelo.py --escribe`), cada C de la seccion A MANO de las notas
de un banco propio de un cartucho se copia a la instruccion que le casa en el
otro. Las direcciones "pNN:XXXX" del texto se traducen por el mismo mapa; si
alguna no se puede traducir (cae en codigo que no casa), el comentario NO se
lleva y se avisa: diria una direccion falsa.

No pisa: si el otro ya tiene una C en esa direccion, se queda la suya.

Uso: lleva.py <de> <a> [--escribe] [--todo]     (msx1 msx2 o msx2 msx1)
     --todo: avisa de todos los que no se llevan, no solo de 40
"""
import json
import os
import re
import sys
from collections import defaultdict

AQUI = os.path.dirname(os.path.abspath(__file__))
RAIZ = os.path.dirname(AQUI)
sys.path.insert(0, AQUI)

from paginas import COMUNES, ORG   # noqa: E402

INI = "# --- A MANO: comentarios escritos leyendo el codigo ---"
FIN = "# --- fin de lo escrito a mano ---"
DIR = re.compile(r"\bp(\d\d):([0-9A-F]{4})\b")


def notas(v, b):
    return os.path.join(RAIZ, "src", v, "p%02d.notes" % b)


def a_mano(v, b):
    """{direccion: texto} de la seccion A MANO."""
    out = {}
    ruta = notas(v, b)
    if not os.path.exists(ruta):
        return out
    dentro = False
    for ln in open(ruta, encoding="utf-8"):
        ln = ln.rstrip("\n")
        if ln == INI:
            dentro = True
        elif ln == FIN:
            dentro = False
        elif dentro and ln.startswith("C "):
            _, a, txt = ln.split(" ", 2)
            out[int(a, 0)] = txt
    return out


SUELTA = re.compile(r"(?<![\w:])0x([0-9A-F]{4})\b")
HEX = re.compile(r"\b0?([0-9a-f]{4})h\b")
# direcciones que no son de nadie: las ventanas y el mapper
FIJAS = {0x4000, 0x6000, 0x8000, 0xA000, 0x5000, 0x7000, 0x9000, 0xB000,
         0x5FFF, 0x7FFF, 0x9FFF, 0xBFFF}


def listado(v, b):
    """{direccion: instruccion} del listado del banco b de la version v."""
    if b in COMUNES:
        ruta = os.path.join(RAIZ, "src", "comun", "kv2_p%02d.asm" % b)
    else:
        ruta = os.path.join(RAIZ, "src", v, "kv2_%s_p%02d.asm" % (v, b))
    out = {}
    if not os.path.exists(ruta):
        return out
    for ln in open(ruta, encoding="utf-8"):
        mm = re.match(r"\t([^;]*?)\s*;([0-9a-f]{4})\b", ln)
        if mm:
            out[int(mm.group(2), 16)] = mm.group(1)
    return out


class Sueltas:
    """Traduce las direcciones sin banco (0xXXXX) de un comentario.

    Por este orden: el operando de la misma instruccion, la direccion de una
    instruccion que casa, otra instruccion del banco con ese operando (una
    tabla) o, si es de un banco comun, tal cual. Si no, None:
    el comentario diria una direccion falsa."""

    def __init__(self, de, a_, m):
        self.de, self.a_, self.m = de, a_, m
        self.l1 = {b: listado(de, b) for b in range(16)}
        self.l2 = {b: listado(a_, b) for b in range(16)}
        # lo de los bancos comunes es igual en los dos cartuchos
        self.comun = set().union(*(self._ops(self.l1[b]) for b in COMUNES))

    @staticmethod
    def _ops(lst):
        s = set(lst)
        for t in lst.values():
            s.update(int(x, 16) for x in HEX.findall(t))
            s.update(int(x, 16) for x in re.findall(r"L_([0-9A-F]{4})", t))
        return s

    def una(self, v, b, a, b2, a2):
        if v in FIJAS or not 0x4000 <= v <= 0xBFFF:
            return v
        i1 = [int(x, 16) for x in HEX.findall(self.l1[b].get(a, ""))]
        i2 = [int(x, 16) for x in HEX.findall(self.l2[b2].get(a2, ""))]
        if v in i1 and len(i1) == len(i2):
            return i2[i1.index(v)]
        # una instruccion: la del propio banco si cae en su ventana; si no,
        # la del unico banco propio cuya ventana la tenga
        def ventana(bb):
            return ORG[bb] <= v < ORG[bb] + 0x2000
        bancos = [b] if ventana(b) else [bb for bb in ORG if bb not in COMUNES and ventana(bb)]
        cands = {self.m["p%02d:%04X" % (bb, v)] for bb in bancos
                 if "p%02d:%04X" % (bb, v) in self.m}
        if len(bancos) > 1:
            cands = set()
        if len(cands) == 1:
            return int(cands.pop().split(":")[1], 16)
        vistos = set()
        for aa, t in self.l1[b].items():
            if v in [int(x, 16) for x in HEX.findall(t)]:
                k2 = self.m.get("p%02d:%04X" % (b, aa))
                if not k2:
                    continue
                bb2, aa2 = int(k2[1:3]), int(k2[4:], 16)
                j1 = [int(x, 16) for x in HEX.findall(t)]
                j2 = [int(x, 16) for x in HEX.findall(self.l2[bb2].get(aa2, ""))]
                if len(j1) == len(j2):
                    vistos.add(j2[j1.index(v)])
        if len(vistos) == 1:
            return vistos.pop()
        if v in self.comun:
            return v
        return None


def main(argv):
    de, a_ = argv[1], argv[2]
    m = json.load(open(os.path.join(RAIZ, "work", "paralelo.json")))
    if de == "msx2":
        m = {v: k for k, v in m.items()}
    sueltas = Sueltas(de, a_, m)
    llevados, sin, ya = defaultdict(list), [], 0
    for b in (0, 1, 2, 3, 12):
        for a, txt in sorted(a_mano(de, b).items()):
            k = "p%02d:%04X" % (b, a)
            if k not in m:
                sin.append((k, "la instruccion no casa", txt))
                continue

            malas = []

            def traduce(mm):
                kk = "p%s:%s" % (mm.group(1), mm.group(2))
                if int(mm.group(1)) in COMUNES:
                    return kk
                if kk in m:
                    return m[kk]
                malas.append(kk)
                return kk
            bb, aa = m[k].split(":")
            sueltas_malas = []

            def traduce_suelta(mm):
                v = int(mm.group(1), 16)
                w = sueltas.una(v, b, a, int(bb[1:]), int(aa, 16))
                if w is None:
                    sueltas_malas.append(mm.group(0))
                    return mm.group(0)
                return "0x%04X" % w
            # primero las sueltas (sobre el texto original), luego las pNN:XXXX
            t2 = DIR.sub(traduce, SUELTA.sub(traduce_suelta, txt))
            if malas or sueltas_malas:
                sin.append((k, "no se traduce %s" % ", ".join(malas + sueltas_malas), txt))
                continue
            llevados[int(bb[1:])].append((int(aa, 16), t2))
    n = 0
    for b, cs in sorted(llevados.items()):
        suyos = a_mano(a_, b)
        nuevos = [(a, t) for a, t in cs if a not in suyos]
        ya += len(cs) - len(nuevos)
        n += len(nuevos)
        if "--escribe" in argv and nuevos:
            ruta = os.path.join(RAIZ, "work", "lleva_%s_p%02d.txt" % (a_, b))
            open(ruta, "w", encoding="utf-8", newline="\n").write(
                "".join("p%02d 0x%04X %s\n" % (b, a, t) for a, t in nuevos))
    print("%s -> %s: %d comentarios llevados, %d ya tenian el suyo, %d sin llevar"
          % (de, a_, n, ya, len(sin)))
    for k, por, txt in (sin if "--todo" in argv else sin[:40]):
        print("  %s  %s: %s" % (k, por, txt[:70]))
    if "--escribe" in argv:
        print("ficheros en work/lleva_%s_pNN.txt: meterlos con VARIANTE=%s tools/mete_c.py" % (a_, a_))
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
