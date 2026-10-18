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
    0xE217: ("la marca de TRYAGAIN (se puede seguir tras el fin de la partida)", "p01:6B38"),
    0xE255: ("la marca de FESTIVAL (invencible: p02:9AB1 no mira los enemigos)", "p01:6B42"),
    0xE25A: ("el paso del editor", "p01:7920"),
    0xE25B: ("el paso dentro del menu del editor", "p01:7B08"),
    0xE260: ("la opcion del menu del editor (0-10)", "p01:7B6A"),
    0xE261: ("la opcion del submenu del editor", "p01:7C3A"),
    0xE262: ("la casilla de la pantalla que se edita", "p01:7C82"),
    0xE264: ("la y del cursor del editor (en caracteres)", "p01:7F2A"),
    0xE265: ("la x del cursor del editor (en caracteres)", "p01:7F2A"),
    0xE266: ("cuantos sitios de salida de enemigos hay en el editor", "p02:80A7"),
    0xE267: ("cuantas cosas de 0xE600 hay en el editor", "p02:81B7"),
    0xE268: ("cuantas cosas de 0xE300 hay en el editor", "p02:8477"),
    0xE269: ("cuantas cosas de 0xE700 hay en el editor", "p02:853F"),
    0xE26A: ("la marca de salida puesta en el editor", "p02:85FB"),
    0xE26B: ("la marca de personaje puesto en el editor", "p02:8043"),
    0xE26C: ("cuantas columnas hay en el editor", "p02:83A5"),
    0xE270: ("el nombre de la fase del editor (11 letras)", "p01:7969"),
    0xE27F: ("el resultado de grabar o cargar (0 bien, 2 error)", "p01:6D52"),
    0xE2F1: ("la salida de la fase: y, x y pantalla (0xE2F3)", "p02:8F96"),
    0xE2F4: ("cuantas cosas de 2 x 2 hay que coger", "p01:7D99"),
    0xE2F5: ("cuantas cosas de 2 x 2 quedan por coger (con 0 se abre la salida)", "p02:8FC6"),
    0xE300: ("las cosas que se cogen y se llevan (64 x 8 bytes)", "p02:97B2"),
    0xEE00: ("la cabecera para el Game Master 2", "p01:6C85"),
    0xEE50: ("la lista de las cosas de 0xE300 por orden de pintado", "p02:921A"),
    0xF0F8: ("donde se graba la fase del editor (0 cinta, 1 disco, 2 Game Master 2)", "p02:89E5"),
    0xF0F9: ("lo que hay para grabar (bit 0 disco, bit 1 Game Master 2)", "p01:6F02"),
    0xE209: ("el paso del mando grabado de la demostracion (y 0xE20A, sus cuadros)", "p12:BA14"),
    0xE219: ("la demostracion siguiente (1-6)", "p12:BA17"),
    0xE910: ("en el final, las estrellas (32 x 16 bytes); en la partida, parte del mapa", "p12:BC6E"),
    0xEF10: ("el sitio escondido de la fase: tipo, paso, pantalla, y, x (0xEF10-0xEF15)", "p12:B413"),
    0xEF20: ("el puzle: las 25 casillas", "p12:B70C"),
    0xE1CB: ("las marcas del motor de sonido", "p04:61BB"),
    0xE1CC: ("el sonido que se pide", "p04:6057"),
    0xE1CD: ("la cabecera del sonido que se pide (18 bytes)", "p04:6068"),
    0xE1E3: ("el registro 7 del PSG (los canales y el ruido)", "p04:6C74"),
    0xE1E4: ("el canal que se esta tocando (un bit)", "p04:6348"),
    0xE1E7: ("las marcas del ruido y la envolvente del PSG", "p04:6BFB"),
    0xE1FC: ("los canales del SCC que suenan", "p04:6DE0"),
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
    0xE257: ("el paso de la secuencia en curso (entrada, fase o piramide acabada)", "p01:6827"),
    0xE280: ("el estado del personaje", "p00:49AB"),
    0xE282: ("la y del personaje", "p00:5E2E"),
    0xE284: ("la x del personaje", "p00:5E22"),
    0xE285: ("hacia donde mira el personaje", "p00:5886"),
    0xE287: ("la postura del personaje", "p00:587A"),
    0xE297: ("la postura de la que estan cargados los sprites", "p00:5925"),
    0xE298: ("la marca de personaje muerto", "p02:9312"),
    0xE2B3: ("el dibujo del personaje en pausa", "p00:58CD"),
    0xE2C0: ("los sitios de los que salen los enemigos (8 x 5 bytes)", "p01:674F"),
    0xE2F9: ("el borde por el que se ha salido", "p00:5E06"),
    0xE700: ("la tabla de colores al cargar graficos; en la partida, las cosas de 2 x 2 de la fase (16 x 8 bytes)", "p00:54BC"),
    0xE500: ("los enemigos (8 x 32 bytes)", "p01:654C"),
    0xE600: ("las cosas de la fase (16 x 16 bytes)", "p01:632D"),
    0xE780: ("la rejilla de pantallas de la fase (0xE788: una casilla por byte)", "p00:5DAF"),
    0xE7C0: ("la lista de las columnas de la tabla 0x60F0 (4 bytes: pantalla, y, x, alto | 0x80)", "p00:4429"),
    0xE800: ("los atributos de los sprites (y, x, dibujo, color); al cargar graficos, su bufer", "p00:5821"),
    0xE880: ("lo que tapa el recuadro de estado; en las secuencias, el fundido de paleta en marcha (0 al acabar)", "p01:77D7"),
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

