#!/usr/bin/env python3
"""Cual de los dos cartuchos se esta tratando.

Este desensamblado lleva DOS cartuchos del mismo juego, uno para MSX y otro
para MSX2. La maquinaria es la misma para los dos; lo que cambia son los datos
de cada uno (tools/paginas.py, tools/cartucho.py), que se eligen con la
variable de entorno VARIANTE ("msx1" o "msx2"). El Makefile la pone en cada
orden; a mano:

    VARIANTE=msx2 python3 tools/bancos.py kv2_msx2.rom resumen
"""
import os
import sys

VARIANTES = ("msx1", "msx2")


def actual():
    """La variante de la orden en curso; se para si no hay o no vale."""
    v = os.environ.get("VARIANTE", "")
    if v not in VARIANTES:
        sys.exit("falta VARIANTE=msx1 o VARIANTE=msx2 en el entorno (ver tools/variante.py)")
    return v


def elige(por_variante):
    """El valor de la variante en curso de un dict {"msx1": ..., "msx2": ...}."""
    return por_variante[actual()]
