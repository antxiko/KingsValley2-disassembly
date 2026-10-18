#!/usr/bin/env python3
"""El VDP del MSX1 (TMS9918) en SCREEN 2, pintado como lo pinta el chip.

pinta_vdp() lee las tablas donde dicen los registros (R2-R6, con sus
mascaras), apaga la pantalla con el bit BL de R1, pone el color de fondo de R7
donde el color es 0 y pinta los sprites de 8 x 8 o 16 x 16, ampliados o no,
con el limite de cuatro por linea.

Los volcados son los de tools/omsx_vram.tcl: vram-<et>.bin (16 KB) y
vdp-<et>.txt (R0-R7 y unas variables de la RAM); cuadros.bin con VRAM_CUADROS
(cada cuadro: 16 KB de VRAM, R0-R7 y el segundo en 8 bytes de texto).

Uso: vdp.py png <dir> <et> <salida.png> [--escala N]
     vdp.py hoja <dir> <et1,et2,...> <salida.png>   varias de un vistazo
     vdp.py gif <dir> <desde> <hasta> <salida.gif> [--cada N] [--escala N]
     vdp.py coteja <dir> <segundo> ...   el cuadro mas parecido a vram-<segundo>.bin
"""
import os
import re
import sys

# La paleta del TMS9918. El color 0 (transparente) deja ver el fondo de R7.
PALETA = [
    (0, 0, 0), (0, 0, 0), (33, 200, 66), (94, 220, 120),
    (84, 85, 237), (125, 118, 252), (212, 82, 77), (66, 235, 245),
    (252, 85, 84), (255, 121, 120), (212, 193, 84), (230, 206, 128),
    (33, 176, 59), (201, 91, 186), (204, 204, 204), (255, 255, 255),
]
TAM = 16384 + 8 + 8


def lee(dir_, et):
    """(vram, registros, variables) del volcado <et>."""
    vram = open(os.path.join(dir_, "vram-%s.bin" % et), "rb").read()
    r, var = [0] * 8, {}
    for ln in open(os.path.join(dir_, "vdp-%s.txt" % et)):
        m = re.match(r"R(\d) = 0x([0-9A-F]+)", ln)
        if m:
            r[int(m.group(1))] = int(m.group(2), 16)
        else:
            k, _, v = ln.partition(" = ")
            if v:
                var[k.strip()] = float(v) if "." in v else int(v, 16)
    return vram, bytes(r), var


