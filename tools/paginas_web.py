#!/usr/bin/env python3
"""Las paginas de la web de King's Valley II, en ingles (docs/) y en castellano
(docs/es/).

Son las de ESTE juego: los textos van aqui y las galerias (los mapas, las
pantallas, las secuencias, las musicas y los letreros) salen de lo que hay en
docs/imagenes, docs/audio, tools/musica.py y tools/textos.py, para que no se
escriba a mano una lista de 400 imagenes. Jekyll (tools/jekyll.py) las
convierte; la portada la monta tools/make_web.py.

Las direcciones que se citan son las del cartucho de MSX2.

Uso: paginas_web.py <docs>
"""
import glob
import hashlib
import os
import re
import sys

AQUI = os.path.dirname(os.path.abspath(__file__))
RAIZ = os.path.dirname(AQUI)
sys.path.insert(0, AQUI)
from contenido_web import CARTUCHOS   # noqa: E402

IMG = os.path.join(RAIZ, "docs", "imagenes")
ED = (("msx2", "MSX2"), ("msx1", "MSX"))     # lado a lado: MSX2 a la izquierda


def ruta(es, f):
    return ("../imagenes/" if es else "imagenes/") + f


def fig(es, f, pie, perezosa=True):
    lazy = ' loading="lazy"' if perezosa else ""
    return '<figure><img src="%s" alt="%s"%s><figcaption>%s</figcaption></figure>' % (
        ruta(es, f), pie, lazy, pie)


def par(es, plantilla, pie=""):
    """MSX2 y MSX lado a lado: plantilla con {v}."""
    figs = [fig(es, plantilla.format(v=v), (pie + " - " if pie else "") + n) for v, n in ED
            if os.path.exists(os.path.join(IMG, plantilla.format(v=v)))]
    return '<div class="par">\n' + "\n".join(figs) + "\n</div>\n"


def mil(n, es):
    return f"{n:,}".replace(",", "." if es else ",")


# ---------------------------------------------------------------- las piramides
def piramides(es):
    t = []
    if es:
        t.append("""# Las pirámides

Seis pirámides de diez fases cada una: **60 fases**. Se juegan en orden; al acabar la décima de cada pirámide sale el plano del juego con la siguiente, y tras la sexta, el final.

Cada fase es una rejilla de pantallas (de una a seis; las fases 44 y 60 tienen seis). Para salir hay que coger todas las joyas (SOUL STONE): con la última suena la música de la salida, el borde parpadea y la puerta se abre (`p02:99E2`).

Los mapas están **pintados ejecutando el cartucho**: el juego prepara la fase (`p00:5C80`) y pinta cada pantalla (`p00:5CF5`), y cada una se pone en su sitio de la rejilla que deja en `0xE788`. En MSX2 son de 16 colores con su paleta; en MSX1, de SCREEN 2. Los mapas son los mismos en los dos cartuchos (bancos 10 y 11, comunes); cambian los dibujos. A la izquierda MSX2, a la derecha MSX.
""")
    else:
        t.append("""# The pyramids

Six pyramids of ten stages each: **60 stages**. They are played in order; after the tenth stage of each pyramid the game's map comes up with the next one, and after the sixth, the ending.

Each stage is a grid of screens (from one to six; stages 44 and 60 have six). To get out you have to pick up every soul stone (SOUL STONE): with the last one the exit tune plays, the border flashes and the door opens (`p02:99E2`).

The maps are **drawn by running the cartridge**: the game sets up the stage (`p00:5C80`) and draws each screen (`p00:5CF5`), and each one goes in its place in the grid it leaves at `0xE788`. On the MSX2 they have 16 colours with their palette; on the MSX, SCREEN 2. The maps are the same on both cartridges (banks 10 and 11, shared); the graphics change. MSX2 on the left, MSX on the right.
""")
    for k in range(1, 7):
        a, b = 10 * (k - 1) + 1, 10 * k
        t.append("## %s %d (%s %d-%d)\n" % ("Pirámide" if es else "Pyramid", k,
                                            "fases" if es else "stages", a, b))
        t.append(par(es, "piramide_{v}_%d.png" % k, "%s %d" % ("Pirámide" if es else "Pyramid", k)))
        for f in range(a, b + 1):
            n = len(glob.glob(os.path.join(IMG, "pantalla_msx2_f%02d_*.png" % f)))
            t.append("### %s %d\n" % ("Fase" if es else "Stage", f))
            t.append(("*%d pantalla%s.*\n" % (n, "" if n == 1 else "s")) if es else
                     ("*%d screen%s.*\n" % (n, "" if n == 1 else "s")))
            t.append(par(es, "mapa_{v}_f%02d.png" % f, "%s %d" % ("Fase" if es else "Stage", f)))
    return "\n".join(t)


