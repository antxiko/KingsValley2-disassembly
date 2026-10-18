#!/usr/bin/env python3
"""Coteja el PSG (y el SCC, si lo hay) de openMSX con tools/musica.py.

Por cada sonido que el juego pide en la partida grabada (`S nn`), toma las
escrituras al PSG cuadro a cuadro desde ese momento hasta la siguiente
peticion y las compara con las que da musica.py ejecutando el mismo motor desde
cero. Solo cuentan los registros 0-13 del PSG (el 14 y el 15 son los del
mando). Se compara el ESTADO del chip al acabar cada cuadro, partiendo del
estado al pedir la pieza; `ident` cuenta ademas los cuadros con escrituras
identicas. Con SCC (lineas `C desplazamiento dato` de la sonda, 0x9800 = 0) se
compara tambien su estado, en los desplazamientos que la pieza escribe.

Uso:  coteja_psg.py work/psg/psg.txt [fusiona]
`fusiona`: una peticion repetida del mismo numero no cuenta (el motor la ignora
por prioridad); sin ella, cada peticion reinicia la pieza.
"""
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import motor_musica  # noqa: E402
import musica  # noqa: E402

MIN_CUADROS = 40       # las peticiones mas cortas las pisa la siguiente


def lee(ruta, fusiona=False, salta=None):
    """[(numero, psg_inicial, [cuadros psg], scc_inicial, [cuadros scc])]
    salta(actual, nuevo): True si la peticion nueva no corta el tramo (un efecto
    en sus propios canales mientras suena una musica de seis)."""
    tramos, actual, cuadro, cuadro_scc = [], None, None, None
    psg = [0] * 14
    scc = {}
    for ln in open(ruta):
        p = ln.split()
        if not p:
            continue
        if p[0] == "S" and fusiona and actual is not None \
                and int(p[1]) == actual[0]:
            continue                # el juego la pide otra vez y el motor no la reinicia
        if p[0] == "S" and salta and actual is not None and salta(actual[0], int(p[1])):
            continue
        if p[0] == "S":
            actual = (int(p[1]), list(psg), [], dict(scc), [])
            tramos.append(actual)
            cuadro = cuadro_scc = None
        elif p[0] == "F":
            if actual is not None:
                cuadro, cuadro_scc = [], []
                actual[2].append(cuadro)
                actual[4].append(cuadro_scc)
        elif p[0] == "W":
            r, v = int(p[1]), int(p[2])
            if r < 14:
                psg[r] = v
                if cuadro is not None:
                    cuadro.append((r, v))
                elif actual is not None:
                    actual[1][r] = v       # lo que escribe la propia peticion, antes del cuadro
        elif p[0] == "C":
            o, v = int(p[1]), int(p[2])
            scc[o] = v
            if cuadro_scc is not None:
                cuadro_scc.append((o, v))
            elif actual is not None:
                actual[3][o] = v
    return tramos


def cabecera(numero, rom):
    """El primer byte de la cabecera del sonido (los canales que usa), de la
    tabla CFG["cabeceras"] = (banco, direccion) de musica.py."""
    tabla = musica.CFG.get("cabeceras")
    if not tabla:
        return None
    banco, dir_ = tabla
    base = banco * 0x2000 - 0x6000

    def lee(x):
        return rom[base + x] if 0x6000 <= x < 0x8000 else rom[(banco + 1) * 0x2000 + x - 0x8000]
    a = lee(dir_ + 2 * numero) | lee(dir_ + 2 * numero + 1) << 8
    return lee(a) if 0x6000 <= a < 0xA000 else None


def mascaras(numero, rom):
    """Con seis canales (cabecera 0xCF: PSG A y B y los cuatro ultimos del SCC),
    los efectos van en los otros (0x30: PSG C y el primero del SCC) y comparten
    el mezclador (registro 7) y la mascara del SCC (0x8F): se comparan solo los
    bits de los canales de la pieza."""
    if cabecera(numero, rom) == 0xCF:
        return 0x1B, 0x1E
    return None, None


