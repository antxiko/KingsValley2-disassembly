# The sequences

They are all the cartridge running: the game on its own, frame by frame, with the MSX interrupt (`0x402E`) once per frame. The ones that start halfway (the menu, the cleared pyramid, the ending...) have the game state (`0xE200`) set by hand, and whatever that state needs, such as the pyramid and the stage.

## The intro

<div class="par">
<figure><img src="imagenes/presentacion_msx2.gif" alt="The intro - MSX2" loading="lazy"><figcaption>The intro - MSX2</figcaption></figure>
<figure><img src="imagenes/presentacion_msx1.gif" alt="The intro - MSX" loading="lazy"><figcaption>The intro - MSX</figcaption></figure>
</div>

On the MSX the title depends on the BIOS (`0x002B`): with a Japanese one, エルギーザの封印 ("The Seal of El Giza"); with any other, King's Valley II. On the MSX2 it is always the Japanese one.

<div class="par">
<figure><img src="imagenes/presentacion_japonesa_msx1.gif" alt="MSX, Japanese BIOS" loading="lazy"><figcaption>MSX, Japanese BIOS</figcaption></figure>
</div>

## The demos

Six, one per pyramid (stages 2, 18, 26, 40, 48 and 53), with the joystick input recorded in bank 12 (pairs of frames and keys).

<div class="par">
<figure><img src="imagenes/demo_msx2_f02.gif" alt="Stage 2 - MSX2" loading="lazy"><figcaption>Stage 2 - MSX2</figcaption></figure>
<figure><img src="imagenes/demo_msx1_f02.gif" alt="Stage 2 - MSX" loading="lazy"><figcaption>Stage 2 - MSX</figcaption></figure>
</div>

<div class="par">
<figure><img src="imagenes/demo_msx2_f18.gif" alt="Stage 18 - MSX2" loading="lazy"><figcaption>Stage 18 - MSX2</figcaption></figure>
<figure><img src="imagenes/demo_msx1_f18.gif" alt="Stage 18 - MSX" loading="lazy"><figcaption>Stage 18 - MSX</figcaption></figure>
</div>

<div class="par">
<figure><img src="imagenes/demo_msx2_f26.gif" alt="Stage 26 - MSX2" loading="lazy"><figcaption>Stage 26 - MSX2</figcaption></figure>
<figure><img src="imagenes/demo_msx1_f26.gif" alt="Stage 26 - MSX" loading="lazy"><figcaption>Stage 26 - MSX</figcaption></figure>
</div>

<div class="par">
<figure><img src="imagenes/demo_msx2_f40.gif" alt="Stage 40 - MSX2" loading="lazy"><figcaption>Stage 40 - MSX2</figcaption></figure>
<figure><img src="imagenes/demo_msx1_f40.gif" alt="Stage 40 - MSX" loading="lazy"><figcaption>Stage 40 - MSX</figcaption></figure>
</div>

<div class="par">
<figure><img src="imagenes/demo_msx2_f48.gif" alt="Stage 48 - MSX2" loading="lazy"><figcaption>Stage 48 - MSX2</figcaption></figure>
<figure><img src="imagenes/demo_msx1_f48.gif" alt="Stage 48 - MSX" loading="lazy"><figcaption>Stage 48 - MSX</figcaption></figure>
</div>

<div class="par">
<figure><img src="imagenes/demo_msx2_f53.gif" alt="Stage 53 - MSX2" loading="lazy"><figcaption>Stage 53 - MSX2</figcaption></figure>
<figure><img src="imagenes/demo_msx1_f53.gif" alt="Stage 53 - MSX" loading="lazy"><figcaption>Stage 53 - MSX</figcaption></figure>
</div>

## The menu and the password

START SELECT: NORMAL, PASSWORD or STAGE LOAD (a stage made with the editor).

<div class="par">
<figure><img src="imagenes/menu_msx2_199.png" alt="The menu - MSX2" loading="lazy"><figcaption>The menu - MSX2</figcaption></figure>
<figure><img src="imagenes/menu_msx1_199.png" alt="The menu - MSX" loading="lazy"><figcaption>The menu - MSX</figcaption></figure>
</div>

<div class="par">
<figure><img src="imagenes/contrasena_msx2_299.png" alt="The password - MSX2" loading="lazy"><figcaption>The password - MSX2</figcaption></figure>
<figure><img src="imagenes/contrasena_msx1_299.png" alt="The password - MSX" loading="lazy"><figcaption>The password - MSX</figcaption></figure>
</div>

## The editor

<div class="par">
<figure><img src="imagenes/editor_msx2_220.png" alt="The editor - MSX2" loading="lazy"><figcaption>The editor - MSX2</figcaption></figure>
<figure><img src="imagenes/editor_msx1_220.png" alt="The editor - MSX" loading="lazy"><figcaption>The editor - MSX</figcaption></figure>
</div>

<div class="par">
<figure><img src="imagenes/editor_msx2_599.png" alt="The editor - MSX2" loading="lazy"><figcaption>The editor - MSX2</figcaption></figure>
<figure><img src="imagenes/editor_msx1_599.png" alt="The editor - MSX" loading="lazy"><figcaption>The editor - MSX</figcaption></figure>
</div>

## Pyramid cleared

The map with the six pyramids and a different message for each one (from 1 to 5): HOLD OUT!!, TRY TO TAKE A NEW STEP FORWARD, HEAVEN KNOWS WHEN THIS GAME WILL END, OH! MY GOD! I BELIEVE IN GOD, AT LONG LAST FINAL COUNT DOWN.