# ---------------------------------------------------------------- las pantallas
def pantallas(es):
    cuenta = {}
    for f in range(1, 61):
        n = len(glob.glob(os.path.join(IMG, "pantalla_msx2_f%02d_*.png" % f)))
        cuenta[n] = cuenta.get(n, 0) + 1
    total = sum(n * c for n, c in cuenta.items())
    if es:
        t = ["""# Las pantallas

Las %d pantallas de las 60 fases, sueltas, como las pinta el cartucho: 14 fases tienen una pantalla, 16 dos, 16 tres, 12 cuatro y 2 seis. A la izquierda MSX2, a la derecha MSX1.
""" % total]
    else:
        t = ["""# The screens

The %d screens of the 60 stages, one by one, as the cartridge draws them: 14 stages have one screen, 16 have two, 16 three, 12 four and 2 six. MSX2 on the left, MSX on the right.
""" % total]
    assert cuenta == {1: 14, 2: 16, 3: 16, 4: 12, 6: 2}, cuenta     # lo que dice el texto
    for f in range(1, 61):
        t.append("## %s %d\n" % ("Fase" if es else "Stage", f))
        for p in sorted(glob.glob(os.path.join(IMG, "pantalla_msx2_f%02d_*.png" % f)),
                        key=lambda x: int(re.search(r"_(\d+)\.png$", x).group(1))):
            k = int(re.search(r"_(\d+)\.png$", p).group(1))
            t.append(par(es, "pantalla_{v}_f%02d_%d.png" % (f, k),
                         "%s %d" % ("Pantalla" if es else "Screen", k)))
    return "\n".join(t)


# ---------------------------------------------------------------- Vick
def vick(es):
    if es:
        return """# Vick

Vick XIII lleva una herramienta como mucho: con una en la mano no coge otra (`p02:9A14`). Los nombres son los del editor de fases (banco 13):

- KNIFE y BOOMERANG se lanzan; el bumerán vuelve.
- SCOOP y PICK cavan hacia abajo.
- HAMMER y DRILL cavan hacia el lado.

""" + par(es, "sprites_{v}_prota.png", "Vick") + """
Cada fila es lo que lleva (`0xE287`: 0 nada, 1-6 las herramientas) y cada columna uno de sus 14 dibujos (`0xE285`), puestos por las rutinas del propio juego.

## Lo que hay en las fases

""" + par(es, "objetos_{v}.png", "Las cosas") + """
La joya y las seis herramientas en el suelo, la puerta de salida en sus tres pasos al abrirse, el sitio del que salen los enemigos, las puertas giratorias (la de tipo 2 por sus dos lados), el suelo que se rompe y el bloque que se empuja. Todo pintado por las rutinas del juego.
"""
    return """# Vick

Vick XIII carries one tool at most: with one in his hand he does not pick up another (`p02:9A14`). The names are those of the stage editor (bank 13):

- KNIFE and BOOMERANG are thrown; the boomerang comes back.
- SCOOP and PICK dig downwards.
- HAMMER and DRILL dig sideways.

""" + par(es, "sprites_{v}_prota.png", "Vick") + """
Each row is what he carries (`0xE287`: 0 nothing, 1-6 the tools) and each column one of his 14 drawings (`0xE285`), set by the game's own routines.

## What there is in the stages

""" + par(es, "objetos_{v}.png", "The objects") + """
The soul stone and the six tools on the floor, the exit door in its three steps as it opens, the spot the enemies come out of, the revolving doors (the type 2 one from both sides), the floor that breaks and the block that is pushed. All drawn by the game's routines.
"""


