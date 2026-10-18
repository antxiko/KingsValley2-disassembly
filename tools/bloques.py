#!/usr/bin/env python3
"""Declara los bloques de datos que el codigo LEE, recorriendolos como el cartucho.

Un rango de datos no se declara porque sobre: se declara porque hay una
instruccion que lo lee. Aqui cada bloque sale de un LECTOR (la rutina que
recorre el formato) y del puntero que le llega, con los bancos que hay
puestos en ese momento; y su final sale de RECORRER el formato como lo
recorre esa rutina.

Dos fuentes de punteros:
  - las que ve el trazador de cartucho entero (tools/bancos.py): cada `call`
    o `jp` a un lector con HL, DE o IX cargados de un inmediato, y el reparto
    de bancos con el que se ejecuta. Son la mayoria y salen solas.
  - las que no ve porque el puntero sale de una tabla (DE = tabla[fase]):
    van a mano en tools/lectores.py, cada una con el sitio que la lee.

Lo que es de ESTE cartucho (los lectores, sus formatos, las tablas) esta en
tools/lectores.py; esta herramienta es la maquinaria.

Lo que sale se escribe, banco a banco, en una seccion delimitada de
src/pNN.notes que esta herramienta reescribe entera; lo de fuera no lo toca.
Un bloque que pise codigo trazado o una D escrita a mano NO se escribe: se
avisa, porque algo esta mal y hay que mirarlo.

Uso: bloques.py              informa de lo que encontraria
     bloques.py --escribe    y lo escribe en las notas
"""
import json
import os
import re
import sys
from collections import defaultdict

AQUI = os.path.dirname(os.path.abspath(__file__))
RAIZ = os.path.dirname(AQUI)
sys.path.insert(0, AQUI)
import fuentes                                  # noqa: E402
from variante import VARIANTES, actual   # noqa: E402
from paginas import ORG, TAM_PAGINA, N_PAGINAS, nombre   # noqa: E402
import bancos                                           # noqa: E402
from cartucho import DESPACHADOR                        # noqa: E402

ROM = open(fuentes.rom(), "rb").read()
CAB = "# --- BLOQUES QUE LEE EL CODIGO (seccion que reescribe tools/bloques.py; no editar a mano) ---"
FIN = "# --- fin de los bloques de bloques.py ---"

BLOQUES = []       # dict(p, ini, fin, nombre, texto, lectores, F)
AVISOS = []


class Ventana:
    """Leer el cartucho con un reparto puesto (banco en 0x6000/0x8000/0xA000)."""

    def __init__(self, s):
        self.s = tuple(s)

    def banco(self, a):
        return bancos.Cartucho.banco(a, self.s)

    def __call__(self, a):
        b = self.banco(a)
        return ROM[b * TAM_PAGINA + (a - ORG[b])]

    def w(self, a):
        return self(a) | (self(a + 1) << 8)


def ventana_de(banco_, a=None):
    """Una Ventana en la que el banco esta puesto en su ranura."""
    s = [1, 2, 3]
    if ORG[banco_] != 0x4000:
        s[(ORG[banco_] - 0x6000) >> 13] = banco_
    return Ventana(s)


def declara(v, ini, fin, nom, texto, lectores, F=None):
    """Un bloque [ini, fin) leido con la ventana v; si cruza de banco se parte
    y cada trozo dice de donde viene y a donde sigue."""
    if fin <= ini:
        AVISOS.append("bloque vacio %s en %04X" % (nom, ini))
        return
    if isinstance(lectores, str):
        lectores = [lectores]
    if fin > 0xC000 or ini < 0x4000:
        AVISOS.append("bloque %s %04X-%04X se sale de la ventana: no se declara" % (nom, ini, fin))
        return
    a = ini
    while a < fin:
        b = v.banco(a)
        tope = ORG[b] + TAM_PAGINA
        z = min(fin, tope)
        t = texto
        if a > ini:
            t += " (sigue del banco %d)" % v.banco(a - 1)
        if z < fin:
            t += " (sigue en el banco %d, en 0x%04X)" % (v.banco(z), z)
        BLOQUES.append(dict(p=b, ini=a, fin=z, nombre=nom if a == ini else nom + "_cola",
                            texto=t, lectores=list(lectores), F=F))
        a = z


