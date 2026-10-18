#!/usr/bin/env python3
"""Lo que se ha MEDIDO de los dos cartuchos, clavado para que no se deshaga solo.

Estas comprobaciones necesitan las dos ROM, y si no estan **fallan**: no se
saltan. Un test que se salta no comprueba nada y en verde daria la impresion
contraria. Quien clone esto sin poner sus copias vera fallar este fichero con
un mensaje que dice exactamente que falta.

Cada una corresponde a una afirmacion de la web o de las notas, y todas leen
el binario: ninguna compara una constante contra si misma.
"""
import hashlib
import os
import re
import subprocess
import sys
import unittest

RAIZ = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
TOOLS = os.path.join(RAIZ, "tools")
sys.path.insert(0, TOOLS)

from paginas import COMUNES, ORG, PREFIJO   # noqa: E402

SHA = {"msx1": "87a51e8744c0dafa0ab27d8b3b16585cfb5f76673ec62ad05c49c58384ce81b8",
       "msx2": "c7f138f16ddb8c8bf7af2fbd136c1f949ab95c375205375a3509d8ad32e00d93"}
RC = {"msx1": 0x60, "msx2": 0x61}
INIT = {"msx1": 0x40A8, "msx2": 0x40A3}
# p00 de la rutina del trio 1-2-3 (las demas saltan a ella)
TRIO = {"msx1": 0x4192, "msx2": 0x418A}


def ruta(v):
    return os.path.join(RAIZ, "%s_%s.rom" % (PREFIJO, v))


def leer_rom(v):
    if not os.path.exists(ruta(v)):
        raise AssertionError(
            "falta %s en la raiz del repo. Son los 131.072 bytes de King's Valley II "
            "(Konami, 1988, RC-7%02X) y no se distribuyen aqui: pon tu copia. El sha256 "
            "tiene que ser %s" % (os.path.basename(ruta(v)), RC[v], SHA[v]))
    with open(ruta(v), "rb") as f:
        return f.read()


def b(rom, banco, a, n=1):
    """n bytes del banco en la direccion a (con su org)."""
    o = banco * 0x2000 + (a - ORG[banco])
    return rom[o:o + n]


def con_variante(v, codigo):
    r = subprocess.run([sys.executable, "-c", codigo], capture_output=True, text=True,
                       cwd=TOOLS, env=dict(os.environ, VARIANTE=v))
    return r


