; ==========================================================================
; KING'S VALLEY II - Konami (1988) - MSX2 - MegaROM RC-761 de 128 KB (Konami SCC) - banco 12 (se ejecuta en 0xa000)
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
lba92h:	equ 0x0ba92

; ----------------------------------------------------------------------
; DATOS mapa_59_cola: El mapa de la fase en rachas de casillas de 2 bits de la
;   fase 59 (sigue del banco 11); lo leen p00:43DD (289 bytes)
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
;   60; lo leen p00:43DD (578 bytes)
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
;   la fase 1; lo leen p00:4434 (7 bytes)
;   0xa363..0xa36a  (7 bytes)
DATA_casillas_01:
	defb 026h,003h,0a6h,041h,022h,05bh,000h	; a363

; ----------------------------------------------------------------------
; DATOS casillas_02: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 2; lo leen p00:4434 (1 bytes)
;   0xa36a..0xa36b  (1 bytes)
DATA_casillas_02:
	defb 000h	; a36a

; ----------------------------------------------------------------------
; DATOS casillas_03: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 3; lo leen p00:4434 (12 bytes)
;   0xa36b..0xa377  (12 bytes)
DATA_casillas_03:
	defb 050h,018h,090h,01bh,0ffh,04ah,01ah,005h,02dh,0c6h,042h,000h	; a36b  P....J..-.B.

; ----------------------------------------------------------------------
; DATOS casillas_04: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 4; lo leen p00:4434 (30 bytes)
;   0xa377..0xa395  (30 bytes)
DATA_casillas_04:
	defb 007h,001h,0c7h,002h,048h,01ch,088h,01fh,007h,03dh,0c7h,03eh,082h,05bh,0ffh,087h	; a377  ....H....=.>.[..
	defb 003h,088h,01ch,048h,01fh,047h,03ch,087h,03fh,002h,059h,0c2h,05ah,000h	; a387  ...H.G<.?.Y.Z.

; ----------------------------------------------------------------------
; DATOS casillas_05: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 5; lo leen p00:4434 (8 bytes)
;   0xa395..0xa39d  (8 bytes)
DATA_casillas_05:
	defb 034h,00ch,0ffh,08bh,01ah,0b4h,00fh,000h	; a395  4.......

; ----------------------------------------------------------------------
; DATOS casillas_06: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 6; lo leen p00:4434 (6 bytes)
;   0xa39d..0xa3a3  (6 bytes)
DATA_casillas_06:
	defb 095h,013h,0ffh,096h,003h,000h	; a39d

; ----------------------------------------------------------------------
; DATOS casillas_07: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 7; lo leen p00:4434 (20 bytes)
;   0xa3a3..0xa3b7  (20 bytes)
DATA_casillas_07:
	defb 0c5h,022h,005h,037h,0c5h,04ah,001h,05fh,0ffh,003h,003h,0c5h,00eh,005h,023h,0c5h	; a3a3  .".7.J._......#.
	defb 036h,005h,04bh,000h	; a3b3

; ----------------------------------------------------------------------
; DATOS casillas_08: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 8; lo leen p00:4434 (35 bytes)
;   0xa3b7..0xa3da  (35 bytes)
DATA_casillas_08:
	defb 005h,04dh,0e5h,04dh,0e5h,04eh,0a1h,05fh,0ffh,0c5h,011h,045h,025h,0c5h,038h,0ffh	; a3b7  .M.M.N._...E%.8.
	defb 004h,001h,0eah,001h,0e4h,002h,0b7h,003h,0a4h,012h,0ech,022h,06ah,028h,023h,053h	; a3c7  ..........."j(#S
	defb 023h,050h,000h	; a3d7

; ----------------------------------------------------------------------
; DATOS casillas_09: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 9; lo leen p00:4434 (3 bytes)
;   0xa3da..0xa3dd  (3 bytes)
DATA_casillas_09:
	defb 092h,017h,000h	; a3da

; ----------------------------------------------------------------------
; DATOS casillas_10: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 10; lo leen p00:4434 (1 bytes)
;   0xa3dd..0xa3de  (1 bytes)
DATA_casillas_10:
	defb 000h	; a3dd

; ----------------------------------------------------------------------
; DATOS columnas_01: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fases 1, 2, 3, 4, 5, 6, 7, 8; lo leen p00:4434 (1 bytes)
;   0xa3de..0xa3df  (1 bytes)
DATA_columnas_01:
	defb 000h	; a3de

; ----------------------------------------------------------------------
; DATOS columnas_09: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 9; lo leen p00:4434 (3 bytes)
;   0xa3df..0xa3e2  (3 bytes)
DATA_columnas_09:
	defb 086h,03eh,000h	; a3df

; ----------------------------------------------------------------------
; DATOS columnas_10: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 10; lo leen p00:4434 (4 bytes)
;   0xa3e2..0xa3e6  (4 bytes)
DATA_columnas_10:
	defb 0ffh,06eh,014h,000h	; a3e2

; ----------------------------------------------------------------------
; DATOS casillas_11: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 11; lo leen p00:4434 (13 bytes)
;   0xa3e6..0xa3f3  (13 bytes)
DATA_casillas_11:
	defb 0a6h,018h,028h,021h,024h,023h,0a4h,032h,0a9h,039h,026h,042h,000h	; a3e6  ..(!$#.2.9&B.

; ----------------------------------------------------------------------
; DATOS casillas_12: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 12; lo leen p00:4434 (1 bytes)
;   0xa3f3..0xa3f4  (1 bytes)
DATA_casillas_12:
	defb 000h	; a3f3

; ----------------------------------------------------------------------
; DATOS casillas_13: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 13; lo leen p00:4434 (25 bytes)
;   0xa3f4..0xa40d  (25 bytes)
DATA_casillas_13:
	defb 0d2h,01ah,082h,058h,082h,05bh,0ffh,08eh,000h,0c6h,002h,098h,003h,084h,050h,004h	; a3f4  ...X.[........P.
	defb 052h,0ffh,090h,000h,007h,002h,094h,003h,000h	; a404  R........

; ----------------------------------------------------------------------
; DATOS casillas_14: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 14; lo leen p00:4434 (51 bytes)
;   0xa40d..0xa440  (51 bytes)
DATA_casillas_14:
	defb 044h,019h,0c4h,019h,044h,01bh,0c6h,028h,046h,02ah,046h,040h,046h,041h,0c8h,042h	; a40d  D...D..(F*F@FA.B
	defb 082h,058h,0c2h,059h,0ffh,08fh,018h,04fh,01bh,047h,039h,087h,03ah,0ffh,086h,000h	; a41d  .X.Y...O.G9.:...
	defb 0c6h,001h,0c6h,002h,046h,019h,04ch,01ah,048h,01bh,046h,030h,0c4h,039h,0c6h,042h	; a42d  ....F.L.H.F0.9.B
	defb 0c4h,048h,000h	; a43d

; ----------------------------------------------------------------------
; DATOS casillas_15: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 15; lo leen p00:4434 (25 bytes)
;   0xa440..0xa459  (25 bytes)
DATA_casillas_15:
	defb 0a9h,015h,0a9h,017h,0a9h,038h,0a9h,03ah,0ffh,0a9h,021h,0a9h,023h,0a9h,02ch,0a9h	; a440  .....8.:..!.#.,.
	defb 02eh,0ffh,026h,014h,0b2h,017h,029h,038h,000h	; a450  ..&...)8.

; ----------------------------------------------------------------------
; DATOS casillas_16: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 16; lo leen p00:4434 (12 bytes)
;   0xa459..0xa465  (12 bytes)
DATA_casillas_16:
	defb 0a1h,05fh,0ffh,0a4h,003h,046h,029h,086h,039h,044h,042h,000h	; a459  ._...F).9DB.

; ----------------------------------------------------------------------
; DATOS casillas_17: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 17; lo leen p00:4434 (5 bytes)
;   0xa465..0xa46a  (5 bytes)
DATA_casillas_17:
	defb 0ffh,0ffh,0b2h,017h,000h	; a465

; ----------------------------------------------------------------------
; DATOS casillas_18: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 18; lo leen p00:4434 (33 bytes)
;   0xa46a..0xa48b  (33 bytes)
DATA_casillas_18:
	defb 005h,00fh,069h,01eh,007h,033h,084h,04eh,0ffh,0a4h,020h,006h,029h,0c6h,02ah,0a3h	; a46a  ..i..3.N.. .).*.
	defb 040h,0ffh,045h,00ch,064h,011h,024h,021h,0a8h,023h,0c7h,031h,047h,043h,004h,04dh	; a47a  @.E.d.$!.#.1GC.M
	defb 000h	; a48a

; ----------------------------------------------------------------------
; DATOS casillas_19: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 19; lo leen p00:4434 (7 bytes)
;   0xa48b..0xa492  (7 bytes)
DATA_casillas_19:
	defb 066h,002h,085h,02ah,062h,05ah,000h	; a48b

; ----------------------------------------------------------------------
; DATOS casillas_20: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 20; lo leen p00:4434 (30 bytes)
;   0xa492..0xa4b0  (30 bytes)
DATA_casillas_20:
	defb 0a4h,013h,064h,023h,0a4h,033h,064h,043h,0a4h,053h,0c4h,052h,0ffh,0c4h,002h,0a4h	; a492  ..d#.3dC.S.R....
	defb 003h,064h,013h,0a4h,023h,066h,027h,0a6h,037h,064h,04fh,024h,03fh,000h	; a4a2  .d..#f'.7dO$?.

; ----------------------------------------------------------------------
; DATOS columnas_12: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 12; se solapan 2 bloques: (columnas_11 A4B2-A4B3); lo
;   leen p00:4434 (3 bytes)
;   0xa4b0..0xa4b3  (3 bytes)
DATA_columnas_12:
	defb 086h,019h,000h	; a4b0

; ----------------------------------------------------------------------
; DATOS columnas_16: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 16; lo leen p00:4434 (9 bytes)
;   0xa4b3..0xa4bc  (9 bytes)
DATA_columnas_16:
	defb 084h,015h,004h,026h,084h,036h,004h,047h,000h	; a4b3  ...&.6.G.

; ----------------------------------------------------------------------
; DATOS columnas_17: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 17; lo leen p00:4434 (25 bytes)
;   0xa4bc..0xa4d5  (25 bytes)
DATA_columnas_17:
	defb 0e5h,04ah,0ffh,02bh,01ch,045h,049h,0a5h,04ah,0ffh,066h,014h,0edh,014h,044h,027h	; a4bc  .J.+.EI.J.f...D'
	defb 005h,037h,045h,048h,005h,04ah,0c5h,04ah,000h	; a4cc  .7EH.J.J.

; ----------------------------------------------------------------------
; DATOS columnas_18: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 18; se solapan 2 bloques: (columnas_19 A4D7-A4D8); lo
;   leen p00:4434 (3 bytes)
;   0xa4d5..0xa4d8  (3 bytes)
DATA_columnas_18:
	defb 028h,03dh,000h	; a4d5

; ----------------------------------------------------------------------
; DATOS casillas_21: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 21; lo leen p00:4434 (15 bytes)
;   0xa4d8..0xa4e7  (15 bytes)
DATA_casillas_21:
	defb 032h,014h,0abh,017h,024h,021h,0a4h,022h,0a3h,042h,003h,04eh,063h,016h,000h	; a4d8  2...$!.".B.Nc..

; ----------------------------------------------------------------------
; DATOS casillas_22: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 22; lo leen p00:4434 (31 bytes)
;   0xa4e7..0xa506  (31 bytes)
DATA_casillas_22:
	defb 046h,010h,042h,027h,047h,029h,002h,037h,0c6h,03eh,0ffh,043h,010h,086h,044h,006h	; a4e7  F.B'G).7.>.C..D.
	defb 045h,0ffh,089h,010h,046h,013h,0c5h,021h,045h,035h,047h,043h,005h,04ah,000h	; a4f7  E...F..!E5GC.J.

; ----------------------------------------------------------------------
; DATOS casillas_23: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 23; lo leen p00:4434 (64 bytes)
;   0xa506..0xa546  (64 bytes)
DATA_casillas_23:
	defb 037h,004h,0c4h,010h,0ceh,021h,04eh,023h,0c6h,030h,046h,032h,042h,05ah,0ffh,0c8h	; a506  7....!N#.0F2BZ..
	defb 011h,0b7h,007h,0c4h,028h,046h,029h,044h,032h,044h,038h,0c4h,051h,042h,058h,0ffh	; a516  ....(F)D2D8.QBX.
	defb 037h,000h,04eh,002h,0d0h,011h,04ch,01bh,0c6h,020h,0c5h,048h,085h,04bh,0ffh,0b7h	; a526  7.N...L.. .H.K..
	defb 003h,048h,000h,0c6h,001h,044h,011h,044h,012h,004h,021h,08dh,028h,087h,042h,000h	; a536  .H...D.D..!.(.B.

; ----------------------------------------------------------------------
; DATOS casillas_24: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 24; lo leen p00:4434 (46 bytes)
;   0xa546..0xa574  (46 bytes)
DATA_casillas_24:
	defb 048h,013h,044h,021h,0c4h,031h,084h,042h,0c4h,050h,0ffh,0c4h,000h,0c8h,022h,044h	; a546  H.D!.1.B.P...."D
	defb 031h,0c4h,040h,044h,043h,084h,051h,0c4h,052h,0ffh,0c7h,020h,08eh,023h,004h,02fh	; a556  1.@DC.Q.R.. .#./
	defb 0ffh,083h,001h,0c3h,002h,084h,01dh,048h,03fh,024h,02ch,084h,04eh,000h	; a566  .......H?$,.N.

; ----------------------------------------------------------------------
; DATOS casillas_25: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 25; lo leen p00:4434 (35 bytes)
;   0xa574..0xa597  (35 bytes)
DATA_casillas_25:
	defb 0e2h,016h,022h,01fh,0a2h,02fh,022h,02fh,0e2h,036h,062h,037h,0a2h,03eh,022h,03fh	; a574  .."../"/.6b7.>"?
	defb 0a2h,03fh,062h,046h,0e2h,046h,062h,047h,022h,044h,062h,04ch,0a2h,04fh,022h,054h	; a584  .?bF.FbG"DbL.O"T
	defb 062h,027h,000h	; a594

; ----------------------------------------------------------------------
; DATOS casillas_26: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 26; lo leen p00:4434 (21 bytes)
;   0xa597..0xa5ac  (21 bytes)
DATA_casillas_26:
	defb 051h,014h,0cbh,015h,0ffh,045h,034h,02dh,015h,0c5h,048h,0ffh,085h,014h,00eh,015h	; a597  Q....E4-..H.....
	defb 08ch,017h,006h,047h,000h	; a5a7

; ----------------------------------------------------------------------
; DATOS casillas_27: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 27; lo leen p00:4434 (41 bytes)
;   0xa5ac..0xa5d5  (41 bytes)
DATA_casillas_27:
	defb 065h,01ch,083h,025h,044h,033h,0e3h,040h,0ffh,084h,010h,00ch,003h,0c5h,01dh,0abh	; a5ac  e..%D3.@........
	defb 030h,067h,031h,003h,041h,0a4h,04fh,001h,05dh,0ffh,004h,001h,084h,013h,084h,020h	; a5bc  0g1.A.O.]......
	defb 044h,021h,087h,032h,004h,04dh,001h,05fh,000h	; a5cc  D!.2.M._.

; ----------------------------------------------------------------------
; DATOS casillas_28: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 28; lo leen p00:4434 (33 bytes)
;   0xa5d5..0xa5f6  (33 bytes)
DATA_casillas_28:
	defb 086h,018h,0c6h,01ah,082h,032h,042h,03ah,082h,042h,046h,048h,006h,04ah,082h,05bh	; a5d5  .....2B:.BFH.J.[
	defb 0ffh,0d0h,019h,0ffh,045h,000h,005h,002h,085h,003h,089h,014h,08ah,033h,007h,017h	; a5e5  ....E........3..
	defb 000h	; a5f5

; ----------------------------------------------------------------------
; DATOS casillas_29: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 29; lo leen p00:4434 (5 bytes)
;   0xa5f6..0xa5fb  (5 bytes)
DATA_casillas_29:
	defb 023h,018h,003h,01bh,000h	; a5f6

; ----------------------------------------------------------------------
; DATOS casillas_30: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 30; lo leen p00:4434 (24 bytes)
;   0xa5fb..0xa613  (24 bytes)
DATA_casillas_30:
	defb 034h,00ch,084h,00eh,084h,02ch,024h,04dh,084h,04fh,0ffh,0a4h,01fh,0a4h,02dh,004h	; a5fb  4....,$M.O....-.
	defb 02fh,0a4h,03ch,004h,03eh,0a4h,04fh,000h	; a60b  /.<.>.O.

; ----------------------------------------------------------------------
; DATOS columnas_21: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 21; lo leen p00:4434 (1 bytes)
;   0xa613..0xa614  (1 bytes)
DATA_columnas_21:
	defb 000h	; a613

; ----------------------------------------------------------------------
; DATOS columnas_22: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 22; se solapan 2 bloques: (columnas_23 A617-A618); lo
;   leen p00:4434 (4 bytes)
;   0xa614..0xa618  (4 bytes)
DATA_columnas_22:
	defb 0ffh,06ah,02fh,000h	; a614

; ----------------------------------------------------------------------
; DATOS columnas_24: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 24; se solapan 2 bloques: (columnas_25 A61D-A61E); lo
;   leen p00:4434 (6 bytes)
;   0xa618..0xa61e  (6 bytes)
DATA_columnas_24:
	defb 0ffh,0ffh,0ffh,0c6h,044h,000h	; a618

; ----------------------------------------------------------------------
; DATOS columnas_27: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 27; lo leen p00:4434 (7 bytes)
;   0xa61e..0xa625  (7 bytes)
DATA_columnas_27:
	defb 027h,040h,0ffh,0ffh,0a4h,033h,000h	; a61e

; ----------------------------------------------------------------------
; DATOS columnas_28: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 28; lo leen p00:4434 (5 bytes)
;   0xa625..0xa62a  (5 bytes)
DATA_columnas_28:
	defb 0ffh,0ffh,046h,038h,000h	; a625

; ----------------------------------------------------------------------
; DATOS columnas_29: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 29; se solapan 2 bloques: (columnas_30 A62C-A62D); lo
;   leen p00:4434 (3 bytes)
;   0xa62a..0xa62d  (3 bytes)
DATA_columnas_29:
	defb 0abh,01bh,000h	; a62a

; ----------------------------------------------------------------------
; DATOS casillas_31: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 31; lo leen p00:4434 (31 bytes)
;   0xa62d..0xa64c  (31 bytes)
DATA_casillas_31:
	defb 024h,01ch,026h,015h,0e2h,015h,0a2h,016h,0a4h,017h,0a2h,024h,062h,02ch,0e2h,02ch	; a62d  $.&........$b,.,
	defb 022h,035h,062h,03dh,0a2h,045h,0e4h,03eh,024h,02fh,064h,01fh,0a4h,04fh,000h	; a63d  "5b=.E.>$/d..O.

; ----------------------------------------------------------------------
; DATOS casillas_32: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 32; lo leen p00:4434 (33 bytes)
;   0xa64c..0xa66d  (33 bytes)
DATA_casillas_32:
	defb 003h,003h,004h,019h,0c4h,01ah,0c4h,03ah,021h,05ch,0ffh,024h,000h,02ah,038h,0cah	; a64c  .......:!\.$.*8.
	defb 010h,0d3h,011h,0c9h,012h,0b4h,013h,0ffh,026h,000h,0a6h,003h,00ch,01ah,005h,04fh	; a65c  ........&......O
	defb 000h	; a66c

; ----------------------------------------------------------------------
; DATOS casillas_33: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 33; lo leen p00:4434 (27 bytes)
;   0xa66d..0xa688  (27 bytes)
DATA_casillas_33:
	defb 087h,002h,0c6h,01ch,086h,034h,08bh,036h,0ffh,085h,001h,0cch,01ch,046h,037h,004h	; a66d  .....4.6.....F7.
	defb 04eh,081h,05dh,046h,01eh,0ffh,00ch,01eh,006h,01fh,000h	; a67d  N.]F.......

; ----------------------------------------------------------------------
; DATOS casillas_34: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 34; lo leen p00:4434 (68 bytes)
;   0xa688..0xa6cc  (68 bytes)
DATA_casillas_34:
	defb 037h,004h,086h,048h,0c7h,02ch,0c5h,035h,006h,026h,047h,012h,0ffh,066h,034h,0b3h	; a688  7..H.,.5.&G..f4.
	defb 013h,001h,05fh,0ffh,037h,000h,08ah,000h,0c2h,020h,042h,021h,042h,022h,0c2h,022h	; a698  .._.7.... B!B"."
	defb 002h,029h,082h,029h,082h,02ah,0c2h,030h,042h,031h,042h,032h,0c2h,032h,002h,039h	; a6a8  .).).*.0B1B2.2.9
	defb 082h,039h,082h,03ah,044h,042h,083h,052h,0ffh,048h,014h,08ah,034h,0c6h,00eh,003h	; a6b8  .9.:DB.R.H..4...
	defb 003h,082h,00ch,000h	; a6c8