# ---------------------------------------------------------------- los enemigos
def enemigos(es):
    if es:
        return """# Los enemigos

Cuatro, con los nombres del editor: **SLOUMAN, FLOUMAN, PYONCY y ROCK ROLL** (tipos 1 a 4: el editor guarda la opción del menú más uno, `p02:80D0`, y de ese tipo sale el enemigo, `p01:6741`). Salen de unos sitios fijos de cada fase (tabla del banco 13): cada sitio saca su enemigo a los 80 cuadros de empezar y, cuando ese se va, otro 192 cuadros después (`p01:671D`), si queda libre alguna de las ocho fichas de `0xE500`. Al matarlo pasa al tipo 5: suena `0x2D` y deja de hacer daño (`p01:6608`).

""" + par(es, "sprites_{v}_enemigos.png", "SLOUMAN, FLOUMAN, PYONCY, ROCK ROLL y al morir") + """
Cada fila, un tipo (y la última, al morir), con los dibujos que se le han visto ejecutando las seis demostraciones y la fase 3 (la primera con FLOUMAN, que no sale en ninguna demostración), y con los colores que les pone el juego.

Lo que cambia de un cartucho al otro: al salir, en MSX1 cada uno tiene sus dibujos (PYONCY 24-26, ROCK ROLL 27-29); en MSX2 los dos salen con los mismos (24 y 25) y los mismos colores. Al morir, en MSX1 son tres dibujos (21-23) y en MSX2 dos (21 y 22).
"""
    return """# The enemies

Four, with the names from the editor: **SLOUMAN, FLOUMAN, PYONCY and ROCK ROLL** (types 1 to 4: the editor stores the menu option plus one, `p02:80D0`, and the enemy comes out with that type, `p01:6741`). They come out of fixed spots in each stage (a table in bank 13): each spot brings out its enemy 80 frames after the start and, when that one goes, another 192 frames later (`p01:671D`), if one of the eight slots at `0xE500` is free. When killed it turns into type 5: `0x2D` plays and it stops doing harm (`p01:6608`).

""" + par(es, "sprites_{v}_enemigos.png", "SLOUMAN, FLOUMAN, PYONCY, ROCK ROLL and dying") + """
Each row is a type (and the last one, dying), with the drawings seen on it running the six demos and stage 3 (the first one with FLOUMAN, who is in none of the demos), and with the colours the game gives them.

What changes from one cartridge to the other: coming out, on the MSX each one has its own drawings (PYONCY 24-26, ROCK ROLL 27-29); on the MSX2 both come out with the same ones (24 and 25) and the same colours. Dying, on the MSX there are three drawings (21-23) and on the MSX2 two (21 and 22).
"""


