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


def main(argv):
    salida = argv[1]
    os.makedirs(salida, exist_ok=True)
    que = argv[2] if len(argv) > 2 else "todas"
    if que in ("todas", "mapas"):
        fases = [int(x) for x in argv[3].split(",")] if len(argv) > 3 else range(1, 61)
        mapas(salida, fases)
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
