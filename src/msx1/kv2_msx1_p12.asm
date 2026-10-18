; ==========================================================================
; KING'S VALLEY II - Konami (1988) - MSX - MegaROM RC-760 de 128 KB (Konami SCC) - banco 12 (se ejecuta en 0xa000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x0a000


; ----------------------------------------------------------------------
; Direcciones que solo aparecen como VALOR -en un `ld`, no en
; un salto-: son punteros que el codigo se pasa o numeros que
; casualmente coinciden con una direccion. No hay nada que
; trazar en ellas; el equ existe para que el listado ensamble.
; ----------------------------------------------------------------------
lba78h:	equ 0x0ba78

; ----------------------------------------------------------------------
; DATOS mapa_59_cola: El mapa de la fase en rachas de casillas de 2 bits de la
;   fase 59 (sigue del banco 11); lo leen p00:43E5 (289 bytes)
;   0xa000..0xa121  (289 bytes)
DATA_mapa_59_cola:
	defb 008h,083h,0c2h,083h,008h,0c8h,008h,088h,008h,0c8h,008h,088h,008h,0c8h,008h,081h	; a000  ................
	defb 006h,081h,008h,0c8h,008h,081h,006h,081h,008h,0c8h,089h,006h,087h,0cah,089h,006h	; a010  ................
	defb 087h,0cah,089h,006h,087h,0cah,008h,081h,006h,081h,008h,0c8h,008h,081h,006h,081h	; a020  ................
	defb 008h,0c8h,008h,088h,008h,0c8h,008h,088h,008h,0c8h,008h,088h,008h,0c8h,018h,0c8h	; a030  ................
	defb 018h,0c8h,018h,0c8h,018h,0ech,002h,0dah,006h,08ch,006h,0c8h,008h,088h,008h,0c8h	; a040  ................
	defb 008h,088h,008h,0c8h,00ah,084h,00ah,0c8h,004h,082h,004h,084h,004h,082h,004h,0c8h	; a050  ................
	defb 004h,082h,00ch,082h,004h,0c8h,004h,082h,00ch,082h,004h,0c8h,004h,082h,00ch,082h	; a060  ................
	defb 004h,0c8h,004h,082h,00ch,082h,004h,0c8h,004h,082h,00ch,082h,004h,0c8h,004h,082h	; a070  ................
	defb 004h,084h,004h,082h,004h,0c8h,00ah,084h,00ah,0c8h,00ah,084h,00ah,0c8h,00ah,084h	; a080  ................
	defb 00ah,0c8h,00ah,084h,00ah,0c8h,00ah,084h,00ah,0c8h,00ah,084h,00ah,0c8h,00ah,084h	; a090  ................
	defb 00ah,0c8h,002h,0dbh,01fh,0c1h,01fh,0c1h,01fh,0e4h,018h,0c8h,018h,0c8h,018h,0c8h	; a0a0  ................
	defb 00ah,0c6h,008h,0c8h,008h,0c8h,008h,0c8h,008h,0c2h,008h,084h,002h,0c8h,006h,0c2h	; a0b0  ................
	defb 00ah,084h,002h,0c8h,006h,0c2h,008h,082h,002h,082h,002h,0c8h,004h,0c2h,00ah,082h	; a0c0  ................
	defb 002h,082h,002h,0c8h,004h,0c2h,006h,084h,004h,082h,002h,0c8h,004h,082h,006h,084h	; a0d0  ................
	defb 004h,082h,002h,0c8h,004h,082h,004h,082h,006h,0c2h,004h,0c8h,004h,082h,004h,082h	; a0e0  ................
	defb 006h,0c2h,004h,0c8h,004h,082h,002h,082h,006h,0c2h,006h,0c8h,004h,082h,002h,082h	; a0f0  ................
	defb 006h,0c2h,006h,0c8h,004h,084h,006h,084h,006h,0c8h,004h,084h,006h,084h,006h,0c8h	; a100  ................
	defb 006h,088h,004h,0ceh,006h,088h,004h,0dch,004h,0cah,01dh,0c3h,01dh,0c3h,01dh,0e3h	; a110  ................
	defb 000h	; a120

; ----------------------------------------------------------------------
; DATOS mapa_60: El mapa de la fase en rachas de casillas de 2 bits de la fase
;   60; lo leen p00:43E5 (578 bytes)
;   0xa121..0xa363  (578 bytes)
DATA_mapa_60:
	defb 0c1h,01fh,0c1h,01fh,0c1h,01fh,0c4h,09bh,0c5h,09bh,0c5h,01ch,0c4h,01ch,0c4h,01ch	; a121  ................
	defb 0c4h,002h,08ah,004h,084h,0c2h,085h,0c5h,002h,08ah,004h,084h,0c2h,085h,0c5h,014h	; a131  ................
	defb 0c2h,006h,0c4h,014h,0c2h,006h,0c4h,014h,0c2h,006h,0c4h,014h,0c2h,006h,0c4h,014h	; a141  ................
	defb 0c2h,006h,0c4h,002h,0c2h,086h,00ah,0c2h,006h,0c4h,002h,0c2h,086h,00ah,0c2h,006h	; a151  ................
	defb 0c4h,002h,0c2h,018h,0c4h,002h,0c2h,018h,0c4h,002h,0c2h,018h,0c4h,002h,0c2h,00ch	; a161  ................
	defb 08ah,002h,0c4h,002h,0c2h,00ch,08ah,002h,0ffh,0c1h,03fh,021h,0c1h,09eh,0c2h,09eh	; a171  ..........?!....
	defb 0c1h,03fh,021h,0c1h,083h,0c2h,006h,0c2h,008h,082h,008h,0c1h,083h,0c2h,006h,0c2h	; a181  .?!.............
	defb 008h,082h,00ch,0c2h,006h,0c2h,006h,082h,002h,082h,00ah,0c2h,006h,0c2h,006h,082h	; a191  ................
	defb 002h,082h,00ah,0c2h,082h,004h,0c2h,004h,0c2h,006h,0c2h,008h,0c2h,082h,004h,0c2h	; a1a1  ................
	defb 004h,0c2h,006h,0c2h,008h,0c2h,082h,004h,0c2h,004h,0c2h,082h,002h,082h,0c2h,008h	; a1b1  ................
	defb 0c2h,082h,004h,0c2h,004h,0c2h,082h,002h,082h,0c2h,008h,0c2h,002h,082h,002h,0c2h	; a1c1  ................
	defb 004h,0c2h,006h,0c2h,008h,0c2h,002h,082h,002h,0c2h,004h,0c2h,006h,0c2h,008h,0c2h	; a1d1  ................
	defb 002h,082h,002h,0c2h,004h,0c2h,006h,0c2h,008h,0c2h,002h,082h,002h,0c2h,016h,0c2h	; a1e1  ................
	defb 004h,082h,0c2h,016h,0c2h,004h,082h,0c2h,012h,0c8h,002h,0deh,002h,0d6h,01fh,0c1h	; a1f1  ................
	defb 01fh,0c1h,01fh,0c2h,09bh,0c5h,09bh,0c4h,01ch,0c4h,01ch,0c4h,01ch,0c4h,012h,0c2h	; a201  ................
	defb 086h,002h,0c4h,012h,0c2h,086h,002h,0c4h,012h,0c2h,008h,0c4h,012h,0c2h,008h,0c4h	; a211  ................
	defb 012h,0c2h,008h,0c4h,012h,0c2h,008h,0c4h,012h,0c2h,086h,002h,0c4h,012h,0c2h,086h	; a221  ................
	defb 002h,0c4h,012h,0c2h,008h,0c4h,012h,0c2h,008h,0c4h,012h,0c2h,008h,0c4h,012h,0c2h	; a231  ................
	defb 008h,0c4h,004h,0c2h,088h,004h,0c2h,086h,003h,0c3h,004h,0c2h,088h,004h,0c2h,086h	; a241  ................
	defb 003h,0ffh,0e7h,011h,084h,0c2h,084h,002h,0c3h,011h,084h,0c2h,084h,002h,0c6h,012h	; a251  ................
	defb 0c2h,006h,0c6h,012h,0c2h,006h,0c6h,002h,086h,0c2h,008h,0c2h,006h,0c6h,002h,086h	; a261  ................
	defb 0c2h,008h,0c2h,006h,0c6h,012h,0c2h,006h,0c6h,01ah,0c6h,01ah,0c6h,01ah,0c6h,002h	; a271  ................
	defb 086h,0c2h,004h,08ah,002h,0c6h,002h,086h,0c2h,004h,08ah,002h,0c6h,01ah,0c6h,01ah	; a281  ................
	defb 0c6h,01ah,0c6h,01ah,0c6h,098h,0c8h,098h,0c3h,01fh,0c1h,01fh,0c1h,01fh,0ffh,0c9h	; a291  ................
	defb 002h,0d6h,004h,0c2h,006h,0c2h,004h,0c2h,006h,0c6h,004h,0c2h,006h,0c2h,004h,0c2h	; a2a1  ................
	defb 006h,0c6h,004h,0c2h,006h,0c2h,004h,0c2h,006h,0c6h,004h,0c2h,006h,0c2h,004h,0c2h	; a2b1  ................
	defb 082h,0c2h,082h,0c6h,004h,0c2h,006h,0c2h,004h,0c2h,082h,0c2h,082h,0c6h,004h,0c2h	; a2c1  ................
	defb 006h,0c2h,004h,0c2h,006h,0c6h,004h,0c2h,006h,0c2h,004h,0c2h,006h,0c6h,004h,0c2h	; a2d1  ................
	defb 006h,0c2h,004h,0c2h,006h,0c6h,004h,0c2h,006h,0c2h,006h,082h,002h,082h,004h,0c2h	; a2e1  ................
	defb 004h,0c2h,006h,0c2h,006h,082h,002h,082h,004h,0c2h,004h,0c2h,006h,0c2h,008h,082h	; a2f1  ................
	defb 006h,0c2h,004h,0c2h,006h,0c2h,008h,082h,006h,0c2h,01eh,0c2h,01eh,0c2h,01eh,0c2h	; a301  ................
	defb 01eh,0c3h,09dh,0c3h,09dh,0c2h,03fh,021h,0ffh,0e5h,088h,006h,086h,005h,0c7h,088h	; a311  ......?!........
	defb 006h,086h,005h,0c7h,088h,010h,0c8h,088h,010h,0c6h,01ah,0c6h,010h,086h,0c2h,002h	; a321  ................
	defb 0c6h,010h,086h,0c2h,002h,0c6h,016h,0c2h,002h,0c6h,016h,0c2h,002h,0c6h,016h,0c2h	; a331  ................
	defb 002h,0c6h,010h,086h,0c2h,002h,0c6h,010h,086h,0c2h,002h,0c6h,01ah,0c6h,01ah,0c6h	; a341  ................
	defb 01ah,0c6h,01ah,0c8h,096h,002h,0c8h,096h,002h,0c4h,01dh,0c3h,01dh,0c3h,01dh,0ffh	; a351  ................
	defb 0c4h,000h	; a361

; ----------------------------------------------------------------------
; DATOS casillas_01: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 1; lo leen p00:443C (7 bytes)
;   0xa363..0xa36a  (7 bytes)
DATA_casillas_01:
	defb 026h,003h,0a6h,041h,022h,05bh,000h	; a363

; ----------------------------------------------------------------------
; DATOS casillas_02: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 2; lo leen p00:443C (1 bytes)
;   0xa36a..0xa36b  (1 bytes)
DATA_casillas_02:
	defb 000h	; a36a

; ----------------------------------------------------------------------
; DATOS casillas_03: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 3; lo leen p00:443C (12 bytes)
;   0xa36b..0xa377  (12 bytes)
DATA_casillas_03:
	defb 050h,018h,090h,01bh,0ffh,04ah,01ah,005h,02dh,0c6h,042h,000h	; a36b  P....J..-.B.