# ---------------------------------------------------------------- las secuencias
def secuencias(es):
    def fotos(nom, cuadros, pie):
        return "\n".join(par(es, "%s_{v}_%d.png" % (nom, c), pie) for c in cuadros)
    demos = sorted(int(re.search(r"_f(\d+)\.gif$", p).group(1))
                   for p in glob.glob(os.path.join(IMG, "demo_msx2_f*.gif")))
    assert demos == [2, 18, 26, 40, 48, 53], demos
    fase = "Fase" if es else "Stage"
    dem = "\n".join(par(es, "demo_{v}_f%02d.gif" % f, "%s %d" % (fase, f)) for f in demos)
    jap = fig(es, "presentacion_japonesa_msx1.gif",
              "MSX, BIOS japonesa" if es else "MSX, Japanese BIOS")
    if es:
        return """# Las secuencias

Todas son el cartucho ejecutándose: el juego solo, cuadro a cuadro, con la interrupción del MSX (`0x402E`) una vez por cuadro. Las que empiezan a mitad (el menú, la pirámide acabada, el final...) llevan puesto a mano el estado del juego (`0xE200`) y lo que ese estado necesita, como la pirámide y la fase.

## La presentación

""" + par(es, "presentacion_{v}.gif", "La presentación") + """
En MSX1 el título sale según la BIOS (`0x002B`): con una japonesa, エルギーザの封印 («El sello de El Giza»); con otra, King's Valley II. En MSX2 sale siempre el japonés.

<div class="par">
""" + jap + """
</div>

## Las demostraciones

Seis, una por pirámide (fases 2, 18, 26, 40, 48 y 53), con el mando grabado en el banco 12 (parejas de cuadros y teclas).

""" + dem + """
## El menú y la contraseña

START SELECT: NORMAL, PASSWORD o STAGE LOAD (una fase hecha con el editor).

""" + fotos("menu", [199], "El menú") + "\n" + fotos("contrasena", [299], "La contraseña") + """
## El editor

""" + fotos("editor", [220, 599], "El editor") + """
## Pirámide acabada

El plano con las seis pirámides y un letrero distinto en cada una (de la 1 a la 5): HOLD OUT!!, TRY TO TAKE A NEW STEP FORWARD, HEAVEN KNOWS WHEN THIS GAME WILL END, OH! MY GOD! I BELIEVE IN GOD, AT LONG LAST FINAL COUNT DOWN.

""" + par(es, "piramide_acabada_{v}.gif", "Pirámide acabada") + "\n" + \
            fotos("piramide_acabada", [500, 900, 1499], "Pirámide acabada") + """
## Fin de la partida

""" + fotos("fin_de_partida", [149], "Fin de la partida") + """
## El final

CONGRATULATIONS TO VICK XIII !, el mundo salvado, la orden de apagar el interruptor (DANGER !!!), los créditos y THE END.

""" + par(es, "final_{v}.gif", "El final") + "\n" + \
            fotos("final", [900, 1500, 2400, 2990, 4100], "El final") + """
## Los dos minijuegos escondidos

Ver [Curiosidades](CURIOSIDADES.html).

""" + fotos("musicas", [199], "SOUND SELECT") + "\n" + fotos("puzle", [199], "PUZZLE GAME")
    return """# The sequences

They are all the cartridge running: the game on its own, frame by frame, with the MSX interrupt (`0x402E`) once per frame. The ones that start halfway (the menu, the cleared pyramid, the ending...) have the game state (`0xE200`) set by hand, and whatever that state needs, such as the pyramid and the stage.

## The intro

""" + par(es, "presentacion_{v}.gif", "The intro") + """
On the MSX the title depends on the BIOS (`0x002B`): with a Japanese one, エルギーザの封印 ("The Seal of El Giza"); with any other, King's Valley II. On the MSX2 it is always the Japanese one.

<div class="par">
""" + jap + """
</div>

## The demos

Six, one per pyramid (stages 2, 18, 26, 40, 48 and 53), with the joystick input recorded in bank 12 (pairs of frames and keys).

""" + dem + """
## The menu and the password

START SELECT: NORMAL, PASSWORD or STAGE LOAD (a stage made with the editor).

""" + fotos("menu", [199], "The menu") + "\n" + fotos("contrasena", [299], "The password") + """
## The editor

""" + fotos("editor", [220, 599], "The editor") + """
## Pyramid cleared

The map with the six pyramids and a different message for each one (from 1 to 5): HOLD OUT!!, TRY TO TAKE A NEW STEP FORWARD, HEAVEN KNOWS WHEN THIS GAME WILL END, OH! MY GOD! I BELIEVE IN GOD, AT LONG LAST FINAL COUNT DOWN.

""" + par(es, "piramide_acabada_{v}.gif", "Pyramid cleared") + "\n" + \
        fotos("piramide_acabada", [500, 900, 1499], "Pyramid cleared") + """
## Game over

""" + fotos("fin_de_partida", [149], "Game over") + """
## The ending

CONGRATULATIONS TO VICK XIII !, the world saved, the order to turn off the switch (DANGER !!!), the credits and THE END.

""" + par(es, "final_{v}.gif", "The ending") + "\n" + \
        fotos("final", [900, 1500, 2400, 2990, 4100], "The ending") + """
## The two hidden minigames

See [Curiosities](CURIOSITIES.html).

""" + fotos("musicas", [199], "SOUND SELECT") + "\n" + fotos("puzle", [199], "PUZZLE GAME")