def main(ruta, fusiona=False, como=None):
    """como = {pedida: tocada}: la sonda corrio con una ROM cuya cabecera de
    `pedida` apunta a la de `tocada` (tools/rom_musica.py)."""
    rom = open(os.path.join(motor_musica.RAIZ, musica.CFG["rom"]), "rb").read()
    como = como or {}

    def salta(actual, nuevo):
        return cabecera(actual, rom) == 0xCF and (cabecera(nuevo, rom) == 0x30 or nuevo >= 0xF0)
    for a, inicial, cuadros, scc0, cuadros_scc in lee(ruta, fusiona, salta):
        a = como.get(a, a)
        if len(cuadros) < MIN_CUADROS:
            continue
        mios_todo, _ = motor_musica.ejecuta(musica.CFG, rom, a,
                                            maximo=len(cuadros) + 1)
        mios = [[x for x in c if x[0] < 0x100] for c in mios_todo]
        mios_scc = [[(x[0] - 0x100, x[1]) for x in c if x[0] >= 0x100]
                    for c in mios_todo]
        n = min(len(cuadros), len(mios))
        m7, m8f = mascaras(a, rom)
        usados = {r for c in mios[:n] for r, _ in c}
        if m7 is not None:
            # seis canales: el C del PSG (4, 5, 10) y el primero del SCC (su onda
            # 0x00-0x1F, su periodo 0x80-0x81 y su volumen 0x8A) son de los efectos
            usados -= {4, 5, 10}
        usados_scc = {o for c in mios_scc[:n] for o, _ in c}
        if mascaras(a, rom)[0] is not None:
            usados_scc -= set(range(0x20)) | {0x80, 0x81, 0x8A}
        for filtro, nota in ((None, ""), (usados, " (solo los registros que la pieza toca: "
                                          "el resto lo tenia ocupado otro sonido del juego)")):
            ellos, nos = list(inicial), list(inicial)
            e_scc, n_scc = dict(scc0), dict(scc0)
            distinto = None
            for i in range(n):
                for r, v in cuadros[i]:
                    if r < 14:
                        ellos[r] = v
                for r, v in mios[i]:
                    if r < 14:
                        nos[r] = v
                for o, v in cuadros_scc[i]:
                    e_scc[o] = v
                for o, v in mios_scc[i]:
                    n_scc[o] = v
                if distinto is None:
                    for r in range(14):
                        if r == 7 and m7 is not None and filtro is not None:
                            if (ellos[7] ^ nos[7]) & m7:
                                distinto = (i, "PSG", list(ellos), list(nos))
                                break
                            continue
                        if (filtro is None or r in filtro) and ellos[r] != nos[r]:
                            distinto = (i, "PSG", list(ellos), list(nos))
                            break
                if distinto is None:
                    for o in usados_scc:
                        if o == 0x8F and m8f is not None and filtro is not None:
                            if ((e_scc.get(o) or 0) ^ (n_scc.get(o) or 0)) & m8f:
                                distinto = (i, "SCC", "0x8F=%s" % e_scc.get(o), "0x8F=%s" % n_scc.get(o))
                                break
                            continue
                        if e_scc.get(o) != n_scc.get(o):
                            distinto = (i, "SCC", "0x%02X=%s" % (o, e_scc.get(o)),
                                        "0x%02X=%s" % (o, n_scc.get(o)))
                            break
            if distinto is None:
                break
        iguales = sum(1 for i in range(n)
                      if [x for x in cuadros[i] if x[0] < 14]
                      == [x for x in mios[i] if x[0] < 14])
        escr = sum(len(c) for c in cuadros[:n])
        extra = " + SCC en %d desplazamientos" % len(usados_scc) if usados_scc else ""
        if distinto is None:
            print("0x%02X: %d cuadros (%d escrituras): el chip IGUAL en todos%s%s; "
                  "escrituras identicas en %d" % (a, n, escr, extra, nota, iguales))
        else:
            i, que, e, m = distinto
            print("0x%02X: %d cuadros, el %s DISTINTO en el %d\n   openMSX %s"
                  "\n   musica  %s" % (a, n, que, i, e, m))


if __name__ == "__main__":
    como = {}
    for x in sys.argv[2:]:
        if x.startswith("como="):
            de, a = x[5:].split(":")
            como[int(de, 0)] = int(a, 0)
    main(sys.argv[1], "fusiona" in sys.argv[2:], como)
