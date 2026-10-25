# Under the hood

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

| Cartridge | Code | Data | Routines | Instructions | Commented |
|---|---|---|---|---|---|
| MSX (RC-760) | 35,624 | 95,448 | 2,194 | 17,775 | 7,115 (40.0%) |
| MSX2 (RC-761) | 36,647 | 94,425 | 2,234 | 18,530 | 7,444 (40.2%) |

What there is in each bank:

- bank 0: the interrupt, the bank switching, loading graphics, the map and the game states;
- bank 1: the editor menus, the password, the *Game Master 2*, the enemies coming out, the cleared pyramid and the ending;
- bank 2: Vick and what he picks up, the editor, disk and tape, and the block that is pushed;
- bank 3: the enemies, what Vick does in each state (walking, ladders, throwing, digging) and the revolving doors;
- bank 4: the sound;
- bank 12: the minigames, the demos, the ending, the tape and the messages;
- 5, 6, 10, 11 and 13: data only (scores, maps, stage tables); 7, 8, 9, 14 and 15: the graphics.

## Code shared with other Konami cartridges

This disassembly has been compared, instruction by instruction, with
every other Konami one in the series. A block counts when the same
instructions, at least six of them from a label to its `ret` or its
unconditional jump, are in both cartridges; the addresses are left
aside, because they change from one cartridge to the next. Of the
other 57, **48** have at least one block in common with this one;
these are the ones that share the most:

| Cartridge | Blocks | Instructions | For example (here = there) |
|---|---:|---:|---|
| [The Pro Yakyuu Gekitotsu Pennant Race](https://antxiko.github.io/PennantRace-disassembly/) | 85 | 1,378 | p00:4E20 = `rachas_con_destino` |
| [Parodius](https://antxiko.github.io/Parodius-disassembly/) | 80 | 1,279 | p00:54CD = `rachas_8120` |
| [Nemesis 3 - The Eve of Destruction](https://antxiko.github.io/Nemesis3-disassembly/) | 75 | 1,153 | p00:4129 = `cartucho_en_8000` |
| [Salamander - Operation X](https://antxiko.github.io/Salamander-disassembly/) | 72 | 1,149 | p00:5033 = `caracteres` |
| [Gekitotsu Pennant Race 2](https://antxiko.github.io/PennantRace2-disassembly/) | 70 | 931 | p04:6993 = `orden_eb` |
| [Contra](https://antxiko.github.io/Contra-disassembly/) | 66 | 1,277 | p04:6E07 |
| [Shalom: Knightmare III](https://antxiko.github.io/Shalom-disassembly/) | 54 | 735 | p04:6993 = `orden_eb` |
| [Nemesis 2](https://antxiko.github.io/Nemesis2-disassembly/) | 49 | 702 | p04:6DA2 = `canales_del_scc` |
| [F-1 Spirit — The Way to Formula 1](https://antxiko.github.io/F1Spirit-disassembly/) | 48 | 757 | p04:648D = `NOTA_CRUDA` |
| [Hai no Majutsushi - Mahjong 2](https://antxiko.github.io/Majutsushi-disassembly/) | 45 | 541 | p00:4129 = `cartucho_en_8000` |

The whole matrix, the 58 cartridges against each other, is on
[The routines](https://antxiko.github.io/MSX-disassembly-database/THE-ROUTINES.html) in the series database, along
with the method and the program that measures it.