# ---------------------------------------------------------------- la musica
def musica(es):
    import musica as mu
    t = []
    if es:
        t.append("""# La música

Las **16 músicas** del cartucho, sacadas **ejecutando su propio motor de sonido** (banco 4, el mismo en los dos cartuchos) fuera del emulador, a MP3 (`tools/musica.py`). La lista sale del propio juego: la selección de músicas escondida (SOUND SELECT) tiene 19 entradas, y tres son efectos. Solo músicas.

Cada una se ha cotejado con lo que el cartucho escribe de verdad en el PSG y en el SCC en openMSX, haciéndola sonar sola 6,6 minutos (más de cinco vueltas): **iguales escritura a escritura las 16, en los dos cartuchos**. Las MP3 duran hasta que la pieza vuelve a empezar, con un tope de 3 minutos.
""")
    else:
        t.append("""# The music

The **16 tunes** in the cartridge, taken **by running its own sound engine** (bank 4, the same on both cartridges) outside the emulator, to MP3 (`tools/musica.py`). The list comes from the game itself: the hidden sound select (SOUND SELECT) has 19 entries, and three are sound effects. Only tunes.

Each one has been checked against what the cartridge really writes to the PSG and the SCC in openMSX, playing it on its own for 6.6 minutes (more than five loops): **identical write for write, all 16, on both cartridges**. The MP3s last until the piece starts again, up to 3 minutes.
""")
    for n, f, _, t_es, t_en, quien, _ in mu.PIEZAS:
        v = hashlib.sha1(open(os.path.join(RAIZ, "docs", "audio", f), "rb").read()).hexdigest()[:8]
        q = re.sub(r"(p\d\d:[0-9A-F]{4}|0x[0-9A-F]+)", r"`\1`", quien)
        if not es:
            q = q.replace(" y ", " and ").replace("el editor", "the editor").replace("tabla", "table")
        t.append("### 0x%02X %s\n" % (n, t_es if es else t_en))
        t.append("*%s %s.*\n" % ("La pide" if es else "Requested by", q))
        t.append('<audio controls preload="none" src="%saudio/%s?v=%s"></audio>\n'
                 % ("../" if es else "", f, v))
    return "\n".join(t)


# ---------------------------------------------------------------- los textos
QUE_EN = {
    "de los menus": "the menus", "del submenu": "the editor submenus",
    "de cada piramide acabada (de la 1 a la 5: la 6 va al final)":
        "each cleared pyramid (1 to 5: the 6th goes to the ending)",
    "del final": "the ending", "de error de disco": "disk error", "de los errores de disco":
        "the disk errors", "sin ficheros": "no files", "del menu de grabar": "the start menu",
    "de la fase": "the stage", "del menu": "the menu", "de las musicas": "the sound select",
    "del puzle": "the puzzle", "del puzle resuelto": "the puzzle solved",
    "de la cinta": "the tape", "de error de cinta": "tape error",
    "del sitio escondido 1": "hidden spot 1", "del sitio escondido 2": "hidden spot 2",
}
QUE_ES = {"de los menus": "de los menús", "del submenu": "de los submenús del editor",
          "de cada piramide acabada (de la 1 a la 5: la 6 va al final)":
              "de cada pirámide acabada (de la 1 a la 5: la 6 va al final)",
          "del menu de grabar": "del menú de empezar", "del menu": "del menú",
          "de las musicas": "de la selección de músicas"}


