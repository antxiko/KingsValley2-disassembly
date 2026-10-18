# King's Valley II - commented disassembly

*(También [en castellano](README.es.md).)*

The commented disassembly of **King's Valley II** (エルギーザの封印, *The Seal of El Giza*; Konami, 1988) on its two cartridges: **RC-760** for the MSX and **RC-761** for the MSX2. Both are 128 KB MegaROMs with Konami's SCC mapper, sixteen 8 KB banks, and they share a single listing: the six banks that are identical on both (4, 5, 6, 10, 11 and 13) are listed once.

| Cartridge | Explained | Code | Data | Routines | Commented |
|---|---|---|---|---|---|
| MSX (RC-760) | 100% | 35,624 | 95,448 | 2,194 | 40.0% |
| MSX2 (RC-761) | 100% | 36,647 | 94,425 | 2,234 | 40.2% |

- Not one byte unassigned, and no routine below 10% comments.
- Each listing reassembles into its original ROM **byte for byte**.
- The 60 stages and their 154 screens, Vick with his tools, the enemies, the intro, the demos, the editor and the ending are **drawn by running the cartridge's own code**, not captured, and checked against openMSX; the 16 tunes come from running its own sound engine and match what the cartridge writes to the PSG and the SCC, write for write.

The website: <https://antxiko.github.io/KingsValley2-disassembly/>
(in Spanish: <https://antxiko.github.io/KingsValley2-disassembly/es/>).

## Reproducing it

The cartridge images are not distributed. Put yours in the root as `kv2_msx1.rom` and `kv2_msx2.rom` and run `make`. The details, in [UNDER THE HOOD](docs/UNDER-THE-HOOD.md).

## Legal

The game belongs to Konami and its rights holders. The `LICENSE` covers only the tools, comments, analysis and documentation here. See [LEGAL-NOTICE.md](LEGAL-NOTICE.md).
