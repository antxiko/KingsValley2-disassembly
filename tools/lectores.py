#!/usr/bin/env python3
"""Los lectores de datos de King's Valley II y sus formatos, para tools/bloques.py.

Cada recorredor hace con los bytes lo mismo que la rutina del cartucho que
lo lee, y devuelve donde acaba. Las rutinas, con su direccion en NUESTRO
listado. Lo que esta en los bancos comunes (4, 5, 6, 10, 11 y 13) vale para
los dos cartuchos; lo de los bancos propios lleva la variante.
"""
import json
import os
import re

import bloques as B
from variante import actual

# Las direcciones de los bancos propios se escriben como en el cartucho de
# MSX2; con VARIANTE=msx1 se traducen por el mapa de tools/paralelo.py
# (work/paralelo.json).
_MAPA = None


def tr(txt):
    """'p00:43CB' (MSX2) -> la direccion de esa instruccion en la variante en curso."""
    global _MAPA
    if actual() == "msx2":
        return txt
    if _MAPA is None:
        m = json.load(open(os.path.join(B.RAIZ, "work", "paralelo.json")))
        _MAPA = {v: k for k, v in m.items()}

    def uno(mm):
        k = "p%s:%s" % (mm.group(1), mm.group(2).upper())
        if int(mm.group(1)) in (4, 5, 6, 10, 11, 13):
            return k
        if k not in _MAPA:
            B.AVISOS.append("lectores: %s no tiene pareja en MSX1" % k)
            return k
        return _MAPA[k]
    return re.sub(r"\bp(\d\d):([0-9A-Fa-f]{4})\b", uno, txt)


# ------------------------------------------------------------ el sonido
#
# El motor del banco 4 (comun), con 4-5-6 puestos (p00 lo llama tras poner
# ese trio). p04:603D pide el sonido A: la cabecera de 0x6F2C + 2 x A (los
# sonidos empiezan en el 1) se copia, 18 bytes, a 0xE1CD: [canales]
# [prioridad] y una palabra por canal marcado, del bit 7 (0xE000) al 0
# (0xE165), cada canal de 0x33 bytes con IX en el (p04:6070-6158).
#
# p04:63E2 lee la partitura de cada canal: 0xFF acaba (p04:684D); de 0xD0
# para arriba es una orden (p04:688E); lo demas, una nota, que se lee segun
# el modo del canal IX+09 (p04:63F3):
#   bit 0: un byte [nota][duracion] (p04:640A);
#   bit 1: uno o dos (p04:648D): dos si IX+0D & 3 >= 2 y IX+0E no tiene los
#          bits 5 ni 6;
#   bits 2-4: un golpe de bateria: un byte cuya cifra alta elige un guion de
#          la tabla del modo y la octava IX+2C (p04:653D), que se lee aparte
#          (p04:651C) como una partitura con el bit 1 hasta su 0xFF;
#   ninguno: p04:6409 vuelve sin leer.

# Bytes de cada orden 0xE0-0xFE (con la orden); 0xE0-0xE3 se miran aparte.
LARGO_ORDEN = {0xE4: 2, 0xE5: 4, 0xE6: 3, 0xE7: 2, 0xE8: 1, 0xE9: 2, 0xEA: 2,
               0xEB: 3, 0xEC: 1, 0xED: 2, 0xEE: 2, 0xEF: 1, 0xF0: 1, 0xF1: 2,
               0xF2: 2, 0xF3: 1, 0xF4: 1, 0xF5: 1, 0xF6: 1, 0xF7: 2, 0xF8: 2,
               0xF9: 3, 0xFA: 1, 0xFB: 4, 0xFC: 4, 0xFD: 3, 0xFE: 2}
# Y de las 0xD0-0xDF (p04:6AF8, por la cifra baja): 0-5 octava, 8 dos
# cifras de 4 bits, 9 llamada (palabra), A vuelta, B repeticion hacia atras
# [veces][salto], C y E un byte; el resto, sola.
LARGO_D = {0x8: 2, 0x9: 3, 0xB: 3, 0xC: 2, 0xE: 2}


def largo_nota(modo, d, e):
    """Bytes de una nota con el estado del canal; None si el modo no lee."""
    if modo & 1:
        return 1
    if modo & 2:
        return 2 if (d & 3) >= 2 and not (e & 0x60) else 1
    if modo & 0x1C:
        return 1
    return None


def orden(x, q, modo, d, e, e2):
    """(largo, modo, d, e, e2) tras la orden x (0xD0-0xFE) con operando q."""
    if 0xD0 <= x < 0xE0:
        n = x & 0x0F
        if n == 0x0C:
            d |= 0x80                   # p04:6B7E
        elif n == 0x0D:
            d &= 0x7F                   # p04:6B88
        elif n == 0x07:
            d &= 0x9F                   # p04:6B28
        elif n == 0x08:
            d |= 0x60                   # p04:6B31
        elif n == 0x0F or n == 0x06:
            e &= 0x7F                   # p04:6B93
        return LARGO_D.get(n, 1), modo, d, e, e2
    if x <= 0xE3:
        # p04:68E1: IX+0D = orden & 3 (entero) y el byte de detras en IX+13,
        # salvo con 0xE0, que no lo lee
        return (1 if x & 3 == 0 else 2), modo, x & 3, e & ~0x40 & 0xFF, e2
    n = LARGO_ORDEN[x]
    if x == 0xE5:
        d = (d & ~8) | 4
    elif x in (0xE6, 0xE7):
        d |= 4
    elif x == 0xE8:
        d &= 0xF3
    elif x == 0xEE:
        e |= 2
    elif x == 0xEF:
        e &= ~2
    elif x == 0xF0:
        e &= 0xE2
    elif x == 0xF1:
        e |= 0x14
    elif x == 0xF2:
        e |= 0x0C
    elif x == 0xF3:
        e &= ~8
    elif x == 0xF4:
        e |= 0x40
    elif x == 0xF5:
        e |= 0x20
    elif x == 0xF6:
        e &= 0x9F
    elif x == 0xF7:
        e |= 0x80
    elif x == 0xFE:
        viejo, modo = modo, q
        if q == 1 and viejo != 1:
            e = e2                      # p04:6AE8: recupera IX+0E de IX+2A
        elif q != 1 and viejo == 1:
            e2, e = e, 0                # p04:6AD4: lo guarda y lo pone a 0
    return n, modo, d & 0xFF, e & 0xFF, e2 & 0xFF


class Partituras:
    """Recorre canales apuntando cada byte leido (y con que largo)."""

    def __init__(self, v):
        self.v = v
        self.usados = {}           # direccion -> (inicio de la instruccion, largo)
        self.dos = set()           # bytes leidos con dos largos distintos
        self.golpes = set()        # (bits del modo, octava, cifra alta)
        self.ondas = set()
        self.avisos = []
        self.memo = {}

    def apunta(self, a, n):
        for k in range(n):
            if a + k in self.usados and self.usados[a + k] != (a, n):
                self.dos.add(a + k)
            self.usados[a + k] = (a, n)

    def recorre(self, a, estado, vuelta=None, hondo=0):
        """Estados con los que se sale por la orden `vuelta` (0xFA de una
        0xF9, 0xDA de una 0xD9); vacio si acaba en 0xFF."""
        clave = (a, estado, vuelta)
        if clave in self.memo:
            return self.memo[clave]
        self.memo[clave] = set()
        salidas = set()
        pila = [(a, estado)]
        vistos = set()
        v = self.v
        while pila:
            a, (modo, d, e, e2, oct_) = pila.pop()
            while True:
                est = (modo, d, e, e2, oct_)
                if (a, est) in vistos:
                    break
                vistos.add((a, est))
                x = v(a)
                if x == 0xFF:
                    self.apunta(a, 1)
                    break
                if x in (0xFA, 0xDA):
                    self.apunta(a, 1)
                    if x == vuelta:
                        salidas.add(est)
                    else:
                        self.avisos.append("%04X: vuelta 0x%02X fuera de su llamada" % (a, x))
                    break
                if x >= 0xD0:
                    q = v(a + 1)
                    n, modo, d, e, e2 = orden(x, q, modo, d, e, e2)
                    if 0xD0 <= x <= 0xD5:
                        oct_ = x & 0x0F         # p04:6AFF: IX+16 e IX+2C
                    self.apunta(a, n)
                    est = (modo, d, e, e2, oct_)
                    if x == 0xF8:
                        self.ondas.add(q)
                    if x == 0xFD:
                        a = v.w(a + 1)
                        continue
                    if x in (0xF9, 0xD9):
                        tras = (self.recorre(v.w(a + 1), est, 0xFA if x == 0xF9 else 0xDA, hondo + 1)
                                if hondo < 8 else set())
                        for s in tras:
                            pila.append((a + 3, s))
                        break
                    if x in (0xFB, 0xFC):
                        pila.append((v.w(a + 2), est))      # vuelve atras hasta acabar
                    if x == 0xDB:
                        pila.append((a + 2 - v(a + 2), est))   # p04:6B6E: atras desde el byte del salto
                    a += n
                    continue
                n = largo_nota(modo, d, e)
                if n is None:
                    self.avisos.append("%04X: nota con el modo %02X" % (a, modo))
                    break
                if modo & 0x1C and not modo & 3:
                    self.golpes.add((modo & 0x1C, oct_, x >> 4))
                self.apunta(a, n)
                a += n
        self.memo[clave] = salidas
        return salidas