def textos(es):
    import textos as tx
    if es:
        t = ["""# Los textos

Todos los letreros del cartucho, sacados de la ROM (`tools/textos.py`). Son los mismos en los dos cartuchos. Hay dos fuentes: la de los menús y el juego (`0xE1` = A) y la de las secuencias y el final (`0xDD` = A).

Dos erratas del original: TURN OFF THE **SWICH** (el final) y TOO **MANNY** FILES (un error de disco que no pide nadie).

Los créditos: PROGRAM I.AKADA, K.NAGAE, T.OKA, T.OTSUKA · GRAPHIC H.MAKITANI, M.TABATA, S.UENO, S.IWAMOTO · SOUND K.UEHARA, M.IKARIKO, Y.MANNO, T.FURUKAWA, K.YAMASHITA · TITLE DESIGN N.SATO · GAME DESIGN S.IWAMOTO · SPECIAL THANKS HAL, IKU, SALT, TERA, ROOM 1008, ROOM 1013, RC727.

## La lista entera
"""]
    else:
        t = ["""# The texts

Every text in the cartridge, taken from the ROM (`tools/textos.py`). They are the same on both cartridges. There are two fonts: the one for the menus and the game (`0xE1` = A) and the one for the sequences and the ending (`0xDD` = A).

Two typos in the original: TURN OFF THE **SWICH** (the ending) and TOO **MANNY** FILES (a disk error nobody asks for).

The credits: PROGRAM I.AKADA, K.NAGAE, T.OKA, T.OTSUKA · GRAPHIC H.MAKITANI, M.TABATA, S.UENO, S.IWAMOTO · SOUND K.UEHARA, M.IKARIKO, Y.MANNO, T.FURUKAWA, K.YAMASHITA · TITLE DESIGN N.SATO · GAME DESIGN S.IWAMOTO · SPECIAL THANKS HAL, IKU, SALT, TERA, ROOM 1008, ROOM 1013, RC727.

## The whole list
"""]
    for b, a, que, ls in tx.letreros("msx2"):
        m = re.match(r"(.*) \((el final)\)$", que)
        if m:
            que = "del final" if es else "the ending"
        elif es:
            que = QUE_ES.get(que, que)
        else:
            que = QUE_EN.get(que, que)
        if que in ("DO YOUR BEST",):
            # p01:6963, tras la entrada a la piramide (p01:684A) y antes de la contrasena (p01:697C)
            que = ("al entrar en la pirámide, con la contraseña" if es else
                   "entering the pyramid, with the password")
        t.append("**`p%02d:%04X`** (%s)\n" % (b, a, que))
        t.append("\n".join("    " + ln for ln in ls) + "\n")
    return "\n".join(t)


# ---------------------------------------------------------------- curiosidades
CURIOSIDADES_ES = """# Curiosidades

## Dos contraseñas secretas

En PASSWORD, antes de las normales, el cartucho mira otras dos (`p01:6B24`):

- **FESTIVAL**: partida nueva y Vick no muere al tocar un enemigo (`0xE255`; `p02:9AB1` no los mira).
- **TRYAGAIN**: partida nueva en la que se puede seguir tras el fin de la partida (`0xE217`).

El propio cartucho trae un letrero con las pistas: SECRET COMMAND, F??T???L y ??Y?????.

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
"""

CURIOSIDADES_EN = """# Curiosities

## Two secret passwords

In PASSWORD, before the normal ones, the cartridge checks two others (`p01:6B24`):

- **FESTIVAL**: a new game in which Vick does not die when he touches an enemy (`0xE255`; `p02:9AB1` does not look at them).
- **TRYAGAIN**: a new game in which you can carry on after the game is over (`0xE217`).

The cartridge itself has a message with the hints: SECRET COMMAND, F??T???L and ??Y?????.

## What a password is made of

Eight letters from A to P, two per byte: the stage, the lives, a random number (from the Z80's R register) and the sum of the three, as a check. The three low bits of the random number say how many times the stage and the lives are rotated, so the same game has eight different passwords (`p01:6994`). When it is typed in, the rotations are undone, and stage 0, a stage above 60 and 0 lives are not accepted (`p01:6A71`).

## Two hidden minigames

Twelve stages have a hidden spot (a table in bank 12): it appears if Vick jumps right on it, and pressing down takes you in (`p12:B437`).

- In stages 7, 24, 32, 40, 50 and 53, **SOUND SELECT**: the sound select.
- In stages 20, 29, 35, 43, 52 and 55, **PUZZLE GAME**: a 5 x 5 sliding puzzle (24 pieces and the gap), one of four shuffled ones chosen at random; solved, ALL RIGHT, REST 3 UP: three more lives.

Both of them, in [The sequences](THE-SEQUENCES.html).

## The editor and where it saves

EDIT, on the title screen, opens a stage editor with its menus (FLOOR1, FLOOR2, LADDER, PLAYER, ENEMY, TRAP, TOOL WEAPON, SOUL STONE, EXIT DOOR, SAVE, END). The stage is saved to tape, to disk (an .ELG file) or to Konami's *Game Master 2* (up to three files, FILE1 to FILE3). The cartridge checks what there is: the disk through the H.PHYD hook and the *Game Master 2* by looking for 'YZ' at 0x4010 in the four slots (`p01:6EEA`). The saved stage is played with STAGE LOAD.

## The title depends on the BIOS

The MSX cartridge reads from the BIOS whether the machine is Japanese (`0x002B`) and draws the title in Japanese or in English (`p00:529E`). The MSX2 one always draws it in Japanese.

## What changes from MSX to MSX2

It is the same game with other graphics. Banks 4, 5, 6, 10, 11 and 13 (the sound, the scores, the maps and the stage tables) are identical byte for byte; bank 12 almost; banks 0 to 3 are the same code, shifted; banks 7, 8, 9, 14 and 15 are each one's graphics (on the MSX one, bank 9 is empty, all 0xFF). On the MSX2 the screen has 16 colours with a palette (SCREEN 5) and VRAM page 1 holds graphics (Vick's) and the background some objects cover; on the MSX, SCREEN 2. The interrupt comes in through H.KEYI on the MSX and through H.TIMI on the MSX2.

## What is still open

- What SCOOP and PICK, and HAMMER and DRILL, do differently.
- What TRAP is in the game.
- The ending with a real BIOS: the graphics of list `0x9069` fill the buffer `0xE800`-`0xEFDF` and overwrite the fade (`0xE880`), and the jump at `p01:7835` lands inside the BIOS (`0x1323`). With openMSX's C-BIOS the game stays on PUSH SPACE KEY; with a real MSX's BIOS, untested.
- Saving to the *Game Master 2*: untested.
"""


