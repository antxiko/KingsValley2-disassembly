#!/usr/bin/env python3
"""Las imagenes de la web, pintadas ejecutando el codigo del cartucho.

No se rehace ningun dibujo a mano: tools/msx2run.py ejecuta las rutinas del
propio cartucho (con su mapper, la BIOS atrapada y el VDP de cada maquina) y
aqui solo se mira la VRAM que dejan. Lo mismo para los dos cartuchos: las
direcciones de MSX1 son las parejas de las de MSX2 (tools/paralelo.py).

EL COTEJO con openMSX (tools/lanza_vram.ps1, de uno en uno; PARTIDAS): con el
juego puesto a mano en "empieza la fase 1" y volcado a los 16 s, la pagina 0
de MSX2 sale igual byte a byte y la tabla de nombres de MSX1 tambien; en MSX1
solo cambian los caracteres que se animan solos (0x4F-0x5C de la piramide 1 y
0x98-0x9B), que van por su cuenta durante el juego.

Uso: imagenes.py <directorio>              todas
     imagenes.py <directorio> mapas [fases] solo los mapas (fases: 1,2,60)
"""
import os
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
RAIZ = os.path.dirname(AQUI)
sys.path.insert(0, AQUI)
from msx2run import Msx   # noqa: E402

PARTIDAS = {
    "m2_f01": '-rom kv2_msx2.rom -maquina C-BIOS_MSX2 -tiempos "12 16" -pokes "6:0xE242:1 '
              '6:0xE200:4 6:0xE201:0 6:0xE204:1" (la fase 1 a mano)',
    "m1_f01": 'lo mismo con -rom kv2_msx1.rom -maquina C-BIOS_MSX1',
}

# las rutinas de cada cartucho (MSX2 y su pareja de MSX1)
DIR = {
    "msx2": dict(prepara_fase=0x5C80, pinta_pantalla=0x5CF5),
    "msx1": dict(prepara_fase=0x5A8A, pinta_pantalla=0x5AEC),
}


def maquina(v):
    rom = open(os.path.join(RAIZ, "kv2_%s.rom" % v), "rb").read()
    m = Msx(rom, msx2=(v == "msx2"))
    m.arranca()
    return m


def pantalla(m, alto=192):
    """Lo que se ve: la pagina 0 de SCREEN 5 o SCREEN 2 con sus tablas."""
    if m.msx2:
        return m.vdp.pagina(0, alto)
    import vdp
    r = bytearray(m.vdp.regs)
    r[1] |= 0x40                     # encendida: se mira la VRAM aunque el juego la apague
    return vdp.pinta_vdp(bytes(m.vdp.vram), bytes(r), 1)


