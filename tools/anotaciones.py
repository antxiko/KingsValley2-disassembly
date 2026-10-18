#!/usr/bin/env python3
"""Lo que tools/anota.py sabe de King's Valley II: rutinas con nombre, RAM y
los campos de las fichas. Solo datos; la maquinaria esta en anota.py.

Las direcciones de los bancos que cambian de un cartucho a otro van por
variante (tools/variante.py); las de los bancos comunes (paginas.COMUNES)
valen para los dos.

CADA ENTRADA SALE DE LEER SU RUTINA en el listado (la direccion es la fuente).
Lo que no se sabe no esta en la tabla.
"""
from cartucho import PONE_BANCOS

# Los bancos con codigo (los demas son datos de punta a punta). PROVISIONAL.
BANCOS = (0, 1, 2, 3, 4, 12)

# Los registros del mapper Konami con SCC (tools/paginas.py).
REGISTROS_MAPPER = {0x5000: "0x4000", 0x7000: "0x6000", 0x9000: "0x8000", 0xB000: "0xA000"}


# Que banco se ve en cada ventana al empezar una rutina del banco b: el juego
# corre con 1-2-3 y el sonido con 4-5-6. PROVISIONAL.
def trio(b):
    if b == 0:
        return {}
    if b in (4, 5, 6):
        return {0x6000: 4, 0x8000: 5, 0xA000: 6}
    return {0x6000: 1, 0x8000: 2, 0xA000: 3}


# Las rutinas del banco 0 que cambian lo que se ve (cartucho.PONE_BANCOS).
CAMBIOS_DE_BANCO = {a: {v: b for v, b in zip((0x6000, 0x8000, 0xA000), t) if b is not None}
                    for a, t in PONE_BANCOS.items()}

RUTINAS = {}