# ------------------------------------------------- los punteros del trazador

_TRAZADOR = None


def trazador():
    global _TRAZADOR
    if _TRAZADOR is None:
        _TRAZADOR = bancos.traza_completa(ROM, fuentes.src())[0]
    return _TRAZADOR


def ix_antes(b, pc):
    """El `ld ix,nn` que carga IX justo antes de pc, en linea recta (hasta 12
    instrucciones, sin pasar por un ret/jp/jr ni por otra cosa que toque IX)."""
    t = trazador()
    o = ORG[b]
    previas = sorted(a for (bb, a) in t.arranques if bb == b and a < pc)[-12:]
    for a in reversed(previas):
        i = b * TAM_PAGINA + (a - o)
        if ROM[i] == 0xDD and ROM[i + 1] == 0x21:
            return ROM[i + 2] | ROM[i + 3] << 8
        if ROM[i] == 0xDD and ROM[i + 1] in (0xE1, 0x23, 0x2B, 0x09, 0x19, 0x29, 0x2A):
            return None
        if ROM[i] in (0xC9, 0xC3, 0x18):
            return None
    return None


def punteros(lector, registro):
    """[(puntero, Ventana, sitio)] de cada call/jp a `lector` con el registro
    ('HL', 'DE' o 'IX') cargado de un inmediato que no cae en codigo."""
    t = trazador()
    vistos = {}
    for (dst, b, pc, s, hl, de) in t.llamadas:
        if dst != lector:
            continue
        i = b * TAM_PAGINA + (pc - ORG[b])
        if ROM[i] not in (0xCD, 0xC3) and ROM[i] not in bancos.CALL_CC \
                and ROM[i] not in bancos.JP_CC:
            continue
        v = {"HL": hl, "DE": de}.get(registro)
        if registro == "IX":
            v = ix_antes(b, pc)
        if v is None or not 0x4000 <= v < 0xC000:
            continue
        vb = bancos.Cartucho.banco(v, s)
        if vb is None or vb >= N_PAGINAS or t.marcado[vb][v & 0x1FFF]:
            continue
        clave = (vb, v, "%s:%04X" % (nombre(b), pc))
        vistos[clave] = Ventana(s)
    return [(v, ven, sitio) for (vb, v, sitio), ven in sorted(vistos.items())]


def por_lector(lector, registro, recorre, nom, texto, F=None):
    """Declara un bloque por cada puntero distinto que le llega al lector;
    recorre(v, a) devuelve el final del bloque."""
    junt = defaultdict(list)
    vent = {}
    for a, v, sitio in punteros(lector, registro):
        k = (v.banco(a), a)
        junt[k].append(sitio)
        vent[k] = v
    for (b, a), sitios in sorted(junt.items()):
        v = vent[(b, a)]
        fin = recorre(v, a)
        declara(v, a, fin, "%s_%04X" % (nom, a), texto, sitios, F)
    return sorted(junt)


# ----------------------------------------------- lo comun de los Konami

def despachadores():
    """Las tablas del despachador de Konami, que van pegadas detras de su
    `call` y estan en los .nocode (tools/bancos.py): aqui se declaran con sus
    destinos."""
    pat = re.compile(r"(0x[0-9A-Fa-f]+)\s+(0x[0-9A-Fa-f]+)\s+tabla de (\d+) palabras "
                     r"del despachador \(call 0x[0-9A-Fa-f]+ en (0x[0-9A-Fa-f]+)\)")
    for p in range(N_PAGINAS):
        ruta = fuentes.fichero(p, "nocode")
        if not os.path.exists(ruta):
            continue
        for ln in open(ruta, encoding="utf-8"):
            m = pat.match(ln.strip())
            if not m:
                continue
            ini, fin, n, pc = int(m.group(1), 0), int(m.group(2), 0), int(m.group(3)), int(m.group(4), 0)
            o = p * TAM_PAGINA + (ini - ORG[p])
            dest = [ROM[o + 2 * k] | (ROM[o + 2 * k + 1] << 8) for k in range(n)]
            BLOQUES.append(dict(p=p, ini=ini, fin=fin, nombre="tabla_%04X" % ini,
                                texto="%d destinos del despachador p00:%04X (call en %s:%04X, el "
                                      "indice en A): %s" % (n, DESPACHADOR, nombre(p), pc,
                                                            ", ".join("%04X" % d for d in dest)),
                                lectores=["%s:%04X" % (nombre(p), pc)], F="w%d" % min(n, 8)))


