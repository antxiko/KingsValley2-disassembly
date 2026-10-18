#!/usr/bin/env python3
"""El cartucho ejecutado de verdad para pintar: Z80 + mapper SCC + V9938.

Las imagenes del juego no se rehacen a mano: se ejecuta el codigo del
cartucho (tools/z80run.py) con lo justo de una maquina para que pinte en la
VRAM como en un MSX, y luego se mira la VRAM. Lo que hay:

- EL MAPPER Konami SCC: escribir en 0x5000-0x57FF, 0x7000-0x77FF,
  0x9000-0x97FF o 0xB000-0xB7FF pone el banco en 0x4000, 0x6000, 0x8000 o
  0xA000. Lo demas de 0x4000-0xBFFF es ROM y no se escribe.
- LA BIOS: no hay; las llamadas que hace el juego (WRTVDP, NSTWRT, LDIRVM,
  BIGFIL, CHGMOD...) se atrapan por su direccion y se hacen en Python. Una
  llamada que no esta en BIOS revienta (como un opcode que z80run no sabe).
- EL VDP de MSX2 (V9938) en lo que usa este juego: 128 KB de VRAM, los
  puertos 0x98 (dato), 0x99 (direccion, registros y estado), 0x9A (paleta) y
  0x9B (registros indirectos), y las ordenes HMMC, YMMM, HMMM, HMMV, LMMM
  (con su operacion logica) y LINE, que acaban en el acto. El estado S#2
  dice "transferencia lista" (TR) siempre y "orden en marcha" (CE) solo
  mientras una HMMC espera bytes.
- EL VDP de MSX1 (TMS9918, 16 KB) para el otro cartucho: el de z80run.

Que NO hay: interrupciones, tiempos, PSG (se apunta y ya), sprites pintados
por el chip (se pintan aparte con sus tablas).

Uso (como modulo): m = Msx(rom, msx2=True); m.arranca(); m.llama(0x5C80)
"""
import os
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, AQUI)
from z80run import Z80, ParadaZ80, Maquina, Vdp   # noqa: E402