class Cartuchos(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        cls.rom = {v: leer_rom(v) for v in ("msx1", "msx2")}

    def test_son_las_mismas_rom(self):
        for v, d in self.rom.items():
            self.assertEqual(len(d), 131072)
            self.assertEqual(hashlib.sha256(d).hexdigest(), SHA[v], v)

    def test_cabecera_ab(self):
        """0x4000 'AB', su INIT y los otros tres vectores a cero."""
        for v, d in self.rom.items():
            self.assertEqual(d[0:2], b"AB")
            self.assertEqual(d[2] | (d[3] << 8), INIT[v], v)
            self.assertEqual(d[4:10], b"\x00" * 6)

    def test_segunda_cabecera_de_konami(self):
        """0x4010: 'CD', 0x07 y 0x60 / 0x61, o sea RC-760 y RC-761."""
        for v, d in self.rom.items():
            self.assertEqual(d[0x10:0x14], bytes([0x43, 0x44, 0x07, RC[v]]), v)

    def test_bancos_comunes(self):
        """Los de paginas.COMUNES son iguales byte a byte en los dos, y ningun
        otro lo es."""
        a, c = self.rom["msx1"], self.rom["msx2"]
        iguales = tuple(p for p in range(16)
                        if a[p * 0x2000:(p + 1) * 0x2000] == c[p * 0x2000:(p + 1) * 0x2000])
        self.assertEqual(iguales, COMUNES)

    def test_banco_9_vacio_en_msx1(self):
        """En el cartucho de MSX el banco 9 es 0xFF de punta a punta."""
        self.assertEqual(self.rom["msx1"][9 * 0x2000:10 * 0x2000], b"\xFF" * 0x2000)
        self.assertNotEqual(self.rom["msx2"][9 * 0x2000:10 * 0x2000], b"\xFF" * 0x2000)

    def test_mapper_konami_con_scc(self):
        """Escrituras a 0x7000, 0x9000 y 0xB000 y ni una a 0x6000 ni a 0xA000."""
        for d in self.rom.values():
            for reg in (0x7000, 0x9000, 0xB000):
                self.assertIn(bytes([0x32, reg & 0xFF, reg >> 8]), d)
            for reg in (0x6000, 0xA000):
                self.assertNotIn(bytes([0x32, reg & 0xFF, reg >> 8]), d)

    def test_0x8000_solo_en_otro_cartucho(self):
        """Las once escrituras a 0x8000 son las de cartucho.OTRO_SLOT, todas en
        el banco 1 y todas tras `ld h,0x80 / call 0x0024 (ENASLT) / ld a,4`."""
        for v, d in self.rom.items():
            sitios, i = set(), d.find(bytes([0x32, 0x00, 0x80]))
            while i >= 0:
                sitios.add((i // 0x2000, ORG[i // 0x2000] + i % 0x2000))
                self.assertEqual(d[i - 7:i], bytes([0x26, 0x80, 0xCD, 0x24, 0x00, 0x3E, 0x04]))
                i = d.find(bytes([0x32, 0x00, 0x80]), i + 1)
            r = con_variante(v, "from cartucho import OTRO_SLOT; print(sorted(OTRO_SLOT))")
            self.assertEqual(r.returncode, 0, r.stderr)
            self.assertEqual(r.stdout.strip(), str(sorted(sitios)), v)
            self.assertEqual(len(sitios), 11)

    def test_regla_banco_org(self):
        """tools/reconocimiento.py: toda escritura con banco conocido lo pone en
        la ranura que dice tools/paginas.py (exit 0), en los dos cartuchos."""
        for v in self.rom:
            r = subprocess.run([sys.executable, os.path.join(TOOLS, "reconocimiento.py"), ruta(v)],
                               capture_output=True, text=True, cwd=TOOLS,
                               env=dict(os.environ, VARIANTE=v))
            self.assertEqual(r.returncode, 0, r.stdout + r.stderr)
            self.assertIn("OK: la regla banco -> org", r.stdout)

    def test_trios(self):
        """El trio: `push af / ld a,1 / di / push hl / ld hl,0xF0F1 / ld (hl),a /
        ld (0x7000),a`, y detras 4, 7 y 10 con `push af / ld a,N / jr` a su
        `di`: los mismos bytes en los dos, 8 bytes antes en el de MSX2."""
        for v, d in self.rom.items():
            t = TRIO[v]
            self.assertEqual(b(d, 0, t, 10), bytes([
                0xF5, 0x3E, 0x01, 0xF3, 0xE5, 0x21, 0xF1, 0xF0, 0x77, 0x32]), v)
            for k, n in enumerate((4, 7, 10)):
                self.assertEqual(b(d, 0, t + 0x1C + 5 * k, 4),
                                 bytes([0xF5, 0x3E, n, 0x18]), (v, n))
        self.assertEqual(TRIO["msx1"] - TRIO["msx2"], 8)

    def test_gancho_de_interrupcion(self):
        """El arranque engancha 0x402E: la MSX1 en H.KEYI (0xFD9A), la MSX2
        en H.TIMI (0xFD9F)."""
        self.assertIn(bytes([0x3E, 0xC3, 0x32, 0x9A, 0xFD, 0x21, 0x2E, 0x40, 0x22, 0x9B, 0xFD]),
                      self.rom["msx1"][:0x2000])
        self.assertIn(bytes([0x3E, 0xC3, 0x32, 0x9F, 0xFD, 0x21, 0x2E, 0x40, 0x22, 0xA0, 0xFD]),
                      self.rom["msx2"][:0x2000])

    def test_un_solo_despachador(self):
        """`pop hl / add a,a / call 0x4094 / ld a,(hl) / inc hl / ld h,(hl) /
        ld l,a / jp (hl)`: uno por cartucho (p00:409E y p00:4099)."""
        for v, a in (("msx1", 0x409E), ("msx2", 0x4099)):
            d = self.rom[v]
            ayu = a - 10
            firma = bytes([0xE1, 0x87, 0xCD, ayu & 0xFF, ayu >> 8, 0x7E, 0x23, 0x66, 0x6F, 0xE9])
            self.assertEqual(d.find(firma), a - 0x4000, v)
            self.assertEqual(d.count(firma), 1)


class Maquinaria(unittest.TestCase):

    def test_makefile_y_paginas_dicen_lo_mismo(self):
        """Los ORG_NN y COMUNES del Makefile son los de tools/paginas.py."""
        mk = open(os.path.join(RAIZ, "Makefile"), encoding="utf-8").read()
        for p in range(16):
            m = re.search(r"^ORG_%02d = (0x[0-9a-f]+)$" % p, mk, re.M)
            self.assertEqual(int(m.group(1), 16), ORG[p], p)
        m = re.search(r"^COMUNES  = (.*)$", mk, re.M)
        self.assertEqual(tuple(int(x) for x in m.group(1).split()), COMUNES)


if __name__ == "__main__":
    unittest.main()