def partidas():
    """Las instrucciones que empiezan al final de un banco y acaban en el
    siguiente (tools/bancos.py las mide): el trazador de un solo banco no las
    ve enteras, asi que sus dos trozos van como datos con su explicacion."""
    t = trazador()
    for b, pc, n in sorted(t.partidas):
        v = Ventana(sorted(t.config_de[(b, pc)])[0])
        bs = bytes(v(pc + i) for i in range(n))
        fin_banco = (pc & 0xE000) + TAM_PAGINA
        sig = v.banco(fin_banco)
        BLOQUES.append(dict(p=b, ini=pc, fin=fin_banco, nombre="partida_%04X" % pc,
                            texto="los %d primeros bytes de una instruccion de %d (%s) que "
                            "sigue en el banco %d: el trazador de un solo banco no puede verla "
                            "entera (tools/bancos.py)" % (fin_banco - pc, n, bs.hex(" ").upper(),
                                                          sig),
                            lectores=["%s:%04X" % (nombre(b), pc)], F=fin_banco - pc))
        BLOQUES.append(dict(p=sig, ini=fin_banco, fin=pc + n, nombre="partida_%04X" % fin_banco,
                            texto="los %d ultimos bytes de la instruccion de %s:%04X (%s), que "
                            "empieza en el banco %d" % (pc + n - fin_banco, nombre(b), pc,
                                                        bs.hex(" ").upper(), b),
                            lectores=["%s:%04X" % (nombre(b), pc)], F=pc + n - fin_banco))


def relleno(minimo=16):
    """La cola de 0xFF de cada banco, cuando es larga: relleno."""
    for p in range(N_PAGINAS):
        fin = ORG[p] + TAM_PAGINA
        a = fin
        while a > ORG[p] and ROM[p * TAM_PAGINA + (a - 1 - ORG[p])] == 0xFF:
            a -= 1
        # lo que ya ha declarado un lector (el 0xFF que acaba una lista) no
        # es relleno
        a = max([a] + [x["fin"] for x in BLOQUES if x["p"] == p and a <= x["fin"] <= fin])
        if fin - a >= minimo:
            BLOQUES.append(dict(p=p, ini=a, fin=fin, nombre="relleno_ff",
                                texto="%d bytes a 0xFF hasta el final del banco: "
                                "relleno" % (fin - a), lectores=["nadie"], F=16))


# ------------------------------------------------------------- escritura

def codigo_trazado(p):
    m = bytearray(TAM_PAGINA)
    ruta = fuentes.traza(p)
    if os.path.exists(ruta):
        for k, a, b in json.load(open(ruta))["blocks"]:
            if k == "c":
                for i in range(a - ORG[p], b - ORG[p]):
                    m[i] = 1
    return m


def a_mano(p):
    out = []
    ruta = fuentes.fichero(p, "notes")
    if not os.path.exists(ruta):
        return out
    dentro = False
    for ln in open(ruta, encoding="utf-8"):
        if ln.startswith(CAB):
            dentro = True
        elif ln.startswith(FIN):
            dentro = False
        elif not dentro and ln.startswith("D "):
            q = ln.split(None, 3)
            out.append((int(q[1], 0), int(q[2], 0)))
    return out


