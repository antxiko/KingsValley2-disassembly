# Legal notice and attribution

*(También disponible [en castellano](AVISO-LEGAL.md).)*

## Who owns what

**The game is not ours.** *King's Valley II - The Seal of El Giza* was published by **Konami** in 1988 on two 128 KB cartridges: **RC-760** for the MSX and **RC-761** for the MSX2. All rights in the game remain with their holders.

**What is ours** are the tools in this repository, the comments in the listing, the analysis and the documentation. That is published under the `LICENSE`.

## What is in this repository

The files `src/*/kv2_*pNN.asm` are the commented disassembly of the sixteen banks of each cartridge. They are published for the **preservation, study and documentation** of a title that is part of the history of MSX software.

The cartridge image (`.rom`) is **not** distributed here. Anyone who wants to rebuild the listing has to supply their own, and the `Makefile` checks its sha256 before doing anything.

The still images in `docs/imagenes/` are neither artwork brought from elsewhere nor screenshots: they are drawn by reading the cartridge's own tables, or rebuilt from its bytes, and checked against the emulator's VRAM. The animations are the VRAM of every frame of a game in openMSX, with their graphics checked against the ROM.

## What it rests on

Everything stated here comes from reading this binary, and each claim carries its evidence alongside: the instruction that reads a piece of data or the table that closes where it has to. What is not settled is said not to be.

## If you are one of the authors

If you worked on *King's Valley II* or hold rights in the game, and would rather this material were not published, **say so and it will be taken down, no questions asked**. The intention of this work is the very opposite of harming you: it is to record how it was made.