def tramos(conjunto):
    """[(ini, fin)] de un conjunto de direcciones."""
    out = []
    for x in sorted(conjunto):
        if out and out[-1][1] == x and x & 0x1FFF:
            out[-1][1] = x + 1
        else:
            out.append([x, x + 1])
    return [tuple(t) for t in out]


# Las seis tablas de guiones de bateria (p04:653D): el modo con el bit 2, 3
# o 4, y la octava IX+2C a 1 o a cualquier otra cosa.
TABLAS_GOLPES = {(0x04, 0): 0x76A0, (0x04, 1): 0x77E1, (0x08, 0): 0x77FA,
                 (0x08, 1): 0x7813, (0x10, 0): 0x782C, (0x10, 1): 0x7845}
TABLA_SONIDOS = 0x6F2C          # p04:605B: HL = 0x6F2C + 2 x A
TABLA_ONDAS = 0x7210            # p04:6A66: DE = 0x7210 + 2 x n
TABLA_ORDENES = 0x68A3          # p04:6896: 0xE0-0xFE


def palabras_hasta_lo_apuntado(v, t):
    """Palabras de la tabla t hasta la primera direccion que apunta una de
    ellas (la tabla va seguida de lo que apunta)."""
    dirs = []
    a = t
    while not dirs or a < min(d for d in dirs if d > t):
        dirs.append(v.w(a))
        a += 2
    return dirs, a