; ----------------------------------------------------------------------
; DATOS casillas_04: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 4; lo leen p00:443C (30 bytes)
;   0xa377..0xa395  (30 bytes)
DATA_casillas_04:
	defb 007h,001h,0c7h,002h,048h,01ch,088h,01fh,007h,03dh,0c7h,03eh,082h,05bh,0ffh,087h	; a377  ....H....=.>.[..
	defb 003h,088h,01ch,048h,01fh,047h,03ch,087h,03fh,002h,059h,0c2h,05ah,000h	; a387  ...H.G<.?.Y.Z.

; ----------------------------------------------------------------------
; DATOS casillas_05: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 5; lo leen p00:443C (8 bytes)
;   0xa395..0xa39d  (8 bytes)
DATA_casillas_05:
	defb 034h,00ch,0ffh,08bh,01ah,0b4h,00fh,000h	; a395  4.......

; ----------------------------------------------------------------------
; DATOS casillas_06: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 6; lo leen p00:443C (6 bytes)
;   0xa39d..0xa3a3  (6 bytes)
DATA_casillas_06:
	defb 095h,013h,0ffh,096h,003h,000h	; a39d

; ----------------------------------------------------------------------
; DATOS casillas_07: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 7; lo leen p00:443C (20 bytes)
;   0xa3a3..0xa3b7  (20 bytes)
DATA_casillas_07:
	defb 0c5h,022h,005h,037h,0c5h,04ah,001h,05fh,0ffh,003h,003h,0c5h,00eh,005h,023h,0c5h	; a3a3  .".7.J._......#.
	defb 036h,005h,04bh,000h	; a3b3

; ----------------------------------------------------------------------
; DATOS casillas_08: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 8; lo leen p00:443C (35 bytes)
;   0xa3b7..0xa3da  (35 bytes)
DATA_casillas_08:
	defb 005h,04dh,0e5h,04dh,0e5h,04eh,0a1h,05fh,0ffh,0c5h,011h,045h,025h,0c5h,038h,0ffh	; a3b7  .M.M.N._...E%.8.
	defb 004h,001h,0eah,001h,0e4h,002h,0b7h,003h,0a4h,012h,0ech,022h,06ah,028h,023h,053h	; a3c7  ..........."j(#S
	defb 023h,050h,000h	; a3d7

; ----------------------------------------------------------------------
; DATOS casillas_09: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 9; lo leen p00:443C (3 bytes)
;   0xa3da..0xa3dd  (3 bytes)
DATA_casillas_09:
	defb 092h,017h,000h	; a3da

; ----------------------------------------------------------------------
; DATOS casillas_10: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 10; lo leen p00:443C (1 bytes)
;   0xa3dd..0xa3de  (1 bytes)
DATA_casillas_10:
	defb 000h	; a3dd

; ----------------------------------------------------------------------
; DATOS columnas_01: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fases 1, 2, 3, 4, 5, 6, 7, 8; lo leen p00:443C (1 bytes)
;   0xa3de..0xa3df  (1 bytes)
DATA_columnas_01:
	defb 000h	; a3de

; ----------------------------------------------------------------------
; DATOS columnas_09: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 9; lo leen p00:443C (3 bytes)
;   0xa3df..0xa3e2  (3 bytes)
DATA_columnas_09:
	defb 086h,03eh,000h	; a3df

; ----------------------------------------------------------------------
; DATOS columnas_10: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 10; lo leen p00:443C (4 bytes)
;   0xa3e2..0xa3e6  (4 bytes)
DATA_columnas_10:
	defb 0ffh,06eh,014h,000h	; a3e2

; ----------------------------------------------------------------------
; DATOS casillas_11: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 11; lo leen p00:443C (13 bytes)
;   0xa3e6..0xa3f3  (13 bytes)
DATA_casillas_11:
	defb 0a6h,018h,028h,021h,024h,023h,0a4h,032h,0a9h,039h,026h,042h,000h	; a3e6  ..(!$#.2.9&B.

; ----------------------------------------------------------------------
; DATOS casillas_12: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 12; lo leen p00:443C (1 bytes)
;   0xa3f3..0xa3f4  (1 bytes)
DATA_casillas_12:
	defb 000h	; a3f3

; ----------------------------------------------------------------------
; DATOS casillas_13: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 13; lo leen p00:443C (25 bytes)
;   0xa3f4..0xa40d  (25 bytes)
DATA_casillas_13:
	defb 0d2h,01ah,082h,058h,082h,05bh,0ffh,08eh,000h,0c6h,002h,098h,003h,084h,050h,004h	; a3f4  ...X.[........P.
	defb 052h,0ffh,090h,000h,007h,002h,094h,003h,000h	; a404  R........

; ----------------------------------------------------------------------
; DATOS casillas_14: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 14; lo leen p00:443C (51 bytes)
;   0xa40d..0xa440  (51 bytes)
DATA_casillas_14:
	defb 044h,019h,0c4h,019h,044h,01bh,0c6h,028h,046h,02ah,046h,040h,046h,041h,0c8h,042h	; a40d  D...D..(F*F@FA.B
	defb 082h,058h,0c2h,059h,0ffh,08fh,018h,04fh,01bh,047h,039h,087h,03ah,0ffh,086h,000h	; a41d  .X.Y...O.G9.:...
	defb 0c6h,001h,0c6h,002h,046h,019h,04ch,01ah,048h,01bh,046h,030h,0c4h,039h,0c6h,042h	; a42d  ....F.L.H.F0.9.B
	defb 0c4h,048h,000h	; a43d

; ----------------------------------------------------------------------
; DATOS casillas_15: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 15; lo leen p00:443C (25 bytes)
;   0xa440..0xa459  (25 bytes)
DATA_casillas_15:
	defb 0a9h,015h,0a9h,017h,0a9h,038h,0a9h,03ah,0ffh,0a9h,021h,0a9h,023h,0a9h,02ch,0a9h	; a440  .....8.:..!.#.,.
	defb 02eh,0ffh,026h,014h,0b2h,017h,029h,038h,000h	; a450  ..&...)8.

; ----------------------------------------------------------------------
; DATOS casillas_16: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 16; lo leen p00:443C (12 bytes)
;   0xa459..0xa465  (12 bytes)
DATA_casillas_16:
	defb 0a1h,05fh,0ffh,0a4h,003h,046h,029h,086h,039h,044h,042h,000h	; a459  ._...F).9DB.

; ----------------------------------------------------------------------
; DATOS casillas_17: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 17; lo leen p00:443C (5 bytes)
;   0xa465..0xa46a  (5 bytes)
DATA_casillas_17:
	defb 0ffh,0ffh,0b2h,017h,000h	; a465

; ----------------------------------------------------------------------
; DATOS casillas_18: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 18; lo leen p00:443C (33 bytes)
;   0xa46a..0xa48b  (33 bytes)
DATA_casillas_18:
	defb 005h,00fh,069h,01eh,007h,033h,084h,04eh,0ffh,0a4h,020h,006h,029h,0c6h,02ah,0a3h	; a46a  ..i..3.N.. .).*.
	defb 040h,0ffh,045h,00ch,064h,011h,024h,021h,0a8h,023h,0c7h,031h,047h,043h,004h,04dh	; a47a  @.E.d.$!.#.1GC.M
	defb 000h	; a48a

; ----------------------------------------------------------------------
; DATOS casillas_19: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 19; lo leen p00:443C (7 bytes)
;   0xa48b..0xa492  (7 bytes)
DATA_casillas_19:
	defb 066h,002h,085h,02ah,062h,05ah,000h	; a48b

; ----------------------------------------------------------------------
; DATOS casillas_20: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 20; lo leen p00:443C (30 bytes)
;   0xa492..0xa4b0  (30 bytes)
DATA_casillas_20:
	defb 0a4h,013h,064h,023h,0a4h,033h,064h,043h,0a4h,053h,0c4h,052h,0ffh,0c4h,002h,0a4h	; a492  ..d#.3dC.S.R....
	defb 003h,064h,013h,0a4h,023h,066h,027h,0a6h,037h,064h,04fh,024h,03fh,000h	; a4a2  .d..#f'.7dO$?.

; ----------------------------------------------------------------------
; DATOS columnas_12: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 12; se solapan 2 bloques: (columnas_11 A4B2-A4B3); lo
;   leen p00:443C (3 bytes)
;   0xa4b0..0xa4b3  (3 bytes)
DATA_columnas_12:
	defb 086h,019h,000h	; a4b0

; ----------------------------------------------------------------------
; DATOS columnas_16: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 16; lo leen p00:443C (9 bytes)
;   0xa4b3..0xa4bc  (9 bytes)
DATA_columnas_16:
	defb 084h,015h,004h,026h,084h,036h,004h,047h,000h	; a4b3  ...&.6.G.

; ----------------------------------------------------------------------
; DATOS columnas_17: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 17; lo leen p00:443C (25 bytes)
;   0xa4bc..0xa4d5  (25 bytes)
DATA_columnas_17:
	defb 0e5h,04ah,0ffh,02bh,01ch,045h,049h,0a5h,04ah,0ffh,066h,014h,0edh,014h,044h,027h	; a4bc  .J.+.EI.J.f...D'
	defb 005h,037h,045h,048h,005h,04ah,0c5h,04ah,000h	; a4cc  .7EH.J.J.

; ----------------------------------------------------------------------
; DATOS columnas_18: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 18; se solapan 2 bloques: (columnas_19 A4D7-A4D8); lo
;   leen p00:443C (3 bytes)
;   0xa4d5..0xa4d8  (3 bytes)
DATA_columnas_18:
	defb 028h,03dh,000h	; a4d5

; ----------------------------------------------------------------------
; DATOS casillas_21: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 21; lo leen p00:443C (15 bytes)
;   0xa4d8..0xa4e7  (15 bytes)
DATA_casillas_21:
	defb 032h,014h,0abh,017h,024h,021h,0a4h,022h,0a3h,042h,003h,04eh,063h,016h,000h	; a4d8  2...$!.".B.Nc..

; ----------------------------------------------------------------------
; DATOS casillas_22: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 22; lo leen p00:443C (31 bytes)
;   0xa4e7..0xa506  (31 bytes)
DATA_casillas_22:
	defb 046h,010h,042h,027h,047h,029h,002h,037h,0c6h,03eh,0ffh,043h,010h,086h,044h,006h	; a4e7  F.B'G).7.>.C..D.
	defb 045h,0ffh,089h,010h,046h,013h,0c5h,021h,045h,035h,047h,043h,005h,04ah,000h	; a4f7  E...F..!E5GC.J.

; ----------------------------------------------------------------------
; DATOS casillas_23: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 23; lo leen p00:443C (64 bytes)
;   0xa506..0xa546  (64 bytes)
DATA_casillas_23:
	defb 037h,004h,0c4h,010h,0ceh,021h,04eh,023h,0c6h,030h,046h,032h,042h,05ah,0ffh,0c8h	; a506  7....!N#.0F2BZ..
	defb 011h,0b7h,007h,0c4h,028h,046h,029h,044h,032h,044h,038h,0c4h,051h,042h,058h,0ffh	; a516  ....(F)D2D8.QBX.
	defb 037h,000h,04eh,002h,0d0h,011h,04ch,01bh,0c6h,020h,0c5h,048h,085h,04bh,0ffh,0b7h	; a526  7.N...L.. .H.K..
	defb 003h,048h,000h,0c6h,001h,044h,011h,044h,012h,004h,021h,08dh,028h,087h,042h,000h	; a536  .H...D.D..!.(.B.

; ----------------------------------------------------------------------
; DATOS casillas_24: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 24; lo leen p00:443C (46 bytes)
;   0xa546..0xa574  (46 bytes)
DATA_casillas_24:
	defb 048h,013h,044h,021h,0c4h,031h,084h,042h,0c4h,050h,0ffh,0c4h,000h,0c8h,022h,044h	; a546  H.D!.1.B.P...."D
	defb 031h,0c4h,040h,044h,043h,084h,051h,0c4h,052h,0ffh,0c7h,020h,08eh,023h,004h,02fh	; a556  1.@DC.Q.R.. .#./
	defb 0ffh,083h,001h,0c3h,002h,084h,01dh,048h,03fh,024h,02ch,084h,04eh,000h	; a566  .......H?$,.N.

; ----------------------------------------------------------------------
; DATOS casillas_25: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 25; lo leen p00:443C (35 bytes)
;   0xa574..0xa597  (35 bytes)
DATA_casillas_25:
	defb 0e2h,016h,022h,01fh,0a2h,02fh,022h,02fh,0e2h,036h,062h,037h,0a2h,03eh,022h,03fh	; a574  .."../"/.6b7.>"?
	defb 0a2h,03fh,062h,046h,0e2h,046h,062h,047h,022h,044h,062h,04ch,0a2h,04fh,022h,054h	; a584  .?bF.FbG"DbL.O"T
	defb 062h,027h,000h	; a594

; ----------------------------------------------------------------------
; DATOS casillas_26: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 26; lo leen p00:443C (21 bytes)
;   0xa597..0xa5ac  (21 bytes)
DATA_casillas_26:
	defb 051h,014h,0cbh,015h,0ffh,045h,034h,02dh,015h,0c5h,048h,0ffh,085h,014h,00eh,015h	; a597  Q....E4-..H.....
	defb 08ch,017h,006h,047h,000h	; a5a7

; ----------------------------------------------------------------------
; DATOS casillas_27: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 27; lo leen p00:443C (41 bytes)
;   0xa5ac..0xa5d5  (41 bytes)
DATA_casillas_27:
	defb 065h,01ch,083h,025h,044h,033h,0e3h,040h,0ffh,084h,010h,00ch,003h,0c5h,01dh,0abh	; a5ac  e..%D3.@........
	defb 030h,067h,031h,003h,041h,0a4h,04fh,001h,05dh,0ffh,004h,001h,084h,013h,084h,020h	; a5bc  0g1.A.O.]......
	defb 044h,021h,087h,032h,004h,04dh,001h,05fh,000h	; a5cc  D!.2.M._.

; ----------------------------------------------------------------------
; DATOS casillas_28: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 28; lo leen p00:443C (33 bytes)
;   0xa5d5..0xa5f6  (33 bytes)
DATA_casillas_28:
	defb 086h,018h,0c6h,01ah,082h,032h,042h,03ah,082h,042h,046h,048h,006h,04ah,082h,05bh	; a5d5  .....2B:.BFH.J.[
	defb 0ffh,0d0h,019h,0ffh,045h,000h,005h,002h,085h,003h,089h,014h,08ah,033h,007h,017h	; a5e5  ....E........3..
	defb 000h	; a5f5

; ----------------------------------------------------------------------
; DATOS casillas_29: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 29; lo leen p00:443C (5 bytes)
;   0xa5f6..0xa5fb  (5 bytes)
DATA_casillas_29:
	defb 023h,018h,003h,01bh,000h	; a5f6

; ----------------------------------------------------------------------
; DATOS casillas_30: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 30; lo leen p00:443C (24 bytes)
;   0xa5fb..0xa613  (24 bytes)
DATA_casillas_30:
	defb 034h,00ch,084h,00eh,084h,02ch,024h,04dh,084h,04fh,0ffh,0a4h,01fh,0a4h,02dh,004h	; a5fb  4....,$M.O....-.
	defb 02fh,0a4h,03ch,004h,03eh,0a4h,04fh,000h	; a60b  /.<.>.O.

; ----------------------------------------------------------------------
; DATOS columnas_21: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 21; lo leen p00:443C (1 bytes)
;   0xa613..0xa614  (1 bytes)
DATA_columnas_21:
	defb 000h	; a613

; ----------------------------------------------------------------------
; DATOS columnas_22: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 22; se solapan 2 bloques: (columnas_23 A617-A618); lo
;   leen p00:443C (4 bytes)
;   0xa614..0xa618  (4 bytes)
DATA_columnas_22:
	defb 0ffh,06ah,02fh,000h	; a614

; ----------------------------------------------------------------------
; DATOS columnas_24: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 24; se solapan 2 bloques: (columnas_25 A61D-A61E); lo
;   leen p00:443C (6 bytes)
;   0xa618..0xa61e  (6 bytes)
DATA_columnas_24:
	defb 0ffh,0ffh,0ffh,0c6h,044h,000h	; a618

; ----------------------------------------------------------------------
; DATOS columnas_27: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 27; lo leen p00:443C (7 bytes)
;   0xa61e..0xa625  (7 bytes)
DATA_columnas_27:
	defb 027h,040h,0ffh,0ffh,0a4h,033h,000h	; a61e

; ----------------------------------------------------------------------
; DATOS columnas_28: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 28; lo leen p00:443C (5 bytes)
;   0xa625..0xa62a  (5 bytes)
DATA_columnas_28:
	defb 0ffh,0ffh,046h,038h,000h	; a625

; ----------------------------------------------------------------------
; DATOS columnas_29: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 29; se solapan 2 bloques: (columnas_30 A62C-A62D); lo
;   leen p00:443C (3 bytes)
;   0xa62a..0xa62d  (3 bytes)
DATA_columnas_29:
	defb 0abh,01bh,000h	; a62a

; ----------------------------------------------------------------------
; DATOS casillas_31: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 31; lo leen p00:443C (31 bytes)
;   0xa62d..0xa64c  (31 bytes)
DATA_casillas_31:
	defb 024h,01ch,026h,015h,0e2h,015h,0a2h,016h,0a4h,017h,0a2h,024h,062h,02ch,0e2h,02ch	; a62d  $.&........$b,.,
	defb 022h,035h,062h,03dh,0a2h,045h,0e4h,03eh,024h,02fh,064h,01fh,0a4h,04fh,000h	; a63d  "5b=.E.>$/d..O.

; ----------------------------------------------------------------------
; DATOS casillas_32: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 32; lo leen p00:443C (33 bytes)
;   0xa64c..0xa66d  (33 bytes)
DATA_casillas_32:
	defb 003h,003h,004h,019h,0c4h,01ah,0c4h,03ah,021h,05ch,0ffh,024h,000h,02ah,038h,0cah	; a64c  .......:!\.$.*8.
	defb 010h,0d3h,011h,0c9h,012h,0b4h,013h,0ffh,026h,000h,0a6h,003h,00ch,01ah,005h,04fh	; a65c  ........&......O
	defb 000h	; a66c

; ----------------------------------------------------------------------
; DATOS casillas_33: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 33; lo leen p00:443C (27 bytes)
;   0xa66d..0xa688  (27 bytes)
DATA_casillas_33:
	defb 087h,002h,0c6h,01ch,086h,034h,08bh,036h,0ffh,085h,001h,0cch,01ch,046h,037h,004h	; a66d  .....4.6.....F7.
	defb 04eh,081h,05dh,046h,01eh,0ffh,00ch,01eh,006h,01fh,000h	; a67d  N.]F.......

; ----------------------------------------------------------------------
; DATOS casillas_34: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 34; lo leen p00:443C (68 bytes)
;   0xa688..0xa6cc  (68 bytes)
DATA_casillas_34:
	defb 037h,004h,086h,048h,0c7h,02ch,0c5h,035h,006h,026h,047h,012h,0ffh,066h,034h,0b3h	; a688  7..H.,.5.&G..f4.
	defb 013h,001h,05fh,0ffh,037h,000h,08ah,000h,0c2h,020h,042h,021h,042h,022h,0c2h,022h	; a698  .._.7.... B!B"."
	defb 002h,029h,082h,029h,082h,02ah,0c2h,030h,042h,031h,042h,032h,0c2h,032h,002h,039h	; a6a8  .).).*.0B1B2.2.9
	defb 082h,039h,082h,03ah,044h,042h,083h,052h,0ffh,048h,014h,08ah,034h,0c6h,00eh,003h	; a6b8  .9.:DB.R.H..4...
	defb 003h,082h,00ch,000h	; a6c8

; ----------------------------------------------------------------------
; DATOS casillas_35: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 35; lo leen p00:443C (8 bytes)
;   0xa6cc..0xa6d4  (8 bytes)
DATA_casillas_35:
	defb 0ffh,0c1h,05eh,0ffh,0ffh,0c5h,002h,000h	; a6cc  ..^.....

