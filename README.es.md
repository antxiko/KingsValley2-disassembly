# King's Valley II - desensamblado comentado

*(Also [in English](README.md).)*

El desensamblado comentado de **King's Valley II** (エルギーザの封印, *The Seal of El Giza*; Konami, 1988) en sus dos cartuchos: **RC-760** para MSX y **RC-761** para MSX2. Los dos son MegaROM de 128 KB con el mapper de Konami con SCC, dieciséis bancos de 8 KB, y comparten un solo listado: los seis bancos que son iguales en los dos (4, 5, 6, 10, 11 y 13) se listan una vez.

| Cartucho | Explicado | Código | Datos | Rutinas | Comentado |
|---|---|---|---|---|---|
| MSX (RC-760) | 100 % | 35.624 | 95.448 | 2.194 | 40,0 % |
| MSX2 (RC-761) | 100 % | 36.647 | 94.425 | 2.234 | 40,2 % |

- Ni un byte sin asignar, y ninguna rutina por debajo del 10 % comentado.
- Cada listado reensambla su ROM original **byte a byte**.
- Las 60 fases y sus 154 pantallas, Vick con sus herramientas, los enemigos, la presentación, las demostraciones, el editor y el final están **pintados ejecutando el código del propio cartucho**, no capturados, y cotejados con openMSX; las 16 músicas salen de ejecutar su propio motor de sonido y son iguales, escritura a escritura, a lo que el cartucho escribe en el PSG y en el SCC.

La web: <https://antxiko.github.io/KingsValley2-disassembly/es/>
(en inglés: <https://antxiko.github.io/KingsValley2-disassembly/>).

## Reproducirlo

Las imágenes de los cartuchos no se distribuyen. Pon las tuyas en la raíz como `kv2_msx1.rom` y `kv2_msx2.rom` y ejecuta `make`. Los detalles, en [POR DENTRO](docs/es/POR-DENTRO.md).

## Aviso legal

El juego es de Konami y de sus titulares. La `LICENSE` cubre solo las herramientas, los comentarios, el análisis y la documentación de aquí. Lee [AVISO-LEGAL.md](AVISO-LEGAL.md).