def cuadros(dir_):
    """(segundo, vram, registros) de cada cuadro de cuadros.bin."""
    b = open(os.path.join(dir_, "cuadros.bin"), "rb").read()
    for i in range(len(b) // TAM):
        c = b[i * TAM:(i + 1) * TAM]
        yield float(c[16392:16400].decode()), c[:16384], c[16384:16392]


def pinta_vdp(vram, r, escala=1):
    from PIL import Image
    fondo = PALETA[r[7] & 0x0F]
    img = Image.new("RGB", (256, 192), fondo)
    if r[1] & 0x40:
        px = img.load()
        nombres = (r[2] & 0x0F) << 10
        colores = (r[3] & 0x80) << 6
        mcol = ((r[3] & 0x7F) << 6) | 0x3F
        dibujos = (r[4] & 0x04) << 11
        mdib = ((r[4] & 0x03) << 11) | 0x7FF
        for fila in range(24):
            for col in range(32):
                n = (fila // 8) * 256 + vram[nombres + 32 * fila + col]
                for y in range(8):
                    dib = vram[dibujos | ((n * 8 + y) & mdib)]
                    c = vram[colores | ((n * 8 + y) & mcol)]
                    for x in range(8):
                        k = c >> 4 if dib & (0x80 >> x) else c & 0x0F
                        if k:
                            px[col * 8 + x, fila * 8 + y] = PALETA[k]
        atr = (r[5] & 0x7F) << 7
        sdib = (r[6] & 0x07) << 11
        grande, amplia = r[1] & 0x02, r[1] & 0x01
        lado = (16 if grande else 8) * (2 if amplia else 1)
        sprites = []
        for k in range(32):
            y, x, n, c = vram[atr + 4 * k:atr + 4 * k + 4]
            if y == 0xD0:
                break
            y = y + 1 if y < 0xE0 else y - 255
            sprites.append((y, x - (32 if c & 0x80 else 0), n & (0xFC if grande else 0xFF), c & 0x0F))
        por_linea = [0] * 192
        puntos = {}
        for y0, x0, n, c in sprites:
            for yy in range(lado):
                ly = y0 + yy
                if not 0 <= ly < 192:
                    continue
                if por_linea[ly] >= 4:
                    continue
                por_linea[ly] += 1
                if not c:
                    continue
                dy = yy // (2 if amplia else 1)
                for xx in range(lado):
                    lx = x0 + xx
                    if not 0 <= lx < 256 or (lx, ly) in puntos:
                        continue
                    dx = xx // (2 if amplia else 1)
                    byte = vram[sdib + 8 * n + 16 * (dx // 8) + dy]
                    if byte >> (7 - dx % 8) & 1:
                        puntos[(lx, ly)] = c
        for (lx, ly), c in puntos.items():
            px[lx, ly] = PALETA[c]
    if escala != 1:
        img = img.resize((256 * escala, 192 * escala), Image.NEAREST)
    return img


def gif(dir_, desde, hasta, salida, cada=3, escala=2):
    """Un cuadro de cada `cada` (a 60 por segundo); los iguales seguidos se
    juntan en uno mas largo."""
    imgs, tiempos = [], []
    previo = None
    for k, (t, vram, r) in enumerate(cuadros(dir_)):
        if t < desde or t > hasta or k % cada:
            continue
        clave = (vram, r)
        if clave == previo:
            tiempos[-1] += cada
            continue
        previo = clave
        imgs.append(pinta_vdp(vram, r, escala).convert("P", palette=0, colors=16))
        tiempos.append(cada)
    ms = [round(1000 * n / 60) for n in tiempos]
    imgs[0].save(salida, save_all=True, append_images=imgs[1:], duration=ms, loop=0, optimize=True)
    return len(imgs), sum(tiempos) / 60


def coteja(dir_, seg):
    real = open(os.path.join(dir_, "vram-%s.bin" % seg), "rb").read()
    mejor = None
    for t, vram, r in cuadros(dir_):
        d = sum(1 for a, b in zip(real, vram) if a != b)
        if mejor is None or d < mejor[0]:
            mejor = (d, t)
    return mejor


def main(argv):
    esc = int(argv[argv.index("--escala") + 1]) if "--escala" in argv else 1
    if len(argv) >= 5 and argv[1] == "png":
        vram, r, _ = lee(argv[2], argv[3])
        pinta_vdp(vram, r, esc).save(argv[4])
    elif len(argv) >= 5 and argv[1] == "hoja":
        from PIL import Image
        ets = argv[3].split(",")
        out = Image.new("RGB", (4 * 260, ((len(ets) + 3) // 4) * 196), (60, 0, 60))
        for k, et in enumerate(ets):
            vram, r, _ = lee(argv[2], et)
            out.paste(pinta_vdp(vram, r), ((k % 4) * 260, (k // 4) * 196))
        out.save(argv[4])
    elif len(argv) >= 6 and argv[1] == "gif":
        cada = int(argv[argv.index("--cada") + 1]) if "--cada" in argv else 3
        n, s = gif(argv[2], float(argv[3]), float(argv[4]), argv[5], cada, esc if "--escala" in argv else 2)
        print("%s: %d cuadros distintos, %.1f s" % (argv[5], n, s))
    elif len(argv) >= 4 and argv[1] == "coteja":
        for seg in argv[3:]:
            d, t = coteja(argv[2], seg)
            print("vram-%s: el cuadro de %.3f s, %d bytes distintos" % (seg, t, d))
    else:
        sys.exit(__doc__)
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
