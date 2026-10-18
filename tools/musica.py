#!/usr/bin/env python3
"""La musica de King's Valley II (PSG y SCC), ejecutando su motor de sonido
(tools/motor_musica.py).

El motor esta en el banco 4, que es el mismo en los dos cartuchos (y los
bancos 5 y 6, donde siguen las partituras), asi que la musica de MSX1 y la
de MSX2 son la misma; aqui se ejecuta con la ROM de MSX2. Tiene tres
entradas: p04:6000 lo pone a cero (el arranque, p00:53C3), p04:6003 arranca
el sonido A (p00:4326, con los bancos 4-5-6) y p04:6006 es el cuadro (la
interrupcion, p00:4060, con los bancos 4-5-6). La cabecera de cada sonido
(p04:6F2C + 2 x numero) dice que canales usa: los efectos, dos (mascara
0x30); las musicas, seis u ocho (0xCF, 0xFF). Solo van las musicas.

LA LISTA sale del propio cartucho: la seleccion de musicas del sitio
escondido (SOUND SELECT, p12:B987, tabla 0xB98A) tiene 19 rutinas que piden
cada una un sonido; tres son efectos (0x16, 0x1D y 0x27). De las otras, quien
las pide en el juego:

- 0x05-0x09 (p00:438D, tabla 0x43A4): una cada dos fases por la cifra de las
  unidades de la fase (1-2, 3-4, 5-6, 7-8 y 9-10 de cada piramide).
- 0x0C no la pide nadie mas que la seleccion de musicas.

Uso:  musica.py registros 0x05 [cuadros] | mp3 0x05 f.mp3 | todas docs/audio
"""
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import motor_musica  # noqa: E402
from motor_musica import P  # noqa: E402

PIEZAS = [
    P(0x03, "La presentación", "The intro", "p00:4753"),
    P(0x10, "El menú", "The menu", "p00:47DD"),
    P(0x11, "Elegido (menú y editor)", "Chosen (menu and editor)", "p00:4801 y el editor (p02)"),
    P(0x05, "Las fases 1 y 2 de cada pirámide", "Stages 1 and 2 of each pyramid", "p00:438D, tabla 0x43A4"),
    P(0x06, "Las fases 3 y 4", "Stages 3 and 4", "p00:438D, tabla 0x43A4"),
    P(0x07, "Las fases 5 y 6", "Stages 5 and 6", "p00:438D, tabla 0x43A4"),
    P(0x08, "Las fases 7 y 8", "Stages 7 and 8", "p00:438D, tabla 0x43A4"),
    P(0x09, "Las fases 9 y 10", "Stages 9 and 10", "p00:438D, tabla 0x43A4"),
    P(0x0B, "La última joya: se abre la salida", "The last soul stone: the exit opens", "p02:99E8"),
    P(0x28, "Vick muere", "Vick dies", "p00:49B1 y p02:9AFB"),
    P(0x0F, "Fin de la partida", "Game over", "p00:4A35"),
    P(0x0D, "Pirámide acabada", "Pyramid cleared", "p01:6FC7"),
    P(0x0A, "El puzle", "The puzzle", "p12:B6EF"),
    P(0x0C, "Solo en la selección de músicas", "Only in the sound select", "p12:B987, tabla 0xB98A"),
    P(0x12, "El final: la tablilla", "The ending: the tablet", "p01:743D"),
    P(0x0E, "El final", "The ending", "p01:7603"),
]

PAGINA = None

CFG = dict(rom="kv2_msx2.rom", org=0x4000, mapper="konami_scc",
           bancos0=((0x4000, 0), (0x6000, 4), (0x8000, 5), (0xA000, 6)),
           bancos_frame=((0x6000, 4), (0x8000, 5), (0xA000, 6)),
           ram0=[], init=[(0x6000, {})], frame=0x6006, pide=0x4326, banco_frame=4, bp_frame=0x4060,
           banco_pide=0, ram=(0xE000, 0xE200), hz=60, psg0={7: 0xBF},
           romtype="KonamiSCC", max_s=180, cabeceras=(4, 0x6F2C), piezas=PIEZAS, pagina=PAGINA,
           maquina="C-BIOS_MSX2")

if __name__ == "__main__":
    sys.exit(motor_musica.main(CFG, sys.argv[1:]))
