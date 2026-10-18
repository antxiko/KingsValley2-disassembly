# Curiosities

## Two secret passwords

In PASSWORD, before the normal ones, the cartridge checks two others (`p01:6B24`):

- **FESTIVAL**: a new game in which Vick does not die when he touches an enemy (`0xE255`; `p02:9AB1` does not look at them).
- **TRYAGAIN**: a new game in which you can carry on after the game is over (`0xE217`).

The cartridge itself has a message with the hints: SECRET COMMAND, F??T???L and ??Y?????.

## What a password is made of

Eight letters from A to P, two per byte: the stage, the lives, a random number (from the Z80's R register) and the sum of the three, as a check. The three low bits of the random number say how many times the stage and the lives are rotated, so the same game has eight different passwords (`p01:6994`). When it is typed in, the rotations are undone, and stage 0, a stage above 60 and 0 lives are not accepted (`p01:6A71`).

## Two hidden minigames

Twelve stages have a hidden spot (a table in bank 12): it appears if Vick jumps right on it, and pressing down takes you in (`p12:B437`).

- In stages 7, 24, 32, 40, 50 and 53, **SOUND SELECT**: the sound select.
- In stages 20, 29, 35, 43, 52 and 55, **PUZZLE GAME**: a 5 x 5 sliding puzzle (24 pieces and the gap), one of four shuffled ones chosen at random; solved, ALL RIGHT, REST 3 UP: three more lives.

Both of them, in [The sequences](THE-SEQUENCES.html).

## The editor and where it saves

EDIT, on the title screen, opens a stage editor with its menus (FLOOR1, FLOOR2, LADDER, PLAYER, ENEMY, TRAP, TOOL WEAPON, SOUL STONE, EXIT DOOR, SAVE, END). The stage is saved to tape, to disk (an .ELG file) or to Konami's *Game Master 2* (up to three files, FILE1 to FILE3). The cartridge checks what there is: the disk through the H.PHYD hook and the *Game Master 2* by looking for 'YZ' at 0x4010 in the four slots (`p01:6EEA`). The saved stage is played with STAGE LOAD.

## The title depends on the BIOS

The MSX cartridge reads from the BIOS whether the machine is Japanese (`0x002B`) and draws the title in Japanese or in English (`p00:529E`). The MSX2 one always draws it in Japanese.

## What changes from MSX to MSX2

It is the same game with other graphics. Banks 4, 5, 6, 10, 11 and 13 (the sound, the scores, the maps and the stage tables) are identical byte for byte; bank 12 almost; banks 0 to 3 are the same code, shifted; banks 7, 8, 9, 14 and 15 are each one's graphics (on the MSX one, bank 9 is empty, all 0xFF). On the MSX2 the screen has 16 colours with a palette (SCREEN 5) and VRAM page 1 holds graphics (Vick's) and the background some objects cover; on the MSX, SCREEN 2. The interrupt comes in through H.KEYI on the MSX and through H.TIMI on the MSX2.

## What is still open

- What SCOOP and PICK, and HAMMER and DRILL, do differently.
- What TRAP is in the game.
- The ending with a real BIOS: the graphics of list `0x9069` fill the buffer `0xE800`-`0xEFDF` and overwrite the fade (`0xE880`), and the jump at `p01:7835` lands inside the BIOS (`0x1323`). With openMSX's C-BIOS the game stays on PUSH SPACE KEY; with a real MSX's BIOS, untested.
- Saving to the *Game Master 2*: untested.