def sonido():
    v = B.Ventana((4, 5, 6))
    lec = "p04:605B"
    cab, fin = palabras_hasta_lo_apuntado(v, TABLA_SONIDOS + 2)
    cab = [None] + cab
    n_son = len(cab) - 1
    B.declara(v, TABLA_SONIDOS + 2, fin, "sonidos", "%d punteros, uno por sonido del 1 al "
              "0x%02X (A en p04:603D, tabla en 0x%04X + 2 x A): su cabecera [canales][prioridad]"
              "[una palabra por canal]. La entrada 0 serian los dos ultimos bytes del codigo de "
              "delante: no hay sonido 0" % (n_son, n_son, TABLA_SONIDOS), lec, F="w8")
    P = Partituras(v)
    de_quien = {}
    for k in range(1, n_son + 1):
        c = cab[k]
        m = v(c)
        canales = [b for b in range(7, -1, -1) if m >> b & 1]
        B.declara(v, c, c + 2 + 2 * len(canales), "cabecera_%02X" % k,
                  "cabecera del sonido 0x%02X: canales 0x%02X, prioridad 0x%02X y %d "
                  "partituras (p04:6068 copia 18 bytes a 0xE1CD)" % (k, m, v(c + 1), len(canales)),
                  lec, F=2 + 2 * len(canales))
        for j, b in enumerate(canales):
            ini = v.w(c + 2 + 2 * j)
            antes = set(P.usados)
            P.recorre(ini, (0, 0, 0, 0, 0))
            for x in set(P.usados) - antes:
                de_quien[x] = k
    # Los guiones de bateria.
    for (bit, octava), t in sorted(TABLAS_GOLPES.items()):
        dirs, fin = palabras_hasta_lo_apuntado(v, t)
        otras = sorted(x for x in TABLAS_GOLPES.values() if t < x < fin)
        if otras:
            fin = otras[0]
            dirs = dirs[:(fin - t) // 2]
        B.declara(v, t, fin, "golpes_%04X" % t, "%d punteros a los guiones de bateria del modo con "
                  "el bit %d y la octava %s (p04:653D; la cifra alta de la nota elige uno)" % (
                      len(dirs), bit.bit_length() - 1, "1" if octava else "distinta de 1"),
                  "p04:6517", F="w8")
        for n, g in enumerate(dirs):
            antes = set(P.usados)
            P.recorre(g, (0x02, 0, 0, 0, 0))
            for x in set(P.usados) - antes:
                de_quien[x] = "golpe %d de 0x%04X" % (n, t)
    quien = {}
    for x in P.usados:
        quien.setdefault(x, set()).add(de_quien[x])
    for ini, fin in tramos(set(P.usados)):
        ks = sorted(set().union(*(quien[x] for x in range(ini, fin))), key=str)
        s = ", ".join("0x%02X" % x if isinstance(x, int) else x for x in ks[:6])
        nd = len([x for x in range(ini, fin) if x in P.dos])
        B.declara(v, ini, fin, "partitura_%04X" % ini,
                  "partitura (p04:63E2: ordenes 0xD0-0xFF y notas) de %s%s%s" % (
                      "los sonidos " if isinstance(ks[0], int) else "", s + (" y otros" if len(ks) > 6 else ""),
                      "; %d bytes los leen dos canales con distinto largo de nota" % nd
                      if nd else ""),
                  "p04:63E2", F=16)
    ptr_ondas, fin = palabras_hasta_lo_apuntado(v, TABLA_ONDAS)
    tope = min(TABLAS_GOLPES.values())
    n_buenas = len([o for o in ptr_ondas if o < tope])
    B.declara(v, TABLA_ONDAS, fin, "ondas", "%d punteros a las formas de onda del SCC (orden 0xF8 de "
              "la partitura, p04:6A66: 0x%04X + 2 x n); los %d primeros apuntan a las de detras, los "
              "%d ultimos a 0x%04X, la tabla de golpes" % (len(ptr_ondas), TABLA_ONDAS, n_buenas,
                                                         len(ptr_ondas) - n_buenas, tope),
              "p04:6A6F", F="w8")
    # Las ultimas entradas apuntan a la tabla de golpes que va detras de las
    # ondas: no son ondas (ninguna partitura las pide).
    tope = min(TABLAS_GOLPES.values())
    no_ondas = [n for n, o in enumerate(ptr_ondas) if o >= tope]
    if no_ondas:
        B.AVISOS.append("sonido: las entradas %d-%d de las ondas apuntan a 0x%04X (golpes)%s" % (
            no_ondas[0], no_ondas[-1], tope,
            "; las PIDE una partitura" if set(no_ondas) & P.ondas else ""))
    usadas = {ptr_ondas[n] for n in P.ondas if n < len(ptr_ondas)}
    bytes_ondas = {o + k for o in ptr_ondas if o < tope for k in range(0x20)}
    for ini, fin in tramos(bytes_ondas):
        aqui = sorted({o for o in ptr_ondas if ini <= o < fin})
        sin = [o for o in aqui if o not in usadas]
        B.declara(v, ini, fin, "ondas_%04X" % ini,
                  "%d formas de onda del SCC de 32 muestras con signo, que empiezan en %s%s%s" % (
                      len(aqui), ", ".join("0x%04X" % o for o in aqui),
                      "; se solapan: una onda empieza dentro de otra" if fin - ini < 0x20 * len(aqui) else "",
                      "; ninguna partitura pide %s" % ", ".join("0x%04X" % o for o in sin) if sin else ""),
                  "p04:6A6F", F=16)
    B.declara(v, TABLA_ORDENES, TABLA_ORDENES + 62, "ordenes", "31 destinos, uno por orden de la "
              "partitura de 0xE0 a 0xFE (p04:6896: HL = 0x%04X + 2 x (orden & 0x1F); jp (hl) en "
              "p04:68A2); el 0xFF no llega aqui (lo mira antes p04:63E3)" % TABLA_ORDENES,
              "p04:68A2", F="w8")
    B.declara(v, 0x6480, 0x648D, "notas_psg", "13 bytes: el divisor de cada nota (de do a do) que "
              "p04:6434 lee con la nota < 12 (p04:6429) y dobla por la octava (p04:6450); el "
              "13 no lo lee nadie", "p04:6434", F=13)
    B.declara(v, 0x617C, 0x61AA, "canal_nuevo", "46 bytes con los que p04:6173 llena un canal "
              "desde IX+05 al empezar un sonido", "p04:6179", F=16)
    for c in P.avisos:
        B.AVISOS.append("sonido: " + c)
    print("sonido: %d sonidos, %d bytes de partitura, golpes %d, ondas %s, %d leidos de dos maneras"
          % (n_son, len(P.usados), len(P.golpes), sorted(P.ondas), len(P.dos)))
    return P


# ------------------------------------------------------------ las fases
#
# Todo lo de cada una de las 60 fases. Unas tablas se leen con la fase
# (0xE242, de 1 a 60: la entrada 0 no la lee nadie) y otras con fase - 1.

FASES = 60


def tabla_fases(v, t, base, nom, texto, lector, recorre, que):
    """Una tabla de palabras por fase y lo que apunta cada una."""
    n = FASES + base
    # con la fase de 1 a 60, la entrada 0 no la lee nadie: sus dos bytes son
    # los ultimos de lo que va delante (el final de la ultima lista o de la
    # tabla anterior), y la tabla se declara desde la entrada 1
    B.declara(v, t + 2 * base, t + 2 * n, nom, "%d punteros, uno por fase%s: %s" % (
        FASES, " (se lee con la fase, de 1 a 60, desde 0x%04X: la entrada 0 no la lee nadie y sus "
        "dos bytes son lo ultimo de lo que va delante)" % t if base else
        " (se lee con la fase - 1)", texto), lector, F="w8")
    de = {}
    for k in range(base, n):
        de.setdefault(v.w(t + 2 * k), []).append(k + 1 - base)
    for a, fs in de.items():
        B.declara(v, a, recorre(v, a), "%s_%02d" % (que, fs[0]), "%s de la fase%s %s" % (
            texto[0].upper() + texto[1:].split(":")[0].split(" (")[0], "s" if len(fs) > 1 else "",
            ", ".join(str(f) for f in fs)), lector, F=16)
    return de


def hasta_cero(paso):
    """Fichas de `paso` bytes hasta un byte 0 (incluido)."""
    def r(v, a):
        while v(a) != 0:
            a += paso
        return a + 1
    return r


def hasta_ff(paso):
    def r(v, a):
        while v(a) != 0xFF:
            a += paso
        return a + 1
    return r


def rachas_mapa(v, a):
    """p00:43DD: [veces (6 bits) | valor (2 bits)] hasta un 0."""
    while v(a):
        a += 1
    return a + 1


def lista_columnas(v, a):
    """p00:4434: [posicion de 2 bytes], 0xFF pasa a la pantalla siguiente, 0x00 acaba."""
    while True:
        x = v(a)
        if x == 0:
            return a + 1
        a += 1 if x == 0xFF else 2


def fases():
    v = B.Ventana((10, 11, 12))
    tabla_fases(v, 0x6000, 0, "mapas", "el mapa de la fase en rachas de casillas de 2 bits "
                "([veces | valor << 6], 0 acaba), que se desempaqueta en 0xE900",
                tr("p00:43DD"), rachas_mapa, "mapa")
    tabla_fases(v, 0x6078, 0, "casillas_6078", "las columnas que se marcan en el mapa sin "
                "apuntarlas ([posicion de 2 bytes], 0xFF pantalla siguiente, 0 acaba)",
                tr("p00:4434"), lista_columnas, "casillas")
    tabla_fases(v, 0x60F0, 0, "columnas_60f0", "las columnas que se marcan en el mapa y se "
                "apuntan en 0xE7C0 (mismo formato)", tr("p00:4434"), lista_columnas, "columnas")
    w = B.Ventana((1, 2, 13))
    tabla_fases(w, 0xAAE0, 1, "cosas", "las cosas de la fase (puertas, bloques, suelos): fichas "
                "de 4 bytes [tipo | pantalla][y][x][alto | variante], 0 acaba",
                tr("p01:6343"), hasta_cero(4), "cosas")
    tabla_fases(w, 0xA75D, 1, "joyas", "lo que hay que coger para abrir la salida: fichas de 3 "
                "bytes [tipo | pantalla][y][x], 0 acaba", tr("p01:6502"), hasta_cero(3), "coger")
    B.declara(w, 0xAB5A, 0xAB5A + 8 * FASES, "rejillas", "la rejilla de pantallas de cada fase: "
              "8 bytes por fase (con fase - 1), un bit por casilla de una rejilla de 8 de ancho",
              tr("p00:5DD2"), F=8)
    for t, lado in ((0xADCF, "arriba"), (0xAE47, "abajo"), (0xAEBF, "la izquierda"),
                    (0xAF37, "la derecha")):
        tabla_fases(w, t, 1, "saltos_%04x" % t, "los saltos al salir por %s (parejas [de][a], "
                    "0xFF acaba)" % lado, tr("p00:5EE5"), hasta_ff(2), "saltos_%04x" % t)
    tabla_fases(w, 0xAFB1, 0, "herramientas", "las cosas que se cogen y se llevan: fichas de 3 "
                "bytes [pantalla | tipo][y][x], 0xFF acaba", tr("p02:97D4"), hasta_ff(3),
                "herramientas")
    tabla_fases(w, 0xB7CD, 1, "salidas_enemigos", "los sitios de los que salen los enemigos: "
                "fichas de 4 bytes [tipo] y 3 mas, 0 acaba", tr("p01:6768"), hasta_cero(4),
                "enemigos")
    B.declara(w, 0xB847, 0xB847 + 3 * FASES, "inicio", "donde empieza el personaje: 3 bytes "
              "por fase [y][x][pantalla], en 0xB844 + 3 x fase (la entrada 0 son los ultimos bytes "
              "de la tabla de delante)", tr("p02:92B9"), F=3)
    B.declara(w, 0xB8FB, 0xB8FB + 3 * FASES, "salida", "la salida de cada fase: 3 bytes "
              "[y][x][pantalla en los 3 bits altos], en 0xB8F8 + 3 x fase", tr("p02:8FA5"), F=3)


# ------------------------------------------------------- graficos de MSX2
#
# Los cargadores del banco 0 del cartucho de MSX2 (SCREEN 5):
#   p00:54A0  lista de graficos: fichas de 5 bytes [modo][sitio][n][puntero],
#             0xFF acaba. El modo: bits 0-2 = 1, 2 o 3 bits por punto (0-1, 2-3,
#             4-5; impar = en espejo) y bits 3-7 = la tabla de colores (palabra
#             modo / 8 de la tabla que le llega en DE), de 2, 4 u 8 bytes. n
#             caracteres de 8, 16 o 24 bytes.
#   p00:4F1C  paleta: [color][D][E], 0xFF acaba.
#   p00:4E27  rachas a la VRAM: [n < 0x80] repite el byte siguiente n veces;
#             [0x80 + n] copia n bytes; [0x80] trae otro destino (2 bytes); 0 acaba.
#   p00:576D  dibujo de caracteres: caracteres, 0xFE [dx] fila nueva, 0xFF acaba.
#   p00:573B  rectangulo: B filas de C caracteres.
#   p00:514C  fuente: n caracteres de 8 bytes (1 bit por punto).
#   p00:51D0  letrero: [D][E] y caracteres, 0xFE [D][E] otro sitio, 0xFF acaba.

BYTES_CAR = {0: 8, 1: 8, 2: 16, 3: 16, 4: 24, 5: 24}
BYTES_COL = {0: 2, 1: 2, 2: 4, 3: 4, 4: 8, 5: 8}


def lista_graficos(v, a):
    """[(modo, n, puntero)] y el final, como p00:54A0."""
    fichas = []
    while v(a) != 0xFF:
        fichas.append((v(a), v(a + 2), v.w(a + 3)))
        a += 5
    return fichas, a + 1


def graficos(v, lista, colores, nom, que, lector):
    """Una lista de p00:54A0 y los caracteres que apunta; devuelve
    {grupo de colores: {bytes de colores}}."""
    fichas, fin = lista_graficos(v, lista)
    B.declara(v, lista, fin, nom, "%d fichas de graficos (%s) de 5 bytes [modo][sitio en la "
              "pagina 1][cuantos][puntero], 0xFF acaba: caracteres de 1, 2 o 3 bits por punto que "
              "se pasan a 4 bits con la tabla de colores de 0x%04X" % (len(fichas), que, colores),
              lector, F=5)
    usos = {}
    for modo, n, ptr in fichas:
        bpp = modo & 7
        B.declara(v, ptr, ptr + n * BYTES_CAR[bpp], "car_%04X" % ptr, "%d caracteres de %d bit%s "
                  "por punto (%d bytes cada uno)%s, de la lista 0x%04X" % (
                      n, bpp // 2 + 1, "s" if bpp > 1 else "", BYTES_CAR[bpp],
                      ", en espejo" if bpp & 1 else "", lista), lector, F=8)
        usos.setdefault(modo >> 3, set()).add(BYTES_COL[bpp])
    return usos


def colores_de(v, t, usos, nom, lector):
    """La tabla de colores: una palabra por grupo y sus 2/4/8 colores."""
    n = max(usos) + 1
    B.declara(v, t, t + 2 * n, nom, "%d punteros a las tablas de colores de los graficos (el modo "
              "/ 8 de la lista elige una)" % n, lector, F="w8")
    for k in sorted(usos):
        a = v.w(t + 2 * k)
        m = max(usos[k])
        B.declara(v, a, a + m, "col_%04X" % a, "%d colores (de 4 bits) para los graficos de %d bits "
                  "por punto" % (m, {2: 1, 4: 2, 8: 3}[m]), lector, F=m)


def paleta(v, a, nom, texto, lector):
    ini = a
    while v(a) != 0xFF:
        a += 3
    B.declara(v, ini, a + 1, nom, "paleta %s: %d colores [color][rojo y azul][verde], 0xFF acaba"
              % (texto, (a - ini) // 3), lector, F=3)


def rachas_vram(v, a):
    while True:
        n = v(a)
        if n == 0:
            return a + 1
        if n < 0x80:
            a += 2
        elif n == 0x80:
            a += 3
        else:
            a += 1 + (n & 0x7F)


def rachas_destino(v, a, nom, texto, lector):
    """Rachas con el destino delante (p00:4E1F en MSX2, p00:4E20 en MSX1)."""
    B.declara(v, a, rachas_vram(v, a + 2), nom, "rachas a la VRAM (%s) con su destino delante "
              "(2 bytes)" % texto, lector, F=16)


def rachas(v, a, nom, texto, lector):
    B.declara(v, a, rachas_vram(v, a), nom, "rachas a la VRAM (%s): [n < 0x80] repite el byte "
              "siguiente, [0x80 + n] copia n, [0x80] otro destino, 0 acaba" % texto, lector, F=16)


def dibujo_fin(v, a):
    while True:
        x = v(a)
        if x == 0xFF:
            return a + 1
        a += 2 if x == 0xFE else 1


def dibujo(v, a, nom, texto, lector):
    B.declara(v, a, dibujo_fin(v, a), nom, "dibujo de caracteres (%s): 0xFE [dx] baja una fila, "
              "0xFF acaba" % texto, lector, F=16)


def letrero_fin(v, a):
    a += 2
    while True:
        x = v(a)
        if x == 0xFF:
            return a + 1
        a += 3 if x == 0xFE else 1


def letrero(v, a, nom, texto, lector):
    B.declara(v, a, letrero_fin(v, a), nom, "letrero (%s): [x][y] y caracteres, 0xFE [x][y] otro "
              "sitio, 0xFF acaba" % texto, lector, F=16)


def graficos_msx2():
    if actual() != "msx2":
        return
    # bancos 7-8-9 (p00:41AB)
    v = B.Ventana((7, 8, 9))
    colores_de(v, 0x6000, graficos(v, 0x602A, 0x6000, "graf_602A", "comunes a las piramides",
                                   tr("p00:54A0")), "colores_6000", tr("p00:54AC"))
    B.declara(v, 0x6065 + 2, 0x6065 + 14, "colores_piramides", "6 punteros, uno por piramide "
              "(0xE241, desde 0x6065): su tabla de colores", tr("p00:5647"), F="w8")
    B.declara(v, 0x6177 + 2, 0x6177 + 14, "graficos_piramides", "6 punteros, uno por piramide "
              "(desde 0x6177): su lista de graficos", tr("p00:564F"), F="w8")
    for k in range(1, 7):
        t = v.w(0x6065 + 2 * k)
        colores_de(v, t, graficos(v, v.w(0x6177 + 2 * k), t, "graf_pir%d" % k, "piramide %d" % k,
                                  tr("p00:54A0")), "colores_pir%d" % k, tr("p00:54AC"))
    usos = {}
    for t, que in ((0x902E, "la entrada"), (0x9043, "la entrada"), (0x9063, "el final"),
                   (0x9069, "el final"), (0x9074, "el titulo")):
        for g, ms in graficos(v, t, 0x8FFC, "graf_%04X" % t, que, tr("p00:54A0")).items():
            usos.setdefault(g, set()).update(ms)
    colores_de(v, 0x8FFC, usos, "colores_8FFC", tr("p00:54AC"))
    colores_de(v, 0xB7C7, graficos(v, 0xB7DF, 0xB7C7, "graf_B7DF", "las musicas", tr("p00:54A0")),
               "colores_B7C7", tr("p00:54AC"))
    paleta(v, 0xBB8B, "paleta_BB8B", "de la presentacion", tr("p00:5B73"))
    dibujo(v, 0xBB9B, "dibujo_BB9B", "la presentacion", tr("p00:576E"))
    for a, n in ((0xBBDC, 0x0D), (0xBC44, 0x0D), (0xBCAC, 0x1A)):
        B.declara(v, a, a + 8 * n, "fuente_%04X" % a, "%d caracteres de 1 bit por punto de la "
                  "presentacion" % n, tr("p00:5155"), F=8)
    # bancos 14-15 (p00:41CC)
    v = B.Ventana((1, 14, 15))
    colores_de(v, 0xB116, graficos(v, 0xB120, 0xB116, "graf_B120", "el titulo", tr("p00:54A0")),
               "colores_B116", tr("p00:54AC"))
    for a, que, lec in ((0xA7CE, "del titulo", "p00:560E"), (0xA7FF, "de la entrada", "p00:5B58"),
                        (0xA8BB, "del final", "p00:5B64"),
                        (0xA870, "de la piramide acabada", "p01:6F93"),
                        (0xBA78, "de las musicas", "p00:57C1"),
                        (0xB95D, "comun de las piramides", "p00:5681")):
        paleta(v, a, "paleta_%04X" % a, que, tr(lec))
    for t in (0xB97A, 0xB9F8):
        B.declara(v, t + 2, t + 14, "paletas_%04X" % t, "6 punteros, uno por piramide (0xE241, "
                  "desde 0x%04X): la paleta de sus fases %s" % (
                      t, "1-2, 5-6 y 9-10" if t == 0xB97A else "3-4 y 7-8"), tr("p00:5672"),
                  F="w8")
        for k in range(1, 7):
            paleta(v, v.w(t + 2 * k), "paleta_%04X" % v.w(t + 2 * k), "de la piramide %d" % k,
                   tr("p00:5675"))
    for a, que, lec in ((0xABB9, "dibujos de los sprites", "p00:568D"),
                        (0xBA9A, "dibujos de los sprites", "p00:57D3"),
                        (0xAF21, "sprites", "p00:5A92"), (0xA9FB, "sprites", "p00:5A9B"),
                        (0xAB59, "sprites", "p00:5AAB"), (0xAE08, "sprites", "p00:5AC6"),
                        (0xA9F6, "sprites", "p00:5ACF"), (0xAA00, "sprites de la pausa", "p00:5946"),
                        (0x953D, "sprites del personaje muerto", "p00:592E"),
                        (0x97A1, "sprites", "p00:595B"), (0x86D4, "sprites", "p00:5AB1"),
                        (0x8FD9, "sprites", "p00:5ABA")):
        rachas(v, a, "rachas_%04X" % a, que, tr(lec))
    for a, b, c, lec in ((0xA358, 12, 12, "p00:59B2"), (0xA2C8, 12, 12, "p00:59C1"),
                         (0xA702, 12, 12, "p00:59D0"), (0xA5A6, 2, 12, "p00:5A1A"),
                         (0xA5BE, 4, 12, "p00:5A2C"), (0xA5EE, 6, 14, "p00:5A3E"),
                         (0xBC05, 13, 26, "p00:579D")):
        B.declara(v, a, a + b * c, "rect_%04X" % a, "%d x %d caracteres (p00:573B: B filas de C)"
                  % (b, c), tr(lec), F=c)
    for a, lec in ((0xB8DB, "p00:5628"), (0xA6E0, "p00:5A50"), (0xA3E8, "p00:5A5F"),
                   (0xA4C7, "p00:5A68"), (0xA642, "p00:5A77"), (0xA6B1, "p00:5A80")):
        dibujo(v, a, "dibujo_%04X" % a, "las secuencias", tr(lec))
    B.declara(v, 0xBB05, 0xBC05, "sprites_titulo", "256 bytes de dibujos de sprites a 0xF800 "
              "(8 sprites de 16 x 16)", tr("p00:5608"), F=16)
    B.declara(v, 0x8000, 0x800C, "grabados", "6 punteros, uno por piramide (0xE241, desde "
              "0x7FFE): los grabados del fondo", tr("p00:44F8"), F="w8")
    for k in range(6):
        a = v.w(0x8000 + 2 * k)
        B.declara(v, a, a + 0x40, "grabado_%d" % (k + 1), "los grabados de la piramide %d: dos de "
                  "4 x 8 caracteres (fases impares y pares)" % (k + 1), tr("p00:4515"), F=8)
    B.declara(v, 0xBD52 + 5, 0xBD52 + 35, "colores_vivos", "5 bytes por piramide (desde "
              "0xBD52): el color de la paleta, cuantos pasos, cada cuantos cuadros y sus colores",
              tr("p00:5C24"), F=5)
    for k in range(1, 7):
        o = 0xBD52 + 5 * k
        a, n = v.w(o + 3), v(o + 1)
        B.declara(v, a, a + 2 * n, "vivos_%d" % k, "los %d pasos del color que cambia solo en la "
                  "piramide %d" % (n, k), tr("p00:5C79"), F=2)
    # banco 12 (p00:41B5 o 10-11-12): las fuentes y un dibujo
    v12 = B.Ventana((10, 11, 12))
    B.declara(v12, 0xB1D6, 0xB1D6 + 128, "dibujo_16x16", "un dibujo de 16 x 16 pixeles de 4 bits "
              "(128 bytes, orden HMMC)", tr("p00:56D6"), F=8)
    B.declara(v12, 0xAFDD, 0xAFDD + 8 * 0x35, "fuente_AFDD", "53 caracteres de 1 bit por punto: la "
              "fuente", tr("p00:5155"), F=8)
    B.declara(v12, 0xAA29, 0xAA29 + 8 * 0x2A, "fuente_AA29", "42 caracteres de 1 bit por punto: la "
              "fuente del marcador (0xAA29 los 12 primeros, 0xAA89 los 30 siguientes)",
              tr("p00:5155"), F=8)
    B.declara(v12, 0xAB79, 0xAB79 + 8 * 5, "fuente_AB79", "5 caracteres de 1 bit por punto",
              tr("p00:5155"), F=8)
    B.declara(v12, 0xABC1, 0xABC1 + 64, "car_ABC1", "2 caracteres ya de 4 bits (32 bytes cada uno)",
              tr("p00:51A2"), F=16)
    B.declara(v, 0xBDAF, 0xBDAF + 12, "vivos_4b", "los 6 pasos del otro color que cambia en la "
              "piramide 4", tr("p00:5C79"), F=2)


def lista_fichas_ff(v, a, paso):
    while v(a) != 0xFF:
        a += paso
    return a + 1


def lista_n(v, t, n, nom, texto, lector, recorre, que, base=0, F="w8"):
    """Una tabla de n palabras (desde la entrada base) y lo que apunta cada una."""
    B.declara(v, t + 2 * base, t + 2 * n, nom, texto, lector, F=F)
    vistos = set()
    for k in range(base, n):
        a = v.w(t + 2 * k)
        if a in vistos:
            continue
        vistos.add(a)
        recorre(v, a, "%s_%d" % (que, k), k)


def graficos_msx2_resto():
    if actual() != "msx2":
        return
    v = B.Ventana((1, 14, 15))
    # los adornos de cada piramide (p00:4638): 8 por piramide
    B.declara(v, 0x800C, 0x800C + 2 * 48, "adornos", "48 punteros: 8 adornos por piramide "
              "((piramide - 1) x 8 + tipo); el tipo dice su tamano", tr("p00:4647"), F="w8")
    for k in range(48):
        a, tipo = v.w(0x800C + 2 * k), k & 7
        n = (16, 8, 8, 6)[tipo >> 1]
        B.declara(v, a, a + n, "adorno_%d_%d" % (k // 8 + 1, tipo), "los caracteres del adorno %d "
                  "de la piramide %d (%s)" % (tipo, k // 8 + 1, ("4 x 4", "4 x 2", "2 x 4",
                  "largo: principio, medio y final")[tipo >> 1]), tr("p00:4663"), F=n)

    def adornos_fase(v_, a, nom, k):
        B.declara(v_, a, lista_fichas_ff(v_, a, 3), nom, "los adornos de la fase %d: fichas de 3 "
                  "bytes [x | tipo][y | pantalla][largo], 0xFF acaba" % k, tr("p00:4614"), F=3)
    lista_n(v, 0x806A, 61, "adornos_fases", "60 punteros, uno por fase (0xE242, desde 0x806A): "
            "los adornos de cada pantalla", tr("p00:4611"), adornos_fase, "adornos_fase", base=1)

    def postura(v_, a, nom, k):
        fin = lista_fichas_ff(v_, a, 4)
        B.declara(v_, a, fin, nom, "los sprites del personaje con lo que lleva %d: fichas de 4 "
                  "bytes (con la cifra baja del primero 0: [destino][rachas]; si no, [n | destino]"
                  "[de]: n bloques en espejo), 0xFF acaba" % k, tr("p00:58F6"), F=4)
        x = a
        while v_(x) != 0xFF:
            if v_(x) & 0x0F == 0:
                r = v_.w(x + 2)
                rachas(v_, r, "rachas_%04X" % r, "sprites del personaje", tr("p00:590A"))
            x += 4
    lista_n(v, 0x858B, 7, "posturas", "7 punteros, uno por lo que lleva el personaje (0xE287): "
            "sus sprites", tr("p00:58EE"), postura, "postura")
    B.declara(v, 0x869C, 0x86B8, "columnas_postura", "14 posiciones de la pagina 1 (una por "
              "direccion 0xE285) de donde se copia el dibujo del personaje", tr("p00:5891"), F=2)
    B.declara(v, 0x86B8, 0x86D4, "columnas_postura2", "otras 14, para la segunda copia",
              tr("p00:58AB"), F=2)
    # los sprites (p00:5508 y p00:553D)
    a = 0x98C9
    while v(a):
        n, ptr = v(a), v.w(a + 2)
        B.declara(v, ptr, ptr + 32 * n, "spr_%04X" % ptr, "%d sprites de 16 x 16 (32 bytes cada "
                  "uno) que se copian al dibujo %d" % (n, v(a + 1)), tr("p00:5530"), F=16)
        a += 4
    B.declara(v, 0x98C9, a + 1, "lista_sprites", "lista de sprites: [n][dibujo][puntero], un 0 "
              "acaba", tr("p00:5508"), F=4)
    a = 0x98EA
    while v(a):
        a += 4
    B.declara(v, 0x98EA, a + 1, "lista_vueltas", "sprites que se copian dados la vuelta: [tipo]"
              "[n][de][a] (1 de arriba abajo, 2 de izquierda a derecha), un 0 acaba",
              tr("p00:553D"), F=4)
    for k in (1, 2):
        letrero(v, v.w(0x9D37 + 2 * (k - 1)), "letrero_sitio%d" % k, "del sitio escondido %d" % k,
                tr("p00:51D6"))
    B.declara(v, 0x9D37, 0x9D3B, "letreros_sitios", "2 punteros: el letrero de cada minijuego "
              "escondido", tr("p00:4BA5"), F="w8")
    # las columnas de 27 caracteres (p00:59ED): de la 0 a la 0x0F + 31
    B.declara(v, 0x9D58, 0x9D58 + 2 * 48, "columnas_27", "48 punteros a columnas de 27 caracteres "
              "(32 seguidas desde la que se pide: 0, 4 o 0x0F)", tr("p00:59FF"), F="w8")
    for k in range(48):
        a = v.w(0x9D58 + 2 * k)
        B.declara(v, a, a + 27, "col27_%02d" % k, "columna de 27 caracteres", tr("p00:5742"),
                  F=27)
    # los fundidos de paleta (p01:77D7)
    B.declara(v, 0xA792, 0xA792 + 60, "fundidos", "12 fundidos de 5 bytes [colores de partida]"
              "[colores de llegada][cada cuantos cuadros]", tr("p01:77F4"), F=5)
    for k in range(12):
        for o in (0, 2):
            a = v.w(0xA792 + 5 * k + o)
            B.declara(v, a, a + 32, "pal_%04X" % a, "16 colores de paleta (2 bytes cada uno)",
                      tr("p01:77FE"), F=2)

# El final del banco 12 (p00:41B5): los sitios escondidos, el puzle, la seleccion
# de musicas, las estrellas del final y la cinta. Lo mismo en los dos cartuchos,
# 4 bytes antes en MSX1 hasta el puzle y luego mas (el codigo de alrededor cambia);
# cada direccion de MSX1 es la del mismo contenido, byte a byte, que en MSX2.
FIN12 = {
    "msx2": dict(letreros=(0xB585, 0xB5B8, 0xB5C7, 0xB8AF, 0xB8BE, 0xBE67, 0xBE6E, 0xBF0E, 0xBF94),
                 sitio=0xB4F8, sitios=0xB548, puzles=0xB5E0, piezas=0xB64C, flecha=0xB9FA,
                 estrellas=(0xBD97, 0xBDB7)),
    "msx1": dict(letreros=(0xB581, 0xB5B4, 0xB5C3, 0xB8AB, 0xB8BA, 0xBE04, 0xBE0B, 0xBEAB, 0xBF31),
                 sitio=0xB4F8, sitios=0xB544, puzles=0xB5DC, piezas=0xB648, flecha=0xB9DE,
                 estrellas=(0xBD72, 0xBD92)),
}


def banco12_fin():
    d = FIN12[actual()]
    v12 = B.Ventana((1, 2, 12))
    for a, (que, lec) in zip(d["letreros"], (
            ("de las musicas", "p12:B935"), ("del puzle", "p12:B746"),
            ("del puzle resuelto", "p12:B89A"), ("del puzle", "p12:B6E9"),
            ("del puzle", "p12:B6FE"), ("de la cinta", "p12:BE78"), ("de la cinta", "p12:BEB6"),
            ("de error de cinta", "p12:BF05"), ("de error de cinta", "p12:BF8B"))):
        letrero(v12, a, "letrero_%04X" % a, que, tr(lec))
    B.declara(v12, d["sitio"], d["sitio"] + 4, "sitio_dibujo", "2 x 2 caracteres del sitio "
              "escondido", tr("p12:B4F5"), F=4)
    a = d["sitios"]
    while v12(a):
        a += 5
    B.declara(v12, d["sitios"], a + 1, "sitios_escondidos", "%d sitios escondidos de 5 bytes "
              "[fase][tipo (1 musicas, 2 puzle)][pantalla][y][x], un 0 acaba"
              % ((a - d["sitios"]) // 5), tr("p12:B403"), F=5)
    B.declara(v12, d["puzles"], d["puzles"] + 8, "puzles", "4 punteros a los puzles revueltos",
              tr("p12:B709"), F="w8")
    for k in range(4):
        a = v12.w(d["puzles"] + 2 * k)
        B.declara(v12, a, a + 25, "puzle_%d" % k, "un puzle revuelto: las 25 casillas (0 el hueco)",
                  tr("p12:B70F"), F=5)
    B.declara(v12, d["piezas"], d["piezas"] + 4 * 25, "piezas", "los 2 x 2 caracteres de cada "
              "pieza del puzle (0 el hueco)", tr("p12:B7F4"), F=4)
    B.declara(v12, d["flecha"], d["flecha"] + 19, "musicas_flecha", "19 bytes: donde va la flecha "
              "de cada musica", tr("p12:B9CB"), F=19)
    x, y = d["estrellas"]
    B.declara(v12, x, x + 32, "estrellas_x", "16 velocidades en x de las estrellas",
              tr("p12:BD8A"), F="w8")
    B.declara(v12, y, y + 32, "estrellas_y", "16 velocidades en y de las estrellas",
              tr("p12:BD78"), F="w8")
    if actual() == "msx2":
        # en MSX1 los colores de los sprites van de otra manera (un color por sprite)
        B.declara(v12, 0xB913, 0xB917, "colores_mano", "los colores de los 4 sprites de la mano "
                  "del puzle", tr("p12:B906"), F=4)
        B.declara(v12, 0xBA0D, 0xBA11, "colores_flecha", "los colores de los 4 sprites de la "
                  "flecha", tr("p12:B9ED"), F=4)


def letrero_sin_sitio_fin(v, a):
    while True:
        x = v(a)
        if x == 0xFF:
            return a + 1
        a += 3 if x == 0xFE else 1


def banco13_resto():
    w = B.Ventana((1, 2, 13))
    B.declara(w, 0xB9AF, 0xB9CF, "marcas_salida", "16 punteros (desde 0xB9AD, por cuantas cosas "
              "hay que coger, de 1 a 16): donde van las marcas de lo que falta en la salida",
              tr("p02:9053"), F="w8")
    for n in range(1, 17):
        a = w.w(0xB9AD + 2 * n)
        B.declara(w, a, a + n, "marcas_%d" % n, "%d marcas: un byte cada una (2 bits de x y 2 de "
                  "y dentro de la salida)" % n, tr("p02:905B"), F=16)
    B.declara(w, 0xBA57, 0xBA61, "pasos_piramide", "5 punteros, uno por piramide acabada (de la 1 "
              "a la 5): los pasos del personaje por el dibujo", tr("p01:718C"), F="w8")
    for k in range(5):
        a = w.w(0xBA57 + 2 * k)
        B.declara(w, a, lista_fichas_ff(w, a, 2), "pasos_%d" % (k + 1), "los pasos de la piramide "
                  "%d: parejas [paso][direccion], 0xFF acaba" % (k + 1), tr("p01:7195"), F=2)
    B.declara(w, 0xBB38, 0xBB3C, "fondos_editor", "2 punteros: los fondos del editor",
              tr("p02:8875"), F="w8")
    for k in range(2):
        a = w.w(0xBB38 + 2 * k)
        B.declara(w, a, a + 0x60, "fondo_editor_%d" % k, "un fondo del editor: 96 bytes, un bit por "
                  "caracter (32 x 24)", tr("p02:8889"), F=4)
    rachas(w, 0xBBFC, "rachas_BBFC", "sprites del editor", tr("p01:7AAF"))
    B.declara(w, 0xBC44, 0xBC54, "fuente_BC44", "2 caracteres de 1 bit por punto (el menu del "
              "editor)", tr("p00:5155"), F=8)
    B.declara(w, 0xBCBB, 0xBCC1, "submenus", "3 punteros: los submenus de las opciones 4, 5 y 6 "
              "del editor", tr("p01:7C19"), F="w8")
    for k in range(3):
        a = w.w(0xBCBB + 2 * k)
        B.declara(w, a, a + 1, "submenu_%d" % (k + 4), "cuantas opciones tiene el submenu",
                  tr("p01:7C1C"), F=1)
        letrero(w, a + 1, "letrero_%04X" % (a + 1), "del submenu", tr("p00:51D6"))
    con = (0xBC54, 0xBD6D, 0xBD86, 0xBDB9, 0xBDE9, 0xBE06, 0xBE14, 0xBE44, 0xBE4C, 0xBE54, 0xBE5C,
           0xBE6A, 0xBE77, 0xBE82, 0xBE91, 0xBEAD, 0xBEBE)
    sin = (0xBDD5, 0xBDDF, 0xBE26, 0xBE30, 0xBE3A, 0xBE46, 0xBE4E, 0xBE56)
    for a in con:
        letrero(w, a, "letrero_%04X" % a, "de los menus", tr("p00:51D6"))
    for a in sin:
        B.declara(w, a, letrero_sin_sitio_fin(w, a), "letrero_%04X" % a, "letrero de los menus sin "
                  "sitio (lo pone quien llama): caracteres, 0xFF acaba", tr("p00:51DA"), F=16)
    B.declara(w, 0xBECF, 0xBEED, "dibujos_enemigos1", "30 dibujos de sprite de los enemigos en "
              "MSX1, uno por paso (IX+11)", tr("p01:66D7"), F=10)
    B.declara(w, 0xBEED, 0xBF29, "dibujos_enemigos2", "30 parejas de dibujos de sprite de los "
              "enemigos en MSX2 (dos sprites por enemigo)", tr("p01:6692"), F=10)
    rachas(w, 0xBF29, "rachas_BF29", "sprites del plano", tr("p01:6099"))
    B.declara(w, 0xBF36, 0xBF36 + 8 * 0x12, "fuente_BF36", "18 caracteres de 1 bit por punto "
              "(los letreros del plano)", tr("p00:5155"), F=8)
    B.declara(w, 0xBFC6, 0xBFC6 + 8 * 6, "fuente_BFC6", "6 caracteres de 1 bit por punto",
              tr("p00:5155"), F=8)


# ------------------------------------------------------- graficos de MSX1
#
# El cartucho de MSX1 pinta en SCREEN 2 (TMS9918), con sus propias rutinas
# del banco 0 (direcciones de MSX1):
#   p00:5033  lista de 6 bytes [tercios][colores][caracter][patrones], un 0
#             acaba: en cada tercio marcado (bit 0: 0x1000, 1: 0x0800, 2:
#             0x0000) las rachas de patrones van a 8 x caracter y las de colores
#             a 0x2000 + 8 x caracter (las rachas, como p00:4E20).
#   p00:4EB7  rachas a los tres tercios (HL, HL + 0x800, HL + 0x1000).
#   p00:53D6  rectangulo: B filas de C caracteres.
#   p00:4F0B  letrero: [x][y] y caracteres, 0xFE [x][y], 0xFF acaba.


def lista_tercios(v, a, nom, que, lector):
    ini = a
    while v(a):
        for o, q in ((1, "colores"), (4, "patrones")):
            r = v.w(a + o)
            rachas(v, r, "rachas_%04X" % r, "%s de %s" % (q, que), lector)
        a += 6
    B.declara(v, ini, a + 1, nom, "%d fichas de 6 bytes [tercios][colores][caracter][patrones] "
              "(%s), un 0 acaba: rachas a las tablas de patrones y colores de cada tercio marcado"
              % ((a - ini) // 6, que), lector, F=6)


def graficos_msx1():
    if actual() != "msx1":
        return
    lec_l = "p00:5033"
    v = B.Ventana((7, 8, 9))
    lista_tercios(v, 0x6000, "graf_6000", "lo comun a las piramides", lec_l)
    B.declara(v, 0x6007, 0x6013, "graficos_piramides", "6 punteros, uno por piramide (0xE241, "
              "desde 0x6005: la entrada 0 son los dos ultimos bytes de la lista de delante)",
              "p00:530C", F="w8")
    for k in range(1, 7):
        lista_tercios(v, v.w(0x6005 + 2 * k), "graf_pir%d" % k, "la piramide %d" % k, lec_l)
    for a, que, lec in ((0x814B, "la entrada", "p00:56C5"), (0x815F, "el final", "p00:56E4"),
                        (0x8175, "el final", "p00:56DB")):
        lista_tercios(v, a, "graf_%04X" % a, que, lec_l)
    for a, que, lec in ((0x8934, "la presentacion", "p00:5289"), (0x8BAA, "la presentacion",
                        "p00:5292"), (0x9625, "el titulo (no japones)", "p00:529B"),
                        (0x9438, "el titulo (japones: 0x002B de la BIOS)", "p00:52A5"),
                        (0x98FF, "el titulo (no japones)", "p00:52AE"),
                        (0x9756, "el titulo (japones)", "p00:52B8"),
                        (0x926A, "las musicas", "p00:55E7"), (0x93C3, "las musicas", "p00:55F0"),
                        (0x9A8F, "la tabla de nombres", "p00:55D8")):
        rachas(v, a, "rachas_%04X" % a, que, lec)
    rachas_destino(v, 0x9BF2, "rachas_9BF2", "la presentacion", "p00:4E23")
    # el fundido de salida (p00:53F9): A = 0 o 1, listas de una ficha desde 0x9422 + 5 x A
    B.declara(v, 0x9422, 0x942C, "fundidos_salida", "2 listas de fundido de salida (0x9422 + 5 x "
              "A; A = 0 en p01:70FE y p01:71CD, 1 en p01:6735 y p01:734A): una ficha [tercios]"
              "[caracter][cuantos bytes, 2] y el 0 (se borran en la VRAM poco a poco)", "p00:53FC",
              F=5)
    # el fundido de entrada (p00:5410): A = 0, 1 o 2, listas de graficos de 6 bytes
    B.declara(v, 0x9432, 0x9438, "fundidos_entrada", "3 punteros (por A: 0 en p01:70B5, 1 en "
              "p01:7147, 2 en p01:72B9): listas de graficos que aparecen con el fundido de entrada",
              "p00:5416", F="w8")
    for k in range(3):
        a = v.w(0x9432 + 2 * k)
        lista_tercios(v, a, "graf_%04X" % a, "el fundido de entrada %d" % k, "p00:54A7")
    # los caracteres que cambian solos (p00:5915 y p00:58C5), tablas del banco 0
    w0 = B.Ventana((7, 8, 9))
    B.declara(w0, 0x5930, 0x5940, "animados_comunes", "8 punteros (por 0xEF06 & 7): rachas de "
              "patrones que van a los caracteres 0x98-0x9F de los tres tercios", "p00:5926", F="w8")
    for k in range(8):
        r = w0.w(0x5930 + 2 * k)
        rachas(w0, r, "rachas_%04X" % r, "un paso de los caracteres animados", "p00:4EB9")
    B.declara(w0, 0x5940, 0x5940 + 60, "animados_piramides", "10 bytes por piramide (desde "
              "0x5936 + 10 x piramide): [caracter][cada cuantos cuadros] y 4 punteros a los pasos",
              "p00:58D3", F=10)
    for k in range(1, 7):
        for j in range(4):
            r = w0.w(0x5936 + 10 * k + 2 + 2 * j)
            rachas(w0, r, "rachas_%04X" % r, "un paso del caracter animado de la piramide %d" % k,
                   "p00:4EB9")
    for a, que, lec in ((0x9A54, "del titulo (no japones)", "p00:52DE"),
                        (0x99E9, "del titulo (japones)", "p00:52E8")):
        letrero(v, a, "letrero_%04X" % a, que, lec)
    B.declara(v, 0x9BDA, 0x9BE6, "presentacion_trozos", "6 punteros: los trozos del dibujo de la "
              "presentacion, en rachas que se desempaquetan en la RAM (0xE900)", "p00:5A11", F="w8")
    for k in range(6):
        a = v.w(0x9BDA + 2 * k)
        B.declara(v, a, rachas_vram(v, a), "presentacion_%d" % k, "un trozo del dibujo de la presentacion: rachas a la RAM (p00:5A21)",
                  "p00:5A21", F=16)
    # bancos 14-15 (p00:41D4)
    v = B.Ventana((1, 14, 15))
    B.declara(v, 0x84D7, 0x84E5, "posturas", "7 punteros, uno por lo que lleva el personaje "
              "(0xE287): una tabla por direccion", "p00:567A", F="w8")
    for k in range(7):
        t = v.w(0x84D7 + 2 * k)
        sig = v.w(0x84D7 + 2 * (k + 1)) if k < 6 else 0x8589
        n = (sig - t) // 2
        B.declara(v, t, t + 2 * n, "postura_%d" % k, "%d punteros, uno por direccion: las rachas "
                  "de sus sprites" % n, "p00:5686", F="w8")
        for j in range(n):
            r = v.w(t + 2 * j)
            rachas(v, r, "rachas_%04X" % r, "sprites del personaje", "p00:568D")
    for t, n, que, lec in ((0x8589, 7, "muerto, por direccion", "p00:5696"),
                           (0x8597, 7, "en pausa", "p00:56A6")):
        B.declara(v, t, t + 2 * n, "spr_%04X" % t, "%d punteros a las rachas de los sprites del "
                  "personaje %s" % (n, que), lec, F="w8")
        for j in range(n):
            r = v.w(t + 2 * j)
            rachas(v, r, "rachas_%04X" % r, "sprites del personaje", "p00:568D")
    for a, lec in ((0x85A5, "p00:5824"), (0x8604, "p00:582D"), (0x8662, "p00:5836"),
                   (0x86BC, "p00:5860"), (0x871B, "p00:5869"), (0x8778, "p00:5872"),
                   (0xA6D8, "p00:56BC"), (0xB418, "p00:5848"), (0xB41D, "p00:580C"),
                   (0xB5B7, "p00:581B"), (0xB61D, "p00:5325"), (0xB851, "p00:5803"),
                   (0xB963, "p00:583F"), (0xBA96, "p00:5605")):
        rachas(v, a, "rachas_%04X" % a, "sprites o pantallas", lec)
    rachas_destino(v, 0xBB21, "rachas_BB21", "el titulo", "p00:4E23")
    for a, b, c, lec in ((0xAB57, 12, 12, "p00:56F0"), (0xAAC7, 12, 12, "p00:56FF"),
                         (0xB0DC, 12, 12, "p00:5711"), (0xB0C7, 7, 3, "p00:5719"),
                         (0xB16C, 2, 3, "p00:572C"), (0xB172, 2, 3, "p00:5731"),
                         (0xB178, 2, 3, "p00:5744"), (0xB17E, 2, 3, "p00:5749"),
                         (0xB184, 16, 12, "p00:5785"), (0xB244, 16, 12, "p00:578B"),
                         (0xB304, 12, 2, "p00:579D"), (0xB31C, 12, 4, "p00:57AF"),
                         (0xB34C, 14, 6, "p00:57C1"), (0xB3A0, 6, 6, "p00:57D8"),
                         (0xB3C4, 14, 6, "p00:57F1")):
        B.declara(v, a, a + b * c, "rect_%04X" % a, "%d x %d caracteres (p00:53D6: B filas de C)"
                  % (b, c), lec, F=c)
    B.declara(v, 0xABE7, 0xABE7 + 2 * 48, "columnas_23", "48 punteros a columnas de 23 caracteres "
              "(32 seguidas desde la que se pide)", "p00:5769", F="w8")
    for k in range(48):
        a = v.w(0xABE7 + 2 * k)
        B.declara(v, a, a + 24, "col23_%02d" % k, "columna de 23 caracteres en 24 bytes (el ultimo "
                  "no lo lee nadie: p00:5772 pide 0x17 filas)", "p00:53D9", F=24)
    for k in (0, 1):
        letrero(v, v.w(0xA778 + 2 * k), "letrero_sitio%d" % (k + 1), "del sitio escondido %d"
                % (k + 1), "p00:4F11")
    B.declara(v, 0xA778, 0xA77C, "letreros_sitios", "2 punteros: el letrero de cada minijuego "
              "escondido", "p00:4BA6", F="w8")
    # banco 12: las fuentes (p00:5342, 5890, 5A3D)
    v12 = B.Ventana((10, 11, 12))
    for a, n, lec in ((0xAFDD, 0x1A8, "p00:534B"), (0xAA29, 0x60, "p00:5893"),
                      (0xAA89, 0xF0, "p00:5A4C"), (0xAB79, 0x28, "p00:58AB"),
                      (0xABA1, 0x10, "p00:5A58"), (0xABB1, 0x10, "p00:5A7A")):
        B.declara(v12, a, a + n, "fuente_%04X" % a, "%d bytes de patrones (%d caracteres) que van "
                  "a la VRAM en los tres tercios" % (n, n // 8), lec, F=8)


def banco12_comun():
    """Lo del banco 12 hasta 0xB400, igual byte a byte en los dos cartuchos: los
    letreros y sus tablas. Los lectores son los de MSX2 traducidos; si uno no tiene
    pareja en MSX1, se pone el que lee los letreros (p00:51D6 o p00:4F11)."""
    v12 = B.Ventana((1, 2, 12))
    general = {"msx2": "p00:51D6", "msx1": "p00:4F11"}[actual()]

    def lec(x):
        global _MAPA
        if actual() == "msx2":
            return x
        if _MAPA is None:
            tr("p00:4000")
        return _MAPA.get(x.upper().replace("P", "p"), general)
    for a, que, l in ((0xB185, "del menu de grabar", "p01:6787"), (0xB256, "de la fase", "p01:72F2"),
                      (0xB284, "del menu", "p00:482C"), (0xAF60, "de error de disco", "p02:977E"),
                      (0xAF7D, "sin ficheros", "p02:8D23"),
                      (0xAC01, "DO YOUR BEST", "p01:6963"),
                      (0xACC3, "CONGRATULATIONS (el final)", "p01:73F8"),
                      (0xAEDD, "THANKS TO YOUR COURAGE (el final)", "p01:75D1"),
                      (0xAD12, "ALL YOU HAVE TO DO NOW (el final)", "p01:744D"),
                      (0xAD58, "PUSH SPACE KEY (el final)", "p01:7569"),
                      (0xAD69, "DANGER !!! (el final)", "p01:7550"),
                      (0xAF21, "CONGRATULATIONS !!! (el final)", "p01:7651")):
        letrero(v12, a, "letrero_%04X" % a, que, lec(l))
    for t, n, que, l, idx in ((0xAC13, 5, "de cada piramide acabada (de la 1 a la 5: la 6 va al final)", "p01:71AF", "piramide - 1"),
                              (0xAD76, 9, "del final", "p01:772E", "paso 0xEDCF"),
                              (0xAF52, 7, "de los errores de disco", "p02:976E",
                               "error: p02:975E recibe del 0 al 4; el 5, TOO MANNY FILES, y el 6, "
                               "DATATYPEERROR, no los pide nadie")):
        B.declara(v12, t, t + 2 * n, "letreros_%04X" % t, "%d punteros a los letreros %s (%s)"
                  % (n, que, idx), lec(l), F="w8")
        for k in range(n):
            letrero(v12, v12.w(t + 2 * k), "letrero_%04X" % v12.w(t + 2 * k), que, general)
    B.declara(v12, 0xAF37, 0xAF37 + 3 * 9, "estrellas_final", "9 caracteres del final de 3 bytes "
              "[x][y][caracter], uno cada 8 cuadros", lec("p01:74FD"), F=3)
    B.declara(v12, 0xB1B6, 0xB1B6 + 32, "sprite_flecha", "el dibujo de la flecha de los menus "
              "(32 bytes)", lec("p01:67FE"), F=16)


def restos():
    """Lo ultimo: tablas que se leen con un indice, sobras y relleno."""
    v = actual()
    v1 = B.Ventana((1, 2, 3))
    v12 = B.Ventana((1, 2, 12))
    # el ancho de cada tipo de cosa (1-5): en casillas del mapa y en caracteres
    for b0, lec, que in {"msx2": ((0x6444, "p01:63E3", "casillas del mapa (p01:63ED)"),
                                  (0x82F2, "p02:82E6", "caracteres (p00:5737)")),
                         "msx1": ((0x624E, "p01:61ED", "casillas del mapa (p01:61F7)"),
                                  (0x7ED3, "p01:7EC7", "caracteres (p00:53CF)"))}[v]:
        B.declara(v1, b0 + 1, b0 + 6, "anchos_%04X" % (b0 + 1), "5 bytes, uno por tipo de cosa "
                  "(1-5, desde 0x%04X: la entrada 0 cae en el codigo de delante): su ancho en %s"
                  % (b0, que), lec, F=5)
    # la demostracion (p12:BA11): la fase y el mando grabado de cada una
    fb, flec, mb, mlec, llec = {"msx2": (0xBA3A, "p12:BA21", 0xBA92, "p12:BA88", "p12:BA90"),
                                "msx1": (0xBA20, "p12:BA07", 0xBA78, "p12:BA6E", "p12:BA76")}[v]
    B.declara(v12, fb + 1, fb + 7, "fases_demo", "las fases de las 6 demostraciones (0xE219, de 1 "
              "a 6, desde 0x%04X: la entrada 0 cae en el codigo de delante)" % fb, flec, F=6)
    B.declara(v12, mb + 2, mb + 14, "mandos_demo", "6 punteros, uno por piramide (0xE241, desde "
              "0x%04X: la entrada 0 cae en el codigo de delante): el mando grabado de su "
              "demostracion" % mb, mlec, F="w8")
    for k in range(1, 7):
        a = x = v12.w(mb + 2 * k)
        while v12(x + 1) != 0xFF:
            x += 2
        B.declara(v12, a, x + 2, "mando_%d" % k, "el mando grabado de la demostracion de la "
                  "piramide %d: parejas [cuadros][teclas]; unas teclas 0xFF acaban" % k, llec, F=2)
    # los punteros a las rutinas de error de disco: 0xF323 (DISKVE) apunta aqui y la BIOS de
    # disco salta a la direccion que hay dentro
    for a, rut, lec in {"msx2": ((0x972C, 0x972E, "p00:4165"), (0x9797, 0x9799, "p02:9CC1")),
                        "msx1": ((0x9E65, 0x9E67, "p00:4168"), (0x9ED0, 0x9ED2, "p03:A016"))}[v]:
        B.declara(v1, a, a + 2, "diskve_%04X" % a, "la direccion de una rutina de error de disco "
                  "(0x%04X): el juego pone 0x%04X en 0xF323 (DISKVE) y la BIOS de disco salta a lo "
                  "que hay aqui" % (rut, a), lec, F="w8")
    # relleno
    B.declara(B.Ventana((1, 2, 13)), 0xBFF6, 0xC000, "relleno_BFF6", "10 bytes a 0xFF al final "
              "del banco 13: relleno", "nadie", F=10)
    if v == "msx2":
        B.declara(v12, 0xB2AB, 0xB400, "relleno_B2AB", "341 bytes a 0xFF: relleno", "nadie", F=16)
        B.declara(v12, 0xABA1, 0xABC1, "car_ABA1", "2 caracteres (16 bytes de patrones y 16 de "
                  "colores), los mismos que el cartucho de MSX1 copia en p00:5A58 y p00:5A7A; en "
                  "este no los lee nadie", "nadie", F=8)
        v7 = B.Ventana((7, 8, 9))
        B.declara(v7, 0x600A, 0x600C, "colores_6000_6", "sexto puntero de la tabla de colores "
                  "0x6000 (el modo / 8 = 5): ninguna ficha de la lista 0x602A lo pide", "nadie",
                  F="w8")
        B.declara(v7, 0x6022, 0x602A, "col_6022", "8 colores (de 4 bits) para 3 bits por punto, "
                  "los del sexto puntero: no los pide nadie", "nadie", F=8)
        B.declara(v7, 0x651C, 0x656C, "car_651C", "80 bytes de caracteres entre car_646C y "
                  "car_656C que ninguna ficha de la lista 0x602A pide", "nadie", F=16)
        B.declara(v7, 0x9058, 0x9063, "graf_9058", "una lista de graficos igual, byte a byte, que "
                  "la de 0x9063 (el final): esta no la pide nadie", "nadie", F=4)
        v15 = B.Ventana((1, 14, 15))
        for a in (0xA946, 0xA968):
            B.declara(v15, a, a + 2, "dir_%04X" % a, "la direccion de la paleta que va detras "
                      "(0x%04X); los fundidos de 0xA792 apuntan a la paleta, esto no lo lee nadie"
                      % (a + 2), "nadie", F="w8")
    else:
        # el banco 12 es el mismo que el de MSX2 hasta 0xB400; esto solo lo lee el de MSX2
        B.declara(v12, 0xABC1, 0xAC01, "car_ABC1", "2 caracteres ya de 4 bits por punto (32 bytes "
                  "cada uno), del cartucho de MSX2 (alli los lee p00:51A2); en este no los lee nadie",
                  "nadie", F=16)
        B.declara(v12, 0xB1D6, 0xB256, "dibujo_B1D6", "un dibujo de 16 x 16 de 4 bits por punto "
                  "(128 bytes), del cartucho de MSX2 (alli lo manda p00:56CE con HMMC); en este no "
                  "lo lee nadie", "nadie", F=16)
        B.declara(v12, 0xB2AB, 0xB400, "relleno_B2AB", "341 bytes a 0xFF: relleno", "nadie", F=16)
        w0 = B.Ventana((7, 8, 9))
        B.declara(w0, 0x5E1C, 0x5E24, "pasos_japones", "4 punteros (por 0xE216 - 1, de 3 a 0): "
                  "rachas que van al caracter 1 (0x0008) de los tres tercios, una cada 0x30 "
                  "cuadros; solo con la BIOS japonesa (0x002B = 0, p00:5DD5)", "p00:5DF9", F="w8")
        for k in range(4):
            r = w0.w(0x5E1C + 2 * k)
            rachas(w0, r, "rachas_%04X" % r, "un paso con la BIOS japonesa", "p00:52F7")
        B.declara(w0, 0x9D54, 0x9D71, "rachas_9D54", "rachas que suman 0x3F0 bytes, lo que miden "
                  "los patrones del dibujo de la presentacion (p00:599B): con la forma de sus "
                  "colores; ninguna instruccion carga 0x9D54 ni sale como palabra en la ROM",
                  "nadie", F=16)
        B.declara(w0, 0x942C, 0x9432, "fundido_942C", "6 bytes detras de las dos listas de "
                  "fundido de salida: serian la de A = 2, pero p00:53F9 solo se llama con A = 0 o 1",
                  "nadie", F=6)
        B.declara(w0, 0x816D, 0x816E, "cero_816D", "un 0 suelto entre graf_8166 y graf_816E: "
                  "ninguna instruccion ni tabla apunta aqui", "nadie", F=1)
        for a in (0x745C, 0x7480):
            rachas(w0, a, "rachas_%04X" % a, "un paso mas del caracter animado de la piramide 3; "
                   "su tabla (0x5954) repite 0x7414 y 0x7438 y este no lo pide nadie", "nadie")


def todo():
    """Declara los bloques de los dos cartuchos (B.declara ...)."""
    sonido()
    fases()
    banco13_resto()
    graficos_msx2()
    graficos_msx2_resto()
    graficos_msx1()
    banco12_comun()
    banco12_fin()
    restos()
