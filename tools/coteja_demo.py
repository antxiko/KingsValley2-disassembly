#!/usr/bin/env python3
"""Coteja las demostraciones de tools/msx2run.py con las de openMSX.

tools/omsx_demo.tcl vuelca la VRAM y la RAM de openMSX justo antes de unos
cuadros del juego de la demostracion. Aqui msx2run parte del estado de openMSX
en el primero (su RAM, sus bancos de 0xF0F1-0xF0F3, su VRAM, sus registros y su
paleta), hace ese cuadro del juego y luego llama a la interrupcion (0x402E)
una vez por cuadro, como tools/imagenes.py (demos). Los cuadros se cuentan en
cuadros del juego, no en interrupciones: en el MSX, si un cuadro no acaba a
tiempo (0xE205) la interrupcion siguiente solo hace sonar la musica. En esos
cuadros se compara:

- la RAM del juego (0xE200-0xEFFF): sin el sonido (0xE000-0xE1FF, que va por
  interrupciones y esta cotejado aparte, tools/coteja_psg.py) ni las dos
  cuentas que bajan en cada interrupcion (0xE215-0xE216 y 0xE21A), ni la marca
  de cuadro en marcha (0xE205), que en openMSX ya esta puesta al volcar;
- la VRAM entera y, aparte, las tablas de sprites (atributos, colores y dibujos)
  con las direcciones que dan los registros del VDP de openMSX.

Uso:  coteja_demo.py msx2|msx1 work/demo_msx2 [desde=1] [60 300 600 900]

La partida de openMSX (de una en una, fuera del sandbox):
  DEMO_SALIDA=work/demo_msx2 DEMO_CUADROS="1 60 300 600 900 1200" DEMO_FIN=150
  DEMO_BP=0x4086 openmsx -machine C-BIOS_MSX2 -cart kv2_msx2.rom
  -romtype KonamiSCC -script tools/omsx_demo.tcl
(MSX1: DEMO_BP=0x4088, C-BIOS_MSX1, kv2_msx1.rom.)
"""
import os
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, AQUI)
import imagenes  # noqa: E402

# el cuadro del juego que llama la interrupcion (p00:4086 / p00:4088)
CUADRO = {"msx2": 0x46D4, "msx1": 0x46D5}
FUERA = {0xE205, 0xE215, 0xE216, 0xE21A}   # 0xE205: en openMSX se vuelca ya marcado


def regs(ruta, que="R"):
    r = {}
    for ln in open(ruta):
        k, v = ln.split("=")
        if k.strip()[0] == que:
            r[int(k.strip()[1:])] = int(v, 0)
    return r


def carga(m, d, k):
    """El estado de openMSX en el cuadro k, puesto en msx2run."""
    ram = open(os.path.join(d, "ram-%d.bin" % k), "rb").read()
    vram = open(os.path.join(d, "vram-%d.bin" % k), "rb").read()
    m.mem[0xC000:0x10000] = ram[0xC000:0x10000]
    for ventana, a in ((0x6000, 0xF0F1), (0x8000, 0xF0F2), (0xA000, 0xF0F3)):
        m.pon_banco(ventana, ram[a])
    r = regs(os.path.join(d, "vdp-%d.txt" % k))
    if m.msx2:
        m.vdp.vram[:] = vram
        for n, x in r.items():
            m.vdp.r[n] = x
        for n, x in regs(os.path.join(d, "vdp-%d.txt" % k), "P").items():
            m.vdp.pal[n] = (x >> 8 & 7, x >> 4 & 7, x & 7)
    else:
        m.vdp.vram[:] = vram[:len(m.vdp.vram)]
        for n in range(8):
            m.vdp.regs[n] = r[n]


def tablas(r, msx2):
    """(nombre, desde, largo) de las tablas de sprites, de los registros."""
    if msx2:
        # modo 2: los atributos en (R11:R5 & ~0x3FF) + 0x200, los colores 512 bytes antes
        attr = ((r[11] << 15) | (r[5] << 7)) & 0x1FC00 | 0x200
        pat = (r[6] << 11) & 0x1FFFF
        return [("colores", attr - 512, 512), ("atributos", attr, 128), ("dibujos", pat, 2048)]
    return [("atributos", (r[5] & 0x7F) << 7, 128), ("dibujos", (r[6] & 7) << 11, 2048)]


def main(v, d, cuadros, desde=None):
    m = imagenes.maquina(v)
    n, hechos = 0, 0
    if desde:
        carga(m, d, desde)
        n = desde
        m.llama(CUADRO[v])
        m.mem[0xE205] = 0       # lo que hace la interrupcion al volver (p00:408A)
    for _ in range(60 * 60 * 12):
        if m.mem[0xE200] == 2:
            n += 1
            if n in cuadros:
                hechos += 1
                ram = open(os.path.join(d, "ram-%d.bin" % n), "rb").read()
                vram = open(os.path.join(d, "vram-%d.bin" % n), "rb").read()
                r = regs(os.path.join(d, "vdp-%d.txt" % n))
                vram = vram[:len(m.vdp.vram)]
                mios = bytes(m.vdp.vram)
                dr = [a for a in range(0xE200, 0xF000)
                      if a not in FUERA and ram[a] != m.mem[a]]
                dv = sum(1 for a in range(len(vram)) if vram[a] != mios[a])
                print("cuadro %d (fase %d): RAM %s, VRAM %s" % (
                    n, m.mem[0xE242],
                    "IGUAL" if not dr else "%d distintos (%s)" % (
                        len(dr), " ".join("%04X" % a for a in dr[:12])),
                    "IGUAL" if not dv else "%d bytes distintos" % dv))
                for nombre, a, k in tablas(r, m.msx2):
                    x = sum(1 for i in range(k) if vram[a + i] != mios[a + i])
                    print("   %-9s 0x%05X: %s" % (nombre, a, "IGUAL" if not x else "%d distintos" % x))
                if hechos == len(cuadros):
                    return 0
        m.llama(0x402E)
    print("no se llego a todos los cuadros")
    return 1


if __name__ == "__main__":
    de = [int(x[6:]) for x in sys.argv[3:] if x.startswith("desde=")]
    c = [int(x) for x in sys.argv[3:] if x.isdigit()] or [60, 300, 600, 900]
    sys.exit(main(sys.argv[1], sys.argv[2], c, de[0] if de else None))