<div class="par">
<figure><img src="imagenes/piramide_acabada_msx2.gif" alt="Pyramid cleared - MSX2" loading="lazy"><figcaption>Pyramid cleared - MSX2</figcaption></figure>
<figure><img src="imagenes/piramide_acabada_msx1.gif" alt="Pyramid cleared - MSX" loading="lazy"><figcaption>Pyramid cleared - MSX</figcaption></figure>
</div>

<div class="par">
<figure><img src="imagenes/piramide_acabada_msx2_500.png" alt="Pyramid cleared - MSX2" loading="lazy"><figcaption>Pyramid cleared - MSX2</figcaption></figure>
<figure><img src="imagenes/piramide_acabada_msx1_500.png" alt="Pyramid cleared - MSX" loading="lazy"><figcaption>Pyramid cleared - MSX</figcaption></figure>
</div>

<div class="par">
<figure><img src="imagenes/piramide_acabada_msx2_900.png" alt="Pyramid cleared - MSX2" loading="lazy"><figcaption>Pyramid cleared - MSX2</figcaption></figure>
<figure><img src="imagenes/piramide_acabada_msx1_900.png" alt="Pyramid cleared - MSX" loading="lazy"><figcaption>Pyramid cleared - MSX</figcaption></figure>
</div>

<div class="par">
<figure><img src="imagenes/piramide_acabada_msx2_1499.png" alt="Pyramid cleared - MSX2" loading="lazy"><figcaption>Pyramid cleared - MSX2</figcaption></figure>
<figure><img src="imagenes/piramide_acabada_msx1_1499.png" alt="Pyramid cleared - MSX" loading="lazy"><figcaption>Pyramid cleared - MSX</figcaption></figure>
</div>

## Game over

<div class="par">
<figure><img src="imagenes/fin_de_partida_msx2_149.png" alt="Game over - MSX2" loading="lazy"><figcaption>Game over - MSX2</figcaption></figure>
<figure><img src="imagenes/fin_de_partida_msx1_149.png" alt="Game over - MSX" loading="lazy"><figcaption>Game over - MSX</figcaption></figure>
</div>

## The ending

CONGRATULATIONS TO VICK XIII !, the world saved, the order to turn off the switch (DANGER !!!), the credits and THE END.

<div class="par">
<figure><img src="imagenes/final_msx2.gif" alt="The ending - MSX2" loading="lazy"><figcaption>The ending - MSX2</figcaption></figure>
<figure><img src="imagenes/final_msx1.gif" alt="The ending - MSX" loading="lazy"><figcaption>The ending - MSX</figcaption></figure>
</div>

<div class="par">
<figure><img src="imagenes/final_msx2_900.png" alt="The ending - MSX2" loading="lazy"><figcaption>The ending - MSX2</figcaption></figure>
<figure><img src="imagenes/final_msx1_900.png" alt="The ending - MSX" loading="lazy"><figcaption>The ending - MSX</figcaption></figure>
</div>

<div class="par">
<figure><img src="imagenes/final_msx2_1500.png" alt="The ending - MSX2" loading="lazy"><figcaption>The ending - MSX2</figcaption></figure>
<figure><img src="imagenes/final_msx1_1500.png" alt="The ending - MSX" loading="lazy"><figcaption>The ending - MSX</figcaption></figure>
</div>

<div class="par">
<figure><img src="imagenes/final_msx2_2400.png" alt="The ending - MSX2" loading="lazy"><figcaption>The ending - MSX2</figcaption></figure>
<figure><img src="imagenes/final_msx1_2400.png" alt="The ending - MSX" loading="lazy"><figcaption>The ending - MSX</figcaption></figure>
</div>

<div class="par">
<figure><img src="imagenes/final_msx2_2990.png" alt="The ending - MSX2" loading="lazy"><figcaption>The ending - MSX2</figcaption></figure>
<figure><img src="imagenes/final_msx1_2990.png" alt="The ending - MSX" loading="lazy"><figcaption>The ending - MSX</figcaption></figure>
</div>

<div class="par">
<figure><img src="imagenes/final_msx2_4100.png" alt="The ending - MSX2" loading="lazy"><figcaption>The ending - MSX2</figcaption></figure>
<figure><img src="imagenes/final_msx1_4100.png" alt="The ending - MSX" loading="lazy"><figcaption>The ending - MSX</figcaption></figure>
</div>

## The two hidden minigames

See [Curiosities](CURIOSITIES.html).

<div class="par">
<figure><img src="imagenes/musicas_msx2_199.png" alt="SOUND SELECT - MSX2" loading="lazy"><figcaption>SOUND SELECT - MSX2</figcaption></figure>
<figure><img src="imagenes/musicas_msx1_199.png" alt="SOUND SELECT - MSX" loading="lazy"><figcaption>SOUND SELECT - MSX</figcaption></figure>
</div>

<div class="par">
<figure><img src="imagenes/puzle_msx2_199.png" alt="PUZZLE GAME - MSX2" loading="lazy"><figcaption>PUZZLE GAME - MSX2</figcaption></figure>
<figure><img src="imagenes/puzle_msx1_199.png" alt="PUZZLE GAME - MSX" loading="lazy"><figcaption>PUZZLE GAME - MSX</figcaption></figure>
</div>
