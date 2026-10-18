#!/usr/bin/env python3
"""Rehace la VRAM repitiendo, con los bytes de la ROM, las escrituras que el
cartucho hizo en openMSX (tools/omsx_vram.tcl con VRAM_ESCRITURAS):

  0x004D WRTVRM   un byte A en HL
  0x0056 FILVRM   BC bytes A desde HL
  0x005C LDIRVM   BC bytes de HL (la ROM con los bancos de 0xF0F1-3, o la RAM:
                  esos bytes van apuntados en la traza) a DE
  p00:4F7F        las rachas de DE (la ROM) en HL (rachas() de aqui)
  p00:5ACC        8 bytes de DE en HL con outi (p00:5AD1)
  p01:65BA        64 bytes de HL en 0x31E0 con outi (p01:65BE)
  p01:63A7        los 10 sprites de la eleccion (0x63D2, el dibujo + 8 con la cuenta 0xE203)
  p08:8120        rachas con la mascara C (el fundido del final, p08:8123)
  p00:56CB        las letras de la lista DE (0xA068 + 8 x n) en HL con out (p00:56D0)

Asi cada byte de la VRAM tiene su origen en la ROM (o en un bufer de la RAM que
el codigo llena). `coteja` compara la VRAM rehecha con la volcada en el mismo
instante; lo que no sale de estas rutinas (las que escriben con OUT desde la
RAM: el escenario de 0xED00 y los atributos de 0xEB00, p01:6615-66A7) queda
distinto.

Uso: repite.py coteja <dir> <etiqueta> ...       (la etiqueta es el segundo del volcado)
     repite.py vram <dir> <segundo> <salida.bin>
     repite.py png <dir> <segundo> <salida.png> [--escala N]   con los registros del volcado
     repite.py cuadros <dir> <segundo> ... [--png salida-%.1f.png]   contra cuadros.bin
"""
import os
import re
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, AQUI)
import bloques as B      # noqa: E402

PAT = re.compile(r"^([0-9A-F]{4}) HL=([0-9A-F]{4}) DE=([0-9A-F]{4}) BC=([0-9A-F]{4}) A=([0-9A-F]{2}) "
                 r"F0F1=([0-9A-F]{6}) t=([0-9.]+)(?: (?:E203|M)=([0-9A-F]{2}))?(?: DATOS=([0-9a-f]*))?")


def Ventana(bancos):
    """El cartucho con el banco 0 en 0x4000 y los de F0F1-3 en 0x6000-0xBFFF."""
    if 0xFF in bancos:              # antes de que INIT ponga la sombra: los del arranque
        bancos = (1, 2, 3)
    return B.Ventana(bancos)


def rachas(vram, v, origen, destino):
    """p00:4F7F: 0 acaba; n < 0x80 repite el byte siguiente n veces; n > 0x80
    copia n & 0x7F bytes; 0x80 trae otro destino (p00:4F79, que vuelve a
    entrar por p00:4F7F y va apuntado aparte en la traza)."""
    a, d = origen, destino
    while True:
        n = v(a)
        a += 1
        if n == 0 or n == 0x80:
            return
        if n < 0x80:
            x = v(a)
            a += 1
            for _ in range(n):
                vram[d & 0x3FFF] = x
                d += 1
        else:
            for _ in range(n & 0x7F):
                vram[d & 0x3FFF] = v(a)
                a += 1
                d += 1


def rachas_mascara(vram, v, origen, destino, c, gira):
    """p08:8123: las rachas de p00:4F7F sin el 0x80, cada byte AND C; con
    0xE3F2 = 0 (gira) C da tres vueltas a la derecha tras cada byte. En las
    repeticiones el AND se acumula (p08:8147 guarda el byte ya enmascarado)."""
    def rrc3(x):
        return ((x >> 3) | (x << 5)) & 0xFF
    a, d = origen, destino
    while True:
        n = v(a)
        a += 1
        if n == 0:
            return
        if n & 0x80:
            for _ in range(n & 0x7F):
                vram[d & 0x3FFF] = v(a) & c
                a += 1
                d += 1
                if gira:
                    c = rrc3(c)
        else:
            x = v(a)
            a += 1
            for _ in range(n):
                x &= c
                vram[d & 0x3FFF] = x
                d += 1
                if gira:
                    c = rrc3(c)


def escrituras(dir_):
    for ln in open(os.path.join(dir_, "escrituras.txt")):
        m = PAT.match(ln.strip())
        if m:
            pc, hl, de, bc, a, f, t, cuenta, datos = m.groups()
            if cuenta:
                a = cuenta                   # p01:63A7: 0xE203; p08:8120: 0xE3F2
            yield (int(pc, 16), int(hl, 16), int(de, 16), int(bc, 16), int(a, 16),
                   tuple(int(f[i:i + 2], 16) for i in (0, 2, 4)), float(t), datos)


