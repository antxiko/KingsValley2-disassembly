#!/usr/bin/env python3
"""Los lectores de datos de King's Valley II y sus formatos, para tools/bloques.py.

Cada recorredor hace con los bytes lo mismo que la rutina del cartucho que
lo lee, y devuelve donde acaba. Las rutinas, con su direccion en NUESTRO
listado. Vacio hasta leer los datos (2026-10-18).
"""
import bloques as B   # noqa: F401


def todo():
    """Declara los bloques de los dos cartuchos (B.bloque ...)."""
