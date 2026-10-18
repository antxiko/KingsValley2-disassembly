; ==========================================================================
; KING'S VALLEY II - Konami (1988) - MSX y MSX2 - RC-760 y RC-761 (Konami SCC) - banco 13 (se ejecuta en 0xa000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x0a000


; ----------------------------------------------------------------------
; DATOS coger_01: Lo que hay que coger para abrir la salida de la fase 1; lo
;   leen msx1 p01:630C, msx2 p01:6502 (13 bytes)
;   0xa000..0xa00d  (13 bytes)
DATA_coger_01:
	defb 011h,040h,028h,011h,040h,0c8h,011h,060h,048h,011h,060h,0a8h,000h	; a000  .@(.@..`H.`..

; ----------------------------------------------------------------------
; DATOS coger_02: Lo que hay que coger para abrir la salida de la fase 2; lo
;   leen msx1 p01:630C, msx2 p01:6502 (13 bytes)
;   0xa00d..0xa01a  (13 bytes)
DATA_coger_02:
	defb 011h,008h,068h,011h,030h,090h,011h,050h,050h,011h,070h,0a0h,000h	; a00d  ..h.0..PP.p..

; ----------------------------------------------------------------------
; DATOS coger_03: Lo que hay que coger para abrir la salida de la fase 3; lo
;   leen msx1 p01:630C, msx2 p01:6502 (13 bytes)
;   0xa01a..0xa027  (13 bytes)
DATA_coger_03:
	defb 012h,048h,020h,012h,048h,068h,012h,070h,018h,012h,070h,060h,000h	; a01a  .H .Hh.p..p`.

; ----------------------------------------------------------------------
; DATOS coger_04: Lo que hay que coger para abrir la salida de la fase 4; lo
;   leen msx1 p01:630C, msx2 p01:6502 (13 bytes)
;   0xa027..0xa034  (13 bytes)
DATA_coger_04:
	defb 011h,058h,050h,011h,058h,0a0h,012h,068h,048h,012h,068h,0a8h,000h	; a027  .XP.X..hH.h..

; ----------------------------------------------------------------------
; DATOS coger_05: Lo que hay que coger para abrir la salida de la fase 5; lo
;   leen msx1 p01:630C, msx2 p01:6502 (13 bytes)
;   0xa034..0xa041  (13 bytes)
DATA_coger_05:
	defb 011h,058h,068h,011h,058h,0d0h,012h,058h,010h,012h,048h,070h,000h	; a034  .Xh.X..X..Hp.

; ----------------------------------------------------------------------
; DATOS coger_06: Lo que hay que coger para abrir la salida de la fase 6; lo
;   leen msx1 p01:630C, msx2 p01:6502 (13 bytes)
;   0xa041..0xa04e  (13 bytes)
DATA_coger_06:
	defb 011h,060h,020h,011h,070h,010h,012h,050h,020h,012h,070h,010h,000h	; a041  .` .p..P .p..

; ----------------------------------------------------------------------
; DATOS coger_07: Lo que hay que coger para abrir la salida de la fase 7; lo
;   leen msx1 p01:630C, msx2 p01:6502 (19 bytes)
;   0xa04e..0xa061  (19 bytes)
DATA_coger_07:
	defb 011h,058h,018h,011h,058h,038h,012h,008h,018h,012h,008h,050h,012h,080h,018h,012h	; a04e  .X..X8.....P....
	defb 080h,038h,000h	; a05e

; ----------------------------------------------------------------------
; DATOS coger_08: Lo que hay que coger para abrir la salida de la fase 8; lo
;   leen msx1 p01:630C, msx2 p01:6502 (19 bytes)
;   0xa061..0xa074  (19 bytes)
DATA_coger_08:
	defb 011h,010h,020h,011h,038h,020h,011h,038h,058h,011h,060h,020h,011h,088h,020h,011h	; a061  .. .8 .8X.` .. .
	defb 088h,098h,000h	; a071

; ----------------------------------------------------------------------
; DATOS coger_09: Lo que hay que coger para abrir la salida de la fase 9; lo
;   leen msx1 p01:630C, msx2 p01:6502 (19 bytes)
;   0xa074..0xa087  (19 bytes)
DATA_coger_09:
	defb 011h,038h,020h,011h,038h,060h,011h,038h,090h,011h,058h,010h,011h,068h,078h,011h	; a074  .8 .8`.8..X..hx.
	defb 088h,050h,000h	; a084

; ----------------------------------------------------------------------
; DATOS coger_10: Lo que hay que coger para abrir la salida de la fase 10; lo
;   leen msx1 p01:630C, msx2 p01:6502 (19 bytes)
;   0xa087..0xa09a  (19 bytes)
DATA_coger_10:
	defb 011h,038h,030h,011h,038h,068h,011h,058h,0a8h,011h,098h,0c8h,012h,038h,080h,012h	; a087  .80.8h.X.....8..
	defb 058h,040h,000h	; a097

; ----------------------------------------------------------------------
; DATOS coger_11: Lo que hay que coger para abrir la salida de la fase 11; lo
;   leen msx1 p01:630C, msx2 p01:6502 (19 bytes)
;   0xa09a..0xa0ad  (19 bytes)
DATA_coger_11:
	defb 011h,010h,008h,011h,010h,0b8h,011h,050h,078h,011h,080h,008h,011h,080h,0e8h,011h	; a09a  .......Px.......
	defb 0a8h,058h,000h	; a0aa

; ----------------------------------------------------------------------
; DATOS coger_12: Lo que hay que coger para abrir la salida de la fase 12; lo
;   leen msx1 p01:630C, msx2 p01:6502 (19 bytes)
;   0xa0ad..0xa0c0  (19 bytes)
DATA_coger_12:
	defb 011h,010h,030h,011h,020h,0b0h,011h,040h,070h,012h,030h,010h,012h,030h,0d0h,012h	; a0ad  ..0. ..@p.0..0..
	defb 050h,030h,000h	; a0bd

; ----------------------------------------------------------------------
; DATOS coger_13: Lo que hay que coger para abrir la salida de la fase 13; lo
;   leen msx1 p01:630C, msx2 p01:6502 (19 bytes)
;   0xa0c0..0xa0d3  (19 bytes)
DATA_coger_13:
	defb 011h,020h,058h,011h,070h,010h,012h,020h,0a0h,012h,060h,010h,013h,020h,060h,013h	; a0c0  . X.p.. ..`.. `.
	defb 070h,058h,000h	; a0d0

; ----------------------------------------------------------------------
; DATOS coger_14: Lo que hay que coger para abrir la salida de la fase 14; lo
;   leen msx1 p01:630C, msx2 p01:6502 (19 bytes)
;   0xa0d3..0xa0e6  (19 bytes)
DATA_coger_14:
	defb 011h,020h,0a0h,011h,040h,0c0h,011h,050h,010h,011h,070h,050h,012h,060h,050h,012h	; a0d3  . ..@..P..pP.`P.
	defb 060h,0a0h,000h	; a0e3

; ----------------------------------------------------------------------
; DATOS coger_15: Lo que hay que coger para abrir la salida de la fase 15; lo
;   leen msx1 p01:630C, msx2 p01:6502 (19 bytes)
;   0xa0e6..0xa0f9  (19 bytes)
DATA_coger_15:
	defb 011h,078h,0d8h,011h,090h,058h,012h,030h,098h,012h,090h,058h,013h,048h,098h,013h	; a0e6  .x...X.0...X.H..
	defb 060h,058h,000h	; a0f6

; ----------------------------------------------------------------------
; DATOS coger_16: Lo que hay que coger para abrir la salida de la fase 16; lo
;   leen msx1 p01:630C, msx2 p01:6502 (25 bytes)
;   0xa0f9..0xa112  (25 bytes)
DATA_coger_16:
	defb 011h,018h,080h,011h,038h,0a0h,011h,058h,0c0h,011h,078h,0e0h,011h,0a8h,020h,012h	; a0f9  ....8..X..x... .
	defb 020h,040h,012h,060h,008h,012h,060h,0e8h,000h	; a109   @.`..`..

; ----------------------------------------------------------------------
; DATOS coger_17: Lo que hay que coger para abrir la salida de la fase 17; lo
;   leen msx1 p01:630C, msx2 p01:6502 (25 bytes)
;   0xa112..0xa12b  (25 bytes)
DATA_coger_17:
	defb 011h,018h,098h,011h,038h,028h,011h,080h,040h,012h,058h,060h,012h,058h,0b8h,013h	; a112  ....8(..@.X`.X..
	defb 038h,070h,013h,038h,0a0h,013h,070h,028h,000h	; a122  8p.8..p(.

; ----------------------------------------------------------------------
; DATOS coger_18: Lo que hay que coger para abrir la salida de la fase 18; lo
;   leen msx1 p01:630C, msx2 p01:6502 (25 bytes)
;   0xa12b..0xa144  (25 bytes)
DATA_coger_18:
	defb 011h,050h,0a8h,011h,088h,018h,011h,098h,008h,012h,020h,078h,012h,070h,078h,013h	; a12b  .P........ x.px.
	defb 030h,0b0h,013h,050h,0b0h,013h,070h,0a0h,000h	; a13b  0..P..p..

; ----------------------------------------------------------------------
; DATOS coger_19: Lo que hay que coger para abrir la salida de la fase 19; lo
;   leen msx1 p01:630C, msx2 p01:6502 (25 bytes)
;   0xa144..0xa15d  (25 bytes)
DATA_coger_19:
	defb 011h,078h,078h,011h,090h,048h,011h,090h,068h,011h,090h,088h,011h,090h,0a8h,011h	; a144  .xx..H..h.......
	defb 0a0h,030h,011h,0a0h,078h,011h,0a0h,0c0h,000h	; a154  .0..x....

; ----------------------------------------------------------------------
; DATOS coger_20: Lo que hay que coger para abrir la salida de la fase 20; lo
;   leen msx1 p01:630C, msx2 p01:6502 (25 bytes)
;   0xa15d..0xa176  (25 bytes)
DATA_coger_20:
	defb 012h,018h,018h,012h,018h,060h,012h,040h,070h,012h,050h,018h,012h,068h,030h,012h	; a15d  .....`.@p.P..h0.
	defb 068h,068h,012h,088h,018h,012h,0a8h,040h,000h	; a16d  hh.....@.

; ----------------------------------------------------------------------
; DATOS coger_21: Lo que hay que coger para abrir la salida de la fase 21; lo
;   leen msx1 p01:630C, msx2 p01:6502 (25 bytes)
;   0xa176..0xa18f  (25 bytes)
DATA_coger_21:
	defb 011h,010h,028h,011h,018h,0c8h,011h,030h,078h,011h,068h,070h,011h,068h,080h,011h	; a176  ..(....0x.hp.h..
	defb 070h,0c0h,011h,088h,030h,011h,0a0h,0c0h,000h	; a186  p...0....

; ----------------------------------------------------------------------
; DATOS coger_22: Lo que hay que coger para abrir la salida de la fase 22; lo
;   leen msx1 p01:630C, msx2 p01:6502 (25 bytes)
;   0xa18f..0xa1a8  (25 bytes)
DATA_coger_22:
	defb 011h,030h,030h,011h,040h,080h,011h,068h,030h,011h,078h,0e0h,011h,098h,030h,012h	; a18f  .00.@..h0.x...0.
	defb 068h,030h,012h,088h,078h,013h,070h,0a8h,000h	; a19f  h0..x.p..

; ----------------------------------------------------------------------
; DATOS coger_23: Lo que hay que coger para abrir la salida de la fase 23; lo
;   leen msx1 p01:630C, msx2 p01:6502 (31 bytes)
;   0xa1a8..0xa1c7  (31 bytes)
DATA_coger_23:
	defb 011h,010h,0a8h,011h,030h,098h,011h,080h,0a8h,012h,010h,038h,012h,010h,0a0h,012h	; a1a8  ....0......8....
	defb 0a0h,050h,013h,030h,0b0h,013h,060h,048h,014h,010h,0b0h,014h,030h,080h,000h	; a1b8  .P.0..`H....0..

; ----------------------------------------------------------------------
; DATOS coger_24: Lo que hay que coger para abrir la salida de la fase 24; lo
;   leen msx1 p01:630C, msx2 p01:6502 (31 bytes)
;   0xa1c7..0xa1e6  (31 bytes)
DATA_coger_24:
	defb 011h,050h,090h,011h,090h,078h,012h,030h,008h,012h,030h,0e8h,012h,048h,078h,013h	; a1c7  .P...x.0..0..Hx.
	defb 048h,050h,013h,048h,0a0h,013h,080h,078h,014h,060h,078h,014h,068h,0e8h,000h	; a1d7  HP.H...x.`x.h..

; ----------------------------------------------------------------------
; DATOS coger_25: Lo que hay que coger para abrir la salida de la fase 25; lo
;   leen msx1 p01:630C, msx2 p01:6502 (31 bytes)
;   0xa1e6..0xa205  (31 bytes)
DATA_coger_25:
	defb 011h,028h,068h,011h,038h,050h,011h,048h,038h,011h,058h,028h,011h,058h,088h,011h	; a1e6  .(h.8P.H8.X(.X..
	defb 078h,058h,011h,078h,098h,011h,088h,048h,011h,088h,088h,011h,088h,0a8h,000h	; a1f6  xX.x...H.......

; ----------------------------------------------------------------------
; DATOS coger_26: Lo que hay que coger para abrir la salida de la fase 26; lo
;   leen msx1 p01:630C, msx2 p01:6502 (31 bytes)
;   0xa205..0xa224  (31 bytes)
DATA_coger_26:
	defb 011h,050h,040h,011h,068h,0e0h,011h,078h,0a0h,012h,028h,020h,012h,058h,020h,012h	; a205  .P@.h..x..( .X .
	defb 070h,0b0h,012h,080h,070h,013h,068h,090h,013h,078h,080h,013h,098h,0e0h,000h	; a215  p...p.h..x.....

; ----------------------------------------------------------------------
; DATOS coger_27: Lo que hay que coger para abrir la salida de la fase 27; lo
;   leen msx1 p01:630C, msx2 p01:6502 (31 bytes)
;   0xa224..0xa243  (31 bytes)
DATA_coger_27:
	defb 011h,018h,088h,011h,070h,050h,011h,070h,078h,012h,070h,010h,012h,028h,098h,012h	; a224  ....pP.px.p..(..
	defb 028h,0e0h,012h,068h,098h,013h,010h,078h,013h,030h,078h,013h,088h,0c0h,000h	; a234  (..h...x.0x....

; ----------------------------------------------------------------------
; DATOS coger_28: Lo que hay que coger para abrir la salida de la fase 28; lo
;   leen msx1 p01:630C, msx2 p01:6502 (25 bytes)
;   0xa243..0xa25c  (25 bytes)
DATA_coger_28:
	defb 011h,070h,0d0h,011h,080h,050h,011h,090h,040h,011h,020h,010h,012h,040h,040h,012h	; a243  .p...P..@. ..@@.
	defb 090h,0e0h,013h,038h,060h,013h,038h,098h,000h	; a253  ...8`.8..

; ----------------------------------------------------------------------
; DATOS coger_29: Lo que hay que coger para abrir la salida de la fase 29; lo
;   leen msx1 p01:630C, msx2 p01:6502 (31 bytes)
;   0xa25c..0xa27b  (31 bytes)
DATA_coger_29:
	defb 011h,078h,070h,011h,078h,080h,011h,088h,060h,011h,088h,070h,011h,088h,090h,011h	; a25c  .xp.x...`..p....
	defb 098h,050h,011h,098h,060h,011h,098h,080h,011h,098h,090h,011h,0a8h,090h,000h	; a26c  .P..`..........

; ----------------------------------------------------------------------
; DATOS coger_30: Lo que hay que coger para abrir la salida de la fase 30; lo
;   leen msx1 p01:630C, msx2 p01:6502 (31 bytes)
;   0xa27b..0xa29a  (31 bytes)
DATA_coger_30:
	defb 011h,028h,048h,011h,048h,098h,011h,068h,058h,011h,068h,098h,011h,088h,098h,012h	; a27b  .(H.H..hX.h.....
	defb 028h,098h,012h,068h,098h,012h,068h,0d8h,012h,088h,058h,012h,088h,098h,000h	; a28b  (..h..h...X....

; ----------------------------------------------------------------------
; DATOS coger_31: Lo que hay que coger para abrir la salida de la fase 31; lo
;   leen msx1 p01:630C, msx2 p01:6502 (31 bytes)
;   0xa29a..0xa2b9  (31 bytes)
DATA_coger_31:
	defb 011h,048h,018h,011h,038h,078h,011h,038h,0a8h,011h,048h,058h,011h,048h,0c8h,011h	; a29a  .H..8x.8..HX.H..
	defb 068h,068h,011h,068h,0b8h,011h,088h,018h,011h,088h,048h,011h,088h,078h,000h	; a2aa  hh.h......H..x.

; ----------------------------------------------------------------------
; DATOS coger_32: Lo que hay que coger para abrir la salida de la fase 32; lo
;   leen msx1 p01:630C, msx2 p01:6502 (31 bytes)
;   0xa2b9..0xa2d8  (31 bytes)
DATA_coger_32:
	defb 011h,020h,018h,011h,060h,040h,011h,060h,0b0h,011h,080h,018h,012h,078h,090h,012h	; a2b9  . ..`@.`.....x..
	defb 098h,020h,012h,098h,0c0h,013h,040h,0c0h,013h,080h,020h,013h,080h,0d0h,000h	; a2c9  . ....@... ....

; ----------------------------------------------------------------------
; DATOS coger_33: Lo que hay que coger para abrir la salida de la fase 33; lo
;   leen msx1 p01:630C, msx2 p01:6502 (31 bytes)
;   0xa2d8..0xa2f7  (31 bytes)
DATA_coger_33:
	defb 011h,028h,0d8h,011h,058h,058h,011h,048h,0a0h,012h,028h,088h,012h,058h,0e8h,013h	; a2d8  .(..XX.H..(..X..
	defb 028h,040h,013h,028h,0e0h,013h,058h,0a8h,013h,088h,040h,013h,088h,0e0h,000h	; a2e8  (@.(..X...@....

; ----------------------------------------------------------------------
; DATOS coger_34: Lo que hay que coger para abrir la salida de la fase 34; lo
;   leen msx1 p01:630C, msx2 p01:6502 (31 bytes)
;   0xa2f7..0xa316  (31 bytes)
DATA_coger_34:
	defb 011h,010h,078h,011h,048h,0a8h,011h,080h,0a8h,012h,058h,048h,012h,070h,048h,012h	; a2f7  ..x.H.....XH.pH.
	defb 088h,048h,012h,088h,0c8h,012h,040h,0c8h,013h,010h,078h,014h,080h,078h,000h	; a307  .H....@...x..x.

; ----------------------------------------------------------------------
; DATOS coger_35: Lo que hay que coger para abrir la salida de la fase 35; lo
;   leen msx1 p01:630C, msx2 p01:6502 (37 bytes)
;   0xa316..0xa33b  (37 bytes)
DATA_coger_35:
	defb 011h,0a8h,030h,011h,0a8h,0c0h,012h,050h,038h,012h,050h,078h,012h,050h,0b8h,013h	; a316  ..0....P8.Px.P..
	defb 048h,030h,013h,048h,078h,013h,078h,098h,013h,0a8h,078h,014h,018h,048h,014h,048h	; a326  H0.Hx.x...x..H.H
	defb 048h,014h,078h,0d0h,000h	; a336

; ----------------------------------------------------------------------
; DATOS coger_36: Lo que hay que coger para abrir la salida de la fase 36; lo
;   leen msx1 p01:630C, msx2 p01:6502 (37 bytes)
;   0xa33b..0xa360  (37 bytes)
DATA_coger_36:
	defb 011h,020h,020h,011h,078h,068h,011h,078h,088h,011h,098h,048h,011h,098h,0a8h,012h	; a33b  .  .xh.x...H....
	defb 090h,070h,012h,0a0h,0a8h,013h,070h,0e0h,013h,080h,020h,013h,080h,060h,014h,030h	; a34b  .p....p... ..`.0
	defb 060h,014h,040h,020h,000h	; a35b

; ----------------------------------------------------------------------
; DATOS coger_37: Lo que hay que coger para abrir la salida de la fase 37; lo
;   leen msx1 p01:630C, msx2 p01:6502 (37 bytes)
;   0xa360..0xa385  (37 bytes)
DATA_coger_37:
	defb 011h,030h,050h,011h,040h,040h,012h,050h,078h,012h,070h,078h,012h,080h,0b0h,013h	; a360  .0P.@@.Px.px....
	defb 030h,0b0h,013h,048h,078h,013h,070h,078h,013h,080h,040h,014h,030h,040h,014h,048h	; a370  0..Hx.px..@.0@.H
	defb 078h,014h,070h,078h,000h	; a380

; ----------------------------------------------------------------------
; DATOS coger_38: Lo que hay que coger para abrir la salida de la fase 38; lo
;   leen msx1 p01:630C, msx2 p01:6502 (37 bytes)
;   0xa385..0xa3aa  (37 bytes)
DATA_coger_38:
	defb 011h,048h,0b8h,011h,078h,0a0h,012h,048h,010h,012h,048h,0b8h,012h,078h,0b8h,013h	; a385  .H..x..H..H..x..
	defb 020h,038h,013h,020h,0a0h,013h,080h,060h,013h,080h,0b0h,014h,020h,080h,014h,060h	; a395   8. ...`.... ..`
	defb 0e0h,014h,0a0h,020h,000h	; a3a5

; ----------------------------------------------------------------------
; DATOS coger_39: Lo que hay que coger para abrir la salida de la fase 39; lo
;   leen msx1 p01:630C, msx2 p01:6502 (37 bytes)
;   0xa3aa..0xa3cf  (37 bytes)
DATA_coger_39:
	defb 011h,018h,018h,011h,018h,048h,011h,018h,0a8h,011h,018h,0d8h,011h,048h,018h,011h	; a3aa  .....H.......H..
	defb 048h,048h,011h,048h,0a8h,011h,048h,0d8h,011h,078h,018h,011h,078h,048h,011h,078h	; a3ba  HH.H..H..x..xH.x
	defb 0a8h,011h,078h,0d8h,000h	; a3ca

; ----------------------------------------------------------------------
; DATOS coger_40: Lo que hay que coger para abrir la salida de la fase 40; lo
;   leen msx1 p01:630C, msx2 p01:6502 (37 bytes)
;   0xa3cf..0xa3f4  (37 bytes)
DATA_coger_40:
	defb 011h,050h,0c0h,011h,060h,0a0h,011h,070h,080h,011h,070h,0b0h,011h,080h,060h,011h	; a3cf  .P..`..p..p...`.
	defb 080h,0d0h,012h,050h,030h,012h,060h,020h,012h,060h,050h,012h,070h,070h,012h,080h	; a3df  ...P0.` .`P.pp..
	defb 020h,012h,080h,090h,000h	; a3ef

; ----------------------------------------------------------------------
; DATOS coger_41: Lo que hay que coger para abrir la salida de la fase 41; lo
;   leen msx1 p01:630C, msx2 p01:6502 (43 bytes)
;   0xa3f4..0xa41f  (43 bytes)
DATA_coger_41:
	defb 011h,030h,060h,011h,030h,070h,011h,030h,080h,011h,030h,090h,011h,030h,0b0h,011h	; a3f4  .0`.0p.0..0..0..
	defb 050h,040h,011h,060h,040h,011h,050h,0b0h,011h,060h,0b0h,011h,080h,030h,011h,080h	; a404  P@.`@.P..`...0..
	defb 060h,011h,080h,070h,011h,080h,080h,011h,080h,090h,000h	; a414  `..p.......

; ----------------------------------------------------------------------
; DATOS coger_42: Lo que hay que coger para abrir la salida de la fase 42; lo
;   leen msx1 p01:630C, msx2 p01:6502 (43 bytes)
;   0xa41f..0xa44a  (43 bytes)
DATA_coger_42:
	defb 011h,010h,018h,011h,028h,070h,011h,040h,070h,011h,048h,0c0h,011h,058h,018h,011h	; a41f  ....(p.@p.H..X..
	defb 058h,058h,011h,058h,078h,011h,068h,0b0h,011h,058h,0d0h,011h,078h,058h,011h,078h	; a42f  XX.Xx.h..X..xX.x
	defb 078h,011h,078h,0a0h,012h,0a8h,080h,012h,058h,0e0h,000h	; a43f  x.x.....X..

; ----------------------------------------------------------------------
; DATOS coger_43: Lo que hay que coger para abrir la salida de la fase 43; lo
;   leen msx1 p01:630C, msx2 p01:6502 (37 bytes)
;   0xa44a..0xa46f  (37 bytes)
DATA_coger_43:
	defb 011h,038h,078h,013h,020h,0a8h,013h,040h,058h,013h,040h,0c8h,014h,020h,028h,014h	; a44a  .8x. ..@X.@.. (.
	defb 020h,058h,014h,020h,0a0h,014h,050h,028h,014h,060h,078h,014h,070h,048h,014h,070h	; a45a   X. ..P(.`x.pH.p
	defb 0c8h,014h,080h,078h,000h	; a46a

; ----------------------------------------------------------------------
; DATOS coger_44: Lo que hay que coger para abrir la salida de la fase 44; lo
;   leen msx1 p01:630C, msx2 p01:6502 (37 bytes)
;   0xa46f..0xa494  (37 bytes)
DATA_coger_44:
	defb 011h,018h,090h,011h,098h,090h,012h,080h,060h,012h,080h,090h,013h,018h,060h,013h	; a46f  ........`.....`.
	defb 098h,070h,014h,058h,078h,014h,098h,078h,015h,048h,078h,015h,098h,078h,016h,080h	; a47f  .p.Xx..x.Hx..x..
	defb 040h,016h,080h,0b0h,000h	; a48f

; ----------------------------------------------------------------------
; DATOS coger_45: Lo que hay que coger para abrir la salida de la fase 45; lo
;   leen msx1 p01:630C, msx2 p01:6502 (40 bytes)
;   0xa494..0xa4bc  (40 bytes)
DATA_coger_45:
	defb 011h,060h,028h,011h,060h,048h,011h,060h,068h,011h,060h,088h,011h,060h,0a8h,011h	; a494  .`(.`H.`h.`..`..
	defb 060h,0c8h,011h,080h,038h,011h,080h,078h,011h,080h,0b8h,011h,0a0h,028h,011h,0a0h	; a4a4  `...8..x.....(..
	defb 068h,011h,0a0h,088h,011h,0a0h,0c8h,000h	; a4b4  h.......

; ----------------------------------------------------------------------
; DATOS coger_46: Lo que hay que coger para abrir la salida de la fase 46; lo
;   leen msx1 p01:630C, msx2 p01:6502 (37 bytes)
;   0xa4bc..0xa4e1  (37 bytes)
DATA_coger_46:
	defb 012h,060h,048h,012h,060h,058h,012h,060h,0d8h,013h,070h,050h,013h,070h,080h,013h	; a4bc  .`H.`X.`..pP.p..
	defb 080h,010h,014h,048h,030h,014h,048h,040h,014h,060h,0c0h,014h,080h,010h,014h,080h	; a4cc  ...H0.H@.`......
	defb 030h,014h,080h,040h,000h	; a4dc

; ----------------------------------------------------------------------
; DATOS coger_47: Lo que hay que coger para abrir la salida de la fase 47; lo
;   leen msx1 p01:630C, msx2 p01:6502 (43 bytes)
;   0xa4e1..0xa50c  (43 bytes)
DATA_coger_47:
	defb 011h,058h,040h,011h,058h,0b0h,011h,0a0h,038h,011h,0a0h,0b8h,012h,080h,050h,012h	; a4e1  .X@.X...8.....P.
	defb 080h,060h,012h,080h,0a8h,012h,090h,0b8h,013h,050h,060h,013h,060h,070h,013h,080h	; a4f1  .`.......P`.`p..
	defb 0b0h,013h,090h,0b0h,013h,0a0h,0b0h,013h,0a0h,0c0h,000h	; a501  ...........

; ----------------------------------------------------------------------
; DATOS coger_48: Lo que hay que coger para abrir la salida de la fase 48; lo
;   leen msx1 p01:630C, msx2 p01:6502 (43 bytes)
;   0xa50c..0xa537  (43 bytes)
DATA_coger_48:
	defb 011h,060h,0d8h,011h,080h,0c8h,012h,048h,0e0h,012h,060h,018h,012h,070h,058h,012h	; a50c  .`.....H..`..pX.
	defb 070h,0a8h,012h,080h,028h,012h,080h,078h,013h,058h,018h,013h,058h,078h,013h,068h	; a51c  p...(..x.X..Xx.h
	defb 028h,013h,080h,038h,013h,080h,068h,013h,080h,090h,000h	; a52c  (..8..h....

; ----------------------------------------------------------------------
; DATOS coger_49: Lo que hay que coger para abrir la salida de la fase 49; lo
;   leen msx1 p01:630C, msx2 p01:6502 (43 bytes)
;   0xa537..0xa562  (43 bytes)
DATA_coger_49:
	defb 011h,038h,068h,011h,038h,088h,011h,048h,038h,011h,048h,0b8h,011h,058h,038h,011h	; a537  .8h.8..H8.H..X8.
	defb 058h,0b8h,011h,050h,060h,011h,050h,070h,011h,050h,080h,011h,050h,090h,011h,068h	; a547  X..P`.Pp.P..P..h
	defb 050h,011h,068h,068h,011h,068h,090h,011h,068h,0a0h,000h	; a557  P.hh.h..h..

; ----------------------------------------------------------------------
; DATOS coger_50: Lo que hay que coger para abrir la salida de la fase 50; lo
;   leen msx1 p01:630C, msx2 p01:6502 (43 bytes)
;   0xa562..0xa58d  (43 bytes)
DATA_coger_50:
	defb 011h,078h,060h,012h,010h,090h,012h,030h,040h,012h,050h,050h,012h,068h,020h,012h	; a562  .x`....0@.PP.h .
	defb 068h,080h,012h,098h,068h,012h,0a8h,058h,013h,060h,018h,013h,050h,098h,014h,048h	; a572  h...h..X.`..P..H
	defb 0b8h,014h,050h,060h,014h,070h,010h,014h,070h,0b8h,000h	; a582  ..P`.p..p..

; ----------------------------------------------------------------------
; DATOS coger_51: Lo que hay que coger para abrir la salida de la fase 51; lo
;   leen msx1 p01:630C, msx2 p01:6502 (43 bytes)
;   0xa58d..0xa5b8  (43 bytes)
DATA_coger_51:
	defb 011h,040h,038h,011h,040h,078h,011h,040h,0b8h,011h,050h,028h,011h,050h,0c8h,011h	; a58d  .@8.@x.@..P(.P..
	defb 058h,078h,011h,060h,018h,011h,060h,0d8h,011h,070h,008h,011h,070h,0e8h,011h,088h	; a59d  Xx.`..`..p..p...
	defb 068h,011h,088h,088h,011h,0a0h,068h,011h,0a0h,088h,000h	; a5ad  h.....h....

; ----------------------------------------------------------------------
; DATOS coger_52: Lo que hay que coger para abrir la salida de la fase 52; lo
;   leen msx1 p01:630C, msx2 p01:6502 (43 bytes)
;   0xa5b8..0xa5e3  (43 bytes)
DATA_coger_52:
	defb 011h,020h,020h,011h,030h,030h,011h,030h,0b0h,011h,050h,090h,011h,070h,090h,011h	; a5b8  .  .00.0..P..p..
	defb 098h,078h,011h,098h,0c8h,012h,020h,0d0h,012h,030h,0c0h,012h,050h,040h,012h,070h	; a5c8  .x.... ..0..P@.p
	defb 040h,012h,080h,0b0h,012h,098h,028h,012h,098h,078h,000h	; a5d8  @.....(..x.

; ----------------------------------------------------------------------
; DATOS coger_53: Lo que hay que coger para abrir la salida de la fase 53; lo
;   leen msx1 p01:630C, msx2 p01:6502 (43 bytes)
;   0xa5e3..0xa60e  (43 bytes)
DATA_coger_53:
	defb 011h,030h,0b0h,011h,048h,0b0h,011h,060h,030h,011h,060h,068h,011h,098h,058h,011h	; a5e3  .0..H..`0.`h..X.
	defb 0a8h,098h,012h,060h,030h,012h,0a8h,060h,012h,0a8h,098h,013h,038h,058h,013h,038h	; a5f3  ...`0..`....8X.8
	defb 088h,013h,038h,0d8h,013h,060h,058h,013h,098h,058h,000h	; a603  ..8..`X..X.

; ----------------------------------------------------------------------
; DATOS coger_54: Lo que hay que coger para abrir la salida de la fase 54; lo
;   leen msx1 p01:630C, msx2 p01:6502 (43 bytes)
;   0xa60e..0xa639  (43 bytes)
DATA_coger_54:
	defb 011h,010h,028h,011h,010h,070h,011h,038h,0a0h,011h,038h,0b0h,011h,050h,0b8h,011h	; a60e  ..(..p.8..8..P..
	defb 068h,0b8h,012h,028h,0a8h,012h,040h,0a8h,012h,058h,048h,012h,078h,048h,012h,090h	; a61e  h..(..@..XH.xH..
	defb 078h,012h,090h,088h,012h,090h,098h,012h,078h,0c8h,000h	; a62e  x.......x..

; ----------------------------------------------------------------------
; DATOS coger_55: Lo que hay que coger para abrir la salida de la fase 55; lo
;   leen msx1 p01:630C, msx2 p01:6502 (49 bytes)
;   0xa639..0xa66a  (49 bytes)
DATA_coger_55:
	defb 011h,018h,018h,011h,048h,018h,011h,078h,018h,011h,048h,0a0h,011h,0a8h,040h,011h	; a639  ....H..x..H...@.
	defb 0a8h,078h,012h,018h,040h,012h,018h,050h,012h,018h,060h,012h,018h,070h,012h,048h	; a649  .x..@..P..`..p.H
	defb 028h,012h,048h,038h,012h,048h,080h,012h,048h,098h,012h,078h,020h,012h,078h,038h	; a659  (.H8.H..H..x .x8
	defb 000h	; a669

; ----------------------------------------------------------------------
; DATOS coger_56: Lo que hay que coger para abrir la salida de la fase 56; lo
;   leen msx1 p01:630C, msx2 p01:6502 (49 bytes)
;   0xa66a..0xa69b  (49 bytes)
DATA_coger_56:
	defb 011h,010h,030h,011h,010h,0c0h,011h,028h,030h,011h,028h,060h,011h,028h,078h,011h	; a66a  ..0....(0.(`.(x.
	defb 028h,090h,011h,028h,0c0h,011h,040h,050h,011h,040h,0a0h,011h,058h,050h,011h,058h	; a67a  (..(..@P.@..XP.X
	defb 0a0h,011h,070h,050h,011h,070h,0a0h,011h,088h,050h,011h,088h,0a0h,011h,070h,0d0h	; a68a  ..pP.p...P....p.
	defb 000h	; a69a

; ----------------------------------------------------------------------
; DATOS coger_57: Lo que hay que coger para abrir la salida de la fase 57; lo
;   leen msx1 p01:630C, msx2 p01:6502 (49 bytes)
;   0xa69b..0xa6cc  (49 bytes)
DATA_coger_57:
	defb 011h,028h,078h,011h,048h,058h,011h,048h,098h,011h,068h,058h,011h,088h,058h,011h	; a69b  .(x.HX.H..hX..X.
	defb 088h,098h,011h,058h,0e8h,011h,068h,0d8h,011h,078h,0c8h,012h,028h,078h,012h,048h	; a6ab  ...X..h..x..(x.H
	defb 058h,012h,048h,098h,012h,058h,008h,012h,068h,018h,012h,078h,028h,012h,068h,098h	; a6bb  X.H..X..h..x(.h.
	defb 000h	; a6cb

; ----------------------------------------------------------------------
; DATOS coger_58: Lo que hay que coger para abrir la salida de la fase 58; lo
;   leen msx1 p01:630C, msx2 p01:6502 (49 bytes)
;   0xa6cc..0xa6fd  (49 bytes)
DATA_coger_58:
	defb 011h,008h,028h,011h,018h,018h,011h,028h,008h,011h,008h,058h,011h,018h,048h,011h	; a6cc  ..(....(...X..H.
	defb 028h,038h,011h,038h,078h,011h,058h,078h,011h,078h,078h,011h,098h,078h,011h,048h	; a6dc  (8.8x.Xx.xx..x.H
	defb 098h,012h,018h,0b8h,012h,018h,0d8h,012h,038h,048h,012h,048h,038h,012h,098h,028h	; a6ec  ........8H.H8..(
	defb 000h	; a6fc

; ----------------------------------------------------------------------
; DATOS coger_59: Lo que hay que coger para abrir la salida de la fase 59; lo
;   leen msx1 p01:630C, msx2 p01:6502 (49 bytes)
;   0xa6fd..0xa72e  (49 bytes)
DATA_coger_59:
	defb 011h,0a8h,0b0h,012h,070h,068h,012h,070h,078h,012h,070h,088h,012h,0a8h,050h,012h	; a6fd  ....ph.px.p...P.
	defb 0a8h,0a0h,013h,018h,040h,013h,018h,0b0h,013h,048h,078h,014h,028h,0a0h,014h,038h	; a70d  ....@....Hx.(..8
	defb 080h,014h,038h,090h,014h,048h,070h,014h,058h,060h,014h,068h,090h,014h,078h,080h	; a71d  ..8..Hp.X`.h..x.
	defb 000h	; a72d

; ----------------------------------------------------------------------
; DATOS coger_60: Lo que hay que coger para abrir la salida de la fase 60; lo
;   leen msx1 p01:630C, msx2 p01:6502 (49 bytes)
;   0xa72e..0xa75f  (49 bytes)
DATA_coger_60:
	defb 011h,068h,050h,011h,0a0h,050h,011h,090h,0d8h,012h,050h,030h,012h,070h,040h,012h	; a72e  .hP..P....P0.p@.
	defb 090h,050h,012h,060h,0b0h,013h,030h,0a8h,013h,060h,0a8h,014h,018h,050h,014h,048h	; a73e  .P.`..0..`...P.H
	defb 0d8h,015h,020h,040h,015h,010h,0a0h,015h,048h,0b0h,016h,020h,0a0h,016h,048h,0a0h	; a74e  .. @....H.. ..H.
	defb 000h	; a75e

; ----------------------------------------------------------------------
; DATOS joyas: 60 punteros, uno por fase (se lee con la fase, de 1 a 60, desde
;   0xA75D: la entrada 0 no la lee nadie y sus dos bytes son lo ultimo de lo
;   que va delante): lo que hay que coger para abrir la salida: fichas de 3
;   bytes [tipo | pantalla][y][x], 0 acaba; lo leen msx1 p01:630C, msx2
;   p01:6502 (120 bytes)
;   0xa75f..0xa7d7  (120 bytes)
DATA_joyas:
	defw 0a000h,0a00dh,0a01ah,0a027h,0a034h,0a041h,0a04eh,0a061h	; a75f
	defw 0a074h,0a087h,0a09ah,0a0adh,0a0c0h,0a0d3h,0a0e6h,0a0f9h	; a76f
	defw 0a112h,0a12bh,0a144h,0a15dh,0a176h,0a18fh,0a1a8h,0a1c7h	; a77f
	defw 0a1e6h,0a205h,0a224h,0a243h,0a25ch,0a27bh,0a29ah,0a2b9h	; a78f
	defw 0a2d8h,0a2f7h,0a316h,0a33bh,0a360h,0a385h,0a3aah,0a3cfh	; a79f
	defw 0a3f4h,0a41fh,0a44ah,0a46fh,0a494h,0a4bch,0a4e1h,0a50ch	; a7af
	defw 0a537h,0a562h,0a58dh,0a5b8h,0a5e3h,0a60eh,0a639h,0a66ah	; a7bf
	defw 0a69bh,0a6cch,0a6fdh,0a72eh	; a7cf  -> DATA_coger_57 DATA_coger_58 DATA_coger_59 DATA_coger_60

; ----------------------------------------------------------------------
; DATOS cosas_01: Las cosas de la fase de la fase 1; lo leen msx1 p01:614D,
;   msx2 p01:6343 (1 bytes)
;   0xa7d7..0xa7d8  (1 bytes)
DATA_cosas_01:
	defb 000h	; a7d7

; ----------------------------------------------------------------------
; DATOS cosas_02: Las cosas de la fase de la fase 2; lo leen msx1 p01:614D,
;   msx2 p01:6343 (9 bytes)
;   0xa7d8..0xa7e1  (9 bytes)
DATA_cosas_02:
	defb 011h,048h,0a0h,019h,011h,068h,050h,018h,000h	; a7d8  .H...hP..

; ----------------------------------------------------------------------
; DATOS cosas_03: Las cosas de la fase de la fase 3; lo leen msx1 p01:614D,
;   msx2 p01:6343 (9 bytes)
;   0xa7e1..0xa7ea  (9 bytes)
DATA_cosas_03:
	defb 022h,068h,0a0h,019h,032h,010h,0a0h,020h,000h	; a7e1  "h..2.. .

; ----------------------------------------------------------------------
; DATOS cosas_04: Las cosas de la fase de la fase 4; lo leen msx1 p01:614D,
;   msx2 p01:6343 (9 bytes)
;   0xa7ea..0xa7f3  (9 bytes)
DATA_cosas_04:
	defb 012h,058h,078h,018h,032h,088h,030h,028h,000h	; a7ea  .Xx.2.0(.

; ----------------------------------------------------------------------
; DATOS cosas_05: Las cosas de la fase de la fase 5; lo leen msx1 p01:614D,
;   msx2 p01:6343 (1 bytes)
;   0xa7f3..0xa7f4  (1 bytes)
DATA_cosas_05:
	defb 000h	; a7f3

; ----------------------------------------------------------------------
; DATOS cosas_06: Las cosas de la fase de la fase 6; lo leen msx1 p01:614D,
;   msx2 p01:6343 (5 bytes)
;   0xa7f4..0xa7f9  (5 bytes)
DATA_cosas_06:
	defb 051h,070h,078h,010h,000h	; a7f4

; ----------------------------------------------------------------------
; DATOS cosas_07: Las cosas de la fase de la fase 7; lo leen msx1 p01:614D,
;   msx2 p01:6343 (13 bytes)
;   0xa7f9..0xa806  (13 bytes)
DATA_cosas_07:
	defb 041h,068h,070h,008h,042h,018h,070h,008h,042h,090h,070h,008h,000h	; a7f9  Ahp.B.p.B.p..

; ----------------------------------------------------------------------
; DATOS cosas_08: Las cosas de la fase de la fases 8, 9; lo leen msx1
;   p01:614D, msx2 p01:6343 (1 bytes)
;   0xa806..0xa807  (1 bytes)
DATA_cosas_08:
	defb 000h	; a806

; ----------------------------------------------------------------------
; DATOS cosas_10: Las cosas de la fase de la fase 10; lo leen msx1 p01:614D,
;   msx2 p01:6343 (45 bytes)
;   0xa807..0xa834  (45 bytes)
DATA_cosas_10:
	defb 041h,028h,008h,008h,041h,028h,048h,008h,041h,028h,088h,008h,041h,028h,0c8h,008h	; a807  A(..A(H.A(..A(..
	defb 041h,048h,048h,008h,041h,068h,088h,008h,041h,088h,0c8h,008h,042h,028h,058h,008h	; a817  AHH.Ah..A...B(X.
	defb 042h,028h,098h,008h,042h,048h,098h,008h,042h,068h,058h,008h,000h	; a827  B(..BH..BhX..

; ----------------------------------------------------------------------
; DATOS cosas_11: Las cosas de la fase de la fase 11; lo leen msx1 p01:614D,
;   msx2 p01:6343 (1 bytes)
;   0xa834..0xa835  (1 bytes)
DATA_cosas_11:
	defb 000h	; a834

; ----------------------------------------------------------------------
; DATOS cosas_12: Las cosas de la fase de la fase 12; lo leen msx1 p01:614D,
;   msx2 p01:6343 (9 bytes)
;   0xa835..0xa83e  (9 bytes)
DATA_cosas_12:
	defb 041h,080h,050h,008h,052h,090h,070h,010h,000h	; a835  A.P.R.p..

; ----------------------------------------------------------------------
; DATOS cosas_13: Las cosas de la fase de la fase 13; lo leen msx1 p01:614D,
;   msx2 p01:6343 (5 bytes)
;   0xa83e..0xa843  (5 bytes)
DATA_cosas_13:
	defb 032h,080h,030h,020h,000h	; a83e

; ----------------------------------------------------------------------
; DATOS cosas_14: Las cosas de la fase de la fase 14; lo leen msx1 p01:614D,
;   msx2 p01:6343 (9 bytes)
;   0xa843..0xa84c  (9 bytes)
DATA_cosas_14:
	defb 022h,070h,030h,019h,022h,070h,0c0h,018h,000h	; a843  "p0."p...

; ----------------------------------------------------------------------
; DATOS cosas_15: Las cosas de la fase de la fase 15; lo leen msx1 p01:614D,
;   msx2 p01:6343 (1 bytes)
;   0xa84c..0xa84d  (1 bytes)
DATA_cosas_15:
	defb 000h	; a84c

; ----------------------------------------------------------------------
; DATOS cosas_16: Las cosas de la fase de la fase 16; lo leen msx1 p01:614D,
;   msx2 p01:6343 (9 bytes)
;   0xa84d..0xa856  (9 bytes)
DATA_cosas_16:
	defb 051h,098h,050h,010h,041h,028h,030h,008h,000h	; a84d  Q.P.A(0..

; ----------------------------------------------------------------------
; DATOS cosas_17: Las cosas de la fase de la fase 17; lo leen msx1 p01:614D,
;   msx2 p01:6343 (37 bytes)
;   0xa856..0xa87b  (37 bytes)
DATA_cosas_17:
	defb 011h,078h,078h,018h,031h,070h,0a0h,020h,011h,078h,0d8h,018h,012h,078h,028h,019h	; a856  .xx.1p. .x...x(.
	defb 012h,078h,060h,019h,012h,078h,080h,019h,012h,078h,0b8h,019h,012h,078h,0d8h,019h	; a866  .x`..x...x...x..
	defb 033h,068h,020h,028h,000h	; a876

; ----------------------------------------------------------------------
; DATOS cosas_18: Las cosas de la fase de la fase 18; lo leen msx1 p01:614D,
;   msx2 p01:6343 (9 bytes)
;   0xa87b..0xa884  (9 bytes)
DATA_cosas_18:
	defb 053h,030h,020h,010h,013h,0a0h,080h,019h,000h	; a87b  S0 ......

; ----------------------------------------------------------------------
; DATOS cosas_19: Las cosas de la fase de la fase 19; lo leen msx1 p01:614D,
;   msx2 p01:6343 (1 bytes)
;   0xa884..0xa885  (1 bytes)
DATA_cosas_19:
	defb 000h	; a884

; ----------------------------------------------------------------------
; DATOS cosas_20: Las cosas de la fase de la fase 20; lo leen msx1 p01:614D,
;   msx2 p01:6343 (5 bytes)
;   0xa885..0xa88a  (5 bytes)
DATA_cosas_20:
	defb 051h,050h,030h,010h,000h	; a885

; ----------------------------------------------------------------------
; DATOS cosas_21: Las cosas de la fase de la fase 21; lo leen msx1 p01:614D,
;   msx2 p01:6343 (1 bytes)
;   0xa88a..0xa88b  (1 bytes)
DATA_cosas_21:
	defb 000h	; a88a

; ----------------------------------------------------------------------
; DATOS cosas_22: Las cosas de la fase de la fase 22; lo leen msx1 p01:614D,
;   msx2 p01:6343 (25 bytes)
;   0xa88b..0xa8a4  (25 bytes)
DATA_cosas_22:
	defb 051h,098h,070h,010h,022h,070h,068h,018h,022h,090h,0c8h,018h,013h,0a0h,020h,018h	; a88b  Q.p."ph."..... .
	defb 013h,0a0h,040h,018h,013h,0a0h,090h,019h,000h	; a89b  ..@......

; ----------------------------------------------------------------------
; DATOS cosas_23: Las cosas de la fase de la fase 23; lo leen msx1 p01:614D,
;   msx2 p01:6343 (1 bytes)
;   0xa8a4..0xa8a5  (1 bytes)
DATA_cosas_23:
	defb 000h	; a8a4

; ----------------------------------------------------------------------
; DATOS cosas_24: Las cosas de la fase de la fase 24; lo leen msx1 p01:614D,
;   msx2 p01:6343 (13 bytes)
;   0xa8a5..0xa8b2  (13 bytes)
DATA_cosas_24:
	defb 031h,028h,0b8h,038h,031h,068h,0b8h,038h,032h,028h,0c8h,078h,000h	; a8a5  1(.81h.82(.x.

; ----------------------------------------------------------------------
; DATOS cosas_25: Las cosas de la fase de la fase 25; lo leen msx1 p01:614D,
;   msx2 p01:6343 (9 bytes)
;   0xa8b2..0xa8bb  (9 bytes)
DATA_cosas_25:
	defb 051h,038h,0a8h,010h,051h,0a8h,0a8h,010h,000h	; a8b2  Q8..Q....

; ----------------------------------------------------------------------
; DATOS cosas_26: Las cosas de la fase de la fase 26; lo leen msx1 p01:614D,
;   msx2 p01:6343 (1 bytes)
;   0xa8bb..0xa8bc  (1 bytes)
DATA_cosas_26:
	defb 000h	; a8bb

; ----------------------------------------------------------------------
; DATOS cosas_27: Las cosas de la fase de la fase 27; lo leen msx1 p01:614D,
;   msx2 p01:6343 (25 bytes)
;   0xa8bc..0xa8d5  (25 bytes)
DATA_cosas_27:
	defb 041h,098h,090h,008h,011h,0a0h,078h,018h,012h,0a0h,0a0h,019h,033h,028h,038h,038h	; a8bc  A.....x.....3(88
	defb 043h,040h,0c0h,008h,033h,078h,060h,020h,000h	; a8cc  C@..3x` .

; ----------------------------------------------------------------------
; DATOS cosas_28: Las cosas de la fase de la fase 28; lo leen msx1 p01:614D,
;   msx2 p01:6343 (13 bytes)
;   0xa8d5..0xa8e2  (13 bytes)
DATA_cosas_28:
	defb 011h,090h,0b0h,021h,011h,090h,0d0h,021h,012h,090h,038h,020h,000h	; a8d5  ...!...!..8 .

; ----------------------------------------------------------------------
; DATOS cosas_29: Las cosas de la fase de la fase 29; lo leen msx1 p01:614D,
;   msx2 p01:6343 (13 bytes)
;   0xa8e2..0xa8ef  (13 bytes)
DATA_cosas_29:
	defb 041h,048h,018h,008h,041h,060h,008h,008h,051h,018h,060h,010h,000h	; a8e2  AH..A`..Q.`..

; ----------------------------------------------------------------------
; DATOS cosas_30: Las cosas de la fase de la fase 30; lo leen msx1 p01:614D,
;   msx2 p01:6343 (65 bytes)
;   0xa8ef..0xa930  (65 bytes)
DATA_cosas_30:
	defb 031h,0a0h,038h,018h,011h,020h,0b8h,018h,011h,040h,0b8h,018h,011h,060h,0b8h,019h	; a8ef  1.8.. ...@...`..
	defb 011h,080h,0b8h,019h,011h,040h,038h,019h,011h,060h,038h,019h,011h,060h,078h,019h	; a8ff  .....@8..`8..`x.
	defb 011h,080h,078h,019h,012h,020h,038h,018h,012h,080h,038h,019h,012h,080h,070h,019h	; a90f  ..x.. 8...8...p.
	defb 012h,020h,0b0h,019h,012h,040h,0b0h,018h,012h,060h,0b0h,018h,012h,080h,0b0h,018h	; a91f  . ...@...`......
	defb 000h	; a92f

; ----------------------------------------------------------------------
; DATOS cosas_31: Las cosas de la fase de la fase 31; lo leen msx1 p01:614D,
;   msx2 p01:6343 (9 bytes)
;   0xa930..0xa939  (9 bytes)
DATA_cosas_31:
	defb 031h,000h,0c8h,028h,031h,000h,0d0h,028h,000h	; a930  1..(1..(.

; ----------------------------------------------------------------------
; DATOS cosas_32: Las cosas de la fase de la fase 32; lo leen msx1 p01:614D,
;   msx2 p01:6343 (1 bytes)
;   0xa939..0xa93a  (1 bytes)
DATA_cosas_32:
	defb 000h	; a939

; ----------------------------------------------------------------------
; DATOS cosas_33: Las cosas de la fase de la fase 33; lo leen msx1 p01:614D,
;   msx2 p01:6343 (9 bytes)
;   0xa93a..0xa943  (9 bytes)
DATA_cosas_33:
	defb 032h,008h,070h,030h,051h,028h,0c0h,010h,000h	; a93a  2.p0Q(...

; ----------------------------------------------------------------------
; DATOS cosas_34: Las cosas de la fase de la fase 34; lo leen msx1 p01:614D,
;   msx2 p01:6343 (9 bytes)
;   0xa943..0xa94c  (9 bytes)
DATA_cosas_34:
	defb 031h,030h,0c0h,060h,033h,008h,050h,018h,000h	; a943  10.`3.P..

; ----------------------------------------------------------------------
; DATOS cosas_35: Las cosas de la fase de la fase 35; lo leen msx1 p01:614D,
;   msx2 p01:6343 (33 bytes)
;   0xa94c..0xa96d  (33 bytes)
DATA_cosas_35:
	defb 042h,030h,030h,008h,042h,030h,070h,008h,042h,030h,0b0h,008h,013h,098h,0d8h,021h	; a94c  B00.B0p.B0.....!
	defb 043h,058h,050h,008h,043h,058h,090h,008h,044h,088h,070h,008h,044h,028h,070h,008h	; a95c  CXP.CX..D.p.D(p.
	defb 000h	; a96c

; ----------------------------------------------------------------------
; DATOS cosas_36: Las cosas de la fase de la fase 36; lo leen msx1 p01:614D,
;   msx2 p01:6343 (5 bytes)
;   0xa96d..0xa972  (5 bytes)
DATA_cosas_36:
	defb 052h,040h,080h,010h,000h	; a96d

; ----------------------------------------------------------------------
; DATOS cosas_37: Las cosas de la fase de la fase 37; lo leen msx1 p01:614D,
;   msx2 p01:6343 (1 bytes)
;   0xa972..0xa973  (1 bytes)
DATA_cosas_37:
	defb 000h	; a972

; ----------------------------------------------------------------------
; DATOS cosas_38: Las cosas de la fase de la fase 38; lo leen msx1 p01:614D,
;   msx2 p01:6343 (13 bytes)
;   0xa973..0xa980  (13 bytes)
DATA_cosas_38:
	defb 021h,038h,098h,020h,021h,038h,0d0h,020h,033h,040h,080h,020h,000h	; a973  !8. !8. 3@. .

; ----------------------------------------------------------------------
; DATOS cosas_39: Las cosas de la fase de la fase 39; lo leen msx1 p01:614D,
;   msx2 p01:6343 (9 bytes)
;   0xa980..0xa989  (9 bytes)
DATA_cosas_39:
	defb 041h,088h,058h,008h,041h,058h,028h,008h,000h	; a980  A.X.AX(..

; ----------------------------------------------------------------------
; DATOS cosas_40: Las cosas de la fase de la fase 40; lo leen msx1 p01:614D,
;   msx2 p01:6343 (1 bytes)
;   0xa989..0xa98a  (1 bytes)
DATA_cosas_40:
	defb 000h	; a989

; ----------------------------------------------------------------------
; DATOS cosas_41: Las cosas de la fase de la fase 41; lo leen msx1 p01:614D,
;   msx2 p01:6343 (1 bytes)
;   0xa98a..0xa98b  (1 bytes)
DATA_cosas_41:
	defb 000h	; a98a

; ----------------------------------------------------------------------
; DATOS cosas_42: Las cosas de la fase de la fase 42; lo leen msx1 p01:614D,
;   msx2 p01:6343 (13 bytes)
;   0xa98b..0xa998  (13 bytes)
DATA_cosas_42:
	defb 031h,008h,080h,018h,051h,018h,0d0h,010h,041h,068h,030h,008h,000h	; a98b  1...Q...Ah0..

; ----------------------------------------------------------------------
; DATOS cosas_43: Las cosas de la fase de la fase 43; lo leen msx1 p01:614D,
;   msx2 p01:6343 (29 bytes)
;   0xa998..0xa9b5  (29 bytes)
DATA_cosas_43:
	defb 052h,070h,068h,010h,013h,0a0h,048h,019h,013h,0a0h,068h,018h,013h,0a0h,0b8h,018h	; a998  Rph...H...h.....
	defb 014h,0a0h,020h,018h,014h,0a0h,078h,019h,014h,0a0h,0c8h,019h,000h	; a9a8  .. ...x......

; ----------------------------------------------------------------------
; DATOS cosas_44: Las cosas de la fase de la fase 44; lo leen msx1 p01:614D,
;   msx2 p01:6343 (1 bytes)
;   0xa9b5..0xa9b6  (1 bytes)
DATA_cosas_44:
	defb 000h	; a9b5

; ----------------------------------------------------------------------
; DATOS cosas_45: Las cosas de la fase de la fase 45; lo leen msx1 p01:614D,
;   msx2 p01:6343 (1 bytes)
;   0xa9b6..0xa9b7  (1 bytes)
DATA_cosas_45:
	defb 000h	; a9b6

; ----------------------------------------------------------------------
; DATOS cosas_46: Las cosas de la fase de la fase 46; lo leen msx1 p01:614D,
;   msx2 p01:6343 (1 bytes)
;   0xa9b7..0xa9b8  (1 bytes)
DATA_cosas_46:
	defb 000h	; a9b7

; ----------------------------------------------------------------------
; DATOS cosas_47: Las cosas de la fase de la fase 47; lo leen msx1 p01:614D,
;   msx2 p01:6343 (17 bytes)
;   0xa9b8..0xa9c9  (17 bytes)
DATA_cosas_47:
	defb 011h,050h,058h,019h,011h,050h,098h,018h,011h,098h,048h,019h,011h,098h,0a8h,019h	; a9b8  .PX..P....H.....
	defb 000h	; a9c8

; ----------------------------------------------------------------------
; DATOS cosas_48: Las cosas de la fase de la fase 48; lo leen msx1 p01:614D,
;   msx2 p01:6343 (13 bytes)
;   0xa9c9..0xa9d6  (13 bytes)
DATA_cosas_48:
	defb 041h,038h,0b0h,008h,043h,088h,048h,008h,033h,010h,0b8h,018h,000h	; a9c9  A8..C.H.3....

; ----------------------------------------------------------------------
; DATOS cosas_49: Las cosas de la fase de la fase 49; lo leen msx1 p01:614D,
;   msx2 p01:6343 (1 bytes)
;   0xa9d6..0xa9d7  (1 bytes)
DATA_cosas_49:
	defb 000h	; a9d6

; ----------------------------------------------------------------------
; DATOS cosas_50: Las cosas de la fase de la fase 50; lo leen msx1 p01:614D,
;   msx2 p01:6343 (25 bytes)
;   0xa9d7..0xa9f0  (25 bytes)
DATA_cosas_50:
	defb 032h,088h,010h,030h,012h,048h,040h,018h,012h,048h,060h,018h,013h,098h,058h,019h	; a9d7  2..0.H@..H`...X.
	defb 013h,098h,0a8h,019h,014h,098h,070h,019h,000h	; a9e7  ......p..

; ----------------------------------------------------------------------
; DATOS cosas_51: Las cosas de la fase de la fase 51; lo leen msx1 p01:614D,
;   msx2 p01:6343 (13 bytes)
;   0xa9f0..0xa9fd  (13 bytes)
DATA_cosas_51:
	defb 011h,098h,028h,021h,011h,098h,0c8h,021h,031h,018h,090h,020h,000h	; a9f0  ..(!...!1.. .

; ----------------------------------------------------------------------
; DATOS cosas_52: Las cosas de la fase de la fase 52; lo leen msx1 p01:614D,
;   msx2 p01:6343 (25 bytes)
;   0xa9fd..0xaa16  (25 bytes)
DATA_cosas_52:
	defb 011h,050h,0b0h,010h,011h,070h,0b0h,011h,011h,0a0h,050h,019h,011h,0a0h,0a0h,019h	; a9fd  .P...p....P.....
	defb 012h,050h,060h,010h,012h,070h,060h,011h,000h	; aa0d  .P`..p`..

; ----------------------------------------------------------------------
; DATOS cosas_53: Las cosas de la fase de la fase 53; lo leen msx1 p01:614D,
;   msx2 p01:6343 (21 bytes)
;   0xaa16..0xaa2b  (21 bytes)
DATA_cosas_53:
	defb 011h,030h,080h,011h,011h,048h,080h,011h,012h,060h,040h,010h,013h,030h,030h,018h	; aa16  .0...H...`@..00.
	defb 043h,028h,080h,008h,000h	; aa26

; ----------------------------------------------------------------------
; DATOS cosas_54: Las cosas de la fase de la fase 54; lo leen msx1 p01:614D,
;   msx2 p01:6343 (9 bytes)
;   0xaa2b..0xaa34  (9 bytes)
DATA_cosas_54:
	defb 041h,020h,048h,008h,051h,090h,048h,010h,000h	; aa2b  A H.Q.H..

; ----------------------------------------------------------------------
; DATOS cosas_55: Las cosas de la fase de la fase 55; lo leen msx1 p01:614D,
;   msx2 p01:6343 (37 bytes)
;   0xaa34..0xaa59  (37 bytes)
DATA_cosas_55:
	defb 011h,038h,030h,020h,011h,038h,080h,021h,011h,068h,058h,020h,011h,068h,080h,021h	; aa34  .80 .8.!.hX .h.!
	defb 012h,038h,058h,021h,012h,068h,058h,020h,051h,018h,038h,010h,051h,0a8h,058h,010h	; aa44  .8X!.hX Q.8.Q.X.
	defb 032h,068h,0a0h,020h,000h	; aa54

; ----------------------------------------------------------------------
; DATOS cosas_56: Las cosas de la fase de la fase 56; lo leen msx1 p01:614D,
;   msx2 p01:6343 (49 bytes)
;   0xaa59..0xaa8a  (49 bytes)
DATA_cosas_56:
	defb 051h,010h,040h,010h,051h,010h,0b0h,010h,051h,028h,040h,010h,051h,028h,0b0h,010h	; aa59  Q.@.Q...Q(@.Q(..
	defb 011h,0a0h,020h,011h,011h,0a0h,0d0h,010h,031h,040h,060h,010h,031h,058h,060h,010h	; aa69  .. .....1@`.1X`.
	defb 031h,070h,060h,010h,031h,058h,098h,010h,031h,070h,098h,010h,031h,088h,098h,010h	; aa79  1p`.1X..1p..1...
	defb 000h	; aa89

; ----------------------------------------------------------------------
; DATOS cosas_57: Las cosas de la fase de la fase 57; lo leen msx1 p01:614D,
;   msx2 p01:6343 (9 bytes)
;   0xaa8a..0xaa93  (9 bytes)
DATA_cosas_57:
	defb 051h,010h,078h,010h,052h,010h,078h,010h,000h	; aa8a  Q.x.R.x..

; ----------------------------------------------------------------------
; DATOS cosas_58: Las cosas de la fase de la fase 58; lo leen msx1 p01:614D,
;   msx2 p01:6343 (17 bytes)
;   0xaa93..0xaaa4  (17 bytes)
DATA_cosas_58:
	defb 051h,018h,058h,010h,031h,008h,0c0h,020h,031h,008h,0c8h,020h,011h,038h,0b8h,020h	; aa93  Q.X.1.. 1.. .8.
	defb 000h	; aaa3

; ----------------------------------------------------------------------
; DATOS cosas_59: Las cosas de la fase de la fase 59; lo leen msx1 p01:614D,
;   msx2 p01:6343 (9 bytes)
;   0xaaa4..0xaaad  (9 bytes)
DATA_cosas_59:
	defb 012h,018h,078h,018h,012h,098h,078h,020h,000h	; aaa4  ..x...x .

; ----------------------------------------------------------------------
; DATOS cosas_60: Las cosas de la fase de la fase 60; lo leen msx1 p01:614D,
;   msx2 p01:6343 (53 bytes)
;   0xaaad..0xaae2  (53 bytes)
DATA_cosas_60:
	defb 041h,040h,080h,008h,011h,088h,0c0h,018h,022h,098h,090h,018h,022h,098h,0d0h,018h	; aaad  A@......"..."...
	defb 044h,058h,080h,008h,014h,040h,0c0h,018h,046h,058h,070h,008h,036h,028h,020h,060h	; aabd  DX...@..FXp.6( `
	defb 036h,028h,028h,060h,036h,028h,030h,060h,036h,028h,038h,060h,036h,028h,040h,060h	; aacd  6((`6(0`6(8`6(@`
	defb 036h,028h,048h,060h,000h	; aadd

; ----------------------------------------------------------------------
; DATOS cosas: 60 punteros, uno por fase (se lee con la fase, de 1 a 60, desde
;   0xAAE0: la entrada 0 no la lee nadie y sus dos bytes son lo ultimo de lo
;   que va delante): las cosas de la fase (puertas, bloques, suelos): fichas
;   de 4 bytes [tipo | pantalla][y][x][alto | variante], 0 acaba; lo leen msx1
;   p01:614D, msx2 p01:6343 (120 bytes)
;   0xaae2..0xab5a  (120 bytes)
DATA_cosas:
	defw 0a7d7h,0a7d8h,0a7e1h,0a7eah,0a7f3h,0a7f4h,0a7f9h,0a806h	; aae2
	defw 0a806h,0a807h,0a834h,0a835h,0a83eh,0a843h,0a84ch,0a84dh	; aaf2
	defw 0a856h,0a87bh,0a884h,0a885h,0a88ah,0a88bh,0a8a4h,0a8a5h	; ab02
	defw 0a8b2h,0a8bbh,0a8bch,0a8d5h,0a8e2h,0a8efh,0a930h,0a939h	; ab12
	defw 0a93ah,0a943h,0a94ch,0a96dh,0a972h,0a973h,0a980h,0a989h	; ab22
	defw 0a98ah,0a98bh,0a998h,0a9b5h,0a9b6h,0a9b7h,0a9b8h,0a9c9h	; ab32
	defw 0a9d6h,0a9d7h,0a9f0h,0a9fdh,0aa16h,0aa2bh,0aa34h,0aa59h	; ab42
	defw 0aa8ah,0aa93h,0aaa4h,0aaadh	; ab52  -> DATA_cosas_57 DATA_cosas_58 DATA_cosas_59 DATA_cosas_60

; ----------------------------------------------------------------------
; DATOS rejillas: la rejilla de pantallas de cada fase: 8 bytes por fase (con
;   fase - 1), un bit por casilla de una rejilla de 8 de ancho; lo leen msx1
;   p00:5BC9, msx2 p00:5DD2 (480 bytes)
;   0xab5a..0xad3a  (480 bytes)
DATA_rejillas:
	defb 080h,000h,000h,000h,000h,000h,000h,000h	; ab5a  ........
	defb 080h,000h,000h,000h,000h,000h,000h,000h	; ab62  ........
	defb 0c0h,000h,000h,000h,000h,000h,000h,000h	; ab6a  ........
	defb 080h,080h,000h,000h,000h,000h,000h,000h	; ab72  ........
	defb 0c0h,000h,000h,000h,000h,000h,000h,000h	; ab7a  ........
	defb 080h,080h,000h,000h,000h,000h,000h,000h	; ab82  ........
	defb 080h,080h,000h,000h,000h,000h,000h,000h	; ab8a  ........
	defb 0c0h,080h,000h,000h,000h,000h,000h,000h	; ab92  ........
	defb 080h,000h,000h,000h,000h,000h,000h,000h	; ab9a  ........
	defb 0c0h,000h,000h,000h,000h,000h,000h,000h	; aba2  ........
	defb 080h,000h,000h,000h,000h,000h,000h,000h	; abaa  ........
	defb 0c0h,000h,000h,000h,000h,000h,000h,000h	; abb2  ........
	defb 080h,080h,080h,000h,000h,000h,000h,000h	; abba  ........
	defb 040h,0c0h,000h,000h,000h,000h,000h,000h	; abc2  @.......
	defb 0e0h,000h,000h,000h,000h,000h,000h,000h	; abca  ........
	defb 080h,080h,000h,000h,000h,000h,000h,000h	; abd2  ........
	defb 0e0h,000h,000h,000h,000h,000h,000h,000h	; abda  ........
	defb 0e0h,000h,000h,000h,000h,000h,000h,000h	; abe2  ........
	defb 080h,000h,000h,000h,000h,000h,000h,000h	; abea  ........
	defb 080h,080h,000h,000h,000h,000h,000h,000h	; abf2  ........
	defb 080h,000h,000h,000h,000h,000h,000h,000h	; abfa  ........
	defb 0e0h,000h,000h,000h,000h,000h,000h,000h	; ac02  ........
	defb 0c0h,0c0h,000h,000h,000h,000h,000h,000h	; ac0a  ........
	defb 080h,0c0h,080h,000h,000h,000h,000h,000h	; ac12  ........
	defb 080h,000h,000h,000h,000h,000h,000h,000h	; ac1a  ........
	defb 0e0h,000h,000h,000h,000h,000h,000h,000h	; ac22  ........
	defb 0c0h,040h,000h,000h,000h,000h,000h,000h	; ac2a  .@......
	defb 0c0h,080h,000h,000h,000h,000h,000h,000h	; ac32  ........
	defb 080h,000h,000h,000h,000h,000h,000h,000h	; ac3a  ........
	defb 0c0h,000h,000h,000h,000h,000h,000h,000h	; ac42  ........
	defb 080h,000h,000h,000h,000h,000h,000h,000h	; ac4a  ........
	defb 080h,080h,080h,000h,000h,000h,000h,000h	; ac52  ........
	defb 0e0h,000h,000h,000h,000h,000h,000h,000h	; ac5a  ........
	defb 0c0h,0c0h,000h,000h,000h,000h,000h,000h	; ac62  ........
	defb 0c0h,0c0h,000h,000h,000h,000h,000h,000h	; ac6a  ........
	defb 040h,0c0h,080h,000h,000h,000h,000h,000h	; ac72  @.......
	defb 0f0h,000h,000h,000h,000h,000h,000h,000h	; ac7a  ........
	defb 0c0h,0c0h,000h,000h,000h,000h,000h,000h	; ac82  ........
	defb 080h,000h,000h,000h,000h,000h,000h,000h	; ac8a  ........
	defb 0c0h,0c0h,000h,000h,000h,000h,000h,000h	; ac92  ........
	defb 080h,000h,000h,000h,000h,000h,000h,000h	; ac9a  ........
	defb 0c0h,000h,000h,000h,000h,000h,000h,000h	; aca2  ........
	defb 0c0h,0c0h,000h,000h,000h,000h,000h,000h	; acaa  ........
	defb 0e0h,0e0h,000h,000h,000h,000h,000h,000h	; acb2  ........
	defb 0e0h,000h,000h,000h,000h,000h,000h,000h	; acba  ........
	defb 0e0h,020h,000h,000h,000h,000h,000h,000h	; acc2  . ......
	defb 080h,0c0h,000h,000h,000h,000h,000h,000h	; acca  ........
	defb 0e0h,000h,000h,000h,000h,000h,000h,000h	; acd2  ........
	defb 080h,000h,000h,000h,000h,000h,000h,000h	; acda  ........
	defb 0c0h,0c0h,000h,000h,000h,000h,000h,000h	; ace2  ........
	defb 080h,000h,000h,000h,000h,000h,000h,000h	; acea  ........
	defb 0c0h,000h,000h,000h,000h,000h,000h,000h	; acf2  ........
	defb 0e0h,000h,000h,000h,000h,000h,000h,000h	; acfa  ........
	defb 080h,080h,000h,000h,000h,000h,000h,000h	; ad02  ........
	defb 080h,080h,000h,000h,000h,000h,000h,000h	; ad0a  ........
	defb 080h,000h,000h,000h,000h,000h,000h,000h	; ad12  ........
	defb 0c0h,000h,000h,000h,000h,000h,000h,000h	; ad1a  ........
	defb 0c0h,000h,000h,000h,000h,000h,000h,000h	; ad22  ........
	defb 0c0h,0c0h,000h,000h,000h,000h,000h,000h	; ad2a  ........
	defb 0e0h,0e0h,000h,000h,000h,000h,000h,000h	; ad32  ........

; ----------------------------------------------------------------------
; DATOS saltos_adcf_01: Los saltos al salir por arriba de la fases 1, 2, 19,
;   29, 42, 51; se solapan 7 bloques: (saltos_ae47_01 AD3A-AD3D)
;   (saltos_aebf_02 AD3A-AD3D) (saltos_af37_02 AD3A-AD3D) (saltos_ae47_01
;   AD3A-AD3D) (saltos_aebf_02 AD3A-AD3D) (saltos_af37_02 AD3A-AD3D); lo leen
;   msx1 p00:5CDC, msx2 p00:5EE5 (3 bytes)
;   0xad3a..0xad3d  (3 bytes)
DATA_saltos_adcf_01:
	defb 000h,000h,0ffh	; ad3a

; ----------------------------------------------------------------------
; DATOS saltos_aebf_03: Los saltos al salir por la izquierda de la fases 3,
;   12, 38, 42, 52, 57; lo leen msx1 p00:5CDC, msx2 p00:5EE5 (3 bytes)
;   0xad3d..0xad40  (3 bytes)
DATA_saltos_aebf_03:
	defb 000h,001h,0ffh	; ad3d

; ----------------------------------------------------------------------
; DATOS saltos_af37_03: Los saltos al salir por la derecha de la fases 3, 12,
;   38, 42, 52, 57; lo leen msx1 p00:5CDC, msx2 p00:5EE5 (3 bytes)
;   0xad40..0xad43  (3 bytes)
DATA_saltos_af37_03:
	defb 001h,000h,0ffh	; ad40

; ----------------------------------------------------------------------
; DATOS saltos_adcf_04: Los saltos al salir por arriba de la fases 4, 50, 54,
;   55; lo leen msx1 p00:5CDC, msx2 p00:5EE5 (3 bytes)
;   0xad43..0xad46  (3 bytes)
DATA_saltos_adcf_04:
	defb 000h,008h,0ffh	; ad43

; ----------------------------------------------------------------------
; DATOS saltos_ae47_04: Los saltos al salir por abajo de la fases 4, 50, 54,
;   55; lo leen msx1 p00:5CDC, msx2 p00:5EE5 (3 bytes)
;   0xad46..0xad49  (3 bytes)
DATA_saltos_ae47_04:
	defb 008h,000h,0ffh	; ad46

; ----------------------------------------------------------------------
; DATOS saltos_aebf_15: Los saltos al salir por la izquierda de la fases 15,
;   17, 33, 45, 46, 48, 53; lo leen msx1 p00:5CDC, msx2 p00:5EE5 (3 bytes)
;   0xad49..0xad4c  (3 bytes)
DATA_saltos_aebf_15:
	defb 000h,002h,0ffh	; ad49

; ----------------------------------------------------------------------
; DATOS saltos_af37_15: Los saltos al salir por la derecha de la fases 15, 17,
;   33, 45, 46, 48, 53; lo leen msx1 p00:5CDC, msx2 p00:5EE5 (3 bytes)
;   0xad4c..0xad4f  (3 bytes)
DATA_saltos_af37_15:
	defb 002h,000h,0ffh	; ad4c

; ----------------------------------------------------------------------
; DATOS saltos_adcf_24: Los saltos al salir por arriba de la fases 24, 32; lo
;   leen msx1 p00:5CDC, msx2 p00:5EE5 (3 bytes)
;   0xad4f..0xad52  (3 bytes)
DATA_saltos_adcf_24:
	defb 000h,010h,0ffh	; ad4f

; ----------------------------------------------------------------------
; DATOS saltos_ae47_24: Los saltos al salir por abajo de la fases 24, 32; lo
;   leen msx1 p00:5CDC, msx2 p00:5EE5 (3 bytes)
;   0xad52..0xad55  (3 bytes)
DATA_saltos_ae47_24:
	defb 010h,000h,0ffh	; ad52

; ----------------------------------------------------------------------
; DATOS saltos_adcf_12: Los saltos al salir por arriba de la fase 12; se
;   solapan 3 bloques: (saltos_ae47_12 AD55-AD5A) (saltos_ae47_12 AD55-AD5A);
;   lo leen msx1 p00:5CDC, msx2 p00:5EE5 (5 bytes)
;   0xad55..0xad5a  (5 bytes)
DATA_saltos_adcf_12:
	defb 000h,000h,001h,001h,0ffh	; ad55

; ----------------------------------------------------------------------
; DATOS saltos_aebf_14: Los saltos al salir por la izquierda de la fases 14,
;   34, 43, 47; lo leen msx1 p00:5CDC, msx2 p00:5EE5 (3 bytes)
;   0xad5a..0xad5d  (3 bytes)
DATA_saltos_aebf_14:
	defb 008h,009h,0ffh	; ad5a

; ----------------------------------------------------------------------
; DATOS saltos_af37_14: Los saltos al salir por la derecha de la fases 14, 34,
;   43, 47; lo leen msx1 p00:5CDC, msx2 p00:5EE5 (3 bytes)
;   0xad5d..0xad60  (3 bytes)
DATA_saltos_af37_14:
	defb 009h,008h,0ffh	; ad5d

; ----------------------------------------------------------------------
; DATOS saltos_adcf_27: Los saltos al salir por arriba de la fase 27; lo leen
;   msx1 p00:5CDC, msx2 p00:5EE5 (3 bytes)
;   0xad60..0xad63  (3 bytes)
DATA_saltos_adcf_27:
	defb 001h,009h,0ffh	; ad60

; ----------------------------------------------------------------------
; DATOS saltos_ae47_27: Los saltos al salir por abajo de la fase 27; lo leen
;   msx1 p00:5CDC, msx2 p00:5EE5 (3 bytes)
;   0xad63..0xad66  (3 bytes)
DATA_saltos_ae47_27:
	defb 009h,001h,0ffh	; ad63

; ----------------------------------------------------------------------
; DATOS saltos_aebf_27: Los saltos al salir por la izquierda de la fase 27; lo
;   leen msx1 p00:5CDC, msx2 p00:5EE5 (5 bytes)
;   0xad66..0xad6b  (5 bytes)
DATA_saltos_aebf_27:
	defb 000h,001h,009h,009h,0ffh	; ad66

; ----------------------------------------------------------------------
; DATOS saltos_af37_27: Los saltos al salir por la derecha de la fase 27; lo
;   leen msx1 p00:5CDC, msx2 p00:5EE5 (5 bytes)
;   0xad6b..0xad70  (5 bytes)
DATA_saltos_af37_27:
	defb 001h,000h,009h,009h,0ffh	; ad6b

; ----------------------------------------------------------------------
; DATOS saltos_aebf_32: Los saltos al salir por la izquierda de la fase 32; se
;   solapan 3 bloques: (saltos_af37_32 AD70-AD75) (saltos_af37_32 AD70-AD75);
;   lo leen msx1 p00:5CDC, msx2 p00:5EE5 (5 bytes)
;   0xad70..0xad75  (5 bytes)
DATA_saltos_aebf_32:
	defb 000h,000h,010h,010h,0ffh	; ad70

; ----------------------------------------------------------------------
; DATOS saltos_adcf_33: Los saltos al salir por arriba de la fase 33; se
;   solapan 3 bloques: (saltos_ae47_33 AD75-AD7A) (saltos_ae47_33 AD75-AD7A);
;   lo leen msx1 p00:5CDC, msx2 p00:5EE5 (5 bytes)
;   0xad75..0xad7a  (5 bytes)
DATA_saltos_adcf_33:
	defb 000h,000h,001h,001h,0ffh	; ad75

; ----------------------------------------------------------------------
; DATOS saltos_adcf_35: Los saltos al salir por arriba de la fase 35; lo leen
;   msx1 p00:5CDC, msx2 p00:5EE5 (5 bytes)
;   0xad7a..0xad7f  (5 bytes)
DATA_saltos_adcf_35:
	defb 000h,008h,001h,009h,0ffh	; ad7a

; ----------------------------------------------------------------------
; DATOS saltos_ae47_35: Los saltos al salir por abajo de la fase 35; lo leen
;   msx1 p00:5CDC, msx2 p00:5EE5 (5 bytes)
;   0xad7f..0xad84  (5 bytes)
DATA_saltos_ae47_35:
	defb 008h,000h,009h,001h,0ffh	; ad7f

; ----------------------------------------------------------------------
; DATOS saltos_adcf_36: Los saltos al salir por arriba de la fase 36; lo leen
;   msx1 p00:5CDC, msx2 p00:5EE5 (3 bytes)
;   0xad84..0xad87  (3 bytes)
DATA_saltos_adcf_36:
	defb 001h,009h,0ffh	; ad84

; ----------------------------------------------------------------------
; DATOS saltos_ae47_36: Los saltos al salir por abajo de la fase 36; lo leen
;   msx1 p00:5CDC, msx2 p00:5EE5 (3 bytes)
;   0xad87..0xad8a  (3 bytes)
DATA_saltos_ae47_36:
	defb 009h,001h,0ffh	; ad87

; ----------------------------------------------------------------------
; DATOS saltos_adcf_37: Los saltos al salir por arriba de la fase 37; se
;   solapan 3 bloques: (saltos_ae47_37 AD8A-AD8F) (saltos_ae47_37 AD8A-AD8F);
;   lo leen msx1 p00:5CDC, msx2 p00:5EE5 (5 bytes)
;   0xad8a..0xad8f  (5 bytes)
DATA_saltos_adcf_37:
	defb 000h,000h,003h,003h,0ffh	; ad8a

; ----------------------------------------------------------------------
; DATOS saltos_adcf_40: Los saltos al salir por arriba de la fases 40, 43; lo
;   leen msx1 p00:5CDC, msx2 p00:5EE5 (5 bytes)
;   0xad8f..0xad94  (5 bytes)
DATA_saltos_adcf_40:
	defb 000h,008h,001h,009h,0ffh	; ad8f

; ----------------------------------------------------------------------
; DATOS saltos_ae47_40: Los saltos al salir por abajo de la fases 40, 43; lo
;   leen msx1 p00:5CDC, msx2 p00:5EE5 (5 bytes)
;   0xad94..0xad99  (5 bytes)
DATA_saltos_ae47_40:
	defb 008h,000h,009h,001h,0ffh	; ad94

; ----------------------------------------------------------------------
; DATOS saltos_adcf_44: Los saltos al salir por arriba de la fase 44; lo leen
;   msx1 p00:5CDC, msx2 p00:5EE5 (7 bytes)
;   0xad99..0xada0  (7 bytes)
DATA_saltos_adcf_44:
	defb 000h,008h,001h,009h,002h,00ah,0ffh	; ad99

; ----------------------------------------------------------------------
; DATOS saltos_ae47_44: Los saltos al salir por abajo de la fase 44; lo leen
;   msx1 p00:5CDC, msx2 p00:5EE5 (7 bytes)
;   0xada0..0xada7  (7 bytes)
DATA_saltos_ae47_44:
	defb 008h,000h,009h,001h,00ah,002h,0ffh	; ada0

; ----------------------------------------------------------------------
; DATOS saltos_aebf_44: Los saltos al salir por la izquierda de la fase 44; lo
;   leen msx1 p00:5CDC, msx2 p00:5EE5 (5 bytes)
;   0xada7..0xadac  (5 bytes)
DATA_saltos_aebf_44:
	defb 000h,002h,008h,00ah,0ffh	; ada7

; ----------------------------------------------------------------------
; DATOS saltos_af37_44: Los saltos al salir por la derecha de la fase 44; lo
;   leen msx1 p00:5CDC, msx2 p00:5EE5 (5 bytes)
;   0xadac..0xadb1  (5 bytes)
DATA_saltos_af37_44:
	defb 002h,000h,00ah,008h,0ffh	; adac

; ----------------------------------------------------------------------
; DATOS saltos_adcf_46: Los saltos al salir por arriba de la fase 46; lo leen
;   msx1 p00:5CDC, msx2 p00:5EE5 (3 bytes)
;   0xadb1..0xadb4  (3 bytes)
DATA_saltos_adcf_46:
	defb 002h,00ah,0ffh	; adb1

; ----------------------------------------------------------------------
; DATOS saltos_ae47_46: Los saltos al salir por abajo de la fase 46; lo leen
;   msx1 p00:5CDC, msx2 p00:5EE5 (3 bytes)
;   0xadb4..0xadb7  (3 bytes)
DATA_saltos_ae47_46:
	defb 00ah,002h,0ffh	; adb4

; ----------------------------------------------------------------------
; DATOS saltos_adcf_47: Los saltos al salir por arriba de la fase 47; lo leen
;   msx1 p00:5CDC, msx2 p00:5EE5 (5 bytes)
;   0xadb7..0xadbc  (5 bytes)
DATA_saltos_adcf_47:
	defb 000h,008h,009h,009h,0ffh	; adb7

; ----------------------------------------------------------------------
; DATOS saltos_ae47_47: Los saltos al salir por abajo de la fase 47; lo leen
;   msx1 p00:5CDC, msx2 p00:5EE5 (5 bytes)
;   0xadbc..0xadc1  (5 bytes)
DATA_saltos_ae47_47:
	defb 008h,000h,009h,009h,0ffh	; adbc

; ----------------------------------------------------------------------
; DATOS saltos_aebf_50: Los saltos al salir por la izquierda de la fase 50; lo
;   leen msx1 p00:5CDC, msx2 p00:5EE5 (5 bytes)
;   0xadc1..0xadc6  (5 bytes)
DATA_saltos_aebf_50:
	defb 000h,001h,008h,009h,0ffh	; adc1

; ----------------------------------------------------------------------
; DATOS saltos_af37_50: Los saltos al salir por la derecha de la fase 50; lo
;   leen msx1 p00:5CDC, msx2 p00:5EE5 (5 bytes)
;   0xadc6..0xadcb  (5 bytes)
DATA_saltos_af37_50:
	defb 001h,000h,009h,008h,0ffh	; adc6

; ----------------------------------------------------------------------
; DATOS saltos_adcf_53: Los saltos al salir por arriba de la fase 53; se
;   solapan 3 bloques: (saltos_ae47_53 ADCB-ADD0) (saltos_ae47_53 ADCB-ADD0);
;   lo leen msx1 p00:5CDC, msx2 p00:5EE5 (5 bytes)
;   0xadcb..0xadd0  (5 bytes)
DATA_saltos_adcf_53:
	defb 000h,000h,002h,002h,0ffh	; adcb

; ----------------------------------------------------------------------
; DATOS saltos_adcf_03: Los saltos al salir por arriba de la fases 3, 5, 6, 7,
;   8, 9, 10, 11, 13, 14, 15, 16, 17, 18, 20, 21, 22, 23, 25, 26, 28, 30, 31,
;   34, 38, 39, 41, 45, 48, 49, 52, 56, 57, 58, 59, 60; se solapan 7 bloques:
;   (saltos_ae47_03 ADD0-ADD1) (saltos_aebf_01 ADD0-ADD1) (saltos_af37_01
;   ADD0-ADD1) (saltos_ae47_03 ADD0-ADD1) (saltos_aebf_01 ADD0-ADD1)
;   (saltos_af37_01 ADD0-ADD1); lo leen msx1 p00:5CDC, msx2 p00:5EE5 (1 bytes)
;   0xadd0..0xadd1  (1 bytes)
DATA_saltos_adcf_03:
	defb 0ffh	; add0

; ----------------------------------------------------------------------
; DATOS saltos_adcf: 60 punteros, uno por fase (se lee con la fase, de 1 a 60,
;   desde 0xADCF: la entrada 0 no la lee nadie y sus dos bytes son lo ultimo
;   de lo que va delante): los saltos al salir por arriba (parejas [de][a],
;   0xFF acaba); lo leen msx1 p00:5CDC, msx2 p00:5EE5 (120 bytes)
;   0xadd1..0xae49  (120 bytes)
DATA_saltos_adcf:
	defw 0ad3ah,0ad3ah,0add0h,0ad43h,0add0h,0add0h,0add0h,0add0h	; add1
	defw 0add0h,0add0h,0add0h,0ad55h,0add0h,0add0h,0add0h,0add0h	; ade1
	defw 0add0h,0add0h,0ad3ah,0add0h,0add0h,0add0h,0add0h,0ad4fh	; adf1
	defw 0add0h,0add0h,0ad60h,0add0h,0ad3ah,0add0h,0add0h,0ad4fh	; ae01
	defw 0ad75h,0add0h,0ad7ah,0ad84h,0ad8ah,0add0h,0add0h,0ad8fh	; ae11
	defw 0add0h,0ad3ah,0ad8fh,0ad99h,0add0h,0adb1h,0adb7h,0add0h	; ae21
	defw 0add0h,0ad43h,0ad3ah,0add0h,0adcbh,0ad43h,0ad43h,0add0h	; ae31
	defw 0add0h,0add0h,0add0h,0add0h	; ae41  -> DATA_saltos_adcf_03 DATA_saltos_adcf_03 DATA_saltos_adcf_03 DATA_saltos_adcf_03

; ----------------------------------------------------------------------
; DATOS saltos_ae47: 60 punteros, uno por fase (se lee con la fase, de 1 a 60,
;   desde 0xAE47: la entrada 0 no la lee nadie y sus dos bytes son lo ultimo
;   de lo que va delante): los saltos al salir por abajo (parejas [de][a],
;   0xFF acaba); lo leen msx1 p00:5CDC, msx2 p00:5EE5 (120 bytes)
;   0xae49..0xaec1  (120 bytes)
DATA_saltos_ae47:
	defw 0ad3ah,0ad3ah,0add0h,0ad46h,0add0h,0add0h,0add0h,0add0h	; ae49
	defw 0add0h,0add0h,0add0h,0ad55h,0add0h,0add0h,0add0h,0add0h	; ae59
	defw 0add0h,0add0h,0ad3ah,0add0h,0add0h,0add0h,0add0h,0ad52h	; ae69
	defw 0add0h,0add0h,0ad63h,0add0h,0ad3ah,0add0h,0add0h,0ad52h	; ae79
	defw 0ad75h,0add0h,0ad7fh,0ad87h,0ad8ah,0add0h,0add0h,0ad94h	; ae89
	defw 0add0h,0ad3ah,0ad94h,0ada0h,0add0h,0adb4h,0adbch,0add0h	; ae99
	defw 0add0h,0ad46h,0ad3ah,0add0h,0adcbh,0ad46h,0ad46h,0add0h	; aea9
	defw 0add0h,0add0h,0add0h,0add0h	; aeb9  -> DATA_saltos_adcf_03 DATA_saltos_adcf_03 DATA_saltos_adcf_03 DATA_saltos_adcf_03

; ----------------------------------------------------------------------
; DATOS saltos_aebf: 60 punteros, uno por fase (se lee con la fase, de 1 a 60,
;   desde 0xAEBF: la entrada 0 no la lee nadie y sus dos bytes son lo ultimo
;   de lo que va delante): los saltos al salir por la izquierda (parejas
;   [de][a], 0xFF acaba); lo leen msx1 p00:5CDC, msx2 p00:5EE5 (120 bytes)
;   0xaec1..0xaf39  (120 bytes)
DATA_saltos_aebf:
	defw 0add0h,0ad3ah,0ad3dh,0add0h,0add0h,0add0h,0add0h,0add0h	; aec1
	defw 0add0h,0add0h,0ad3ah,0ad3dh,0add0h,0ad5ah,0ad49h,0add0h	; aed1
	defw 0ad49h,0add0h,0add0h,0add0h,0add0h,0add0h,0add0h,0add0h	; aee1
	defw 0add0h,0add0h,0ad66h,0add0h,0add0h,0add0h,0add0h,0ad70h	; aef1
	defw 0ad49h,0ad5ah,0add0h,0add0h,0add0h,0ad3dh,0add0h,0add0h	; af01
	defw 0add0h,0ad3dh,0ad5ah,0ada7h,0ad49h,0ad49h,0ad5ah,0ad49h	; af11
	defw 0add0h,0adc1h,0ad3ah,0ad3dh,0ad49h,0add0h,0add0h,0add0h	; af21
	defw 0ad3dh,0add0h,0add0h,0add0h	; af31  -> DATA_saltos_aebf_03 DATA_saltos_adcf_03 DATA_saltos_adcf_03 DATA_saltos_adcf_03

; ----------------------------------------------------------------------
; DATOS saltos_af37: 60 punteros, uno por fase (se lee con la fase, de 1 a 60,
;   desde 0xAF37: la entrada 0 no la lee nadie y sus dos bytes son lo ultimo
;   de lo que va delante): los saltos al salir por la derecha (parejas
;   [de][a], 0xFF acaba); lo leen msx1 p00:5CDC, msx2 p00:5EE5 (120 bytes)
;   0xaf39..0xafb1  (120 bytes)
DATA_saltos_af37:
	defw 0add0h,0ad3ah,0ad40h,0add0h,0add0h,0add0h,0add0h,0add0h	; af39
	defw 0add0h,0add0h,0ad3ah,0ad40h,0add0h,0ad5dh,0ad4ch,0add0h	; af49
	defw 0ad4ch,0add0h,0add0h,0add0h,0add0h,0add0h,0add0h,0add0h	; af59
	defw 0add0h,0add0h,0ad6bh,0add0h,0add0h,0add0h,0add0h,0ad70h	; af69
	defw 0ad4ch,0ad5dh,0add0h,0add0h,0add0h,0ad40h,0add0h,0add0h	; af79
	defw 0add0h,0ad40h,0ad5dh,0adach,0ad4ch,0ad4ch,0ad5dh,0ad4ch	; af89
	defw 0add0h,0adc6h,0ad3ah,0ad40h,0ad4ch,0add0h,0add0h,0add0h	; af99
	defw 0ad40h,0add0h,0add0h,0add0h	; afa9  -> DATA_saltos_af37_03 DATA_saltos_adcf_03 DATA_saltos_adcf_03 DATA_saltos_adcf_03

; ----------------------------------------------------------------------
; DATOS herramientas: 60 punteros, uno por fase (se lee con la fase - 1): las
;   cosas que se cogen y se llevan: fichas de 3 bytes [pantalla | tipo][y][x],
;   0xFF acaba; lo leen msx1 p02:9E38, msx2 p02:97D4 (120 bytes)
;   0xafb1..0xb029  (120 bytes)
DATA_herramientas:
	defw 0b029h,0b033h,0b03dh,0b056h,0b060h,0b073h,0b080h,0b099h	; afb1
	defw 0b0b5h,0b0c2h,0b0deh,0b0e5h,0b0ech,0b0fch,0b10fh,0b13dh	; afc1
	defw 0b14dh,0b166h,0b17fh,0b195h,0b1b1h,0b1c1h,0b1dah,0b1f6h	; afd1
	defw 0b212h,0b21fh,0b23bh,0b257h,0b273h,0b27ah,0b293h,0b29dh	; afe1
	defw 0b2c8h,0b2f3h,0b321h,0b32eh,0b362h,0b384h,0b3a0h,0b3a7h	; aff1
	defw 0b3c0h,0b3cdh,0b3e0h,0b3f6h,0b41bh,0b437h,0b45fh,0b48dh	; b001
	defw 0b4a6h,0b4b9h,0b4d5h,0b4ebh,0b4f5h,0b51dh,0b539h,0b543h	; b011
	defw 0b550h,0b560h,0b57fh,0b598h	; b021  -> DATA_herramientas_57 DATA_herramientas_58 DATA_herramientas_59 DATA_herramientas_60

; ----------------------------------------------------------------------
; DATOS herramientas_01: Las cosas que se cogen y se llevan de la fase 1; lo
;   leen msx1 p02:9E38, msx2 p02:97D4 (10 bytes)
;   0xb029..0xb033  (10 bytes)
DATA_herramientas_01:
	defb 011h,0a0h,0a0h,016h,050h,0b8h,014h,050h,038h,0ffh	; b029  ....P..P8.

; ----------------------------------------------------------------------
; DATOS herramientas_02: Las cosas que se cogen y se llevan de la fase 2; lo
;   leen msx1 p02:9E38, msx2 p02:97D4 (10 bytes)
;   0xb033..0xb03d  (10 bytes)
DATA_herramientas_02:
	defb 011h,008h,0d0h,011h,090h,0e8h,016h,088h,0d0h,0ffh	; b033  ..........

; ----------------------------------------------------------------------
; DATOS herramientas_03: Las cosas que se cogen y se llevan de la fase 3; lo
;   leen msx1 p02:9E38, msx2 p02:97D4 (25 bytes)
;   0xb03d..0xb056  (25 bytes)
DATA_herramientas_03:
	defb 011h,020h,020h,022h,0a0h,0e0h,016h,048h,030h,016h,048h,0c0h,016h,078h,0c0h,014h	; b03d  .  "...H0.H..x..
	defb 060h,050h,014h,060h,0a0h,014h,078h,030h,0ffh	; b04d  `P.`..x0.

; ----------------------------------------------------------------------
; DATOS herramientas_04: Las cosas que se cogen y se llevan de la fase 4; lo
;   leen msx1 p02:9E38, msx2 p02:97D4 (10 bytes)
;   0xb056..0xb060  (10 bytes)
DATA_herramientas_04:
	defb 011h,028h,078h,026h,0a0h,0a0h,025h,028h,010h,0ffh	; b056  .(x&..%(..

; ----------------------------------------------------------------------
; DATOS herramientas_05: Las cosas que se cogen y se llevan de la fase 5; lo
;   leen msx1 p02:9E38, msx2 p02:97D4 (19 bytes)
;   0xb060..0xb073  (19 bytes)
DATA_herramientas_05:
	defb 011h,030h,038h,021h,040h,0c8h,012h,0a0h,0b8h,025h,058h,088h,013h,080h,038h,023h	; b060  .08!@....%X...8#
	defb 078h,050h,0ffh	; b070

; ----------------------------------------------------------------------
; DATOS herramientas_06: Las cosas que se cogen y se llevan de la fase 6; lo
;   leen msx1 p02:9E38, msx2 p02:97D4 (13 bytes)
;   0xb073..0xb080  (13 bytes)
DATA_herramientas_06:
	defb 011h,040h,020h,022h,070h,0d0h,016h,0a0h,040h,026h,040h,0c0h,0ffh	; b073  .@ "p...@&@..

; ----------------------------------------------------------------------
; DATOS herramientas_07: Las cosas que se cogen y se llevan de la fase 7; lo
;   leen msx1 p02:9E38, msx2 p02:97D4 (25 bytes)
;   0xb080..0xb099  (25 bytes)
DATA_herramientas_07:
	defb 011h,080h,090h,021h,030h,090h,021h,0a8h,018h,012h,030h,0c8h,016h,020h,028h,026h	; b080  ...!0.!...0.. (&
	defb 030h,038h,014h,0a8h,038h,026h,058h,038h,0ffh	; b090  08..8&X8.

; ----------------------------------------------------------------------
; DATOS herramientas_08: Las cosas que se cogen y se llevan de la fase 8; lo
;   leen msx1 p02:9E38, msx2 p02:97D4 (28 bytes)
;   0xb099..0xb0b5  (28 bytes)
DATA_herramientas_08:
	defb 021h,010h,098h,021h,060h,098h,021h,0a8h,050h,031h,050h,048h,012h,060h,0c8h,026h	; b099  !..!`.!.P1PH.`.&
	defb 038h,0e0h,026h,088h,0e0h,024h,010h,0c8h,024h,060h,0c8h,0ffh	; b0a9  8.&..$..$`..

; ----------------------------------------------------------------------
; DATOS herramientas_09: Las cosas que se cogen y se llevan de la fase 9; lo
;   leen msx1 p02:9E38, msx2 p02:97D4 (13 bytes)
;   0xb0b5..0xb0c2  (13 bytes)
DATA_herramientas_09:
	defb 011h,018h,030h,011h,018h,0e0h,011h,068h,050h,011h,0a8h,0c0h,0ffh	; b0b5  ..0....hP....

; ----------------------------------------------------------------------
; DATOS herramientas_10: Las cosas que se cogen y se llevan de la fase 10; lo
;   leen msx1 p02:9E38, msx2 p02:97D4 (28 bytes)
;   0xb0c2..0xb0de  (28 bytes)
DATA_herramientas_10:
	defb 011h,038h,008h,011h,058h,008h,011h,078h,048h,011h,098h,088h,022h,018h,038h,021h	; b0c2  .8..X..xH...".8!
	defb 038h,0e8h,021h,058h,0e8h,021h,078h,0a8h,021h,098h,068h,0ffh	; b0d2  8.!X.!x.!.h.

; ----------------------------------------------------------------------
; DATOS herramientas_11: Las cosas que se cogen y se llevan de la fase 11; lo
;   leen msx1 p02:9E38, msx2 p02:97D4 (7 bytes)
;   0xb0de..0xb0e5  (7 bytes)
DATA_herramientas_11:
	defb 012h,030h,018h,011h,030h,0d8h,0ffh	; b0de

; ----------------------------------------------------------------------
; DATOS herramientas_12: Las cosas que se cogen y se llevan de la fase 12; lo
;   leen msx1 p02:9E38, msx2 p02:97D4 (7 bytes)
;   0xb0e5..0xb0ec  (7 bytes)
DATA_herramientas_12:
	defb 011h,060h,088h,021h,060h,0a0h,0ffh	; b0e5

; ----------------------------------------------------------------------
; DATOS herramientas_13: Las cosas que se cogen y se llevan de la fase 13; lo
;   leen msx1 p02:9E38, msx2 p02:97D4 (16 bytes)
;   0xb0ec..0xb0fc  (16 bytes)
DATA_herramientas_13:
	defb 011h,090h,098h,026h,070h,058h,021h,0a0h,0b0h,031h,090h,0c0h,025h,0a0h,0c0h,0ffh	; b0ec  ...&pX!..1..%...

; ----------------------------------------------------------------------
; DATOS herramientas_14: Las cosas que se cogen y se llevan de la fase 14; lo
;   leen msx1 p02:9E38, msx2 p02:97D4 (19 bytes)
;   0xb0fc..0xb10f  (19 bytes)
DATA_herramientas_14:
	defb 026h,040h,010h,026h,040h,0e0h,026h,060h,010h,026h,060h,0e0h,021h,0a8h,010h,021h	; b0fc  &@.&@.&`.&`.!..!
	defb 0a8h,0e0h,0ffh	; b10c

; ----------------------------------------------------------------------
; DATOS herramientas_15: Las cosas que se cogen y se llevan de la fase 15; lo
;   leen msx1 p02:9E38, msx2 p02:97D4 (46 bytes)
;   0xb10f..0xb13d  (46 bytes)
DATA_herramientas_15:
	defb 013h,060h,088h,016h,060h,008h,011h,0a8h,058h,021h,018h,020h,021h,018h,0d0h,026h	; b10f  .`..`...X!. !..&
	defb 060h,008h,026h,060h,048h,026h,060h,0c8h,026h,078h,088h,023h,090h,048h,021h,0a8h	; b11f  `.&`H&`.&x.#.H!.
	defb 030h,033h,060h,068h,036h,078h,028h,036h,0a8h,088h,031h,0a8h,0b8h,0ffh	; b12f  03`h6x(6..1...

; ----------------------------------------------------------------------
; DATOS herramientas_16: Las cosas que se cogen y se llevan de la fase 16; lo
;   leen msx1 p02:9E38, msx2 p02:97D4 (16 bytes)
;   0xb13d..0xb14d  (16 bytes)
DATA_herramientas_16:
	defb 016h,038h,070h,016h,058h,090h,016h,078h,0b0h,021h,090h,050h,022h,080h,0b0h,0ffh	; b13d  .8p.X..x.!.P"...

; ----------------------------------------------------------------------
; DATOS herramientas_17: Las cosas que se cogen y se llevan de la fase 17; lo
;   leen msx1 p02:9E38, msx2 p02:97D4 (25 bytes)
;   0xb14d..0xb166  (25 bytes)
DATA_herramientas_17:
	defb 014h,038h,058h,015h,0a8h,008h,021h,018h,0d8h,021h,0a8h,0d0h,032h,018h,0b0h,035h	; b14d  .8X...!..!..2..5
	defb 038h,0c0h,036h,050h,080h,031h,080h,058h,0ffh	; b15d  8.6P.1.X.

; ----------------------------------------------------------------------
; DATOS herramientas_18: Las cosas que se cogen y se llevan de la fase 18; lo
;   leen msx1 p02:9E38, msx2 p02:97D4 (25 bytes)
;   0xb166..0xb17f  (25 bytes)
DATA_herramientas_18:
	defb 016h,048h,028h,016h,058h,038h,034h,040h,090h,036h,050h,080h,033h,070h,048h,011h	; b166  .H(.X84@.6P.3pH.
	defb 008h,080h,021h,008h,0d8h,021h,0a8h,080h,0ffh	; b176  ..!..!...

; ----------------------------------------------------------------------
; DATOS herramientas_19: Las cosas que se cogen y se llevan de la fase 19; lo
;   leen msx1 p02:9E38, msx2 p02:97D4 (22 bytes)
;   0xb17f..0xb195  (22 bytes)
DATA_herramientas_19:
	defb 016h,020h,018h,011h,020h,060h,014h,040h,0b0h,012h,040h,0d0h,015h,068h,010h,011h	; b17f  . .. `.@..@..h..
	defb 088h,018h,011h,088h,0d8h,0ffh	; b18f

; ----------------------------------------------------------------------
; DATOS herramientas_20: Las cosas que se cogen y se llevan de la fase 20; lo
;   leen msx1 p02:9E38, msx2 p02:97D4 (28 bytes)
;   0xb195..0xb1b1  (28 bytes)
DATA_herramientas_20:
	defb 014h,010h,008h,011h,020h,090h,016h,030h,008h,013h,070h,008h,011h,090h,040h,021h	; b195  .... ..0..p...@!
	defb 010h,0c8h,025h,030h,030h,021h,0a8h,0b0h,026h,018h,080h,0ffh	; b1a5  ..%00!..&...

; ----------------------------------------------------------------------
; DATOS herramientas_21: Las cosas que se cogen y se llevan de la fase 21; lo
;   leen msx1 p02:9E38, msx2 p02:97D4 (16 bytes)
;   0xb1b1..0xb1c1  (16 bytes)
DATA_herramientas_21:
	defb 015h,008h,058h,015h,030h,0d8h,015h,050h,0c0h,011h,088h,098h,015h,0a0h,058h,0ffh	; b1b1  ..X.0..P......X.

; ----------------------------------------------------------------------
; DATOS herramientas_22: Las cosas que se cogen y se llevan de la fase 22; lo
;   leen msx1 p02:9E38, msx2 p02:97D4 (25 bytes)
;   0xb1c1..0xb1da  (25 bytes)
DATA_herramientas_22:
	defb 011h,030h,070h,016h,060h,090h,011h,0a8h,010h,021h,010h,0c8h,021h,038h,0a8h,026h	; b1c1  .0p.`....!..!8.&
	defb 0a8h,068h,021h,098h,010h,036h,058h,050h,0ffh	; b1d1  .h!..6XP.

; ----------------------------------------------------------------------
; DATOS herramientas_23: Las cosas que se cogen y se llevan de la fase 23; lo
;   leen msx1 p02:9E38, msx2 p02:97D4 (28 bytes)
;   0xb1da..0xb1f6  (28 bytes)
DATA_herramientas_23:
	defb 016h,0a0h,0b0h,036h,040h,050h,036h,040h,0e0h,036h,070h,090h,031h,0a8h,0c0h,046h	; b1da  ...6@P6@.6p.1..F
	defb 030h,0b0h,046h,040h,0b0h,046h,050h,0b0h,044h,070h,0b0h,0ffh	; b1ea  0.F@.FP.Dp..

; ----------------------------------------------------------------------
; DATOS herramientas_24: Las cosas que se cogen y se llevan de la fase 24; lo
;   leen msx1 p02:9E38, msx2 p02:97D4 (28 bytes)
;   0xb1f6..0xb212  (28 bytes)
DATA_herramientas_24:
	defb 011h,030h,078h,011h,050h,010h,021h,030h,078h,035h,020h,060h,033h,020h,090h,031h	; b1f6  .0x.P.!0x5 `3 .1
	defb 0a0h,040h,045h,028h,008h,045h,048h,008h,041h,088h,078h,0ffh	; b206  .@E(.EH.A.x.

; ----------------------------------------------------------------------
; DATOS herramientas_25: Las cosas que se cogen y se llevan de la fase 25; lo
;   leen msx1 p02:9E38, msx2 p02:97D4 (13 bytes)
;   0xb212..0xb21f  (13 bytes)
DATA_herramientas_25:
	defb 011h,068h,0c8h,015h,078h,0b8h,015h,088h,0e8h,012h,0a8h,0e8h,0ffh	; b212  .h..x........

; ----------------------------------------------------------------------
; DATOS herramientas_26: Las cosas que se cogen y se llevan de la fase 26; lo
;   leen msx1 p02:9E38, msx2 p02:97D4 (28 bytes)
;   0xb21f..0xb23b  (28 bytes)
DATA_herramientas_26:
	defb 016h,018h,048h,013h,068h,0b0h,013h,080h,040h,026h,070h,0e0h,026h,090h,0c0h,034h	; b21f  ..H.h...@&p.&..4
	defb 038h,0c0h,036h,048h,080h,036h,050h,010h,034h,068h,060h,0ffh	; b22f  8.6H.6P.4h`.

; ----------------------------------------------------------------------
; DATOS herramientas_27: Las cosas que se cogen y se llevan de la fase 27; lo
;   leen msx1 p02:9E38, msx2 p02:97D4 (28 bytes)
;   0xb23b..0xb257  (28 bytes)
DATA_herramientas_27:
	defb 015h,010h,0b8h,015h,070h,008h,012h,038h,048h,011h,010h,0d0h,011h,0a8h,0d0h,021h	; b23b  ....p..8H......!
	defb 068h,0a8h,025h,078h,0e8h,022h,088h,0c0h,032h,010h,0c8h,0ffh	; b24b  h.%x."..2...

; ----------------------------------------------------------------------
; DATOS herramientas_28: Las cosas que se cogen y se llevan de la fase 28; lo
;   leen msx1 p02:9E38, msx2 p02:97D4 (28 bytes)
;   0xb257..0xb273  (28 bytes)
DATA_herramientas_28:
	defb 016h,040h,090h,012h,020h,070h,024h,0a0h,020h,021h,060h,040h,026h,0a0h,060h,036h	; b257  .@.. p$. !`@&.`6
	defb 050h,050h,035h,050h,0d0h,036h,070h,0a0h,031h,090h,080h,0ffh	; b267  PP5P.6p.1...

; ----------------------------------------------------------------------
; DATOS herramientas_29: Las cosas que se cogen y se llevan de la fase 29; lo
;   leen msx1 p02:9E38, msx2 p02:97D4 (7 bytes)
;   0xb273..0xb27a  (7 bytes)
DATA_herramientas_29:
	defb 016h,038h,020h,016h,050h,010h,0ffh	; b273

; ----------------------------------------------------------------------
; DATOS herramientas_30: Las cosas que se cogen y se llevan de la fase 30; lo
;   leen msx1 p02:9E38, msx2 p02:97D4 (25 bytes)
;   0xb27a..0xb293  (25 bytes)
DATA_herramientas_30:
	defb 011h,008h,040h,015h,028h,0d8h,015h,088h,020h,011h,088h,060h,025h,048h,028h,021h	; b27a  ..@.(... ..`%H(!
	defb 048h,050h,025h,048h,090h,021h,068h,018h,0ffh	; b28a  HP%H.!h..

; ----------------------------------------------------------------------
; DATOS herramientas_31: Las cosas que se cogen y se llevan de la fase 31; lo
;   leen msx1 p02:9E38, msx2 p02:97D4 (10 bytes)
;   0xb293..0xb29d  (10 bytes)
DATA_herramientas_31:
	defb 016h,088h,0a8h,011h,018h,060h,011h,0a8h,0b8h,0ffh	; b293  .....`....

; ----------------------------------------------------------------------
; DATOS herramientas_32: Las cosas que se cogen y se llevan de la fase 32; lo
;   leen msx1 p02:9E38, msx2 p02:97D4 (43 bytes)
;   0xb29d..0xb2c8  (43 bytes)
DATA_herramientas_32:
	defb 013h,020h,090h,012h,040h,0e8h,014h,0a8h,098h,022h,010h,0a0h,025h,058h,0a0h,026h	; b29d  . ..@...."..%X.&
	defb 0a8h,040h,021h,0a8h,090h,031h,020h,040h,033h,040h,050h,036h,040h,060h,034h,050h	; b2ad  .@!..1 @3@P6@`4P
	defb 050h,035h,060h,050h,034h,060h,060h,031h,080h,008h,0ffh	; b2bd  P5`P4``1...

; ----------------------------------------------------------------------
; DATOS herramientas_33: Las cosas que se cogen y se llevan de la fase 33; lo
;   leen msx1 p02:9E38, msx2 p02:97D4 (43 bytes)
;   0xb2c8..0xb2f3  (43 bytes)
DATA_herramientas_33:
	defb 012h,028h,020h,011h,088h,0d0h,016h,0a8h,078h,016h,0a8h,0c8h,026h,038h,010h,026h	; b2c8  .( .....x...&8.&
	defb 048h,010h,026h,058h,010h,025h,088h,050h,021h,0a8h,028h,036h,078h,010h,036h,078h	; b2d8  H.&X.%.P!.(6x.6x
	defb 0d0h,035h,088h,010h,032h,088h,090h,036h,088h,0d0h,0ffh	; b2e8  .5..2..6...

; ----------------------------------------------------------------------
; DATOS herramientas_34: Las cosas que se cogen y se llevan de la fase 34; lo
;   leen msx1 p02:9E38, msx2 p02:97D4 (46 bytes)
;   0xb2f3..0xb321  (46 bytes)
DATA_herramientas_34:
	defb 012h,010h,030h,015h,048h,040h,011h,0a0h,038h,022h,0a8h,020h,034h,050h,050h,034h	; b2f3  ..0.H@..8". 4PP4
	defb 060h,040h,036h,050h,090h,036h,060h,0a0h,031h,0a8h,030h,043h,018h,060h,043h,018h	; b303  `@6P.6`.1.0C.`C.
	defb 090h,043h,028h,050h,043h,028h,0a0h,041h,0a8h,040h,026h,0a8h,0d8h,0ffh	; b313  .C(PC(.A.@&...

; ----------------------------------------------------------------------
; DATOS herramientas_35: Las cosas que se cogen y se llevan de la fase 35; lo
;   leen msx1 p02:9E38, msx2 p02:97D4 (13 bytes)
;   0xb321..0xb32e  (13 bytes)
DATA_herramientas_35:
	defb 012h,020h,008h,021h,020h,0d0h,031h,048h,0c8h,041h,0a8h,028h,0ffh	; b321  . .! .1H.A.(.

; ----------------------------------------------------------------------
; DATOS herramientas_36: Las cosas que se cogen y se llevan de la fase 36; lo
;   leen msx1 p02:9E38, msx2 p02:97D4 (52 bytes)
;   0xb32e..0xb362  (52 bytes)
DATA_herramientas_36:
	defb 016h,058h,068h,016h,078h,048h,016h,078h,0a8h,016h,098h,028h,021h,040h,0b0h,024h	; b32e  .Xh.xH.x...(!@.$
	defb 090h,030h,026h,0a0h,090h,031h,010h,018h,036h,020h,0d0h,034h,030h,0c0h,032h,040h	; b33e  .0&..1..6 .40.2@
	defb 0a0h,036h,0a8h,030h,036h,0a8h,0b0h,046h,080h,080h,046h,0a0h,030h,016h,068h,008h	; b34e  .6.06..F..F.0.h.
	defb 026h,010h,008h,0ffh	; b35e

; ----------------------------------------------------------------------
; DATOS herramientas_37: Las cosas que se cogen y se llevan de la fase 37; lo
;   leen msx1 p02:9E38, msx2 p02:97D4 (34 bytes)
;   0xb362..0xb384  (34 bytes)
DATA_herramientas_37:
	defb 014h,060h,0d0h,016h,070h,0c0h,016h,080h,028h,024h,060h,020h,024h,070h,030h,024h	; b362  .`..p...($` $p0$
	defb 070h,050h,024h,080h,0d0h,022h,0a0h,030h,036h,020h,030h,041h,0a0h,020h,034h,060h	; b372  pP$..".06 0A. 4`
	defb 0d0h,0ffh	; b382

; ----------------------------------------------------------------------
; DATOS herramientas_38: Las cosas que se cogen y se llevan de la fase 38; lo
;   leen msx1 p02:9E38, msx2 p02:97D4 (28 bytes)
;   0xb384..0xb3a0  (28 bytes)
DATA_herramientas_38:
	defb 012h,0a0h,060h,026h,018h,010h,021h,0a0h,080h,032h,050h,020h,036h,060h,090h,046h	; b384  ..`&..!..2P 6`.F
	defb 020h,030h,044h,020h,0a0h,046h,050h,020h,041h,060h,090h,0ffh	; b394   0D .FP A`..

; ----------------------------------------------------------------------
; DATOS herramientas_39: Las cosas que se cogen y se llevan de la fase 39; lo
;   leen msx1 p02:9E38, msx2 p02:97D4 (7 bytes)
;   0xb3a0..0xb3a7  (7 bytes)
DATA_herramientas_39:
	defb 012h,098h,030h,011h,098h,0c0h,0ffh	; b3a0

; ----------------------------------------------------------------------
; DATOS herramientas_40: Las cosas que se cogen y se llevan de la fase 40; lo
;   leen msx1 p02:9E38, msx2 p02:97D4 (25 bytes)
;   0xb3a7..0xb3c0  (25 bytes)
DATA_herramientas_40:
	defb 012h,0a8h,020h,021h,0a8h,098h,032h,0a0h,020h,046h,018h,010h,046h,018h,050h,046h	; b3a7  .. !..2. F..F.PF
	defb 028h,070h,046h,028h,030h,041h,0a0h,088h,0ffh	; b3b7  (pF(0A...

; ----------------------------------------------------------------------
; DATOS herramientas_41: Las cosas que se cogen y se llevan de la fase 41; lo
;   leen msx1 p02:9E38, msx2 p02:97D4 (13 bytes)
;   0xb3c0..0xb3cd  (13 bytes)
DATA_herramientas_41:
	defb 014h,010h,060h,016h,010h,070h,014h,010h,080h,016h,010h,090h,0ffh	; b3c0  ..`..p.......

; ----------------------------------------------------------------------
; DATOS herramientas_42: Las cosas que se cogen y se llevan de la fase 42; lo
;   leen msx1 p02:9E38, msx2 p02:97D4 (19 bytes)
;   0xb3cd..0xb3e0  (19 bytes)
DATA_herramientas_42:
	defb 016h,048h,090h,016h,098h,058h,021h,018h,020h,026h,018h,080h,026h,058h,0b0h,022h	; b3cd  .H...X!. &..&X."
	defb 098h,070h,0ffh	; b3dd

; ----------------------------------------------------------------------
; DATOS herramientas_43: Las cosas que se cogen y se llevan de la fase 43; lo
;   leen msx1 p02:9E38, msx2 p02:97D4 (22 bytes)
;   0xb3e0..0xb3f6  (22 bytes)
DATA_herramientas_43:
	defb 011h,038h,0c8h,024h,030h,038h,024h,070h,058h,026h,050h,0b8h,026h,070h,098h,034h	; b3e0  .8.$08$pX&P.&p.4
	defb 070h,078h,041h,040h,078h,0ffh	; b3f0

; ----------------------------------------------------------------------
; DATOS herramientas_44: Las cosas que se cogen y se llevan de la fase 44; lo
;   leen msx1 p02:9E38, msx2 p02:97D4 (37 bytes)
;   0xb3f6..0xb41b  (37 bytes)
DATA_herramientas_44:
	defb 016h,070h,010h,016h,070h,0e0h,026h,070h,010h,024h,070h,0e0h,036h,070h,010h,036h	; b3f6  .p..p.&p.$p.6p.6
	defb 070h,0e0h,046h,070h,010h,046h,070h,0e0h,056h,070h,010h,054h,070h,0e0h,066h,070h	; b406  p.Fp.Fp.Vp.Tp.fp
	defb 010h,066h,070h,0e0h,0ffh	; b416

; ----------------------------------------------------------------------
; DATOS herramientas_45: Las cosas que se cogen y se llevan de la fase 45; lo
;   leen msx1 p02:9E38, msx2 p02:97D4 (28 bytes)
;   0xb41b..0xb437  (28 bytes)
DATA_herramientas_45:
	defb 021h,020h,040h,021h,090h,078h,023h,070h,030h,023h,0a0h,010h,032h,020h,020h,033h	; b41b  ! @!.x#p0#..2  3
	defb 050h,040h,033h,060h,060h,035h,060h,090h,033h,050h,0b0h,0ffh	; b42b  P@3``5`.3P..

; ----------------------------------------------------------------------
; DATOS herramientas_46: Las cosas que se cogen y se llevan de la fase 46; lo
;   leen msx1 p02:9E38, msx2 p02:97D4 (40 bytes)
;   0xb437..0xb45f  (40 bytes)
DATA_herramientas_46:
	defb 014h,040h,040h,014h,050h,030h,014h,040h,0b0h,014h,050h,0c0h,026h,020h,030h,026h	; b437  .@@.P0.@..P.& 0&
	defb 020h,070h,026h,040h,020h,026h,040h,080h,036h,010h,038h,036h,020h,018h,036h,060h	; b447   p&@ &@.6.86 .6`
	defb 0b0h,036h,070h,0c0h,041h,0a0h,0e0h,0ffh	; b457  .6p.A...

; ----------------------------------------------------------------------
; DATOS herramientas_47: Las cosas que se cogen y se llevan de la fase 47; lo
;   leen msx1 p02:9E38, msx2 p02:97D4 (46 bytes)
;   0xb45f..0xb48d  (46 bytes)
DATA_herramientas_47:
	defb 016h,048h,030h,016h,048h,0c0h,014h,088h,058h,014h,088h,098h,026h,0a0h,020h,026h	; b45f  .H0.H...X...&. &
	defb 0a0h,0d0h,024h,018h,0a0h,026h,0a0h,088h,036h,070h,030h,036h,080h,030h,036h,070h	; b46f  ..$..&..6p06.06p
	defb 040h,036h,080h,040h,034h,070h,050h,034h,080h,050h,036h,0a0h,080h,0ffh	; b47f  @6.@4pP4.P6...

; ----------------------------------------------------------------------
; DATOS herramientas_48: Las cosas que se cogen y se llevan de la fase 48; lo
;   leen msx1 p02:9E38, msx2 p02:97D4 (25 bytes)
;   0xb48d..0xb4a6  (25 bytes)
DATA_herramientas_48:
	defb 013h,048h,0c0h,011h,0a0h,0d0h,025h,028h,020h,025h,048h,030h,035h,028h,020h,035h	; b48d  .H....%( %H05( 5
	defb 038h,010h,035h,058h,0e0h,035h,070h,010h,0ffh	; b49d  8.5X.5p..

; ----------------------------------------------------------------------
; DATOS herramientas_49: Las cosas que se cogen y se llevan de la fase 49; lo
;   leen msx1 p02:9E38, msx2 p02:97D4 (19 bytes)
;   0xb4a6..0xb4b9  (19 bytes)
DATA_herramientas_49:
	defb 014h,050h,008h,013h,050h,0e8h,016h,068h,008h,015h,068h,0e8h,012h,0a8h,018h,012h	; b4a6  .P..P..h..h.....
	defb 0a8h,0e8h,0ffh	; b4b6

; ----------------------------------------------------------------------
; DATOS herramientas_50: Las cosas que se cogen y se llevan de la fase 50; lo
;   leen msx1 p02:9E38, msx2 p02:97D4 (28 bytes)
;   0xb4b9..0xb4d5  (28 bytes)
DATA_herramientas_50:
	defb 016h,048h,058h,016h,048h,070h,026h,098h,038h,034h,020h,058h,032h,020h,0d8h,036h	; b4b9  .HX.Hp&.84 X2 .6
	defb 030h,0c8h,036h,060h,0d8h,036h,090h,018h,041h,020h,0d0h,0ffh	; b4c9  0.6`.6..A ..

; ----------------------------------------------------------------------
; DATOS herramientas_51: Las cosas que se cogen y se llevan de la fase 51; lo
;   leen msx1 p02:9E38, msx2 p02:97D4 (22 bytes)
;   0xb4d5..0xb4eb  (22 bytes)
DATA_herramientas_51:
	defb 016h,018h,028h,016h,018h,0c8h,013h,028h,038h,013h,028h,0b8h,013h,060h,048h,013h	; b4d5  ..(....(8.(..`H.
	defb 060h,0a8h,011h,0a8h,048h,0ffh	; b4e5

; ----------------------------------------------------------------------
; DATOS herramientas_52: Las cosas que se cogen y se llevan de la fase 52; lo
;   leen msx1 p02:9E38, msx2 p02:97D4 (10 bytes)
;   0xb4eb..0xb4f5  (10 bytes)
DATA_herramientas_52:
	defb 011h,010h,070h,021h,010h,080h,021h,0a8h,0b0h,0ffh	; b4eb  ..p!..!...

; ----------------------------------------------------------------------
; DATOS herramientas_53: Las cosas que se cogen y se llevan de la fase 53; lo
;   leen msx1 p02:9E38, msx2 p02:97D4 (40 bytes)
;   0xb4f5..0xb51d  (40 bytes)
DATA_herramientas_53:
	defb 011h,008h,080h,013h,030h,020h,013h,048h,020h,016h,048h,0e0h,013h,088h,048h,012h	; b4f5  ....0 .H .H...H.
	defb 098h,0b0h,022h,008h,080h,026h,030h,090h,026h,040h,0a0h,023h,030h,0b0h,026h,040h	; b505  .."..&0.&@.#0.&@
	defb 0c0h,023h,030h,0d0h,021h,098h,0b0h,0ffh	; b515  .#0.!...

; ----------------------------------------------------------------------
; DATOS herramientas_54: Las cosas que se cogen y se llevan de la fase 54; lo
;   leen msx1 p02:9E38, msx2 p02:97D4 (28 bytes)
;   0xb51d..0xb539  (28 bytes)
DATA_herramientas_54:
	defb 013h,010h,038h,013h,010h,080h,013h,068h,0d8h,016h,010h,0b8h,013h,068h,088h,012h	; b51d  ..8....h.....h..
	defb 090h,028h,021h,010h,038h,023h,028h,0c8h,023h,040h,0c8h,0ffh	; b52d  .(!.8#(.#@..

; ----------------------------------------------------------------------
; DATOS herramientas_55: Las cosas que se cogen y se llevan de la fase 55; lo
;   leen msx1 p02:9E38, msx2 p02:97D4 (10 bytes)
;   0xb539..0xb543  (10 bytes)
DATA_herramientas_55:
	defb 025h,018h,028h,024h,038h,0e8h,022h,0a8h,0d0h,0ffh	; b539  %.($8."...

; ----------------------------------------------------------------------
; DATOS herramientas_56: Las cosas que se cogen y se llevan de la fase 56; lo
;   leen msx1 p02:9E38, msx2 p02:97D4 (13 bytes)
;   0xb543..0xb550  (13 bytes)
DATA_herramientas_56:
	defb 011h,070h,0b0h,011h,0a0h,0c0h,012h,010h,060h,013h,070h,010h,0ffh	; b543  .p......`.p..

; ----------------------------------------------------------------------
; DATOS herramientas_57: Las cosas que se cogen y se llevan de la fase 57; lo
;   leen msx1 p02:9E38, msx2 p02:97D4 (16 bytes)
;   0xb550..0xb560  (16 bytes)
DATA_herramientas_57:
	defb 015h,088h,018h,015h,088h,068h,015h,088h,088h,011h,0a8h,060h,011h,0a8h,090h,0ffh	; b550  .....h.....`....

; ----------------------------------------------------------------------
; DATOS herramientas_58: Las cosas que se cogen y se llevan de la fase 58; lo
;   leen msx1 p02:9E38, msx2 p02:97D4 (31 bytes)
;   0xb560..0xb57f  (31 bytes)
DATA_herramientas_58:
	defb 012h,098h,0d8h,016h,018h,068h,016h,038h,028h,016h,038h,0d0h,016h,038h,0e0h,011h	; b560  .....h.8(.8..8..
	defb 0a8h,058h,026h,098h,0c8h,021h,0a8h,078h,026h,098h,098h,016h,008h,048h,0ffh	; b570  .X&..!.x&....H.

; ----------------------------------------------------------------------
; DATOS herramientas_59: Las cosas que se cogen y se llevan de la fase 59; lo
;   leen msx1 p02:9E38, msx2 p02:97D4 (25 bytes)
;   0xb57f..0xb598  (25 bytes)
DATA_herramientas_59:
	defb 016h,010h,058h,016h,010h,098h,015h,030h,058h,015h,030h,098h,024h,078h,0b0h,024h	; b57f  ..X....0X.0.$x.$
	defb 080h,0c0h,032h,0a8h,030h,041h,0a8h,028h,0ffh	; b58f  ..2.0A.(.

; ----------------------------------------------------------------------
; DATOS herramientas_60: Las cosas que se cogen y se llevan de la fase 60; lo
;   leen msx1 p02:9E38, msx2 p02:97D4 (43 bytes)
;   0xb598..0xb5c3  (43 bytes)
DATA_herramientas_60:
	defb 011h,008h,030h,021h,008h,010h,031h,008h,010h,034h,090h,030h,034h,090h,0a8h,044h	; b598  ..0!..1..4.04..D
	defb 048h,050h,046h,078h,070h,056h,078h,070h,054h,008h,030h,054h,038h,050h,051h,0a0h	; b5a8  HPFxpVxpT.0T8PQ.
	defb 030h,052h,078h,0d0h,066h,078h,090h,062h,078h,0c0h,0ffh	; b5b8  0Rx.fx.bx..

; ----------------------------------------------------------------------
; DATOS enemigos_01: Los sitios de los que salen los enemigos de la fase 1; lo
;   leen msx1 p01:6572, msx2 p01:6768 (5 bytes)
;   0xb5c3..0xb5c8  (5 bytes)
DATA_enemigos_01:
	defb 001h,001h,020h,020h,000h	; b5c3

; ----------------------------------------------------------------------
; DATOS enemigos_02: Los sitios de los que salen los enemigos de la fase 2; lo
;   leen msx1 p01:6572, msx2 p01:6768 (5 bytes)
;   0xb5c8..0xb5cd  (5 bytes)
DATA_enemigos_02:
	defb 001h,001h,090h,068h,000h	; b5c8

; ----------------------------------------------------------------------
; DATOS enemigos_03: Los sitios de los que salen los enemigos de la fase 3; lo
;   leen msx1 p01:6572, msx2 p01:6768 (5 bytes)
;   0xb5cd..0xb5d2  (5 bytes)
DATA_enemigos_03:
	defb 002h,001h,0a0h,078h,000h	; b5cd

; ----------------------------------------------------------------------
; DATOS enemigos_04: Los sitios de los que salen los enemigos de la fase 4; lo
;   leen msx1 p01:6572, msx2 p01:6768 (5 bytes)
;   0xb5d2..0xb5d7  (5 bytes)
DATA_enemigos_04:
	defb 001h,002h,028h,0a0h,000h	; b5d2

; ----------------------------------------------------------------------
; DATOS enemigos_05: Los sitios de los que salen los enemigos de la fase 5; lo
;   leen msx1 p01:6572, msx2 p01:6768 (5 bytes)
;   0xb5d7..0xb5dc  (5 bytes)
DATA_enemigos_05:
	defb 003h,002h,0a8h,050h,000h	; b5d7

; ----------------------------------------------------------------------
; DATOS enemigos_06: Los sitios de los que salen los enemigos de la fase 6; lo
;   leen msx1 p01:6572, msx2 p01:6768 (9 bytes)
;   0xb5dc..0xb5e5  (9 bytes)
DATA_enemigos_06:
	defb 001h,002h,070h,078h,004h,001h,010h,020h,000h	; b5dc  ..px... .

; ----------------------------------------------------------------------
; DATOS enemigos_07: Los sitios de los que salen los enemigos de la fase 7; lo
;   leen msx1 p01:6572, msx2 p01:6768 (5 bytes)
;   0xb5e5..0xb5ea  (5 bytes)
DATA_enemigos_07:
	defb 003h,002h,0a8h,0d8h,000h	; b5e5

; ----------------------------------------------------------------------
; DATOS enemigos_08: Los sitios de los que salen los enemigos de la fase 8; lo
;   leen msx1 p01:6572, msx2 p01:6768 (9 bytes)
;   0xb5ea..0xb5f3  (9 bytes)
DATA_enemigos_08:
	defb 002h,002h,010h,040h,004h,003h,050h,098h,000h	; b5ea  ...@..P..

; ----------------------------------------------------------------------
; DATOS enemigos_09: Los sitios de los que salen los enemigos de la fase 9; lo
;   leen msx1 p01:6572, msx2 p01:6768 (9 bytes)
;   0xb5f3..0xb5fc  (9 bytes)
DATA_enemigos_09:
	defb 004h,001h,018h,090h,001h,001h,018h,010h,000h	; b5f3  .........

; ----------------------------------------------------------------------
; DATOS enemigos_10: Los sitios de los que salen los enemigos de la fase 10;
;   lo leen msx1 p01:6572, msx2 p01:6768 (13 bytes)
;   0xb5fc..0xb609  (13 bytes)
DATA_enemigos_10:
	defb 003h,001h,018h,030h,004h,001h,058h,068h,004h,002h,038h,0c8h,000h	; b5fc  ...0..Xh..8..

; ----------------------------------------------------------------------
; DATOS enemigos_11: Los sitios de los que salen los enemigos de la fase 11;
;   lo leen msx1 p01:6572, msx2 p01:6768 (5 bytes)
;   0xb609..0xb60e  (5 bytes)
DATA_enemigos_11:
	defb 003h,001h,010h,040h,000h	; b609

; ----------------------------------------------------------------------
; DATOS enemigos_12: Los sitios de los que salen los enemigos de la fase 12;
;   lo leen msx1 p01:6572, msx2 p01:6768 (17 bytes)
;   0xb60e..0xb61f  (17 bytes)
DATA_enemigos_12:
	defb 001h,001h,070h,040h,001h,001h,030h,0d0h,001h,002h,070h,048h,001h,002h,030h,0a0h	; b60e  ..p@..0...pH..0.
	defb 000h	; b61e

; ----------------------------------------------------------------------
; DATOS enemigos_13: Los sitios de los que salen los enemigos de la fase 13;
;   lo leen msx1 p01:6572, msx2 p01:6768 (13 bytes)
;   0xb61f..0xb62c  (13 bytes)
DATA_enemigos_13:
	defb 004h,001h,020h,010h,004h,002h,020h,080h,004h,003h,078h,080h,000h	; b61f  .. ... ...x..

; ----------------------------------------------------------------------
; DATOS enemigos_14: Los sitios de los que salen los enemigos de la fase 14;
;   lo leen msx1 p01:6572, msx2 p01:6768 (25 bytes)
;   0xb62c..0xb645  (25 bytes)
DATA_enemigos_14:
	defb 004h,001h,020h,020h,004h,001h,040h,080h,004h,001h,020h,0e0h,004h,002h,0a8h,078h	; b62c  ..  ..@... ....x
	defb 004h,003h,020h,040h,004h,003h,020h,0c0h,000h	; b63c  .. @.. ..

; ----------------------------------------------------------------------
; DATOS enemigos_15: Los sitios de los que salen los enemigos de la fase 15;
;   lo leen msx1 p01:6572, msx2 p01:6768 (9 bytes)
;   0xb645..0xb64e  (9 bytes)
DATA_enemigos_15:
	defb 001h,001h,018h,038h,001h,003h,018h,0b8h,000h	; b645  ...8.....

; ----------------------------------------------------------------------
; DATOS enemigos_16: Los sitios de los que salen los enemigos de la fase 16;
;   lo leen msx1 p01:6572, msx2 p01:6768 (13 bytes)
;   0xb64e..0xb65b  (13 bytes)
DATA_enemigos_16:
	defb 004h,002h,020h,008h,001h,002h,070h,020h,003h,002h,070h,0d0h,000h	; b64e  .. ...p ..p..

; ----------------------------------------------------------------------
; DATOS enemigos_17: Los sitios de los que salen los enemigos de la fase 17;
;   lo leen msx1 p01:6572, msx2 p01:6768 (9 bytes)
;   0xb65b..0xb664  (9 bytes)
DATA_enemigos_17:
	defb 002h,002h,0a8h,030h,004h,003h,018h,060h,000h	; b65b  ...0...`.

; ----------------------------------------------------------------------
; DATOS enemigos_18: Los sitios de los que salen los enemigos de la fase 18;
;   lo leen msx1 p01:6572, msx2 p01:6768 (5 bytes)
;   0xb664..0xb669  (5 bytes)
DATA_enemigos_18:
	defb 004h,001h,008h,008h,000h	; b664

; ----------------------------------------------------------------------
; DATOS enemigos_19: Los sitios de los que salen los enemigos de la fase 19;
;   lo leen msx1 p01:6572, msx2 p01:6768 (5 bytes)
;   0xb669..0xb66e  (5 bytes)
DATA_enemigos_19:
	defb 003h,001h,040h,078h,000h	; b669

; ----------------------------------------------------------------------
; DATOS enemigos_20: Los sitios de los que salen los enemigos de la fase 20;
;   lo leen msx1 p01:6572, msx2 p01:6768 (13 bytes)
;   0xb66e..0xb67b  (13 bytes)
DATA_enemigos_20:
	defb 001h,001h,020h,060h,004h,001h,090h,008h,002h,002h,0a8h,078h,000h	; b66e  .. `.......x.

; ----------------------------------------------------------------------
; DATOS enemigos_21: Los sitios de los que salen los enemigos de la fase 21;
;   lo leen msx1 p01:6572, msx2 p01:6768 (9 bytes)
;   0xb67b..0xb684  (9 bytes)
DATA_enemigos_21:
	defb 004h,001h,010h,028h,004h,001h,068h,098h,000h	; b67b  ...(..h..

; ----------------------------------------------------------------------
; DATOS enemigos_22: Los sitios de los que salen los enemigos de la fase 22;
;   lo leen msx1 p01:6572, msx2 p01:6768 (9 bytes)
;   0xb684..0xb68d  (9 bytes)
DATA_enemigos_22:
	defb 004h,001h,030h,0a0h,002h,003h,010h,0a0h,000h	; b684  ..0......

; ----------------------------------------------------------------------
; DATOS enemigos_23: Los sitios de los que salen los enemigos de la fase 23;
;   lo leen msx1 p01:6572, msx2 p01:6768 (5 bytes)
;   0xb68d..0xb692  (5 bytes)
DATA_enemigos_23:
	defb 002h,004h,0a8h,068h,000h	; b68d

; ----------------------------------------------------------------------
; DATOS enemigos_24: Los sitios de los que salen los enemigos de la fase 24;
;   lo leen msx1 p01:6572, msx2 p01:6768 (9 bytes)
;   0xb692..0xb69b  (9 bytes)
DATA_enemigos_24:
	defb 004h,003h,010h,0d0h,003h,004h,048h,078h,000h	; b692  ......Hx.

; ----------------------------------------------------------------------
; DATOS enemigos_25: Los sitios de los que salen los enemigos de la fase 25;
;   lo leen msx1 p01:6572, msx2 p01:6768 (9 bytes)
;   0xb69b..0xb6a4  (9 bytes)
DATA_enemigos_25:
	defb 004h,001h,008h,090h,003h,001h,028h,028h,000h	; b69b  ......((.

; ----------------------------------------------------------------------
; DATOS enemigos_26: Los sitios de los que salen los enemigos de la fase 26;
;   lo leen msx1 p01:6572, msx2 p01:6768 (1 bytes)
;   0xb6a4..0xb6a5  (1 bytes)
DATA_enemigos_26:
	defb 000h	; b6a4

; ----------------------------------------------------------------------
; DATOS enemigos_27: Los sitios de los que salen los enemigos de la fase 27;
;   lo leen msx1 p01:6572, msx2 p01:6768 (9 bytes)
;   0xb6a5..0xb6ae  (9 bytes)
DATA_enemigos_27:
	defb 004h,002h,050h,0e8h,002h,003h,0a8h,078h,000h	; b6a5  ..P....x.

; ----------------------------------------------------------------------
; DATOS enemigos_28: Los sitios de los que salen los enemigos de la fase 28;
;   lo leen msx1 p01:6572, msx2 p01:6768 (13 bytes)
;   0xb6ae..0xb6bb  (13 bytes)
DATA_enemigos_28:
	defb 003h,002h,020h,0c0h,004h,003h,018h,068h,004h,003h,060h,030h,000h	; b6ae  .. ....h..`0.

; ----------------------------------------------------------------------
; DATOS enemigos_29: Los sitios de los que salen los enemigos de la fase 29;
;   lo leen msx1 p01:6572, msx2 p01:6768 (5 bytes)
;   0xb6bb..0xb6c0  (5 bytes)
DATA_enemigos_29:
	defb 001h,001h,038h,0a0h,000h	; b6bb

; ----------------------------------------------------------------------
; DATOS enemigos_30: Los sitios de los que salen los enemigos de la fase 30;
;   lo leen msx1 p01:6572, msx2 p01:6768 (9 bytes)
;   0xb6c0..0xb6c9  (9 bytes)
DATA_enemigos_30:
	defb 003h,002h,008h,0b8h,004h,002h,008h,030h,000h	; b6c0  .......0.

; ----------------------------------------------------------------------
; DATOS enemigos_31: Los sitios de los que salen los enemigos de la fase 31;
;   lo leen msx1 p01:6572, msx2 p01:6768 (13 bytes)
;   0xb6c9..0xb6d6  (13 bytes)
DATA_enemigos_31:
	defb 003h,001h,018h,018h,004h,001h,088h,030h,004h,001h,018h,090h,000h	; b6c9  .......0.....

; ----------------------------------------------------------------------
; DATOS enemigos_32: Los sitios de los que salen los enemigos de la fase 32;
;   lo leen msx1 p01:6572, msx2 p01:6768 (5 bytes)
;   0xb6d6..0xb6db  (5 bytes)
DATA_enemigos_32:
	defb 002h,002h,010h,0d0h,000h	; b6d6

; ----------------------------------------------------------------------
; DATOS enemigos_33: Los sitios de los que salen los enemigos de la fase 33;
;   lo leen msx1 p01:6572, msx2 p01:6768 (9 bytes)
;   0xb6db..0xb6e4  (9 bytes)
DATA_enemigos_33:
	defb 004h,002h,0a8h,0d0h,003h,003h,028h,020h,000h	; b6db  ......( .

; ----------------------------------------------------------------------
; DATOS enemigos_34: Los sitios de los que salen los enemigos de la fase 34;
;   lo leen msx1 p01:6572, msx2 p01:6768 (17 bytes)
;   0xb6e4..0xb6f5  (17 bytes)
DATA_enemigos_34:
	defb 001h,001h,0a0h,0e0h,004h,002h,010h,040h,004h,002h,010h,0b0h,001h,004h,0a8h,0c0h	; b6e4  .......@........
	defb 000h	; b6f4

; ----------------------------------------------------------------------
; DATOS enemigos_35: Los sitios de los que salen los enemigos de la fase 35;
;   lo leen msx1 p01:6572, msx2 p01:6768 (9 bytes)
;   0xb6f5..0xb6fe  (9 bytes)
DATA_enemigos_35:
	defb 001h,001h,020h,048h,003h,004h,0a8h,0c0h,000h	; b6f5  .. H.....

; ----------------------------------------------------------------------
; DATOS enemigos_36: Los sitios de los que salen los enemigos de la fase 36;
;   lo leen msx1 p01:6572, msx2 p01:6768 (9 bytes)
;   0xb6fe..0xb707  (9 bytes)
DATA_enemigos_36:
	defb 004h,002h,010h,0b0h,001h,003h,040h,050h,000h	; b6fe  ......@P.

; ----------------------------------------------------------------------
; DATOS enemigos_37: Los sitios de los que salen los enemigos de la fase 37;
;   lo leen msx1 p01:6572, msx2 p01:6768 (9 bytes)
;   0xb707..0xb710  (9 bytes)
DATA_enemigos_37:
	defb 001h,002h,0a0h,078h,003h,004h,0a0h,070h,000h	; b707  ...x...p.

; ----------------------------------------------------------------------
; DATOS enemigos_38: Los sitios de los que salen los enemigos de la fase 38;
;   lo leen msx1 p01:6572, msx2 p01:6768 (9 bytes)
;   0xb710..0xb719  (9 bytes)
DATA_enemigos_38:
	defb 004h,002h,0a0h,030h,004h,004h,020h,010h,000h	; b710  ...0.. ..

; ----------------------------------------------------------------------
; DATOS enemigos_39: Los sitios de los que salen los enemigos de la fase 39;
;   lo leen msx1 p01:6572, msx2 p01:6768 (5 bytes)
;   0xb719..0xb71e  (5 bytes)
DATA_enemigos_39:
	defb 003h,001h,078h,078h,000h	; b719

; ----------------------------------------------------------------------
; DATOS enemigos_40: Los sitios de los que salen los enemigos de la fase 40;
;   lo leen msx1 p01:6572, msx2 p01:6768 (5 bytes)
;   0xb71e..0xb723  (5 bytes)
DATA_enemigos_40:
	defb 003h,001h,0a8h,070h,000h	; b71e

; ----------------------------------------------------------------------
; DATOS enemigos_41: Los sitios de los que salen los enemigos de la fase 41;
;   lo leen msx1 p01:6572, msx2 p01:6768 (1 bytes)
;   0xb723..0xb724  (1 bytes)
DATA_enemigos_41:
	defb 000h	; b723

; ----------------------------------------------------------------------
; DATOS enemigos_42: Los sitios de los que salen los enemigos de la fase 42;
;   lo leen msx1 p01:6572, msx2 p01:6768 (5 bytes)
;   0xb724..0xb729  (5 bytes)
DATA_enemigos_42:
	defb 003h,002h,028h,0b0h,000h	; b724

; ----------------------------------------------------------------------
; DATOS enemigos_43: Los sitios de los que salen los enemigos de la fase 43;
;   lo leen msx1 p01:6572, msx2 p01:6768 (9 bytes)
;   0xb729..0xb732  (9 bytes)
DATA_enemigos_43:
	defb 004h,001h,018h,078h,004h,002h,050h,0c8h,000h	; b729  ...x..P..

; ----------------------------------------------------------------------
; DATOS enemigos_44: Los sitios de los que salen los enemigos de la fase 44;
;   lo leen msx1 p01:6572, msx2 p01:6768 (1 bytes)
;   0xb732..0xb733  (1 bytes)
DATA_enemigos_44:
	defb 000h	; b732

; ----------------------------------------------------------------------
; DATOS enemigos_45: Los sitios de los que salen los enemigos de la fase 45;
;   lo leen msx1 p01:6572, msx2 p01:6768 (9 bytes)
;   0xb733..0xb73c  (9 bytes)
DATA_enemigos_45:
	defb 001h,002h,020h,020h,004h,003h,020h,078h,000h	; b733  ..  .. x.

; ----------------------------------------------------------------------
; DATOS enemigos_46: Los sitios de los que salen los enemigos de la fase 46;
;   lo leen msx1 p01:6572, msx2 p01:6768 (9 bytes)
;   0xb73c..0xb745  (9 bytes)
DATA_enemigos_46:
	defb 004h,001h,010h,078h,004h,004h,0a0h,030h,000h	; b73c  ...x...0.

; ----------------------------------------------------------------------
; DATOS enemigos_47: Los sitios de los que salen los enemigos de la fase 47;
;   lo leen msx1 p01:6572, msx2 p01:6768 (5 bytes)
;   0xb745..0xb74a  (5 bytes)
DATA_enemigos_47:
	defb 001h,003h,050h,0b8h,000h	; b745

; ----------------------------------------------------------------------
; DATOS enemigos_48: Los sitios de los que salen los enemigos de la fase 48;
;   lo leen msx1 p01:6572, msx2 p01:6768 (13 bytes)
;   0xb74a..0xb757  (13 bytes)
DATA_enemigos_48:
	defb 001h,001h,0a0h,070h,004h,003h,0a0h,078h,004h,003h,018h,040h,000h	; b74a  ...p...x...@.

; ----------------------------------------------------------------------
; DATOS enemigos_49: Los sitios de los que salen los enemigos de la fase 49;
;   lo leen msx1 p01:6572, msx2 p01:6768 (9 bytes)
;   0xb757..0xb760  (9 bytes)
DATA_enemigos_49:
	defb 001h,001h,0a8h,008h,004h,001h,018h,098h,000h	; b757  .........

; ----------------------------------------------------------------------
; DATOS enemigos_50: Los sitios de los que salen los enemigos de la fase 50;
;   lo leen msx1 p01:6572, msx2 p01:6768 (5 bytes)
;   0xb760..0xb765  (5 bytes)
DATA_enemigos_50:
	defb 003h,002h,0a8h,0a0h,000h	; b760

; ----------------------------------------------------------------------
; DATOS enemigos_51: Los sitios de los que salen los enemigos de la fase 51;
;   lo leen msx1 p01:6572, msx2 p01:6768 (5 bytes)
;   0xb765..0xb76a  (5 bytes)
DATA_enemigos_51:
	defb 001h,001h,0a8h,010h,000h	; b765

; ----------------------------------------------------------------------
; DATOS enemigos_52: Los sitios de los que salen los enemigos de la fase 52;
;   lo leen msx1 p01:6572, msx2 p01:6768 (9 bytes)
;   0xb76a..0xb773  (9 bytes)
DATA_enemigos_52:
	defb 002h,001h,0a8h,018h,003h,002h,0a8h,0d8h,000h	; b76a  .........

; ----------------------------------------------------------------------
; DATOS enemigos_53: Los sitios de los que salen los enemigos de la fase 53;
;   lo leen msx1 p01:6572, msx2 p01:6768 (9 bytes)
;   0xb773..0xb77c  (9 bytes)
DATA_enemigos_53:
	defb 004h,002h,018h,060h,004h,003h,018h,060h,000h	; b773  ...`...`.

; ----------------------------------------------------------------------
; DATOS enemigos_54: Los sitios de los que salen los enemigos de la fase 54;
;   lo leen msx1 p01:6572, msx2 p01:6768 (9 bytes)
;   0xb77c..0xb785  (9 bytes)
DATA_enemigos_54:
	defb 001h,001h,0a8h,0e8h,001h,002h,0a8h,008h,000h	; b77c  .........

; ----------------------------------------------------------------------
; DATOS enemigos_55: Los sitios de los que salen los enemigos de la fase 55;
;   lo leen msx1 p01:6572, msx2 p01:6768 (5 bytes)
;   0xb785..0xb78a  (5 bytes)
DATA_enemigos_55:
	defb 001h,002h,0a8h,048h,000h	; b785

; ----------------------------------------------------------------------
; DATOS enemigos_56: Los sitios de los que salen los enemigos de la fase 56;
;   lo leen msx1 p01:6572, msx2 p01:6768 (13 bytes)
;   0xb78a..0xb797  (13 bytes)
DATA_enemigos_56:
	defb 001h,001h,088h,040h,003h,001h,010h,010h,003h,001h,010h,0e0h,000h	; b78a  ...@.........

; ----------------------------------------------------------------------
; DATOS enemigos_57: Los sitios de los que salen los enemigos de la fase 57;
;   lo leen msx1 p01:6572, msx2 p01:6768 (13 bytes)
;   0xb797..0xb7a4  (13 bytes)
DATA_enemigos_57:
	defb 004h,001h,030h,0d0h,004h,002h,030h,018h,001h,002h,0a8h,0e0h,000h	; b797  ..0...0......

; ----------------------------------------------------------------------
; DATOS enemigos_58: Los sitios de los que salen los enemigos de la fase 58;
;   lo leen msx1 p01:6572, msx2 p01:6768 (17 bytes)
;   0xb7a4..0xb7b5  (17 bytes)
DATA_enemigos_58:
	defb 003h,001h,058h,008h,003h,001h,0a8h,008h,004h,002h,048h,018h,004h,002h,018h,090h	; b7a4  ..X.......H.....
	defb 000h	; b7b4

; ----------------------------------------------------------------------
; DATOS enemigos_59: Los sitios de los que salen los enemigos de la fase 59;
;   lo leen msx1 p01:6572, msx2 p01:6768 (9 bytes)
;   0xb7b5..0xb7be  (9 bytes)
DATA_enemigos_59:
	defb 004h,003h,088h,0d0h,002h,004h,0a8h,0c0h,000h	; b7b5  .........

; ----------------------------------------------------------------------
; DATOS enemigos_60: Los sitios de los que salen los enemigos de la fase 60;
;   lo leen msx1 p01:6572, msx2 p01:6768 (17 bytes)
;   0xb7be..0xb7cf  (17 bytes)
DATA_enemigos_60:
	defb 001h,003h,008h,078h,003h,004h,0a0h,050h,002h,005h,078h,020h,001h,006h,078h,050h	; b7be  ...x...P..x ..xP
	defb 000h	; b7ce

; ----------------------------------------------------------------------
; DATOS salidas_enemigos: 60 punteros, uno por fase (se lee con la fase, de 1
;   a 60, desde 0xB7CD: la entrada 0 no la lee nadie y sus dos bytes son lo
;   ultimo de lo que va delante): los sitios de los que salen los enemigos:
;   fichas de 4 bytes [tipo] y 3 mas, 0 acaba; lo leen msx1 p01:6572, msx2
;   p01:6768 (120 bytes)
;   0xb7cf..0xb847  (120 bytes)
DATA_salidas_enemigos:
	defw 0b5c3h,0b5c8h,0b5cdh,0b5d2h,0b5d7h,0b5dch,0b5e5h,0b5eah	; b7cf
	defw 0b5f3h,0b5fch,0b609h,0b60eh,0b61fh,0b62ch,0b645h,0b64eh	; b7df
	defw 0b65bh,0b664h,0b669h,0b66eh,0b67bh,0b684h,0b68dh,0b692h	; b7ef
	defw 0b69bh,0b6a4h,0b6a5h,0b6aeh,0b6bbh,0b6c0h,0b6c9h,0b6d6h	; b7ff
	defw 0b6dbh,0b6e4h,0b6f5h,0b6feh,0b707h,0b710h,0b719h,0b71eh	; b80f
	defw 0b723h,0b724h,0b729h,0b732h,0b733h,0b73ch,0b745h,0b74ah	; b81f
	defw 0b757h,0b760h,0b765h,0b76ah,0b773h,0b77ch,0b785h,0b78ah	; b82f
	defw 0b797h,0b7a4h,0b7b5h,0b7beh	; b83f  -> DATA_enemigos_57 DATA_enemigos_58 DATA_enemigos_59 DATA_enemigos_60

; ----------------------------------------------------------------------
; DATOS inicio: donde empieza el personaje: 3 bytes por fase [y][x][pantalla],
;   en 0xB844 + 3 x fase (la entrada 0 son los ultimos bytes de la tabla de
;   delante); lo leen msx1 p02:8FD2, msx2 p02:92B9 (180 bytes)
;   0xb847..0xb8fb  (180 bytes)
DATA_inicio:
	defb 0a0h,080h,001h	; b847
	defb 090h,088h,001h	; b84a
	defb 020h,078h,001h	; b84d
	defb 028h,098h,001h	; b850
	defb 0a8h,0c0h,002h	; b853
	defb 0a0h,078h,002h	; b856
	defb 0a8h,078h,002h	; b859
	defb 0a8h,068h,003h	; b85c
	defb 0a8h,078h,001h	; b85f
	defb 018h,008h,002h	; b862
	defb 050h,0b8h,001h	; b865
	defb 070h,0e0h,001h	; b868
	defb 050h,090h,003h	; b86b
	defb 020h,010h,003h	; b86e
	defb 0a8h,078h,002h	; b871
	defb 090h,078h,002h	; b874
	defb 0a8h,078h,002h	; b877
	defb 088h,0d8h,002h	; b87a
	defb 058h,078h,001h	; b87d
	defb 090h,078h,001h	; b880
	defb 050h,078h,001h	; b883
	defb 010h,078h,002h	; b886
	defb 0a8h,090h,003h	; b889
	defb 0a0h,078h,003h	; b88c
	defb 078h,008h,001h	; b88f
	defb 018h,098h,002h	; b892
	defb 0a8h,068h,002h	; b895
	defb 090h,068h,003h	; b898
	defb 018h,078h,001h	; b89b
	defb 008h,078h,001h	; b89e
	defb 0a8h,078h,001h	; b8a1
	defb 010h,078h,002h	; b8a4
	defb 088h,078h,002h	; b8a7
	defb 0a8h,078h,002h	; b8aa
	defb 0a8h,078h,002h	; b8ad
	defb 040h,078h,003h	; b8b0
	defb 0a0h,078h,001h	; b8b3
	defb 0a0h,0a0h,002h	; b8b6
	defb 0a8h,078h,001h	; b8b9
	defb 0a8h,010h,002h	; b8bc
	defb 0a0h,078h,001h	; b8bf
	defb 018h,0b8h,001h	; b8c2
	defb 0a8h,0e0h,003h	; b8c5
	defb 028h,078h,005h	; b8c8
	defb 020h,090h,002h	; b8cb
	defb 0a0h,0d0h,002h	; b8ce
	defb 018h,078h,001h	; b8d1
	defb 0a0h,078h,002h	; b8d4
	defb 0a8h,078h,001h	; b8d7
	defb 030h,0b0h,002h	; b8da
	defb 028h,078h,001h	; b8dd
	defb 010h,0d8h,001h	; b8e0
	defb 018h,0c0h,001h	; b8e3
	defb 090h,078h,001h	; b8e6
	defb 018h,080h,001h	; b8e9
	defb 010h,078h,001h	; b8ec
	defb 010h,0a0h,001h	; b8ef
	defb 018h,030h,002h	; b8f2
	defb 0a8h,078h,003h	; b8f5
	defb 0a0h,078h,005h	; b8f8

; ----------------------------------------------------------------------
; DATOS salida: la salida de cada fase: 3 bytes [y][x][pantalla en los 3 bits
;   altos], en 0xB8F8 + 3 x fase; lo leen msx1 p02:8BA9, msx2 p02:8FA5 (180
;   bytes)
;   0xb8fb..0xb9af  (180 bytes)
DATA_salida:
	defb 010h,070h,024h	; b8fb
	defb 020h,070h,024h	; b8fe
	defb 040h,070h,024h	; b901
	defb 018h,070h,044h	; b904
	defb 010h,070h,044h	; b907
	defb 010h,070h,044h	; b90a
	defb 020h,070h,026h	; b90d
	defb 080h,060h,066h	; b910
	defb 028h,070h,026h	; b913
	defb 028h,0d8h,046h	; b916
	defb 010h,070h,026h	; b919
	defb 020h,060h,046h	; b91c
	defb 060h,070h,026h	; b91f
	defb 050h,070h,046h	; b922
	defb 008h,070h,046h	; b925
	defb 010h,018h,048h	; b928
	defb 048h,038h,028h	; b92b
	defb 040h,070h,048h	; b92e
	defb 010h,070h,028h	; b931
	defb 050h,070h,028h	; b934
	defb 008h,070h,028h	; b937
	defb 088h,098h,048h	; b93a
	defb 070h,060h,08ah	; b93d
	defb 048h,070h,06ah	; b940
	defb 058h,068h,02ah	; b943
	defb 050h,090h,04ah	; b946
	defb 050h,070h,06ah	; b949
	defb 090h,0b0h,068h	; b94c
	defb 048h,070h,02ah	; b94f
	defb 018h,070h,04ah	; b952
	defb 048h,088h,02ah	; b955
	defb 098h,070h,02ah	; b958
	defb 018h,0b8h,04ah	; b95b
	defb 048h,070h,08ah	; b95e
	defb 040h,070h,02ch	; b961
	defb 010h,070h,02ch	; b964
	defb 070h,070h,02ch	; b967
	defb 010h,080h,02ch	; b96a
	defb 008h,070h,02ch	; b96d
	defb 038h,0b0h,06ch	; b970
	defb 050h,070h,02eh	; b973
	defb 018h,0d0h,04eh	; b976
	defb 090h,070h,02ch	; b979
	defb 050h,070h,04ch	; b97c
	defb 038h,070h,02dh	; b97f
	defb 040h,070h,02ch	; b982
	defb 048h,070h,02eh	; b985
	defb 070h,068h,02eh	; b988
	defb 008h,070h,02eh	; b98b
	defb 098h,058h,02eh	; b98e
	defb 018h,070h,02eh	; b991
	defb 070h,030h,02eh	; b994
	defb 050h,050h,04eh	; b997
	defb 058h,058h,02eh	; b99a
	defb 038h,050h,030h	; b99d
	defb 000h,070h,030h	; b9a0
	defb 078h,048h,050h	; b9a3
	defb 038h,088h,050h	; b9a6
	defb 060h,070h,030h	; b9a9
	defb 090h,070h,050h	; b9ac

; ----------------------------------------------------------------------
; DATOS marcas_salida: 16 punteros (desde 0xB9AD, por cuantas cosas hay que
;   coger, de 1 a 16): donde van las marcas de lo que falta en la salida; lo
;   leen msx1 p02:8C57, msx2 p02:9053 (32 bytes)
;   0xb9af..0xb9cf  (32 bytes)
DATA_marcas_salida:
	defw 0b9cfh,0b9d0h,0b9d2h,0b9d5h,0b9d9h,0b9deh,0b9e4h,0b9ebh	; b9af
	defw 0b9f3h,0b9fch,0ba06h,0ba11h,0ba1dh,0ba2ah,0ba38h,0ba47h	; b9bf

; ----------------------------------------------------------------------
; DATOS marcas_1: 1 marcas: un byte cada una (2 bits de x y 2 de y dentro de
;   la salida); lo leen msx1 p02:8C5F, msx2 p02:905B (1 bytes)
;   0xb9cf..0xb9d0  (1 bytes)
DATA_marcas_1:
	defb 005h	; b9cf

; ----------------------------------------------------------------------
; DATOS marcas_2: 2 marcas: un byte cada una (2 bits de x y 2 de y dentro de
;   la salida); lo leen msx1 p02:8C5F, msx2 p02:905B (2 bytes)
;   0xb9d0..0xb9d2  (2 bytes)
DATA_marcas_2:
	defb 00ah,005h	; b9d0

; ----------------------------------------------------------------------
; DATOS marcas_3: 3 marcas: un byte cada una (2 bits de x y 2 de y dentro de
;   la salida); lo leen msx1 p02:8C5F, msx2 p02:905B (3 bytes)
;   0xb9d2..0xb9d5  (3 bytes)
DATA_marcas_3:
	defb 006h,00ah,005h	; b9d2

; ----------------------------------------------------------------------
; DATOS marcas_4: 4 marcas: un byte cada una (2 bits de x y 2 de y dentro de
;   la salida); lo leen msx1 p02:8C5F, msx2 p02:905B (4 bytes)
;   0xb9d5..0xb9d9  (4 bytes)
DATA_marcas_4:
	defb 00ah,005h,00fh,000h	; b9d5

; ----------------------------------------------------------------------
; DATOS marcas_5: 5 marcas: un byte cada una (2 bits de x y 2 de y dentro de
;   la salida); lo leen msx1 p02:8C5F, msx2 p02:905B (5 bytes)
;   0xb9d9..0xb9de  (5 bytes)
DATA_marcas_5:
	defb 003h,00ah,005h,00fh,000h	; b9d9

; ----------------------------------------------------------------------
; DATOS marcas_6: 6 marcas: un byte cada una (2 bits de x y 2 de y dentro de
;   la salida); lo leen msx1 p02:8C5F, msx2 p02:905B (6 bytes)
;   0xb9de..0xb9e4  (6 bytes)
DATA_marcas_6:
	defb 009h,006h,00ah,005h,00ch,003h	; b9de

; ----------------------------------------------------------------------
; DATOS marcas_7: 7 marcas: un byte cada una (2 bits de x y 2 de y dentro de
;   la salida); lo leen msx1 p02:8C5F, msx2 p02:905B (7 bytes)
;   0xb9e4..0xb9eb  (7 bytes)
DATA_marcas_7:
	defb 000h,009h,006h,00ah,005h,00ch,003h	; b9e4

; ----------------------------------------------------------------------
; DATOS marcas_8: 8 marcas: un byte cada una (2 bits de x y 2 de y dentro de
;   la salida); lo leen msx1 p02:8C5F, msx2 p02:905B (8 bytes)
;   0xb9eb..0xb9f3  (8 bytes)
DATA_marcas_8:
	defb 00ah,005h,009h,006h,00ch,003h,00fh,000h	; b9eb  ........

; ----------------------------------------------------------------------
; DATOS marcas_9: 9 marcas: un byte cada una (2 bits de x y 2 de y dentro de
;   la salida); lo leen msx1 p02:8C5F, msx2 p02:905B (9 bytes)
;   0xb9f3..0xb9fc  (9 bytes)
DATA_marcas_9:
	defb 001h,00ah,005h,009h,006h,00ch,003h,00fh,000h	; b9f3  .........

; ----------------------------------------------------------------------
; DATOS marcas_10: 10 marcas: un byte cada una (2 bits de x y 2 de y dentro de
;   la salida); lo leen msx1 p02:8C5F, msx2 p02:905B (10 bytes)
;   0xb9fc..0xba06  (10 bytes)
DATA_marcas_10:
	defb 00ah,005h,000h,00fh,004h,00bh,008h,007h,00ch,003h	; b9fc  ..........

; ----------------------------------------------------------------------
; DATOS marcas_11: 11 marcas: un byte cada una (2 bits de x y 2 de y dentro de
;   la salida); lo leen msx1 p02:8C5F, msx2 p02:905B (11 bytes)
;   0xba06..0xba11  (11 bytes)
DATA_marcas_11:
	defb 001h,00ah,005h,000h,00fh,004h,00bh,008h,007h,00ch,003h	; ba06  ...........

; ----------------------------------------------------------------------
; DATOS marcas_12: 12 marcas: un byte cada una (2 bits de x y 2 de y dentro de
;   la salida); lo leen msx1 p02:8C5F, msx2 p02:905B (12 bytes)
;   0xba11..0xba1d  (12 bytes)
DATA_marcas_12:
	defb 004h,00bh,002h,00dh,007h,008h,00eh,001h,00ch,003h,00fh,000h	; ba11  ............

; ----------------------------------------------------------------------
; DATOS marcas_13: 13 marcas: un byte cada una (2 bits de x y 2 de y dentro de
;   la salida); lo leen msx1 p02:8C5F, msx2 p02:905B (13 bytes)
;   0xba1d..0xba2a  (13 bytes)
DATA_marcas_13:
	defb 005h,004h,00bh,002h,00dh,007h,008h,00eh,001h,00ch,003h,00fh,000h	; ba1d  .............

; ----------------------------------------------------------------------
; DATOS marcas_14: 14 marcas: un byte cada una (2 bits de x y 2 de y dentro de
;   la salida); lo leen msx1 p02:8C5F, msx2 p02:905B (14 bytes)
;   0xba2a..0xba38  (14 bytes)
DATA_marcas_14:
	defb 009h,006h,003h,00ch,00fh,000h,004h,008h,00dh,00eh,00bh,007h,002h,001h	; ba2a  ..............

; ----------------------------------------------------------------------
; DATOS marcas_15: 15 marcas: un byte cada una (2 bits de x y 2 de y dentro de
;   la salida); lo leen msx1 p02:8C5F, msx2 p02:905B (15 bytes)
;   0xba38..0xba47  (15 bytes)
DATA_marcas_15:
	defb 005h,009h,006h,003h,00ch,00fh,000h,004h,008h,00dh,00eh,00bh,007h,002h,001h	; ba38  ...............

; ----------------------------------------------------------------------
; DATOS marcas_16: 16 marcas: un byte cada una (2 bits de x y 2 de y dentro de
;   la salida); lo leen msx1 p02:8C5F, msx2 p02:905B (16 bytes)
;   0xba47..0xba57  (16 bytes)
DATA_marcas_16:
	defb 00ch,009h,006h,003h,00fh,00ah,005h,000h,00eh,00dh,002h,001h,00bh,008h,007h,004h	; ba47  ................

; ----------------------------------------------------------------------
; DATOS pasos_piramide: 5 punteros, uno por piramide acabada (de la 1 a la 5):
;   los pasos del personaje por el dibujo; lo leen msx1 p01:6F88, msx2
;   p01:718C (10 bytes)
;   0xba57..0xba61  (10 bytes)
DATA_pasos_piramide:
	defw 0ba61h,0ba84h,0bacdh,0baf4h,0bb0fh	; ba57

; ----------------------------------------------------------------------
; DATOS pasos_1: los pasos de la piramide 1: parejas [paso][direccion], 0xFF
;   acaba; lo leen msx1 p01:6F91, msx2 p01:7195 (35 bytes)
;   0xba61..0xba84  (35 bytes)
DATA_pasos_1:
	defb 000h,002h	; ba61
	defb 003h,001h	; ba63
	defb 006h,002h	; ba65
	defb 00bh,000h	; ba67
	defb 019h,002h	; ba69
	defb 01fh,001h	; ba6b
	defb 027h,002h	; ba6d
	defb 02ch,001h	; ba6f
	defb 02fh,003h	; ba71
	defb 034h,001h	; ba73
	defb 039h,003h	; ba75
	defb 03ch,001h	; ba77
	defb 03fh,002h	; ba79
	defb 047h,001h	; ba7b
	defb 04ch,003h	; ba7d
	defb 04fh,001h	; ba7f
	defb 052h,002h	; ba81
	defb 0ffh	; ba83

; ----------------------------------------------------------------------
; DATOS pasos_2: los pasos de la piramide 2: parejas [paso][direccion], 0xFF
;   acaba; lo leen msx1 p01:6F91, msx2 p01:7195 (73 bytes)
;   0xba84..0xbacd  (73 bytes)
DATA_pasos_2:
	defb 000h,002h	; ba84
	defb 003h,001h	; ba86
	defb 006h,002h	; ba88
	defb 00bh,001h	; ba8a
	defb 010h,003h	; ba8c
	defb 015h,001h	; ba8e
	defb 018h,003h	; ba90
	defb 01dh,000h	; ba92
	defb 020h,003h	; ba94
	defb 02eh,001h	; ba96
	defb 036h,002h	; ba98
	defb 03ch,000h	; ba9a
	defb 03fh,002h	; ba9c
	defb 044h,001h	; ba9e
	defb 04ch,002h	; baa0
	defb 054h,000h	; baa2
	defb 059h,002h	; baa4
	defb 05eh,001h	; baa6
	defb 061h,002h	; baa8
	defb 067h,001h	; baaa
	defb 06ch,003h	; baac
	defb 06fh,001h	; baae
	defb 072h,003h	; bab0
	defb 077h,000h	; bab2
	defb 07ah,003h	; bab4
	defb 07dh,001h	; bab6
	defb 082h,003h	; bab8
	defb 087h,000h	; baba
	defb 08ch,003h	; babc
	defb 094h,000h	; babe
	defb 097h,003h	; bac0
	defb 09ah,001h	; bac2
	defb 0a0h,002h	; bac4
	defb 0a5h,001h	; bac6
	defb 0aah,002h	; bac8
	defb 0b5h,001h	; baca
	defb 0ffh	; bacc

; ----------------------------------------------------------------------
; DATOS pasos_3: los pasos de la piramide 3: parejas [paso][direccion], 0xFF
;   acaba; lo leen msx1 p01:6F91, msx2 p01:7195 (39 bytes)
;   0xbacd..0xbaf4  (39 bytes)
DATA_pasos_3:
	defb 000h,003h	; bacd
	defb 003h,001h	; bacf
	defb 00bh,002h	; bad1
	defb 01dh,001h	; bad3
	defb 021h,003h	; bad5
	defb 039h,000h	; bad7
	defb 03fh,003h	; bad9
	defb 042h,001h	; badb
	defb 045h,003h	; badd
	defb 04ah,000h	; badf
	defb 052h,002h	; bae1
	defb 057h,000h	; bae3
	defb 05fh,003h	; bae5
	defb 064h,000h	; bae7
	defb 067h,003h	; bae9
	defb 06ah,001h	; baeb
	defb 075h,003h	; baed
	defb 07dh,001h	; baef
	defb 085h,003h	; baf1
	defb 0ffh	; baf3

; ----------------------------------------------------------------------
; DATOS pasos_4: los pasos de la piramide 4: parejas [paso][direccion], 0xFF
;   acaba; lo leen msx1 p01:6F91, msx2 p01:7195 (27 bytes)
;   0xbaf4..0xbb0f  (27 bytes)
DATA_pasos_4:
	defb 000h,000h	; baf4
	defb 008h,003h	; baf6
	defb 010h,001h	; baf8
	defb 020h,003h	; bafa
	defb 030h,000h	; bafc
	defb 03eh,002h	; bafe
	defb 046h,000h	; bb00
	defb 04bh,003h	; bb02
	defb 056h,000h	; bb04
	defb 073h,002h	; bb06
	defb 079h,001h	; bb08
	defb 07eh,002h	; bb0a
	defb 083h,001h	; bb0c
	defb 0ffh	; bb0e

; ----------------------------------------------------------------------
; DATOS pasos_5: los pasos de la piramide 5: parejas [paso][direccion], 0xFF
;   acaba; lo leen msx1 p01:6F91, msx2 p01:7195 (41 bytes)
;   0xbb0f..0xbb38  (41 bytes)
DATA_pasos_5:
	defb 000h,002h	; bb0f
	defb 008h,001h	; bb11
	defb 00bh,002h	; bb13
	defb 011h,000h	; bb15
	defb 01fh,003h	; bb17
	defb 022h,000h	; bb19
	defb 027h,003h	; bb1b
	defb 02fh,000h	; bb1d
	defb 037h,002h	; bb1f
	defb 03fh,000h	; bb21
	defb 044h,003h	; bb23
	defb 057h,000h	; bb25
	defb 05dh,002h	; bb27
	defb 068h,001h	; bb29
	defb 06bh,002h	; bb2b
	defb 07bh,001h	; bb2d
	defb 083h,002h	; bb2f
	defb 086h,001h	; bb31
	defb 08bh,002h	; bb33
	defb 08dh,001h	; bb35
	defb 0ffh	; bb37

; ----------------------------------------------------------------------
; DATOS fondos_editor: 2 punteros: los fondos del editor; lo leen msx1
;   p02:847F, msx2 p02:8875 (4 bytes)
;   0xbb38..0xbb3c  (4 bytes)
DATA_fondos_editor:
	defw 0bb3ch,0bb9ch	; bb38  -> DATA_fondo_editor_0 DATA_fondo_editor_1

; ----------------------------------------------------------------------
; DATOS fondo_editor_0: un fondo del editor: 96 bytes, un bit por caracter (32
;   x 24); lo leen msx1 p02:8493, msx2 p02:8889 (96 bytes)
;   0xbb3c..0xbb9c  (96 bytes)
DATA_fondo_editor_0:
	defb 0ffh,0ffh,0ffh,0ffh	; bb3c
	defb 0ffh,0ffh,0ffh,0ffh	; bb40
	defb 0ffh,0ffh,0ffh,0ffh	; bb44
	defb 0ffh,0ffh,0ffh,0ffh	; bb48
	defb 0ffh,0ffh,0ffh,0ffh	; bb4c
	defb 0ffh,0ffh,0ffh,0ffh	; bb50
	defb 0ffh,0ffh,0ffh,0ffh	; bb54
	defb 0feh,000h,000h,0ffh	; bb58
	defb 0feh,000h,000h,0ffh	; bb5c
	defb 0feh,000h,000h,0ffh	; bb60
	defb 0feh,000h,000h,0ffh	; bb64
	defb 0feh,000h,000h,0ffh	; bb68
	defb 0feh,000h,000h,0ffh	; bb6c
	defb 0feh,000h,000h,0ffh	; bb70
	defb 0feh,000h,000h,0ffh	; bb74
	defb 0feh,000h,000h,0ffh	; bb78
	defb 0feh,000h,000h,0ffh	; bb7c
	defb 0ffh,0ffh,0ffh,0ffh	; bb80
	defb 0ffh,0ffh,0ffh,0ffh	; bb84
	defb 0ffh,0ffh,0ffh,0ffh	; bb88
	defb 0ffh,0ffh,0ffh,0ffh	; bb8c
	defb 0ffh,0ffh,0ffh,0ffh	; bb90
	defb 0ffh,0ffh,0ffh,0ffh	; bb94
	defb 0ffh,0ffh,0ffh,0ffh	; bb98

; ----------------------------------------------------------------------
; DATOS fondo_editor_1: un fondo del editor: 96 bytes, un bit por caracter (32
;   x 24); lo leen msx1 p02:8493, msx2 p02:8889 (96 bytes)
;   0xbb9c..0xbbfc  (96 bytes)
DATA_fondo_editor_1:
	defb 0c0h,000h,000h,003h	; bb9c
	defb 0c0h,000h,000h,003h	; bba0
	defb 0c0h,000h,000h,003h	; bba4
	defb 0c0h,000h,000h,003h	; bba8
	defb 0c0h,000h,000h,003h	; bbac
	defb 0c0h,000h,000h,003h	; bbb0
	defb 0c0h,000h,000h,003h	; bbb4
	defb 0c0h,000h,000h,003h	; bbb8
	defb 0c0h,000h,000h,003h	; bbbc
	defb 0c0h,000h,000h,003h	; bbc0
	defb 0c0h,000h,000h,003h	; bbc4
	defb 0c0h,000h,000h,003h	; bbc8
	defb 0c0h,000h,000h,003h	; bbcc
	defb 0c0h,000h,000h,003h	; bbd0
	defb 0c0h,000h,000h,003h	; bbd4
	defb 0c0h,000h,000h,003h	; bbd8
	defb 0c0h,000h,000h,003h	; bbdc
	defb 0c0h,000h,000h,003h	; bbe0
	defb 0c0h,000h,000h,003h	; bbe4
	defb 0c0h,000h,000h,003h	; bbe8
	defb 0c0h,000h,000h,003h	; bbec
	defb 0c0h,000h,000h,003h	; bbf0
	defb 0c0h,000h,000h,003h	; bbf4
	defb 0c0h,000h,000h,003h	; bbf8

; ----------------------------------------------------------------------
; DATOS rachas_BBFC: rachas a la VRAM (sprites del editor): [n < 0x80] repite
;   el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0 acaba; lo
;   leen msx1 p01:7AAF, msx2 p01:7AAF (72 bytes)
;   0xbbfc..0xbc44  (72 bytes)
DATA_rachas_BBFC:
	defb 081h,008h,004h,01ch,003h,01fh,003h,03fh,002h,01fh,002h,00fh,081h,007h,005h,000h	; bbfc  .......?........
	defb 082h,080h,0e0h,005h,0f0h,002h,0e0h,002h,0c0h,002h,000h,003h,0ffh,00bh,000h,087h	; bc0c  ................
	defb 080h,0c0h,0e0h,0f0h,0e0h,0c0h,080h,009h,000h,081h,0ffh,006h,081h,081h,0ffh,018h	; bc1c  ................
	defb 000h,087h,07eh,07ch,07ch,07eh,07fh,04fh,006h,019h,000h,081h,0ffh,007h,080h,081h	; bc2c  ..~||~.O........
	defb 0ffh,007h,000h,009h,080h,007h,000h,000h	; bc3c  ........

; ----------------------------------------------------------------------
; DATOS fuente_BC44: 2 caracteres de 1 bit por punto (el menu del editor); lo
;   leen msx1 p00:5155, msx2 p00:5155 (16 bytes)
;   0xbc44..0xbc54  (16 bytes)
DATA_fuente_BC44:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bc44  ........
	defb 0ffh,081h,081h,081h,081h,081h,081h,0ffh	; bc4c  ........

; ----------------------------------------------------------------------
; DATOS letrero_BC54: letrero (de los menus): [x][y] y caracteres, 0xFE [x][y]
;   otro sitio, 0xFF acaba; lo leen msx1 p00:4F11, msx2 p00:51D6 (103 bytes)
;   0xbc54..0xbcbb  (103 bytes)
DATA_letrero_BC54:
	defb 028h,010h,0e6h,0ech,0efh,0efh,0f2h,0d1h,0feh,028h,020h,0e6h,0ech,0efh,0efh,0f2h	; bc54  (........( .....
	defb 0d2h,0feh,028h,030h,0ech,0e1h,0e4h,0e4h,0e5h,0f2h,0feh,028h,040h,0f0h,0ech,0e1h	; bc64  ..(0.......(@...
	defb 0f9h,0e5h,0f2h,0feh,028h,050h,0e5h,0eeh,0e5h,0edh,0f9h,0feh,028h,060h,0f4h,0f2h	; bc74  ....(P......(`..
	defb 0e1h,0f0h,0feh,028h,070h,0f4h,0efh,0efh,0ech,000h,0f7h,0e5h,0e1h,0f0h,0efh,0eeh	; bc84  ...(p...........
	defb 0feh,028h,080h,0f3h,0efh,0f5h,0ech,000h,0f3h,0f4h,0efh,0eeh,0e5h,0feh,028h,090h	; bc94  .(............(.
	defb 0e5h,0f8h,0e9h,0f4h,000h,0e4h,0efh,0efh,0f2h,0feh,028h,0a0h,0f3h,0e1h,0f6h,0e5h	; bca4  ..........(.....
	defb 0feh,028h,0b0h,0e5h,0eeh,0e4h,0ffh	; bcb4

; ----------------------------------------------------------------------
; DATOS submenus: 3 punteros: los submenus de las opciones 4, 5 y 6 del
;   editor; lo leen msx1 p01:7847, msx2 p01:7C19 (6 bytes)
;   0xbcbb..0xbcc1  (6 bytes)
DATA_submenus:
	defw 0bcc1h,0bcebh,0bd38h	; bcbb  -> DATA_submenu_4 DATA_submenu_5 DATA_submenu_6

; ----------------------------------------------------------------------
; DATOS submenu_4: cuantas opciones tiene el submenu; lo leen msx1 p01:784A,
;   msx2 p01:7C1C (1 bytes)
;   0xbcc1..0xbcc2  (1 bytes)
DATA_submenu_4:
	defb 003h	; bcc1

; ----------------------------------------------------------------------
; DATOS letrero_BCC2: letrero (del submenu): [x][y] y caracteres, 0xFE [x][y]
;   otro sitio, 0xFF acaba; lo leen msx1 p00:4F11, msx2 p00:51D6 (41 bytes)
;   0xbcc2..0xbceb  (41 bytes)
DATA_letrero_BCC2:
	defb 0a0h,010h,0f3h,0ech,0efh,0f5h,0edh,0e1h,0eeh,0feh,0a0h,020h,0e6h,0ech,0efh,0f5h	; bcc2  ........... ....
	defb 0edh,0e1h,0eeh,0feh,0a0h,030h,0f0h,0f9h,0efh,0eeh,0e3h,0f9h,0feh,0a0h,040h,0f2h	; bcd2  .....0........@.
	defb 0efh,0e3h,0ebh,000h,0f2h,0efh,0ech,0ech,0ffh	; bce2  .........

; ----------------------------------------------------------------------
; DATOS submenu_5: cuantas opciones tiene el submenu; lo leen msx1 p01:784A,
;   msx2 p01:7C1C (1 bytes)
;   0xbceb..0xbcec  (1 bytes)
DATA_submenu_5:
	defb 007h	; bceb

; ----------------------------------------------------------------------
; DATOS letrero_BCEC: letrero (del submenu): [x][y] y caracteres, 0xFE [x][y]
;   otro sitio, 0xFF acaba; lo leen msx1 p00:4F11, msx2 p00:51D6 (76 bytes)
;   0xbcec..0xbd38  (76 bytes)
DATA_letrero_BCEC:
	defb 0a0h,010h,0e4h,0efh,0efh,0f2h,0d1h,000h,0ech,0f2h,0feh,0a0h,020h,0e4h,0efh,0efh	; bcec  ............ ...
	defb 0f2h,0d1h,000h,0f2h,0ech,0feh,0a0h,030h,0e4h,0efh,0efh,0f2h,0d2h,000h,0ech,0f2h	; bcfc  .......0........
	defb 0feh,0a0h,040h,0e4h,0efh,0efh,0f2h,0d2h,000h,0f2h,0ech,0feh,0a0h,050h,0f7h,0e1h	; bd0c  ..@..........P..
	defb 0ech,0ech,0feh,0a0h,060h,0e6h,0ech,0efh,0efh,0f2h,0feh,0a0h,070h,0f3h,0f4h,0efh	; bd1c  ....`.......p...
	defb 0eeh,0e5h,0feh,0a0h,080h,0ech,0e1h,0e4h,0e4h,0e5h,0f2h,0ffh	; bd2c  ............

; ----------------------------------------------------------------------
; DATOS submenu_6: cuantas opciones tiene el submenu; lo leen msx1 p01:784A,
;   msx2 p01:7C1C (1 bytes)
;   0xbd38..0xbd39  (1 bytes)
DATA_submenu_6:
	defb 005h	; bd38

; ----------------------------------------------------------------------
; DATOS letrero_BD39: letrero (del submenu): [x][y] y caracteres, 0xFE [x][y]
;   otro sitio, 0xFF acaba; lo leen msx1 p00:4F11, msx2 p00:51D6 (52 bytes)
;   0xbd39..0xbd6d  (52 bytes)
DATA_letrero_BD39:
	defb 0a0h,010h,0ebh,0eeh,0e9h,0e6h,0e5h,0feh,0a0h,020h,0e2h,0efh,0efh,0edh,0e5h,0f2h	; bd39  ......... ......
	defb 0e1h,0eeh,0e7h,0feh,0a0h,030h,0f3h,0e3h,0efh,0efh,0f0h,0feh,0a0h,040h,0f0h,0e9h	; bd49  .....0.......@..
	defb 0e3h,0ebh,0feh,0a0h,050h,0e8h,0e1h,0edh,0edh,0e5h,0f2h,0feh,0a0h,060h,0e4h,0f2h	; bd59  ....P........`..
	defb 0e9h,0ech,0ech,0ffh	; bd69

; ----------------------------------------------------------------------
; DATOS letrero_BD6D: letrero (de los menus): [x][y] y caracteres, 0xFE [x][y]
;   otro sitio, 0xFF acaba; lo leen msx1 p00:4F11, msx2 p00:51D6 (25 bytes)
;   0xbd6d..0xbd86  (25 bytes)
DATA_letrero_BD6D:
	defb 050h,048h,0ech,0efh,0e1h,0e4h,000h,0e4h,0e1h,0f4h,0e1h,000h,0fdh,0feh,080h,058h	; bd6d  PH.............X
	defb 0f9h,0e5h,0f3h,0feh,080h,068h,0eeh,0efh,0ffh	; bd7d  .....h...

; ----------------------------------------------------------------------
; DATOS letrero_BD86: letrero (de los menus): [x][y] y caracteres, 0xFE [x][y]
;   otro sitio, 0xFF acaba; lo leen msx1 p00:4F11, msx2 p00:51D6 (51 bytes)
;   0xbd86..0xbdb9  (51 bytes)
DATA_letrero_BD86:
	defb 048h,010h,0fch,000h,0e6h,0e9h,0ech,0e5h,000h,0eeh,0e1h,0edh,0e5h,000h,0fch,0feh	; bd86  H...............
	defb 048h,0a8h,0eeh,0e5h,0f8h,0f4h,000h,0fch,0fch,000h,000h,0edh,000h,0ebh,0e5h,0f9h	; bd96  H...............
	defb 0feh,048h,0b8h,0ech,0efh,0e1h,0e4h,000h,0fch,0fch,000h,0f2h,0e5h,0f4h,000h,0ebh	; bda6  .H..............
	defb 0e5h,0f9h,0ffh	; bdb6

; ----------------------------------------------------------------------
; DATOS letrero_BDB9: letrero (de los menus): [x][y] y caracteres, 0xFE [x][y]
;   otro sitio, 0xFF acaba; lo leen msx1 p00:4F11, msx2 p00:51D6 (28 bytes)
;   0xbdb9..0xbdd5  (28 bytes)
DATA_letrero_BDB9:
	defb 048h,040h,0fch,000h,0ech,0efh,0e1h,0e4h,000h,0edh,0efh,0e4h,0e5h,000h,0fch,0feh	; bdb9  H@..............
	defb 060h,050h,0f4h,0e1h,0f0h,0e5h,000h,0ech,0efh,0e1h,0e4h,0ffh	; bdc9  `P..........

; ----------------------------------------------------------------------
; DATOS letrero_BDD5: letrero de los menus sin sitio (lo pone quien llama):
;   caracteres, 0xFF acaba; lo leen msx1 p00:4F1E, msx2 p00:51DA (10 bytes)
;   0xbdd5..0xbddf  (10 bytes)
DATA_letrero_BDD5:
	defb 0e4h,0e9h,0f3h,0ebh,000h,0ech,0efh,0e1h,0e4h,0ffh	; bdd5  ..........

; ----------------------------------------------------------------------
; DATOS letrero_BDDF: letrero de los menus sin sitio (lo pone quien llama):
;   caracteres, 0xFF acaba; lo leen msx1 p00:4F1E, msx2 p00:51DA (10 bytes)
;   0xbddf..0xbde9  (10 bytes)
DATA_letrero_BDDF:
	defb 0f3h,0f2h,0e1h,0edh,000h,0ech,0efh,0e1h,0e4h,0ffh	; bddf  ..........

; ----------------------------------------------------------------------
; DATOS letrero_BDE9: letrero (de los menus): [x][y] y caracteres, 0xFE [x][y]
;   otro sitio, 0xFF acaba; lo leen msx1 p00:4F11, msx2 p00:51D6 (29 bytes)
;   0xbde9..0xbe06  (29 bytes)
DATA_letrero_BDE9:
	defb 040h,040h,0e9h,0eeh,0f0h,0f5h,0f4h,000h,0e6h,0e9h,0ech,0e5h,000h,0eeh,0e1h,0edh	; bde9  @@..............
	defb 0e5h,0feh,060h,060h,0fbh,0fbh,0fbh,0fbh,0fbh,0fbh,0fbh,0fbh,0ffh	; bdf9  ..``.........

; ----------------------------------------------------------------------
; DATOS letrero_BE06: letrero (de los menus): [x][y] y caracteres, 0xFE [x][y]
;   otro sitio, 0xFF acaba; lo leen msx1 p00:4F11, msx2 p00:51D6 (14 bytes)
;   0xbe06..0xbe14  (14 bytes)
DATA_letrero_BE06:
	defb 058h,048h,0eeh,0efh,0f7h,000h,0ech,0efh,0e1h,0e4h,0e9h,0eeh,0e7h,0ffh	; be06  XH............

; ----------------------------------------------------------------------
; DATOS letrero_BE14: letrero (de los menus): [x][y] y caracteres, 0xFE [x][y]
;   otro sitio, 0xFF acaba; se solapan 3 bloques: (letrero_BE26 BE26-BE30)
;   (letrero_BE26 BE26-BE30); lo leen msx1 p00:4F11, msx2 p00:51D6, msx1
;   p00:4F1E, msx2 p00:51DA (28 bytes)
;   0xbe14..0xbe30  (28 bytes)
DATA_letrero_BE14:
	defb 048h,040h,0fch,000h,0f3h,0e1h,0f6h,0e5h,000h,0edh,0efh,0e4h,0e5h,000h,0fch,0feh	; be14  H@..............
	defb 060h,050h,0f4h,0e1h,0f0h,0e5h,000h,0f3h,0e1h,0f6h,0e5h,0ffh	; be24  `P..........

; ----------------------------------------------------------------------
; DATOS letrero_BE30: letrero de los menus sin sitio (lo pone quien llama):
;   caracteres, 0xFF acaba; lo leen msx1 p00:4F1E, msx2 p00:51DA (10 bytes)
;   0xbe30..0xbe3a  (10 bytes)
DATA_letrero_BE30:
	defb 0e4h,0e9h,0f3h,0ebh,000h,0f3h,0e1h,0f6h,0e5h,0ffh	; be30  ..........

; ----------------------------------------------------------------------
; DATOS letrero_BE3A: letrero de los menus sin sitio (lo pone quien llama):
;   caracteres, 0xFF acaba; lo leen msx1 p00:4F1E, msx2 p00:51DA (10 bytes)
;   0xbe3a..0xbe44  (10 bytes)
DATA_letrero_BE3A:
	defb 0f3h,0f2h,0e1h,0edh,000h,0f3h,0e1h,0f6h,0e5h,0ffh	; be3a  ..........

; ----------------------------------------------------------------------
; DATOS letrero_BE44: letrero (de los menus): [x][y] y caracteres, 0xFE [x][y]
;   otro sitio, 0xFF acaba; se solapan 3 bloques: (letrero_BE46 BE46-BE4C)
;   (letrero_BE46 BE46-BE4C); lo leen msx1 p00:4F11, msx2 p00:51D6, msx1
;   p00:4F1E, msx2 p00:51DA (8 bytes)
;   0xbe44..0xbe4c  (8 bytes)
DATA_letrero_BE44:
	defb 070h,050h,0e6h,0e9h,0ech,0e5h,0d1h,0ffh	; be44  pP......

; ----------------------------------------------------------------------
; DATOS letrero_BE4C: letrero (de los menus): [x][y] y caracteres, 0xFE [x][y]
;   otro sitio, 0xFF acaba; se solapan 3 bloques: (letrero_BE4E BE4E-BE54)
;   (letrero_BE4E BE4E-BE54); lo leen msx1 p00:4F11, msx2 p00:51D6, msx1
;   p00:4F1E, msx2 p00:51DA (8 bytes)
;   0xbe4c..0xbe54  (8 bytes)
DATA_letrero_BE4C:
	defb 070h,060h,0e6h,0e9h,0ech,0e5h,0d2h,0ffh	; be4c  p`......

; ----------------------------------------------------------------------
; DATOS letrero_BE54: letrero (de los menus): [x][y] y caracteres, 0xFE [x][y]
;   otro sitio, 0xFF acaba; se solapan 3 bloques: (letrero_BE56 BE56-BE5C)
;   (letrero_BE56 BE56-BE5C); lo leen msx1 p00:4F11, msx2 p00:51D6, msx1
;   p00:4F1E, msx2 p00:51DA (8 bytes)
;   0xbe54..0xbe5c  (8 bytes)
DATA_letrero_BE54:
	defb 070h,070h,0e6h,0e9h,0ech,0e5h,0d3h,0ffh	; be54  pp......

; ----------------------------------------------------------------------
; DATOS letrero_BE5C: letrero (de los menus): [x][y] y caracteres, 0xFE [x][y]
;   otro sitio, 0xFF acaba; lo leen msx1 p00:4F11, msx2 p00:51D6 (14 bytes)
;   0xbe5c..0xbe6a  (14 bytes)
DATA_letrero_BE5C:
	defb 050h,040h,0e6h,0e9h,0ech,0e5h,000h,0f3h,0e5h,0ech,0e5h,0e3h,0f4h,0ffh	; be5c  P@............

; ----------------------------------------------------------------------
; DATOS letrero_BE6A: letrero (de los menus): [x][y] y caracteres, 0xFE [x][y]
;   otro sitio, 0xFF acaba; lo leen msx1 p00:4F11, msx2 p00:51D6 (13 bytes)
;   0xbe6a..0xbe77  (13 bytes)
DATA_letrero_BE6A:
	defb 060h,080h,0f3h,0e1h,0f6h,0e5h,000h,0e5h,0f2h,0f2h,0efh,0f2h,0ffh	; be6a  `............

; ----------------------------------------------------------------------
; DATOS letrero_BE77: letrero (de los menus): [x][y] y caracteres, 0xFE [x][y]
;   otro sitio, 0xFF acaba; se solapan 3 bloques: (letrero_BE82 BE82-BE91)
;   (letrero_BE82 BE82-BE91); lo leen msx1 p00:4F11, msx2 p00:51D6 (26 bytes)
;   0xbe77..0xbe91  (26 bytes)
DATA_letrero_BE77:
	defb 060h,050h,0e5h,0e4h,0e9h,0f4h,000h,0e5h,0eeh,0e4h,0feh,050h,060h,0efh,0ebh,000h	; be77  `P.........P`...
	defb 0fdh,000h,000h,0f9h,000h,0efh,0f2h,000h,0eeh,0ffh	; be87  ..........

; ----------------------------------------------------------------------
; DATOS letrero_BE91: letrero (de los menus): [x][y] y caracteres, 0xFE [x][y]
;   otro sitio, 0xFF acaba; lo leen msx1 p00:4F11, msx2 p00:51D6 (28 bytes)
;   0xbe91..0xbead  (28 bytes)
DATA_letrero_BE91:
	defb 040h,060h,0e9h,0eeh,0f0h,0f5h,0f4h,000h,0f0h,0e1h,0f3h,0f3h,0f7h,0efh,0f2h,0e4h	; be91  @`..............
	defb 0feh,060h,078h,0fbh,0fbh,0fbh,0fbh,0fbh,0fbh,0fbh,0fbh,0ffh	; bea1  .`x.........

; ----------------------------------------------------------------------
; DATOS letrero_BEAD: letrero (de los menus): [x][y] y caracteres, 0xFE [x][y]
;   otro sitio, 0xFF acaba; lo leen msx1 p00:4F11, msx2 p00:51D6 (17 bytes)
;   0xbead..0xbebe  (17 bytes)
DATA_letrero_BEAD:
	defb 040h,088h,0f7h,0f2h,0efh,0eeh,0e7h,000h,0f0h,0e1h,0f3h,0f3h,0f7h,0efh,0f2h,0e4h	; bead  @...............
	defb 0ffh	; bebd

; ----------------------------------------------------------------------
; DATOS letrero_BEBE: letrero (de los menus): [x][y] y caracteres, 0xFE [x][y]
;   otro sitio, 0xFF acaba; lo leen msx1 p00:4F11, msx2 p00:51D6 (17 bytes)
;   0xbebe..0xbecf  (17 bytes)
DATA_letrero_BEBE:
	defb 040h,088h,0f2h,0e9h,0e7h,0e8h,0f4h,000h,0f0h,0e1h,0f3h,0f3h,0f7h,0efh,0f2h,0e4h	; bebe  @...............
	defb 0ffh	; bece

; ----------------------------------------------------------------------
; DATOS dibujos_enemigos1: 30 dibujos de sprite de los enemigos en MSX1, uno
;   por paso (IX+11); lo leen msx1 p01:64E1, msx2 p01:66D7 (30 bytes)
;   0xbecf..0xbeed  (30 bytes)
DATA_dibujos_enemigos1:
	defb 058h,048h,04ch,050h,054h,05ch,060h,064h,070h,068h	; becf  XHLPT\`dph
	defb 06ch,074h,078h,07ch,080h,090h,094h,098h,09ch,0a0h	; bed9  ltx|......
	defb 0a4h,0b4h,0b8h,0bch,084h,088h,08ch,0a8h,0ach,0b0h	; bee3  ..........

; ----------------------------------------------------------------------
; DATOS dibujos_enemigos2: 30 parejas de dibujos de sprite de los enemigos en
;   MSX2 (dos sprites por enemigo); lo leen msx1 p01:649C, msx2 p01:6692 (60
;   bytes)
;   0xbeed..0xbf29  (60 bytes)
DATA_dibujos_enemigos2:
	defb 068h,06ch,048h,04ch,050h,054h,058h,05ch,060h,064h	; beed  hlHLPTX\`d
	defb 070h,074h,078h,07ch,080h,084h,098h,09ch,088h,08ch	; bef7  ptx|......
	defb 090h,094h,0a0h,0a4h,0a8h,0ach,0b0h,0b4h,0b8h,0bch	; bf01  ..........
	defb 0c0h,0c4h,0c8h,0cch,0d0h,0d4h,0d8h,0dch,0d0h,0d4h	; bf0b  ..........
	defb 0d8h,0dch,0f0h,0f4h,0f8h,0fch,000h,000h,0e0h,0e4h	; bf15  ..........
	defb 0e8h,0ech,000h,000h,000h,000h,000h,000h,000h,000h	; bf1f  ..........

; ----------------------------------------------------------------------
; DATOS rachas_BF29: rachas a la VRAM (sprites del plano): [n < 0x80] repite
;   el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0 acaba; lo
;   leen msx1 p00:5EBA, msx2 p01:6099 (13 bytes)
;   0xbf29..0xbf36  (13 bytes)
DATA_rachas_BF29:
	defb 004h,003h,00ch,000h,004h,0c0h,00ch,000h,003h,00eh,01dh,000h,000h	; bf29  .............

; ----------------------------------------------------------------------
; DATOS fuente_BF36: 18 caracteres de 1 bit por punto (los letreros del
;   plano); lo leen msx1 p00:5155, msx2 p00:5155 (144 bytes)
;   0xbf36..0xbfc6  (144 bytes)
DATA_fuente_BF36:
	defb 0ffh,080h,080h,080h,080h,080h,080h,080h	; bf36  ........
	defb 0ffh,000h,000h,000h,000h,000h,000h,000h	; bf3e  ........
	defb 0ffh,001h,001h,001h,001h,001h,001h,001h	; bf46  ........
	defb 080h,080h,080h,080h,080h,080h,080h,080h	; bf4e  ........
	defb 000h,000h,000h,000h,000h,000h,000h,000h	; bf56  ........
	defb 001h,001h,001h,001h,001h,001h,001h,001h	; bf5e  ........
	defb 080h,080h,080h,080h,080h,080h,080h,0ffh	; bf66  ........
	defb 000h,000h,000h,000h,000h,000h,000h,0ffh	; bf6e  ........
	defb 001h,001h,001h,001h,001h,001h,001h,0ffh	; bf76  ........
	defb 0ffh,080h,080h,098h,098h,080h,080h,080h	; bf7e  ........
	defb 0ffh,000h,000h,018h,018h,000h,000h,000h	; bf86  ........
	defb 0ffh,001h,001h,019h,019h,001h,001h,001h	; bf8e  ........
	defb 080h,080h,080h,098h,098h,080h,080h,080h	; bf96  ........
	defb 000h,000h,000h,018h,018h,000h,000h,000h	; bf9e  ........
	defb 001h,001h,001h,019h,019h,001h,001h,001h	; bfa6  ........
	defb 080h,080h,080h,098h,098h,080h,080h,0ffh	; bfae  ........
	defb 000h,000h,000h,018h,018h,000h,000h,0ffh	; bfb6  ........
	defb 001h,001h,001h,019h,019h,001h,001h,0ffh	; bfbe  ........

; ----------------------------------------------------------------------
; DATOS fuente_BFC6: 6 caracteres de 1 bit por punto; lo leen msx1 p00:5155,
;   msx2 p00:5155 (48 bytes)
;   0xbfc6..0xbff6  (48 bytes)
DATA_fuente_BFC6:
	defb 001h,003h,007h,00fh,003h,003h,003h,000h	; bfc6  ........
	defb 080h,0c0h,0e0h,0f0h,0c0h,0c0h,0c0h,000h	; bfce  ........
	defb 000h,003h,003h,003h,00fh,007h,003h,001h	; bfd6  ........
	defb 000h,0c0h,0c0h,0c0h,0f0h,0e0h,0c0h,080h	; bfde  ........
	defb 010h,030h,07eh,0feh,0feh,07eh,030h,010h	; bfe6  .0~..~0.
	defb 008h,00ch,07eh,07fh,07fh,07eh,00ch,008h	; bfee  ..~..~..

; ----------------------------------------------------------------------
; DATOS relleno_BFF6: 10 bytes a 0xFF al final del banco 13: relleno; lo leen
;   nadie (10 bytes)
;   0xbff6..0xc000  (10 bytes)
DATA_relleno_BFF6:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bff6  ..........
