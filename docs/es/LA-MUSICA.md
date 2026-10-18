# La música

Las **16 músicas** del cartucho, sacadas **ejecutando su propio motor de sonido** (banco 4, el mismo en los dos cartuchos) fuera del emulador, a MP3 (`tools/musica.py`). La lista sale del propio juego: la selección de músicas escondida (SOUND SELECT) tiene 19 entradas, y tres son efectos. Solo músicas.

Cada una se ha cotejado con lo que el cartucho escribe de verdad en el PSG y en el SCC en openMSX, haciéndola sonar sola 6,6 minutos (más de cinco vueltas): **iguales escritura a escritura las 16, en los dos cartuchos**. Las MP3 duran hasta que la pieza vuelve a empezar, con un tope de 3 minutos.

### 0x03 La presentación

*La pide `p00:4753`.*

<audio controls preload="none" src="../audio/musica_03.mp3?v=09f3f4a2"></audio>

### 0x10 El menú

*La pide `p00:47DD`.*

<audio controls preload="none" src="../audio/musica_10.mp3?v=8ec26494"></audio>

### 0x11 Elegido (menú y editor)

*La pide `p00:4801` y el editor (p02).*

<audio controls preload="none" src="../audio/musica_11.mp3?v=0e8b30e7"></audio>

### 0x05 Las fases 1 y 2 de cada pirámide

*La pide `p00:438D`, tabla `0x43A4`.*

<audio controls preload="none" src="../audio/musica_05.mp3?v=1fe13000"></audio>

### 0x06 Las fases 3 y 4

*La pide `p00:438D`, tabla `0x43A4`.*

<audio controls preload="none" src="../audio/musica_06.mp3?v=f1853d72"></audio>

### 0x07 Las fases 5 y 6

*La pide `p00:438D`, tabla `0x43A4`.*

<audio controls preload="none" src="../audio/musica_07.mp3?v=6ec9f890"></audio>

### 0x08 Las fases 7 y 8

*La pide `p00:438D`, tabla `0x43A4`.*

<audio controls preload="none" src="../audio/musica_08.mp3?v=d700af87"></audio>

### 0x09 Las fases 9 y 10

*La pide `p00:438D`, tabla `0x43A4`.*

<audio controls preload="none" src="../audio/musica_09.mp3?v=91dbc841"></audio>

### 0x0B La última joya: se abre la salida

*La pide `p02:99E8`.*

<audio controls preload="none" src="../audio/musica_0B.mp3?v=37fefae1"></audio>

### 0x28 Vick muere

*La pide `p00:49B1` y `p02:9AFB`.*

<audio controls preload="none" src="../audio/musica_28.mp3?v=41834ffd"></audio>

### 0x0F Fin de la partida

*La pide `p00:4A35`.*

<audio controls preload="none" src="../audio/musica_0F.mp3?v=cc78c04a"></audio>

### 0x0D Pirámide acabada

*La pide `p01:6FC7`.*

<audio controls preload="none" src="../audio/musica_0D.mp3?v=0c9a2c47"></audio>

### 0x0A El puzle

*La pide `p12:B6EF`.*

<audio controls preload="none" src="../audio/musica_0A.mp3?v=f3b35201"></audio>

### 0x0C Solo en la selección de músicas

*La pide `p12:B987`, tabla `0xB98A`.*

<audio controls preload="none" src="../audio/musica_0C.mp3?v=f32f192c"></audio>

### 0x12 El final: la tablilla

*La pide `p01:743D`.*

<audio controls preload="none" src="../audio/musica_12.mp3?v=ca43541f"></audio>

### 0x0E El final

*La pide `p01:7603`.*

<audio controls preload="none" src="../audio/musica_0E.mp3?v=f7a00c5c"></audio>