# Los 8 canales del motor de sonido (banco 4): 0x33 bytes cada uno desde
# 0xE000 (0-2 el PSG, 3-7 el SCC). Los campos, leidos en p04:6159-6B98.
CAMPOS_CANAL = {
    0x00: "el sonido del canal (0: libre)",
    0x01: "la prioridad del sonido",
    0x02: "por donde va la partitura (bajo)",
    0x03: "por donde va la partitura (alto)",
    0x04: "los cuadros que le quedan a la nota",
    0x05: "la cuenta de la repeticion 0xFB/0xDB",
    0x06: "la cuenta de la repeticion 0xFC",
    0x07: "la vuelta de la llamada 0xF9 (bajo)",
    0x08: "la vuelta de la llamada 0xF9 (alto)",
    0x09: "el modo de las notas (bit 0 un byte, 1 dos, 2-4 bateria)",
    0x0A: "el periodo que suena (bajo)",
    0x0B: "el periodo que suena (alto)",
    0x0C: "el volumen que suena",
    0x0D: "las marcas de la nota (bits 0-1 forma, 2, 5-6 deslizar, 7 orden 0xDC)",
    0x0E: "las marcas de efectos (bit 0 guion de bateria, 1 desafinar, 2-4 trino, 5-6, 7)",
    0x0F: "las marcas de la envolvente (bit 0 en marcha, 1-5 su fase, 7 onda nueva)",
    0x10: "el periodo de la nota (bajo)",
    0x11: "el periodo de la nota (alto)",
    0x12: "el volumen de la nota",
    0x13: "la duracion fija (ordenes 0xE1-0xE3)",
    0x14: "el multiplicador de la duracion (orden 0xE9)",
    0x15: "el volumen del canal (orden 0xEA)",
    0x16: "la octava (ordenes 0xD0-0xD5)",
    0x17: "por donde va el guion de bateria (bajo)",
    0x18: "por donde va el guion de bateria (alto)",
    0x19: "la cuenta del guion de bateria",
    0x1A: "la espera del trino (orden 0xF2)",
    0x1B: "cada cuanto el trino (orden 0xF1)",
    0x1C: "cuanto sube y baja el trino",
    0x1D: "el sentido del trino",
    0x1E: "la cuenta del trino",
    0x1F: "la cuenta de la envolvente",
    0x20: "los pasos de la envolvente",
    0x21: "la subida de la envolvente (orden 0xEB)",
    0x22: "la caida de la envolvente",
    0x23: "cuantos pasos cae",
    0x24: "cuando se suelta la nota",
    0x25: "el volumen de la orden 0xED",
    0x26: "el desafinado (orden 0xEE)",
    0x27: "la forma de onda del SCC (bajo, orden 0xF8)",
    0x28: "la forma de onda del SCC (alto)",
    0x29: "lo que se le resta al volumen (orden 0xF7)",
    0x2A: "las marcas de efectos guardadas (orden 0xFE)",
    0x2B: "las marcas de envolvente guardadas",
    0x2C: "la octava de la bateria",
    0x2D: "la vuelta de la llamada 0xD9 (bajo)",
    0x2E: "la vuelta de la llamada 0xD9 (alto)",
    0x2F: "el operando de la orden 0xDC",
    0x30: "la cuenta del deslizar (orden 0xD8)",
    0x31: "los pasos del deslizar",
    0x32: "cuanto desliza cada paso",
}
CARGAS_CANAL = tuple(0xE000 + 0x33 * k for k in range(8))
IX_CANAL_POR_DEFECTO = {4: ((0x62DF, 0x62F8), (0x63CC, 0x6B98))}
FICHAS = ((CARGAS_CANAL, IX_CANAL_POR_DEFECTO, CAMPOS_CANAL),)
SCC = {0x988A + k: "el volumen del canal %d del SCC" % (k + 1) for k in range(5)}
SCC.update({0x9880 + 2 * k: "el periodo del canal %d del SCC (bajo)" % (k + 1) for k in range(5)})
SCC.update({0x9881 + 2 * k: "el periodo del canal %d del SCC (alto)" % (k + 1) for k in range(5)})
SCC[0x988F] = "los canales del SCC encendidos"

SCC_BANCOS = (4,)
