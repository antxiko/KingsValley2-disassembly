#!/usr/bin/env python3
"""Lo que el trazador de cartucho entero (tools/bancos.py) necesita saber de
ESTE cartucho: donde esta el despachador, como cambia de banco y por donde
arranca. bancos.py es maquinaria y no lleva direcciones de ningun juego; las
lee de aqui.

King's Valley II - The Seal of El Giza (Konami, 1988): RC-760 para MSX y
RC-761 para MSX2, los dos con el mapper Konami con SCC. Las direcciones del
banco 0 cambian de uno a otro (la MSX2 va 8 bytes por delante en las rutinas
de banco), asi que van por variante (tools/variante.py). Todo medido sobre los
bytes (tools/reconocimiento.py repasa cada escritura al mapper).
"""
from variante import elige

# El despachador de Konami: `pop hl / add a,a / call p00:4094 (add a,l /
# ld l,a / ret nc / inc h / ret) / ld a,(hl) / inc hl / ld h,(hl) / ld l,a /
# jp (hl)`, con la tabla de destinos pegada detras del `call`. Es el unico
# `pop hl / add a,a` con `jp (hl)` de cada ROM, y los dos tienen 42 llamadas.
DESPACHADOR = elige({"msx1": 0x409E, "msx2": 0x4099})
DESPACHADORES = (DESPACHADOR,)

# Escrituras a un registro ajeno que van a otro slot (banco, pc): las once
# `ld (0x8000),a` del banco 1, con A = 4, tras `ld a,(0xF0F7) / ld h,0x80 /
# call 0x0024` (ENASLT): van al cartucho de la ranura de 0xF0F7.
OTRO_SLOT = elige({
    "msx1": {(1, a) for a in (0x6AB6, 0x6ADA, 0x6B0D, 0x6B39, 0x6B66, 0x6B8A,
                              0x6BBD, 0x6BE5, 0x6C0D, 0x6C69, 0x6C97)},
    "msx2": {(1, a) for a in (0x6CB5, 0x6CD9, 0x6D0C, 0x6D38, 0x6D65, 0x6D89,
                              0x6DBC, 0x6DE4, 0x6E0C, 0x6E68, 0x6E96)},
})

# Y las once `call 0x8000` que van detras (9 bytes despues de cada escritura,
# tras `ld c,N / ld de,(0xF0E0)`): llaman al 0x8000 de ESE cartucho, no al
# banco 2 de este. El trazador no las sigue (bancos.py).
LLAMADAS_FUERA = {(b, a + 9) for b, a in OTRO_SLOT}

# Registro del mapper -> casilla del reparto (0x6000, 0x8000, 0xA000). El de
# 0x5000 no esta: solo lo escribe el arranque de la MSX1 (p00:40F5), con un 0.
RANURA_REG = {0x7000: 0, 0x9000: 1, 0xB000: 2}

# Las copias en RAM de los registros: 0xF0F1/0xF0F2/0xF0F3, que las rutinas
# de banco escriben junto al registro y que la interrupcion y la llamada al
# sonido leen para devolver lo que habia.
SOMBRA = {0xF0F1: 0, 0xF0F2: 1, 0xF0F3: 2}
SOMBRA_RANURA = {0: 0, 1: 1, 2: 2}
PONE_ZONA = ()
DEVUELVE_ZONA = ()

# Subrutinas del banco 0 que CAMBIAN de banco y vuelven con `ret`; sin ellas
# el trazador sigue tras el `call` con el reparto de antes. Cada una escribe
# el registro Y su copia en RAM. None = esa ranura no la toca.
#   trio:  push af / ld a,N / (jr) di / push hl / ld hl,0xF0F1 / 0x7000 /
#          inc a / 0x9000 / inc a / 0xB000
#   suelto en 0xA000: push af / ld a,N / (jr) di / ld (0xF0F3),a / 0xB000
#   14-15: push af / ld a,14 / di / 0xF0F2 + 0x9000 / inc a / 0xF0F3 + 0xB000
_PONE = {
    "msx1": {0x4192: (1, 2, 3), 0x41AE: (4, 5, 6), 0x41B3: (7, 8, 9),
             0x41B8: (10, 11, 12), 0x41BD: (None, None, 12),
             0x41C2: (None, None, 15), 0x41C7: (None, None, 13),
             0x41D4: (None, 14, 15)},
    "msx2": {0x418A: (1, 2, 3), 0x41A6: (4, 5, 6), 0x41AB: (7, 8, 9),
             0x41B0: (10, 11, 12), 0x41B5: (None, None, 12),
             0x41BA: (None, None, 15), 0x41BF: (None, None, 13),
             0x41CC: (None, 14, 15)},
}
PONE_BANCOS = elige(_PONE)

# Los bancos que llevan codigo y el reparto con el que corre (para
# tools/huerfanas.py). PROVISIONAL hasta el primer trazado.
CODIGO = {0: (1, 2, 3), 1: (1, 2, 3), 2: (1, 2, 3), 3: (1, 2, 3), 4: (4, 5, 6)}

# Arranque: INIT (cabecera AB) pone en H.STKE (0xFEDA) un `rst 0x30` a este
# cartucho con esta direccion (p00:40BD / p00:40AE), y esa instala el gancho
# de interrupcion en 0x402E: la MSX1 en H.KEYI (0xFD9A, p00:410F-4117) y la
# MSX2 en H.TIMI (0xFD9F, p00:4114-411C).
_STKE = {"msx1": 0x40C4, "msx2": 0x40B5}


def semillas_iniciales(rom):
    """Los puntos de entrada que el hardware y la BIOS garantizan.

    - INIT de la cabecera "AB": lo llama la BIOS al arrancar, con el mapper en
      su estado de encendido (bancos 1, 2 y 3 en 0x6000, 0x8000 y 0xA000).
    - El gancho H.STKE que pone INIT: la BIOS lo llama cuando ha terminado de
      arrancar (despues del disco).
    - 0x402E: el gancho de interrupcion.
    """
    init = rom[2] | (rom[3] << 8)
    stke = elige(_STKE)
    return [(init, (1, 2, 3), "cabecera AB: INIT"),
            (stke, (1, 2, 3), "gancho H.STKE (0xFEDA) que pone INIT"),
            (0x402E, (1, 2, 3), "gancho de interrupcion que pone el arranque")]
