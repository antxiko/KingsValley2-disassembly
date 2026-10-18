#!/usr/bin/env python3
"""Los lectores de datos de King's Valley II y sus formatos, para tools/bloques.py.

Cada recorredor hace con los bytes lo mismo que la rutina del cartucho que
lo lee, y devuelve donde acaba. Las rutinas, con su direccion en NUESTRO
listado. Lo que esta en los bancos comunes (4, 5, 6, 10, 11 y 13) vale para
los dos cartuchos; lo de los bancos propios lleva la variante.
"""
import bloques as B


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


def todo():
    """Declara los bloques de los dos cartuchos (B.declara ...)."""
    sonido()
