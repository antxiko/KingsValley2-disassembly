# Aviso legal y atribución

*(Also available [in English](LEGAL-NOTICE.md).)*

## De quién es cada cosa

**El juego no es nuestro.** *King's Valley II - The Seal of El Giza* lo publicó **Konami** en 1988 en dos cartuchos de 128 KB: **RC-760** para MSX y **RC-761** para MSX2. Todos los derechos sobre el juego siguen siendo de sus titulares.

**Lo que sí es nuestro** son las herramientas de este repositorio, los comentarios del listado, el análisis y la documentación. Eso se publica con la licencia de `LICENSE`.

## Qué hay en este repositorio

Los ficheros `src/*/kv2_*pNN.asm` son el desensamblado comentado de los dieciséis bancos de cada cartucho. Se publican para la **preservación, el estudio y la documentación** de un título que es parte de la historia del software del MSX.

La imagen del cartucho (`.rom`) **no** se distribuye aquí. Quien quiera volver a montar el listado tiene que poner la suya, y el `Makefile` comprueba su sha256 antes de hacer nada.

Las imágenes fijas de `docs/imagenes/` no son ilustraciones traídas de fuera ni capturas: se dibujan leyendo las tablas del propio cartucho, o se rehacen con sus bytes, y se cotejan con la VRAM del emulador. Las animaciones son la VRAM de cada cuadro de una partida en openMSX, con sus dibujos cotejados con la ROM.

## En qué se apoya

Todo lo que se afirma aquí sale de leer este binario, y cada afirmación lleva su evidencia al lado: la instrucción que lee un dato o la tabla que cierra donde tiene que cerrar. Lo que no está cerrado se dice que no lo está.

## Si eres uno de los autores

Si trabajaste en *King's Valley II* o tienes derechos sobre el juego, y preferirías que este material no estuviera publicado, **dilo y se retira, sin discusión**. La intención de este trabajo es justo la contraria de perjudicarte: es dejar constancia de cómo se hizo.
