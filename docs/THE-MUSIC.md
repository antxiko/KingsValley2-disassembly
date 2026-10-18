# The music

The **16 tunes** in the cartridge, taken **by running its own sound engine** (bank 4, the same on both cartridges) outside the emulator, to MP3 (`tools/musica.py`). The list comes from the game itself: the hidden sound select (SOUND SELECT) has 19 entries, and three are sound effects. Only tunes.

Each one has been checked against what the cartridge really writes to the PSG and the SCC in openMSX, playing it on its own for 6.6 minutes (more than five loops): **identical write for write, all 16, on both cartridges**. The MP3s last until the piece starts again, up to 3 minutes.

### 0x03 The intro

*Requested by `p00:4753`.*

<audio controls preload="none" src="audio/musica_03.mp3?v=09f3f4a2"></audio>

### 0x10 The menu

*Requested by `p00:47DD`.*

<audio controls preload="none" src="audio/musica_10.mp3?v=8ec26494"></audio>

### 0x11 Chosen (menu and editor)

*Requested by `p00:4801` and the editor (p02).*

<audio controls preload="none" src="audio/musica_11.mp3?v=0e8b30e7"></audio>

### 0x05 Stages 1 and 2 of each pyramid

*Requested by `p00:438D`, table `0x43A4`.*

<audio controls preload="none" src="audio/musica_05.mp3?v=1fe13000"></audio>

### 0x06 Stages 3 and 4

*Requested by `p00:438D`, table `0x43A4`.*

<audio controls preload="none" src="audio/musica_06.mp3?v=f1853d72"></audio>

### 0x07 Stages 5 and 6

*Requested by `p00:438D`, table `0x43A4`.*

<audio controls preload="none" src="audio/musica_07.mp3?v=6ec9f890"></audio>

### 0x08 Stages 7 and 8

*Requested by `p00:438D`, table `0x43A4`.*

<audio controls preload="none" src="audio/musica_08.mp3?v=d700af87"></audio>

### 0x09 Stages 9 and 10

*Requested by `p00:438D`, table `0x43A4`.*

<audio controls preload="none" src="audio/musica_09.mp3?v=91dbc841"></audio>

### 0x0B The last soul stone: the exit opens

*Requested by `p02:99E8`.*

<audio controls preload="none" src="audio/musica_0B.mp3?v=37fefae1"></audio>

### 0x28 Vick dies

*Requested by `p00:49B1` and `p02:9AFB`.*

<audio controls preload="none" src="audio/musica_28.mp3?v=41834ffd"></audio>

### 0x0F Game over

*Requested by `p00:4A35`.*

<audio controls preload="none" src="audio/musica_0F.mp3?v=cc78c04a"></audio>

### 0x0D Pyramid cleared

*Requested by `p01:6FC7`.*

<audio controls preload="none" src="audio/musica_0D.mp3?v=0c9a2c47"></audio>

### 0x0A The puzzle

*Requested by `p12:B6EF`.*

<audio controls preload="none" src="audio/musica_0A.mp3?v=f3b35201"></audio>

### 0x0C Only in the sound select

*Requested by `p12:B987`, table `0xB98A`.*

<audio controls preload="none" src="audio/musica_0C.mp3?v=f32f192c"></audio>

### 0x12 The ending: the tablet

*Requested by `p01:743D`.*

<audio controls preload="none" src="audio/musica_12.mp3?v=ca43541f"></audio>

### 0x0E The ending

*Requested by `p01:7603`.*

<audio controls preload="none" src="audio/musica_0E.mp3?v=f7a00c5c"></audio>
