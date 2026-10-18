#!/usr/bin/env python3
"""EL CONTENIDO de la web de estos cartuchos: lo unico que es de este juego.

jekyll.py y make_web.py son la maquinaria y no llevan dentro el nombre de
ningun juego: lo leen de aqui. Las paginas las escribe tools/paginas_web.py.

Todas las cifras de aqui estan medidas sobre cada cartucho, con las
herramientas de tools/: codigo y datos los imprime tools/presupuesto.py
(VARIANTE=msx1|msx2 python3 tools/presupuesto.py work src) y rutinas,
instrucciones y comentarios, tools/densidad_total.py (el "de N" de las flojas
son las rutinas). tests/test_web.py las vuelve a medir.
"""

NOMBRE = "King's Valley II"
CATALOGO = "RC-760 / RC-761"
ANIO = 1988
REPOSITORIO = "https://github.com/antxiko/KingsValley2-disassembly"

# Un listado, dos cartuchos: las cifras de cada uno
CARTUCHOS = [
    dict(variante="msx1", nombre="MSX (RC-760)", codigo=35624, datos=95448, rutinas=2194,
         instrucciones=17775, comentarios=7115),
    dict(variante="msx2", nombre="MSX2 (RC-761)", codigo=36647, datos=94425, rutinas=2234,
         instrucciones=18530, comentarios=7444),
]

PIE_LEGAL = {
    "es": "<em>King's Valley II</em> (エルギーザの封印, <em>The Seal of El Giza</em>) lo "
          "public&oacute; Konami en 1988 en dos cartuchos, RC-760 para MSX y RC-761 para "
          "MSX2, de 128 KB cada uno. Todos los derechos sobre el juego siguen siendo de "
          "sus titulares. Este trabajo es de preservaci&oacute;n, estudio y "
          "documentaci&oacute;n, y las im&aacute;genes de los cartuchos no se distribuyen.",
    "en": "<em>King's Valley II</em> (エルギーザの封印, <em>The Seal of El Giza</em>) was "
          "published by Konami in 1988 on two cartridges, RC-760 for the MSX and RC-761 for "
          "the MSX2, 128 KB each. All rights in the game remain with their holders. This is "
          "preservation, study and documentation work, and the cartridge images are not "
          "distributed.",
}

PORTADA = {
    "es": dict(
        titulo="King's Valley II - desensamblado comentado",
        claim="Los dos cartuchos, el de MSX y el de MSX2, en un mismo listado: las seis "
              "pir&aacute;mides con sus 60 fases y cada pantalla, Vick con sus seis "
              "herramientas, los cuatro enemigos, el editor de fases, las dos "
              "contrase&ntilde;as secretas, los dos minijuegos escondidos y la "
              "m&uacute;sica sacada de su propio motor.",
        ficha=["Konami - <b>(c) Konami 1988</b>",
               "Cartuchos <b>RC-760</b> (MSX) y <b>RC-761</b> (MSX2), MegaROM de 128 KB "
               "(Konami con SCC)",
               "<b>MSX</b> y <b>MSX2</b>", "Volcados <b>cfd872d0...</b> y <b>5ec88112...</b>"],
        aviso="<b>Aqu&iacute; no hay ninguna captura.</b> Todas las im&aacute;genes "
              "est&aacute;n <b>pintadas ejecutando el c&oacute;digo del propio "
              "cartucho</b> (el Z80, el mapper, la BIOS y el VDP de cada m&aacute;quina) "
              "y cotejadas con openMSX: la fase 1, igual byte a byte en la VRAM; las "
              "demostraciones, con las tablas de sprites iguales durante 1.200 cuadros.",
    ),
    "en": dict(
        titulo="King's Valley II - commented disassembly",
        claim="Both cartridges, the MSX one and the MSX2 one, in a single listing: the six "
              "pyramids with their 60 stages and every screen, Vick with his six tools, "
              "the four enemies, the stage editor, the two secret passwords, the two "
              "hidden minigames and the music taken from its own engine.",
        ficha=["Konami - <b>(c) Konami 1988</b>",
               "Cartridges <b>RC-760</b> (MSX) and <b>RC-761</b> (MSX2), 128 KB MegaROM "
               "(Konami with SCC)",
               "<b>MSX</b> and <b>MSX2</b>", "Dumps <b>cfd872d0...</b> and <b>5ec88112...</b>"],
        aviso="<b>There are no screenshots here.</b> Every image is <b>drawn by running "
              "the cartridge's own code</b> (the Z80, the mapper, the BIOS and the VDP of "
              "each machine) and checked against openMSX: stage 1, identical byte for "
              "byte in VRAM; the demos, with identical sprite tables for 1,200 frames.",
    ),
}

# Los tres bloques: el juego | curiosidades | por dentro.
# (en, es, titulo en, titulo es, que hay en, que hay es)
PAGINAS = [
    [("THE-PYRAMIDS.html", "LAS-PIRAMIDES.html", "The pyramids", "Las pir&aacute;mides",
      "the six pyramids and their 60 stages, every map whole in both editions",
      "las seis pir&aacute;mides y sus 60 fases, cada mapa entero en las dos ediciones"),
     ("THE-SCREENS.html", "LAS-PANTALLAS.html", "The screens", "Las pantallas",
      "the 154 screens, one by one, on the MSX and on the MSX2",
      "las 154 pantallas, una a una, en MSX y en MSX2"),
     ("VICK.html", "VICK.html", "Vick", "Vick",
      "the hero with each tool and everything there is in the stages",
      "el personaje con cada herramienta y todo lo que hay en las fases"),
     ("THE-ENEMIES.html", "LOS-ENEMIGOS.html", "The enemies", "Los enemigos",
      "the four enemies, with their names from the editor",
      "los cuatro enemigos, con sus nombres del editor"),
     ("THE-SEQUENCES.html", "LAS-SECUENCIAS.html", "The sequences", "Las secuencias",
      "the intro, the demos, the menu, the password, the editor, the cleared pyramid "
      "and the ending",
      "la presentaci&oacute;n, las demostraciones, el men&uacute;, la contrase&ntilde;a, "
      "el editor, la pir&aacute;mide acabada y el final"),
     ("THE-MUSIC.html", "LA-MUSICA.html", "The music", "La m&uacute;sica",
      "the 16 tunes, from its own sound engine",
      "las 16 m&uacute;sicas, de su propio motor de sonido"),
     ("THE-TEXTS.html", "LOS-TEXTOS.html", "The texts", "Los textos",
      "every text in the cartridge", "todos los letreros del cartucho")],
    [("CURIOSITIES.html", "CURIOSIDADES.html", "Curiosities", "Curiosidades",
      "the passwords FESTIVAL and TRYAGAIN, the hidden spots, the editor and where it "
      "saves, what changes from MSX to MSX2, what is still open",
      "las contrase&ntilde;as FESTIVAL y TRYAGAIN, los sitios escondidos, el editor y "
      "d&oacute;nde graba, lo que cambia de MSX a MSX2, lo que queda abierto")],
    [("UNDER-THE-HOOD.html", "POR-DENTRO.html", "Under the hood", "Por dentro",
      "rebuilding both ROMs, the mapper, the interrupt, the RAM and the code",
      "rehacer las dos ROM, el mapper, la interrupci&oacute;n, la RAM y el c&oacute;digo")],
]

# Repositorio nuevo: no hay paginas viejas que redirigir.
VIEJAS = {}

LOGOTIPO = "titulo_solo.png"
