# Por dentro

## Empezar

Este repositorio no trae el juego. Trae las herramientas que, a partir de tus propias imágenes de los dos cartuchos, vuelven a montar los listados comentados, los reensamblan y comprueban que salen las ROM **byte a byte**.

### Lo que hace falta

- `kv2_msx1.rom` (RC-760) y `kv2_msx2.rom` (RC-761), de 131.072 bytes cada una, en la raíz. Sus sha256: `87a51e8744c0dafa0ab27d8b3b16585cfb5f76673ec62ad05c49c58384ce81b8` y `c7f138f16ddb8c8bf7af2fbd136c1f949ab95c375205375a3509d8ad32e00d93`.
- `make`, `python3` y el ensamblador `pasmo`.
- Para las imágenes y la música, Python con PIL y lameenc; para los cotejos, openMSX.

### Lo que se ejecuta

    make                          # los dos cartuchos: traza, listado, reensamblado y tests
    make verify                   # los dieciséis bancos de cada uno contra su ROM
    VARIANTE=msx2 make listado    # uno solo
    python tools/imagenes.py docs/imagenes
    python tools/musica.py todas docs/audio

`make verify` tiene que decir `OK: la ROM entera reproducible byte a byte` dos veces.

## Un listado, dos cartuchos

`src/comun` lleva los bancos iguales en los dos (4, 5, 6, 10, 11 y 13), listados una vez; `src/msx1` y `src/msx2`, los de cada uno. Las herramientas son las mismas, y lo que cambia lo eligen con `VARIANTE=msx1` o `msx2`. Los comentarios de MSX1 se llevan de los de MSX2 por el código que casa (`tools/paralelo.py` y `tools/lleva.py`), traduciendo las direcciones; `tools/coteja_llevados.py` comprueba que ninguno cita una dirección de MSX2. Las direcciones que se citan en esta web son las del cartucho de MSX2.

Las imágenes salen de `tools/msx2run.py`, que ejecuta el cartucho (el Z80, el mapper con SCC, la BIOS atrapada y el VDP de cada máquina), y de `tools/imagenes.py`. Los cotejos con openMSX: `tools/omsx_vram.tcl` (la fase 1), `tools/omsx_demo.tcl` con `tools/coteja_demo.py` (las demostraciones) y `tools/omsx_psg.tcl` con `tools/coteja_psg.py` (la música).

## El cartucho

- **El mapper**: Konami con SCC, 16 bancos de 8 KB, con el 0 fijo en 0x4000 y los otros tres huecos en 0x7000, 0x9000 y 0xB000 (copia en `0xF0F1`-`0xF0F3`).
- **La interrupción** (`0x402E`): primero el sonido (bancos 4-5-6, `p04:6006`) y luego, si el cuadro anterior ha acabado (`0xE205`), un cuadro del juego (`p00:46D4`); si no ha acabado, solo suena la música.
- **El sonido**: tres canales del PSG y cinco del SCC desde `0xE000`.
- **La RAM**: el estado del juego en `0xE200`, la pirámide en `0xE241`, la fase en `0xE242`, la pantalla en `0xE243`, Vick en `0xE280`, los enemigos en `0xE500` (ocho de 32 bytes), las cosas de la fase en `0xE600` y `0xE700`, y la rejilla de pantallas en `0xE788`.

## El código

El **100 %** de los 131.072 bytes de cada cartucho está explicado, y ninguna rutina queda por debajo del 10 % comentado:

| Cartucho | Código | Datos | Rutinas | Instrucciones | Comentadas |
|---|---|---|---|---|---|
| MSX (RC-760) | 35.624 | 95.448 | 2.194 | 17.775 | 7.115 (40,0 %) |
| MSX2 (RC-761) | 36.647 | 94.425 | 2.234 | 18.530 | 7.444 (40,2 %) |

Qué hay en cada banco:

- banco 0: la interrupción, los repartos de bancos, la carga de gráficos, el mapa y los estados del juego;
- banco 1: los menús del editor, la contraseña, el *Game Master 2*, la salida de los enemigos, la pirámide acabada y el final;
- banco 2: Vick y lo que coge, el editor, el disco y la cinta, y el bloque que se empuja;
- banco 3: los enemigos, lo que hace Vick en cada estado (andar, escaleras, lanzar, cavar) y las puertas giratorias;
- banco 4: el sonido;
- banco 12: los minijuegos, las demostraciones, el final, la cinta y los letreros;
- 5, 6, 10, 11 y 13: solo datos (partituras, mapas, tablas de las fases); 7, 8, 9, 14 y 15: los gráficos.
