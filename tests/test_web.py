#!/usr/bin/env python3
"""La web dice lo que miden las herramientas.

- Las cifras de la portada (tools/contenido_web.CARTUCHOS) son las que dan hoy
  tools/presupuesto.py y tools/densidad_total.py, cartucho a cartucho.
- Codigo y datos suman el cartucho entero.
- Ninguna pagina ni la maquinaria de la web nombran otro juego de la serie
  (el armazon viene de otro proyecto). El Game Master 2 si sale: es el
  cartucho donde este graba las fases.
"""
import glob
import os
import re
import subprocess
import sys
import unittest

RAIZ = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
TOOLS = os.path.join(RAIZ, "tools")
sys.path.insert(0, TOOLS)
import contenido_web  # noqa: E402

OTROS_JUEGOS = ("Parodius", "Salamander", "Gradius", "Nemesis", "Galious", "Usas",
                "Metal Gear", "Goemon", "Shalom", "Knightmare", "Dunk Shot",
                "Vampire Killer", "Hinotori", "Q*bert", "King Kong", "Circus Charlie",
                "Magical Tree", "Comic Bakery", "Rastan", "Synthesizer", "Pennant",
                "Yie Ar", "Road Fighter", "Ping Pong", "Sky Jaguar", "Hyper Rally",
                "Hyper Olympic", "Hyper Sports", "Billiards", "Mahjong", "Tennis",
                "Baseball", "Golf", "Antarctic", "Pippols", "Frogger", "Time Pilot",
                "Super Cobra", "Monkey", "Athletic", "Middle Earth", "Pitfall",
                "Stardust", "Dragon Slayer", "Twinbee", "TwinBee", "F-1 Spirit", "F1 Spirit")

# La seccion del codigo compartido con los otros Konami de la serie los
# nombra a proposito: la escribe pon_en_webs.py, de MSX-disassembly-database.
_COMPARTIDO = re.compile(
    r"(?:^## |<h2[^>]*>)(?:Code shared with other Konami cartridges|"
    r"C\u00f3digo compartido con otros cartuchos de Konami)"
    r".*?(?=^## |<h2|</main>|<footer|\Z)", re.S | re.M)


def sin_compartido(texto):
    """El texto sin la seccion del codigo compartido."""
    return _COMPARTIDO.sub("", texto)


def corre(v, *orden):
    return subprocess.run([sys.executable] + list(orden), cwd=RAIZ, capture_output=True,
                          text=True, env=dict(os.environ, VARIANTE=v)).stdout


class TestWeb(unittest.TestCase):

    def test_las_cifras_de_la_portada_son_las_del_listado(self):
        for c in contenido_web.CARTUCHOS:
            if not os.path.isdir(os.path.join(RAIZ, "work", c["variante"])):
                self.skipTest("sin trazar (make)")
            p = corre(c["variante"], os.path.join(TOOLS, "presupuesto.py"), "work", "src")
            cod = int(re.search(r"codigo trazado\s+(\d+)", p).group(1))
            dat = int(re.search(r"datos identificados\s+(\d+)", p).group(1))
            self.assertEqual((cod, dat), (c["codigo"], c["datos"]), c["nombre"])
            d = corre(c["variante"], os.path.join(TOOLS, "densidad_total.py"))
            m = re.search(r"TOTAL (\d+) instrucciones, (\d+) comentarios, [\d.]+ %, "
                          r"flojas (\d+) de (\d+)", d)
            self.assertEqual((int(m.group(1)), int(m.group(2)), int(m.group(4))),
                             (c["instrucciones"], c["comentarios"], c["rutinas"]), c["nombre"])
            self.assertEqual(int(m.group(3)), 0, "rutinas flojas en " + c["nombre"])

    def test_la_suma_de_bytes_da_el_cartucho(self):
        for c in contenido_web.CARTUCHOS:
            self.assertEqual(c["codigo"] + c["datos"], 131072, c["nombre"])

    def test_no_se_nombra_otro_juego_de_la_serie(self):
        ficheros = (glob.glob(os.path.join(RAIZ, "docs", "*.md")) +
                    glob.glob(os.path.join(RAIZ, "docs", "es", "*.md")) +
                    glob.glob(os.path.join(RAIZ, "docs", "*.html")) +
                    glob.glob(os.path.join(RAIZ, "docs", "es", "*.html")) +
                    [os.path.join(TOOLS, f) for f in ("contenido_web.py", "make_web.py",
                                                       "jekyll.py", "paginas_web.py")] +
                    [os.path.join(RAIZ, f) for f in ("LICENSE", "AVISO-LEGAL.md",
                                                      "LEGAL-NOTICE.md", "Makefile")])
        malos = []
        for f in ficheros:
            if not os.path.exists(f):
                continue
            with open(f, encoding="utf-8", errors="ignore") as g:
                txt = sin_compartido(g.read())
            for j in OTROS_JUEGOS:
                if j.lower() in txt.lower():
                    malos.append("%s: %s" % (os.path.relpath(f, RAIZ), j))
        self.assertEqual(malos, [])


if __name__ == "__main__":
    unittest.main()