def junta(bloques):
    """Funde los que se solapan en uno, diciendo cuantos eran."""
    bloques.sort(key=lambda b: (b["ini"], b["fin"]))
    out = []
    for b in bloques:
        if out and b["ini"] < out[-1]["fin"]:
            u = out[-1]
            if b["ini"] == u["ini"] and b["fin"] == u["fin"] and b["nombre"] == u["nombre"]:
                for l in b["lectores"]:
                    if l not in u["lectores"]:
                        u["lectores"].append(l)
                continue
            u.setdefault("n", 1)
            u["n"] += 1
            u["fin"] = max(u["fin"], b["fin"])
            for l in b["lectores"]:
                if l not in u["lectores"]:
                    u["lectores"].append(l)
            u["solapa"] = u.get("solapa", "") + " (%s %04X-%04X)" % (b["nombre"], b["ini"], b["fin"])
        else:
            out.append(dict(b, lectores=list(b["lectores"])))
    return out


SIN_LECTOR = []

# Lo que la otra variante dejo dicho de los bancos comunes (work/<v>/comunes.json):
# sus bloques y sus punteros. En un banco comun las notas llevan los de las dos.
OTRAS = {}


def etiqueta(p, b, pc, var):
    """'p00:4F7F', y si la instruccion esta en un banco propio de un cartucho
    y el dato en un banco comun, con el cartucho delante: 'msx1 p00:4F7F'."""
    e = "%s:%04X" % (nombre(b), pc)
    return ("%s %s" % (var, e)) if fuentes.es_comun(p) and not fuentes.es_comun(b) else e


def con_variante(b, var):
    """El bloque b con sus lectores de bancos propios marcados con el cartucho."""
    ls = []
    for l in b["lectores"]:
        m = re.match(r"p(\d\d):", l)
        ls.append("%s %s" % (var, l) if m and not fuentes.es_comun(int(m.group(1))) else l)
    return dict(b, lectores=ls)


def guarda_comunes():
    ruta = os.path.join(fuentes.work(), "comunes.json")
    ap = trazador_ap()
    json.dump(dict(bloques=[b for b in BLOQUES if fuentes.es_comun(b["p"])],
                   ap=[(d, w, xs) for (d, w), xs in ap.items() if fuentes.es_comun(d)]),
              open(ruta, "w"))


def trazador_ap():
    import quien_lee
    if not hasattr(restos, "ap"):
        restos.ap = quien_lee.apuntadores(trazador())
    return restos.ap


def carga_otras():
    for v in VARIANTES:
        if v == actual():
            continue
        ruta = os.path.join(fuentes.RAIZ, "work", v, "comunes.json")
        if os.path.exists(ruta):
            OTRAS[v] = json.load(open(ruta))
        else:
            AVISOS.append("falta %s: las notas de los bancos comunes no se escriben (pasa "
                          "bloques.py con VARIANTE=%s primero)" % (ruta, v))


def restos(p, cod, mano, buenos, lineas):
    """Lo que queda sin declarar entre el codigo y los bloques: si alguna
    instruccion lo apunta con su banco puesto (tools/quien_lee.py), se declara
    con ese lector y el tamano es lo que hay hasta lo siguiente (no sale de
    recorrerlo, y lo dice). Lo que no apunta nadie NO se declara: se apunta en
    SIN_LECTOR para mirarlo a mano."""
    import quien_lee
    if not hasattr(restos, "ap"):
        restos.ap = quien_lee.apuntadores(trazador())
    # en un banco comun, lo que apuntan los dos cartuchos
    restos.aps = [(actual(), restos.ap)]
    if fuentes.es_comun(p):
        restos.aps += [(v, {(d, w): xs for d, w, xs in o["ap"]}) for v, o in OTRAS.items()]
    m = bytearray(cod)
    for i, f in mano:
        for x in range(i, f):
            m[x - ORG[p]] = 1
    for b in buenos:
        for x in range(b["ini"], b["fin"]):
            m[x - ORG[p]] = 1
    i = 0
    while i < TAM_PAGINA:
        if m[i]:
            i += 1
            continue
        j = i
        while j < TAM_PAGINA and not m[j]:
            j += 1
        ini, fin = ORG[p] + i, ORG[p] + j
        ls = sorted({(w, etiqueta(p, b, pc, var)) for var, ap in restos.aps for (d, w), xs in ap.items()
                     if d == p and ini <= w < fin for b, pc, _ in xs})
        if ls:
            lect = [e for w, e in ls[:6]]
            lineas.append("D 0x%04X 0x%04X resto_%04X  lo apuntan con el banco puesto %s; el "
                          "tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo "
                          "leen %s (%d bytes)" % (ini, fin, ini, ", ".join(
                              "%s (0x%04X)" % (e, w) for w, e in ls[:6]),
                              ", ".join(lect), fin - ini))
            lineas.append("F 0x%04X 16" % ini)
        else:
            SIN_LECTOR.append((p, ini, fin))
        i = j