def mapa(m, v, fase, salida=None):
    """Las pantallas de la fase en su sitio de la rejilla (0xE788 + fila x 8 +
    columna, el numero de pantalla; la deja p00:5DAC)."""
    from PIL import Image
    m.mem[0xE254] = 0
    m.mem[0xE242] = fase
    m.llama(DIR[v]["prepara_fase"])
    g = m.mem[0xE780:0xE7C0]
    sitio = {g[i]: (i % 8, i // 8) for i in range(64) if g[i]}
    x0 = min(x for x, y in sitio.values())
    y0 = min(y for x, y in sitio.values())
    ancho = max(x for x, y in sitio.values()) - x0 + 1
    alto = max(y for x, y in sitio.values()) - y0 + 1
    im = Image.new("RGB", (256 * ancho, 192 * alto))
    for n, (x, y) in sorted(sitio.items()):
        m.mem[0xE243] = n
        m.llama(DIR[v]["pinta_pantalla"])
        p = pantalla(m)
        if salida:
            p.save(os.path.join(salida, "pantalla_%s_f%02d_%d.png" % (v, fase, n)), optimize=True)
        im.paste(p, (256 * (x - x0), 192 * (y - y0)))
    return im, len(sitio)


def piramide(salida, v, k, escala=2):
    """Las 10 fases de la piramide k (de la 10 x (k - 1) + 1 a la 10 x k) en una hoja,
    a la mitad de tamano, de cinco en cinco."""
    from PIL import Image
    ims = [Image.open(os.path.join(salida, "mapa_%s_f%02d.png" % (v, f)))
           for f in range(10 * (k - 1) + 1, 10 * k + 1)]
    ims = [i.resize((i.width // escala, i.height // escala)) for i in ims]
    sep = 8
    filas = [ims[:5], ims[5:]]
    ancho = max(sum(i.width for i in f) + sep * (len(f) - 1) for f in filas)
    alto = sum(max(i.height for i in f) for f in filas) + sep
    hoja = Image.new("RGB", (ancho, alto), (24, 24, 24))
    y = 0
    for f in filas:
        x = 0
        for i in f:
            hoja.paste(i, (x, y))
            x += i.width + sep
        y += max(i.height for i in f) + sep
    hoja.save(os.path.join(salida, "piramide_%s_%d.png" % (v, k)), optimize=True)


def mapas(salida, fases=range(1, 61)):
    for v in ("msx2", "msx1"):
        m = maquina(v)
        for f in fases:
            im, n = mapa(m, v, f, salida)
            im.save(os.path.join(salida, "mapa_%s_f%02d.png" % (v, f)), optimize=True)
            print("%s fase %2d: %d pantallas" % (v, f, n))
        if list(fases) == list(range(1, 61)):
            for k in range(1, 7):
                piramide(salida, v, k)


def cuadro(m, alto=212):
    """Lo que se ve en este cuadro, con los sprites."""
    if m.msx2:
        im = m.vdp.pagina(0, alto)
        return m.vdp.sprites(im)
    import vdp
    return vdp.pinta_vdp(bytes(m.vdp.vram), bytes(m.vdp.regs), 1)


def demos(salida, cada=3, por_version=6):
    """Las demostraciones (estado 2): el juego solo, con el mando grabado de la
    tabla de su piramide (p12:BA66). La interrupcion (0x402E) se llama una vez
    por cuadro, como en el MSX; entre una y otra van la presentacion y el titulo."""
    for v in ("msx2", "msx1"):
        m = maquina(v)
        hechas, cuadros, k = 0, [], None
        for _ in range(60 * 60 * 12):
            m.llama(0x402E)
            if m.mem[0xE200] == 2:
                if k is None:
                    k = 0
                    cuadros = []
                    n = 0
                n += 1
                if n == 60:                  # ya con su fase puesta (p12:BA11)
                    k = m.mem[0xE242]
                if n % cada == 0:
                    cuadros.append(cuadro(m))
            elif k is not None:
                cuadros[0].save(os.path.join(salida, "demo_%s_f%02d.gif" % (v, k)), save_all=True,
                                append_images=cuadros[1:], duration=1000 * cada // 60, loop=0,
                                optimize=True)
                print("%s demostracion de la fase %d: %d cuadros" % (v, k, len(cuadros)))
                hechas += 1
                k = None
                if hechas == por_version:
                    break


SPR = {
    # rutinas: los dibujos del prota (patrones), sus 4 sprites (0xE800), y los colores
    # de un enemigo (IX+1E/1F por su tipo); tablas de dibujos de enemigos (banco 13)
    "msx2": dict(prota_dibujos=0x58D2, prota_copia=0x5864, prota_sprites=0x9866,
                 a_vram=0x583B, colores_enemigo=0xACE4, dibujos_enemigos=0xBEED),
    "msx1": dict(prota_dibujos=0x565F, prota_copia=None, prota_sprites=0x9CA3,
                 a_vram=None, colores_enemigo=0xAA5F, dibujos_enemigos=0xBECF),
}


def sprites_tms(m, im):
    """Los sprites del TMS9918 (modo 1: un color por sprite, 0xD0 acaba la lista)
    encima de im."""
    import vdp
    r = m.vdp.regs
    attr, pat = (r[5] & 0x7F) << 7, (r[6] & 7) << 11
    g = 16 if r[1] & 2 else 8
    px = im.load()
    for n in range(31, -1, -1):
        y, x, d, c = m.vdp.vram[attr + 4 * n:attr + 4 * n + 4]
        if y == 0xD0:
            continue
        if g == 16:
            d &= 0xFC
        if c & 15 == 0:
            continue
        for fila in range(g):
            for col in range(g):
                b = m.vdp.vram[pat + 8 * d + (col // 8) * 16 + fila]
                if (b >> (7 - col % 8)) & 1:
                    xx, yy = x + col - (32 if c & 0x80 else 0), (y + 1 + fila) & 0xFF
                    if 0 <= xx < 256 and yy < im.height:
                        px[xx, yy] = vdp.PALETA[c & 15]
    return im


def solo_sprites(m, fondo=(40, 40, 40)):
    from PIL import Image
    im = Image.new("RGB", (256, 212), fondo)
    return m.vdp.sprites(im) if m.msx2 else sprites_tms(m, im)


def hoja_prota(m, v, salida):
    """El prota con lo que lleva (0xE287: 0 nada, 1-6 las herramientas) y cada uno de
    sus 14 dibujos (0xE285), puestos por las rutinas del juego."""
    from PIL import Image
    d = SPR[v]
    hoja = Image.new("RGB", (14 * 24, 7 * 36), (40, 40, 40))
    for k in range(7):
        for dib in range(14):
            for a, x in ((0xE287, k), (0xE285, dib), (0xE280, 0), (0xE282, 40), (0xE284, 40),
                         (0xE24C, 0), (0xE298, 0)):
                m.mem[a] = x
            m.llama(d["prota_dibujos"])
            if d["prota_copia"]:
                m.llama(d["prota_copia"])
            m.llama(d["prota_sprites"])
            if d["a_vram"]:
                m.llama(d["a_vram"])
            else:                                   # MSX1: los 4 de 0xE800 a la tabla
                attr = (m.vdp.regs[5] & 0x7F) << 7
                m.vdp.vram[attr:attr + 16] = m.mem[0xE800:0xE810]
                m.vdp.vram[attr + 16] = 0xD0
            hoja.paste(solo_sprites(m).crop((36, 24, 60, 60)), (dib * 24, k * 36))
    hoja = hoja.resize((hoja.width * 2, hoja.height * 2), Image.NEAREST)
    hoja.save(os.path.join(salida, "sprites_%s_prota.png" % v), optimize=True)


NOMBRES_ENEMIGOS = {1: "SLOUMAN", 2: "FLOUMAN", 3: "PYONCY", 4: "ROCK ROLL", 5: "al morir"}


def vistos_enemigos(v):
    """{tipo: {dibujo: (color 1, color 2)}}: lo que el juego pone en las fichas de
    0xE500 (IX+00 el tipo, IX+11 el dibujo, IX+1E/1F los colores) cuadro a cuadro,
    en las seis demostraciones (como demos) y en la fase 3 sin tocar nada (la
    primera con FLOUMAN, el tipo 2, que no sale en las demostraciones). El tipo 5
    es el enemigo al morir (p01:6611). De cada dibujo, los colores con los que mas
    cuadros se ha visto; fuera los vistos un solo cuadro (el del cambio de tipo,
    que aun lleva el dibujo de antes)."""
    from collections import Counter
    cuenta = {}

    def mira(m):
        for k in range(8):
            f = 0xE500 + 32 * k
            t, dib = m.mem[f], m.mem[f + 0x11]
            if t and dib != 0xFF:
                cuenta.setdefault(t, {}).setdefault(dib, Counter())[(m.mem[f + 0x1E], m.mem[f + 0x1F])] += 1
    m = maquina(v)
    hechas, dentro = 0, False
    for _ in range(60 * 60 * 12):
        m.llama(0x402E)
        if m.mem[0xE200] == 2:
            dentro = True
            mira(m)
        elif dentro:
            dentro, hechas = False, hechas + 1
            if hechas == 6:
                break
    m = maquina(v)
    for _ in range(400):
        m.llama(0x402E)
    for a, x in ((0xE242, 3), (0xE200, 4), (0xE201, 0), (0xE204, 1)):
        m.mem[a] = x
    for _ in range(3000):
        m.llama(0x402E)
        mira(m)
    vistos = {}
    for t, dibs in cuenta.items():
        for dib, c in dibs.items():
            if sum(c.values()) > 1:
                vistos.setdefault(t, {})[dib] = c.most_common(1)[0][0]
    return vistos


def hoja_enemigos(m, v, salida):
    """Una fila por tipo (1-4 y el 5, al morir) con los dibujos que se le han
    visto (vistos_enemigos), en orden y con los colores que les pone el juego;
    cada dibujo son dos sprites de la tabla del banco 13 (IX+11)."""
    from PIL import Image
    d = SPR[v]
    b13 = m.rom[13 * 0x2000:14 * 0x2000]
    vistos = vistos_enemigos(v)
    tipos = sorted(vistos)
    ancho = max(len(vistos[t]) for t in tipos)
    hoja = Image.new("RGB", (ancho * 20, len(tipos) * 20), (40, 40, 40))
    for fila, t in enumerate(tipos):
        for col, dib in enumerate(sorted(vistos[t])):
            c1, c2 = vistos[t][dib]
            if m.msx2:
                attr, cols = 0xF600, 0xF400
                p1, p2 = b13[d["dibujos_enemigos"] - 0xA000 + 2 * dib:][:2]
                m.vdp.vram[attr:attr + 9] = bytes([39, 40, p1, 0, 39, 40, p2, 0, 216])
                m.vdp.vram[cols:cols + 16] = bytes([c1]) * 16
                m.vdp.vram[cols + 16:cols + 32] = bytes([c2]) * 16
            else:
                attr = (m.vdp.regs[5] & 0x7F) << 7
                p1 = b13[d["dibujos_enemigos"] - 0xA000 + dib]
                m.vdp.vram[attr:attr + 5] = bytes([39, 40, p1, c1, 0xD0])
            hoja.paste(solo_sprites(m).crop((38, 38, 58, 58)), (col * 20, fila * 20))
        print(v, "enemigo", t, NOMBRES_ENEMIGOS.get(t), "dibujos", sorted(vistos[t]))
    hoja = hoja.resize((hoja.width * 2, hoja.height * 2), Image.NEAREST)
    hoja.save(os.path.join(salida, "sprites_%s_enemigos.png" % v), optimize=True)

OBJ = {
    "msx2": dict(borra=0x4E98, rect=0x573B, cosas=0x9324, salida=0x9340, sitio=0x93AC,
                 puerta1=0xBB43, puerta2=0xBC50, suelo=0xBDAA, bloque=0x9661),
    "msx1": dict(borra=0x4EC7, rect=0x53D6, cosas=0x903D, salida=0x9059, sitio=0x90C5,
                 puerta1=0xB8BE, puerta2=0xB9CB, suelo=0xBB25, bloque=0x937A),
}


def hoja_objetos(m, v, salida):
    """Lo que hay en las pantallas, pintado por las rutinas del juego sobre la
    pantalla borrada: la joya y las 6 herramientas en el suelo (2 x 2 caracteres
    de la tabla de las cosas, p00:573B / p00:53D6), la salida en sus 3 pasos al
    abrirse (4 x 4, 16 bytes por paso), el sitio de donde salen los enemigos (3 x 2)
    y las cosas de 0xE600 con una ficha puesta a mano (la puerta giratoria, la de
    tipo 2 por sus dos lados, el suelo que se rompe y el bloque)."""
    d = OBJ[v]
    m.llama(d["borra"])
    for k in range(7):
        m.llama(d["rect"], h=(d["cosas"] + 4 * k) >> 8, l=(d["cosas"] + 4 * k) & 0xFF,
                d=8 + 24 * k, e=16, b=2, c=2)
    for k in range(3):
        a = d["salida"] + 16 * k
        m.llama(d["rect"], h=a >> 8, l=a & 0xFF, d=8 + 40 * k, e=48, b=4, c=4)
    m.llama(d["rect"], h=d["sitio"] >> 8, l=d["sitio"] & 0xFF, d=176, e=56, b=2, c=3)
    m.mem[0xE243] = 1
    for x, rut, lado in ((8, "puerta1", 0), (40, "puerta2", 0), (72, "puerta2", 2),
                         (112, "suelo", 0), (160, "bloque", 0)):
        f = 0xE600
        m.mem[f:f + 16] = bytes(16)
        for o, val in ((0, 1), (2, 96), (3, x), (4, 1), (7, lado), (8, 4), (9, 1)):
            m.mem[f + o] = val
        m.llama(d[rut], ix=f)
    if not m.msx2:
        # en MSX el fondo (R7) es el color 15, blanco, y la pantalla borrada lo deja ver
        # entero; en el juego no se ve porque la tapan los caracteres de la piramide.
        # Para la hoja, el 1 (negro), como en MSX2: solo cambia lo vacio (el caracter
        # 0); ninguna cosa tiene puntos de color 0.
        m.vdp.regs[7] = (m.vdp.regs[7] & 0xF0) | 1
    im = pantalla(m).crop((0, 8, 208, 136))
    im = im.resize((im.width * 2, im.height * 2))
    im.save(os.path.join(salida, "objetos_%s.png" % v), optimize=True)


def sprites(salida):
    for v in ("msx2", "msx1"):
        m = maquina(v)
        m.mem[0xE242] = 1
        m.llama(DIR[v]["prepara_fase"])
        hoja_prota(m, v, salida)
        hoja_enemigos(m, v, salida)
        hoja_objetos(m, v, salida)
        print(v, "sprites y objetos")


# Las secuencias: (nombre, estado puesto a mano tras 400 cuadros de arranque, None
# para empezar desde el encendido o "titulo" para empezar en el menu del titulo, cuantos cuadros, cada cuantos uno al GIF, teclas
# {cuadro: (fila, valor)} que se sueltan 6 cuadros despues, cuadros que van a PNG)
SECUENCIAS = [
    ("presentacion", None, 900, 3, {}, [460, 800]),
    ("presentacion_japonesa", None, 900, 3, {}, [460, 800]),     # solo MSX1: 0x002B = 0
    ("editor", "titulo", 600, 0, {30: (8, 0xBF), 60: (8, 0xFE), 230: (8, 0xBF), 260: (8, 0xFE)},
     [220, 599]),
    ("menu", {0xE200: 3, 0xE201: 0, 0xE204: 1}, 200, 0, {}, [199]),
    ("contrasena", {0xE200: 3, 0xE201: 0, 0xE204: 1}, 300, 0, {120: (8, 0xBF), 150: (8, 0xFE)},
     [299]),
    ("piramide_acabada", {0xE200: 10, 0xE201: 0, 0xE204: 1, 0xE241: 2, 0xE242: 11, 0xE257: 1,
                          0xE258: 0, 0xE880: 0}, 1500, 4, {}, [500, 900, 1499]),
    ("fin_de_partida", {0xE200: 7, 0xE201: 0, 0xE204: 1}, 150, 0, {}, [149]),
    ("final", {0xE200: 13, 0xE201: 0, 0xE204: 1, 0xE241: 6, 0xE242: 60, 0xE257: 1, 0xE258: 0,
               0xE880: 0}, 9000, 6, {3000: (8, 0xFE)}, [900, 1500, 2400, 2990, 4100]),
    ("musicas", {0xE200: 12, 0xE201: 0, 0xE204: 1, 0xEF10: 1, 0xEF11: 0}, 200, 0, {}, [199]),
    ("puzle", {0xE200: 12, 0xE201: 0, 0xE204: 1, 0xEF10: 2, 0xEF11: 0}, 200, 0, {}, [199]),
]


def secuencias(salida, solo=None):
    for v in ("msx2", "msx1"):
        for nom, pokes, n, cada, teclas, pngs in SECUENCIAS:
            if solo and nom not in solo:
                continue
            if nom.endswith("_japonesa") and v != "msx1":
                continue
            m = maquina(v)
            m.tolera_bios = True
            if nom.endswith("_japonesa"):
                m.mem[0x002B] = 0x00         # la BIOS japonesa: el otro titulo (p00:529E)
            if pokes == "titulo":            # hasta el menu del titulo (estado 1, paso 1)
                while (m.mem[0xE200], m.mem[0xE201]) != (1, 1):
                    m.llama(0x402E)
            elif pokes is not None:
                for _ in range(400):
                    m.llama(0x402E)
                for a, x in pokes.items():
                    m.mem[a] = x
            cuadros = []
            suelta = {}
            for f in range(n):
                if f in teclas:
                    fila, val = teclas[f]
                    m.teclas[fila] = val
                    suelta[f + 6] = fila
                if f in suelta:
                    m.teclas.pop(suelta[f], None)
                m.llama(0x402E)
                if cada and f % cada == 0:
                    cuadros.append(cuadro(m))
                if f in pngs:
                    cuadro(m).save(os.path.join(salida, "%s_%s_%d.png" % (nom, v, f)), optimize=True)
            if cuadros:
                cuadros[0].save(os.path.join(salida, "%s_%s.gif" % (nom, v)), save_all=True,
                                append_images=cuadros[1:], duration=1000 * cada // 60, loop=0,
                                optimize=True)
            print(v, nom, "estado %X/%X" % (m.mem[0xE200], m.mem[0xE201]),
                  "BIOS rara: %s" % sorted(set("%04X" % x for x in m.bios_rara)) if m.bios_rara else "")


def main(argv):
    salida = argv[1]
    os.makedirs(salida, exist_ok=True)
    que = argv[2] if len(argv) > 2 else "todas"
    if que in ("todas", "secuencias"):
        secuencias(salida, argv[3].split(",") if len(argv) > 3 else None)
    if que in ("todas", "sprites"):
        sprites(salida)
    if que in ("todas", "demos"):
        demos(salida)
    if que in ("todas", "mapas"):
        fases = [int(x) for x in argv[3].split(",")] if len(argv) > 3 else range(1, 61)
        mapas(salida, fases)
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