class V9938:
    def __init__(self):
        self.vram = bytearray(0x20000)
        self.r = bytearray(64)
        self.pal = [(0, 0, 0)] * 16
        self.medio = None
        self.dir = 0
        self.pal_medio = None
        self.hmmc = None          # [x, y, nx, ny, i] mientras una HMMC espera bytes

    # --------------------------------------------------------------- puertos
    def puerto(self, p, v):
        if p == 0x98:
            self.vram[self.dir & 0x1FFFF] = v
            self.dir = (self.dir + 1) & 0x1FFFF
        elif p == 0x99:
            if self.medio is None:
                self.medio = v
                return
            m, self.medio = self.medio, None
            if v & 0x80:
                self.registro(v & 0x3F, m)
            else:
                self.dir = ((self.r[14] & 7) << 14) | ((v & 0x3F) << 8) | m
        elif p == 0x9A:
            if self.pal_medio is None:
                self.pal_medio = v
            else:
                rb = self.pal_medio
                self.pal_medio = None
                self.pal[self.r[16] & 15] = ((rb >> 4) & 7, v & 7, rb & 7)
                self.r[16] = (self.r[16] + 1) & 15
        elif p == 0x9B:
            n = self.r[17] & 0x3F
            if not self.r[17] & 0x80:
                self.r[17] = (self.r[17] & 0xC0) | ((n + 1) & 0x3F)
            if n != 17:
                self.registro(n, v)

    def lee(self, p):
        if p == 0x98:
            v = self.vram[self.dir & 0x1FFFF]
            self.dir = (self.dir + 1) & 0x1FFFF
            return v
        if p == 0x99:
            self.medio = None
            s = self.r[15] & 15
            if s == 2:
                return 0x80 | (1 if self.hmmc else 0)
            return 0
        return 0xFF

    def registro(self, n, v):
        self.r[n] = v
        if n == 44 and self.hmmc:
            self._hmmc_byte(v)
        elif n == 46:
            self.orden(v)

    # --------------------------------------------------------------- ordenes
    def _w(self, a, b):
        return self.r[a] | (self.r[b] << 8)

    def punto(self, x, y):
        b = self.vram[((y & 1023) * 128 + ((x & 255) >> 1)) & 0x1FFFF]
        return b >> 4 if not x & 1 else b & 15

    def pon(self, x, y, c, op=0):
        if op & 8 and c == 0:
            return
        o = ((y & 1023) * 128 + ((x & 255) >> 1)) & 0x1FFFF
        d = self.vram[o] >> 4 if not x & 1 else self.vram[o] & 15
        c = {0: c, 1: d & c, 2: d | c, 3: d ^ c, 4: (~c) & 15}[op & 7]
        if not x & 1:
            self.vram[o] = (self.vram[o] & 0x0F) | (c << 4)
        else:
            self.vram[o] = (self.vram[o] & 0xF0) | c

    def orden(self, v):
        cmd, op = v >> 4, v & 15
        sx, sy = self._w(32, 33) & 511, self._w(34, 35) & 1023
        dx, dy = self._w(36, 37) & 511, self._w(38, 39) & 1023
        nx, ny = self._w(40, 41) & 511, self._w(42, 43) & 1023
        nx, ny = nx or 512, ny or 1024
        arg = self.r[45]
        ix = -1 if arg & 4 else 1
        iy = -1 if arg & 8 else 1
        if cmd == 0xD:                      # HMMM: bytes
            for j in range(ny):
                for i in range(0, nx, 2):
                    self.pon_byte(dx + ix * i, dy + iy * j, self.byte(sx + ix * i, sy + iy * j))
        elif cmd == 0xC:                    # HMMV
            for j in range(ny):
                for i in range(0, nx, 2):
                    self.pon_byte(dx + ix * i, dy + iy * j, self.r[44])
        elif cmd == 0xE:                    # YMMM: de DX al borde
            fin = 256 if ix > 0 else -1
            for j in range(ny):
                for x in range(dx, fin, 2 * ix):
                    self.pon_byte(x, dy + iy * j, self.byte(x, sy + iy * j))
        elif cmd == 0x9:                    # LMMM: puntos, con la operacion
            for j in range(ny):
                for i in range(nx):
                    self.pon(dx + ix * i, dy + iy * j, self.punto(sx + ix * i, sy + iy * j), op)
        elif cmd == 0x8:                    # LMMV
            for j in range(ny):
                for i in range(nx):
                    self.pon(dx + ix * i, dy + iy * j, self.r[44] & 15, op)
        elif cmd == 0x7:                    # LINE
            maj = arg & 1
            largo, corto = self._w(40, 41) & 1023, self._w(42, 43) & 1023
            x, y, e = dx, dy, 0
            for k in range(largo + 1):
                self.pon(x, y, self.r[44] & 15, op)
                if maj:
                    y += iy
                else:
                    x += ix
                e += corto
                if largo and e * 2 >= largo:
                    e -= largo
                    if maj:
                        x += ix
                    else:
                        y += iy
        elif cmd == 0xF:                    # HMMC: el primer byte ya esta en CLR
            self.hmmc = [dx, dy, nx, ny, 0, ix, iy]
            self._hmmc_byte(self.r[44])
        elif cmd == 0:
            self.hmmc = None
        else:
            raise ParadaZ80("orden del VDP 0x%02X sin hacer" % v)

    def byte(self, x, y):
        return self.vram[((y & 1023) * 128 + ((x & 255) >> 1)) & 0x1FFFF]

    def pon_byte(self, x, y, v):
        self.vram[((y & 1023) * 128 + ((x & 255) >> 1)) & 0x1FFFF] = v

    def _hmmc_byte(self, v):
        dx, dy, nx, ny, i, ix, iy = self.hmmc
        por_fila = (nx + 1) // 2
        j, k = divmod(i, por_fila)
        self.pon_byte(dx + ix * 2 * k, dy + iy * j, v)
        i += 1
        if i >= por_fila * ny:
            self.hmmc = None
        else:
            self.hmmc[4] = i

    # --------------------------------------------------------------- imagen
    def rgb(self, c):
        return tuple(x * 255 // 7 for x in self.pal[c & 15])

    def pagina(self, pag, alto=212):
        """La pagina pag de SCREEN 5 como imagen (PIL)."""
        from PIL import Image
        im = Image.new("RGB", (256, alto))
        px = im.load()
        base = pag * 256
        for y in range(alto):
            for x in range(256):
                px[x, y] = self.rgb(self.punto(x, base + y))
        return im

    def sprites(self, im):
        """Los 32 sprites del modo 2 encima de im, como los pinta el chip: la tabla de
        atributos de R5/R11 (y = 216 acaba), la de colores 0x200 por debajo (un
        color por linea; el bit 7, EC, lo corre 32 puntos a la izquierda), los
        dibujos de R6, 16 x 16 con el bit 1 de R1 y ampliados al doble con el bit 0.
        El bit 6, CC: un sprite con CC va en el grupo del anterior sin CC, con su
        misma prioridad; el grupo se pinta entero (lo que tapa cada uno) y donde se
        tapan sus colores se suman con OR. Un CC sin sprite delante no se ve. El
        color 0 es transparente: no tapa lo que hay debajo."""
        px = im.load()
        attr = ((self.r[11] & 3) << 15) | ((self.r[5] & 0xFC) << 7)
        cols = attr - 0x200
        pat = (self.r[6] & 0x3F) << 11
        grande = 16 if self.r[1] & 2 else 8
        amp = 2 if self.r[1] & 1 else 1
        lista = []
        for n in range(32):
            y = self.vram[attr + 4 * n]
            if y == 216:
                break
            lista.append(n)
        visto = {}          # lo ya pintado por los grupos de mas prioridad
        grupo = None        # el grupo en curso: {punto: color}

        def cierra():
            for k, c in grupo.items():
                if c and k not in visto:
                    visto[k] = c
        for n in lista:
            y, x, d = self.vram[attr + 4 * n:attr + 4 * n + 3]
            if grande == 16:
                d &= 0xFC
            y = (y + 1) & 0xFF
            cc_sprite = self.vram[cols + 16 * n] & 0x40
            if not cc_sprite:
                if grupo is not None:
                    cierra()
                grupo = {}
            elif grupo is None:
                continue                         # CC sin sprite delante
            for fila in range(grande):
                c = self.vram[cols + 16 * n + fila]
                color = c & 15
                dx = x - 32 if c & 0x80 else x
                for col in range(grande):
                    b = self.vram[pat + 8 * d + (col // 8) * 16 + fila]
                    if not (b >> (7 - col % 8)) & 1:
                        continue
                    for ay in range(amp):
                        for ax in range(amp):
                            xx, yy = dx + col * amp + ax, (y + fila * amp + ay) & 0xFF
                            if 0 <= xx < 256 and yy < im.height:
                                grupo[(xx, yy)] = grupo.get((xx, yy), 0) | color
        if grupo is not None:
            cierra()
        for (xx, yy), c in visto.items():
            px[xx, yy] = self.rgb(c)
        return im


class MaquinaMsx(Maquina):
    def __init__(self, msx2):
        super().__init__()
        self.msx2 = msx2
        if msx2:
            self.vdp = V9938()

    def escribe(self, p, v):
        p &= 0xFF
        if self.msx2 and p in (0x98, 0x99, 0x9A, 0x9B):
            self.vdp.puerto(p, v & 0xFF)
        else:
            super().escribe(p, v)

    def lee(self, p):
        p &= 0xFF
        if self.msx2 and p in (0x98, 0x99):
            return self.vdp.lee(p)
        return super().lee(p)


class Msx(Z80):
    def __init__(self, rom, msx2):
        super().__init__()
        self.rom = rom
        self.msx2 = msx2
        self.maq = MaquinaMsx(msx2)
        self.vdp = self.maq.vdp
        self.bancos = {}
        for ventana, b in ((0x4000, 0), (0x6000, 1), (0x8000, 2), (0xA000, 3)):
            self.pon_banco(ventana, b)
        self.mem[0x0006] = self.mem[0x0007] = 0x98    # los puertos del VDP de la BIOS
        self.mem[0x002B] = 0x11                        # BIOS no japonesa
        self.mem[0xFFA7] = 0xC9                        # H.PHYD: sin disco
        self.psg_escrito = []
        self.teclas = {}          # fila: valor (los bits a 0, pulsados)
        self.tolera_bios = False
        self.bios_rara = []
        self.mando = 0xFF

    def pon_banco(self, ventana, banco):
        self.bancos[ventana] = banco
        b = banco % (len(self.rom) // 0x2000)
        self.mem[ventana:ventana + 0x2000] = self.rom[b * 0x2000:(b + 1) * 0x2000]

    def _escribir(self, d, v):
        d &= 0xFFFF
        v &= 0xFF
        if 0x4000 <= d < 0xC000:
            if (d & 0x1800) == 0x1000:
                self.pon_banco(d & 0xE000, v)
            return
        self.mem[d] = v

    # --------------------------------------------------------------- BIOS
    def pon_registro(self, n, x):
        """Un registro del VDP y su copia en la RAM de la BIOS (RG0SAV-RG7SAV en
        0xF3DF, RG8SAV-RG23SAV en 0xFFE7): el juego lee esas copias para cambiar un
        bit (p00:4EBE apaga la pantalla con la de R#1)."""
        if self.msx2:
            self.vdp.registro(n, x)
        else:
            self.vdp.regs[n & 7] = x
        if n < 8:
            self.mem[0xF3DF + n] = x
        elif n < 24:
            self.mem[0xFFE7 + n - 8] = x

    def _vram16(self, a):
        return a & (0xFFFF if self.msx2 else 0x3FFF)

    def bios(self, pc):
        v = self.vdp
        hl = (self.h << 8) | self.l
        de = (self.d << 8) | self.e
        bc = (self.b << 8) | self.c
        if pc == 0x0047:                                  # WRTVDP
            self.pon_registro(self.c & 0x3F, self.b)
        elif pc in (0x0171, 0x0053):                      # NSTWRT / SETWRT
            v.dir = self._vram16(hl)
        elif pc in (0x0174, 0x004A):                      # NRDVRM / RDVRM
            self.a = v.vram[self._vram16(hl)]
        elif pc in (0x0177, 0x004D):                      # NWRVRM / WRTVRM
            v.vram[self._vram16(hl)] = self.a
        elif pc == 0x005C:                                # LDIRVM
            for k in range(bc):
                v.vram[self._vram16(de + k)] = self.mem[(hl + k) & 0xFFFF]
        elif pc == 0x0059:                                # LDIRMV
            for k in range(bc):
                self.mem[(de + k) & 0xFFFF] = v.vram[self._vram16(hl + k)]
        elif pc in (0x016B, 0x0056):                      # BIGFIL / FILVRM
            for k in range(bc):
                v.vram[self._vram16(hl + k)] = self.a
        elif pc == 0x005F:                                # CHGMOD
            if self.msx2 and self.a == 5:
                for r, x in ((0, 0x06), (1, 0x60), (2, 0x1F), (5, 0xEF), (6, 0x0F),
                             (8, 0x08), (9, 0x00), (11, 0x00)):
                    self.pon_registro(r, x)
        elif pc == 0x0138:                                # RSLREG
            self.a = 0
        elif pc == 0x0141:                                # SNSMAT: la fila A
            self.a = self.teclas.get(self.a & 15, 0xFF)
        elif pc == 0x0093:                                # WRTPSG
            self.psg_escrito.append((self.a & 15, self.e))
        elif pc == 0x0096:                                # RDPSG: el 14, el mando
            self.a = self.mando if (self.a & 15) == 14 else 0xFF
        elif pc == 0x000C:                                # RDSLT
            self.a = 0xFF
        elif pc == 0x013E:                                # RDVDP
            self.a = 0
        elif pc in (0x0024, 0x0062, 0x0090, 0x0041, 0x0044):   # ENASLT, CHGCLR, GICINI, DISSCR, ENASCR
            pass
        elif self.tolera_bios:
            # el juego salta a la BIOS por un sitio que no es una de sus entradas (el
            # final: p01:7835 con 0xE881 pisado); aqui se vuelve sin hacer nada y se apunta
            self.bios_rara.append(pc)
        else:
            raise ParadaZ80("llamada a la BIOS 0x%04X sin hacer" % pc)

    def corre(self, desde, tope=60_000_000, hasta=None):
        centinela = 0xFFFE
        if hasta is None:
            self.sp = (self.sp - 2) & 0xFFFF
            self._escribir16(self.sp, centinela)
        self.pc = desde
        self.pasos = 0
        fin = hasta if hasta is not None else centinela
        while self.pc != fin:
            if self.pc < 0x4000:
                self.bios(self.pc)
                self.pc = self._pop()
                continue
            self.pasos += 1
            if self.pasos > tope:
                raise ParadaZ80("mas de %d instrucciones" % tope)
            self._una()

    # --------------------------------------------------------------- uso
    def arranca(self):
        """El arranque del cartucho hasta el bucle sin fin (todo lo demas va en la
        interrupcion)."""
        self.sp = 0xF380
        if self.msx2:
            self.corre(0x40B5, hasta=0x4124)
        else:
            self.corre(0x40C4, hasta=0x4127)

    def llama(self, donde, **regs):
        for k, x in regs.items():
            setattr(self, k, x)
        self.sp = 0xDFF0
        self.corre(donde)