def main(argv):
    # lectores.py importa este modulo como `bloques`: que sea este mismo y no
    # una segunda copia con su propia lista de BLOQUES
    sys.modules.setdefault("bloques", sys.modules[__name__])
    import lectores
    escribe = "--escribe" in argv
    lectores.todo()
    despachadores()
    partidas()
    relleno()
    guarda_comunes()
    carga_otras()
    por = defaultdict(list)
    for b in BLOQUES:
        por[b["p"]].append(con_variante(b, actual()) if fuentes.es_comun(b["p"]) else b)
    for v, o in OTRAS.items():
        for b in o["bloques"]:
            por[b["p"]].append(con_variante(b, v))
    total = 0
    for p in range(N_PAGINAS):
        cod = codigo_trazado(p)
        mano = a_mano(p)
        lineas = []
        buenos = []
        for b in por.get(p, []):
            pisa = sum(cod[i - ORG[p]] for i in range(b["ini"], b["fin"]))
            if pisa:
                AVISOS.append("%s %04X-%04X %s PISA CODIGO (%d bytes): no se escribe"
                              % (nombre(p), b["ini"], b["fin"], b["nombre"], pisa))
                continue
            if any(b["ini"] < f and i < b["fin"] for i, f in mano):
                AVISOS.append("%s %04X-%04X %s pisa una D a mano: no se escribe"
                              % (nombre(p), b["ini"], b["fin"], b["nombre"]))
                continue
            buenos.append(b)
        for b in junta(buenos):
            txt = b["texto"]
            if b.get("n"):
                txt += "; se solapan %d bloques:%s" % (b["n"], b["solapa"])
                print("  SOLAPE %s %04X-%04X %s:%s" % (nombre(p), b["ini"], b["fin"], b["nombre"], b["solapa"][:160]))
            txt += "; lo leen %s (%d bytes)" % (", ".join(b["lectores"][:8]), b["fin"] - b["ini"])
            lineas.append("D 0x%04X 0x%04X %s  %s" % (b["ini"], b["fin"], b["nombre"], txt))
            if b["F"]:
                lineas.append("F 0x%04X %s" % (b["ini"], b["F"]))
            total += b["fin"] - b["ini"]
        restos(p, cod, mano, junta(buenos), lineas)
        n = len([l for l in lineas if l.startswith("D ")])
        if n:
            print("%s: %d bloques, %d bytes" % (nombre(p), n,
                                                sum(int(l.split()[2], 0) - int(l.split()[1], 0)
                                                    for l in lineas if l.startswith("D "))))
        if escribe and fuentes.es_comun(p) and len(OTRAS) + 1 < len(VARIANTES):
            continue
        if escribe:
            ruta = fuentes.fichero(p, "notes")
            filas = open(ruta, encoding="utf-8").read().split("\n") if os.path.exists(ruta) else ["# notas del banco %02d" % p, ""]
            if CAB in filas:
                i, f = filas.index(CAB), filas.index(FIN)
                filas[i:f + 1] = [CAB] + lineas + [FIN]
            else:
                while filas and filas[-1] == "":
                    filas.pop()
                filas += ["", CAB] + lineas + [FIN, ""]
            open(ruta, "w", encoding="utf-8", newline="\n").write("\n".join(filas))
    print("total %d bytes" % total)
    print("sin lector: %d huecos, %d bytes" % (len(SIN_LECTOR), sum(f - i for _, i, f in SIN_LECTOR)))
    for p, i, f in SIN_LECTOR:
        print("  SIN LECTOR %s %04X-%04X %d" % (nombre(p), i, f, f - i))
    for a in AVISOS:
        print("AVISO:", a)
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