# ---------------------------------------------------------------- por dentro
def por_dentro(es):
    c1, c2 = CARTUCHOS
    def fila(c):
        d = 100.0 * c["comentarios"] / c["instrucciones"]
        return "| %s | %s | %s | %s | %s | %s %s |" % (
            c["nombre"], mil(c["codigo"], es), mil(c["datos"], es), mil(c["rutinas"], es),
            mil(c["instrucciones"], es), mil(c["comentarios"], es),
            ("(%s %%)" % ("%.1f" % d).replace(".", ",")) if es else "(%.1f%%)" % d)
    tabla = "\n".join([
        "| Cartucho | Código | Datos | Rutinas | Instrucciones | Comentadas |" if es else
        "| Cartridge | Code | Data | Routines | Instructions | Commented |",
        "|---|---|---|---|---|---|", fila(c1), fila(c2)])
    if es:
        return """# Por dentro

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

""" + tabla + """

Qué hay en cada banco:

- banco 0: la interrupción, los repartos de bancos, la carga de gráficos, el mapa y los estados del juego;
- banco 1: los menús del editor, la contraseña, el *Game Master 2*, la salida de los enemigos, la pirámide acabada y el final;
- banco 2: Vick y lo que coge, el editor, el disco y la cinta, y el bloque que se empuja;
- banco 3: los enemigos, lo que hace Vick en cada estado (andar, escaleras, lanzar, cavar) y las puertas giratorias;
- banco 4: el sonido;
- banco 12: los minijuegos, las demostraciones, el final, la cinta y los letreros;
- 5, 6, 10, 11 y 13: solo datos (partituras, mapas, tablas de las fases); 7, 8, 9, 14 y 15: los gráficos.
"""
    return """# Under the hood

## Getting started

This repository does not include the game. It includes the tools that, from your own images of the two cartridges, rebuild the commented listings, reassemble them and check that the ROMs come out **byte for byte**.

### What you need

- `kv2_msx1.rom` (RC-760) and `kv2_msx2.rom` (RC-761), 131,072 bytes each, in the root. Their sha256: `87a51e8744c0dafa0ab27d8b3b16585cfb5f76673ec62ad05c49c58384ce81b8` and `c7f138f16ddb8c8bf7af2fbd136c1f949ab95c375205375a3509d8ad32e00d93`.
- `make`, `python3` and the `pasmo` assembler.
- For the images and the music, Python with PIL and lameenc; for the checks, openMSX.

### What to run

    make                          # both cartridges: trace, listing, reassembly and tests
    make verify                   # the sixteen banks of each one against its ROM
    VARIANTE=msx2 make listado    # just one
    python tools/imagenes.py docs/imagenes
    python tools/musica.py todas docs/audio

`make verify` has to say `OK: la ROM entera reproducible byte a byte` twice.

## One listing, two cartridges

`src/comun` holds the banks that are the same on both (4, 5, 6, 10, 11 and 13), listed once; `src/msx1` and `src/msx2`, each one's own. The tools are the same, and what changes is chosen with `VARIANTE=msx1` or `msx2`. The MSX comments are carried over from the MSX2 ones through the code that matches (`tools/paralelo.py` and `tools/lleva.py`), translating the addresses; `tools/coteja_llevados.py` checks that none of them quotes an MSX2 address. The addresses quoted on this site are those of the MSX2 cartridge.

The images come from `tools/msx2run.py`, which runs the cartridge (the Z80, the mapper with SCC, a trapped BIOS and each machine's VDP), and from `tools/imagenes.py`. The checks against openMSX: `tools/omsx_vram.tcl` (stage 1), `tools/omsx_demo.tcl` with `tools/coteja_demo.py` (the demos) and `tools/omsx_psg.tcl` with `tools/coteja_psg.py` (the music).

## The cartridge

- **The mapper**: Konami with SCC, 16 banks of 8 KB, bank 0 fixed at 0x4000 and the other three windows at 0x7000, 0x9000 and 0xB000 (copied to `0xF0F1`-`0xF0F3`).
- **The interrupt** (`0x402E`): first the sound (banks 4-5-6, `p04:6006`) and then, if the previous frame has finished (`0xE205`), a game frame (`p00:46D4`); if it has not, only the music plays.
- **The sound**: three PSG channels and five SCC ones from `0xE000`.
- **The RAM**: the game state at `0xE200`, the pyramid at `0xE241`, the stage at `0xE242`, the screen at `0xE243`, Vick at `0xE280`, the enemies at `0xE500` (eight of 32 bytes), the stage objects at `0xE600` and `0xE700`, and the screen grid at `0xE788`.

## The code

**100%** of the 131,072 bytes of each cartridge is explained, and no routine is below 10% commented:

""" + tabla + """

What there is in each bank:

- bank 0: the interrupt, the bank switching, loading graphics, the map and the game states;
- bank 1: the editor menus, the password, the *Game Master 2*, the enemies coming out, the cleared pyramid and the ending;
- bank 2: Vick and what he picks up, the editor, disk and tape, and the block that is pushed;
- bank 3: the enemies, what Vick does in each state (walking, ladders, throwing, digging) and the revolving doors;
- bank 4: the sound;
- bank 12: the minigames, the demos, the ending, the tape and the messages;
- 5, 6, 10, 11 and 13: data only (scores, maps, stage tables); 7, 8, 9, 14 and 15: the graphics.
"""