def rehace(dir_, hasta):
    vram = bytearray(0x4000)
    origen = {}
    for pc, hl, de, bc, a, bancos, t, datos in escrituras(dir_):
        if t > hasta:
            break
        if pc == 0x004D:
            vram[hl & 0x3FFF] = a
        elif pc == 0x0056:
            for i in range(bc):
                vram[(hl + i) & 0x3FFF] = a
        elif pc == 0x005C:
            if hl < 0x4000:
                continue                     # la BIOS (C-BIOS copia su fuente al arrancar)
            if hl >= 0xC000:
                b = bytes.fromhex(datos or "")
            else:
                v = Ventana(bancos)
                b = bytes(v(hl + i) for i in range(bc))
                origen[(de, bc)] = hl
            for i in range(min(bc, len(b))):
                vram[(de + i) & 0x3FFF] = b[i]
        elif pc == 0x4F7F:
            rachas(vram, Ventana(bancos), de, hl)
        elif pc == 0x5ACC:                   # p00:5AD1: 8 bytes de DE en HL
            v = Ventana(bancos)
            for i in range(8):
                vram[(hl + i) & 0x3FFF] = v(de + i)
        elif pc == 0x56CB:                   # p00:56D0: letras de 0xA068 + 8 x n, n de la lista DE
            v = Ventana(bancos)
            d = hl
            while not v(de) & 0x80:
                for i in range(8):
                    vram[d & 0x3FFF] = v(0xA068 + 8 * v(de) + i)
                    d += 1
                de += 1
        elif pc == 0x8120 and bancos[1] == 8:   # p08:8123: rachas con la mascara C
            rachas_mascara(vram, Ventana(bancos), de, hl, bc & 0xFF, a == 0)
        elif pc == 0x63A7 and bancos[0] == 1:   # p01:63B2: 10 sprites de 0x63D2 a 0x3B00
            v = Ventana(bancos)
            for k in range(10):
                y, x, n, c = (v(0x63D2 + 4 * k + i) for i in range(4))
                vram[0x3B00 + 4 * k:0x3B04 + 4 * k] = bytes((y, x, (n + (a & 8)) & 0xFF, c))
        elif pc == 0x65BA and bancos[0] == 1:   # p01:65BE: 64 bytes de HL en 0x31E0
            v = Ventana(bancos)
            for i in range(64):
                vram[0x31E0 + i] = v(hl + i)
            origen[(hl, 0)] = de
    return vram, origen


def coteja(dir_, et):
    real = open(os.path.join(dir_, "vram-%s.bin" % et), "rb").read()
    mio, _ = rehace(dir_, float(et))
    zonas = (("colores", 0x0000, 0x1800), ("sprites", 0x1800, 0x2000), ("dibujos", 0x2000, 0x3800),
             ("nombres", 0x3800, 0x3B00), ("atributos", 0x3B00, 0x3B80))
    partes = []
    for nom, a, b in zonas:
        d = sum(1 for i in range(a, b) if real[i] != mio[i])
        partes.append("%s %d" % (nom, d))
    print("%s: bytes distintos: %s" % (et, ", ".join(partes)))


def coteja_cuadros(dir_, segundos, salida=None):
    """La VRAM rehecha en cada segundo contra el cuadro grabado (VRAM_CUADROS)
    mas cercano por detras; con salida, el png de la rehecha con los registros
    de ese cuadro (salida % segundo)."""
    import vdp
    pedidos = sorted(segundos)
    hechos = {}
    for t, vr, r in vdp.cuadros(dir_):
        for s in pedidos:
            if t <= s:
                hechos[s] = (t, vr, r)
    for s in pedidos:
        t, real, r = hechos[s]
        mio, _ = rehace(dir_, t)
        d = sum(1 for a, b in zip(real, mio) if a != b)
        print("%.3f (cuadro %.3f): %d bytes distintos" % (s, t, d))
        if salida:
            vdp.pinta_vdp(mio, r).save(salida % s)


def main(argv):
    if len(argv) >= 4 and argv[1] == "coteja":
        for et in argv[3:]:
            coteja(argv[2], et)
    elif len(argv) >= 5 and argv[1] == "png":
        import vdp
        esc = int(argv[argv.index("--escala") + 1]) if "--escala" in argv else 1
        mio, _ = rehace(argv[2], float(argv[3]))
        _, r, _ = vdp.lee(argv[2], argv[3])
        vdp.pinta_vdp(mio, r, esc).save(argv[4])
    elif len(argv) >= 4 and argv[1] == "cuadros":
        sal = argv[argv.index("--png") + 1] if "--png" in argv else None
        ts = [float(x) for x in argv[3:] if not x.startswith("--") and x != sal]
        coteja_cuadros(argv[2], ts, sal)
    elif len(argv) >= 5 and argv[1] == "vram":
        mio, _ = rehace(argv[2], float(argv[3]))
        open(argv[4], "wb").write(mio)
    else:
        sys.exit(__doc__)
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
