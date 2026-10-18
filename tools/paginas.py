#!/usr/bin/env python3
"""La regla banco -> direccion del MegaROM, compartida por todas las herramientas.

King's Valley II - The Seal of El Giza (Konami, 1988) son DOS cartuchos de
128 KB, RC-760 para MSX y RC-761 para MSX2, los dos con el mapper Konami CON
SCC: 16 bancos de 8 KB que se eligen escribiendo el numero de banco en 0x5000
(para 0x4000-0x5FFF), 0x7000 (0x6000-0x7FFF), 0x9000 (0x8000-0x9FFF) y 0xB000
(0xA000-0xBFFF). Escribir 0x3F en 0x9000 no pone un banco: enciende el SCC en
0x9800-0x9FFF.

Lo que dicen las dos ROM (tools/reconocimiento.py lo vuelve a medir cada vez,
con VARIANTE=msx1 y con VARIANTE=msx2; las direcciones, MSX1 / MSX2):
  - 0x5000 solo lo escribe el arranque de la MSX1 (p00:40F5), con un 0; la
    MSX2 no lo toca. El banco 0 se queda fijo en 0x4000.
  - Los trios se meten con `ld a,N` / `inc a` / `inc a` desde p00:4192 /
    p00:418A: 1-2-3, 4-5-6 (p00:41AE / 41A6), 7-8-9 (41B3 / 41AB) y 10-11-12
    (41B8 / 41B0) llenan de golpe 0x6000-0xBFFF.
  - Sueltos en 0xA000: el 12 (41BD / 41B5), el 15 (41C2 / 41BA) y el 13
    (41C7 / 41BF); y 14-15 en 0x8000-0xBFFF (41D4 / 41CC).
    Nadie pone un banco en dos ranuras distintas, y el reparto es el mismo en
    los dos cartuchos.

Uso como programa:
    paginas.py org <n>               imprime el org del banco n
    paginas.py lista                 imprime "n org" para los 16
    paginas.py corta <rom> <dir>     escribe <dir>/pNN.bin con cada banco
"""
import os
import sys


TAM_PAGINA = 0x2000
N_PAGINAS = 16

# El nombre de los ficheros: <PREFIJO>_msx1.rom, <PREFIJO>_msx2.rom y los
# listados <PREFIJO>_[variante_]pNN.asm (tools/fuentes.py).
PREFIJO = "kv2"

# Los bancos que son iguales byte a byte en los dos cartuchos: se desensamblan
# una vez (src/comun) y entran en los dos. Un test lo comprueba sobre las ROM.
COMUNES = (4, 5, 6, 10, 11, 13)

# banco -> direccion de ejecucion. Medido, no supuesto: ver reconocimiento.py.
ORG = {0: 0x4000,
       1: 0x6000, 2: 0x8000, 3: 0xA000,
       4: 0x6000, 5: 0x8000, 6: 0xA000,
       7: 0x6000, 8: 0x8000, 9: 0xA000,
       10: 0x6000, 11: 0x8000, 12: 0xA000,
       13: 0xA000,                      # p00:41C7 / 41BF, solo en 0xA000
       14: 0x8000, 15: 0xA000}          # p00:41D4 / 41CC

# Registro del mapper -> ranura que gobierna (Konami con SCC).
REGISTROS = {0x5000: 0x4000, 0x7000: 0x6000, 0x9000: 0x8000, 0xB000: 0xA000}

# Los registros del OTRO mapper Konami: nadie de este cartucho escribe en
# ellos, salvo las escrituras de OTRO_SLOT.
AJENOS = (0x6000, 0x8000, 0xA000)

# Las escrituras a un registro ajeno que van a otro slot (las de 0x8000 del
# banco 1) cambian de sitio de un cartucho a otro: estan en
# tools/cartucho.py, OTRO_SLOT.

# Valores escritos en un registro que no son un banco: (registro, valor).
NO_BANCO = {(0x9000, 0x3F): "enciende el SCC en 0x9800"}

# Escrituras al mapper que ponen un banco fuera de su ranura, medidas en
# reconocimiento.py: (banco, pc de la escritura) -> ranura.
EXCEPCIONES = {}

NUNCA_MAPEADOS = ()


def org(p):
    """Direccion en la que se ejecuta el banco p."""
    return ORG[p]


def nombre(p):
    """Nombre del modulo del banco p: p00..p15."""
    return "p%02d" % p


def main(argv):
    if len(argv) < 2:
        sys.exit(__doc__)
    if argv[1] == "org":
        print("%#06x" % org(int(argv[2], 10)))
    elif argv[1] == "lista":
        for p in range(N_PAGINAS):
            print("%d %#06x" % (p, org(p)))
    elif argv[1] == "corta":
        rom, dst = argv[2], argv[3]
        d = open(rom, "rb").read()
        if len(d) != TAM_PAGINA * N_PAGINAS:
            sys.exit("la ROM mide %d bytes y no %d" % (len(d), TAM_PAGINA * N_PAGINAS))
        os.makedirs(dst, exist_ok=True)
        for p in range(N_PAGINAS):
            with open(os.path.join(dst, nombre(p) + ".bin"), "wb") as f:
                f.write(d[p * TAM_PAGINA:(p + 1) * TAM_PAGINA])
        print("16 bancos de %d bytes en %s/" % (TAM_PAGINA, dst))
    else:
        sys.exit(__doc__)


if __name__ == "__main__":
    main(sys.argv)