# La RAM, la misma en los dos cartuchos (se ha cotejado en las instrucciones
# que casan: tools/paralelo.py). (texto, donde se ve).
RAM = {
    0xE200: ("el estado del juego (0 presentacion, 1 titulo, 3 menu, 4 empieza la fase, 5 juego, 6 se acaba la vida, 7 fin, 9 fase acabada, 0x0B editor, 0x0D final)", "p00:46E5"),
    0xE201: ("el paso dentro del estado", "p00:46E5"),
    0xE202: ("las marcas de la partida (bit 6: se pueden sumar puntos)", "p00:4C22"),
    0xE203: ("la cuenta de cuadros", "p00:46E1"),
    0xE204: ("la espera del paso (en cuadros)", "p00:4799"),
    0xE205: ("la marca de cuadro del juego en marcha", "p00:407A"),
    0xE206: ("la marca de sonido en marcha en la interrupcion", "p00:4049"),
    0xE207: ("el mando: lo que se acaba de pulsar", "p00:541C"),
    0xE208: ("el mando: lo pulsado", "p00:5434"),
    0xE20B: ("por que sprite se empieza a copiar (+0x68 cada cuadro)", "p00:57FB"),
    0xE20C: ("las teclas: lo que se acaba de pulsar (bit 0 pausa, 1 recuadro, 3 musica, 4 disparo)", "p00:5425"),
    0xE20D: ("las teclas: lo pulsado", "p00:5425"),
    0xE210: ("la tabla de colores de los sprites que se rellena", "p00:57F4"),
    0xE212: ("la tabla de atributos de los sprites que se rellena", "p00:57F1"),
    0xE214: ("la cuenta del telon del menu", "p00:5F9F"),
    0xE215: ("la cuenta para volver a poner la musica", "p00:402F"),
    0xE21A: ("una cuenta atras que para la musica al llegar a 1", "p00:403E"),
    0xE21B: ("la cuenta del borde que parpadea", "p00:5D4F"),
    0xE222: ("el jugador (0 el 1, 1 el 2)", "p00:4804"),
    0xE223: ("el record (3 bytes BCD)", "p00:4C3D"),
    0xE226: ("los puntos (3 bytes BCD)", "p00:4C27"),
    0xE240: ("las vidas (BCD)", "p00:48BB"),
    0xE241: ("la piramide (1-6)", "p00:5C95"),
    0xE242: ("la fase (1-60)", "p00:5C87"),
    0xE243: ("la pantalla de la fase (desde 1)", "p00:5E13"),
    0xE244: ("la casilla de la rejilla de la pantalla", "p00:5DEC"),
    0xE245: ("los puntos de la proxima vida", "p00:4C48"),
    0xE246: ("la marca de fase empezada", "p00:4932"),
    0xE247: ("la marca de seguir tras el fin de la partida (F5)", "p00:4AE5"),
    0xE248: ("el borde por el que se sale de la pantalla (1 arriba, 2 abajo, 3 izquierda, 4 derecha)", "p00:5E02"),
    0xE249: ("la marca de salida de la fase", "p00:4972"),
    0xE24A: ("lo elegido en el menu", "p00:4857"),
    0xE24C: ("la marca de pausa", "p00:49CB"),
    0xE24D: ("la marca de borde sin pantalla al otro lado", "p00:5EAF"),
    0xE24E: ("la marca del recuadro de estado", "p00:498D"),
    0xE250: ("el mapa de la pantalla en la que se esta (16 bits)", "p00:5D2E"),
    0xE253: ("la marca de musica quitada", "p00:437C"),
    0xE254: ("la marca de partida del editor", "p00:48B5"),
    0xE257: ("la marca de fase acabada", "p00:49B9"),
    0xE280: ("el estado del personaje", "p00:49AB"),
    0xE282: ("la y del personaje", "p00:5E2E"),
    0xE284: ("la x del personaje", "p00:5E22"),
    0xE285: ("hacia donde mira el personaje", "p00:5886"),
    0xE287: ("la postura del personaje", "p00:587A"),
    0xE297: ("la postura de la que estan cargados los sprites", "p00:5925"),
    0xE298: ("lo que lleva el personaje en la mano", "p00:5873"),
    0xE2B3: ("el dibujo del personaje en pausa", "p00:58CD"),
    0xE2C0: ("las fichas de 0xE2C0 (8 x 5 bytes)", "p00:46A4"),
    0xE2F9: ("el borde por el que se ha salido", "p00:5E06"),
    0xE700: ("la tabla de colores de los graficos que se cargan", "p00:54BC"),
    0xE780: ("la rejilla de pantallas de la fase (0xE788: una casilla por byte)", "p00:5DAF"),
    0xE7C0: ("la lista de las columnas de la tabla 0x60F0 (4 bytes: pantalla, y, x, alto | 0x80)", "p00:4429"),
    0xE800: ("los atributos de los sprites (y, x, dibujo, color); al cargar graficos, su bufer", "p00:5821"),
    0xE880: ("lo que tapa el recuadro de estado", "p00:4D92"),
    0xE900: ("el mapa de la fase: 0xC0 bytes por pantalla, 4 casillas por byte", "p00:43D6"),
    0xED80: ("los saltos entre pantallas al salir por arriba", "p00:5EBB"),
    0xED90: ("los saltos al salir por abajo", "p00:5EC4"),
    0xEDA0: ("los saltos al salir por la izquierda", "p00:5ECD"),
    0xEDB0: ("los saltos al salir por la derecha", "p00:5ED6"),
    0xEF00: ("la cuenta de los colores que cambian solos", "p00:5C30"),
    0xEF80: ("el bufer de un caracter o un sprite", "p00:5155"),
    0xEFC0: ("un dato de paso de la rutina en curso", "p00:4422"),
    0xEFC2: ("la pantalla que se lee del mapa", "p00:441F"),
    0xEFC3: ("la marca de apuntar en 0xE7C0 las columnas al leer el mapa", "p00:440E"),
    0xF0E9: ("el slot de este cartucho", "p00:415E"),
    0xF0F1: ("el banco puesto en 0x6000", "p00:418F"),
    0xF0F2: ("el banco puesto en 0x8000", "p00:418F"),
    0xF0F3: ("el banco puesto en 0xA000", "p00:418F"),
    0xF0F4: ("la marca de MSX2 (1 en el cartucho de MSX2, 0 en el de MSX1)", "p00:40D0"),
    0xF0F7: ("el slot del cartucho de la otra ranura (0xFF si no hay)", "p00:4813"),
    0xD200: ("los colores de los sprites (16 bytes por sprite)", "p00:5841"),
}
RAM16 = {}
FICHAS = ()

SCC_BANCOS = (4,)