PAGINAS = [  # (en, es, funcion)
    ("THE-PYRAMIDS.md", "LAS-PIRAMIDES.md", piramides),
    ("THE-SCREENS.md", "LAS-PANTALLAS.md", pantallas),
    ("VICK.md", "VICK.md", vick),
    ("THE-ENEMIES.md", "LOS-ENEMIGOS.md", enemigos),
    ("THE-SEQUENCES.md", "LAS-SECUENCIAS.md", secuencias),
    ("THE-MUSIC.md", "LA-MUSICA.md", musica),
    ("THE-TEXTS.md", "LOS-TEXTOS.md", textos),
    ("CURIOSITIES.md", "CURIOSIDADES.md", lambda es: CURIOSIDADES_ES if es else CURIOSIDADES_EN),
    ("UNDER-THE-HOOD.md", "POR-DENTRO.md", por_dentro),
]


def main(docs):
    for en, es, f in PAGINAS:
        for nom, d, lado in ((en, docs, False), (es, os.path.join(docs, "es"), True)):
            os.makedirs(d, exist_ok=True)
            with open(os.path.join(d, nom), "w", encoding="utf-8", newline="\n") as g:
                g.write(f(lado).rstrip("\n") + "\n")
            print("  " + os.path.join(d, nom))
    return 0


if __name__ == "__main__":
    if len(sys.argv) < 2:
        sys.exit(__doc__)
    sys.exit(main(sys.argv[1]))