; ----------------------------------------------------------------------
; DATOS casillas_35: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 35; lo leen p00:4434 (8 bytes)
;   0xa6cc..0xa6d4  (8 bytes)
DATA_casillas_35:
	defb 0ffh,0c1h,05eh,0ffh,0ffh,0c5h,002h,000h	; a6cc  ..^.....

; ----------------------------------------------------------------------
; DATOS casillas_36: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 36; lo leen p00:4434 (46 bytes)
;   0xa6d4..0xa702  (46 bytes)
DATA_casillas_36:
	defb 046h,003h,089h,03fh,0ffh,0c8h,028h,048h,032h,08eh,02bh,084h,050h,084h,051h,002h	; a6d4  F..?..(H2.+.P.Q.
	defb 05bh,0ffh,084h,003h,046h,028h,00dh,029h,0cbh,02ah,0c5h,049h,048h,043h,0ffh,088h	; a6e4  [...F(.).*.IHC..
	defb 000h,086h,001h,008h,003h,084h,003h,0cah,028h,0c8h,021h,0aeh,023h,000h	; a6f4  ........(.!.#.

; ----------------------------------------------------------------------
; DATOS casillas_37: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 37; lo leen p00:4434 (24 bytes)
;   0xa702..0xa71a  (24 bytes)
DATA_casillas_37:
	defb 051h,014h,0ffh,047h,014h,046h,02ah,088h,02bh,0ffh,0ffh,0c5h,000h,0c8h,040h,045h	; a702  Q..G.F*.+.....@E
	defb 02eh,084h,03ah,0c4h,04ah,08dh,017h,000h	; a712  ..:.J...

; ----------------------------------------------------------------------
; DATOS casillas_38: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 38; lo leen p00:4434 (26 bytes)
;   0xa71a..0xa734  (26 bytes)
DATA_casillas_38:
	defb 053h,014h,025h,01ah,00bh,02dh,086h,02fh,0ffh,0d1h,015h,086h,016h,046h,02fh,0c2h	; a71a  S.%..-./.....F/.
	defb 05ah,0ffh,056h,000h,0ffh,0ceh,002h,046h,031h,000h	; a72a  Z.V....F1.

; ----------------------------------------------------------------------
; DATOS casillas_39: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 39; lo leen p00:4434 (5 bytes)
;   0xa734..0xa739  (5 bytes)
DATA_casillas_39:
	defb 022h,04ch,0a2h,04fh,000h	; a734

; ----------------------------------------------------------------------
; DATOS casillas_40: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 40; lo leen p00:4434 (64 bytes)
;   0xa739..0xa779  (64 bytes)
DATA_casillas_40:
	defb 041h,05ch,082h,042h,002h,03bh,082h,043h,0ffh,042h,040h,0c2h,038h,042h,041h,081h	; a739  A\.B...C.B@.8BA.
	defb 05fh,0ffh,045h,000h,082h,014h,002h,01dh,082h,025h,002h,02eh,082h,036h,002h,03fh	; a749  _.E......%...6.?
	defb 0ffh,082h,014h,082h,015h,082h,016h,002h,01dh,002h,01eh,0c2h,01eh,082h,024h,082h	; a759  ..............$.
	defb 025h,042h,026h,002h,02dh,0c2h,02dh,082h,034h,042h,035h,0c2h,03ch,083h,003h,000h	; a769  %B&.-.-.4B5.<...

; ----------------------------------------------------------------------
; DATOS columnas_31: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 31; lo leen p00:4434 (1 bytes)
;   0xa779..0xa77a  (1 bytes)
DATA_columnas_31:
	defb 000h	; a779

; ----------------------------------------------------------------------
; DATOS columnas_32: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 32; lo leen p00:4434 (1 bytes)
;   0xa77a..0xa77b  (1 bytes)
DATA_columnas_32:
	defb 000h	; a77a

; ----------------------------------------------------------------------
; DATOS columnas_33: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 33; lo leen p00:4434 (1 bytes)
;   0xa77b..0xa77c  (1 bytes)
DATA_columnas_33:
	defb 000h	; a77b

; ----------------------------------------------------------------------
; DATOS columnas_34: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 34; lo leen p00:4434 (1 bytes)
;   0xa77c..0xa77d  (1 bytes)
DATA_columnas_34:
	defb 000h	; a77c

; ----------------------------------------------------------------------
; DATOS columnas_35: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 35; lo leen p00:4434 (24 bytes)
;   0xa77d..0xa795  (24 bytes)
DATA_columnas_35:
	defb 02bh,030h,0abh,033h,0ffh,04bh,033h,0b1h,01bh,0ffh,0ffh,066h,014h,066h,017h,0e6h	; a77d  +0.3.K3....f.f..
	defb 02ch,0e6h,02eh,086h,045h,046h,046h,000h	; a78d  ,...EFF.

; ----------------------------------------------------------------------
; DATOS columnas_36: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 36; lo leen p00:4434 (1 bytes)
;   0xa795..0xa796  (1 bytes)
DATA_columnas_36:
	defb 000h	; a795

; ----------------------------------------------------------------------
; DATOS columnas_37: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 37; lo leen p00:4434 (1 bytes)
;   0xa796..0xa797  (1 bytes)
DATA_columnas_37:
	defb 000h	; a796

; ----------------------------------------------------------------------
; DATOS columnas_38: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 38; lo leen p00:4434 (1 bytes)
;   0xa797..0xa798  (1 bytes)
DATA_columnas_38:
	defb 000h	; a797

; ----------------------------------------------------------------------
; DATOS columnas_39: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 39; lo leen p00:4434 (15 bytes)
;   0xa798..0xa7a7  (15 bytes)
DATA_columnas_39:
	defb 024h,01ch,064h,01dh,0e4h,01eh,0e6h,015h,024h,034h,024h,036h,024h,037h,000h	; a798  $.d.....$4$6$7.

; ----------------------------------------------------------------------
; DATOS columnas_40: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 40; lo leen p00:4434 (1 bytes)
;   0xa7a7..0xa7a8  (1 bytes)
DATA_columnas_40:
	defb 000h	; a7a7

; ----------------------------------------------------------------------
; DATOS casillas_41: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 41; lo leen p00:4434 (13 bytes)
;   0xa7a8..0xa7b5  (13 bytes)
DATA_casillas_41:
	defb 086h,028h,046h,021h,046h,02bh,002h,043h,0c2h,04ah,082h,052h,000h	; a7a8  .(F!F+.C.J.R.

; ----------------------------------------------------------------------
; DATOS casillas_42: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 42; lo leen p00:4434 (10 bytes)
;   0xa7b5..0xa7bf  (10 bytes)
DATA_casillas_42:
	defb 082h,021h,0ffh,0c2h,035h,044h,01fh,004h,03fh,000h	; a7b5  .!..5D..?.

; ----------------------------------------------------------------------
; DATOS casillas_43: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 43; lo leen p00:4434 (28 bytes)
;   0xa7bf..0xa7db  (28 bytes)
DATA_casillas_43:
	defb 06bh,034h,0a2h,02dh,0e4h,025h,022h,026h,0a9h,002h,0ffh,028h,001h,0ach,002h,0ffh	; a7bf  k4.-.%"&...(....
	defb 066h,000h,0a1h,05eh,0ffh,068h,018h,021h,05dh,0a1h,05eh,000h	; a7cf  f..^.h.!].^.

; ----------------------------------------------------------------------
; DATOS casillas_44: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 44; lo leen p00:4434 (58 bytes)
;   0xa7db..0xa815  (58 bytes)
DATA_casillas_44:
	defb 08bh,000h,04bh,003h,085h,04ch,045h,04fh,0ffh,08bh,000h,04bh,003h,081h,05ch,041h	; a7db  ..K..LEO...K..\A
	defb 05fh,0ffh,08bh,000h,04bh,003h,085h,04ch,045h,04fh,04ah,02eh,0ffh,08bh,000h,04bh	; a7eb  _...K..LEOJ....K
	defb 003h,085h,04ch,045h,04fh,0ffh,08bh,000h,04bh,003h,085h,04ch,045h,04fh,0e8h,02dh	; a7fb  ..LEO...K..LEO.-
	defb 0ffh,08bh,000h,04bh,003h,088h,040h,048h,043h,000h	; a80b  ...K..@HC.

; ----------------------------------------------------------------------
; DATOS casillas_45: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 45; lo leen p00:4434 (17 bytes)
;   0xa815..0xa826  (17 bytes)
DATA_casillas_45:
	defb 0ffh,086h,040h,004h,01ah,0ffh,044h,018h,006h,042h,082h,03ah,002h,033h,087h,017h	; a815  ..@...D..B.:.3..
	defb 000h	; a825

; ----------------------------------------------------------------------
; DATOS casillas_46: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 46; lo leen p00:4434 (66 bytes)
;   0xa826..0xa868  (66 bytes)
DATA_casillas_46:
	defb 082h,018h,082h,028h,082h,038h,0c2h,020h,0c2h,030h,0c2h,040h,002h,029h,002h,039h	; a826  ...(.8. .0.@.).9
	defb 002h,049h,042h,031h,042h,041h,082h,032h,082h,042h,0c2h,02ah,0c2h,03ah,0c2h,04ah	; a836  .IB1BA.2.B.*.:.J
	defb 002h,023h,002h,033h,002h,043h,042h,01bh,042h,02bh,042h,03bh,0c2h,050h,0ffh,04ah	; a846  .#.3.CB.B+B..P.J
	defb 032h,0c8h,012h,0ffh,046h,002h,004h,051h,042h,05bh,0ffh,004h,001h,04ah,003h,042h	; a856  2...F..QB[...J.B
	defb 05ah,000h	; a866

; ----------------------------------------------------------------------
; DATOS casillas_47: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 47; lo leen p00:4434 (19 bytes)
;   0xa868..0xa87b  (19 bytes)
DATA_casillas_47:
	defb 053h,014h,0a3h,045h,0e4h,035h,022h,052h,082h,05bh,0ffh,056h,000h,064h,04ah,096h	; a868  S..E.5"R.[.V.dJ.
	defb 003h,0ffh,000h	; a878

; ----------------------------------------------------------------------
; DATOS casillas_48: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 48; lo leen p00:4434 (17 bytes)
;   0xa87b..0xa88c  (17 bytes)
DATA_casillas_48:
	defb 044h,014h,044h,034h,084h,024h,083h,044h,0ffh,0ffh,044h,027h,045h,047h,084h,037h	; a87b  D.D4.$.D..D'EG.7
	defb 000h	; a88b

; ----------------------------------------------------------------------
; DATOS casillas_49: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 49; lo leen p00:4434 (37 bytes)
;   0xa88c..0xa8b1  (37 bytes)
DATA_casillas_49:
	defb 0e2h,014h,0e2h,016h,0a2h,01ch,022h,01fh,067h,024h,067h,027h,0a4h,034h,024h,037h	; a88c  ......".g$g'.4$7
	defb 0e6h,03ch,0e2h,03dh,0e6h,03eh,0a2h,045h,022h,046h,022h,04dh,0e2h,04dh,0a2h,04eh	; a89c  .<.=.>.E"F"M.M.N
	defb 0a2h,055h,022h,056h,000h	; a8ac

; ----------------------------------------------------------------------
; DATOS casillas_50: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 50; lo leen p00:4434 (16 bytes)
;   0xa8b1..0xa8c1  (16 bytes)
DATA_casillas_50:
	defb 0e6h,02ch,024h,023h,0ffh,002h,01ah,0b0h,023h,0ffh,0ffh,010h,01ah,0a6h,003h,000h	; a8b1  .,$#....#.......

; ----------------------------------------------------------------------
; DATOS columnas_41: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 41; lo leen p00:4434 (3 bytes)
;   0xa8c1..0xa8c4  (3 bytes)
DATA_columnas_41:
	defb 088h,022h,000h	; a8c1

; ----------------------------------------------------------------------
; DATOS columnas_42: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 42; lo leen p00:4434 (3 bytes)
;   0xa8c4..0xa8c7  (3 bytes)
DATA_columnas_42:
	defb 086h,037h,000h	; a8c4

; ----------------------------------------------------------------------
; DATOS columnas_45: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 45; lo leen p00:4434 (34 bytes)
;   0xa8c7..0xa8e9  (34 bytes)
DATA_columnas_45:
	defb 064h,028h,064h,029h,064h,02ah,064h,02bh,0a4h,038h,024h,039h,0a4h,039h,024h,03ah	; a8c7  d(d)d*d+.8$9.9$:
	defb 0a4h,03ah,024h,03bh,0e4h,048h,0e4h,049h,0e4h,04ah,0ffh,002h,039h,082h,031h,0c6h	; a8d7  .:$..H.I.J..9.1.
	defb 019h,000h	; a8e7

; ----------------------------------------------------------------------
; DATOS columnas_46: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 46; lo leen p00:4434 (6 bytes)
;   0xa8e9..0xa8ef  (6 bytes)
DATA_columnas_46:
	defb 0ffh,0ffh,0ffh,008h,022h,000h	; a8e9

; ----------------------------------------------------------------------
; DATOS columnas_48: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 48; lo leen p00:4434 (7 bytes)
;   0xa8ef..0xa8f6  (7 bytes)
DATA_columnas_48:
	defb 0ffh,00ah,025h,0ffh,084h,017h,000h	; a8ef

; ----------------------------------------------------------------------
; DATOS columnas_43: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fases 43, 44, 47, 49, 50; lo leen p00:4434 (1 bytes)
;   0xa8f6..0xa8f7  (1 bytes)
DATA_columnas_43:
	defb 000h	; a8f6

; ----------------------------------------------------------------------
; DATOS casillas_51: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 51; lo leen p00:4434 (3 bytes)
;   0xa8f7..0xa8fa  (3 bytes)
DATA_casillas_51:
	defb 0e5h,045h,000h	; a8f7

; ----------------------------------------------------------------------
; DATOS casillas_52: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 52; lo leen p00:4434 (3 bytes)
;   0xa8fa..0xa8fd  (3 bytes)
DATA_casillas_52:
	defb 0c5h,048h,000h	; a8fa

; ----------------------------------------------------------------------
; DATOS casillas_53: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 53; lo leen p00:4434 (17 bytes)
;   0xa8fd..0xa90e  (17 bytes)
DATA_casillas_53:
	defb 0ffh,052h,014h,042h,022h,082h,01ah,0c2h,022h,002h,01bh,042h,023h,085h,017h,0ffh	; a8fd  .R.B"..."..B#...
	defb 000h	; a90d

; ----------------------------------------------------------------------
; DATOS casillas_54: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 54; lo leen p00:4434 (8 bytes)
;   0xa90e..0xa916  (8 bytes)
DATA_casillas_54:
	defb 0e4h,052h,0ffh,0e4h,002h,0e5h,015h,000h	; a90e  .R......

; ----------------------------------------------------------------------
; DATOS casillas_55: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 55; lo leen p00:4434 (12 bytes)
;   0xa916..0xa922  (12 bytes)
DATA_casillas_55:
	defb 0a5h,000h,048h,017h,006h,02dh,002h,037h,0ffh,0a1h,05ch,000h	; a916  ..H..-.7..\.

; ----------------------------------------------------------------------
; DATOS casillas_57: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 57; lo leen p00:4434 (8 bytes)
;   0xa922..0xa92a  (8 bytes)
DATA_casillas_57:
	defb 02fh,010h,0a4h,013h,0ffh,024h,010h,000h	; a922  /....$..

; ----------------------------------------------------------------------
; DATOS casillas_58: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 58; lo leen p00:4434 (8 bytes)
;   0xa92a..0xa932  (8 bytes)
DATA_casillas_58:
	defb 0ach,024h,0ffh,02eh,017h,0e4h,04eh,000h	; a92a  .$....N.

; ----------------------------------------------------------------------
; DATOS casillas_56: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 56; lo leen p00:4434 (1 bytes)
;   0xa932..0xa933  (1 bytes)
DATA_casillas_56:
	defb 000h	; a932

; ----------------------------------------------------------------------
; DATOS casillas_59: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 59; lo leen p00:4434 (74 bytes)
;   0xa933..0xa97d  (74 bytes)
DATA_casillas_59:
	defb 034h,010h,0c9h,018h,046h,035h,045h,042h,0c7h,02ah,049h,013h,0b4h,013h,0ffh,034h	; a933  4...F5EB.*I....4
	defb 010h,0c5h,014h,042h,019h,0c3h,01ah,047h,013h,0b4h,013h,085h,04ch,083h,042h,003h	; a943  ...B...G....L.B.
	defb 04bh,041h,05eh,0ffh,037h,000h,0b7h,003h,0c2h,044h,004h,03dh,046h,035h,048h,026h	; a953  KA^.7....D.=F5H&
	defb 088h,01eh,0ffh,037h,000h,0b7h,003h,093h,000h,005h,00dh,043h,00dh,081h,00dh,043h	; a963  ...7.......C...C
	defb 002h,084h,026h,0c4h,01eh,0c4h,036h,006h,02fh,000h	; a973  ..&...6./.

; ----------------------------------------------------------------------
; DATOS columnas_59: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 59; lo leen p00:4434 (35 bytes)
;   0xa97d..0xa9a0  (35 bytes)
DATA_columnas_59:
	defb 089h,010h,007h,029h,085h,041h,086h,036h,008h,01fh,0ffh,087h,010h,003h,019h,082h	; a97d  ...).A.6........
	defb 01ah,005h,017h,0c3h,048h,043h,041h,0c3h,046h,044h,04fh,003h,045h,0ffh,088h,02dh	; a98d  ....HCA.FDO.E..-
	defb 007h,00fh,000h	; a99d

; ----------------------------------------------------------------------
; DATOS casillas_60: Las columnas que se marcan en el mapa sin apuntarlas de
;   la fase 60; lo leen p00:4434 (52 bytes)
;   0xa9a0..0xa9d4  (52 bytes)
DATA_casillas_60:
	defb 035h,00ch,0c5h,028h,082h,058h,0c2h,059h,0ffh,0cah,03ah,082h,05bh,0ffh,091h,00ch	; a9a0  5..(.X.Y..:.[...
	defb 046h,022h,044h,042h,0b5h,00fh,042h,058h,082h,059h,002h,05bh,0ffh,023h,000h,096h	; a9b0  F"DB..BX.Y.[.#..
	defb 000h,0c5h,001h,0c4h,01dh,0ffh,0c4h,002h,096h,003h,0ffh,056h,000h,08ch,001h,006h	; a9c0  ...........V....
	defb 003h,0b6h,003h,000h	; a9d0

; ----------------------------------------------------------------------
; DATOS columnas_51: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 51; lo leen p00:4434 (5 bytes)
;   0xa9d4..0xa9d9  (5 bytes)
DATA_columnas_51:
	defb 066h,029h,066h,02ah,000h	; a9d4

; ----------------------------------------------------------------------
; DATOS columnas_52: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 52; lo leen p00:4434 (16 bytes)
;   0xa9d9..0xa9e9  (16 bytes)
DATA_columnas_52:
	defb 04ah,020h,08ch,021h,048h,023h,0ffh,044h,011h,008h,022h,047h,041h,005h,04bh,000h	; a9d9  J .!H#.D.."GA.K.

; ----------------------------------------------------------------------
; DATOS columnas_53: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 53; lo leen p00:4434 (5 bytes)
;   0xa9e9..0xa9ee  (5 bytes)
DATA_columnas_53:
	defb 0ffh,0ffh,005h,025h,000h	; a9e9

; ----------------------------------------------------------------------
; DATOS columnas_54: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 54; lo leen p00:4434 (3 bytes)
;   0xa9ee..0xa9f1  (3 bytes)
DATA_columnas_54:
	defb 065h,03eh,000h	; a9ee

; ----------------------------------------------------------------------
; DATOS columnas_55: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 55; lo leen p00:4434 (6 bytes)
;   0xa9f1..0xa9f7  (6 bytes)
DATA_columnas_55:
	defb 024h,034h,0ffh,0aeh,027h,000h	; a9f1

; ----------------------------------------------------------------------
; DATOS columnas_56: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 56; lo leen p00:4434 (15 bytes)
;   0xa9f7..0xaa06  (15 bytes)
DATA_columnas_56:
	defb 08ch,010h,04ah,013h,0e3h,029h,006h,029h,0e5h,039h,046h,040h,086h,043h,000h	; a9f7  ..J..).).9F@.C.

; ----------------------------------------------------------------------
; DATOS columnas_57: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 57; lo leen p00:4434 (14 bytes)
;   0xaa06..0xaa14  (14 bytes)
DATA_columnas_57:
	defb 0c4h,010h,0e8h,01dh,0ffh,0e4h,01dh,0e8h,03dh,0abh,023h,004h,013h,000h	; aa06  ........=.#...

; ----------------------------------------------------------------------
; DATOS columnas_58: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 58; lo leen p00:4434 (10 bytes)
;   0xaa14..0xaa1e  (10 bytes)
DATA_columnas_58:
	defb 0a4h,02eh,028h,02fh,0ffh,02ah,02eh,0b0h,015h,000h	; aa14  ..(/.*....

; ----------------------------------------------------------------------
; DATOS columnas_60: Las columnas que se marcan en el mapa y se apuntan en
;   0xE7C0 de la fase 60; lo leen p00:4434 (11 bytes)
;   0xaa1e..0xaa29  (11 bytes)
DATA_columnas_60:
	defb 0ffh,0ffh,0ffh,0ffh,0c3h,00ch,003h,019h,043h,025h,000h	; aa1e  ........C%.

; ----------------------------------------------------------------------
; DATOS fuente_AA29: 42 caracteres de 1 bit por punto: la fuente del marcador
;   (0xAA29 los 12 primeros, 0xAA89 los 30 siguientes); lo leen p00:5155 (336
;   bytes)
;   0xaa29..0xab79  (336 bytes)
DATA_fuente_AA29:
	defb 000h,01ch,022h,063h,063h,063h,022h,01ch	; aa29  .."ccc".
	defb 000h,018h,038h,018h,018h,018h,018h,07eh	; aa31  ..8....~
	defb 000h,03eh,063h,003h,00eh,03ch,070h,07fh	; aa39  .>c..<p.
	defb 000h,03eh,063h,003h,00eh,003h,063h,03eh	; aa41  .>c...c>
	defb 000h,00eh,01eh,036h,066h,066h,07fh,006h	; aa49  ...6ff..
	defb 000h,07fh,060h,07eh,063h,003h,063h,03eh	; aa51  ..`~c.c>
	defb 000h,03eh,063h,060h,07eh,063h,063h,03eh	; aa59  .>c`~cc>
	defb 000h,07fh,063h,006h,00ch,018h,018h,018h	; aa61  ..c.....
	defb 000h,03eh,063h,063h,03eh,063h,063h,03eh	; aa69  .>cc>cc>
	defb 000h,03eh,063h,063h,03fh,003h,063h,03eh	; aa71  .>cc?.c>
	defb 03ch,042h,099h,0a1h,0a1h,099h,042h,03ch	; aa79  <B....B<
	defb 000h,018h,018h,018h,018h,018h,000h,018h	; aa81  ........
	defb 000h,000h,000h,000h,000h,000h,000h,000h	; aa89  ........
	defb 000h,01ch,036h,063h,063h,07fh,063h,063h	; aa91  ..6cc.cc
	defb 000h,07eh,063h,063h,07eh,063h,063h,07eh	; aa99  .~cc~cc~
	defb 000h,03eh,063h,060h,060h,060h,063h,03eh	; aaa1  .>c```c>
	defb 000h,07ch,066h,063h,063h,063h,066h,07ch	; aaa9  .|fcccf|
	defb 000h,07fh,060h,060h,07eh,060h,060h,07fh	; aab1  ..``~``.
	defb 000h,07fh,060h,060h,07eh,060h,060h,060h	; aab9  ..``~```
	defb 000h,03eh,063h,060h,067h,063h,063h,03fh	; aac1  .>c`gcc?
	defb 000h,063h,063h,063h,07fh,063h,063h,063h	; aac9  .ccc.ccc
	defb 000h,03ch,018h,018h,018h,018h,018h,03ch	; aad1  .<.....<
	defb 000h,01fh,006h,006h,006h,006h,066h,03ch	; aad9  ......f<
	defb 000h,063h,066h,06ch,078h,07ch,06eh,067h	; aae1  .cflx|ng
	defb 000h,060h,060h,060h,060h,060h,060h,07fh	; aae9  .``````.
	defb 000h,063h,077h,07fh,07fh,06bh,063h,063h	; aaf1  .cw..kcc
	defb 000h,063h,073h,07bh,07fh,06fh,067h,063h	; aaf9  .cs{.ogc
	defb 000h,03eh,063h,063h,063h,063h,063h,03eh	; ab01  .>ccccc>
	defb 000h,07eh,063h,063h,063h,07eh,060h,060h	; ab09  .~ccc~``
	defb 000h,03eh,063h,063h,063h,06fh,066h,03dh	; ab11  .>cccof=
	defb 000h,07eh,063h,063h,062h,07ch,066h,063h	; ab19  .~ccb|fc
	defb 000h,03eh,063h,060h,03eh,003h,063h,03eh	; ab21  .>c`>.c>
	defb 000h,07eh,018h,018h,018h,018h,018h,018h	; ab29  .~......
	defb 000h,063h,063h,063h,063h,063h,063h,03eh	; ab31  .cccccc>
	defb 000h,063h,063h,063h,063h,036h,01ch,008h	; ab39  .cccc6..
	defb 000h,063h,063h,06bh,06bh,07fh,077h,022h	; ab41  .cckk.w"
	defb 000h,063h,076h,03ch,01ch,01eh,037h,063h	; ab49  .cv<..7c
	defb 000h,066h,066h,07eh,03ch,018h,018h,018h	; ab51  .ff~<...
	defb 000h,07fh,007h,00eh,01ch,038h,070h,07fh	; ab59  .....8p.
	defb 000h,07fh,000h,000h,000h,000h,000h,000h	; ab61  ........
	defb 000h,000h,000h,000h,07eh,000h,000h,000h	; ab69  ....~...
	defb 000h,03ch,066h,066h,00ch,018h,000h,018h	; ab71  .<ff....

; ----------------------------------------------------------------------
; DATOS fuente_AB79: 5 caracteres de 1 bit por punto; lo leen p00:5155 (40
;   bytes)
;   0xab79..0xaba1  (40 bytes)
DATA_fuente_AB79:
	defb 000h,000h,000h,000h,000h,000h,030h,030h	; ab79  ......00
	defb 000h,000h,000h,018h,018h,000h,000h,000h	; ab81  ........
	defb 028h,028h,000h,000h,000h,000h,000h,000h	; ab89  ((......
	defb 0ffh,033h,033h,033h,033h,033h,033h,0ffh	; ab91  .333333.
	defb 0feh,030h,030h,030h,030h,030h,030h,0feh	; ab99  .000000.

; ----------------------------------------------------------------------
; DATOS sin identificar  0xaba1..0xabc1  (32 bytes)
DATA_ABA1:
	defb 002h,002h,02ah,0aah,02ah,002h,002h,002h,000h,000h,0feh,001h,0feh,000h,000h,000h	; aba1  ..*.*...........
	defb 091h,081h,081h,081h,081h,081h,061h,011h,051h,051h,051h,0f7h,0f1h,0f1h,0f1h,0f1h	; abb1  ......a.QQQ.....

; ----------------------------------------------------------------------
; DATOS car_ABC1: 2 caracteres ya de 4 bits (32 bytes cada uno); lo leen
;   p00:51A2 (64 bytes)
;   0xabc1..0xac01  (64 bytes)
DATA_car_ABC1:
	defb 000h,000h,000h,0f0h,00fh,0ffh,0ffh,0afh,0f7h,071h,071h,0afh,0f7h,071h,071h,0afh	; abc1  .........qq..qq.
	defb 0fah,0afh,0afh,0afh,00fh,0ffh,0ffh,0afh,000h,000h,000h,0f0h,000h,000h,000h,000h	; abd1  ................
	defb 000h,000h,000h,000h,0ffh,0ffh,0ffh,000h,0ddh,0ddh,0ddh,0f0h,0bbh,0bbh,0bbh,0bfh	; abe1  ................
	defb 0bbh,0bbh,0bbh,0f0h,0ffh,0ffh,0ffh,000h,000h,000h,000h,000h,000h,000h,000h,000h	; abf1  ................

; ----------------------------------------------------------------------
; DATOS sin identificar  0xac01..0xac13  (18 bytes)
DATA_AC01:
	defb 048h,020h,0e4h,0efh,000h,0f9h,0efh,0f5h,0f2h,000h,0e2h,0e5h,0f3h,0f4h,000h,0dbh	; ac01  H ..............
	defb 0dbh,0ffh	; ac11

; ----------------------------------------------------------------------
; DATOS letreros_AC13: 5 punteros a los letreros de cada piramide acabada (de
;   la 1 a la 5: la 6 va al final) (piramide - 1); lo leen p01:71AF (10 bytes)
;   0xac13..0xac1d  (10 bytes)
DATA_letreros_AC13:
	defw 0ac1dh,0ac2ah,0ac4fh,0ac7ch,0ac9fh	; ac13

; ----------------------------------------------------------------------
; DATOS letrero_AC1D: letrero (de cada piramide acabada (de la 1 a la 5: la 6
;   va al final)): [x][y] y caracteres, 0xFE [x][y] otro sitio, 0xFF acaba; lo
;   leen p00:51D6 (13 bytes)
;   0xac1d..0xac2a  (13 bytes)
DATA_letrero_AC1D:
	defb 020h,090h,0e4h,0ebh,0e8h,0e0h,000h,0ebh,0f1h,0f0h,0dbh,0dbh,0ffh	; ac1d   ............

; ----------------------------------------------------------------------
; DATOS letrero_AC2A: letrero (de cada piramide acabada (de la 1 a la 5: la 6
;   va al final)): [x][y] y caracteres, 0xFE [x][y] otro sitio, 0xFF acaba; lo
;   leen p00:51D6 (37 bytes)
;   0xac2a..0xac4f  (37 bytes)
DATA_letrero_AC2A:
	defb 020h,088h,0f0h,0eeh,0f5h,000h,0f0h,0ebh,000h,0f0h,0ddh,0e7h,0e1h,0feh,020h,098h	; ac2a   ............. .
	defb 0ddh,000h,0eah,0e1h,0f3h,000h,0efh,0f0h,0e1h,0ech,0feh,020h,0a8h,0e2h,0ebh,0eeh	; ac3a  ........... ....
	defb 0f3h,0ddh,0eeh,0e0h,0ffh	; ac4a

; ----------------------------------------------------------------------
; DATOS letrero_AC4F: letrero (de cada piramide acabada (de la 1 a la 5: la 6
;   va al final)): [x][y] y caracteres, 0xFE [x][y] otro sitio, 0xFF acaba; lo
;   leen p00:51D6 (45 bytes)
;   0xac4f..0xac7c  (45 bytes)
DATA_letrero_AC4F:
	defb 018h,080h,0e4h,0e1h,0ddh,0f2h,0e1h,0eah,000h,0e7h,0eah,0ebh,0f3h,0efh,0feh,030h	; ac4f  ...............0
	defb 090h,0f3h,0e4h,0e1h,0eah,0feh,020h,0a0h,0f0h,0e4h,0e5h,0efh,000h,0e3h,0ddh,0e9h	; ac5f  ...... .........
	defb 0e1h,0feh,030h,0b0h,0f3h,0e5h,0e8h,0e8h,000h,0e1h,0eah,0e0h,0ffh	; ac6f  ..0..........

; ----------------------------------------------------------------------
; DATOS letrero_AC7C: letrero (de cada piramide acabada (de la 1 a la 5: la 6
;   va al final)): [x][y] y caracteres, 0xFE [x][y] otro sitio, 0xFF acaba; lo
;   leen p00:51D6 (35 bytes)
;   0xac7c..0xac9f  (35 bytes)
DATA_letrero_AC7C:
	defb 012h,088h,0ebh,0e4h,0dbh,000h,0e9h,0f5h,000h,0e3h,0ebh,0e0h,0dbh,0feh,020h,098h	; ac7c  .............. .
	defb 0e5h,000h,0deh,0e1h,0e8h,0e5h,0e1h,0f2h,0e1h,0feh,040h,0a8h,0e5h,0eah,000h,0e3h	; ac8c  ..........@.....
	defb 0ebh,0e0h,0ffh	; ac9c

; ----------------------------------------------------------------------
; DATOS letrero_AC9F: letrero (de cada piramide acabada (de la 1 a la 5: la 6
;   va al final)): [x][y] y caracteres, 0xFE [x][y] otro sitio, 0xFF acaba; lo
;   leen p00:51D6 (36 bytes)
;   0xac9f..0xacc3  (36 bytes)
DATA_letrero_AC9F:
	defb 018h,088h,0ddh,0f0h,000h,0e8h,0ebh,0eah,0e3h,000h,0e8h,0ddh,0efh,0f0h,0feh,030h	; ac9f  ...............0
	defb 098h,0e2h,0e5h,0eah,0ddh,0e8h,0feh,020h,0a8h,0dfh,0ebh,0f1h,0eah,0f0h,000h,0e0h	; acaf  ....... ........
	defb 0ebh,0f3h,0eah,0ffh	; acbf

; ----------------------------------------------------------------------
; DATOS sin identificar  0xacc3..0xad76  (179 bytes)
DATA_ACC3:
	defb 048h,048h,0dfh,0ebh,0eah,0e3h,0eeh,0ddh,0f0h,0f1h,0e8h,0ddh,0f0h,0e5h,0ebh,0eah	; acc3  HH..............
	defb 0efh,0feh,040h,058h,0f0h,0ebh,000h,0f2h,0e5h,0dfh,0e7h,000h,0f4h,0fah,0fbh,000h	; acd3  ..@X............
	defb 0dbh,0feh,048h,068h,0f5h,0ebh,0f1h,000h,0e4h,0e1h,0eeh,0ebh,0e5h,0dfh,0ddh,0e8h	; ace3  ..Hh............
	defb 0e8h,0f5h,0feh,040h,078h,0f1h,0eah,0efh,0e1h,0ddh,0e8h,0e1h,0e0h,000h,0ddh,0e8h	; acf3  ...@x...........
	defb 0e8h,000h,0f0h,0e4h,0e1h,0feh,040h,088h,0e8h,0ebh,0dfh,0e7h,0efh,0f7h,0ffh,028h	; ad03  ......@........(
	defb 080h,0ddh,0e8h,0e8h,000h,0f5h,0ebh,0f1h,000h,0e4h,0ddh,0f2h,0e1h,000h,0f0h,0ebh	; ad13  ................
	defb 000h,0e0h,0ebh,000h,0eah,0ebh,0f3h,0feh,028h,090h,0e5h,0efh,000h,0f0h,0f1h,0eeh	; ad23  ........(.......
	defb 0eah,000h,0ebh,0e2h,0e2h,000h,0f0h,0e4h,0e1h,000h,0efh,0f3h,0e5h,0dfh,0e4h,0feh	; ad33  ................
	defb 028h,0a0h,0f0h,0ebh,000h,0efh,0ddh,0f2h,0e1h,000h,0f0h,0e4h,0e1h,000h,0f3h,0ebh	; ad43  (...............
	defb 0eeh,0e8h,0e0h,0f7h,0ffh,048h,0a0h,0ech,0f1h,0efh,0e4h,000h,0efh,0ech,0ddh,0dfh	; ad53  .....H..........
	defb 0e1h,000h,0e7h,0e1h,0f5h,0ffh,060h,0a0h,0e0h,0ddh,0eah,0e3h,0e1h,0eeh,000h,0dbh	; ad63  ......`.........
	defb 0dbh,0dbh,0ffh	; ad73

; ----------------------------------------------------------------------
; DATOS letreros_AD76: 9 punteros a los letreros del final (paso 0xEDCF); lo
;   leen p01:772E (18 bytes)
;   0xad76..0xad88  (18 bytes)
DATA_letreros_AD76:
	defw 0ad92h,0ad9ah,0ae02h,0adcbh,0ae46h,0ae5eh,0ae78h,0aec5h	; ad76
	defw 0ad88h	; ad86  -> DATA_letrero_AD88

; ----------------------------------------------------------------------
; DATOS letrero_AD88: letrero (del final): [x][y] y caracteres, 0xFE [x][y]
;   otro sitio, 0xFF acaba; lo leen p00:51D6 (10 bytes)
;   0xad88..0xad92  (10 bytes)
DATA_letrero_AD88:
	defb 060h,048h,0f0h,0e4h,0e1h,000h,0e1h,0eah,0e0h,0ffh	; ad88  `H........

; ----------------------------------------------------------------------
; DATOS letrero_AD92: letrero (del final): [x][y] y caracteres, 0xFE [x][y]
;   otro sitio, 0xFF acaba; lo leen p00:51D6 (8 bytes)
;   0xad92..0xad9a  (8 bytes)
DATA_letrero_AD92:
	defb 068h,048h,0efh,0f0h,0ddh,0e2h,0e2h,0ffh	; ad92  hH......

; ----------------------------------------------------------------------
; DATOS letrero_AD9A: letrero (del final): [x][y] y caracteres, 0xFE [x][y]
;   otro sitio, 0xFF acaba; lo leen p00:51D6 (49 bytes)
;   0xad9a..0xadcb  (49 bytes)
DATA_letrero_AD9A:
	defb 040h,030h,0ech,0eeh,0ebh,0e3h,0eeh,0ddh,0e9h,0feh,070h,050h,0e5h,0f7h,0ddh,0e7h	; ad9a  @0........pP....
	defb 0ddh,0e0h,0ddh,0feh,070h,060h,0e7h,0f7h,0eah,0ddh,0e3h,0ddh,0e1h,0feh,070h,070h	; adaa  ....p`........pp
	defb 0f0h,0f7h,0ebh,0e7h,0ddh,0feh,070h,080h,0f0h,0f7h,0ebh,0f0h,0efh,0f1h,0e7h,0ddh	; adba  ......p.........
	defb 0ffh	; adca

; ----------------------------------------------------------------------
; DATOS letrero_ADCB: letrero (del final): [x][y] y caracteres, 0xFE [x][y]
;   otro sitio, 0xFF acaba; lo leen p00:51D6 (55 bytes)
;   0xadcb..0xae02  (55 bytes)
DATA_letrero_ADCB:
	defb 040h,030h,0e3h,0eeh,0ddh,0ech,0e4h,0e5h,0dfh,0feh,070h,050h,0e4h,0f7h,0e9h,0ddh	; adcb  @0........pP....
	defb 0e7h,0e5h,0f0h,0ddh,0eah,0e5h,0feh,070h,060h,0e9h,0f7h,0f0h,0ddh,0deh,0ddh,0f0h	; addb  .......p`.......
	defb 0ddh,0feh,070h,070h,0efh,0f7h,0f1h,0e1h,0eah,0ebh,0feh,070h,080h,0efh,0f7h,0e5h	; adeb  ..pp.......p....
	defb 0f3h,0ddh,0e9h,0ebh,0f0h,0ebh,0ffh	; adfb

; ----------------------------------------------------------------------
; DATOS letrero_AE02: letrero (del final): [x][y] y caracteres, 0xFE [x][y]
;   otro sitio, 0xFF acaba; lo leen p00:51D6 (68 bytes)
;   0xae02..0xae46  (68 bytes)
DATA_letrero_AE02:
	defb 040h,030h,0efh,0ebh,0f1h,0eah,0e0h,0feh,070h,050h,0e7h,0f7h,0f1h,0e1h,0e4h,0ddh	; ae02  @0......pP......
	defb 0eeh,0ddh,0feh,070h,060h,0e9h,0f7h,0e5h,0e7h,0ddh,0eeh,0e5h,0e7h,0ebh,0feh,070h	; ae12  ...p`..........p
	defb 070h,0f5h,0f7h,0e9h,0ddh,0eah,0eah,0ebh,0feh,070h,080h,0f0h,0f7h,0e2h,0f1h,0eeh	; ae22  p........p......
	defb 0f1h,0e7h,0ddh,0f3h,0ddh,0feh,070h,090h,0e7h,0f7h,0f5h,0ddh,0e9h,0ddh,0efh,0e4h	; ae32  ......p.........
	defb 0e5h,0f0h,0ddh,0ffh	; ae42

; ----------------------------------------------------------------------
; DATOS letrero_AE46: letrero (del final): [x][y] y caracteres, 0xFE [x][y]
;   otro sitio, 0xFF acaba; lo leen p00:51D6 (24 bytes)
;   0xae46..0xae5e  (24 bytes)
DATA_letrero_AE46:
	defb 040h,030h,0f0h,0e5h,0f0h,0e8h,0e1h,000h,0e0h,0e1h,0efh,0e5h,0e3h,0eah,0feh,070h	; ae46  @0.............p
	defb 050h,0eah,0f7h,0efh,0ddh,0f0h,0ebh,0ffh	; ae56  P.......

; ----------------------------------------------------------------------
; DATOS letrero_AE5E: letrero (del final): [x][y] y caracteres, 0xFE [x][y]
;   otro sitio, 0xFF acaba; lo leen p00:51D6 (26 bytes)
;   0xae5e..0xae78  (26 bytes)
DATA_letrero_AE5E:
	defb 040h,030h,0e3h,0ddh,0e9h,0e1h,000h,0e0h,0e1h,0efh,0e5h,0e3h,0eah,0feh,070h,050h	; ae5e  @0............pP
	defb 0efh,0f7h,0e5h,0f3h,0ddh,0e9h,0ebh,0f0h,0ebh,0ffh	; ae6e  ..........

; ----------------------------------------------------------------------
; DATOS letrero_AE78: letrero (del final): [x][y] y caracteres, 0xFE [x][y]
;   otro sitio, 0xFF acaba; lo leen p00:51D6 (77 bytes)
;   0xae78..0xaec5  (77 bytes)
DATA_letrero_AE78:
	defb 040h,030h,0efh,0ech,0e1h,0dfh,0e5h,0ddh,0e8h,000h,0f0h,0e4h,0ddh,0eah,0e7h,0efh	; ae78  @0..............
	defb 0feh,070h,050h,0e4h,0ddh,0e8h,0feh,070h,060h,0e5h,0e7h,0f1h,0feh,070h,070h,0efh	; ae88  .pP....p`....pp.
	defb 0ddh,0e8h,0f0h,0feh,070h,080h,0f0h,0e1h,0eeh,0ddh,0feh,070h,090h,0eeh,0ebh,0ebh	; ae98  ....p......p....
	defb 0e9h,000h,000h,0d1h,0d0h,0d0h,0d8h,0feh,070h,0a0h,0eeh,0ebh,0ebh,0e9h,000h,000h	; aea8  ........p.......
	defb 0d1h,0d0h,0d1h,0d3h,0feh,070h,0b0h,0eeh,0dfh,0d7h,0d2h,0d7h,0ffh	; aeb8  .....p.......

; ----------------------------------------------------------------------
; DATOS letrero_AEC5: letrero (del final): [x][y] y caracteres, 0xFE [x][y]
;   otro sitio, 0xFF acaba; lo leen p00:51D6 (24 bytes)
;   0xaec5..0xaedd  (24 bytes)
DATA_letrero_AEC5:
	defb 050h,040h,0ech,0eeh,0e1h,0efh,0e1h,0eah,0f0h,0e1h,0e0h,000h,0deh,0f5h,0feh,068h	; aec5  P@.............h
	defb 050h,0e7h,0ebh,0eah,0ddh,0e9h,0e5h,0ffh	; aed5  P.......

; ----------------------------------------------------------------------
; DATOS sin identificar  0xaedd..0xaf37  (90 bytes)
DATA_AEDD:
	defb 030h,030h,0f0h,0e4h,0ddh,0eah,0e7h,0efh,000h,0f0h,0ebh,000h,0f5h,0ebh,0f1h,0eeh	; aedd  00..............
	defb 000h,0dfh,0ebh,0f1h,0eeh,0ddh,0e3h,0e1h,0feh,010h,050h,0f0h,0e4h,0e1h,000h,0f3h	; aeed  ..........P.....
	defb 0ebh,0eeh,0e8h,0e0h,000h,0e4h,0ddh,0efh,000h,0deh,0e1h,0e1h,0eah,000h,0efh,0ddh	; aefd  ................
	defb 0f2h,0e1h,0e0h,000h,0dbh,0dbh,0feh,058h,070h,0f3h,0e1h,0e8h,0e8h,000h,0e0h,0ebh	; af0d  .......Xp.......
	defb 0eah,0e1h,0f7h,0ffh,038h,010h,0dfh,0ebh,0eah,0e3h,0eeh,0ddh,0f0h,0f1h,0e8h,0ddh	; af1d  ....8...........
	defb 0f0h,0e5h,0ebh,0eah,0efh,000h,0dbh,0dbh,0dbh,0ffh	; af2d  ..........

; ----------------------------------------------------------------------
; DATOS estrellas_final: 9 caracteres del final de 3 bytes [x][y][caracter],
;   uno cada 8 cuadros; lo leen p01:74FD (27 bytes)
;   0xaf37..0xaf52  (27 bytes)
DATA_estrellas_final:
	defb 058h,0a0h,0e1h	; af37
	defb 060h,0a0h,0e8h	; af3a
	defb 068h,0a0h,0e3h	; af3d
	defb 070h,0a0h,0e5h	; af40
	defb 078h,0a0h,0f6h	; af43
	defb 080h,0a0h,0ddh	; af46
	defb 088h,0a0h,0f8h	; af49
	defb 090h,0a0h,0f8h	; af4c
	defb 098h,0a0h,0f8h	; af4f

; ----------------------------------------------------------------------
; DATOS letreros_AF52: 5 punteros a los letreros de los errores de disco
;   (error); lo leen p02:976E (10 bytes)
;   0xaf52..0xaf5c  (10 bytes)
DATA_letreros_AF52:
	defw 0af6dh,0af7dh,0af8eh,0af9ah,0afabh	; af52

; ----------------------------------------------------------------------
; DATOS sin identificar  0xaf5c..0xaf60  (4 bytes)
DATA_AF5C:
	defb 0bbh,0afh,0cdh,0afh	; af5c

; ----------------------------------------------------------------------
; DATOS letrero_AF60: letrero (de error de disco): [x][y] y caracteres, 0xFE
;   [x][y] otro sitio, 0xFF acaba; lo leen p02:977E (13 bytes)
;   0xaf60..0xaf6d  (13 bytes)
DATA_letrero_AF60:
	defb 050h,08ch,0e4h,0e9h,0f3h,0ebh,000h,0e5h,0f2h,0f2h,0efh,0f2h,0ffh	; af60  P............

; ----------------------------------------------------------------------
; DATOS letrero_AF6D: letrero (de los errores de disco): [x][y] y caracteres,
;   0xFE [x][y] otro sitio, 0xFF acaba; lo leen p00:51D6 (16 bytes)
;   0xaf6d..0xaf7d  (16 bytes)
DATA_letrero_AF6D:
	defb 048h,09ch,0e4h,0e9h,0f3h,0ebh,000h,0e9h,0efh,000h,0e5h,0f2h,0f2h,0efh,0f2h,0ffh	; af6d  H...............

; ----------------------------------------------------------------------
; DATOS letrero_AF7D: letrero (sin ficheros): [x][y] y caracteres, 0xFE [x][y]
;   otro sitio, 0xFF acaba; lo leen p02:8D23, p00:51D6 (17 bytes)
;   0xaf7d..0xaf8e  (17 bytes)
DATA_letrero_AF7D:
	defb 048h,09ch,0e6h,0e9h,0ech,0e5h,000h,0eeh,0efh,0f4h,000h,0e6h,0efh,0f5h,0eeh,0e4h	; af7d  H...............
	defb 0ffh	; af8d

; ----------------------------------------------------------------------
; DATOS letrero_AF8E: letrero (de los errores de disco): [x][y] y caracteres,
;   0xFE [x][y] otro sitio, 0xFF acaba; lo leen p00:51D6 (12 bytes)
;   0xaf8e..0xaf9a  (12 bytes)
DATA_letrero_AF8E:
	defb 058h,09ch,0e4h,0e9h,0f3h,0ebh,000h,0e6h,0f5h,0ech,0ech,0ffh	; af8e  X...........

; ----------------------------------------------------------------------
; DATOS letrero_AF9A: letrero (de los errores de disco): [x][y] y caracteres,
;   0xFE [x][y] otro sitio, 0xFF acaba; lo leen p00:51D6 (17 bytes)
;   0xaf9a..0xafab  (17 bytes)
DATA_letrero_AF9A:
	defb 040h,09ch,0e4h,0e9h,0f3h,0ebh,000h,0eeh,0efh,0f4h,000h,0f2h,0e5h,0e1h,0e4h,0f9h	; af9a  @...............
	defb 0ffh	; afaa

; ----------------------------------------------------------------------
; DATOS letrero_AFAB: letrero (de los errores de disco): [x][y] y caracteres,
;   0xFE [x][y] otro sitio, 0xFF acaba; lo leen p00:51D6 (16 bytes)
;   0xafab..0xafbb  (16 bytes)
DATA_letrero_AFAB:
	defb 048h,09ch,0f7h,0f2h,0e9h,0f4h,0e5h,000h,0f0h,0f2h,0efh,0f4h,0e5h,0e3h,0f4h,0ffh	; afab  H...............

; ----------------------------------------------------------------------
; DATOS sin identificar  0xafbb..0xafdd  (34 bytes)
DATA_AFBB:
	defb 048h,09ch,0f4h,0efh,0efh,000h,0edh,0e1h,0eeh,0eeh,0f9h,000h,0e6h,0e9h,0ech,0e5h	; afbb  H...............
	defb 0f3h,0ffh,048h,09ch,0e4h,0e1h,0f4h,0e1h,0f4h,0f9h,0f0h,0e5h,0e5h,0f2h,0f2h,0efh	; afcb  ..H.............
	defb 0f2h,0ffh	; afdb

; ----------------------------------------------------------------------
; DATOS fuente_AFDD: 53 caracteres de 1 bit por punto: la fuente; lo leen
;   p00:5155 (424 bytes)
;   0xafdd..0xb185  (424 bytes)
DATA_fuente_AFDD:
	defb 000h,07fh,07fh,07eh,07ch,078h,07eh,07eh	; afdd  ...~|x~~
	defb 000h,0feh,03eh,03eh,03eh,03eh,03eh,03eh	; afe5  ..>>>>>>
	defb 07eh,07eh,07eh,07eh,07eh,07eh,07fh,000h	; afed  ~~~~~~..
	defb 03eh,03eh,03eh,03eh,03eh,03eh,0feh,000h	; aff5  >>>>>>..
	defb 000h,07fh,078h,070h,071h,071h,07fh,07eh	; affd  ..xpqq.~
	defb 000h,0feh,01eh,00eh,08eh,08eh,01eh,03eh	; b005  .......>
	defb 07ch,078h,071h,071h,070h,070h,07fh,000h	; b00d  |xqqpp..
	defb 07eh,0feh,0feh,0feh,00eh,00eh,0feh,000h	; b015  ~.......
	defb 000h,07fh,078h,070h,071h,07fh,07eh,07eh	; b01d  ..xpq.~~
	defb 000h,0feh,01eh,00eh,08eh,08eh,01eh,00eh	; b025  ........
	defb 07fh,071h,071h,071h,070h,078h,07fh,000h	; b02d  .qqqpx..
	defb 08eh,08eh,08eh,08eh,00eh,01eh,0feh,000h	; b035  ........
	defb 000h,07fh,07fh,07fh,07eh,07eh,07ch,07dh	; b03d  ....~~|}
	defb 000h,0feh,01eh,01eh,01eh,01eh,01eh,01eh	; b045  ........
	defb 079h,07bh,070h,070h,07fh,07fh,07fh,000h	; b04d  y{pp....
	defb 01eh,01eh,00eh,00eh,01eh,01eh,0feh,000h	; b055  ........
	defb 000h,07fh,070h,070h,071h,071h,070h,070h	; b05d  ..ppqqpp
	defb 000h,0feh,00eh,00eh,0feh,0feh,01eh,00eh	; b065  ........
	defb 071h,07fh,07fh,071h,070h,078h,07fh,000h	; b06d  q..qpx..
	defb 000h,07fh,078h,070h,071h,071h,070h,070h	; b075  ..xpqqpp
	defb 000h,0feh,01eh,00eh,08eh,0feh,01eh,00eh	; b07d  ........
	defb 071h,071h,071h,071h,070h,078h,07fh,000h	; b085  qqqqpx..
	defb 000h,07fh,070h,070h,07fh,07fh,07fh,07eh	; b08d  ..pp...~
	defb 000h,0feh,00eh,00eh,08eh,01eh,01eh,03eh	; b095  .......>
	defb 07eh,07eh,07ch,07ch,07ch,07ch,07fh,000h	; b09d  ~~||||..
	defb 03eh,03eh,07eh,07eh,07eh,07eh,0feh,000h	; b0a5  >>~~~~..
	defb 000h,07fh,078h,070h,071h,071h,078h,070h	; b0ad  ..xpqqxp
	defb 000h,07fh,078h,070h,071h,071h,071h,071h	; b0b5  ..xpqqqq
	defb 000h,0feh,01eh,00eh,08eh,08eh,08eh,08eh	; b0bd  ........
	defb 070h,078h,07fh,071h,070h,078h,07fh,000h	; b0c5  px.qpx..
	defb 00eh,00eh,08eh,08eh,00eh,01eh,0feh,000h	; b0cd  ........
	defb 000h,07fh,073h,063h,043h,043h,063h,063h	; b0d5  ..scCCcc
	defb 063h,063h,063h,063h,063h,063h,07fh,000h	; b0dd  cccccc..
	defb 000h,07fh,061h,040h,048h,048h,048h,078h	; b0e5  ..a@HHHx
	defb 071h,063h,047h,047h,040h,040h,07fh,000h	; b0ed  qcGG@@..
	defb 000h,0feh,086h,002h,022h,022h,022h,022h	; b0f5  ....""""
	defb 022h,022h,022h,022h,002h,086h,0feh,000h	; b0fd  """"....
	defb 000h,0feh,0e6h,0c6h,086h,086h,0c6h,0c6h	; b105  ........
	defb 0c6h,0c6h,0c6h,0c6h,0c6h,0c6h,0feh,000h	; b10d  ........
	defb 000h,0feh,086h,002h,022h,022h,022h,0e2h	; b115  ....""".
	defb 0c6h,08eh,01eh,01eh,002h,002h,0feh,000h	; b11d  ........
	defb 000h,0feh,086h,002h,022h,022h,0e2h,0c6h	; b125  ....""..
	defb 0c2h,0e2h,022h,022h,002h,086h,0feh,000h	; b12d  ..""....
	defb 000h,0feh,0e6h,0e6h,0c6h,0c6h,086h,0a6h	; b135  ........
	defb 026h,066h,002h,002h,0e6h,0e6h,0feh,000h	; b13d  &f......
	defb 000h,0feh,002h,002h,03eh,03eh,006h,002h	; b145  ....>>..
	defb 0e2h,0e2h,022h,022h,002h,086h,0feh,000h	; b14d  ..""....
	defb 000h,0feh,086h,002h,022h,03eh,006h,002h	; b155  ....">..
	defb 000h,0feh,002h,002h,0f2h,0e2h,0e6h,0c6h	; b15d  ........
	defb 0c6h,08eh,08eh,08eh,08eh,08eh,0feh,000h	; b165  ........
	defb 000h,0feh,086h,002h,022h,022h,086h,002h	; b16d  ....""..
	defb 002h,082h,0e2h,022h,002h,086h,0feh,000h	; b175  ..."....
	defb 000h,000h,000h,000h,000h,000h,000h,000h	; b17d  ........

; ----------------------------------------------------------------------
; DATOS letrero_B185: letrero (del menu de grabar): [x][y] y caracteres, 0xFE
;   [x][y] otro sitio, 0xFF acaba; lo leen p01:6787 (49 bytes)
;   0xb185..0xb1b6  (49 bytes)
DATA_letrero_B185:
	defb 040h,040h,0f3h,0f4h,0e1h,0f2h,0f4h,000h,000h,0f3h,0e5h,0ech,0e5h,0e3h,0f4h,0feh	; b185  @@..............
	defb 080h,050h,0eeh,0efh,0f2h,0edh,0e1h,0ech,0feh,080h,060h,0f0h,0e1h,0f3h,0f3h,0f7h	; b195  .P........`.....
	defb 0efh,0f2h,0e4h,0feh,080h,070h,0f3h,0f4h,0e1h,0e7h,0e5h,000h,0ech,0efh,0e1h,0e4h	; b1a5  .....p..........
	defb 0ffh	; b1b5

; ----------------------------------------------------------------------
; DATOS sprite_flecha: el dibujo de la flecha de los menus (32 bytes); lo leen
;   p01:67FE (32 bytes)
;   0xb1b6..0xb1d6  (32 bytes)
DATA_sprite_flecha:
	defb 000h,000h,000h,03fh,03fh,03fh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; b1b6  ...???..........
	defb 000h,080h,0c0h,0e0h,0f0h,0e0h,0c0h,080h,000h,000h,000h,000h,000h,000h,000h,000h	; b1c6  ................

; ----------------------------------------------------------------------
; DATOS dibujo_16x16: un dibujo de 16 x 16 pixeles de 4 bits (128 bytes, orden
;   HMMC); lo leen p00:56D6 (128 bytes)
;   0xb1d6..0xb256  (128 bytes)
DATA_dibujo_16x16:
	defb 0aah,0ach,0aah,0cah,0ach,0aah,0cah,0aah	; b1d6  ........
	defb 0a9h,09fh,099h,0f9h,09fh,099h,0f9h,09ah	; b1de  ........
	defb 0a9h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,09ah	; b1e6  ........
	defb 0a9h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,09ah	; b1ee  ........
	defb 0cfh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fch	; b1f6  ........
	defb 0a9h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,09ah	; b1fe  ........
	defb 0a9h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,09ah	; b206  ........
	defb 0cfh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fch	; b20e  ........
	defb 0a9h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,09ah	; b216  ........
	defb 0a9h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,09ah	; b21e  ........
	defb 0cfh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fch	; b226  ........
	defb 0a9h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,09ah	; b22e  ........
	defb 0a9h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,09ah	; b236  ........
	defb 0cfh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fch	; b23e  ........
	defb 0a9h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,09ah	; b246  ........
	defb 0a9h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,09ah	; b24e  ........

; ----------------------------------------------------------------------
; DATOS letrero_B256: letrero (de la fase): [x][y] y caracteres, 0xFE [x][y]
;   otro sitio, 0xFF acaba; lo leen p01:72F2 (46 bytes)
;   0xb256..0xb284  (46 bytes)
DATA_letrero_B256:
	defb 068h,020h,0eeh,0e9h,0e3h,0e5h,000h,0dbh,0feh,038h,030h,0ech,0e5h,0f4h,0f3h,000h	; b256  h .......80.....
	defb 0e7h,0efh,000h,0eeh,0e5h,0f8h,0f4h,000h,0f3h,0f4h,0e1h,0e7h,0e5h,0feh,048h,050h	; b266  ..............HP
	defb 0f3h,0f0h,0e5h,0e3h,0e9h,0e1h,0ech,000h,0e2h,0efh,0eeh,0f5h,0f3h,0ffh	; b276  ..............

; ----------------------------------------------------------------------
; DATOS letrero_B284: letrero (del menu): [x][y] y caracteres, 0xFE [x][y]
;   otro sitio, 0xFF acaba; lo leen p00:482C (39 bytes)
;   0xb284..0xb2ab  (39 bytes)
DATA_letrero_B284:
	defb 048h,040h,0f3h,0e5h,0e3h,0f2h,0e5h,0f4h,000h,0e3h,0efh,0edh,0edh,0e1h,0eeh,0e4h	; b284  H@..............
	defb 0feh,060h,058h,0e6h,0fdh,0fdh,0f4h,0fdh,0fdh,0fdh,0ech,0feh,060h,068h,0fdh,0fdh	; b294  .`X.........`h..
	defb 0f9h,0fdh,0fdh,0fdh,0fdh,0fdh,0ffh	; b2a4

; ----------------------------------------------------------------------
; DATOS sin identificar  0xb2ab..0xb400  (341 bytes)
DATA_B2AB:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b2ab  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b2bb  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b2cb  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b2db  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b2eb  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b2fb  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b30b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b31b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b32b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b33b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b34b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b35b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b36b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b37b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b38b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b39b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b3ab  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b3bb  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b3cb  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b3db  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b3eb  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh	; b3fb

; ======================================================================
; CODIGO 0xb400..0xb42f  (47 bytes)
; ======================================================================


L_B400:
	ld hl,0b548h		;b400   ; el sitio escondido de la fase, si lo tiene: tabla 0xB548, 5 bytes [fase][tipo][pantalla][y][x], un 0 acaba
L_B403:
	ld a,(hl)			;b403
	and a			;b404
	ret z			;b405
	ld a,(0e242h)		;b406   ; lee la fase (1-60)
	cp (hl)			;b409
	jr z,L_B413		;b40a
	ld a,005h		;b40c
	call 0408fh		;b40e   ; suma A a HL (HL = HL + A)
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
	call 04099h		;b42c   ; el despachador de Konami: la tabla va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_B42F: 4 destinos del despachador p00:4099 (call en p12:B42C, el
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
	ld (hl),040h		;b44e
	call 096ffh		;b450   ; devuelve el fondo de los bloques de esta pantalla
	call 090abh		;b453   ; las cosas de la lista 0xEE50 (por numero): lo que habia debajo se devuelve
	call L_B4E3		;b456   ; guarda el fondo del sitio y pinta 2 x 2 caracteres de 0xB4F8
	call 090f7h		;b459   ; las de la lista, al reves: guarda el fondo y pinta la cosa
	call 096cfh		;b45c   ; pinta los bloques de esta pantalla
	jp 042efh		;b45f
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
	call 042bbh		;b476   ; pide el sonido 0x2E
	ld hl,0ef11h		;b479
	inc (hl)			;b47c
	call 096ffh		;b47d   ; devuelve el fondo de los bloques de esta pantalla
	call 090abh		;b480   ; las cosas de la lista 0xEE50 (por numero): lo que habia debajo se devuelve
	call L_B50B		;b483   ; devuelve el fondo
	call 056c5h		;b486   ; un dibujo de 16 x 16 de 0xB1D6 en la posicion de 0xEF13 (HMMC)
	call 090f7h		;b489   ; las de la lista, al reves: guarda el fondo y pinta la cosa
	jp 096cfh		;b48c
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
	jp 042c3h		;b4a9
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
	jp 0573bh		;b4f5

; ----------------------------------------------------------------------
; DATOS sitio_dibujo: 2 x 2 caracteres del sitio escondido; lo leen p12:B4F5
;   (4 bytes)
;   0xb4f8..0xb4fc  (4 bytes)
DATA_sitio_dibujo:
	defb 0cah,0cbh,0cch,0cdh	; b4f8

; ======================================================================
; CODIGO 0xb4fc..0xb548  (76 bytes)
; ======================================================================


L_B4FC:
	ld a,(hl)			;b4fc   ; guarda en la pagina 1 (0xB0) los 16 x 16 pixeles del sitio
	inc l			;b4fd
	ld h,(hl)			;b4fe
	ld l,a			;b4ff
	ld de,000b0h		;b500
	ld bc,01010h		;b503
	ld a,004h		;b506
	jp 05029h		;b508
L_B50B:
	ld hl,0ef13h		;b50b   ; devuelve el fondo
	ld e,(hl)			;b50e
	inc l			;b50f
	ld d,(hl)			;b510
	ld hl,000b0h		;b511
	ld bc,01010h		;b514
	ld a,001h		;b517
	jp 05029h		;b519
L_B51C:
	ld hl,0ef10h		;b51c   ; al pintar la pantalla, el sitio si ya ha aparecido
	ld a,(hl)			;b51f
	or a			;b520
	ret z			;b521
	inc l			;b522
	inc l			;b523
	ld a,(0e243h)		;b524   ; lee la pantalla de la fase (desde 1)
	cp (hl)			;b527
	ret nz			;b528
	dec l			;b529
	ld a,(hl)			;b52a
	or a			;b52b
	ret z			;b52c
	cp 003h		;b52d
	jp z,056c5h		;b52f
	jr $-79		;b532
L_B534:
	call L_B53A		;b534   ; un cuadro del minijuego del sitio escondido (estado 12)
	jp 0583bh		;b537
L_B53A:
	ld ix,0ef10h		;b53a   ; tipo 1: las musicas; tipo 2: el puzle
	ld a,(ix+000h)		;b53e
	dec a			;b541
	jp z,L_B917		;b542
	jp L_B6B0		;b545

; ----------------------------------------------------------------------
; DATOS sitios_escondidos: 12 sitios escondidos de 5 bytes [fase][tipo (1
;   musicas, 2 puzle)][pantalla][y][x], un 0 acaba; lo leen p12:B403 (61
;   bytes)
;   0xb548..0xb585  (61 bytes)
DATA_sitios_escondidos:
	defb 007h,001h,002h,008h,008h	; b548
	defb 014h,002h,002h,088h,030h	; b54d
	defb 018h,001h,004h,028h,0e0h	; b552
	defb 01dh,002h,001h,0a8h,0e0h	; b557
	defb 020h,001h,003h,080h,030h	; b55c
	defb 023h,002h,003h,018h,0d8h	; b561
	defb 028h,001h,001h,080h,070h	; b566
	defb 02bh,002h,001h,0a0h,098h	; b56b
	defb 032h,001h,002h,0a8h,018h	; b570
	defb 034h,002h,001h,0a8h,0e0h	; b575
	defb 035h,001h,003h,038h,0b0h	; b57a
	defb 037h,002h,002h,078h,0c0h	; b57f
	defb 000h	; b584

; ----------------------------------------------------------------------
; DATOS letrero_B585: letrero (de las musicas): [x][y] y caracteres, 0xFE
;   [x][y] otro sitio, 0xFF acaba; lo leen p12:B935 (51 bytes)
;   0xb585..0xb5b8  (51 bytes)
DATA_letrero_B585:
	defb 050h,018h,0f3h,0efh,0f5h,0eeh,0e4h,000h,0f3h,0e5h,0ech,0e5h,0e3h,0f4h,0feh,040h	; b585  P..............@
	defb 0a8h,0f3h,0e5h,0ech,0e5h,0e3h,0f4h,000h,0fch,0fch,0fch,000h,0f3h,0f0h,0e1h,0e3h	; b595  ................
	defb 0e5h,0feh,058h,0b8h,0e5h,0eeh,0e4h,000h,0fch,0fch,0fch,000h,0f2h,0e5h,0f4h,0f5h	; b5a5  ..X.............
	defb 0f2h,0eeh,0ffh	; b5b5

; ----------------------------------------------------------------------
; DATOS letrero_B5B8: letrero (del puzle): [x][y] y caracteres, 0xFE [x][y]
;   otro sitio, 0xFF acaba; lo leen p12:B746 (15 bytes)
;   0xb5b8..0xb5c7  (15 bytes)
DATA_letrero_B5B8:
	defb 050h,018h,0f0h,0f5h,0fah,0fah,0ech,0e5h,000h,000h,0e7h,0e1h,0edh,0e5h,0ffh	; b5b8  P..............

; ----------------------------------------------------------------------
; DATOS letrero_B5C7: letrero (del puzle resuelto): [x][y] y caracteres, 0xFE
;   [x][y] otro sitio, 0xFF acaba; lo leen p12:B89A (25 bytes)
;   0xb5c7..0xb5e0  (25 bytes)
DATA_letrero_B5C7:
	defb 060h,090h,0e1h,0ech,0ech,000h,0f2h,0e9h,0e7h,0e8h,0f4h,0feh,060h,0a0h,0f2h,0e5h	; b5c7  `...........`...
	defb 0f3h,0f4h,000h,000h,0d3h,000h,0f5h,0f0h,0ffh	; b5d7  .........

; ----------------------------------------------------------------------
; DATOS puzles: 4 punteros a los puzles revueltos; lo leen p12:B709 (8 bytes)
;   0xb5e0..0xb5e8  (8 bytes)
DATA_puzles:
	defw 0b5e8h,0b601h,0b61ah,0b633h	; b5e0  -> DATA_puzle_0 DATA_puzle_1 DATA_puzle_2 DATA_puzle_3

; ----------------------------------------------------------------------
; DATOS puzle_0: un puzle revuelto: las 25 casillas (0 el hueco); lo leen
;   p12:B70F (25 bytes)
;   0xb5e8..0xb601  (25 bytes)
DATA_puzle_0:
	defb 00bh,011h,017h,004h,012h	; b5e8
	defb 00ah,001h,00ch,00dh,013h	; b5ed
	defb 007h,016h,009h,018h,00eh	; b5f2
	defb 015h,008h,014h,003h,000h	; b5f7
	defb 006h,002h,010h,005h,00fh	; b5fc

; ----------------------------------------------------------------------
; DATOS puzle_1: un puzle revuelto: las 25 casillas (0 el hueco); lo leen
;   p12:B70F (25 bytes)
;   0xb601..0xb61a  (25 bytes)
DATA_puzle_1:
	defb 004h,012h,00fh,00bh,003h	; b601
	defb 008h,018h,017h,007h,013h	; b606
	defb 010h,005h,00ch,000h,00eh	; b60b
	defb 015h,016h,011h,006h,00ah	; b610
	defb 001h,009h,00dh,014h,002h	; b615

; ----------------------------------------------------------------------
; DATOS puzle_2: un puzle revuelto: las 25 casillas (0 el hueco); lo leen
;   p12:B70F (25 bytes)
;   0xb61a..0xb633  (25 bytes)
DATA_puzle_2:
	defb 007h,014h,00bh,010h,018h	; b61a
	defb 012h,001h,006h,00ch,005h	; b61f
	defb 008h,015h,00ah,011h,00dh	; b624
	defb 00eh,016h,002h,009h,000h	; b629
	defb 013h,00fh,017h,003h,004h	; b62e

; ----------------------------------------------------------------------
; DATOS puzle_3: un puzle revuelto: las 25 casillas (0 el hueco); lo leen
;   p12:B70F (25 bytes)
;   0xb633..0xb64c  (25 bytes)
DATA_puzle_3:
	defb 00fh,004h,008h,002h,00bh	; b633
	defb 000h,00dh,016h,00eh,013h	; b638
	defb 006h,00ch,007h,012h,015h	; b63d
	defb 014h,017h,011h,018h,00ah	; b642
	defb 005h,010h,003h,009h,001h	; b647

; ----------------------------------------------------------------------
; DATOS piezas: los 2 x 2 caracteres de cada pieza del puzle (0 el hueco); lo
;   leen p12:B7F4 (100 bytes)
;   0xb64c..0xb6b0  (100 bytes)
DATA_piezas:
	defb 035h,035h,035h,035h	; b64c
	defb 001h,002h,003h,004h	; b650
	defb 005h,006h,007h,008h	; b654
	defb 009h,00ah,00bh,00ch	; b658
	defb 00dh,00eh,00fh,010h	; b65c
	defb 011h,012h,013h,00ch	; b660
	defb 014h,015h,016h,00ch	; b664
	defb 017h,018h,019h,01ah	; b668
	defb 01bh,00ah,016h,00ch	; b66c
	defb 01ch,01dh,01eh,01fh	; b670
	defb 020h,024h,021h,025h	; b674
	defb 020h,026h,021h,027h	; b678
	defb 020h,028h,021h,029h	; b67c
	defb 020h,02ah,021h,02bh	; b680
	defb 020h,02ch,021h,02dh	; b684
	defb 020h,02eh,021h,02fh	; b688
	defb 020h,030h,021h,025h	; b68c
	defb 020h,031h,021h,032h	; b690
	defb 020h,033h,021h,025h	; b694
	defb 020h,024h,021h,034h	; b698
	defb 022h,024h,023h,025h	; b69c
	defb 022h,026h,023h,027h	; b6a0
	defb 022h,028h,023h,029h	; b6a4
	defb 022h,02ah,023h,02bh	; b6a8
	defb 022h,02ch,023h,02dh	; b6ac

; ======================================================================
; CODIGO 0xb6b0..0xb6be  (14 bytes)
; ======================================================================


L_B6B0:
	ld a,(0e20ch)		;b6b0   ; el puzle: ESC sale; por pasos (IX+01)
	rla			;b6b3
	rla			;b6b4
	jp c,L_B8A3		;b6b5
	ld a,(ix+001h)		;b6b8
	call 04099h		;b6bb   ; el despachador de Konami: la tabla va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_B6BE: 6 destinos del despachador p00:4099 (call en p12:B6BB, el
;   indice en A): B6CA, B6F2, B701, B749, B85E, B89D; lo leen p12:B6BB (12
;   bytes)
;   0xb6be..0xb6ca  (12 bytes)
DATA_tabla_B6BE:
	defw 0b6cah,0b6f2h,0b701h,0b749h,0b85eh,0b89dh	; b6be

; ======================================================================
; CODIGO 0xb6ca..0xb7a5  (219 bytes)
; ======================================================================


L_B6CA:
	call 04e98h		;b6ca   ; paso 0: la fuente, las piezas en orden (1-24 y el hueco) y el letrero
	call 05d41h		;b6cd   ; los atributos de los sprites (0xE800, 0x80 bytes) a 0xE0: fuera de la pantalla
	call 056aah		;b6d0   ; la fuente: 0x35 caracteres de 0xAFDD
	call 057cah		;b6d3   ; las rachas de 0xBA9A a 0xF800 (dibujos de los sprites)
	ld hl,0ef38h		;b6d6
	ld (hl),000h		;b6d9
	dec hl			;b6db
	ld b,018h		;b6dc
L_B6DE:
	ld a,b			;b6de
	ld (hl),b			;b6df
	dec hl			;b6e0
	djnz L_B6DE		;b6e1
	call L_B71E		;b6e3   ; pinta las 25 casillas (5 x 5) y el letrero
	ld hl,0b8afh		;b6e6
	call 051d0h		;b6e9   ; pinta un letrero: [D][E] y caracteres; 0xFE trae otra posicion; 0xFF acaba
	inc (ix+001h)		;b6ec
	jp 0420dh		;b6ef
L_B6F2:
	ld a,(0e207h)		;b6f2   ; paso 1: espera el disparo
	and 010h		;b6f5
	ret z			;b6f7
	inc (ix+001h)		;b6f8
	ld hl,0b8beh		;b6fb
	jp 051d4h		;b6fe
L_B701:
	ld hl,0b5e0h		;b701   ; paso 2: un puzle revuelto de los 4 de la tabla 0xB5E0 (al azar con 0xE203)
	ld a,(0e203h)		;b704   ; lee la cuenta de cuadros
	and 003h		;b707
	call 04d4ch		;b709   ; HL = la palabra A de la tabla de HL
	ld de,0ef20h		;b70c   ; apunta a el puzle: las 25 casillas
	ld bc,00019h		;b70f
	ldir		;b712
	inc (ix+001h)		;b714
	xor a			;b717
	ld (ix+002h),a		;b718
	ld (ix+003h),a		;b71b
L_B71E:
	ld hl,0ef20h		;b71e   ; pinta las 25 casillas (5 x 5) y el letrero
	ld bc,00505h		;b721
	ld de,05830h		;b724
L_B727:
	push bc			;b727
	ld b,c			;b728
	push de			;b729
L_B72A:
	push bc			;b72a
	push de			;b72b
	push hl			;b72c
	ld a,(hl)			;b72d   ; la pieza de la casilla
	call L_B7EC		;b72e   ; pinta la pieza A (2 x 2 caracteres de 0xB64C + 4 x A)
	pop hl			;b731
	inc hl			;b732
	pop de			;b733
	ld a,d			;b734   ; 16 pixeles a la derecha
	add a,010h		;b735
	ld d,a			;b737
	pop bc			;b738
	djnz L_B72A		;b739
	pop de			;b73b
	ld a,e			;b73c   ; la fila siguiente, 16 mas abajo
	add a,010h		;b73d
	ld e,a			;b73f
	pop bc			;b740
	djnz L_B727		;b741
	ld hl,0b5b8h		;b743
	jp 051d0h		;b746
L_B749:
	call L_B8CF		;b749   ; paso 3: los cursores mueven la mano; el disparo mueve la pieza al hueco de al lado
	ld a,(0e207h)		;b74c   ; lee el mando: lo que se acaba de pulsar
	rra			;b74f
	jr c,L_B76B		;b750
	rra			;b752
	jr c,L_B775		;b753
	rra			;b755
	jr c,L_B780		;b756
	rra			;b758
	jr c,L_B75F		;b759
	rra			;b75b
	jr c,L_B78A		;b75c
	ret			;b75e
L_B75F:
	ld a,(ix+003h)		;b75f
	cp 004h		;b762
	ret nc			;b764
	inc (ix+003h)		;b765
L_B768:
	jp 042cbh		;b768
L_B76B:
	ld a,(ix+002h)		;b76b
	and a			;b76e
	ret z			;b76f
	dec (ix+002h)		;b770
	jr L_B768		;b773
L_B775:
	ld a,(ix+002h)		;b775
	cp 004h		;b778
	ret nc			;b77a
	inc (ix+002h)		;b77b
	jr L_B768		;b77e
L_B780:
	ld a,(ix+003h)		;b780
	and a			;b783
	ret z			;b784
	dec (ix+003h)		;b785
	jr L_B768		;b788
L_B78A:
	call L_B7FA		;b78a   ; la pieza: si tiene el hueco al lado, se corre
	ret z			;b78d
	push hl			;b78e
	push bc			;b78f
	call L_B824		;b790   ; C = hacia donde esta el hueco (1 arriba, 2 abajo, 3 izquierda, 4 derecha; 0 no esta al lado)
	ld a,c			;b793
	pop bc			;b794
	pop de			;b795
	ld c,a			;b796
	and a			;b797
	ret z			;b798
	inc (ix+001h)		;b799
	xor a			;b79c
	call L_B7C5		;b79d
	ld a,c			;b7a0
	dec a			;b7a1
	call 04099h		;b7a2   ; el despachador de Konami: la tabla va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_B7A5: 4 destinos del despachador p00:4099 (call en p12:B7A2, el
;   indice en A): B7B8, B7D2, B7E1, B7AD; lo leen p12:B7A2 (8 bytes)
;   0xb7a5..0xb7ad  (8 bytes)
DATA_tabla_B7A5:
	defw 0b7b8h,0b7d2h,0b7e1h,0b7adh	; b7a5  -> L_B7B8 L_B7D2 L_B7E1 L_B7AD

; ======================================================================
; CODIGO 0xb7ad..0xb8af  (258 bytes)
; ======================================================================


L_B7AD:
	ex de,hl			;b7ad   ; al hueco de abajo
	ld (hl),000h		;b7ae
	inc hl			;b7b0
	ld (hl),b			;b7b1
	inc (ix+003h)		;b7b2
	ld a,b			;b7b5
	jr L_B7C5		;b7b6
L_B7B8:
	ex de,hl			;b7b8   ; al de la izquierda
	ld (hl),000h		;b7b9
	dec hl			;b7bb
	dec hl			;b7bc
	dec hl			;b7bd
	dec hl			;b7be
	dec hl			;b7bf
	ld (hl),b			;b7c0
	dec (ix+002h)		;b7c1
	ld a,b			;b7c4
L_B7C5:
	push de			;b7c5
	push bc			;b7c6
	push af			;b7c7
	call L_B80F		;b7c8   ; D, E = la casilla de la mano en pixeles
	pop af			;b7cb
	call L_B7EC		;b7cc   ; pinta la pieza A (2 x 2 caracteres de 0xB64C + 4 x A)
	pop bc			;b7cf
	pop de			;b7d0
	ret			;b7d1
L_B7D2:
	ex de,hl			;b7d2   ; al de la derecha
	ld (hl),000h		;b7d3   ; el hueco donde estaba la pieza...
	inc hl			;b7d5
	inc hl			;b7d6
	inc hl			;b7d7
	inc hl			;b7d8
	inc hl			;b7d9
	ld (hl),b			;b7da   ; ...la pieza en el de la derecha...
	inc (ix+002h)		;b7db   ; ...y la mano con ella
	ld a,b			;b7de
	jr L_B7C5		;b7df
L_B7E1:
	ex de,hl			;b7e1   ; al de arriba
	ld (hl),000h		;b7e2
	dec hl			;b7e4
	ld (hl),b			;b7e5
	dec (ix+003h)		;b7e6
	ld a,b			;b7e9
	jr L_B7C5		;b7ea
L_B7EC:
	add a,a			;b7ec   ; pinta la pieza A (2 x 2 caracteres de 0xB64C + 4 x A)
	add a,a			;b7ed
	ld hl,0b64ch		;b7ee
	call 0408fh		;b7f1   ; suma A a HL (HL = HL + A)
	ld bc,00202h		;b7f4
	jp 05737h		;b7f7
L_B7FA:
	ld d,(ix+002h)		;b7fa   ; B = la pieza de la casilla de la mano (Z si es el hueco)
	ld e,(ix+003h)		;b7fd
L_B800:
	ld a,d			;b800
	add a,a			;b801
	add a,a			;b802
	add a,d			;b803
	add a,e			;b804
	ld hl,0ef20h		;b805   ; apunta a el puzle: las 25 casillas
	call 0408fh		;b808   ; suma A a HL (HL = HL + A)
	ld a,(hl)			;b80b
	ld b,a			;b80c
	and a			;b80d
	ret			;b80e
L_B80F:
	ld a,(ix+002h)		;b80f   ; D, E = la casilla de la mano en pixeles
	add a,a			;b812   ; x 16 + 0x30
	add a,a			;b813
	add a,a			;b814
	add a,a			;b815
	add a,030h		;b816
	ld e,a			;b818
	ld a,(ix+003h)		;b819
	add a,a			;b81c   ; y x 16 + 0x58
	add a,a			;b81d
	add a,a			;b81e
	add a,a			;b81f
	add a,058h		;b820
	ld d,a			;b822
	ret			;b823
L_B824:
	ld d,(ix+002h)		;b824   ; C = hacia donde esta el hueco (1 arriba, 2 abajo, 3 izquierda, 4 derecha; 0 no esta al lado)
	ld e,(ix+003h)		;b827
	ld c,001h		;b82a
	ld a,d			;b82c   ; arriba (si no esta en la fila 0)
	and a			;b82d
	jr z,L_B837		;b82e
	push de			;b830
	dec d			;b831
	call L_B800		;b832
	pop de			;b835
	ret z			;b836
L_B837:
	inc c			;b837   ; abajo (si no esta en la 4)
	ld a,d			;b838
	cp 004h		;b839
	jr nc,L_B844		;b83b
	push de			;b83d
	inc d			;b83e
	call L_B800		;b83f
	pop de			;b842
	ret z			;b843
L_B844:
	inc c			;b844   ; izquierda (si no esta en la columna 0)
	ld a,e			;b845
	and a			;b846
	jr z,L_B850		;b847
	push de			;b849
	dec e			;b84a
	call L_B800		;b84b
	pop de			;b84e
	ret z			;b84f
L_B850:
	inc c			;b850   ; derecha (si no esta en la 4)
	ld a,e			;b851
	cp 004h		;b852
	jr nc,L_B85B		;b854
	inc e			;b856
	call L_B800		;b857
	ret z			;b85a
L_B85B:
	ld c,000h		;b85b   ; ninguno
	ret			;b85d
L_B85E:
	ld de,0ef20h		;b85e   ; paso 4: si las piezas estan en orden (1-24)...
	ld hl,0ef21h		;b861
	ld a,(de)			;b864
	cp 001h		;b865
	jr nz,L_B876		;b867
L_B869:
	ld a,(de)			;b869   ; cada pieza tiene que ser la anterior + 1...
	inc a			;b86a
	cp (hl)			;b86b
	jr nz,L_B876		;b86c
	cp 018h		;b86e   ; ...hasta la 24
	jr z,L_B87A		;b870
	inc de			;b872
	inc hl			;b873
	jr L_B869		;b874
L_B876:
	dec (ix+001h)		;b876   ; no: sigue el puzle
	ret			;b879
L_B87A:
	call 05d41h		;b87a   ; ...resuelto: 3 vidas mas (hasta 99) y el letrero de 0xB5C7
	inc (ix+001h)		;b87d
	ld a,(0e240h)		;b880   ; lee las vidas (BCD)
	add a,003h		;b883
	cp 099h		;b885
	jr nc,L_B88C		;b887
	daa			;b889
	jr L_B88E		;b88a
L_B88C:
	ld a,099h		;b88c
L_B88E:
	ld (0e240h),a		;b88e   ; guarda las vidas (BCD)
	ld hl,0b8afh		;b891
	call 051d4h		;b894   ; lo mismo, borrando (caracter 0)
	ld hl,0b5c7h		;b897
	jp 051d0h		;b89a
L_B89D:
	ld a,(0e207h)		;b89d   ; paso 5: el disparo sale
	and 010h		;b8a0
	ret z			;b8a2
L_B8A3:
	ld bc,00007h		;b8a3   ; sale: el borde a 0 y el sonido 1
	ld (ix+000h),b		;b8a6
	call 00047h		;b8a9   ; BIOS WRTVDP - Writes data in the VDP-register
	jp 041e0h		;b8ac

; ----------------------------------------------------------------------
; DATOS letrero_B8AF: letrero (del puzle): [x][y] y caracteres, 0xFE [x][y]
;   otro sitio, 0xFF acaba; se solapan 2 bloques: (letrero_B8BE B8BE-B8CF); lo
;   leen p12:B6E9, p12:B6FE (32 bytes)
;   0xb8af..0xb8cf  (32 bytes)
DATA_letrero_B8AF:
	defb 050h,0a0h,0e5h,0eeh,0e4h,000h,000h,0e5h,0f3h,0e3h,000h,0ebh,0e5h,0f9h,0feh,048h	; b8af  P..............H
	defb 090h,0f0h,0f5h,0f3h,0e8h,000h,0f3h,0f0h,0e1h,0e3h,0e5h,000h,0ebh,0e5h,0f9h,0ffh	; b8bf  ................

; ======================================================================
; CODIGO 0xb8cf..0xb913  (68 bytes)
; ======================================================================


L_B8CF:
	ld hl,0e800h		;b8cf   ; la mano (cuatro sprites con los colores de 0xB913)
	ld de,0b913h		;b8d2
	ld bc,00400h		;b8d5
	exx			;b8d8
	ld hl,0d200h		;b8d9   ; apunta a los colores de los sprites (16 bytes por sprite)
	exx			;b8dc
L_B8DD:
	push bc			;b8dd
	ld a,(ix+002h)		;b8de   ; la x de la mano...
	add a,a			;b8e1
	add a,a			;b8e2
	add a,a			;b8e3
	add a,a			;b8e4
	add a,034h		;b8e5
	ld c,a			;b8e7
	ld a,b			;b8e8
	cp 003h		;b8e9   ; ...los dos de abajo 16 mas
	jr nc,L_B8F1		;b8eb
	ld a,c			;b8ed
	add a,010h		;b8ee
	ld c,a			;b8f0
L_B8F1:
	ld (hl),c			;b8f1
	inc hl			;b8f2
	ld a,(ix+003h)		;b8f3   ; la y
	add a,a			;b8f6
	add a,a			;b8f7
	add a,a			;b8f8
	add a,a			;b8f9
	add a,05ch		;b8fa
	ld (hl),a			;b8fc
	pop bc			;b8fd
	inc hl			;b8fe
	ld (hl),c			;b8ff   ; el dibujo
	ld a,c			;b900
	add a,004h		;b901
	ld c,a			;b903
	inc hl			;b904
	inc hl			;b905
	ld a,(de)			;b906   ; su color, 16 veces
	inc de			;b907
	exx			;b908
	ld b,010h		;b909
L_B90B:
	ld (hl),a			;b90b
	inc hl			;b90c
	djnz L_B90B		;b90d
	exx			;b90f   ; el sprite siguiente
	djnz L_B8DD		;b910
	ret			;b912

; ----------------------------------------------------------------------
; DATOS colores_mano: los colores de los 4 sprites de la mano del puzle; lo
;   leen p12:B906 (4 bytes)
;   0xb913..0xb917  (4 bytes)
DATA_colores_mano:
	defb 00dh,04eh,00dh,04eh	; b913

; ======================================================================
; CODIGO 0xb917..0xb98a  (115 bytes)
; ======================================================================


L_B917:
	ld a,(ix+001h)		;b917   ; las musicas: por pasos
	cp 001h		;b91a
	jr z,L_B938		;b91c
	jr nc,L_B981		;b91e   ; paso 0: graficos, el dibujo de 0xBC05 y el letrero
	call 04e98h		;b920   ; pantalla en negro: quita sprites, borra la pagina y apaga la pantalla
	call 057ach		;b923   ; los graficos de la lista 0xB7DF (bancos 7-8-9) y la paleta de 0xBA78
	call 057cah		;b926   ; las rachas de 0xBA9A a 0xF800 (dibujos de los sprites)
	call 0578dh		;b929   ; un dibujo de caracteres de 0xBC05 en 0x1830 (13 x 26), con la pantalla apagada
	call 05d41h		;b92c   ; los atributos de los sprites (0xE800, 0x80 bytes) a 0xE0: fuera de la pantalla
	inc (ix+001h)		;b92f
	ld hl,0b585h		;b932
	jp 051d0h		;b935
L_B938:
	call L_B9B0		;b938   ; paso 1: arriba y abajo eligen (19, IX+02), el disparo la pone; RETURN sale
	ld a,(0e207h)		;b93b   ; lee el mando: lo que se acaba de pulsar
	rra			;b93e
	rra			;b93f
	rra			;b940
	jr c,L_B95A		;b941
	rra			;b943
	jr c,L_B96A		;b944
	rra			;b946
	jr c,L_B97B		;b947
	ld a,(0e20ch)		;b949   ; lee las teclas: lo que se acaba de pulsar (bit 0 pausa, 1 recuadro, 3 musica, 4 disparo)
	rla			;b94c
	ret nc			;b94d
	ld bc,00007h		;b94e
	ld (ix+000h),b		;b951
	call 00047h		;b954   ; BIOS WRTVDP - Writes data in the VDP-register
	jp 041e0h		;b957
L_B95A:
	call 042cbh		;b95a   ; pide el sonido 0x32
	dec (ix+002h)		;b95d
	ld a,(ix+002h)		;b960
	rla			;b963
	ret nc			;b964
	ld (ix+002h),012h		;b965
	ret			;b969
L_B96A:
	call 042cbh		;b96a   ; pide el sonido 0x32
	inc (ix+002h)		;b96d
	ld a,(ix+002h)		;b970
	cp 013h		;b973
	ret c			;b975
	ld (ix+002h),000h		;b976
	ret			;b97a
L_B97B:
	inc (ix+001h)		;b97b
	jp 041e0h		;b97e
L_B981:
	dec (ix+001h)		;b981   ; la pone (tabla detras, una peticion de sonido por musica)
	ld a,(ix+002h)		;b984
	call 04099h		;b987   ; el despachador de Konami: la tabla va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_B98A: 19 destinos del despachador p00:4099 (call en p12:B987, el
;   indice en A): 41EA, 41F4, 41F9, 41FE, 4203, 4208, 420D, 4212, 4217, 421C,
;   4221, 4226, 422B, 4230, 4235, 4249, 429E, 42A3, 426C; lo leen p12:B987 (38
;   bytes)
;   0xb98a..0xb9b0  (38 bytes)
DATA_tabla_B98A:
	defw 041eah,041f4h,041f9h,041feh,04203h,04208h,0420dh,04212h	; b98a
	defw 04217h,0421ch,04221h,04226h,0422bh,04230h,04235h,04249h	; b99a
	defw 0429eh,042a3h,0426ch	; b9aa

; ======================================================================
; CODIGO 0xb9b0..0xb9fa  (74 bytes)
; ======================================================================


L_B9B0:
	ld hl,0e800h		;b9b0   ; los sprites de la flecha (tablas 0xB9FA y 0xBA0D)
	ld de,0ba0dh		;b9b3
	ld bc,00400h		;b9b6
	exx			;b9b9
	ld hl,0d200h		;b9ba   ; apunta a los colores de los sprites (16 bytes por sprite)
	exx			;b9bd
L_B9BE:
	push bc			;b9be
	ld a,(ix+002h)		;b9bf   ; la musica elegida: su sitio en la tabla 0xB9FA
	exx			;b9c2
	ld de,0b9fah		;b9c3
	add a,e			;b9c6
	ld e,a			;b9c7
	jr nc,L_B9CB		;b9c8
	inc d			;b9ca
L_B9CB:
	ld a,(de)			;b9cb   ; bit 0: columna 0x60 o 0x78
	exx			;b9cc
	push af			;b9cd
	rra			;b9ce
	ld c,078h		;b9cf
	jr nc,L_B9D5		;b9d1
	ld c,060h		;b9d3
L_B9D5:
	ld a,b			;b9d5   ; los dos de abajo 16 mas
	cp 003h		;b9d6
	jr nc,L_B9DE		;b9d8
	ld a,c			;b9da
	add a,010h		;b9db
	ld c,a			;b9dd
L_B9DE:
	ld (hl),c			;b9de   ; la x
	pop af			;b9df
	inc hl			;b9e0
	and 0feh		;b9e1   ; la y (sin el bit 0)
	ld (hl),a			;b9e3
	pop bc			;b9e4
	inc hl			;b9e5
	ld (hl),c			;b9e6   ; el dibujo
	ld a,c			;b9e7
	add a,004h		;b9e8
	ld c,a			;b9ea
	inc hl			;b9eb
	inc hl			;b9ec
	ld a,(de)			;b9ed   ; su color
	inc de			;b9ee
	exx			;b9ef
	ld b,010h		;b9f0
L_B9F2:
	ld (hl),a			;b9f2   ; 16 veces
	inc hl			;b9f3
	djnz L_B9F2		;b9f4
	exx			;b9f6
	djnz L_B9BE		;b9f7   ; el sprite siguiente
	ret			;b9f9

; ----------------------------------------------------------------------
; DATOS musicas_flecha: 19 bytes: donde va la flecha de cada musica; lo leen
;   p12:B9CB (19 bytes)
;   0xb9fa..0xba0d  (19 bytes)
DATA_musicas_flecha:
	defb 02ch,033h,03ch,045h,04ch,055h,05ch,06ch,073h,07ch,085h,08ch,09ch,0a3h,0ach,0b5h,0bch,0c5h,0cch	; b9fa  ,3<ELU\ls|.........

; ----------------------------------------------------------------------
; DATOS colores_flecha: los colores de los 4 sprites de la flecha; lo leen
;   p12:B9ED (4 bytes)
;   0xba0d..0xba11  (4 bytes)
DATA_colores_flecha:
	defb 00dh,04eh,00dh,04eh	; ba0d

; ======================================================================
; CODIGO 0xba11..0xba3b  (42 bytes)
; ======================================================================


L_BA11:
	ld hl,001ffh		;ba11   ; la demostracion: la fase de la tabla 0xBA3A (una de 6, 0xE219 va dando la vuelta)
	ld (0e209h),hl		;ba14   ; 0xE209/0xE20A: el mando grabado
	ld hl,0e219h		;ba17   ; apunta a la demostracion siguiente (1-6)
	ld a,(hl)			;ba1a
	ld de,0ba3ah		;ba1b
	call 04094h		;ba1e   ; suma A a DE (DE = DE + A)
	ld a,(de)			;ba21
	ld (0e242h),a		;ba22   ; guarda la fase (1-60)
	inc (hl)			;ba25
	ld a,(hl)			;ba26
	cp 007h		;ba27
	jr c,L_BA2D		;ba29
	ld (hl),001h		;ba2b
L_BA2D:
	xor a			;ba2d   ; cuenta a cero, empieza la fase y la musica
	ld (0e203h),a		;ba2e   ; guarda la cuenta de cuadros
	inc a			;ba31
	ld (0e246h),a		;ba32   ; guarda la marca de fase empezada
	call 04360h		;ba35   ; con los bancos 1-2-3, llama a 0x5C80 y pone el 12 en 0xA000
	jp 04388h		;ba38

; ----------------------------------------------------------------------
; DATOS sin identificar  0xba3b..0xba41  (6 bytes)
DATA_BA3B:
	defb 002h,012h,01ah,028h,030h,035h	; ba3b

; ======================================================================
; CODIGO 0xba41..0xba94  (83 bytes)
; ======================================================================


L_BA41:
	ld a,(0e248h)		;ba41   ; un cuadro de la demostracion: la partida con el mando grabado; si muere, se acaba
	and a			;ba44
	jr nz,L_BA57		;ba45
	call 04358h		;ba47   ; con los bancos 1-2-3, llama a 0x5D63 y pone el 12 en 0xA000
	ld a,(0e280h)		;ba4a   ; lee el estado del personaje
	cp 005h		;ba4d
	ret nz			;ba4f
L_BA50:
	xor a			;ba50
	ld (0e246h),a		;ba51   ; guarda la marca de fase empezada
	jp 041e0h		;ba54
L_BA57:
	xor a			;ba57   ; sale de la pantalla: a la de al lado
	ld (0e24dh),a		;ba58   ; guarda la marca de borde sin pantalla al otro lado
	call 05dfeh		;ba5b   ; pasa a la pantalla de al lado al salir por el borde 0xE248 (1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ld a,(0e24dh)		;ba5e   ; lee la marca de borde sin pantalla al otro lado
	and a			;ba61
	ret nz			;ba62
	jp 04369h		;ba63
L_BA66:
	ld hl,0e20ah		;ba66   ; el mando de la demostracion: [teclas][cuadros] de la tabla de la piramide (0xBA92)
	dec (hl)			;ba69
	jr nz,L_BA7A		;ba6a
	dec hl			;ba6c
	inc (hl)			;ba6d
	inc hl			;ba6e
	call L_BA80		;ba6f   ; A = las teclas y C = los cuadros del paso 0xE209 de la piramide
	cp 0ffh		;ba72   ; 0xFF acaba la demostracion
	jr z,L_BA50		;ba74
	ld hl,0e20ah		;ba76
	ld (hl),c			;ba79
L_BA7A:
	call L_BA80		;ba7a   ; las teclas, como si se pulsaran
	jp 05434h		;ba7d
L_BA80:
	dec hl			;ba80   ; A = las teclas y C = los cuadros del paso 0xE209 de la piramide
	ld c,(hl)			;ba81
	ld a,(0e241h)		;ba82   ; lee la piramide (1-6)
	ld hl,lba92h		;ba85
	call 04d4ch		;ba88   ; HL = la palabra A de la tabla de HL
	ld a,c			;ba8b
	add a,a			;ba8c
	call 0408fh		;ba8d   ; suma A a HL (HL = HL + A)
	ld c,(hl)			;ba90
	inc hl			;ba91
L_BA92:
	ld a,(hl)			;ba92
	ret			;ba93

; ----------------------------------------------------------------------
; DATOS mandos_demo: 6 punteros, uno por piramide (0xE241, desde 0xBA92): el
;   mando grabado de su demostracion; lo leen p12:BA88 (12 bytes)
;   0xba94..0xbaa0  (12 bytes)
DATA_mandos_demo:
	defw 0baa0h,0bad6h,0bb14h,0bb5ah,0bbbah,0bc16h	; ba94

; ----------------------------------------------------------------------
; DATOS sin identificar  0xbaa0..0xbc6e  (462 bytes)
DATA_BAA0:
	defb 02eh,000h,00fh,008h,010h,000h,00dh,004h,011h,000h,037h,008h,01bh,000h,019h,008h	; baa0  ..........7.....
	defb 011h,000h,010h,008h,00dh,000h,043h,008h,00ch,000h,058h,004h,013h,000h,003h,008h	; bab0  ......C...X.....
	defb 008h,000h,009h,010h,012h,000h,039h,008h,015h,000h,01fh,004h,047h,000h,010h,004h	; bac0  ......9.....G...
	defb 00eh,000h,009h,008h,000h,0ffh,029h,000h,090h,004h,01bh,000h,0adh,008h,01ah,000h	; bad0  ......).........
	defb 003h,008h,00bh,000h,018h,001h,00ah,000h,019h,008h,008h,000h,023h,001h,006h,000h	; bae0  ............#...
	defb 004h,004h,00dh,000h,00dh,010h,033h,000h,00eh,008h,00ah,000h,01eh,004h,008h,000h	; baf0  ......3.........
	defb 017h,001h,004h,000h,00dh,004h,00dh,000h,01eh,010h,02fh,000h,06ch,004h,042h,000h	; bb00  ........../.l.B.
	defb 030h,004h,000h,0ffh,036h,000h,02dh,004h,008h,014h,01ah,004h,010h,000h,02dh,008h	; bb10  0...6.-.......-.
	defb 002h,009h,033h,001h,001h,009h,072h,008h,014h,000h,032h,002h,011h,000h,01ah,008h	; bb20  ..3...r...2.....
	defb 00ah,018h,01eh,008h,006h,000h,032h,004h,007h,000h,008h,008h,00dh,000h,008h,010h	; bb30  ......2.........
	defb 037h,000h,051h,008h,002h,009h,024h,001h,008h,000h,012h,008h,002h,018h,016h,008h	; bb40  7.Q...$.........
	defb 001h,009h,028h,001h,001h,005h,0a0h,004h,000h,0ffh,041h,000h,040h,004h,001h,000h	; bb50  ..(.......A.@...
	defb 0a4h,008h,002h,00ah,015h,002h,006h,000h,01eh,004h,001h,006h,00bh,002h,001h,006h	; bb60  ................
	defb 00fh,004h,001h,006h,00ch,002h,001h,006h,00fh,004h,001h,006h,00ch,002h,002h,006h	; bb70  ................
	defb 00eh,004h,001h,006h,00bh,002h,002h,006h,015h,004h,001h,006h,00eh,002h,001h,006h	; bb80  ................
	defb 016h,004h,00fh,000h,013h,004h,007h,000h,001h,004h,003h,000h,002h,004h,01fh,000h	; bb90  ................
	defb 01eh,004h,01dh,000h,005h,004h,009h,014h,001h,004h,00eh,000h,006h,014h,05eh,004h	; bba0  ..............^.
	defb 013h,000h,037h,008h,002h,018h,012h,010h,000h,0ffh,036h,000h,051h,004h,033h,000h	; bbb0  ..7.......6.Q.3.
	defb 006h,010h,02eh,000h,084h,004h,00dh,000h,007h,010h,012h,000h,00eh,008h,009h,000h	; bbc0  ................
	defb 019h,001h,00ch,008h,018h,001h,005h,000h,008h,004h,001h,005h,014h,001h,002h,000h	; bbd0  ................
	defb 008h,008h,001h,000h,015h,001h,032h,004h,00ah,000h,019h,004h,007h,000h,00dh,010h	; bbe0  ......2.........
	defb 022h,000h,012h,004h,00eh,000h,012h,004h,004h,014h,00dh,004h,004h,014h,007h,004h	; bbf0  "...............
	defb 00fh,000h,00fh,008h,007h,018h,00dh,008h,01dh,000h,015h,008h,043h,000h,00fh,004h	; bc00  ............C...
	defb 001h,000h,025h,008h,000h,0ffh,040h,000h,032h,008h,004h,000h,013h,004h,00ah,000h	; bc10  ..%...@.2.......
	defb 04dh,002h,003h,000h,009h,004h,00bh,000h,026h,004h,00bh,014h,01bh,004h,006h,014h	; bc20  M.......&.......
	defb 010h,004h,005h,014h,00dh,004h,01dh,000h,008h,004h,004h,014h,028h,004h,007h,014h	; bc30  ............(...
	defb 013h,004h,028h,000h,045h,004h,00eh,000h,004h,004h,00eh,000h,01dh,004h,00bh,000h	; bc40  ..(.E...........
	defb 014h,010h,01ch,000h,029h,004h,005h,014h,00bh,004h,005h,014h,019h,004h,003h,014h	; bc50  ....)...........
	defb 022h,004h,006h,014h,005h,004h,033h,000h,00bh,018h,008h,008h,000h,0ffh	; bc60  ".....3.......

; ======================================================================
; CODIGO 0xbc6e..0xbd97  (297 bytes)
; ======================================================================


L_BC6E:
	xor a			;bc6e   ; las estrellas del final: 0xE910 (32 de 16 bytes) a cero
	ld hl,0e910h		;bc6f   ; apunta a en el final, las estrellas (32 x 16 bytes); en la partida, parte del mapa
	ld de,0e911h		;bc72
	ld (hl),a			;bc75
	ld bc,001ffh		;bc76
	ldir		;bc79
	ld (0e901h),a		;bc7b
	ld (0e902h),a		;bc7e
	inc a			;bc81
	ld (0e900h),a		;bc82   ; guarda el mapa de la fase: 0xC0 bytes por pantalla, 4 casillas por byte
	ret			;bc85
L_BC86:
	ld a,(0e902h)		;bc86   ; cada 2 cuadros sale una estrella nueva del centro (0x70, 0x80)
	or a			;bc89
	ret nz			;bc8a
	ld hl,0e900h		;bc8b   ; apunta a el mapa de la fase: 0xC0 bytes por pantalla, 4 casillas por byte
	dec (hl)			;bc8e
	ret nz			;bc8f
	ld (hl),002h		;bc90
	ld ix,0e910h		;bc92   ; apunta a en el final, las estrellas (32 x 16 bytes); en la partida, parte del mapa
	ld b,020h		;bc96
L_BC98:
	ld a,(ix+000h)		;bc98   ; busca una estrella libre
	or a			;bc9b
	jr z,L_BCA6		;bc9c
	ld de,00010h		;bc9e   ; la siguiente (16 bytes)
	add ix,de		;bca1
	djnz L_BC98		;bca3
	ret			;bca5
L_BCA6:
	xor a			;bca6   ; su velocidad, de las tablas 0xBDB7 y 0xBD97 por la direccion
	ld (ix+000h),001h		;bca7
	ld (ix+001h),a		;bcab
	ld (ix+002h),070h		;bcae
	ld (ix+003h),a		;bcb2
	ld (ix+004h),080h		;bcb5
	ld hl,0e901h		;bcb9
	inc (hl)			;bcbc
	ld a,(hl)			;bcbd
	and 00fh		;bcbe
	ld b,008h		;bcc0
	call L_BD74		;bcc2   ; HL, DE = la velocidad en y y en x de la direccion A, por B
	ld (ix+005h),l		;bcc5
	ld (ix+006h),h		;bcc8
	ld (ix+007h),e		;bccb
	ld (ix+008h),d		;bcce
	ret			;bcd1
L_BCD2:
	call L_BC86		;bcd2   ; un cuadro de las estrellas
	call L_BD30		;bcd5   ; los sprites fuera, de color 5
	call L_BCDD		;bcd8
	jr L_BD4B		;bcdb
L_BCDD:
	ld ix,0e910h		;bcdd   ; apunta a en el final, las estrellas (32 x 16 bytes); en la partida, parte del mapa
	ld b,020h		;bce1
L_BCE3:
	ld a,(ix+000h)		;bce3
	or a			;bce6
	push bc			;bce7
	call nz,L_BCF4		;bce8   ; la x + su velocidad (16 bits)
	pop bc			;bceb
	ld de,00010h		;bcec
	add ix,de		;bcef
	djnz L_BCE3		;bcf1
	ret			;bcf3
L_BCF4:
	ld e,(ix+001h)		;bcf4   ; la x + su velocidad (16 bits)
	ld d,(ix+002h)		;bcf7
	ld l,(ix+005h)		;bcfa
	ld h,(ix+006h)		;bcfd
	add hl,de			;bd00
	ld (ix+001h),l		;bd01
	ld (ix+002h),h		;bd04
	ld e,(ix+003h)		;bd07   ; la y + su velocidad
	ld d,(ix+004h)		;bd0a
	ld l,(ix+007h)		;bd0d
	ld h,(ix+008h)		;bd10
	add hl,de			;bd13
	ld (ix+003h),l		;bd14
	ld (ix+004h),h		;bd17
	ld a,(ix+002h)		;bd1a   ; fuera de la pantalla (x o y mas alla de 0xF0)...
	add a,010h		;bd1d
	cp 020h		;bd1f
	jr c,L_BD2B		;bd21
	ld a,(ix+004h)		;bd23
	add a,010h		;bd26
	cp 020h		;bd28
	ret nc			;bd2a
L_BD2B:
	ld (ix+000h),000h		;bd2b   ; ...se quita
	ret			;bd2f
L_BD30:
	ld hl,0e800h		;bd30   ; los sprites fuera, de color 5
	ld de,0e801h		;bd33
	ld (hl),0e0h		;bd36
	ld bc,0007fh		;bd38
	ldir		;bd3b
	ld hl,0d200h		;bd3d   ; apunta a los colores de los sprites (16 bytes por sprite)
	ld de,0d201h		;bd40
	ld (hl),005h		;bd43
	ld bc,00400h		;bd45
	ldir		;bd48
	ret			;bd4a
L_BD4B:
	ld ix,0e910h		;bd4b   ; los sprites de las estrellas (dibujo 0xD0)
	ld hl,0e800h		;bd4f   ; apunta a los atributos de los sprites (y, x, dibujo, color); al cargar graficos, su bufer
	ld b,020h		;bd52
L_BD54:
	ld a,(ix+000h)		;bd54   ; cada estrella...
	or a			;bd57
	push bc			;bd58
	call nz,L_BD65		;bd59   ; ...su sprite
	pop bc			;bd5c
	ld de,00010h		;bd5d   ; la siguiente (16 bytes)
	add ix,de		;bd60
	djnz L_BD54		;bd62
	ret			;bd64
L_BD65:
	ld a,(ix+002h)		;bd65   ; un sprite: y...
	ld (hl),a			;bd68
	inc hl			;bd69
	ld a,(ix+004h)		;bd6a   ; ...x...
	ld (hl),a			;bd6d
	inc hl			;bd6e
	ld (hl),0d0h		;bd6f   ; ...y el dibujo 0xD0
	inc hl			;bd71
	inc hl			;bd72
	ret			;bd73
L_BD74:
	push af			;bd74   ; HL, DE = la velocidad en y y en x de la direccion A, por B
	ld hl,0bdb7h		;bd75
	call 04d4ch		;bd78   ; HL = la palabra A de la tabla de HL
	ld e,l			;bd7b
	ld d,h			;bd7c
	ld hl,00000h		;bd7d
	push bc			;bd80
L_BD81:
	add hl,de			;bd81
	djnz L_BD81		;bd82
	pop bc			;bd84
	pop af			;bd85
	push hl			;bd86
	ld hl,0bd97h		;bd87
	call 04d4ch		;bd8a   ; HL = la palabra A de la tabla de HL
	ld e,l			;bd8d
	ld d,h			;bd8e
	ld hl,00000h		;bd8f
L_BD92:
	add hl,de			;bd92
	djnz L_BD92		;bd93
	pop de			;bd95
	ret			;bd96

; ----------------------------------------------------------------------
; DATOS estrellas_x: 16 velocidades en x de las estrellas; lo leen p12:BD8A
;   (32 bytes)
;   0xbd97..0xbdb7  (32 bytes)
DATA_estrellas_x:
	defw 00000h,0ff23h,00080h,0ff4bh,0ff80h,00100h,00080h,0ff23h	; bd97
	defw 000ddh,0ff4bh,0ff80h,00000h,000b5h,0ff00h,000b5h,000ddh	; bda7

; ----------------------------------------------------------------------
; DATOS estrellas_y: 16 velocidades en y de las estrellas; lo leen p12:BD78
;   (32 bytes)
;   0xbdb7..0xbdd7  (32 bytes)
DATA_estrellas_y:
	defw 00100h,0ff80h,0ff23h,000b5h,0ff23h,00000h,000ddh,00080h	; bdb7
	defw 0ff80h,0ff4bh,000ddh,0ff00h,000b5h,00000h,0ff4bh,00080h	; bdc7

; ======================================================================
; CODIGO 0xbdd7..0xbe67  (144 bytes)
; ======================================================================


L_BDD7:
	call L_BDF7		;bdd7   ; el personaje de las secuencias: seis sprites
L_BDDA:
	ld hl,0e830h		;bdda   ; y el sprite 12 en (0xEDCB, 0xEDCC)
	ld a,(0edcbh)		;bddd   ; y
	ld (hl),a			;bde0
	inc hl			;bde1
	ld a,(0edcch)		;bde2   ; x
	ld (hl),a			;bde5
	inc hl			;bde6
	ld (hl),0d0h		;bde7   ; dibujo 0xD0
	ld hl,0d2c0h		;bde9   ; de color 7
	ld de,0d2c1h		;bdec
	ld bc,0000fh		;bdef
	ld (hl),007h		;bdf2
	ldir		;bdf4
	ret			;bdf6
L_BDF7:
	ld a,(0edd8h)		;bdf7   ; dos posturas (0xEDD8)
	or a			;bdfa
	ld a,004h		;bdfb
	jr z,L_BE01		;bdfd
	ld a,034h		;bdff
L_BE01:
	ld hl,0e800h		;be01   ; apunta a los atributos de los sprites (y, x, dibujo, color); al cargar graficos, su bufer
	ld de,0a868h		;be04
	call L_BE18		;be07   ; dos sprites de 16 x 16 uno al lado de otro
	ld de,0a878h		;be0a
	call L_BE18		;be0d   ; dos sprites de 16 x 16 uno al lado de otro
	ld de,0a888h		;be10
	call L_BE18		;be13   ; dos sprites de 16 x 16 uno al lado de otro
	jr L_BE35		;be16
L_BE18:
	ld b,002h		;be18   ; dos sprites de 16 x 16 uno al lado de otro
L_BE1A:
	ld (hl),e			;be1a   ; el de la izquierda...
	inc hl			;be1b
	ld (hl),d			;be1c
	inc hl			;be1d
	ld (hl),a			;be1e
	inc hl			;be1f
	inc hl			;be20
	add a,004h		;be21
	ld (hl),e			;be23   ; ...y el de la derecha, 4 dibujos mas
	inc hl			;be24
	ld (hl),d			;be25
	inc hl			;be26
	ld (hl),a			;be27
	inc hl			;be28
	inc hl			;be29
	push af			;be2a   ; los dos de abajo, 16 pixeles mas
	ld a,d			;be2b
	add a,010h		;be2c
	ld d,a			;be2e
	pop af			;be2f
	add a,004h		;be30
	djnz L_BE1A		;be32
	ret			;be34
L_BE35:
	ld hl,0d200h		;be35   ; sus colores, 13 y 0x4E
	ld de,0d201h		;be38
	ld bc,0000fh		;be3b
	ld (hl),00dh		;be3e   ; el primero de color 13
	ldir		;be40
	call L_BE5D		;be42   ; los demas: 0x4E, 13, 0x4E...
	call L_BE54		;be45
	call L_BE54		;be48
	call L_BE54		;be4b
	call L_BE54		;be4e
	call L_BE54		;be51
L_BE54:
	inc hl			;be54
	inc de			;be55
	ld bc,0000fh		;be56
	ld (hl),00dh		;be59
	ldir		;be5b
L_BE5D:
	inc hl			;be5d   ; 16 bytes de color 0x4E
	inc de			;be5e
	ld bc,0000fh		;be5f
	ld (hl),04eh		;be62
	ldir		;be64
	ret			;be66

; ----------------------------------------------------------------------
; DATOS letrero_BE67: letrero (de la cinta): [x][y] y caracteres, 0xFE [x][y]
;   otro sitio, 0xFF acaba; lo leen p12:BE78 (7 bytes)
;   0xbe67..0xbe6e  (7 bytes)
DATA_letrero_BE67:
	defb 048h,070h,0f3h,0ebh,0e9h,0f0h,0ffh	; be67

; ----------------------------------------------------------------------
; DATOS letrero_BE6E: letrero (de la cinta): [x][y] y caracteres, 0xFE [x][y]
;   otro sitio, 0xFF acaba; lo leen p12:BEB6 (7 bytes)
;   0xbe6e..0xbe75  (7 bytes)
DATA_letrero_BE6E:
	defb 048h,070h,0e6h,0e9h,0eeh,0e4h,0ffh	; be6e

; ======================================================================
; CODIGO 0xbe75..0xbf0e  (153 bytes)
; ======================================================================


L_BE75:
	ld hl,0be67h		;be75   ; carga de cinta: el letrero de buscar y el nombre
	call 051d0h		;be78   ; pinta un letrero: [D][E] y caracteres; 0xFE trae otra posicion; 0xFF acaba
	call L_BEF3		;be7b   ; pinta el nombre de 0xEE50
L_BE7E:
	call 000e1h		;be7e   ; BIOS TAPION - Reads the header block after turning the cassette motor on | TAPION: la cabecera de la cinta
	jp c,L_BEFC		;be81
L_BE84:
	ld c,010h		;be84   ; 16 bytes 0xAA seguidos
L_BE86:
	exx			;be86
	call 000e4h		;be87   ; BIOS TAPIN - Reads data from the tape
	exx			;be8a
	jp c,L_BEFC		;be8b
	cp 0aah		;be8e
	jr nz,L_BE84		;be90
	dec c			;be92
	jr nz,L_BE86		;be93
	ld hl,0ee50h		;be95   ; el nombre de la fase (8 letras)
	ld bc,00008h		;be98
	call L_BF1B		;be9b   ; lee BC bytes de la cinta a HL, sumandolos en D
	jr c,L_BEFC		;be9e
	call 000f0h		;bea0   ; BIOS TAPOOF - Stops writing on the tape
	ld hl,0ee50h		;bea3   ; si no es el que se busca, otra vez
	ld de,0e270h		;bea6   ; apunta a el nombre de la fase del editor (11 letras)
	ld b,008h		;bea9
L_BEAB:
	ld a,(de)			;beab
	cp (hl)			;beac
	jr nz,L_BE75		;bead
	inc de			;beaf
	inc hl			;beb0
	djnz L_BEAB		;beb1
	ld hl,0be6eh		;beb3   ; encontrado: el letrero y los seis trozos
	call 051d0h		;beb6   ; pinta un letrero: [D][E] y caracteres; 0xFE trae otra posicion; 0xFF acaba
	call L_BEF3		;beb9   ; pinta el nombre de 0xEE50
	call 000e1h		;bebc   ; BIOS TAPION - Reads the header block after turning the cassette motor on
	jr c,L_BEFC		;bebf
	ld ix,06c6dh		;bec1
	ld d,000h		;bec5
	ld b,006h		;bec7
L_BEC9:
	push bc			;bec9   ; los seis trozos de la tabla p01:6C6D, sumando los bytes
	ld l,(ix+000h)		;beca
	ld h,(ix+001h)		;becd
	ld c,(ix+002h)		;bed0
	ld b,(ix+003h)		;bed3
	call L_BF1B		;bed6   ; lee BC bytes de la cinta a HL, sumandolos en D
	pop bc			;bed9
	jr c,L_BEFC		;beda
	inc ix		;bedc
	inc ix		;bede
	inc ix		;bee0
	inc ix		;bee2
	djnz L_BEC9		;bee4
	exx			;bee6   ; la suma tiene que dar el ultimo byte
	call 000e4h		;bee7   ; BIOS TAPIN - Reads data from the tape
	exx			;beea
	jr c,L_BEFC		;beeb
	cp d			;beed
	jr nz,L_BEFC		;beee
	jp 000f0h		;bef0   ; BIOS TAPOOF - Stops writing on the tape
L_BEF3:
	ld hl,0ee50h		;bef3   ; pinta el nombre de 0xEE50
	ld de,07070h		;bef6
	jp 08a1ah		;bef9
L_BEFC:
	call 000f0h		;befc   ; BIOS TAPOOF - Stops writing on the tape | error: el letrero de 0xBF0E y 0xE27F = 2
	call 04e98h		;beff   ; pantalla en negro: quita sprites, borra la pagina y apaga la pantalla
	ld hl,0bf0eh		;bf02
	call 051d0h		;bf05   ; pinta un letrero: [D][E] y caracteres; 0xFE trae otra posicion; 0xFF acaba
	ld a,002h		;bf08
	ld (0e27fh),a		;bf0a   ; guarda el resultado de grabar o cargar (0 bien, 2 error)
	ret			;bf0d

; ----------------------------------------------------------------------
; DATOS letrero_BF0E: letrero (de error de cinta): [x][y] y caracteres, 0xFE
;   [x][y] otro sitio, 0xFF acaba; lo leen p12:BF05 (13 bytes)
;   0xbf0e..0xbf1b  (13 bytes)
DATA_letrero_BF0E:
	defb 050h,060h,0ech,0efh,0e1h,0e4h,000h,0e5h,0f2h,0f2h,0efh,0f2h,0ffh	; bf0e  P`...........

; ======================================================================
; CODIGO 0xbf1b..0xbf94  (121 bytes)
; ======================================================================


L_BF1B:
	exx			;bf1b   ; lee BC bytes de la cinta a HL, sumandolos en D
	call 000e4h		;bf1c   ; BIOS TAPIN - Reads data from the tape
	exx			;bf1f
	ret c			;bf20
	ld (hl),a			;bf21
	add a,d			;bf22
	ld d,a			;bf23
	inc hl			;bf24
	dec bc			;bf25
	ld a,b			;bf26
	or c			;bf27
	jr nz,L_BF1B		;bf28
	ret			;bf2a
L_BF2B:
	ld a,0ffh		;bf2b   ; graba en cinta: TAPOON con la cabecera larga
	call 000eah		;bf2d   ; BIOS TAPOON - Turns on the cassette motor and writes the header
	jp c,L_BF82		;bf30
	ld b,010h		;bf33
L_BF35:
	ld a,0aah		;bf35   ; 16 bytes 0xAA
	exx			;bf37
	call 000edh		;bf38   ; BIOS TAPOUT - Writes data on the tape
	exx			;bf3b
	jr c,L_BF82		;bf3c
	djnz L_BF35		;bf3e
	ld hl,0e270h		;bf40   ; el nombre (8 letras)
	ld bc,00008h		;bf43
	call L_BFA1		;bf46   ; escribe BC bytes de HL en la cinta, sumandolos en D
	jr c,L_BF82		;bf49
	call 000f0h		;bf4b   ; BIOS TAPOOF - Stops writing on the tape
	xor a			;bf4e   ; otra cabecera, corta
	call 000eah		;bf4f   ; BIOS TAPOON - Turns on the cassette motor and writes the header
	jr c,L_BF82		;bf52
	ld ix,06c6dh		;bf54   ; los seis trozos, sumando
	ld d,000h		;bf58
	ld b,006h		;bf5a
L_BF5C:
	push bc			;bf5c
	ld l,(ix+000h)		;bf5d
	ld h,(ix+001h)		;bf60
	ld c,(ix+002h)		;bf63
	ld b,(ix+003h)		;bf66
	call L_BFA1		;bf69   ; escribe BC bytes de HL en la cinta, sumandolos en D
	pop bc			;bf6c
	jr c,L_BF82		;bf6d
	inc ix		;bf6f
	inc ix		;bf71
	inc ix		;bf73
	inc ix		;bf75
	djnz L_BF5C		;bf77
	ld a,d			;bf79   ; y la suma
	call 000edh		;bf7a   ; BIOS TAPOUT - Writes data on the tape
	jr c,L_BF82		;bf7d
	jp 000f0h		;bf7f   ; BIOS TAPOOF - Stops writing on the tape
L_BF82:
	call 000f0h		;bf82   ; BIOS TAPOOF - Stops writing on the tape | error: el letrero de 0xBF94 y 0xE27F = 2
	call 04e98h		;bf85   ; pantalla en negro: quita sprites, borra la pagina y apaga la pantalla
	ld hl,0bf94h		;bf88
	call 051d0h		;bf8b   ; pinta un letrero: [D][E] y caracteres; 0xFE trae otra posicion; 0xFF acaba
	ld a,002h		;bf8e
	ld (0e27fh),a		;bf90   ; guarda el resultado de grabar o cargar (0 bien, 2 error)
	ret			;bf93

; ----------------------------------------------------------------------
; DATOS letrero_BF94: letrero (de error de cinta): [x][y] y caracteres, 0xFE
;   [x][y] otro sitio, 0xFF acaba; lo leen p12:BF8B (13 bytes)
;   0xbf94..0xbfa1  (13 bytes)
DATA_letrero_BF94:
	defb 050h,060h,0f3h,0e1h,0f6h,0e5h,000h,0e5h,0f2h,0f2h,0efh,0f2h,0ffh	; bf94  P`...........

; ======================================================================
; CODIGO 0xbfa1..0xbfb3  (18 bytes)
; ======================================================================


L_BFA1:
	ld a,(hl)			;bfa1   ; escribe BC bytes de HL en la cinta, sumandolos en D
	ld e,a			;bfa2
	inc hl			;bfa3
	exx			;bfa4
	call 000edh		;bfa5   ; BIOS TAPOUT - Writes data on the tape
	exx			;bfa8
	ret c			;bfa9
	ld a,e			;bfaa
	add a,d			;bfab
	ld d,a			;bfac
	dec bc			;bfad
	ld a,b			;bfae
	or c			;bfaf
	jr nz,L_BFA1		;bfb0
	ret			;bfb2

; ----------------------------------------------------------------------
; DATOS relleno_ff: 77 bytes a 0xFF hasta el final del banco: relleno; lo leen
;   nadie (77 bytes)
;   0xbfb3..0xc000  (77 bytes)
DATA_relleno_ff:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfb3  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfc3  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfd3  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfe3  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bff3  .............
