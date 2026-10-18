# The enemies

Four, with the names from the editor: **SLOUMAN, FLOUMAN, PYONCY and ROCK ROLL** (types 1 to 4: the editor stores the menu option plus one, `p02:80D0`, and the enemy comes out with that type, `p01:6741`). They come out of fixed spots in each stage (a table in bank 13): each spot brings out its enemy 80 frames after the start and, when that one goes, another 192 frames later (`p01:671D`), if one of the eight slots at `0xE500` is free. When killed it turns into type 5: `0x2D` plays and it stops doing harm (`p01:6608`).

<div class="par">
<figure><img src="imagenes/sprites_msx2_enemigos.png" alt="SLOUMAN, FLOUMAN, PYONCY, ROCK ROLL and dying - MSX2" loading="lazy"><figcaption>SLOUMAN, FLOUMAN, PYONCY, ROCK ROLL and dying - MSX2</figcaption></figure>
<figure><img src="imagenes/sprites_msx1_enemigos.png" alt="SLOUMAN, FLOUMAN, PYONCY, ROCK ROLL and dying - MSX" loading="lazy"><figcaption>SLOUMAN, FLOUMAN, PYONCY, ROCK ROLL and dying - MSX</figcaption></figure>
</div>

Each row is a type (and the last one, dying), with the drawings seen on it running the six demos and stage 3 (the first one with FLOUMAN, who is in none of the demos), and with the colours the game gives them.

What changes from one cartridge to the other: coming out, on the MSX each one has its own drawings (PYONCY 24-26, ROCK ROLL 27-29); on the MSX2 both come out with the same ones (24 and 25) and the same colours. Dying, on the MSX there are three drawings (21-23) and on the MSX2 two (21 and 22).
