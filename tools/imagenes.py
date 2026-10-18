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


def hoja_enemigos(m, v, salida):
    """Los 30 dibujos de enemigo (IX+11, tabla del banco 13) con los colores de cada
    tipo (1-4) que pone la rutina del juego (IX+1E/1F)."""
    from PIL import Image
    d = SPR[v]
    b13 = m.rom[13 * 0x2000:14 * 0x2000]
    hoja = Image.new("RGB", (30 * 20, 4 * 20), (40, 40, 40))
    for t in range(1, 5):
        m.mem[0xE500:0xE520] = bytes(32)
        m.mem[0xE500] = t
        m.ix = 0xE500
        m.llama(d["colores_enemigo"], ix=0xE500)
        c1, c2 = m.mem[0xE51E], m.mem[0xE51F]
        for dib in range(30):
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
            hoja.paste(solo_sprites(m).crop((38, 38, 58, 58)), (dib * 20, (t - 1) * 20))
    hoja = hoja.resize((hoja.width * 2, hoja.height * 2), Image.NEAREST)
    hoja.save(os.path.join(salida, "sprites_%s_enemigos.png" % v), optimize=True)


def sprites(salida):
    for v in ("msx2", "msx1"):
        m = maquina(v)
        m.mem[0xE242] = 1
        m.llama(DIR[v]["prepara_fase"])
        hoja_prota(m, v, salida)
        hoja_enemigos(m, v, salida)
        print(v, "sprites")


def main(argv):
    salida = argv[1]
    os.makedirs(salida, exist_ok=True)
    que = argv[2] if len(argv) > 2 else "todas"
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
