# Curiosidades

## Dos contraseñas secretas

En PASSWORD, antes de las normales, el cartucho mira otras dos (`p01:6B24`):

- **FESTIVAL**: partida nueva y Vick no muere al tocar un enemigo (`0xE255`; `p02:9AB1` no los mira).
- **TRYAGAIN**: partida nueva en la que se puede seguir tras el fin de la partida (`0xE217`).

El cartucho las compara letra a letra con las dos que guarda en la ROM (`p01:6B47`; FESTIVAL en `p01:6B57` y TRYAGAIN en `p01:6B5F`). Y trae un letrero con pistas, SECRET COMMAND, F??T???L y ??Y?????, que son esas dos con letras tapadas. Solo sale con el *Game Master 2* puesto (`0xF0F7`, el slot donde lo encontró, `p01:6F39`) y pulsando la tecla de la fila 1, bit 5 del teclado (@ en uno japonés, [ en uno internacional) al elegir GAME en el título (`p00:4813`).

## Cómo es una contraseña

Ocho letras de la A a la P, dos por byte: la fase, las vidas, un número al azar (del registro R del Z80) y la suma de los tres, de control. Los tres bits bajos del azar dicen cuántas vueltas se les da a la fase y a las vidas, así que la misma partida tiene ocho contraseñas distintas (`p01:6994`). Al meterla, se deshacen las vueltas, y no valen la fase 0, una fase por encima de la 60 ni 0 vidas (`p01:6A71`).

## Dos minijuegos escondidos

Doce fases tienen un sitio escondido (tabla del banco 12): aparece si Vick salta justo encima, y pulsando abajo se entra (`p12:B437`).

- En las fases 7, 24, 32, 40, 50 y 53, **SOUND SELECT**: la selección de músicas.
- En las 20, 29, 35, 43, 52 y 55, **PUZZLE GAME**: un puzle de 5 x 5 (24 piezas y el hueco), uno de cuatro revueltos al azar; resuelto, ALL RIGHT, REST 3 UP: tres vidas más.

Los dos, en [Las secuencias](LAS-SECUENCIAS.html).

## El editor y dónde graba

EDIT, en el título, abre un editor de fases con sus menús (FLOOR1, FLOOR2, LADDER, PLAYER, ENEMY, TRAP, TOOL WEAPON, SOUL STONE, EXIT DOOR, SAVE, END). La fase se graba en cinta, en disco (un fichero .ELG) o en el *Game Master 2* de Konami (hasta tres ficheros, FILE1 a FILE3). El cartucho mira qué hay: el disco por el gancho H.PHYD y el *Game Master 2* buscando 'YZ' en 0x4010 en los cuatro slots (`p01:6EEA`). La fase grabada se juega con STAGE LOAD.

## El título según la BIOS

El cartucho de MSX lee en la BIOS si la máquina es japonesa (`0x002B`) y pinta el título en japonés o en inglés (`p00:529E`). El de MSX2 lo pinta siempre en japonés.

## Lo que cambia de MSX a MSX2

Es el mismo juego con otros dibujos. Los bancos 4, 5, 6, 10, 11 y 13 (el sonido, las partituras, los mapas y las tablas de las fases) son iguales byte a byte; el 12 casi; los bancos 0 a 3 son el mismo código, corrido; el 7, 8, 9, 14 y 15 son los gráficos de cada uno (en el de MSX el 9 está vacío, todo a 0xFF). En MSX2 la pantalla es de 16 colores con paleta (SCREEN 5) y la página 1 de la VRAM guarda dibujos (los de Vick) y el fondo que tapan algunas cosas; en MSX, SCREEN 2. La interrupción entra por H.KEYI en MSX y por H.TIMI en MSX2.

## Lo que queda abierto

- Qué hacen distinto SCOOP y PICK, y HAMMER y DRILL.
- Qué es TRAP en el juego.
- El final con una BIOS de verdad: el gráfico de la lista `0x9069` llena el búfer `0xE800`-`0xEFDF` y pisa el fundido (`0xE880`), y el salto de `p01:7835` cae dentro de la BIOS (`0x1323`). Con la C-BIOS de openMSX el juego sigue en PUSH SPACE KEY; con la de un MSX de verdad, sin probar.
- La grabación en el *Game Master 2*: sin probar.