; ----------------------------------------------------------------------
; DATOS casillas_36: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 36; lo leen p00:443C (46 bytes)
;   0xa6d4..0xa702  (46 bytes)
DATA_casillas_36:
	defb 046h,003h,089h,03fh,0ffh,0c8h,028h,048h,032h,08eh,02bh,084h,050h,084h,051h,002h	; a6d4  F..?..(H2.+.P.Q.
	defb 05bh,0ffh,084h,003h,046h,028h,00dh,029h,0cbh,02ah,0c5h,049h,048h,043h,0ffh,088h	; a6e4  [...F(.).*.IHC..
	defb 000h,086h,001h,008h,003h,084h,003h,0cah,028h,0c8h,021h,0aeh,023h,000h	; a6f4  ........(.!.#.

; ----------------------------------------------------------------------
; DATOS casillas_37: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 37; lo leen p00:443C (24 bytes)
;   0xa702..0xa71a  (24 bytes)
DATA_casillas_37:
	defb 051h,014h,0ffh,047h,014h,046h,02ah,088h,02bh,0ffh,0ffh,0c5h,000h,0c8h,040h,045h	; a702  Q..G.F*.+.....@E
	defb 02eh,084h,03ah,0c4h,04ah,08dh,017h,000h	; a712  ..:.J...

; ----------------------------------------------------------------------
; DATOS casillas_38: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 38; lo leen p00:443C (26 bytes)
;   0xa71a..0xa734  (26 bytes)
DATA_casillas_38:
	defb 053h,014h,025h,01ah,00bh,02dh,086h,02fh,0ffh,0d1h,015h,086h,016h,046h,02fh,0c2h	; a71a  S.%..-./.....F/.
	defb 05ah,0ffh,056h,000h,0ffh,0ceh,002h,046h,031h,000h	; a72a  Z.V....F1.

; ----------------------------------------------------------------------
; DATOS casillas_39: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 39; lo leen p00:443C (5 bytes)
;   0xa734..0xa739  (5 bytes)
DATA_casillas_39:
	defb 022h,04ch,0a2h,04fh,000h	; a734

; ----------------------------------------------------------------------
; DATOS casillas_40: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 40; lo leen p00:443C (64 bytes)
;   0xa739..0xa779  (64 bytes)
DATA_casillas_40:
	defb 041h,05ch,082h,042h,002h,03bh,082h,043h,0ffh,042h,040h,0c2h,038h,042h,041h,081h	; a739  A\.B...C.B@.8BA.
	defb 05fh,0ffh,045h,000h,082h,014h,002h,01dh,082h,025h,002h,02eh,082h,036h,002h,03fh	; a749  _.E......%...6.?
	defb 0ffh,082h,014h,082h,015h,082h,016h,002h,01dh,002h,01eh,0c2h,01eh,082h,024h,082h	; a759  ..............$.
	defb 025h,042h,026h,002h,02dh,0c2h,02dh,082h,034h,042h,035h,0c2h,03ch,083h,003h,000h	; a769  %B&.-.-.4B5.<...

; ----------------------------------------------------------------------
; DATOS columnas_31: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 31; lo leen p00:443C (1 bytes)
;   0xa779..0xa77a  (1 bytes)
DATA_columnas_31:
	defb 000h	; a779

; ----------------------------------------------------------------------
; DATOS columnas_32: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 32; lo leen p00:443C (1 bytes)
;   0xa77a..0xa77b  (1 bytes)
DATA_columnas_32:
	defb 000h	; a77a

; ----------------------------------------------------------------------
; DATOS columnas_33: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 33; lo leen p00:443C (1 bytes)
;   0xa77b..0xa77c  (1 bytes)
DATA_columnas_33:
	defb 000h	; a77b

; ----------------------------------------------------------------------
; DATOS columnas_34: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 34; lo leen p00:443C (1 bytes)
;   0xa77c..0xa77d  (1 bytes)
DATA_columnas_34:
	defb 000h	; a77c

; ----------------------------------------------------------------------
; DATOS columnas_35: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 35; lo leen p00:443C (24 bytes)
;   0xa77d..0xa795  (24 bytes)
DATA_columnas_35:
	defb 02bh,030h,0abh,033h,0ffh,04bh,033h,0b1h,01bh,0ffh,0ffh,066h,014h,066h,017h,0e6h	; a77d  +0.3.K3....f.f..
	defb 02ch,0e6h,02eh,086h,045h,046h,046h,000h	; a78d  ,...EFF.

; ----------------------------------------------------------------------
; DATOS columnas_36: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 36; lo leen p00:443C (1 bytes)
;   0xa795..0xa796  (1 bytes)
DATA_columnas_36:
	defb 000h	; a795

; ----------------------------------------------------------------------
; DATOS columnas_37: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 37; lo leen p00:443C (1 bytes)
;   0xa796..0xa797  (1 bytes)
DATA_columnas_37:
	defb 000h	; a796

; ----------------------------------------------------------------------
; DATOS columnas_38: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 38; lo leen p00:443C (1 bytes)
;   0xa797..0xa798  (1 bytes)
DATA_columnas_38:
	defb 000h	; a797

; ----------------------------------------------------------------------
; DATOS columnas_39: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 39; lo leen p00:443C (15 bytes)
;   0xa798..0xa7a7  (15 bytes)
DATA_columnas_39:
	defb 024h,01ch,064h,01dh,0e4h,01eh,0e6h,015h,024h,034h,024h,036h,024h,037h,000h	; a798  $.d.....$4$6$7.

; ----------------------------------------------------------------------
; DATOS columnas_40: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 40; lo leen p00:443C (1 bytes)
;   0xa7a7..0xa7a8  (1 bytes)
DATA_columnas_40:
	defb 000h	; a7a7

; ----------------------------------------------------------------------
; DATOS casillas_41: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 41; lo leen p00:443C (13 bytes)
;   0xa7a8..0xa7b5  (13 bytes)
DATA_casillas_41:
	defb 086h,028h,046h,021h,046h,02bh,002h,043h,0c2h,04ah,082h,052h,000h	; a7a8  .(F!F+.C.J.R.

; ----------------------------------------------------------------------
; DATOS casillas_42: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 42; lo leen p00:443C (10 bytes)
;   0xa7b5..0xa7bf  (10 bytes)
DATA_casillas_42:
	defb 082h,021h,0ffh,0c2h,035h,044h,01fh,004h,03fh,000h	; a7b5  .!..5D..?.

; ----------------------------------------------------------------------
; DATOS casillas_43: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 43; lo leen p00:443C (28 bytes)
;   0xa7bf..0xa7db  (28 bytes)
DATA_casillas_43:
	defb 06bh,034h,0a2h,02dh,0e4h,025h,022h,026h,0a9h,002h,0ffh,028h,001h,0ach,002h,0ffh	; a7bf  k4.-.%"&...(....
	defb 066h,000h,0a1h,05eh,0ffh,068h,018h,021h,05dh,0a1h,05eh,000h	; a7cf  f..^.h.!].^.

; ----------------------------------------------------------------------
; DATOS casillas_44: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 44; lo leen p00:443C (58 bytes)
;   0xa7db..0xa815  (58 bytes)
DATA_casillas_44:
	defb 08bh,000h,04bh,003h,085h,04ch,045h,04fh,0ffh,08bh,000h,04bh,003h,081h,05ch,041h	; a7db  ..K..LEO...K..\A
	defb 05fh,0ffh,08bh,000h,04bh,003h,085h,04ch,045h,04fh,04ah,02eh,0ffh,08bh,000h,04bh	; a7eb  _...K..LEOJ....K
	defb 003h,085h,04ch,045h,04fh,0ffh,08bh,000h,04bh,003h,085h,04ch,045h,04fh,0e8h,02dh	; a7fb  ..LEO...K..LEO.-
	defb 0ffh,08bh,000h,04bh,003h,088h,040h,048h,043h,000h	; a80b  ...K..@HC.

; ----------------------------------------------------------------------
; DATOS casillas_45: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 45; lo leen p00:443C (17 bytes)
;   0xa815..0xa826  (17 bytes)
DATA_casillas_45:
	defb 0ffh,086h,040h,004h,01ah,0ffh,044h,018h,006h,042h,082h,03ah,002h,033h,087h,017h	; a815  ..@...D..B.:.3..
	defb 000h	; a825

; ----------------------------------------------------------------------
; DATOS casillas_46: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 46; lo leen p00:443C (66 bytes)
;   0xa826..0xa868  (66 bytes)
DATA_casillas_46:
	defb 082h,018h,082h,028h,082h,038h,0c2h,020h,0c2h,030h,0c2h,040h,002h,029h,002h,039h	; a826  ...(.8. .0.@.).9
	defb 002h,049h,042h,031h,042h,041h,082h,032h,082h,042h,0c2h,02ah,0c2h,03ah,0c2h,04ah	; a836  .IB1BA.2.B.*.:.J
	defb 002h,023h,002h,033h,002h,043h,042h,01bh,042h,02bh,042h,03bh,0c2h,050h,0ffh,04ah	; a846  .#.3.CB.B+B..P.J
	defb 032h,0c8h,012h,0ffh,046h,002h,004h,051h,042h,05bh,0ffh,004h,001h,04ah,003h,042h	; a856  2...F..QB[...J.B
	defb 05ah,000h	; a866

; ----------------------------------------------------------------------
; DATOS casillas_47: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 47; lo leen p00:443C (19 bytes)
;   0xa868..0xa87b  (19 bytes)
DATA_casillas_47:
	defb 053h,014h,0a3h,045h,0e4h,035h,022h,052h,082h,05bh,0ffh,056h,000h,064h,04ah,096h	; a868  S..E.5"R.[.V.dJ.
	defb 003h,0ffh,000h	; a878

; ----------------------------------------------------------------------
; DATOS casillas_48: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 48; lo leen p00:443C (17 bytes)
;   0xa87b..0xa88c  (17 bytes)
DATA_casillas_48:
	defb 044h,014h,044h,034h,084h,024h,083h,044h,0ffh,0ffh,044h,027h,045h,047h,084h,037h	; a87b  D.D4.$.D..D'EG.7
	defb 000h	; a88b

; ----------------------------------------------------------------------
; DATOS casillas_49: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 49; lo leen p00:443C (37 bytes)
;   0xa88c..0xa8b1  (37 bytes)
DATA_casillas_49:
	defb 0e2h,014h,0e2h,016h,0a2h,01ch,022h,01fh,067h,024h,067h,027h,0a4h,034h,024h,037h	; a88c  ......".g$g'.4$7
	defb 0e6h,03ch,0e2h,03dh,0e6h,03eh,0a2h,045h,022h,046h,022h,04dh,0e2h,04dh,0a2h,04eh	; a89c  .<.=.>.E"F"M.M.N
	defb 0a2h,055h,022h,056h,000h	; a8ac

; ----------------------------------------------------------------------
; DATOS casillas_50: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 50; lo leen p00:443C (16 bytes)
;   0xa8b1..0xa8c1  (16 bytes)
DATA_casillas_50:
	defb 0e6h,02ch,024h,023h,0ffh,002h,01ah,0b0h,023h,0ffh,0ffh,010h,01ah,0a6h,003h,000h	; a8b1  .,$#....#.......

; ----------------------------------------------------------------------
; DATOS columnas_41: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 41; lo leen p00:443C (3 bytes)
;   0xa8c1..0xa8c4  (3 bytes)
DATA_columnas_41:
	defb 088h,022h,000h	; a8c1

; ----------------------------------------------------------------------
; DATOS columnas_42: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 42; lo leen p00:443C (3 bytes)
;   0xa8c4..0xa8c7  (3 bytes)
DATA_columnas_42:
	defb 086h,037h,000h	; a8c4

; ----------------------------------------------------------------------
; DATOS columnas_45: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 45; lo leen p00:443C (34 bytes)
;   0xa8c7..0xa8e9  (34 bytes)
DATA_columnas_45:
	defb 064h,028h,064h,029h,064h,02ah,064h,02bh,0a4h,038h,024h,039h,0a4h,039h,024h,03ah	; a8c7  d(d)d*d+.8$9.9$:
	defb 0a4h,03ah,024h,03bh,0e4h,048h,0e4h,049h,0e4h,04ah,0ffh,002h,039h,082h,031h,0c6h	; a8d7  .:$..H.I.J..9.1.
	defb 019h,000h	; a8e7

; ----------------------------------------------------------------------
; DATOS columnas_46: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 46; lo leen p00:443C (6 bytes)
;   0xa8e9..0xa8ef  (6 bytes)
DATA_columnas_46:
	defb 0ffh,0ffh,0ffh,008h,022h,000h	; a8e9

; ----------------------------------------------------------------------
; DATOS columnas_48: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 48; lo leen p00:443C (7 bytes)
;   0xa8ef..0xa8f6  (7 bytes)
DATA_columnas_48:
	defb 0ffh,00ah,025h,0ffh,084h,017h,000h	; a8ef

; ----------------------------------------------------------------------
; DATOS columnas_43: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fases 43, 44, 47, 49, 50; lo leen p00:443C (1 bytes)
;   0xa8f6..0xa8f7  (1 bytes)
DATA_columnas_43:
	defb 000h	; a8f6

; ----------------------------------------------------------------------
; DATOS casillas_51: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 51; lo leen p00:443C (3 bytes)
;   0xa8f7..0xa8fa  (3 bytes)
DATA_casillas_51:
	defb 0e5h,045h,000h	; a8f7

; ----------------------------------------------------------------------
; DATOS casillas_52: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 52; lo leen p00:443C (3 bytes)
;   0xa8fa..0xa8fd  (3 bytes)
DATA_casillas_52:
	defb 0c5h,048h,000h	; a8fa

; ----------------------------------------------------------------------
; DATOS casillas_53: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 53; lo leen p00:443C (17 bytes)
;   0xa8fd..0xa90e  (17 bytes)
DATA_casillas_53:
	defb 0ffh,052h,014h,042h,022h,082h,01ah,0c2h,022h,002h,01bh,042h,023h,085h,017h,0ffh	; a8fd  .R.B"..."..B#...
	defb 000h	; a90d

; ----------------------------------------------------------------------
; DATOS casillas_54: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 54; lo leen p00:443C (8 bytes)
;   0xa90e..0xa916  (8 bytes)
DATA_casillas_54:
	defb 0e4h,052h,0ffh,0e4h,002h,0e5h,015h,000h	; a90e  .R......

; ----------------------------------------------------------------------
; DATOS casillas_55: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 55; lo leen p00:443C (12 bytes)
;   0xa916..0xa922  (12 bytes)
DATA_casillas_55:
	defb 0a5h,000h,048h,017h,006h,02dh,002h,037h,0ffh,0a1h,05ch,000h	; a916  ..H..-.7..\.

; ----------------------------------------------------------------------
; DATOS casillas_57: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 57; lo leen p00:443C (8 bytes)
;   0xa922..0xa92a  (8 bytes)
DATA_casillas_57:
	defb 02fh,010h,0a4h,013h,0ffh,024h,010h,000h	; a922  /....$..

; ----------------------------------------------------------------------
; DATOS casillas_58: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 58; lo leen p00:443C (8 bytes)
;   0xa92a..0xa932  (8 bytes)
DATA_casillas_58:
	defb 0ach,024h,0ffh,02eh,017h,0e4h,04eh,000h	; a92a  .$....N.

; ----------------------------------------------------------------------
; DATOS casillas_56: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 56; lo leen p00:443C (1 bytes)
;   0xa932..0xa933  (1 bytes)
DATA_casillas_56:
	defb 000h	; a932

; ----------------------------------------------------------------------
; DATOS casillas_59: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 59; lo leen p00:443C (74 bytes)
;   0xa933..0xa97d  (74 bytes)
DATA_casillas_59:
	defb 034h,010h,0c9h,018h,046h,035h,045h,042h,0c7h,02ah,049h,013h,0b4h,013h,0ffh,034h	; a933  4...F5EB.*I....4
	defb 010h,0c5h,014h,042h,019h,0c3h,01ah,047h,013h,0b4h,013h,085h,04ch,083h,042h,003h	; a943  ...B...G....L.B.
	defb 04bh,041h,05eh,0ffh,037h,000h,0b7h,003h,0c2h,044h,004h,03dh,046h,035h,048h,026h	; a953  KA^.7....D.=F5H&
	defb 088h,01eh,0ffh,037h,000h,0b7h,003h,093h,000h,005h,00dh,043h,00dh,081h,00dh,043h	; a963  ...7.......C...C
	defb 002h,084h,026h,0c4h,01eh,0c4h,036h,006h,02fh,000h	; a973  ..&...6./.

; ----------------------------------------------------------------------
; DATOS columnas_59: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 59; lo leen p00:443C (35 bytes)
;   0xa97d..0xa9a0  (35 bytes)
DATA_columnas_59:
	defb 089h,010h,007h,029h,085h,041h,086h,036h,008h,01fh,0ffh,087h,010h,003h,019h,082h	; a97d  ...).A.6........
	defb 01ah,005h,017h,0c3h,048h,043h,041h,0c3h,046h,044h,04fh,003h,045h,0ffh,088h,02dh	; a98d  ....HCA.FDO.E..-
	defb 007h,00fh,000h	; a99d

; ----------------------------------------------------------------------
; DATOS casillas_60: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 60; lo leen p00:443C (52 bytes)
;   0xa9a0..0xa9d4  (52 bytes)
DATA_casillas_60:
	defb 035h,00ch,0c5h,028h,082h,058h,0c2h,059h,0ffh,0cah,03ah,082h,05bh,0ffh,091h,00ch	; a9a0  5..(.X.Y..:.[...
	defb 046h,022h,044h,042h,0b5h,00fh,042h,058h,082h,059h,002h,05bh,0ffh,023h,000h,096h	; a9b0  F"DB..BX.Y.[.#..
	defb 000h,0c5h,001h,0c4h,01dh,0ffh,0c4h,002h,096h,003h,0ffh,056h,000h,08ch,001h,006h	; a9c0  ...........V....
	defb 003h,0b6h,003h,000h	; a9d0

; ----------------------------------------------------------------------
; DATOS columnas_51: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 51; lo leen p00:443C (5 bytes)
;   0xa9d4..0xa9d9  (5 bytes)
DATA_columnas_51:
	defb 066h,029h,066h,02ah,000h	; a9d4

; ----------------------------------------------------------------------
; DATOS columnas_52: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 52; lo leen p00:443C (16 bytes)
;   0xa9d9..0xa9e9  (16 bytes)
DATA_columnas_52:
	defb 04ah,020h,08ch,021h,048h,023h,0ffh,044h,011h,008h,022h,047h,041h,005h,04bh,000h	; a9d9  J .!H#.D.."GA.K.

; ----------------------------------------------------------------------
; DATOS columnas_53: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 53; lo leen p00:443C (5 bytes)
;   0xa9e9..0xa9ee  (5 bytes)
DATA_columnas_53:
	defb 0ffh,0ffh,005h,025h,000h	; a9e9

; ----------------------------------------------------------------------
; DATOS columnas_54: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 54; lo leen p00:443C (3 bytes)
;   0xa9ee..0xa9f1  (3 bytes)
DATA_columnas_54:
	defb 065h,03eh,000h	; a9ee

; ----------------------------------------------------------------------
; DATOS columnas_55: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 55; lo leen p00:443C (6 bytes)
;   0xa9f1..0xa9f7  (6 bytes)
DATA_columnas_55:
	defb 024h,034h,0ffh,0aeh,027h,000h	; a9f1

; ----------------------------------------------------------------------
; DATOS columnas_56: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 56; lo leen p00:443C (15 bytes)
;   0xa9f7..0xaa06  (15 bytes)
DATA_columnas_56:
	defb 08ch,010h,04ah,013h,0e3h,029h,006h,029h,0e5h,039h,046h,040h,086h,043h,000h	; a9f7  ..J..).).9F@.C.

; ----------------------------------------------------------------------
; DATOS columnas_57: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 57; lo leen p00:443C (14 bytes)
;   0xaa06..0xaa14  (14 bytes)
DATA_columnas_57:
	defb 0c4h,010h,0e8h,01dh,0ffh,0e4h,01dh,0e8h,03dh,0abh,023h,004h,013h,000h	; aa06  ........=.#...

; ----------------------------------------------------------------------
; DATOS columnas_58: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 58; lo leen p00:443C (10 bytes)
;   0xaa14..0xaa1e  (10 bytes)
DATA_columnas_58:
	defb 0a4h,02eh,028h,02fh,0ffh,02ah,02eh,0b0h,015h,000h	; aa14  ..(/.*....

; ----------------------------------------------------------------------
; DATOS columnas_60: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 60; lo leen p00:443C (11 bytes)
;   0xaa1e..0xaa29  (11 bytes)
DATA_columnas_60:
	defb 0ffh,0ffh,0ffh,0ffh,0c3h,00ch,003h,019h,043h,025h,000h	; aa1e  ........C%.

; ----------------------------------------------------------------------
; DATOS resto_AA29: lo apuntan con el banco puesto p00:5893 (0xAA29), p00:5A40
;   (0xAA29), p00:589F (0xAA89), p00:5A4C (0xAA89), p00:58AB (0xAB79),
;   p00:5A58 (0xABA1); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p00:5893, p00:5A40, p00:589F, p00:5A4C, p00:58AB,
;   p00:5A58 (2519 bytes)
;   0xaa29..0xb400  (2519 bytes)
DATA_resto_AA29:
	defb 000h,01ch,022h,063h,063h,063h,022h,01ch,000h,018h,038h,018h,018h,018h,018h,07eh	; aa29  .."ccc"...8....~
	defb 000h,03eh,063h,003h,00eh,03ch,070h,07fh,000h,03eh,063h,003h,00eh,003h,063h,03eh	; aa39  .>c..<p..>c...c>
	defb 000h,00eh,01eh,036h,066h,066h,07fh,006h,000h,07fh,060h,07eh,063h,003h,063h,03eh	; aa49  ...6ff....`~c.c>
	defb 000h,03eh,063h,060h,07eh,063h,063h,03eh,000h,07fh,063h,006h,00ch,018h,018h,018h	; aa59  .>c`~cc>..c.....
	defb 000h,03eh,063h,063h,03eh,063h,063h,03eh,000h,03eh,063h,063h,03fh,003h,063h,03eh	; aa69  .>cc>cc>.>cc?.c>
	defb 03ch,042h,099h,0a1h,0a1h,099h,042h,03ch,000h,018h,018h,018h,018h,018h,000h,018h	; aa79  <B....B<........
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,01ch,036h,063h,063h,07fh,063h,063h	; aa89  ..........6cc.cc
	defb 000h,07eh,063h,063h,07eh,063h,063h,07eh,000h,03eh,063h,060h,060h,060h,063h,03eh	; aa99  .~cc~cc~.>c```c>
	defb 000h,07ch,066h,063h,063h,063h,066h,07ch,000h,07fh,060h,060h,07eh,060h,060h,07fh	; aaa9  .|fcccf|..``~``.
	defb 000h,07fh,060h,060h,07eh,060h,060h,060h,000h,03eh,063h,060h,067h,063h,063h,03fh	; aab9  ..``~```.>c`gcc?
	defb 000h,063h,063h,063h,07fh,063h,063h,063h,000h,03ch,018h,018h,018h,018h,018h,03ch	; aac9  .ccc.ccc.<.....<
	defb 000h,01fh,006h,006h,006h,006h,066h,03ch,000h,063h,066h,06ch,078h,07ch,06eh,067h	; aad9  ......f<.cflx|ng
	defb 000h,060h,060h,060h,060h,060h,060h,07fh,000h,063h,077h,07fh,07fh,06bh,063h,063h	; aae9  .``````..cw..kcc
	defb 000h,063h,073h,07bh,07fh,06fh,067h,063h,000h,03eh,063h,063h,063h,063h,063h,03eh	; aaf9  .cs{.ogc.>ccccc>
	defb 000h,07eh,063h,063h,063h,07eh,060h,060h,000h,03eh,063h,063h,063h,06fh,066h,03dh	; ab09  .~ccc~``.>cccof=
	defb 000h,07eh,063h,063h,062h,07ch,066h,063h,000h,03eh,063h,060h,03eh,003h,063h,03eh	; ab19  .~ccb|fc.>c`>.c>
	defb 000h,07eh,018h,018h,018h,018h,018h,018h,000h,063h,063h,063h,063h,063h,063h,03eh	; ab29  .~.......cccccc>
	defb 000h,063h,063h,063h,063h,036h,01ch,008h,000h,063h,063h,06bh,06bh,07fh,077h,022h	; ab39  .cccc6...cckk.w"
	defb 000h,063h,076h,03ch,01ch,01eh,037h,063h,000h,066h,066h,07eh,03ch,018h,018h,018h	; ab49  .cv<..7c.ff~<...
	defb 000h,07fh,007h,00eh,01ch,038h,070h,07fh,000h,07fh,000h,000h,000h,000h,000h,000h	; ab59  .....8p.........
	defb 000h,000h,000h,000h,07eh,000h,000h,000h,000h,03ch,066h,066h,00ch,018h,000h,018h	; ab69  ....~....<ff....
	defb 000h,000h,000h,000h,000h,000h,030h,030h,000h,000h,000h,018h,018h,000h,000h,000h	; ab79  ......00........
	defb 028h,028h,000h,000h,000h,000h,000h,000h,0ffh,033h,033h,033h,033h,033h,033h,0ffh	; ab89  ((.......333333.
	defb 0feh,030h,030h,030h,030h,030h,030h,0feh,002h,002h,02ah,0aah,02ah,002h,002h,002h	; ab99  .000000...*.*...
	defb 000h,000h,0feh,001h,0feh,000h,000h,000h,091h,081h,081h,081h,081h,081h,061h,011h	; aba9  ..............a.
	defb 051h,051h,051h,0f7h,0f1h,0f1h,0f1h,0f1h,000h,000h,000h,0f0h,00fh,0ffh,0ffh,0afh	; abb9  QQQ.............
	defb 0f7h,071h,071h,0afh,0f7h,071h,071h,0afh,0fah,0afh,0afh,0afh,00fh,0ffh,0ffh,0afh	; abc9  .qq..qq.........
	defb 000h,000h,000h,0f0h,000h,000h,000h,000h,000h,000h,000h,000h,0ffh,0ffh,0ffh,000h	; abd9  ................
	defb 0ddh,0ddh,0ddh,0f0h,0bbh,0bbh,0bbh,0bfh,0bbh,0bbh,0bbh,0f0h,0ffh,0ffh,0ffh,000h	; abe9  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,048h,020h,0e4h,0efh,000h,0f9h,0efh,0f5h	; abf9  ........H ......
	defb 0f2h,000h,0e2h,0e5h,0f3h,0f4h,000h,0dbh,0dbh,0ffh,01dh,0ach,02ah,0ach,04fh,0ach	; ac09  ............*.O.
	defb 07ch,0ach,09fh,0ach,020h,090h,0e4h,0ebh,0e8h,0e0h,000h,0ebh,0f1h,0f0h,0dbh,0dbh	; ac19  |... ...........
	defb 0ffh,020h,088h,0f0h,0eeh,0f5h,000h,0f0h,0ebh,000h,0f0h,0ddh,0e7h,0e1h,0feh,020h	; ac29  . .............
	defb 098h,0ddh,000h,0eah,0e1h,0f3h,000h,0efh,0f0h,0e1h,0ech,0feh,020h,0a8h,0e2h,0ebh	; ac39  ............ ...
	defb 0eeh,0f3h,0ddh,0eeh,0e0h,0ffh,018h,080h,0e4h,0e1h,0ddh,0f2h,0e1h,0eah,000h,0e7h	; ac49  ................
	defb 0eah,0ebh,0f3h,0efh,0feh,030h,090h,0f3h,0e4h,0e1h,0eah,0feh,020h,0a0h,0f0h,0e4h	; ac59  .....0...... ...
	defb 0e5h,0efh,000h,0e3h,0ddh,0e9h,0e1h,0feh,030h,0b0h,0f3h,0e5h,0e8h,0e8h,000h,0e1h	; ac69  ........0.......
	defb 0eah,0e0h,0ffh,012h,088h,0ebh,0e4h,0dbh,000h,0e9h,0f5h,000h,0e3h,0ebh,0e0h,0dbh	; ac79  ................
	defb 0feh,020h,098h,0e5h,000h,0deh,0e1h,0e8h,0e5h,0e1h,0f2h,0e1h,0feh,040h,0a8h,0e5h	; ac89  . ...........@..
	defb 0eah,000h,0e3h,0ebh,0e0h,0ffh,018h,088h,0ddh,0f0h,000h,0e8h,0ebh,0eah,0e3h,000h	; ac99  ................
	defb 0e8h,0ddh,0efh,0f0h,0feh,030h,098h,0e2h,0e5h,0eah,0ddh,0e8h,0feh,020h,0a8h,0dfh	; aca9  .....0....... ..
	defb 0ebh,0f1h,0eah,0f0h,000h,0e0h,0ebh,0f3h,0eah,0ffh,048h,048h,0dfh,0ebh,0eah,0e3h	; acb9  ..........HH....
	defb 0eeh,0ddh,0f0h,0f1h,0e8h,0ddh,0f0h,0e5h,0ebh,0eah,0efh,0feh,040h,058h,0f0h,0ebh	; acc9  ............@X..
	defb 000h,0f2h,0e5h,0dfh,0e7h,000h,0f4h,0fah,0fbh,000h,0dbh,0feh,048h,068h,0f5h,0ebh	; acd9  ............Hh..
	defb 0f1h,000h,0e4h,0e1h,0eeh,0ebh,0e5h,0dfh,0ddh,0e8h,0e8h,0f5h,0feh,040h,078h,0f1h	; ace9  .............@x.
	defb 0eah,0efh,0e1h,0ddh,0e8h,0e1h,0e0h,000h,0ddh,0e8h,0e8h,000h,0f0h,0e4h,0e1h,0feh	; acf9  ................
	defb 040h,088h,0e8h,0ebh,0dfh,0e7h,0efh,0f7h,0ffh,028h,080h,0ddh,0e8h,0e8h,000h,0f5h	; ad09  @........(......
	defb 0ebh,0f1h,000h,0e4h,0ddh,0f2h,0e1h,000h,0f0h,0ebh,000h,0e0h,0ebh,000h,0eah,0ebh	; ad19  ................
	defb 0f3h,0feh,028h,090h,0e5h,0efh,000h,0f0h,0f1h,0eeh,0eah,000h,0ebh,0e2h,0e2h,000h	; ad29  ..(.............
	defb 0f0h,0e4h,0e1h,000h,0efh,0f3h,0e5h,0dfh,0e4h,0feh,028h,0a0h,0f0h,0ebh,000h,0efh	; ad39  ..........(.....
	defb 0ddh,0f2h,0e1h,000h,0f0h,0e4h,0e1h,000h,0f3h,0ebh,0eeh,0e8h,0e0h,0f7h,0ffh,048h	; ad49  ...............H
	defb 0a0h,0ech,0f1h,0efh,0e4h,000h,0efh,0ech,0ddh,0dfh,0e1h,000h,0e7h,0e1h,0f5h,0ffh	; ad59  ................
	defb 060h,0a0h,0e0h,0ddh,0eah,0e3h,0e1h,0eeh,000h,0dbh,0dbh,0dbh,0ffh,092h,0adh,09ah	; ad69  `...............
	defb 0adh,002h,0aeh,0cbh,0adh,046h,0aeh,05eh,0aeh,078h,0aeh,0c5h,0aeh,088h,0adh,060h	; ad79  .....F.^.x.....`
	defb 048h,0f0h,0e4h,0e1h,000h,0e1h,0eah,0e0h,0ffh,068h,048h,0efh,0f0h,0ddh,0e2h,0e2h	; ad89  H........hH.....
	defb 0ffh,040h,030h,0ech,0eeh,0ebh,0e3h,0eeh,0ddh,0e9h,0feh,070h,050h,0e5h,0f7h,0ddh	; ad99  .@0........pP...
	defb 0e7h,0ddh,0e0h,0ddh,0feh,070h,060h,0e7h,0f7h,0eah,0ddh,0e3h,0ddh,0e1h,0feh,070h	; ada9  .....p`........p
	defb 070h,0f0h,0f7h,0ebh,0e7h,0ddh,0feh,070h,080h,0f0h,0f7h,0ebh,0f0h,0efh,0f1h,0e7h	; adb9  p......p........
	defb 0ddh,0ffh,040h,030h,0e3h,0eeh,0ddh,0ech,0e4h,0e5h,0dfh,0feh,070h,050h,0e4h,0f7h	; adc9  ..@0........pP..
	defb 0e9h,0ddh,0e7h,0e5h,0f0h,0ddh,0eah,0e5h,0feh,070h,060h,0e9h,0f7h,0f0h,0ddh,0deh	; add9  .........p`.....
	defb 0ddh,0f0h,0ddh,0feh,070h,070h,0efh,0f7h,0f1h,0e1h,0eah,0ebh,0feh,070h,080h,0efh	; ade9  ....pp.......p..
	defb 0f7h,0e5h,0f3h,0ddh,0e9h,0ebh,0f0h,0ebh,0ffh,040h,030h,0efh,0ebh,0f1h,0eah,0e0h	; adf9  .........@0.....
	defb 0feh,070h,050h,0e7h,0f7h,0f1h,0e1h,0e4h,0ddh,0eeh,0ddh,0feh,070h,060h,0e9h,0f7h	; ae09  .pP.........p`..
	defb 0e5h,0e7h,0ddh,0eeh,0e5h,0e7h,0ebh,0feh,070h,070h,0f5h,0f7h,0e9h,0ddh,0eah,0eah	; ae19  ........pp......
	defb 0ebh,0feh,070h,080h,0f0h,0f7h,0e2h,0f1h,0eeh,0f1h,0e7h,0ddh,0f3h,0ddh,0feh,070h	; ae29  ..p............p
	defb 090h,0e7h,0f7h,0f5h,0ddh,0e9h,0ddh,0efh,0e4h,0e5h,0f0h,0ddh,0ffh,040h,030h,0f0h	; ae39  .............@0.
	defb 0e5h,0f0h,0e8h,0e1h,000h,0e0h,0e1h,0efh,0e5h,0e3h,0eah,0feh,070h,050h,0eah,0f7h	; ae49  ............pP..
	defb 0efh,0ddh,0f0h,0ebh,0ffh,040h,030h,0e3h,0ddh,0e9h,0e1h,000h,0e0h,0e1h,0efh,0e5h	; ae59  .....@0.........
	defb 0e3h,0eah,0feh,070h,050h,0efh,0f7h,0e5h,0f3h,0ddh,0e9h,0ebh,0f0h,0ebh,0ffh,040h	; ae69  ...pP..........@
	defb 030h,0efh,0ech,0e1h,0dfh,0e5h,0ddh,0e8h,000h,0f0h,0e4h,0ddh,0eah,0e7h,0efh,0feh	; ae79  0...............
	defb 070h,050h,0e4h,0ddh,0e8h,0feh,070h,060h,0e5h,0e7h,0f1h,0feh,070h,070h,0efh,0ddh	; ae89  pP....p`....pp..
	defb 0e8h,0f0h,0feh,070h,080h,0f0h,0e1h,0eeh,0ddh,0feh,070h,090h,0eeh,0ebh,0ebh,0e9h	; ae99  ...p......p.....
	defb 000h,000h,0d1h,0d0h,0d0h,0d8h,0feh,070h,0a0h,0eeh,0ebh,0ebh,0e9h,000h,000h,0d1h	; aea9  .......p........
	defb 0d0h,0d1h,0d3h,0feh,070h,0b0h,0eeh,0dfh,0d7h,0d2h,0d7h,0ffh,050h,040h,0ech,0eeh	; aeb9  ....p.......P@..
	defb 0e1h,0efh,0e1h,0eah,0f0h,0e1h,0e0h,000h,0deh,0f5h,0feh,068h,050h,0e7h,0ebh,0eah	; aec9  ...........hP...
	defb 0ddh,0e9h,0e5h,0ffh,030h,030h,0f0h,0e4h,0ddh,0eah,0e7h,0efh,000h,0f0h,0ebh,000h	; aed9  ....00..........
	defb 0f5h,0ebh,0f1h,0eeh,000h,0dfh,0ebh,0f1h,0eeh,0ddh,0e3h,0e1h,0feh,010h,050h,0f0h	; aee9  ..............P.
	defb 0e4h,0e1h,000h,0f3h,0ebh,0eeh,0e8h,0e0h,000h,0e4h,0ddh,0efh,000h,0deh,0e1h,0e1h	; aef9  ................
	defb 0eah,000h,0efh,0ddh,0f2h,0e1h,0e0h,000h,0dbh,0dbh,0feh,058h,070h,0f3h,0e1h,0e8h	; af09  ...........Xp...
	defb 0e8h,000h,0e0h,0ebh,0eah,0e1h,0f7h,0ffh,038h,010h,0dfh,0ebh,0eah,0e3h,0eeh,0ddh	; af19  ........8.......
	defb 0f0h,0f1h,0e8h,0ddh,0f0h,0e5h,0ebh,0eah,0efh,000h,0dbh,0dbh,0dbh,0ffh,058h,0a0h	; af29  ..............X.
	defb 0e1h,060h,0a0h,0e8h,068h,0a0h,0e3h,070h,0a0h,0e5h,078h,0a0h,0f6h,080h,0a0h,0ddh	; af39  .`..h..p..x.....
	defb 088h,0a0h,0f8h,090h,0a0h,0f8h,098h,0a0h,0f8h,06dh,0afh,07dh,0afh,08eh,0afh,09ah	; af49  .........m.}....
	defb 0afh,0abh,0afh,0bbh,0afh,0cdh,0afh,050h,08ch,0e4h,0e9h,0f3h,0ebh,000h,0e5h,0f2h	; af59  .......P........
	defb 0f2h,0efh,0f2h,0ffh,048h,09ch,0e4h,0e9h,0f3h,0ebh,000h,0e9h,0efh,000h,0e5h,0f2h	; af69  ....H...........
	defb 0f2h,0efh,0f2h,0ffh,048h,09ch,0e6h,0e9h,0ech,0e5h,000h,0eeh,0efh,0f4h,000h,0e6h	; af79  ....H...........
	defb 0efh,0f5h,0eeh,0e4h,0ffh,058h,09ch,0e4h,0e9h,0f3h,0ebh,000h,0e6h,0f5h,0ech,0ech	; af89  .....X..........
	defb 0ffh,040h,09ch,0e4h,0e9h,0f3h,0ebh,000h,0eeh,0efh,0f4h,000h,0f2h,0e5h,0e1h,0e4h	; af99  .@..............
	defb 0f9h,0ffh,048h,09ch,0f7h,0f2h,0e9h,0f4h,0e5h,000h,0f0h,0f2h,0efh,0f4h,0e5h,0e3h	; afa9  ..H.............
	defb 0f4h,0ffh,048h,09ch,0f4h,0efh,0efh,000h,0edh,0e1h,0eeh,0eeh,0f9h,000h,0e6h,0e9h	; afb9  ..H.............
	defb 0ech,0e5h,0f3h,0ffh,048h,09ch,0e4h,0e1h,0f4h,0e1h,0f4h,0f9h,0f0h,0e5h,0e5h,0f2h	; afc9  ....H...........
	defb 0f2h,0efh,0f2h,0ffh,000h,07fh,07fh,07eh,07ch,078h,07eh,07eh,000h,0feh,03eh,03eh	; afd9  .......~|x~~..>>
	defb 03eh,03eh,03eh,03eh,07eh,07eh,07eh,07eh,07eh,07eh,07fh,000h,03eh,03eh,03eh,03eh	; afe9  >>>>~~~~~~..>>>>
	defb 03eh,03eh,0feh,000h,000h,07fh,078h,070h,071h,071h,07fh,07eh,000h,0feh,01eh,00eh	; aff9  >>....xpqq.~....
	defb 08eh,08eh,01eh,03eh,07ch,078h,071h,071h,070h,070h,07fh,000h,07eh,0feh,0feh,0feh	; b009  ...>|xqqpp..~...
	defb 00eh,00eh,0feh,000h,000h,07fh,078h,070h,071h,07fh,07eh,07eh,000h,0feh,01eh,00eh	; b019  ......xpq.~~....
	defb 08eh,08eh,01eh,00eh,07fh,071h,071h,071h,070h,078h,07fh,000h,08eh,08eh,08eh,08eh	; b029  .....qqqpx......
	defb 00eh,01eh,0feh,000h,000h,07fh,07fh,07fh,07eh,07eh,07ch,07dh,000h,0feh,01eh,01eh	; b039  ........~~|}....
	defb 01eh,01eh,01eh,01eh,079h,07bh,070h,070h,07fh,07fh,07fh,000h,01eh,01eh,00eh,00eh	; b049  ....y{pp........
	defb 01eh,01eh,0feh,000h,000h,07fh,070h,070h,071h,071h,070h,070h,000h,0feh,00eh,00eh	; b059  ......ppqqpp....
	defb 0feh,0feh,01eh,00eh,071h,07fh,07fh,071h,070h,078h,07fh,000h,000h,07fh,078h,070h	; b069  ....q..qpx....xp
	defb 071h,071h,070h,070h,000h,0feh,01eh,00eh,08eh,0feh,01eh,00eh,071h,071h,071h,071h	; b079  qqpp........qqqq
	defb 070h,078h,07fh,000h,000h,07fh,070h,070h,07fh,07fh,07fh,07eh,000h,0feh,00eh,00eh	; b089  px....pp...~....
	defb 08eh,01eh,01eh,03eh,07eh,07eh,07ch,07ch,07ch,07ch,07fh,000h,03eh,03eh,07eh,07eh	; b099  ...>~~||||..>>~~
	defb 07eh,07eh,0feh,000h,000h,07fh,078h,070h,071h,071h,078h,070h,000h,07fh,078h,070h	; b0a9  ~~....xpqqxp..xp
	defb 071h,071h,071h,071h,000h,0feh,01eh,00eh,08eh,08eh,08eh,08eh,070h,078h,07fh,071h	; b0b9  qqqq........px.q
	defb 070h,078h,07fh,000h,00eh,00eh,08eh,08eh,00eh,01eh,0feh,000h,000h,07fh,073h,063h	; b0c9  px............sc
	defb 043h,043h,063h,063h,063h,063h,063h,063h,063h,063h,07fh,000h,000h,07fh,061h,040h	; b0d9  CCcccccccc....a@
	defb 048h,048h,048h,078h,071h,063h,047h,047h,040h,040h,07fh,000h,000h,0feh,086h,002h	; b0e9  HHHxqcGG@@......
	defb 022h,022h,022h,022h,022h,022h,022h,022h,002h,086h,0feh,000h,000h,0feh,0e6h,0c6h	; b0f9  """"""""........
	defb 086h,086h,0c6h,0c6h,0c6h,0c6h,0c6h,0c6h,0c6h,0c6h,0feh,000h,000h,0feh,086h,002h	; b109  ................
	defb 022h,022h,022h,0e2h,0c6h,08eh,01eh,01eh,002h,002h,0feh,000h,000h,0feh,086h,002h	; b119  """.............
	defb 022h,022h,0e2h,0c6h,0c2h,0e2h,022h,022h,002h,086h,0feh,000h,000h,0feh,0e6h,0e6h	; b129  ""....""........
	defb 0c6h,0c6h,086h,0a6h,026h,066h,002h,002h,0e6h,0e6h,0feh,000h,000h,0feh,002h,002h	; b139  ....&f..........
	defb 03eh,03eh,006h,002h,0e2h,0e2h,022h,022h,002h,086h,0feh,000h,000h,0feh,086h,002h	; b149  >>....""........
	defb 022h,03eh,006h,002h,000h,0feh,002h,002h,0f2h,0e2h,0e6h,0c6h,0c6h,08eh,08eh,08eh	; b159  ">..............
	defb 08eh,08eh,0feh,000h,000h,0feh,086h,002h,022h,022h,086h,002h,002h,082h,0e2h,022h	; b169  ........""....."
	defb 002h,086h,0feh,000h,000h,000h,000h,000h,000h,000h,000h,000h,040h,040h,0f3h,0f4h	; b179  ............@@..
	defb 0e1h,0f2h,0f4h,000h,000h,0f3h,0e5h,0ech,0e5h,0e3h,0f4h,0feh,080h,050h,0eeh,0efh	; b189  .............P..
	defb 0f2h,0edh,0e1h,0ech,0feh,080h,060h,0f0h,0e1h,0f3h,0f3h,0f7h,0efh,0f2h,0e4h,0feh	; b199  ......`.........
	defb 080h,070h,0f3h,0f4h,0e1h,0e7h,0e5h,000h,0ech,0efh,0e1h,0e4h,0ffh,000h,000h,000h	; b1a9  .p..............
	defb 03fh,03fh,03fh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,080h,0c0h	; b1b9  ???.............
	defb 0e0h,0f0h,0e0h,0c0h,080h,000h,000h,000h,000h,000h,000h,000h,000h,0aah,0ach,0aah	; b1c9  ................
	defb 0cah,0ach,0aah,0cah,0aah,0a9h,09fh,099h,0f9h,09fh,099h,0f9h,09ah,0a9h,0ffh,0ffh	; b1d9  ................
	defb 0ffh,0ffh,0ffh,0ffh,09ah,0a9h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,09ah,0cfh,0ffh,0ffh	; b1e9  ................
	defb 0ffh,0ffh,0ffh,0ffh,0fch,0a9h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,09ah,0a9h,0ffh,0ffh	; b1f9  ................
	defb 0ffh,0ffh,0ffh,0ffh,09ah,0cfh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fch,0a9h,0ffh,0ffh	; b209  ................
	defb 0ffh,0ffh,0ffh,0ffh,09ah,0a9h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,09ah,0cfh,0ffh,0ffh	; b219  ................
	defb 0ffh,0ffh,0ffh,0ffh,0fch,0a9h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,09ah,0a9h,0ffh,0ffh	; b229  ................
	defb 0ffh,0ffh,0ffh,0ffh,09ah,0cfh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fch,0a9h,0ffh,0ffh	; b239  ................
	defb 0ffh,0ffh,0ffh,0ffh,09ah,0a9h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,09ah,068h,020h,0eeh	; b249  .............h .
	defb 0e9h,0e3h,0e5h,000h,0dbh,0feh,038h,030h,0ech,0e5h,0f4h,0f3h,000h,0e7h,0efh,000h	; b259  ......80........
	defb 0eeh,0e5h,0f8h,0f4h,000h,0f3h,0f4h,0e1h,0e7h,0e5h,0feh,048h,050h,0f3h,0f0h,0e5h	; b269  ...........HP...
	defb 0e3h,0e9h,0e1h,0ech,000h,0e2h,0efh,0eeh,0f5h,0f3h,0ffh,048h,040h,0f3h,0e5h,0e3h	; b279  ...........H@...
	defb 0f2h,0e5h,0f4h,000h,0e3h,0efh,0edh,0edh,0e1h,0eeh,0e4h,0feh,060h,058h,0e6h,0fdh	; b289  ............`X..
	defb 0fdh,0f4h,0fdh,0fdh,0fdh,0ech,0feh,060h,068h,0fdh,0fdh,0f9h,0fdh,0fdh,0fdh,0fdh	; b299  .......`h.......
	defb 0fdh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b2a9  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b2b9  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b2c9  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b2d9  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b2e9  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b2f9  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b309  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b319  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b329  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b339  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b349  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b359  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b369  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b379  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b389  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b399  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b3a9  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b3b9  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b3c9  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b3d9  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b3e9  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b3f9

; ======================================================================
; CODIGO 0xb400..0xb42f  (47 bytes)
; ======================================================================


L_B400:
	ld hl,0b544h		;b400   ; el sitio escondido de la fase, si lo tiene: tabla 0xB548, 5 bytes [fase][tipo][pantalla][y][x], un 0 acaba
L_B403:
	ld a,(hl)			;b403
	and a			;b404
	ret z			;b405
	ld a,(0e242h)		;b406   ; lee la fase (1-60)
	cp (hl)			;b409
	jr z,L_B413		;b40a
	ld a,005h		;b40c
	call 04094h		;b40e   ; suma A a HL (HL = HL + A)
	jr L_B403		;b411
L_B413:
	inc hl			;b413   ; lo copia a 0xEF10: tipo, paso (0) y pantalla, y, x
	ld de,0ef10h		;b414   ; apunta a el sitio escondido de la fase: tipo, paso, pantalla, y, x (0xEF10-0xEF15)
	ldi		;b417
	xor a			;b419
	ld (de),a			;b41a
	inc de			;b41b
	ld bc,00003h		;b41c
	ldir		;b41f
	ret			;b421
L_B422:
	ld hl,0ef10h		;b422   ; un cuadro del sitio escondido, por pasos (0xEF11)
	ld a,(hl)			;b425
	or a			;b426
	ret z			;b427
	inc l			;b428
	ld a,(hl)			;b429
	inc l			;b42a
	exx			;b42b
	call 0409eh		;b42c   ; el despachador de Konami: la tabla va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_B42F: 4 destinos del despachador p00:409E (call en p12:B42C, el
;   indice en A): B437, B462, B46C, B48F; lo leen p12:B42C (8 bytes)
;   0xb42f..0xb437  (8 bytes)
DATA_tabla_B42F:
	defw 0b437h,0b462h,0b46ch,0b48fh	; b42f  -> L_B437 L_B462 L_B46C L_B48F

; ======================================================================
; CODIGO 0xb437..0xb4f8  (193 bytes)
; ======================================================================


L_B437:
	exx			;b437   ; paso 0: aparece si el personaje salta (estado 1) justo en el sitio
	ld a,(0e243h)		;b438   ; lee la pantalla de la fase (desde 1)
	cp (hl)			;b43b
	ret nz			;b43c
	ld a,(0e280h)		;b43d   ; lee el estado del personaje
	dec a			;b440
	ret nz			;b441
	call L_B4AC		;b442   ; C si el personaje esta a menos de 4 pixeles del sitio
	ret nc			;b445
	ld hl,0ef11h		;b446   ; el paso siguiente, una espera de 0x40 y se pinta, con el sonido 0x3B
	inc (hl)			;b449
	inc l			;b44a
	inc l			;b44b
	inc l			;b44c
	inc l			;b44d
	ld (hl),080h		;b44e
	call 09418h		;b450   ; devuelve el fondo de los bloques de esta pantalla
	call 08e2dh		;b453   ; las cosas de la lista 0xEE50 (por numero): lo que habia debajo se devuelve
	call L_B4E3		;b456   ; guarda el fondo del sitio y pinta 2 x 2 caracteres de 0xB4F8
	call 08e74h		;b459   ; las de la lista, al reves: guarda el fondo y pinta la cosa
	call 093e8h		;b45c   ; pinta los bloques de esta pantalla
	jp 042f7h		;b45f
L_B462:
	ld hl,0ef15h		;b462   ; paso 1: espera
	dec (hl)			;b465
	ret nz			;b466
	ld hl,0ef11h		;b467
	inc (hl)			;b46a
	ret			;b46b
L_B46C:
	exx			;b46c   ; paso 2: al tocarlo, el sonido 0x2E y su dibujo de 0xB1D6
	ld a,(0e243h)		;b46d   ; lee la pantalla de la fase (desde 1)
	cp (hl)			;b470
	ret nz			;b471
	call L_B4C9		;b472   ; C si esta a menos de 4 en y y de 8 en x
	ret nc			;b475
	call 042c3h		;b476   ; pide el sonido 0x2E
	ld hl,0ef11h		;b479
	inc (hl)			;b47c
	call 09418h		;b47d   ; devuelve el fondo de los bloques de esta pantalla
	call 08e2dh		;b480   ; las cosas de la lista 0xEE50 (por numero): lo que habia debajo se devuelve
	call L_B509		;b483   ; devuelve el fondo
	call 05368h		;b486
	call 08e74h		;b489   ; las de la lista, al reves: guarda el fondo y pinta la cosa
	jp 093e8h		;b48c
L_B48F:
	exx			;b48f   ; paso 3: en el sitio pulsando abajo, se entra (estado 12) con el sonido 0x30
	ld a,(0e243h)		;b490   ; lee la pantalla de la fase (desde 1)
	cp (hl)			;b493
	ret nz			;b494
	call L_B4C9		;b495   ; C si esta a menos de 4 en y y de 8 en x
	ret nc			;b498
	ld a,(0e208h)		;b499   ; lee el mando: lo pulsado
	rra			;b49c
	rra			;b49d
	ret nc			;b49e
	xor a			;b49f
	ld hl,0000ch		;b4a0
	ld (0e200h),hl		;b4a3   ; guarda el estado del juego (0 presentacion, 1 titulo, 3 menu, 4 empieza la fase, 5 juego, 6 se acaba la vida, 7 fin, 9 fase acabada, 0x0B editor, 0x0D final) y el byte siguiente (16 bits)
	ld (0ef11h),a		;b4a6
	jp 042cbh		;b4a9
L_B4AC:
	inc l			;b4ac   ; C si el personaje esta a menos de 4 pixeles del sitio
	ld a,(hl)			;b4ad
	sub 010h		;b4ae
	ld b,a			;b4b0
	ld a,(0e282h)		;b4b1   ; lee la y del personaje
	sub b			;b4b4
	jr nc,L_B4B9		;b4b5
	neg		;b4b7
L_B4B9:
	cp 004h		;b4b9
	ret nc			;b4bb
	inc l			;b4bc
	ld b,(hl)			;b4bd
	ld a,(0e284h)		;b4be   ; lee la x del personaje
	sub b			;b4c1
	jr nc,L_B4C6		;b4c2
	neg		;b4c4
L_B4C6:
	cp 004h		;b4c6
	ret			;b4c8
L_B4C9:
	inc l			;b4c9   ; C si esta a menos de 4 en y y de 8 en x
	ld b,(hl)			;b4ca
	ld a,(0e282h)		;b4cb   ; lee la y del personaje
	sub b			;b4ce
	jr nc,L_B4D3		;b4cf
	neg		;b4d1
L_B4D3:
	cp 004h		;b4d3
	ret nc			;b4d5
	inc l			;b4d6
	ld b,(hl)			;b4d7
	ld a,(0e284h)		;b4d8   ; lee la x del personaje
	sub b			;b4db
	jr nc,L_B4E0		;b4dc
	neg		;b4de
L_B4E0:
	cp 008h		;b4e0
	ret			;b4e2
L_B4E3:
	ld hl,0ef13h		;b4e3   ; guarda el fondo del sitio y pinta 2 x 2 caracteres de 0xB4F8
	call L_B4FC		;b4e6   ; guarda en la pagina 1 (0xB0) los 16 x 16 pixeles del sitio
	ld hl,0ef13h		;b4e9
	ld e,(hl)			;b4ec
	inc l			;b4ed
	ld d,(hl)			;b4ee
	ld hl,0b4f8h		;b4ef
	ld bc,00202h		;b4f2
	jp 053d6h		;b4f5

; ----------------------------------------------------------------------
; DATOS resto_B4F8: lo apuntan con el banco puesto p12:B4EF (0xB4F8); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p12:B4EF (4 bytes)
;   0xb4f8..0xb4fc  (4 bytes)
DATA_resto_B4F8:
	defb 0ach,0adh,0c0h,0c1h	; b4f8

; ======================================================================
; CODIGO 0xb4fc..0xb544  (72 bytes)
; ======================================================================


L_B4FC:
	ld a,(hl)			;b4fc   ; guarda en la pagina 1 (0xB0) los 16 x 16 pixeles del sitio
	inc l			;b4fd
	ld h,(hl)			;b4fe
	ld l,a			;b4ff
	call 04d7ch		;b500   ; pasa la posicion de caracter de HL a direccion de la VRAM
	ld de,0ef16h		;b503
	jp 053c1h		;b506
L_B509:
	ld hl,0ef13h		;b509   ; devuelve el fondo
	ld e,(hl)			;b50c
	inc l			;b50d
	ld d,(hl)			;b50e
	ld hl,0ef16h		;b50f
	ld bc,00202h		;b512
	jp 053d6h		;b515
L_B518:
	ld hl,0ef10h		;b518   ; al pintar la pantalla, el sitio si ya ha aparecido
	ld a,(hl)			;b51b
	or a			;b51c
	ret z			;b51d
	inc l			;b51e
	inc l			;b51f
	ld a,(0e243h)		;b520   ; lee la pantalla de la fase (desde 1)
	cp (hl)			;b523
	ret nz			;b524
	dec l			;b525
	ld a,(hl)			;b526
	or a			;b527
	ret z			;b528
	cp 003h		;b529
	jp z,05368h		;b52b
	jr $-75		;b52e
L_B530:
	call L_B536		;b530   ; un cuadro del minijuego del sitio escondido (estado 12)
	jp 0564ah		;b533
L_B536:
	ld ix,0ef10h		;b536   ; tipo 1: las musicas; tipo 2: el puzle
	ld a,(ix+000h)		;b53a
	dec a			;b53d
	jp z,L_B909		;b53e
	jp L_B6AC		;b541

; ----------------------------------------------------------------------
; DATOS resto_B544: lo apuntan con el banco puesto p12:B400 (0xB544), p12:B924
;   (0xB581), p12:B73F (0xB5B4), p12:B893 (0xB5C3), p12:B6FD (0xB5DC),
;   p12:B7EA (0xB648); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p12:B400, p12:B924, p12:B73F, p12:B893, p12:B6FD,
;   p12:B7EA (360 bytes)
;   0xb544..0xb6ac  (360 bytes)
DATA_resto_B544:
	defb 007h,001h,002h,008h,008h,014h,002h,002h,088h,030h,018h,001h,004h,028h,0e0h,01dh	; b544  .........0...(..
	defb 002h,001h,0a8h,0e0h,020h,001h,003h,080h,030h,023h,002h,003h,018h,0d8h,028h,001h	; b554  .... ...0#....(.
	defb 001h,080h,070h,02bh,002h,001h,0a0h,098h,032h,001h,002h,0a8h,018h,034h,002h,001h	; b564  ..p+....2....4..
	defb 0a8h,0e0h,035h,001h,003h,038h,0b0h,037h,002h,002h,078h,0c0h,000h,050h,018h,0f3h	; b574  ..5..8.7..x..P..
	defb 0efh,0f5h,0eeh,0e4h,000h,0f3h,0e5h,0ech,0e5h,0e3h,0f4h,0feh,040h,0a8h,0f3h,0e5h	; b584  ............@...
	defb 0ech,0e5h,0e3h,0f4h,000h,0fch,0fch,0fch,000h,0f3h,0f0h,0e1h,0e3h,0e5h,0feh,058h	; b594  ...............X
	defb 0b8h,0e5h,0eeh,0e4h,000h,0fch,0fch,0fch,000h,0f2h,0e5h,0f4h,0f5h,0f2h,0eeh,0ffh	; b5a4  ................
	defb 050h,018h,0f0h,0f5h,0fah,0fah,0ech,0e5h,000h,000h,0e7h,0e1h,0edh,0e5h,0ffh,060h	; b5b4  P..............`
	defb 090h,0e1h,0ech,0ech,000h,0f2h,0e9h,0e7h,0e8h,0f4h,0feh,060h,0a0h,0f2h,0e5h,0f3h	; b5c4  ...........`....
	defb 0f4h,000h,000h,0d3h,000h,0f5h,0f0h,0ffh,0e4h,0b5h,0fdh,0b5h,016h,0b6h,02fh,0b6h	; b5d4  ............../.
	defb 00bh,011h,017h,004h,012h,00ah,001h,00ch,00dh,013h,007h,016h,009h,018h,00eh,015h	; b5e4  ................
	defb 008h,014h,003h,000h,006h,002h,010h,005h,00fh,004h,012h,00fh,00bh,003h,008h,018h	; b5f4  ................
	defb 017h,007h,013h,010h,005h,00ch,000h,00eh,015h,016h,011h,006h,00ah,001h,009h,00dh	; b604  ................
	defb 014h,002h,007h,014h,00bh,010h,018h,012h,001h,006h,00ch,005h,008h,015h,00ah,011h	; b614  ................
	defb 00dh,00eh,016h,002h,009h,000h,013h,00fh,017h,003h,004h,00fh,004h,008h,002h,00bh	; b624  ................
	defb 000h,00dh,016h,00eh,013h,006h,00ch,007h,012h,015h,014h,017h,011h,018h,00ah,005h	; b634  ................
	defb 010h,003h,009h,001h,035h,035h,035h,035h,001h,002h,003h,004h,005h,006h,007h,008h	; b644  ....5555........
	defb 009h,00ah,00bh,00ch,00dh,00eh,00fh,010h,011h,012h,013h,00ch,014h,015h,016h,00ch	; b654  ................
	defb 017h,018h,019h,01ah,01bh,00ah,016h,00ch,01ch,01dh,01eh,01fh,020h,024h,021h,025h	; b664  ............ $!%
	defb 020h,026h,021h,027h,020h,028h,021h,029h,020h,02ah,021h,02bh,020h,02ch,021h,02dh	; b674   &!' (!) *!+ ,!-
	defb 020h,02eh,021h,02fh,020h,030h,021h,025h,020h,031h,021h,032h,020h,033h,021h,025h	; b684   .!/ 0!% 1!2 3!%
	defb 020h,024h,021h,034h,022h,024h,023h,025h,022h,026h,023h,027h,022h,028h,023h,029h	; b694   $!4"$#%"&#'"(#)
	defb 022h,02ah,023h,02bh,022h,02ch,023h,02dh	; b6a4  "*#+",#-

; ======================================================================
; CODIGO 0xb6ac..0xb6ba  (14 bytes)
; ======================================================================


L_B6AC:
	ld a,(0e20ch)		;b6ac   ; el puzle: ESC sale; por pasos (IX+01)
	rla			;b6af
	rla			;b6b0
	jp c,L_B89F		;b6b1
	ld a,(ix+001h)		;b6b4
	call 0409eh		;b6b7   ; el despachador de Konami: la tabla va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_B6BA: 6 destinos del despachador p00:409E (call en p12:B6B7, el
;   indice en A): B6C6, B6EE, B6FD, B745, B85A, B899; lo leen p12:B6B7 (12
;   bytes)
;   0xb6ba..0xb6c6  (12 bytes)
DATA_tabla_B6BA:
	defw 0b6c6h,0b6eeh,0b6fdh,0b745h,0b85ah,0b899h	; b6ba

; ======================================================================
; CODIGO 0xb6c6..0xb7a1  (219 bytes)
; ======================================================================


L_B6C6:
	call 04ec7h		;b6c6   ; paso 0: la fuente, las piezas en orden (1-24 y el hueco) y el letrero
	call 05b38h		;b6c9   ; los atributos de los sprites (0xE800, 0x80 bytes) a 0xE0: fuera de la pantalla
	call 05342h		;b6cc   ; la fuente: 0x35 caracteres de 0xAFDD
	call 055ffh		;b6cf   ; las rachas de 0xBA9A a 0xF800 (dibujos de los sprites)
	ld hl,0ef38h		;b6d2
	ld (hl),000h		;b6d5
	dec hl			;b6d7
	ld b,018h		;b6d8
L_B6DA:
	ld a,b			;b6da
	ld (hl),b			;b6db
	dec hl			;b6dc
	djnz L_B6DA		;b6dd
	call L_B71A		;b6df   ; pinta las 25 casillas (5 x 5) y el letrero
	ld hl,0b8abh		;b6e2
	call 04f0bh		;b6e5   ; pinta un letrero: [D][E] y caracteres; 0xFE trae otra posicion; 0xFF acaba
	inc (ix+001h)		;b6e8
	jp 04215h		;b6eb
L_B6EE:
	ld a,(0e207h)		;b6ee   ; paso 1: espera el disparo
	and 010h		;b6f1
	ret z			;b6f3
	inc (ix+001h)		;b6f4
	ld hl,0b8bah		;b6f7
	jp 04f0fh		;b6fa
L_B6FD:
	ld hl,0b5dch		;b6fd   ; paso 2: un puzle revuelto de los 4 de la tabla 0xB5E0 (al azar con 0xE203)
	ld a,(0e203h)		;b700   ; lee la cuenta de cuadros
	and 003h		;b703
	call 04d4dh		;b705   ; HL = la palabra A de la tabla de HL
	ld de,0ef20h		;b708   ; apunta a el puzle: las 25 casillas
	ld bc,00019h		;b70b
	ldir		;b70e
	inc (ix+001h)		;b710
	xor a			;b713
	ld (ix+002h),a		;b714
	ld (ix+003h),a		;b717
L_B71A:
	ld hl,0ef20h		;b71a   ; pinta las 25 casillas (5 x 5) y el letrero
	ld bc,00505h		;b71d
	ld de,05830h		;b720
L_B723:
	push bc			;b723
	ld b,c			;b724
	push de			;b725
L_B726:
	push bc			;b726
	push de			;b727
	push hl			;b728
	ld a,(hl)			;b729
	call L_B7E8		;b72a   ; pinta la pieza A (2 x 2 caracteres de 0xB64C + 4 x A)
	pop hl			;b72d
	inc hl			;b72e
	pop de			;b72f
	ld a,d			;b730
	add a,010h		;b731
	ld d,a			;b733
	pop bc			;b734
	djnz L_B726		;b735
	pop de			;b737
	ld a,e			;b738
	add a,010h		;b739
	ld e,a			;b73b
	pop bc			;b73c
	djnz L_B723		;b73d
	ld hl,0b5b4h		;b73f
	jp 04f0bh		;b742
L_B745:
	call L_B8CB		;b745   ; paso 3: los cursores mueven la mano; el disparo mueve la pieza al hueco de al lado
	ld a,(0e207h)		;b748   ; lee el mando: lo que se acaba de pulsar
	rra			;b74b
	jr c,L_B767		;b74c
	rra			;b74e
	jr c,L_B771		;b74f
	rra			;b751
	jr c,L_B77C		;b752
	rra			;b754
	jr c,L_B75B		;b755
	rra			;b757
	jr c,L_B786		;b758
	ret			;b75a
L_B75B:
	ld a,(ix+003h)		;b75b
	cp 004h		;b75e
	ret nc			;b760
	inc (ix+003h)		;b761
L_B764:
	jp 042d3h		;b764
L_B767:
	ld a,(ix+002h)		;b767
	and a			;b76a
	ret z			;b76b
	dec (ix+002h)		;b76c
	jr L_B764		;b76f
L_B771:
	ld a,(ix+002h)		;b771
	cp 004h		;b774
	ret nc			;b776
	inc (ix+002h)		;b777
	jr L_B764		;b77a
L_B77C:
	ld a,(ix+003h)		;b77c
	and a			;b77f
	ret z			;b780
	dec (ix+003h)		;b781
	jr L_B764		;b784
L_B786:
	call L_B7F6		;b786   ; la pieza: si tiene el hueco al lado, se corre
	ret z			;b789
	push hl			;b78a
	push bc			;b78b
	call L_B820		;b78c   ; C = hacia donde esta el hueco (1 arriba, 2 abajo, 3 izquierda, 4 derecha; 0 no esta al lado)
	ld a,c			;b78f
	pop bc			;b790
	pop de			;b791
	ld c,a			;b792
	and a			;b793
	ret z			;b794
	inc (ix+001h)		;b795
	xor a			;b798
	call L_B7C1		;b799
	ld a,c			;b79c
	dec a			;b79d
	call 0409eh		;b79e   ; el despachador de Konami: la tabla va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_B7A1: 4 destinos del despachador p00:409E (call en p12:B79E, el
;   indice en A): B7B4, B7CE, B7DD, B7A9; lo leen p12:B79E (8 bytes)
;   0xb7a1..0xb7a9  (8 bytes)
DATA_tabla_B7A1:
	defw 0b7b4h,0b7ceh,0b7ddh,0b7a9h	; b7a1  -> L_B7B4 L_B7CE L_B7DD L_B7A9

; ======================================================================
; CODIGO 0xb7a9..0xb8ab  (258 bytes)
; ======================================================================


L_B7A9:
	ex de,hl			;b7a9   ; al hueco de abajo
	ld (hl),000h		;b7aa
	inc hl			;b7ac
	ld (hl),b			;b7ad
	inc (ix+003h)		;b7ae
	ld a,b			;b7b1
	jr L_B7C1		;b7b2
L_B7B4:
	ex de,hl			;b7b4   ; al de la izquierda
	ld (hl),000h		;b7b5
	dec hl			;b7b7
	dec hl			;b7b8
	dec hl			;b7b9
	dec hl			;b7ba
	dec hl			;b7bb
	ld (hl),b			;b7bc
	dec (ix+002h)		;b7bd
	ld a,b			;b7c0
L_B7C1:
	push de			;b7c1
	push bc			;b7c2
	push af			;b7c3
	call L_B80B		;b7c4   ; D, E = la casilla de la mano en pixeles
	pop af			;b7c7
	call L_B7E8		;b7c8   ; pinta la pieza A (2 x 2 caracteres de 0xB64C + 4 x A)
	pop bc			;b7cb
	pop de			;b7cc
	ret			;b7cd
L_B7CE:
	ex de,hl			;b7ce   ; al de la derecha
	ld (hl),000h		;b7cf
	inc hl			;b7d1
	inc hl			;b7d2
	inc hl			;b7d3
	inc hl			;b7d4
	inc hl			;b7d5
	ld (hl),b			;b7d6
	inc (ix+002h)		;b7d7
	ld a,b			;b7da
	jr L_B7C1		;b7db
L_B7DD:
	ex de,hl			;b7dd   ; al de arriba
	ld (hl),000h		;b7de
	dec hl			;b7e0
	ld (hl),b			;b7e1
	dec (ix+003h)		;b7e2
	ld a,b			;b7e5
	jr L_B7C1		;b7e6
L_B7E8:
	add a,a			;b7e8   ; pinta la pieza A (2 x 2 caracteres de 0xB64C + 4 x A)
	add a,a			;b7e9
	ld hl,0b648h		;b7ea
	call 04094h		;b7ed   ; suma A a HL (HL = HL + A)
	ld bc,00202h		;b7f0
	jp 053d6h		;b7f3
L_B7F6:
	ld d,(ix+002h)		;b7f6   ; B = la pieza de la casilla de la mano (Z si es el hueco)
	ld e,(ix+003h)		;b7f9
L_B7FC:
	ld a,d			;b7fc
	add a,a			;b7fd
	add a,a			;b7fe
	add a,d			;b7ff
	add a,e			;b800
	ld hl,0ef20h		;b801   ; apunta a el puzle: las 25 casillas
	call 04094h		;b804   ; suma A a HL (HL = HL + A)
	ld a,(hl)			;b807
	ld b,a			;b808
	and a			;b809
	ret			;b80a
L_B80B:
	ld a,(ix+002h)		;b80b   ; D, E = la casilla de la mano en pixeles
	add a,a			;b80e
	add a,a			;b80f
	add a,a			;b810
	add a,a			;b811
	add a,030h		;b812
	ld e,a			;b814
	ld a,(ix+003h)		;b815
	add a,a			;b818
	add a,a			;b819
	add a,a			;b81a
	add a,a			;b81b
	add a,058h		;b81c
	ld d,a			;b81e
	ret			;b81f
L_B820:
	ld d,(ix+002h)		;b820   ; C = hacia donde esta el hueco (1 arriba, 2 abajo, 3 izquierda, 4 derecha; 0 no esta al lado)
	ld e,(ix+003h)		;b823
	ld c,001h		;b826
	ld a,d			;b828
	and a			;b829
	jr z,L_B833		;b82a
	push de			;b82c
	dec d			;b82d
	call L_B7FC		;b82e
	pop de			;b831
	ret z			;b832
L_B833:
	inc c			;b833
	ld a,d			;b834
	cp 004h		;b835
	jr nc,L_B840		;b837
	push de			;b839
	inc d			;b83a
	call L_B7FC		;b83b
	pop de			;b83e
	ret z			;b83f
L_B840:
	inc c			;b840
	ld a,e			;b841
	and a			;b842
	jr z,L_B84C		;b843
	push de			;b845
	dec e			;b846
	call L_B7FC		;b847
	pop de			;b84a
	ret z			;b84b
L_B84C:
	inc c			;b84c
	ld a,e			;b84d
	cp 004h		;b84e
	jr nc,L_B857		;b850
	inc e			;b852
	call L_B7FC		;b853
	ret z			;b856
L_B857:
	ld c,000h		;b857
	ret			;b859
L_B85A:
	ld de,0ef20h		;b85a   ; paso 4: si las piezas estan en orden (1-24)...
	ld hl,0ef21h		;b85d
	ld a,(de)			;b860
	cp 001h		;b861
	jr nz,L_B872		;b863
L_B865:
	ld a,(de)			;b865
	inc a			;b866
	cp (hl)			;b867
	jr nz,L_B872		;b868
	cp 018h		;b86a
	jr z,L_B876		;b86c
	inc de			;b86e
	inc hl			;b86f
	jr L_B865		;b870
L_B872:
	dec (ix+001h)		;b872
	ret			;b875
L_B876:
	call 05b38h		;b876   ; ...resuelto: 3 vidas mas (hasta 99) y el letrero de 0xB5C7
	inc (ix+001h)		;b879
	ld a,(0e240h)		;b87c   ; lee las vidas (BCD)
	add a,003h		;b87f
	cp 099h		;b881
	jr nc,L_B888		;b883
	daa			;b885
	jr L_B88A		;b886
L_B888:
	ld a,099h		;b888
L_B88A:
	ld (0e240h),a		;b88a   ; guarda las vidas (BCD)
	ld hl,0b8abh		;b88d
	call 04f0fh		;b890   ; lo mismo, borrando (caracter 0)
	ld hl,0b5c3h		;b893
	jp 04f0bh		;b896
L_B899:
	ld a,(0e207h)		;b899   ; paso 5: el disparo sale
	and 010h		;b89c
	ret z			;b89e
L_B89F:
	ld bc,00007h		;b89f   ; sale: el borde a 0 y el sonido 1
	ld (ix+000h),b		;b8a2
	call 00047h		;b8a5   ; BIOS WRTVDP - Writes data in the VDP-register
	jp 041e8h		;b8a8

; ----------------------------------------------------------------------
; DATOS resto_B8AB: lo apuntan con el banco puesto p12:B6E2 (0xB8AB), p12:B88D
;   (0xB8AB), p12:B6F7 (0xB8BA); el tamano es lo que hay hasta lo siguiente,
;   no sale de recorrerlo; lo leen p12:B6E2, p12:B88D, p12:B6F7 (32 bytes)
;   0xb8ab..0xb8cb  (32 bytes)
DATA_resto_B8AB:
	defb 050h,0a0h,0e5h,0eeh,0e4h,000h,000h,0e5h,0f3h,0e3h,000h,0ebh,0e5h,0f9h,0feh,048h	; b8ab  P..............H
	defb 090h,0f0h,0f5h,0f3h,0e8h,000h,0f3h,0f0h,0e1h,0e3h,0e5h,000h,0ebh,0e5h,0f9h,0ffh	; b8bb  ................

; ======================================================================
; CODIGO 0xb8cb..0xb903  (56 bytes)
; ======================================================================


L_B8CB:
	ld hl,0e800h		;b8cb   ; la mano (cuatro sprites con los colores de 0xB913)
	ld de,0b903h		;b8ce
	ld bc,00600h		;b8d1
L_B8D4:
	push bc			;b8d4
	ld a,(ix+002h)		;b8d5
	add a,a			;b8d8
	add a,a			;b8d9
	add a,a			;b8da
	add a,a			;b8db
	add a,034h		;b8dc
	ld c,a			;b8de
	ld a,b			;b8df
	cp 004h		;b8e0
	jr nc,L_B8E8		;b8e2
	ld a,c			;b8e4
	add a,010h		;b8e5
	ld c,a			;b8e7
L_B8E8:
	ld (hl),c			;b8e8
	inc hl			;b8e9
	ld a,(ix+003h)		;b8ea
	add a,a			;b8ed
	add a,a			;b8ee
	add a,a			;b8ef
	add a,a			;b8f0
	add a,05ch		;b8f1
	ld (hl),a			;b8f3
	pop bc			;b8f4
	inc hl			;b8f5
	ld (hl),c			;b8f6
	ld a,c			;b8f7
	add a,004h		;b8f8
	ld c,a			;b8fa
	inc hl			;b8fb
	ld a,(de)			;b8fc
	ld (hl),a			;b8fd
	inc de			;b8fe
	inc hl			;b8ff
	djnz L_B8D4		;b900
	ret			;b902

; ----------------------------------------------------------------------
; DATOS resto_B903: lo apuntan con el banco puesto p12:B8CE (0xB903); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p12:B8CE (6 bytes)
;   0xb903..0xb909  (6 bytes)
DATA_resto_B903:
	defb 001h,009h,00bh,001h,009h,00bh	; b903

; ======================================================================
; CODIGO 0xb909..0xb97c  (115 bytes)
; ======================================================================


L_B909:
	ld a,(ix+001h)		;b909   ; las musicas: por pasos
	cp 001h		;b90c
	jr z,L_B92A		;b90e
	jr nc,L_B973		;b910   ; paso 0: graficos, el dibujo de 0xBC05 y el letrero
	call 04ec7h		;b912
	call 055e4h		;b915   ; los graficos de la lista 0xB7DF (bancos 7-8-9) y la paleta de 0xBA78
	call 055ffh		;b918   ; las rachas de 0xBA9A a 0xF800 (dibujos de los sprites)
	call 055d2h		;b91b
	call 05b38h		;b91e   ; los atributos de los sprites (0xE800, 0x80 bytes) a 0xE0: fuera de la pantalla
	inc (ix+001h)		;b921
	ld hl,0b581h		;b924
	jp 04f0bh		;b927
L_B92A:
	call L_B9A2		;b92a   ; paso 1: arriba y abajo eligen (19, IX+02), el disparo la pone; RETURN sale
	ld a,(0e207h)		;b92d   ; lee el mando: lo que se acaba de pulsar
	rra			;b930
	rra			;b931
	rra			;b932
	jr c,L_B94C		;b933
	rra			;b935
	jr c,L_B95C		;b936
	rra			;b938
	jr c,L_B96D		;b939
	ld a,(0e20ch)		;b93b   ; lee las teclas: lo que se acaba de pulsar (bit 0 pausa, 1 recuadro, 3 musica, 4 disparo)
	rla			;b93e
	ret nc			;b93f
	ld bc,00007h		;b940
	ld (ix+000h),b		;b943
	call 00047h		;b946   ; BIOS WRTVDP - Writes data in the VDP-register
	jp 041e8h		;b949
L_B94C:
	call 042d3h		;b94c   ; pide el sonido 0x32
	dec (ix+002h)		;b94f
	ld a,(ix+002h)		;b952
	rla			;b955
	ret nc			;b956
	ld (ix+002h),012h		;b957
	ret			;b95b
L_B95C:
	call 042d3h		;b95c   ; pide el sonido 0x32
	inc (ix+002h)		;b95f
	ld a,(ix+002h)		;b962
	cp 013h		;b965
	ret c			;b967
	ld (ix+002h),000h		;b968
	ret			;b96c
L_B96D:
	inc (ix+001h)		;b96d
	jp 041e8h		;b970
L_B973:
	dec (ix+001h)		;b973   ; la pone (tabla detras, una peticion de sonido por musica)
	ld a,(ix+002h)		;b976
	call 0409eh		;b979   ; el despachador de Konami: la tabla va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_B97C: 19 destinos del despachador p00:409E (call en p12:B979, el
;   indice en A): 41F2, 41FC, 4201, 4206, 420B, 4210, 4215, 421A, 421F, 4224,
;   4229, 422E, 4233, 4238, 423D, 4251, 42A6, 42AB, 4274; lo leen p12:B979 (38
;   bytes)
;   0xb97c..0xb9a2  (38 bytes)
DATA_tabla_B97C:
	defw 041f2h,041fch,04201h,04206h,0420bh,04210h,04215h,0421ah	; b97c
	defw 0421fh,04224h,04229h,0422eh,04233h,04238h,0423dh,04251h	; b98c
	defw 042a6h,042abh,04274h	; b99c

; ======================================================================
; CODIGO 0xb9a2..0xb9de  (60 bytes)
; ======================================================================


L_B9A2:
	ld hl,0e800h		;b9a2   ; los sprites de la flecha (tablas 0xB9FA y 0xBA0D)
	ld de,0b9f1h		;b9a5
	ld bc,00600h		;b9a8
L_B9AB:
	push bc			;b9ab
	ld a,(ix+002h)		;b9ac
	exx			;b9af
	ld de,0b9deh		;b9b0
	call 04099h		;b9b3   ; suma A a DE (DE = DE + A)
	ld a,(de)			;b9b6
	exx			;b9b7
	push af			;b9b8
	rra			;b9b9
	ld c,078h		;b9ba
	jr nc,L_B9C0		;b9bc
	ld c,060h		;b9be
L_B9C0:
	ld a,b			;b9c0
	cp 004h		;b9c1
	jr nc,L_B9C9		;b9c3
	ld a,c			;b9c5
	add a,010h		;b9c6
	ld c,a			;b9c8
L_B9C9:
	ld (hl),c			;b9c9
	pop af			;b9ca
	inc hl			;b9cb
	and 0feh		;b9cc
	ld (hl),a			;b9ce
	pop bc			;b9cf
	inc hl			;b9d0
	ld (hl),c			;b9d1
	ld a,c			;b9d2
	add a,004h		;b9d3
	ld c,a			;b9d5
	inc hl			;b9d6
	ld a,(de)			;b9d7
	ld (hl),a			;b9d8
	inc de			;b9d9
	inc hl			;b9da
	djnz L_B9AB		;b9db
	ret			;b9dd

; ----------------------------------------------------------------------
; DATOS resto_B9DE: lo apuntan con el banco puesto p12:B9B0 (0xB9DE), p12:B9A5
;   (0xB9F1); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p12:B9B0, p12:B9A5 (25 bytes)
;   0xb9de..0xb9f7  (25 bytes)
DATA_resto_B9DE:
	defb 02ch,033h,03ch,045h,04ch,055h,05ch,06ch,073h,07ch,085h,08ch,09ch,0a3h,0ach,0b5h	; b9de  ,3<ELU\ls|......
	defb 0bch,0c5h,0cch,001h,009h,00bh,001h,009h,00bh	; b9ee  .........

; ======================================================================
; CODIGO 0xb9f7..0xba21  (42 bytes)
; ======================================================================


L_B9F7:
	ld hl,001ffh		;b9f7   ; la demostracion: la fase de la tabla 0xBA3A (una de 6, 0xE219 va dando la vuelta)
	ld (0e209h),hl		;b9fa   ; 0xE209/0xE20A: el mando grabado
	ld hl,0e219h		;b9fd   ; apunta a la demostracion siguiente (1-6)
	ld a,(hl)			;ba00
	ld de,0ba20h		;ba01
	call 04099h		;ba04   ; suma A a DE (DE = DE + A)
	ld a,(de)			;ba07
	ld (0e242h),a		;ba08   ; guarda la fase (1-60)
	inc (hl)			;ba0b
	ld a,(hl)			;ba0c
	cp 007h		;ba0d
	jr c,L_BA13		;ba0f
	ld (hl),001h		;ba11
L_BA13:
	xor a			;ba13   ; cuenta a cero, empieza la fase y la musica
	ld (0e203h),a		;ba14   ; guarda la cuenta de cuadros
	inc a			;ba17
	ld (0e246h),a		;ba18   ; guarda la marca de fase empezada
	call 04368h		;ba1b   ; con los bancos 1-2-3, llama a 0x5C80 y pone el 12 en 0xA000
	jp 04390h		;ba1e

; ----------------------------------------------------------------------
; DATOS sin identificar  0xba21..0xba27  (6 bytes)
DATA_BA21:
	defb 002h,012h,01ah,028h,030h,035h	; ba21

; ======================================================================
; CODIGO 0xba27..0xba7a  (83 bytes)
; ======================================================================


L_BA27:
	ld a,(0e248h)		;ba27   ; un cuadro de la demostracion: la partida con el mando grabado; si muere, se acaba
	and a			;ba2a
	jr nz,L_BA3D		;ba2b
	call 04360h		;ba2d   ; con los bancos 1-2-3, llama a 0x5D63 y pone el 12 en 0xA000
	ld a,(0e280h)		;ba30   ; lee el estado del personaje
	cp 005h		;ba33
	ret nz			;ba35
L_BA36:
	xor a			;ba36
	ld (0e246h),a		;ba37   ; guarda la marca de fase empezada
	jp 041e8h		;ba3a
L_BA3D:
	xor a			;ba3d   ; sale de la pantalla: a la de al lado
	ld (0e24dh),a		;ba3e   ; guarda la marca de borde sin pantalla al otro lado
	call 05bf5h		;ba41   ; pasa a la pantalla de al lado al salir por el borde 0xE248 (1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ld a,(0e24dh)		;ba44   ; lee la marca de borde sin pantalla al otro lado
	and a			;ba47
	ret nz			;ba48
	jp 04371h		;ba49
L_BA4C:
	ld hl,0e20ah		;ba4c   ; el mando de la demostracion: [teclas][cuadros] de la tabla de la piramide (0xBA92)
	dec (hl)			;ba4f
	jr nz,L_BA60		;ba50
	dec hl			;ba52
	inc (hl)			;ba53
	inc hl			;ba54
	call L_BA66		;ba55   ; A = las teclas y C = los cuadros del paso 0xE209 de la piramide
	cp 0ffh		;ba58   ; 0xFF acaba la demostracion
	jr z,L_BA36		;ba5a
	ld hl,0e20ah		;ba5c
	ld (hl),c			;ba5f
L_BA60:
	call L_BA66		;ba60   ; las teclas, como si se pulsaran
	jp 04fc7h		;ba63
L_BA66:
	dec hl			;ba66   ; A = las teclas y C = los cuadros del paso 0xE209 de la piramide
	ld c,(hl)			;ba67
	ld a,(0e241h)		;ba68   ; lee la piramide (1-6)
	ld hl,lba78h		;ba6b
	call 04d4dh		;ba6e   ; HL = la palabra A de la tabla de HL
	ld a,c			;ba71
	add a,a			;ba72
	call 04094h		;ba73   ; suma A a HL (HL = HL + A)
	ld c,(hl)			;ba76
	inc hl			;ba77
L_BA78:
	ld a,(hl)			;ba78
	ret			;ba79

; ----------------------------------------------------------------------
; DATOS sin identificar  0xba7a..0xbc54  (474 bytes)
DATA_BA7A:
	defb 086h,0bah,0bch,0bah,0fah,0bah,040h,0bbh,0a0h,0bbh,0fch,0bbh,02eh,000h,00fh,008h	; ba7a  ......@.........
	defb 010h,000h,00dh,004h,011h,000h,037h,008h,01bh,000h,019h,008h,011h,000h,010h,008h	; ba8a  ......7.........
	defb 00dh,000h,043h,008h,00ch,000h,058h,004h,013h,000h,003h,008h,008h,000h,009h,010h	; ba9a  ..C...X.........
	defb 012h,000h,039h,008h,015h,000h,01fh,004h,047h,000h,010h,004h,00eh,000h,009h,008h	; baaa  ..9.....G.......
	defb 000h,0ffh,029h,000h,090h,004h,01bh,000h,0adh,008h,01ah,000h,003h,008h,00bh,000h	; baba  ..).............
	defb 018h,001h,00ah,000h,019h,008h,008h,000h,023h,001h,006h,000h,004h,004h,00dh,000h	; baca  ........#.......
	defb 00dh,010h,033h,000h,00eh,008h,00ah,000h,01eh,004h,008h,000h,017h,001h,004h,000h	; bada  ..3.............
	defb 00dh,004h,00dh,000h,01eh,010h,02fh,000h,06ch,004h,042h,000h,030h,004h,000h,0ffh	; baea  ....../.l.B.0...
	defb 036h,000h,02dh,004h,008h,014h,01ah,004h,010h,000h,02dh,008h,002h,009h,033h,001h	; bafa  6.-.......-...3.
	defb 001h,009h,072h,008h,014h,000h,032h,002h,011h,000h,01ah,008h,00ah,018h,01eh,008h	; bb0a  ..r...2.........
	defb 006h,000h,032h,004h,007h,000h,008h,008h,00dh,000h,008h,010h,037h,000h,051h,008h	; bb1a  ..2.........7.Q.
	defb 002h,009h,024h,001h,008h,000h,012h,008h,002h,018h,016h,008h,001h,009h,028h,001h	; bb2a  ..$...........(.
	defb 001h,005h,0a0h,004h,000h,0ffh,041h,000h,040h,004h,001h,000h,0a4h,008h,002h,00ah	; bb3a  ......A.@.......
	defb 015h,002h,006h,000h,01eh,004h,001h,006h,00bh,002h,001h,006h,00fh,004h,001h,006h	; bb4a  ................
	defb 00ch,002h,001h,006h,00fh,004h,001h,006h,00ch,002h,002h,006h,00eh,004h,001h,006h	; bb5a  ................
	defb 00bh,002h,002h,006h,015h,004h,001h,006h,00eh,002h,001h,006h,016h,004h,00fh,000h	; bb6a  ................
	defb 013h,004h,007h,000h,001h,004h,003h,000h,002h,004h,01fh,000h,01eh,004h,01dh,000h	; bb7a  ................
	defb 005h,004h,009h,014h,001h,004h,00eh,000h,006h,014h,05eh,004h,013h,000h,037h,008h	; bb8a  ..........^...7.
	defb 002h,018h,012h,010h,000h,0ffh,036h,000h,051h,004h,033h,000h,006h,010h,02eh,000h	; bb9a  ......6.Q.3.....
	defb 084h,004h,00dh,000h,007h,010h,012h,000h,00eh,008h,009h,000h,019h,001h,00ch,008h	; bbaa  ................
	defb 018h,001h,005h,000h,008h,004h,001h,005h,014h,001h,002h,000h,008h,008h,001h,000h	; bbba  ................
	defb 015h,001h,032h,004h,00ah,000h,019h,004h,007h,000h,00dh,010h,022h,000h,012h,004h	; bbca  ..2........."...
	defb 00eh,000h,012h,004h,004h,014h,00dh,004h,004h,014h,007h,004h,00fh,000h,00fh,008h	; bbda  ................
	defb 007h,018h,00dh,008h,01dh,000h,015h,008h,043h,000h,00fh,004h,001h,000h,025h,008h	; bbea  ........C.....%.
	defb 000h,0ffh,040h,000h,032h,008h,004h,000h,013h,004h,00ah,000h,04dh,002h,003h,000h	; bbfa  ..@.2.......M...
	defb 009h,004h,00bh,000h,026h,004h,00bh,014h,01bh,004h,006h,014h,010h,004h,005h,014h	; bc0a  ....&...........
	defb 00dh,004h,01dh,000h,008h,004h,004h,014h,028h,004h,007h,014h,013h,004h,028h,000h	; bc1a  ........(.....(.
	defb 045h,004h,00eh,000h,004h,004h,00eh,000h,01dh,004h,00bh,000h,014h,010h,01ch,000h	; bc2a  E...............
	defb 029h,004h,005h,014h,00bh,004h,005h,014h,019h,004h,003h,014h,022h,004h,006h,014h	; bc3a  )..........."...
	defb 005h,004h,033h,000h,00bh,018h,008h,008h,000h,0ffh	; bc4a  ..3.......

; ======================================================================
; CODIGO 0xbc54..0xbd72  (286 bytes)
; ======================================================================


L_BC54:
	xor a			;bc54   ; las estrellas del final: 0xE910 (32 de 16 bytes) a cero
	ld hl,0e910h		;bc55   ; apunta a en el final, las estrellas (32 x 16 bytes); en la partida, parte del mapa
	ld de,0e911h		;bc58
	ld (hl),a			;bc5b
	ld bc,001ffh		;bc5c
	ldir		;bc5f
	ld (0e901h),a		;bc61
	ld (0e902h),a		;bc64
	inc a			;bc67
	ld (0e900h),a		;bc68   ; guarda el mapa de la fase: 0xC0 bytes por pantalla, 4 casillas por byte
	ret			;bc6b
L_BC6C:
	ld a,(0e902h)		;bc6c   ; cada 2 cuadros sale una estrella nueva del centro (0x70, 0x80)
	or a			;bc6f
	ret nz			;bc70
	ld hl,0e900h		;bc71   ; apunta a el mapa de la fase: 0xC0 bytes por pantalla, 4 casillas por byte
	dec (hl)			;bc74
	ret nz			;bc75
	ld (hl),002h		;bc76
	ld ix,0e910h		;bc78   ; apunta a en el final, las estrellas (32 x 16 bytes); en la partida, parte del mapa
	ld b,020h		;bc7c
L_BC7E:
	ld a,(ix+000h)		;bc7e
	or a			;bc81
	jr z,L_BC8C		;bc82
	ld de,00010h		;bc84
	add ix,de		;bc87
	djnz L_BC7E		;bc89
	ret			;bc8b
L_BC8C:
	xor a			;bc8c   ; su velocidad, de las tablas 0xBDB7 y 0xBD97 por la direccion
	ld (ix+000h),001h		;bc8d
	ld (ix+001h),a		;bc91
	ld (ix+002h),070h		;bc94
	ld (ix+003h),a		;bc98
	ld (ix+004h),080h		;bc9b
	ld hl,0e901h		;bc9f
	inc (hl)			;bca2
	ld a,(hl)			;bca3
	and 00fh		;bca4
	ld b,004h		;bca6
	call L_BD4F		;bca8   ; HL, DE = la velocidad en y y en x de la direccion A, por B
	ld (ix+005h),l		;bcab
	ld (ix+006h),h		;bcae
	ld (ix+007h),e		;bcb1
	ld (ix+008h),d		;bcb4
	ret			;bcb7
L_BCB8:
	call L_BC6C		;bcb8   ; un cuadro de las estrellas
	call L_BD16		;bcbb   ; los sprites fuera, de color 5
	call L_BCC3		;bcbe
	jr L_BD24		;bcc1
L_BCC3:
	ld ix,0e910h		;bcc3   ; apunta a en el final, las estrellas (32 x 16 bytes); en la partida, parte del mapa
	ld b,020h		;bcc7
L_BCC9:
	ld a,(ix+000h)		;bcc9
	or a			;bccc
	push bc			;bccd
	call nz,L_BCDA		;bcce   ; una estrella se mueve; al salir de la pantalla se quita
	pop bc			;bcd1
	ld de,00010h		;bcd2
	add ix,de		;bcd5
	djnz L_BCC9		;bcd7
	ret			;bcd9
L_BCDA:
	ld e,(ix+001h)		;bcda   ; una estrella se mueve; al salir de la pantalla se quita
	ld d,(ix+002h)		;bcdd
	ld l,(ix+005h)		;bce0
	ld h,(ix+006h)		;bce3
	add hl,de			;bce6
	ld (ix+001h),l		;bce7
	ld (ix+002h),h		;bcea
	ld e,(ix+003h)		;bced
	ld d,(ix+004h)		;bcf0
	ld l,(ix+007h)		;bcf3
	ld h,(ix+008h)		;bcf6
	add hl,de			;bcf9
	ld (ix+003h),l		;bcfa
	ld (ix+004h),h		;bcfd
	ld a,(ix+002h)		;bd00
	add a,010h		;bd03
	cp 020h		;bd05
	jr c,L_BD11		;bd07
	ld a,(ix+004h)		;bd09
	add a,010h		;bd0c
	cp 020h		;bd0e
	ret nc			;bd10
L_BD11:
	ld (ix+000h),000h		;bd11
	ret			;bd15
L_BD16:
	ld hl,0e800h		;bd16   ; los sprites fuera, de color 5
	ld de,0e801h		;bd19
	ld (hl),0e0h		;bd1c
	ld bc,0007fh		;bd1e
	ldir		;bd21
	ret			;bd23
L_BD24:
	ld ix,0e910h		;bd24   ; los sprites de las estrellas (dibujo 0xD0)
	ld hl,0e800h		;bd28   ; apunta a los atributos de los sprites (y, x, dibujo, color); al cargar graficos, su bufer
	ld b,020h		;bd2b
L_BD2D:
	ld a,(ix+000h)		;bd2d
	or a			;bd30
	push bc			;bd31
	call nz,L_BD3E		;bd32
	pop bc			;bd35
	ld de,00010h		;bd36
	add ix,de		;bd39
	djnz L_BD2D		;bd3b
	ret			;bd3d
L_BD3E:
	ld a,(ix+002h)		;bd3e
	ld (hl),a			;bd41
	inc hl			;bd42
	ld a,(ix+004h)		;bd43
	ld (hl),a			;bd46
	inc hl			;bd47
	ld (hl),0d0h		;bd48
	inc hl			;bd4a
	ld (hl),00fh		;bd4b
	inc hl			;bd4d
	ret			;bd4e
L_BD4F:
	push af			;bd4f   ; HL, DE = la velocidad en y y en x de la direccion A, por B
	ld hl,0bd92h		;bd50
	call 04d4dh		;bd53   ; HL = la palabra A de la tabla de HL
	ld e,l			;bd56
	ld d,h			;bd57
	ld hl,00000h		;bd58
	push bc			;bd5b
L_BD5C:
	add hl,de			;bd5c
	djnz L_BD5C		;bd5d
	pop bc			;bd5f
	pop af			;bd60
	push hl			;bd61
	ld hl,0bd72h		;bd62
	call 04d4dh		;bd65   ; HL = la palabra A de la tabla de HL
	ld e,l			;bd68
	ld d,h			;bd69
	ld hl,00000h		;bd6a
L_BD6D:
	add hl,de			;bd6d
	djnz L_BD6D		;bd6e
	pop de			;bd70
	ret			;bd71

; ----------------------------------------------------------------------
; DATOS resto_BD72: lo apuntan con el banco puesto p12:BD62 (0xBD72), p12:BD50
;   (0xBD92); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p12:BD62, p12:BD50 (64 bytes)
;   0xbd72..0xbdb2  (64 bytes)
DATA_resto_BD72:
	defb 000h,000h,023h,0ffh,080h,000h,04bh,0ffh,080h,0ffh,000h,001h,080h,000h,023h,0ffh	; bd72  ..#...K.......#.
	defb 0ddh,000h,04bh,0ffh,080h,0ffh,000h,000h,0b5h,000h,000h,0ffh,0b5h,000h,0ddh,000h	; bd82  ..K.............
	defb 000h,001h,080h,0ffh,023h,0ffh,0b5h,000h,023h,0ffh,000h,000h,0ddh,000h,080h,000h	; bd92  ....#...#.......
	defb 080h,0ffh,04bh,0ffh,0ddh,000h,000h,0ffh,0b5h,000h,000h,000h,04bh,0ffh,080h,000h	; bda2  ..K.........K...

; ======================================================================
; CODIGO 0xbdb2..0xbddc  (42 bytes)
; ======================================================================


L_BDB2:
	ld a,(0edd8h)		;bdb2
	add a,a			;bdb5
	add a,a			;bdb6
	ld b,a			;bdb7
	add a,a			;bdb8
	add a,a			;bdb9
	add a,b			;bdba
	ld hl,0bddch		;bdbb
	call 04094h		;bdbe   ; suma A a HL (HL = HL + A)
	ld de,0e800h		;bdc1   ; apunta a los atributos de los sprites (y, x, dibujo, color); al cargar graficos, su bufer
	ld bc,00014h		;bdc4
	ldir		;bdc7
L_BDC9:
	ld hl,0e820h		;bdc9
	ld a,(0edcbh)		;bdcc
	ld (hl),a			;bdcf
	inc hl			;bdd0
	ld a,(0edcch)		;bdd1
	ld (hl),a			;bdd4
	inc hl			;bdd5
	ld (hl),0d0h		;bdd6
	inc hl			;bdd8
	ld (hl),009h		;bdd9
	ret			;bddb

; ----------------------------------------------------------------------
; DATOS resto_BDDC: lo apuntan con el banco puesto p12:BDBB (0xBDDC), p12:BE12
;   (0xBE04), p12:BE50 (0xBE0B); el tamano es lo que hay hasta lo siguiente,
;   no sale de recorrerlo; lo leen p12:BDBB, p12:BE12, p12:BE50 (54 bytes)
;   0xbddc..0xbe12  (54 bytes)
DATA_resto_BDDC:
	defb 078h,0b0h,004h,007h,078h,0b0h,008h,001h,088h,0b0h,00ch,007h,088h,0b0h,010h,00bh	; bddc  x...x...........
	defb 088h,0b0h,014h,001h,078h,0b0h,018h,007h,078h,0b0h,01ch,001h,088h,0b0h,020h,007h	; bdec  ....x...x..... .
	defb 088h,0b0h,024h,00bh,088h,0b0h,028h,001h,048h,070h,0f3h,0ebh,0e9h,0f0h,0ffh,048h	; bdfc  ..$...(.Hp.....H
	defb 070h,0e6h,0e9h,0eeh,0e4h,0ffh	; be0c

; ======================================================================
; CODIGO 0xbe12..0xbeab  (153 bytes)
; ======================================================================


L_BE12:
	ld hl,0be04h		;be12   ; carga de cinta: el letrero de buscar y el nombre
	call 04f0bh		;be15   ; pinta un letrero: [D][E] y caracteres; 0xFE trae otra posicion; 0xFF acaba
	call L_BE90		;be18   ; pinta el nombre de 0xEE50
L_BE1B:
	call 000e1h		;be1b   ; BIOS TAPION - Reads the header block after turning the cassette motor on | TAPION: la cabecera de la cinta
	jp c,L_BE99		;be1e
L_BE21:
	ld c,010h		;be21   ; 16 bytes 0xAA seguidos
L_BE23:
	exx			;be23
	call 000e4h		;be24   ; BIOS TAPIN - Reads data from the tape
	exx			;be27
	jp c,L_BE99		;be28
	cp 0aah		;be2b
	jr nz,L_BE21		;be2d
	dec c			;be2f
	jr nz,L_BE23		;be30
	ld hl,0ee50h		;be32   ; el nombre de la fase (8 letras)
	ld bc,00008h		;be35
	call L_BEB8		;be38   ; lee BC bytes de la cinta a HL, sumandolos en D
	jr c,L_BE99		;be3b
	call 000f0h		;be3d   ; BIOS TAPOOF - Stops writing on the tape
	ld hl,0ee50h		;be40   ; si no es el que se busca, otra vez
	ld de,0e270h		;be43   ; apunta a el nombre de la fase del editor (11 letras)
	ld b,008h		;be46
L_BE48:
	ld a,(de)			;be48
	cp (hl)			;be49
	jr nz,L_BE12		;be4a
	inc de			;be4c
	inc hl			;be4d
	djnz L_BE48		;be4e
	ld hl,0be0bh		;be50   ; encontrado: el letrero y los seis trozos
	call 04f0bh		;be53   ; pinta un letrero: [D][E] y caracteres; 0xFE trae otra posicion; 0xFF acaba
	call L_BE90		;be56   ; pinta el nombre de 0xEE50
	call 000e1h		;be59   ; BIOS TAPION - Reads the header block after turning the cassette motor on
	jr c,L_BE99		;be5c
	ld ix,06a6eh		;be5e
	ld d,000h		;be62
	ld b,006h		;be64
L_BE66:
	push bc			;be66
	ld l,(ix+000h)		;be67
	ld h,(ix+001h)		;be6a
	ld c,(ix+002h)		;be6d
	ld b,(ix+003h)		;be70
	call L_BEB8		;be73   ; lee BC bytes de la cinta a HL, sumandolos en D
	pop bc			;be76
	jr c,L_BE99		;be77
	inc ix		;be79
	inc ix		;be7b
	inc ix		;be7d
	inc ix		;be7f
	djnz L_BE66		;be81
	exx			;be83   ; la suma tiene que dar el ultimo byte
	call 000e4h		;be84   ; BIOS TAPIN - Reads data from the tape
	exx			;be87
	jr c,L_BE99		;be88
	cp d			;be8a
	jr nz,L_BE99		;be8b
	jp 000f0h		;be8d   ; BIOS TAPOOF - Stops writing on the tape
L_BE90:
	ld hl,0ee50h		;be90   ; pinta el nombre de 0xEE50
	ld de,07070h		;be93
	jp 08624h		;be96
L_BE99:
	call 000f0h		;be99   ; BIOS TAPOOF - Stops writing on the tape | error: el letrero de 0xBF0E y 0xE27F = 2
	call 04ec7h		;be9c
	ld hl,0beabh		;be9f
	call 04f0bh		;bea2   ; pinta un letrero: [D][E] y caracteres; 0xFE trae otra posicion; 0xFF acaba
	ld a,002h		;bea5
	ld (0e27fh),a		;bea7   ; guarda el resultado de grabar o cargar (0 bien, 2 error)
	ret			;beaa

; ----------------------------------------------------------------------
; DATOS resto_BEAB: lo apuntan con el banco puesto p12:BE9F (0xBEAB); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p12:BE9F (13 bytes)
;   0xbeab..0xbeb8  (13 bytes)
DATA_resto_BEAB:
	defb 050h,060h,0ech,0efh,0e1h,0e4h,000h,0e5h,0f2h,0f2h,0efh,0f2h,0ffh	; beab  P`...........

; ======================================================================
; CODIGO 0xbeb8..0xbf31  (121 bytes)
; ======================================================================


L_BEB8:
	exx			;beb8   ; lee BC bytes de la cinta a HL, sumandolos en D
	call 000e4h		;beb9   ; BIOS TAPIN - Reads data from the tape
	exx			;bebc
	ret c			;bebd
	ld (hl),a			;bebe
	add a,d			;bebf
	ld d,a			;bec0
	inc hl			;bec1
	dec bc			;bec2
	ld a,b			;bec3
	or c			;bec4
	jr nz,L_BEB8		;bec5
	ret			;bec7
L_BEC8:
	ld a,0ffh		;bec8   ; graba en cinta: TAPOON con la cabecera larga
	call 000eah		;beca   ; BIOS TAPOON - Turns on the cassette motor and writes the header
	jp c,L_BF1F		;becd
	ld b,010h		;bed0
L_BED2:
	ld a,0aah		;bed2   ; 16 bytes 0xAA
	exx			;bed4
	call 000edh		;bed5   ; BIOS TAPOUT - Writes data on the tape
	exx			;bed8
	jr c,L_BF1F		;bed9
	djnz L_BED2		;bedb
	ld hl,0e270h		;bedd   ; el nombre (8 letras)
	ld bc,00008h		;bee0
	call L_BF3E		;bee3   ; escribe BC bytes de HL en la cinta, sumandolos en D
	jr c,L_BF1F		;bee6
	call 000f0h		;bee8   ; BIOS TAPOOF - Stops writing on the tape
	xor a			;beeb   ; otra cabecera, corta
	call 000eah		;beec   ; BIOS TAPOON - Turns on the cassette motor and writes the header
	jr c,L_BF1F		;beef
	ld ix,06a6eh		;bef1   ; los seis trozos, sumando
	ld d,000h		;bef5
	ld b,006h		;bef7
L_BEF9:
	push bc			;bef9
	ld l,(ix+000h)		;befa
	ld h,(ix+001h)		;befd
	ld c,(ix+002h)		;bf00
	ld b,(ix+003h)		;bf03
	call L_BF3E		;bf06   ; escribe BC bytes de HL en la cinta, sumandolos en D
	pop bc			;bf09
	jr c,L_BF1F		;bf0a
	inc ix		;bf0c
	inc ix		;bf0e
	inc ix		;bf10
	inc ix		;bf12
	djnz L_BEF9		;bf14
	ld a,d			;bf16   ; y la suma
	call 000edh		;bf17   ; BIOS TAPOUT - Writes data on the tape
	jr c,L_BF1F		;bf1a
	jp 000f0h		;bf1c   ; BIOS TAPOOF - Stops writing on the tape
L_BF1F:
	call 000f0h		;bf1f   ; BIOS TAPOOF - Stops writing on the tape | error: el letrero de 0xBF94 y 0xE27F = 2
	call 04ec7h		;bf22
	ld hl,0bf31h		;bf25
	call 04f0bh		;bf28   ; pinta un letrero: [D][E] y caracteres; 0xFE trae otra posicion; 0xFF acaba
	ld a,002h		;bf2b
	ld (0e27fh),a		;bf2d   ; guarda el resultado de grabar o cargar (0 bien, 2 error)
	ret			;bf30

; ----------------------------------------------------------------------
; DATOS resto_BF31: lo apuntan con el banco puesto p12:BF25 (0xBF31); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p12:BF25 (13 bytes)
;   0xbf31..0xbf3e  (13 bytes)
DATA_resto_BF31:
	defb 050h,060h,0f3h,0e1h,0f6h,0e5h,000h,0e5h,0f2h,0f2h,0efh,0f2h,0ffh	; bf31  P`...........

; ======================================================================
; CODIGO 0xbf3e..0xbf50  (18 bytes)
; ======================================================================


L_BF3E:
	ld a,(hl)			;bf3e   ; escribe BC bytes de HL en la cinta, sumandolos en D
	ld e,a			;bf3f
	inc hl			;bf40
	exx			;bf41
	call 000edh		;bf42   ; BIOS TAPOUT - Writes data on the tape
	exx			;bf45
	ret c			;bf46
	ld a,e			;bf47
	add a,d			;bf48
	ld d,a			;bf49
	dec bc			;bf4a
	ld a,b			;bf4b
	or c			;bf4c
	jr nz,L_BF3E		;bf4d
	ret			;bf4f

; ----------------------------------------------------------------------
; DATOS relleno_ff: 176 bytes a 0xFF hasta el final del banco: relleno; lo
;   leen nadie (176 bytes)
;   0xbf50..0xc000  (176 bytes)
DATA_relleno_ff:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf50  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf60  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf70  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf80  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf90  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfa0  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfb0  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfc0  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfd0  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfe0  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bff0  ................
