; ==========================================================================
; KING'S VALLEY II - Konami (1988) - MSX2 - MegaROM RC-761 de 128 KB (Konami SCC) - banco 15 (se ejecuta en 0xa000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x0a000


; ----------------------------------------------------------------------
; DATOS col27_21_cola: columna de 27 caracteres (sigue del banco 14); lo leen
;   p00:5742 (10 bytes)
;   0xa000..0xa00a  (10 bytes)
DATA_col27_21_cola:
	defb 065h,08ch,095h,066h,076h,086h,064h,064h,07eh,09eh	; a000  e..fv.dd~.

; ----------------------------------------------------------------------
; DATOS col27_22: columna de 27 caracteres; lo leen p00:5742 (27 bytes)
;   0xa00a..0xa025  (27 bytes)
DATA_col27_22:
	defb 0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,063h,083h,075h,066h,076h,086h,067h,077h,09ah,064h,064h,07eh,09eh	; a00a  ..............c.ufv.gw.dd~.

; ----------------------------------------------------------------------
; DATOS col27_23: columna de 27 caracteres; lo leen p00:5742 (27 bytes)
;   0xa025..0xa040  (27 bytes)
DATA_col27_23:
	defb 0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,063h,083h,083h,067h,077h,09ah,068h,078h,088h,064h,064h,07eh,09eh	; a025  ..............c..gw.hx.dd~.

; ----------------------------------------------------------------------
; DATOS col27_24: columna de 27 caracteres; lo leen p00:5742 (27 bytes)
;   0xa040..0xa05b  (27 bytes)
DATA_col27_24:
	defb 0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,063h,066h,076h,0a3h,078h,088h,066h,076h,086h,064h,064h,07eh,09eh	; a040  ..............cfv.x.fv.dd~.

; ----------------------------------------------------------------------
; DATOS col27_25: columna de 27 caracteres; lo leen p00:5742 (27 bytes)
;   0xa05b..0xa076  (27 bytes)
DATA_col27_25:
	defb 0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,066h,076h,067h,066h,076h,066h,076h,086h,099h,09ah,064h,064h,07eh,09eh	; a05b  .............fvgfvfv...dd~.

; ----------------------------------------------------------------------
; DATOS col27_26: columna de 27 caracteres; lo leen p00:5742 (27 bytes)
;   0xa076..0xa091  (27 bytes)
DATA_col27_26:
	defb 0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,066h,076h,067h,066h,076h,086h,099h,067h,077h,09ah,06bh,088h,064h,064h,07eh,09eh	; a076  ...........fvgfv..gw.k.dd~.

; ----------------------------------------------------------------------
; DATOS col27_27: columna de 27 caracteres; lo leen p00:5742 (27 bytes)
;   0xa091..0xa0ac  (27 bytes)
DATA_col27_27:
	defb 0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,067h,077h,068h,067h,077h,09ah,06bh,068h,078h,088h,06ch,086h,064h,064h,07eh,09eh	; a091  ...........gwhgw.khx.l.dd~.

; ----------------------------------------------------------------------
; DATOS col27_28: columna de 27 caracteres; lo leen p00:5742 (27 bytes)
;   0xa0ac..0xa0c7  (27 bytes)
DATA_col27_28:
	defb 0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,080h,090h,068h,078h,066h,068h,078h,088h,07ah,0a8h,079h,089h,085h,09ah,064h,064h,07eh,09eh	; a0ac  ...........hxfhx.z.y...dd~.

; ----------------------------------------------------------------------
; DATOS col27_29: columna de 27 caracteres; lo leen p00:5742 (27 bytes)
;   0xa0c7..0xa0e2  (27 bytes)
DATA_col27_29:
	defb 0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,080h,090h,090h,090h,068h,067h,066h,076h,086h,099h,077h,09ah,068h,078h,088h,064h,064h,07eh,09eh	; a0c7  ............hgfv..w.hx.dd~.

; ----------------------------------------------------------------------
; DATOS col27_30: columna de 27 caracteres; lo leen p00:5742 (27 bytes)
;   0xa0e2..0xa0fd  (27 bytes)
DATA_col27_30:
	defb 0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,080h,090h,090h,090h,066h,076h,068h,067h,077h,09ah,08bh,078h,058h,0a9h,0a9h,0a9h,064h,064h,07eh,09eh	; a0e2  ...........fvhgw..xX...dd~.

; ----------------------------------------------------------------------
; DATOS col27_31: columna de 27 caracteres; lo leen p00:5742 (27 bytes)
;   0xa0fd..0xa118  (27 bytes)
DATA_col27_31:
	defb 0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,080h,090h,090h,067h,077h,066h,068h,078h,088h,06ch,076h,059h,000h,000h,000h,064h,064h,07eh,09eh	; a0fd  ...........gwfhx.lvY...dd~.

; ----------------------------------------------------------------------
; DATOS col27_32: columna de 27 caracteres; lo leen p00:5742 (27 bytes)
;   0xa118..0xa133  (27 bytes)
DATA_col27_32:
	defb 0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,080h,066h,076h,086h,099h,085h,079h,066h,076h,086h,059h,000h,000h,000h,064h,064h,07eh,09eh	; a118  ..........fv...yfv.Y...dd~.

; ----------------------------------------------------------------------
; DATOS col27_33: columna de 27 caracteres; lo leen p00:5742 (27 bytes)
;   0xa133..0xa14e  (27 bytes)
DATA_col27_33:
	defb 0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,080h,090h,067h,077h,09ah,08bh,078h,088h,067h,077h,09ah,05ah,0a9h,0a9h,0a9h,064h,064h,07eh,09eh	; a133  ..........gw..x.gw.Z...dd~.

; ----------------------------------------------------------------------
; DATOS col27_34: columna de 27 caracteres; lo leen p00:5742 (27 bytes)
;   0xa14e..0xa169  (27 bytes)
DATA_col27_34:
	defb 0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,080h,090h,068h,078h,088h,098h,066h,076h,068h,078h,088h,05ch,066h,076h,086h,064h,064h,07eh,09eh	; a14e  ..........hx..fvhx.\fv.dd~.

; ----------------------------------------------------------------------
; DATOS col27_35: columna de 27 caracteres; lo leen p00:5742 (27 bytes)
;   0xa169..0xa184  (27 bytes)
DATA_col27_35:
	defb 0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,080h,090h,084h,094h,097h,067h,077h,079h,089h,085h,093h,067h,077h,09ah,064h,064h,07eh,09eh	; a169  ..............gwy...gw.dd~.

; ----------------------------------------------------------------------
; DATOS col27_36: columna de 27 caracteres; lo leen p00:5742 (27 bytes)
;   0xa184..0xa19f  (27 bytes)
DATA_col27_36:
	defb 0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,067h,077h,066h,068h,078h,088h,066h,076h,086h,08bh,078h,088h,064h,064h,07eh,09eh	; a184  ...........gwfhx.fv..x.dd~.

; ----------------------------------------------------------------------
; DATOS col27_37: columna de 27 caracteres; lo leen p00:5742 (27 bytes)
;   0xa19f..0xa1ba  (27 bytes)
DATA_col27_37:
	defb 0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,068h,078h,067h,09ah,066h,076h,067h,077h,09ah,06ch,076h,086h,064h,064h,07eh,09eh	; a19f  ...........hxg.fvgw.lv.dd~.

; ----------------------------------------------------------------------
; DATOS col27_38: columna de 27 caracteres; lo leen p00:5742 (27 bytes)
;   0xa1ba..0xa1d5  (27 bytes)
DATA_col27_38:
	defb 0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,068h,078h,067h,077h,068h,078h,088h,099h,077h,09ah,064h,064h,07eh,09eh	; a1ba  .............hxgwhx..w.dd~.

; ----------------------------------------------------------------------
; DATOS col27_39: columna de 27 caracteres; lo leen p00:5742 (27 bytes)
;   0xa1d5..0xa1f0  (27 bytes)
DATA_col27_39:
	defb 0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,063h,068h,078h,082h,092h,085h,093h,078h,088h,064h,064h,07eh,09eh	; a1d5  ..............chx....x.dd~.

; ----------------------------------------------------------------------
; DATOS col27_40: columna de 27 caracteres; lo leen p00:5742 (27 bytes)
;   0xa1f0..0xa20b  (27 bytes)
DATA_col27_40:
	defb 0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,063h,083h,068h,089h,093h,0a4h,066h,076h,086h,064h,064h,07eh,09eh	; a1f0  ..............c.h...fv.dd~.

; ----------------------------------------------------------------------
; DATOS col27_41: columna de 27 caracteres; lo leen p00:5742 (27 bytes)
;   0xa20b..0xa226  (27 bytes)
DATA_col27_41:
	defb 0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,063h,083h,083h,068h,0a4h,082h,067h,077h,09ah,064h,064h,07eh,09eh	; a20b  ..............c..h..gw.dd~.

; ----------------------------------------------------------------------
; DATOS col27_42: columna de 27 caracteres; lo leen p00:5742 (27 bytes)
;   0xa226..0xa241  (27 bytes)
DATA_col27_42:
	defb 0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,063h,083h,083h,083h,083h,000h,068h,078h,088h,064h,064h,07eh,09eh	; a226  ..............c.....hx.dd~.

; ----------------------------------------------------------------------
; DATOS col27_43: columna de 27 caracteres; lo leen p00:5742 (27 bytes)
;   0xa241..0xa25c  (27 bytes)
DATA_col27_43:
	defb 0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,063h,083h,083h,083h,08ch,095h,087h,081h,091h,064h,064h,07eh,09eh	; a241  ..............c........dd~.

; ----------------------------------------------------------------------
; DATOS col27_44: columna de 27 caracteres; lo leen p00:5742 (27 bytes)
;   0xa25c..0xa277  (27 bytes)
DATA_col27_44:
	defb 0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,063h,083h,083h,0a7h,08ch,000h,087h,081h,091h,064h,064h,07eh,09eh	; a25c  ..............c........dd~.

; ----------------------------------------------------------------------
; DATOS col27_45: columna de 27 caracteres; lo leen p00:5742 (27 bytes)
;   0xa277..0xa292  (27 bytes)
DATA_col27_45:
	defb 0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,063h,083h,07bh,065h,095h,000h,087h,081h,091h,064h,064h,07eh,09eh	; a277  ..............c.{e.....dd~.

; ----------------------------------------------------------------------
; DATOS col27_46: columna de 27 caracteres; lo leen p00:5742 (27 bytes)
;   0xa292..0xa2ad  (27 bytes)
DATA_col27_46:
	defb 0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,063h,083h,07ch,095h,000h,000h,087h,081h,091h,0a6h,064h,07eh,09eh	; a292  ..............c.|.......d~.

; ----------------------------------------------------------------------
; DATOS col27_47: columna de 27 caracteres; lo leen p00:5742 (27 bytes)
;   0xa2ad..0xa2c8  (27 bytes)
DATA_col27_47:
	defb 0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,063h,083h,083h,000h,000h,000h,087h,081h,091h,0a6h,064h,07eh,09eh	; a2ad  ..............c.........d~.

; ----------------------------------------------------------------------
; DATOS rect_A2C8: 12 x 12 caracteres (p00:573B: B filas de C); lo leen
;   p00:59C1 (144 bytes)
;   0xa2c8..0xa358  (144 bytes)
DATA_rect_A2C8:
	defb 001h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,006h	; a2c8  ............
	defb 003h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,007h	; a2d4  ............
	defb 003h,000h,000h,000h,009h,00ah,00bh,00ch,00dh,000h,000h,007h	; a2e0  ............
	defb 003h,000h,000h,000h,00eh,00fh,000h,010h,011h,000h,000h,007h	; a2ec  ............
	defb 003h,000h,000h,012h,013h,000h,014h,015h,016h,000h,000h,007h	; a2f8  ............
	defb 003h,000h,000h,017h,018h,000h,019h,01ah,01bh,000h,000h,007h	; a304  ............
	defb 003h,000h,000h,01ch,01dh,01eh,01fh,020h,021h,000h,000h,007h	; a310  ....... !...
	defb 003h,000h,000h,022h,023h,024h,025h,026h,027h,000h,000h,007h	; a31c  ..."#$%&'...
	defb 003h,000h,000h,028h,029h,02ah,02bh,02ch,02dh,02eh,000h,007h	; a328  ...()*+,-...
	defb 003h,000h,000h,02fh,030h,031h,032h,033h,034h,000h,000h,007h	; a334  .../01234...
	defb 003h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,007h	; a340  ............
	defb 004h,005h,005h,005h,005h,005h,005h,005h,005h,005h,005h,008h	; a34c  ............

; ----------------------------------------------------------------------
; DATOS rect_A358: 12 x 12 caracteres (p00:573B: B filas de C); lo leen
;   p00:59B2 (144 bytes)
;   0xa358..0xa3e8  (144 bytes)
DATA_rect_A358:
	defb 04eh,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,043h	; a358  N..........C
	defb 010h,018h,018h,018h,018h,03ch,018h,018h,018h,018h,018h,041h	; a364  .....<.....A
	defb 010h,018h,018h,018h,002h,003h,008h,009h,018h,018h,018h,041h	; a370  ...........A
	defb 010h,018h,018h,018h,026h,013h,026h,019h,01ah,01bh,018h,041h	; a37c  ....&.&....A
	defb 010h,045h,020h,021h,022h,018h,028h,029h,004h,018h,02ah,041h	; a388  .E !".()..*A
	defb 010h,04ah,030h,031h,032h,033h,038h,026h,02ch,026h,03ah,041h	; a394  .J01238&,&:A
	defb 010h,049h,004h,005h,006h,007h,00ch,00dh,018h,00fh,040h,041h	; a3a0  .I........@A
	defb 010h,02fh,014h,015h,016h,017h,01ch,01dh,01eh,01fh,040h,041h	; a3ac  ./........@A
	defb 010h,018h,04fh,050h,026h,027h,018h,02dh,02eh,026h,046h,041h	; a3b8  ..OP&'.-.&FA
	defb 010h,018h,034h,004h,036h,037h,004h,00fh,03eh,03fh,00bh,041h	; a3c4  ..4.67..>?.A
	defb 010h,039h,04ch,04dh,042h,04bh,036h,00eh,035h,023h,048h,041h	; a3d0  .9LMBK6.5#HA
	defb 011h,012h,012h,012h,044h,044h,044h,044h,044h,012h,044h,00ah	; a3dc  ....DDDDD.D.

; ----------------------------------------------------------------------
; DATOS dibujo_A3E8: dibujo de caracteres (las secuencias): 0xFE [dx] baja una
;   fila, 0xFF acaba; lo leen p00:5A5F (223 bytes)
;   0xa3e8..0xa4c7  (223 bytes)
DATA_dibujo_A3E8:
	defb 091h,051h,052h,052h,052h,052h,052h,052h,052h,052h,05ah,05bh,0feh,000h,060h,061h	; a3e8  .QRRRRRRRRZ[..`a
	defb 062h,063h,064h,064h,064h,064h,068h,069h,061h,07eh,0feh,000h,060h,061h,072h,061h	; a3f8  bcddddhia~..`ara
	defb 074h,075h,075h,077h,061h,079h,061h,07eh,0feh,000h,060h,061h,072h,061h,084h,000h	; a408  tuuwaya~..`ara..
	defb 000h,087h,061h,079h,061h,07eh,0feh,000h,060h,061h,072h,061h,084h,000h,000h,087h	; a418  ..aya~..`ara....
	defb 061h,079h,061h,07eh,0feh,000h,060h,061h,072h,061h,084h,000h,000h,087h,061h,079h	; a428  aya~..`ara....ay
	defb 061h,07eh,0feh,000h,060h,061h,072h,061h,084h,000h,000h,087h,061h,079h,061h,07eh	; a438  a~..`ara....aya~
	defb 0feh,000h,060h,061h,072h,061h,084h,000h,000h,087h,061h,079h,061h,07eh,0feh,000h	; a448  ..`ara....aya~..
	defb 060h,061h,072h,061h,084h,000h,000h,087h,061h,079h,061h,07eh,0feh,000h,060h,061h	; a458  `ara....aya~..`a
	defb 072h,061h,084h,000h,000h,087h,061h,079h,061h,07eh,0feh,000h,060h,061h,072h,061h	; a468  ra....aya~..`ara
	defb 084h,000h,000h,087h,061h,079h,061h,07eh,0feh,000h,060h,061h,072h,061h,084h,000h	; a478  ....aya~..`ara..
	defb 000h,087h,061h,079h,061h,07eh,0feh,000h,060h,061h,072h,061h,084h,000h,000h,087h	; a488  ..aya~..`ara....
	defb 061h,079h,061h,07eh,0feh,000h,060h,061h,072h,061h,0a5h,0a6h,0a6h,0a8h,061h,079h	; a498  aya~..`ara....ay
	defb 061h,07eh,0feh,000h,060h,061h,082h,070h,0b5h,061h,061h,0b5h,07bh,07ch,061h,07eh	; a4a8  a~..`a.p.aa.{|a~
	defb 0feh,000h,05fh,070h,071h,061h,061h,061h,071h,061h,061h,061h,07bh,08eh,0ffh	; a4b8  .._pqaaaqaaa{..

; ----------------------------------------------------------------------
; DATOS dibujo_A4C7: dibujo de caracteres (las secuencias): 0xFE [dx] baja una
;   fila, 0xFF acaba; lo leen p00:5A68 (223 bytes)
;   0xa4c7..0xa5a6  (223 bytes)
DATA_dibujo_A4C7:
	defb 065h,0b1h,0b4h,0b4h,0b4h,0b4h,0b4h,0b4h,0b4h,0b4h,094h,05dh,0feh,000h,061h,08ah	; a4c7  e..........]..a.
	defb 088h,07fh,07ah,07ah,07ah,07ah,083h,053h,08bh,061h,0feh,000h,061h,08ah,061h,0abh	; a4d7  ..zzzz.S.a..a.a.
	defb 08fh,06dh,06dh,0aeh,07dh,061h,08bh,061h,0feh,000h,061h,08ah,061h,0abh,0afh,000h	; a4e7  .mm.}a.a..a.a...
	defb 000h,06eh,07dh,061h,08bh,061h,0feh,000h,061h,08ah,061h,0abh,0afh,000h,000h,06eh	; a4f7  .n}a.a..a.a....n
	defb 07dh,061h,08bh,061h,0feh,000h,061h,08ah,061h,0abh,0afh,000h,000h,06eh,07dh,061h	; a507  }a.a..a.a....n}a
	defb 08bh,061h,0feh,000h,061h,08ah,061h,0abh,0afh,000h,000h,06eh,07dh,061h,08bh,061h	; a517  .a..a.a....n}a.a
	defb 0feh,000h,061h,08ah,061h,0abh,0afh,000h,000h,06eh,07dh,061h,08bh,061h,0feh,000h	; a527  ..a.a....n}a.a..
	defb 061h,08ah,061h,0abh,0afh,000h,000h,06eh,07dh,061h,08bh,061h,0feh,000h,061h,08ah	; a537  a.a....n}a.a..a.
	defb 061h,0abh,0afh,000h,000h,06eh,07dh,061h,08bh,061h,0feh,000h,061h,08ah,061h,0abh	; a547  a....n}a.a..a.a.
	defb 0afh,000h,000h,06eh,07dh,061h,08bh,061h,0feh,000h,061h,08ah,061h,0abh,0afh,000h	; a557  ...n}a.a..a.a...
	defb 000h,06eh,07dh,061h,08bh,061h,0feh,000h,061h,08ah,061h,0abh,0afh,000h,000h,06eh	; a567  .n}a.a..a.a....n
	defb 07dh,061h,08bh,061h,0feh,000h,061h,08ah,061h,0abh,0ach,0adh,0adh,078h,07dh,061h	; a577  }a.a..a.a....x}a
	defb 08bh,061h,0feh,000h,061h,08ah,057h,058h,061h,05eh,061h,05eh,08dh,067h,08bh,061h	; a587  .a..a.WXa^a^.g.a
	defb 0feh,000h,057h,076h,061h,061h,06bh,061h,061h,061h,061h,06bh,09fh,067h,0ffh	; a597  ..Wvaakaaaak.g.

; ----------------------------------------------------------------------
; DATOS rect_A5A6: 2 x 12 caracteres (p00:573B: B filas de C); lo leen
;   p00:5A1A (24 bytes)
;   0xa5a6..0xa5be  (24 bytes)
DATA_rect_A5A6:
	defb 09bh,09ch,05ch,0b2h,05ch,0b2h,05ch,0b2h,05ch,0b2h,05ch,0b2h	; a5a6  ..\.\.\.\.\.
	defb 05ch,0b2h,0c6h,0bdh,0beh,0bfh,0beh,0bfh,0beh,0bfh,0b8h,0b9h	; a5b2  \...........

; ----------------------------------------------------------------------
; DATOS rect_A5BE: 4 x 12 caracteres (p00:573B: B filas de C); lo leen
;   p00:5A2C (48 bytes)
;   0xa5be..0xa5ee  (48 bytes)
DATA_rect_A5BE:
	defb 09dh,09eh,09eh,0a2h,05ch,061h,061h,0b2h,05ch,061h,061h,0b2h	; a5be  ....\aa.\aa.
	defb 05ch,061h,061h,0b2h,05ch,061h,061h,0b2h,05ch,061h,061h,0b2h	; a5ca  \aa.\aa.\aa.
	defb 05ch,061h,061h,0b2h,0c8h,0c9h,0c9h,0c1h,0beh,0cch,0cch,0bfh	; a5d6  \aa.........
	defb 0beh,0cch,0cch,0bfh,0beh,0cch,0cch,0bfh,0c2h,0c3h,0c3h,0cbh	; a5e2  ............

; ----------------------------------------------------------------------
; DATOS rect_A5EE: 6 x 14 caracteres (p00:573B: B filas de C); lo leen
;   p00:5A3E (84 bytes)
;   0xa5ee..0xa642  (84 bytes)
DATA_rect_A5EE:
	defb 0b6h,073h,073h,073h,073h,06ah,05ch,061h,061h,061h,061h,066h,05ch,061h	; a5ee  .ssssj\aaaaf\a
	defb 061h,061h,061h,066h,05ch,061h,061h,061h,061h,066h,05ch,061h,061h,061h	; a5fc  aaaf\aaaaf\aaa
	defb 061h,066h,05ch,061h,061h,061h,061h,066h,05ch,061h,061h,061h,061h,066h	; a60a  af\aaaaf\aaaaf
	defb 05ch,061h,061h,061h,061h,066h,0c4h,0c5h,0c5h,0c5h,0c5h,0cah,0c7h,0cch	; a618  \aaaaf........
	defb 0cch,0cch,0cch,0c0h,0c7h,0cch,0cch,0cch,0cch,0c0h,0c7h,0cch,0cch,0cch	; a626  ..............
	defb 0cch,0c0h,0c7h,0cch,0cch,0cch,0cch,0c0h,0bbh,0bah,0bah,0bah,0bah,0bch	; a634  ..............

; ----------------------------------------------------------------------
; DATOS dibujo_A642: dibujo de caracteres (las secuencias): 0xFE [dx] baja una
;   fila, 0xFF acaba; lo leen p00:5A77 (111 bytes)
;   0xa642..0xa6b1  (111 bytes)
DATA_dibujo_A642:
	defb 0b6h,073h,073h,073h,073h,06ah,0feh,000h,05ch,061h,061h,061h,061h,059h,0feh,000h	; a642  .ssssj..\aaaaY..
	defb 05ch,061h,061h,061h,061h,059h,0feh,000h,05ch,061h,061h,061h,061h,059h,0feh,000h	; a652  \aaaaY..\aaaaY..
	defb 05ch,061h,061h,061h,061h,059h,0feh,000h,05ch,061h,061h,061h,061h,059h,0feh,000h	; a662  \aaaaY..\aaaaY..
	defb 05ch,061h,061h,061h,061h,059h,0feh,000h,05ch,061h,061h,061h,061h,059h,0feh,000h	; a672  \aaaaY..\aaaaY..
	defb 000h,000h,000h,000h,000h,000h,0feh,000h,000h,000h,000h,000h,000h,000h,0feh,000h	; a682  ................
	defb 000h,000h,000h,000h,000h,000h,0feh,000h,000h,000h,000h,000h,000h,000h,0feh,000h	; a692  ................
	defb 000h,000h,000h,000h,000h,000h,0feh,000h,0b5h,061h,061h,061h,0b5h,061h,0ffh	; a6a2  .........aaa.a.

; ----------------------------------------------------------------------
; DATOS dibujo_A6B1: dibujo de caracteres (las secuencias): 0xFE [dx] baja una
;   fila, 0xFF acaba; lo leen p00:5A80 (47 bytes)
;   0xa6b1..0xa6e0  (47 bytes)
DATA_dibujo_A6B1:
	defb 0c4h,0c5h,0c5h,0c5h,0c5h,0cah,0feh,000h,0c7h,0cch,0cch,0cch,0cch,0c0h,0feh,000h	; a6b1  ................
	defb 0c7h,0cch,0cch,0cch,0cch,0c0h,0feh,000h,0c7h,0cch,0cch,0cch,0cch,0c0h,0feh,000h	; a6c1  ................
	defb 0c7h,0cch,0cch,0cch,0cch,0c0h,0feh,000h,0ceh,0ceh,0ceh,0ceh,0ceh,0ceh,0ffh	; a6d1  ...............

; ----------------------------------------------------------------------
; DATOS dibujo_A6E0: dibujo de caracteres (las secuencias): 0xFE [dx] baja una
;   fila, 0xFF acaba; lo leen p00:5A50 (34 bytes)
;   0xa6e0..0xa702  (34 bytes)
DATA_dibujo_A6E0:
	defb 037h,038h,039h,0feh,000h,047h,048h,049h,0feh,000h,040h,041h,02ah,0feh,000h,03fh	; a6e0  789..GHI..@A*..?
	defb 02fh,03ah,0feh,000h,042h,041h,01dh,0feh,000h,04ch,041h,02dh,0feh,000h,013h,014h	; a6f0  /:..BA...LA-....
	defb 015h,0ffh	; a700

; ----------------------------------------------------------------------
; DATOS rect_A702: 12 x 12 caracteres (p00:573B: B filas de C); lo leen
;   p00:59D0 (144 bytes)
;   0xa702..0xa792  (144 bytes)
DATA_rect_A702:
	defb 04dh,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,00bh	; a702  M...........
	defb 010h,011h,012h,012h,012h,012h,012h,012h,012h,012h,012h,01bh	; a70e  ............
	defb 010h,021h,022h,022h,022h,025h,026h,027h,028h,029h,026h,01bh	; a71a  .!"""%&'()&.
	defb 010h,031h,032h,033h,033h,035h,026h,037h,00dh,00eh,026h,01bh	; a726  .12335&7..&.
	defb 010h,031h,033h,033h,033h,035h,046h,044h,041h,00ch,04ah,01bh	; a732  .13335FDA.J.
	defb 010h,03eh,02ch,02ch,02ch,036h,045h,034h,041h,01ch,02bh,01bh	; a73e  .>,,,6E4A.+.
	defb 010h,021h,022h,022h,022h,025h,00ah,006h,007h,008h,03bh,01bh	; a74a  .!"""%......
	defb 010h,031h,03ch,03dh,03dh,035h,00fh,016h,017h,018h,01eh,01bh	; a756  .1<==5......
	defb 010h,031h,03dh,03dh,03dh,035h,01fh,003h,004h,005h,02eh,01bh	; a762  .1===5......
	defb 010h,03eh,02ch,02ch,02ch,036h,026h,013h,014h,015h,026h,01bh	; a76e  .>,,,6&...&.
	defb 010h,043h,026h,026h,026h,026h,026h,002h,002h,002h,026h,01bh	; a77a  .C&&&&&...&.
	defb 04eh,04bh,04bh,04bh,04bh,04bh,04bh,04bh,04bh,04bh,04bh,024h	; a786  NKKKKKKKKKK$

; ----------------------------------------------------------------------
; DATOS fundidos: 12 fundidos de 5 bytes [colores de partida][colores de
;   llegada][cada cuantos cuadros]; lo leen p01:77F4 (60 bytes)
;   0xa792..0xa7ce  (60 bytes)
DATA_fundidos:
	defb 08ah,0a9h,09bh,0a8h,00ch	; a792
	defb 09bh,0a8h,096h,0a9h,008h	; a797
	defb 087h,0e8h,006h,0a9h,006h	; a79c
	defb 006h,0a9h,096h,0a9h,002h	; a7a1
	defb 0b6h,0a9h,0d6h,0a9h,004h	; a7a6
	defb 0e6h,0a8h,096h,0a9h,008h	; a7ab
	defb 006h,0a9h,048h,0a9h,008h	; a7b0
	defb 06ah,0a9h,096h,0a9h,008h	; a7b5
	defb 030h,0a8h,050h,0a8h,008h	; a7ba
	defb 087h,0e8h,026h,0a9h,004h	; a7bf
	defb 026h,0a9h,006h,0a9h,004h	; a7c4
	defb 048h,0a9h,06ah,0a9h,008h	; a7c9

; ----------------------------------------------------------------------
; DATOS paleta_A7CE: paleta del titulo: 16 colores [color][rojo y
;   azul][verde], 0xFF acaba; lo leen p00:560E (49 bytes)
;   0xa7ce..0xa7ff  (49 bytes)
DATA_paleta_A7CE:
	defb 000h,000h,000h	; a7ce
	defb 001h,030h,002h	; a7d1
	defb 002h,041h,003h	; a7d4
	defb 003h,051h,004h	; a7d7
	defb 004h,065h,007h	; a7da
	defb 005h,000h,000h	; a7dd
	defb 006h,000h,000h	; a7e0
	defb 007h,070h,000h	; a7e3
	defb 008h,041h,003h	; a7e6
	defb 009h,051h,004h	; a7e9
	defb 00ah,060h,000h	; a7ec
	defb 00bh,077h,007h	; a7ef
	defb 00ch,050h,000h	; a7f2
	defb 00dh,070h,007h	; a7f5
	defb 00eh,050h,004h	; a7f8
	defb 00fh,000h,000h	; a7fb
	defb 0ffh	; a7fe

; ----------------------------------------------------------------------
; DATOS paleta_A7FF: paleta de la entrada: 16 colores [color][rojo y
;   azul][verde], 0xFF acaba; lo leen p00:5B58 (49 bytes)
;   0xa7ff..0xa830  (49 bytes)
DATA_paleta_A7FF:
	defb 000h,000h,000h	; a7ff
	defb 001h,033h,003h	; a802
	defb 002h,044h,004h	; a805
	defb 003h,055h,005h	; a808
	defb 004h,066h,006h	; a80b
	defb 005h,000h,000h	; a80e
	defb 006h,000h,000h	; a811
	defb 007h,070h,000h	; a814
	defb 008h,030h,002h	; a817
	defb 009h,050h,005h	; a81a
	defb 00ah,030h,000h	; a81d
	defb 00bh,077h,007h	; a820
	defb 00ch,000h,003h	; a823
	defb 00dh,017h,001h	; a826
	defb 00eh,075h,006h	; a829
	defb 00fh,000h,000h	; a82c
	defb 0ffh	; a82f

; ----------------------------------------------------------------------
; DATOS pal_A830: 16 colores de paleta (2 bytes cada uno); lo leen p01:77FE
;   (32 bytes)
;   0xa830..0xa850  (32 bytes)
DATA_pal_A830:
	defb 000h,000h	; a830
	defb 033h,003h	; a832
	defb 044h,004h	; a834
	defb 055h,005h	; a836
	defb 066h,006h	; a838
	defb 000h,000h	; a83a
	defb 000h,000h	; a83c
	defb 070h,000h	; a83e
	defb 030h,002h	; a840
	defb 050h,005h	; a842
	defb 030h,000h	; a844
	defb 077h,007h	; a846
	defb 000h,003h	; a848
	defb 017h,001h	; a84a
	defb 075h,006h	; a84c
	defb 000h,000h	; a84e

; ----------------------------------------------------------------------
; DATOS pal_A850: 16 colores de paleta (2 bytes cada uno); lo leen p01:77FE
;   (32 bytes)
;   0xa850..0xa870  (32 bytes)
DATA_pal_A850:
	defb 000h,000h	; a850
	defb 033h,003h	; a852
	defb 044h,004h	; a854
	defb 055h,005h	; a856
	defb 066h,006h	; a858
	defb 000h,000h	; a85a
	defb 000h,000h	; a85c
	defb 070h,000h	; a85e
	defb 030h,002h	; a860
	defb 050h,005h	; a862
	defb 030h,000h	; a864
	defb 077h,007h	; a866
	defb 000h,003h	; a868
	defb 000h,000h	; a86a
	defb 000h,000h	; a86c
	defb 000h,000h	; a86e

; ----------------------------------------------------------------------
; DATOS paleta_A870: paleta de la piramide acabada: 14 colores [color][rojo y
;   azul][verde], 0xFF acaba; lo leen p01:6F93 (43 bytes)
;   0xa870..0xa89b  (43 bytes)
DATA_paleta_A870:
	defb 000h,000h,000h	; a870
	defb 001h,030h,000h	; a873
	defb 002h,030h,002h	; a876
	defb 003h,041h,003h	; a879
	defb 004h,073h,007h	; a87c
	defb 005h,055h,005h	; a87f
	defb 006h,000h,002h	; a882
	defb 007h,070h,000h	; a885
	defb 008h,030h,002h	; a888
	defb 009h,050h,005h	; a88b
	defb 00ah,077h,007h	; a88e
	defb 00bh,077h,007h	; a891
	defb 00ch,000h,003h	; a894
	defb 00fh,000h,000h	; a897
	defb 0ffh	; a89a

; ----------------------------------------------------------------------
; DATOS pal_A89B: 16 colores de paleta (2 bytes cada uno); lo leen p01:77FE
;   (32 bytes)
;   0xa89b..0xa8bb  (32 bytes)
DATA_pal_A89B:
	defb 000h,000h	; a89b
	defb 001h,003h	; a89d
	defb 002h,004h	; a89f
	defb 003h,005h	; a8a1
	defb 035h,006h	; a8a3
	defb 077h,007h	; a8a5
	defb 020h,002h	; a8a7
	defb 070h,000h	; a8a9
	defb 041h,003h	; a8ab
	defb 051h,004h	; a8ad
	defb 077h,007h	; a8af
	defb 077h,007h	; a8b1
	defb 050h,000h	; a8b3
	defb 000h,000h	; a8b5
	defb 000h,000h	; a8b7
	defb 000h,000h	; a8b9

; ----------------------------------------------------------------------
; DATOS paleta_A8BB: paleta del final: 14 colores [color][rojo y azul][verde],
;   0xFF acaba; lo leen p00:5B64 (43 bytes)
;   0xa8bb..0xa8e6  (43 bytes)
DATA_paleta_A8BB:
	defb 000h,000h,000h	; a8bb
	defb 001h,040h,002h	; a8be
	defb 002h,041h,003h	; a8c1
	defb 003h,051h,004h	; a8c4
	defb 004h,075h,007h	; a8c7
	defb 005h,030h,003h	; a8ca
	defb 006h,000h,003h	; a8cd
	defb 007h,070h,000h	; a8d0
	defb 008h,055h,005h	; a8d3
	defb 009h,070h,004h	; a8d6
	defb 00ah,070h,000h	; a8d9
	defb 00bh,077h,007h	; a8dc
	defb 00ch,050h,000h	; a8df
	defb 00fh,000h,000h	; a8e2
	defb 0ffh	; a8e5

; ----------------------------------------------------------------------
; DATOS pal_A8E6: 16 colores de paleta (2 bytes cada uno); lo leen p01:77FE
;   (32 bytes)
;   0xa8e6..0xa906  (32 bytes)
DATA_pal_A8E6:
	defb 000h,000h	; a8e6
	defb 040h,002h	; a8e8
	defb 041h,003h	; a8ea
	defb 051h,004h	; a8ec
	defb 075h,007h	; a8ee
	defb 030h,003h	; a8f0
	defb 004h,006h	; a8f2
	defb 070h,000h	; a8f4
	defb 055h,005h	; a8f6
	defb 070h,004h	; a8f8
	defb 030h,000h	; a8fa
	defb 077h,007h	; a8fc
	defb 050h,000h	; a8fe
	defb 000h,000h	; a900
	defb 000h,000h	; a902
	defb 000h,000h	; a904

; ----------------------------------------------------------------------
; DATOS pal_A906: 16 colores de paleta (2 bytes cada uno); lo leen p01:77FE
;   (32 bytes)
;   0xa906..0xa926  (32 bytes)
DATA_pal_A906:
	defb 000h,000h	; a906
	defb 030h,002h	; a908
	defb 041h,003h	; a90a
	defb 051h,004h	; a90c
	defb 065h,007h	; a90e
	defb 000h,000h	; a910
	defb 000h,000h	; a912
	defb 070h,000h	; a914
	defb 041h,003h	; a916
	defb 051h,004h	; a918
	defb 077h,007h	; a91a
	defb 077h,007h	; a91c
	defb 000h,003h	; a91e
	defb 000h,000h	; a920
	defb 000h,000h	; a922
	defb 000h,000h	; a924

; ----------------------------------------------------------------------
; DATOS pal_A926: 16 colores de paleta (2 bytes cada uno); lo leen p01:77FE
;   (32 bytes)
;   0xa926..0xa946  (32 bytes)
DATA_pal_A926:
	defb 000h,000h	; a926
	defb 073h,002h	; a928
	defb 074h,003h	; a92a
	defb 075h,004h	; a92c
	defb 077h,006h	; a92e
	defb 067h,004h	; a930
	defb 067h,003h	; a932
	defb 070h,000h	; a934
	defb 041h,003h	; a936
	defb 051h,004h	; a938
	defb 000h,000h	; a93a
	defb 077h,007h	; a93c
	defb 000h,003h	; a93e
	defb 000h,000h	; a940
	defb 000h,000h	; a942
	defb 000h,000h	; a944

; ----------------------------------------------------------------------
; DATOS dir_A946: la direccion de la paleta que va detras (0xA948); los
;   fundidos de 0xA792 apuntan a la paleta, esto no lo lee nadie; lo leen
;   nadie (2 bytes)
;   0xa946..0xa948  (2 bytes)
DATA_dir_A946:
	defw 0a948h	; a946  -> DATA_pal_A948

; ----------------------------------------------------------------------
; DATOS pal_A948: 16 colores de paleta (2 bytes cada uno); lo leen p01:77FE
;   (32 bytes)
;   0xa948..0xa968  (32 bytes)
DATA_pal_A948:
	defb 000h,000h	; a948
	defb 030h,002h	; a94a
	defb 041h,003h	; a94c
	defb 051h,004h	; a94e
	defb 065h,007h	; a950
	defb 000h,000h	; a952
	defb 000h,000h	; a954
	defb 070h,000h	; a956
	defb 041h,003h	; a958
	defb 051h,004h	; a95a
	defb 000h,000h	; a95c
	defb 077h,007h	; a95e
	defb 000h,003h	; a960
	defb 017h,001h	; a962
	defb 075h,006h	; a964
	defb 000h,000h	; a966

; ----------------------------------------------------------------------
; DATOS dir_A968: la direccion de la paleta que va detras (0xA96A); los
;   fundidos de 0xA792 apuntan a la paleta, esto no lo lee nadie; lo leen
;   nadie (2 bytes)
;   0xa968..0xa96a  (2 bytes)
DATA_dir_A968:
	defw 0a96ah	; a968  -> DATA_pal_A96A

; ----------------------------------------------------------------------
; DATOS pal_A96A: 16 colores de paleta (2 bytes cada uno); lo leen p01:77FE
;   (32 bytes)
;   0xa96a..0xa98a  (32 bytes)
DATA_pal_A96A:
	defb 000h,000h	; a96a
	defb 030h,002h	; a96c
	defb 041h,003h	; a96e
	defb 051h,004h	; a970
	defb 065h,007h	; a972
	defb 000h,000h	; a974
	defb 000h,000h	; a976
	defb 070h,000h	; a978
	defb 041h,003h	; a97a
	defb 051h,004h	; a97c
	defb 077h,007h	; a97e
	defb 077h,007h	; a980
	defb 000h,003h	; a982
	defb 017h,001h	; a984
	defb 075h,006h	; a986
	defb 000h,000h	; a988

; ----------------------------------------------------------------------
; DATOS pal_A98A: 16 colores de paleta (2 bytes cada uno); se solapan 5
;   bloques: (pal_A996 A996-A9B6) (pal_A996 A996-A9B6) (pal_A996 A996-A9B6)
;   (pal_A996 A996-A9B6); lo leen p01:77FE (44 bytes)
;   0xa98a..0xa9b6  (44 bytes)
DATA_pal_A98A:
	defb 000h,000h	; a98a
	defb 000h,000h	; a98c
	defb 000h,000h	; a98e
	defb 000h,000h	; a990
	defb 000h,000h	; a992
	defb 077h,007h	; a994
	defb 000h,000h	; a996
	defb 000h,000h	; a998
	defb 000h,000h	; a99a
	defb 000h,000h	; a99c
	defb 000h,000h	; a99e
	defb 000h,000h	; a9a0
	defb 000h,000h	; a9a2
	defb 000h,000h	; a9a4
	defb 000h,000h	; a9a6
	defb 000h,000h	; a9a8
	defb 000h,000h	; a9aa
	defb 000h,000h	; a9ac
	defb 000h,000h	; a9ae
	defb 000h,000h	; a9b0
	defb 000h,000h	; a9b2
	defb 000h,000h	; a9b4

; ----------------------------------------------------------------------
; DATOS pal_A9B6: 16 colores de paleta (2 bytes cada uno); lo leen p01:77FE
;   (32 bytes)
;   0xa9b6..0xa9d6  (32 bytes)
DATA_pal_A9B6:
	defb 000h,000h	; a9b6
	defb 030h,000h	; a9b8
	defb 030h,002h	; a9ba
	defb 041h,003h	; a9bc
	defb 073h,007h	; a9be
	defb 055h,005h	; a9c0
	defb 000h,002h	; a9c2
	defb 070h,000h	; a9c4
	defb 030h,002h	; a9c6
	defb 050h,005h	; a9c8
	defb 077h,007h	; a9ca
	defb 077h,007h	; a9cc
	defb 000h,003h	; a9ce
	defb 017h,007h	; a9d0
	defb 075h,006h	; a9d2
	defb 000h,000h	; a9d4

; ----------------------------------------------------------------------
; DATOS pal_A9D6: 16 colores de paleta (2 bytes cada uno); lo leen p01:77FE
;   (32 bytes)
;   0xa9d6..0xa9f6  (32 bytes)
DATA_pal_A9D6:
	defb 000h,000h	; a9d6
	defb 030h,000h	; a9d8
	defb 030h,002h	; a9da
	defb 041h,003h	; a9dc
	defb 073h,007h	; a9de
	defb 055h,005h	; a9e0
	defb 000h,002h	; a9e2
	defb 070h,000h	; a9e4
	defb 030h,002h	; a9e6
	defb 050h,005h	; a9e8
	defb 077h,007h	; a9ea
	defb 077h,007h	; a9ec
	defb 000h,003h	; a9ee
	defb 000h,000h	; a9f0
	defb 000h,000h	; a9f2
	defb 000h,000h	; a9f4

; ----------------------------------------------------------------------
; DATOS rachas_A9F6: rachas a la VRAM (sprites): [n < 0x80] repite el byte
;   siguiente, [0x80 + n] copia n, [0x80] otro destino, 0 acaba; lo leen
;   p00:5ACF (5 bytes)
;   0xa9f6..0xa9fb  (5 bytes)
DATA_rachas_A9F6:
	defb 081h,080h,01fh,000h,000h	; a9f6

; ----------------------------------------------------------------------
; DATOS rachas_A9FB: rachas a la VRAM (sprites): [n < 0x80] repite el byte
;   siguiente, [0x80 + n] copia n, [0x80] otro destino, 0 acaba; lo leen
;   p00:5A9B (5 bytes)
;   0xa9fb..0xaa00  (5 bytes)
DATA_rachas_A9FB:
	defb 002h,0c0h,01eh,000h,000h	; a9fb

; ----------------------------------------------------------------------
; DATOS rachas_AA00: rachas a la VRAM (sprites de la pausa): [n < 0x80] repite
;   el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0 acaba; lo
;   leen p00:5946 (345 bytes)
;   0xaa00..0xab59  (345 bytes)
DATA_rachas_AA00:
	defb 007h,000h,089h,001h,007h,00fh,01fh,01fh,03fh,07ah,072h,032h,007h,000h,089h,080h	; aa00  ........?zr2....
	defb 0e0h,0f0h,0f8h,0f8h,0fch,05eh,04eh,04ch,007h,000h,089h,001h,006h,008h,017h,018h	; aa10  .....^NL........
	defb 027h,05fh,05fh,03fh,007h,000h,091h,080h,060h,010h,0e8h,018h,0e4h,0fah,0fah,0fch	; aa20  '__?....`.......
	defb 018h,03ch,07fh,07fh,07eh,07fh,08eh,076h,008h,000h,088h,018h,03ch,0feh,0feh,07eh	; aa30  .<..~..v....<..~
	defb 0feh,071h,06eh,008h,000h,088h,01fh,027h,043h,049h,04fh,049h,0f8h,076h,008h,000h	; aa40  .qn....'CIOI.v..
	defb 088h,0f8h,0e4h,0c2h,092h,0f2h,092h,01fh,06eh,011h,000h,087h,001h,007h,00fh,01fh	; aa50  ........n.......
	defb 01fh,03fh,07ah,009h,000h,087h,080h,0e0h,0f0h,0f8h,0f8h,0fch,05eh,009h,000h,087h	; aa60  .?z.........^...
	defb 001h,006h,008h,017h,018h,027h,05fh,009h,000h,08fh,080h,060h,010h,0e8h,018h,0e4h	; aa70  .....'_....`....
	defb 0fah,072h,032h,078h,0fch,0ffh,07fh,08eh,07fh,008h,000h,088h,04eh,04ch,01eh,03fh	; aa80  .r2x........NL.?
	defb 0ffh,0feh,071h,0feh,008h,000h,088h,05fh,03fh,04fh,087h,093h,049h,0ffh,07fh,008h	; aa90  ..q...._?O..I...
	defb 000h,088h,0fah,0fch,0f2h,0e1h,0c9h,092h,0ffh,0feh,00fh,000h,089h,001h,007h,00fh	; aaa0  ................
	defb 01fh,01fh,03fh,07ah,071h,032h,007h,000h,089h,080h,0e0h,0f0h,0f8h,0f8h,0fch,05eh	; aab0  ..?zq2.........^
	defb 08eh,04ch,007h,000h,089h,001h,006h,008h,017h,018h,027h,05fh,05fh,03fh,007h,000h	; aac0  .L........'__?..
	defb 091h,080h,060h,010h,0e8h,018h,0e4h,0fah,0fah,0fch,018h,03ch,07fh,07fh,07eh,07fh	; aad0  ..`........<..~.
	defb 08eh,076h,008h,000h,088h,018h,03ch,0feh,0feh,07eh,0feh,071h,06eh,008h,000h,088h	; aae0  .v....<..~.qn...
	defb 01fh,027h,043h,049h,04fh,049h,0f8h,076h,008h,000h,088h,0f8h,0e4h,0c2h,092h,0f2h	; aaf0  .'CIOI.v........
	defb 092h,01fh,06eh,011h,000h,087h,001h,007h,00fh,01fh,01fh,03fh,07ah,009h,000h,087h	; ab00  ..n........?z...
	defb 080h,0e0h,0f0h,0f8h,0f8h,0fch,05eh,008h,000h,088h,020h,001h,006h,008h,057h,018h	; ab10  ......^... ...W.
	defb 027h,05fh,008h,000h,090h,008h,081h,060h,010h,0e8h,018h,0e4h,0fah,071h,032h,078h	; ab20  '_.....`.....q2x
	defb 0fch,0ffh,07fh,08eh,07fh,008h,000h,088h,08eh,04ch,01eh,03fh,0ffh,0feh,071h,0feh	; ab30  .........L.?..q.
	defb 008h,000h,088h,05fh,03fh,04fh,087h,093h,049h,0ffh,07fh,008h,000h,088h,0fah,0fch	; ab40  ..._?O..I.......
	defb 0f2h,0e1h,0c9h,092h,0ffh,0feh,008h,000h,000h	; ab50  .........

; ----------------------------------------------------------------------
; DATOS rachas_AB59: rachas a la VRAM (sprites): [n < 0x80] repite el byte
;   siguiente, [0x80 + n] copia n, [0x80] otro destino, 0 acaba; lo leen
;   p00:5AAB (96 bytes)
;   0xab59..0xabb9  (96 bytes)
DATA_rachas_AB59:
	defb 006h,000h,08ah,001h,007h,00fh,01fh,01fh,03fh,07ah,072h,032h,018h,006h,000h,08ah	; ab59  ........?zr2....
	defb 080h,0e0h,0f0h,0f8h,0f8h,0fch,05eh,04eh,04ch,018h,006h,000h,08ah,001h,006h,008h	; ab69  ......^NL.......
	defb 017h,018h,027h,05fh,05fh,03fh,01fh,006h,000h,092h,080h,060h,010h,0e8h,018h,0e4h	; ab79  ..'__?.....`....
	defb 0fah,0fah,0fch,0f8h,03ch,07fh,0bfh,0beh,04fh,01fh,01eh,03eh,008h,000h,088h,03ch	; ab89  ....<...O..>...<
	defb 0feh,0fdh,07dh,0f2h,0f8h,078h,07ch,008h,000h,088h,027h,043h,0e9h,0ffh,048h,011h	; ab99  ..}..x|...'C..H.
	defb 01eh,022h,008h,000h,088h,0e4h,0c2h,097h,0ffh,012h,088h,078h,044h,008h,000h,000h	; aba9  .".........xD...

; ----------------------------------------------------------------------
; DATOS rachas_ABB9: rachas a la VRAM (dibujos de los sprites): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (591 bytes)
;   0xabb9..0xae08  (591 bytes)
DATA_rachas_ABB9:
	defb 007h,000h,089h,001h,007h,00fh,01fh,03fh,07fh,07fh,03fh,01fh,007h,000h,089h,080h	; abb9  .......?..?.....
	defb 0e0h,0f0h,0f8h,0fch,0feh,0feh,0fch,0feh,007h,000h,089h,001h,006h,009h,010h,030h	; abc9  ...............0
	defb 050h,048h,020h,018h,007h,000h,08fh,080h,060h,090h,008h,00ch,00ah,012h,064h,01eh	; abd9  PH .....`.....d.
	defb 03fh,07fh,0bfh,09fh,07fh,00eh,00ah,000h,088h,0fdh,0feh,0fch,0f8h,0f8h,098h,0f8h	; abe9  ?...............
	defb 070h,008h,000h,086h,027h,040h,0efh,0f0h,071h,00eh,00ah,000h,088h,0e7h,00ah,0fch	; abf9  p...'@..q.......
	defb 008h,0e8h,0f8h,088h,070h,00fh,000h,089h,001h,007h,00fh,01fh,03fh,07fh,07fh,03fh	; ac09  ....p.......?..?
	defb 07fh,007h,000h,089h,080h,0e0h,0f0h,0f8h,0fch,0feh,0feh,0fch,0f8h,007h,000h,089h	; ac19  ................
	defb 001h,006h,009h,010h,030h,050h,048h,020h,078h,007h,000h,091h,080h,060h,090h,008h	; ac29  ....0PH x....`..
	defb 00ch,00ah,012h,064h,018h,0bfh,07fh,03fh,01fh,01fh,019h,01fh,00eh,008h,000h,086h	; ac39  ...d...?........
	defb 0fch,0feh,0fdh,0f9h,0feh,070h,00ah,000h,088h,0e7h,050h,03fh,010h,017h,01fh,011h	; ac49  .....p....P?....
	defb 00eh,008h,000h,086h,0e4h,002h,0f7h,00fh,08eh,070h,013h,000h,087h,001h,003h,007h	; ac59  .........p......
	defb 00fh,01fh,03fh,03fh,009h,000h,087h,080h,0c0h,0e0h,0f0h,0f8h,0fch,0fch,009h,000h	; ac69  ..??............
	defb 087h,001h,002h,005h,008h,018h,028h,020h,009h,000h,08eh,080h,040h,0a0h,010h,018h	; ac79  ......( ....@...
	defb 014h,064h,01fh,01fh,03fh,05fh,03fh,00fh,006h,009h,000h,084h,0fch,0fah,0fch,0f8h	; ac89  .d..?_?.........
	defb 003h,0f0h,081h,060h,008h,000h,087h,018h,017h,020h,07fh,038h,009h,006h,009h,000h	; ac99  ...`..... .8....
	defb 088h,01ch,0eeh,004h,0f8h,010h,0d0h,090h,060h,011h,000h,087h,001h,003h,007h,00fh	; aca9  ........`.......
	defb 01fh,03fh,03fh,009h,000h,087h,080h,0c0h,0e0h,0f0h,0f8h,0fch,0fch,009h,000h,087h	; acb9  .??.............
	defb 001h,002h,005h,008h,018h,028h,020h,009h,000h,08bh,080h,040h,0a0h,010h,018h,014h	; acc9  .....( ....@....
	defb 064h,03fh,05fh,03fh,01fh,003h,00fh,081h,006h,008h,000h,002h,0f8h,085h,0fch,0fah	; acd9  d?_?............
	defb 0f4h,0f0h,060h,009h,000h,088h,038h,077h,020h,01fh,008h,00bh,009h,006h,008h,000h	; ace9  ..`...8w .......
	defb 087h,018h,0e8h,004h,0feh,014h,090h,060h,014h,000h,085h,001h,003h,007h,00fh,00fh	; acf9  .......`........
	defb 00bh,000h,085h,080h,0c0h,0e0h,0f0h,0f0h,00bh,000h,085h,001h,002h,005h,008h,008h	; ad09  ................
	defb 00bh,000h,08ch,080h,040h,0a0h,010h,010h,01fh,01fh,00fh,01fh,02fh,01fh,007h,009h	; ad19  ....@......./...
	defb 000h,088h,0f8h,0f0h,0f8h,0f4h,0f8h,0f0h,0f0h,0e0h,008h,000h,087h,014h,018h,00fh	; ad29  ................
	defb 010h,037h,018h,007h,009h,000h,088h,068h,010h,0f8h,01ch,0f8h,010h,010h,0e0h,013h	; ad39  .7.....h........
	defb 000h,085h,001h,003h,007h,00fh,00fh,00bh,000h,085h,080h,0c0h,0e0h,0f0h,0f0h,00bh	; ad49  ................
	defb 000h,085h,001h,002h,005h,008h,008h,00bh,000h,08dh,080h,040h,0a0h,010h,010h,01fh	; ad59  ...........@....
	defb 00fh,01fh,02fh,01fh,00fh,00fh,007h,008h,000h,002h,0f8h,085h,0f0h,0f8h,0f4h,0f8h	; ad69  ../.............
	defb 0e0h,009h,000h,088h,014h,008h,01fh,038h,01fh,008h,008h,007h,008h,000h,087h,068h	; ad79  .......8.......h
	defb 018h,0f0h,008h,0ech,018h,0e0h,017h,000h,082h,001h,003h,00eh,000h,082h,080h,0c0h	; ad89  ................
	defb 00eh,000h,082h,001h,002h,00eh,000h,083h,080h,040h,007h,003h,00fh,083h,01fh,00fh	; ad99  .........@......
	defb 003h,009h,000h,088h,0e0h,0f0h,0f0h,0f8h,0f0h,0e0h,0e0h,0c0h,008h,000h,087h,004h	; ada9  ................
	defb 008h,00ch,00bh,014h,00ch,003h,009h,000h,088h,020h,010h,030h,0c8h,030h,020h,020h	; adb9  ......... .0.0
	defb 0c0h,016h,000h,082h,001h,003h,00eh,000h,082h,080h,0c0h,00eh,000h,082h,001h,002h	; adc9  ................
	defb 00eh,000h,08ah,080h,040h,007h,00fh,00fh,01fh,00fh,007h,007h,003h,008h,000h,081h	; add9  ....@...........
	defb 0e0h,003h,0f0h,083h,0f8h,0f0h,0c0h,009h,000h,088h,004h,008h,00ch,013h,00ch,004h	; ade9  ................
	defb 004h,003h,008h,000h,087h,020h,010h,030h,0d0h,028h,030h,0c0h,009h,000h,000h	; adf9  ..... .0.(0....

; ----------------------------------------------------------------------
; DATOS rachas_AE08: rachas a la VRAM (sprites): [n < 0x80] repite el byte
;   siguiente, [0x80 + n] copia n, [0x80] otro destino, 0 acaba; lo leen
;   p00:5AC6 (281 bytes)
;   0xae08..0xaf21  (281 bytes)
DATA_rachas_AE08:
	defb 005h,000h,08bh,001h,007h,00fh,01fh,01fh,03fh,07ah,072h,072h,098h,0bch,005h,000h	; ae08  ........?zrr....
	defb 08bh,080h,0e0h,0f0h,0f8h,0f8h,0fch,05eh,04eh,04eh,012h,03ah,005h,000h,08bh,001h	; ae18  .......^NN.:....
	defb 006h,008h,017h,018h,027h,05fh,05fh,07fh,0ffh,0efh,005h,000h,093h,080h,060h,010h	; ae28  ....'__.......`.
	defb 0e8h,018h,0e4h,0fah,0fah,0feh,0feh,0eeh,07fh,03fh,01eh,01fh,01fh,00fh,007h,00fh	; ae38  .........?......
	defb 008h,000h,087h,0fch,0f8h,07fh,0feh,0fch,0b8h,090h,009h,000h,088h,043h,021h,017h	; ae48  .............C!.
	defb 018h,010h,009h,007h,00fh,008h,000h,087h,0c4h,0b8h,0c7h,00eh,0dch,0b8h,090h,00fh	; ae58  ................
	defb 000h,08ah,001h,007h,00fh,01fh,01fh,03fh,07ah,072h,032h,008h,006h,000h,08ah,080h	; ae68  .......?zr2.....
	defb 0e0h,0f0h,0f8h,0f8h,0fch,05eh,04eh,04dh,019h,006h,000h,08ah,001h,006h,008h,017h	; ae78  .....^NM........
	defb 018h,027h,05fh,05fh,03fh,00fh,006h,000h,092h,080h,060h,010h,0e8h,018h,0e4h,0fah	; ae88  .'__?.....`.....
	defb 0feh,0ffh,0ffh,01ch,03fh,07fh,066h,03fh,01fh,03eh,07ch,008h,000h,088h,03eh,0fch	; ae98  ....?.f?.>|...>.
	defb 0f8h,070h,0f8h,0fch,03eh,01fh,008h,000h,088h,01fh,023h,049h,05fh,038h,011h,03eh	; aea8  .p..>.....#I_8.>
	defb 07ch,008h,000h,088h,0f2h,0c4h,088h,0f0h,008h,0c4h,03eh,01fh,00eh,000h,08ah,001h	; aeb8  |.........>.....
	defb 047h,0afh,0b7h,0b7h,0a7h,0aah,00ah,00ah,098h,006h,000h,08ah,080h,0e0h,0f0h,0f8h	; aec8  G...............
	defb 0f8h,0fch,05eh,04eh,04ch,018h,006h,000h,085h,001h,046h,0ech,0ffh,0fch,005h,0ffh	; aed8  ..^NL.....F.....
	defb 006h,000h,092h,080h,060h,010h,0e8h,018h,0e4h,0fah,0fah,0fch,0f8h,0fch,07fh,01fh	; aee8  ....`...........
	defb 00eh,00fh,01fh,01eh,03eh,008h,000h,088h,03ch,0feh,0fdh,07dh,0f2h,0f8h,078h,07ch	; aef8  ....>...<..}..x|
	defb 008h,000h,088h,0f7h,063h,011h,00fh,008h,011h,01eh,03eh,008h,000h,088h,0e4h,0c2h	; af08  ....c.....>.....
	defb 097h,0ffh,012h,088h,078h,07ch,008h,000h,000h	; af18  ....x|...

; ----------------------------------------------------------------------
; DATOS rachas_AF21: rachas a la VRAM (sprites): [n < 0x80] repite el byte
;   siguiente, [0x80 + n] copia n, [0x80] otro destino, 0 acaba; lo leen
;   p00:5A92 (501 bytes)
;   0xaf21..0xb116  (501 bytes)
DATA_rachas_AF21:
	defb 009h,000h,082h,001h,003h,003h,007h,089h,003h,001h,000h,001h,007h,01fh,03fh,07fh	; af21  ..............?.
	defb 07fh,009h,0ffh,009h,000h,082h,001h,002h,003h,004h,08ah,002h,001h,000h,001h,006h	; af31  ................
	defb 01ah,021h,044h,048h,088h,004h,090h,08bh,040h,030h,00fh,080h,000h,080h,0e0h,0f8h	; af41  .!DH....@0......
	defb 0fch,0feh,0feh,009h,0ffh,009h,000h,082h,080h,0c0h,003h,0e0h,08ah,0c0h,080h,000h	; af51  ................
	defb 080h,060h,058h,084h,022h,092h,091h,004h,089h,084h,082h,00ch,0f0h,001h,009h,000h	; af61  .`X."...........
	defb 082h,080h,040h,003h,020h,082h,040h,080h,006h,000h,085h,001h,003h,003h,007h,007h	; af71  ..@. .@.........
	defb 004h,00fh,086h,007h,07fh,03fh,01fh,00fh,07fh,008h,0ffh,003h,0bfh,006h,000h,090h	; af81  .....?..........
	defb 001h,002h,002h,004h,004h,008h,008h,00ch,00bh,005h,060h,03fh,01fh,008h,07fh,0c0h	; af91  ..........`?....
	defb 004h,040h,08bh,020h,060h,060h,0afh,0bfh,0b0h,0feh,0fch,0f8h,0f0h,0f8h,007h,0ffh	; afa1  .@. ``..........
	defb 002h,0fdh,082h,0fah,0f9h,006h,000h,002h,080h,002h,0c0h,002h,0e0h,002h,0c0h,088h	; afb1  ................
	defb 040h,080h,006h,0fch,0f8h,010h,0e8h,01fh,004h,002h,086h,004h,007h,005h,0e5h,0fbh	; afc1  @...............
	defb 019h,006h,000h,002h,080h,002h,040h,002h,020h,003h,0c0h,084h,080h,007h,004h,003h	; afd1  ......@. .......
	defb 00dh,000h,086h,07fh,0bfh,03fh,03eh,03eh,01eh,004h,01fh,081h,00fh,005h,001h,002h	; afe1  .....?>>........
	defb 007h,081h,003h,00dh,000h,08bh,0e0h,0b0h,02fh,032h,02eh,012h,011h,011h,01fh,011h	; aff1  ......../2......
	defb 00fh,005h,001h,008h,0fch,008h,0f8h,010h,000h,002h,004h,081h,0c4h,004h,084h,089h	; b001  ................
	defb 004h,008h,008h,068h,098h,008h,068h,0f8h,0f8h,019h,000h,082h,001h,003h,003h,007h	; b011  ...h..h.........
	defb 089h,003h,001h,000h,001h,007h,01fh,03fh,07fh,07fh,009h,0ffh,009h,000h,082h,001h	; b021  .......?........
	defb 002h,003h,004h,08ah,002h,001h,000h,001h,006h,01ah,021h,044h,048h,088h,004h,090h	; b031  ..........!DH...
	defb 08bh,040h,030h,00fh,080h,000h,080h,0e0h,0f8h,0fch,0feh,0feh,009h,0ffh,009h,000h	; b041  .@0.............
	defb 082h,080h,0c0h,003h,0e0h,08ah,0c0h,080h,000h,080h,060h,058h,084h,022h,092h,091h	; b051  ..........`X."..
	defb 004h,089h,084h,082h,00ch,0f0h,001h,009h,000h,082h,080h,040h,003h,020h,082h,040h	; b061  ...........@. .@
	defb 080h,006h,000h,002h,001h,002h,003h,002h,007h,002h,003h,087h,002h,001h,07fh,03fh	; b071  ...............?
	defb 01fh,00fh,01fh,007h,0ffh,002h,0bfh,082h,05fh,09fh,006h,000h,002h,001h,002h,002h	; b081  ........_.......
	defb 002h,004h,003h,003h,087h,001h,060h,03fh,01fh,008h,017h,0f8h,004h,040h,08bh,020h	; b091  ......`?.....@.
	defb 0e0h,0a0h,0a7h,0dfh,098h,0feh,0fch,0f8h,0f0h,0feh,008h,0ffh,003h,0fdh,006h,000h	; b0a1  ................
	defb 085h,080h,0c0h,0c0h,0e0h,0e0h,004h,0f0h,087h,0e0h,006h,0fch,0f8h,010h,0feh,003h	; b0b1  ................
	defb 004h,002h,086h,004h,006h,006h,0f5h,0fdh,00dh,006h,000h,08ah,080h,040h,040h,020h	; b0c1  .............@@
	defb 020h,010h,010h,030h,0d0h,0a0h,010h,000h,008h,03fh,008h,01fh,010h,000h,002h,020h	; b0d1   ..0.....?.....
	defb 081h,023h,004h,021h,08fh,020h,010h,010h,016h,019h,010h,016h,01fh,01fh,0feh,0fdh	; b0e1  .#.!. ..........
	defb 0fch,07ch,07ch,078h,004h,0f8h,081h,0f0h,005h,080h,083h,0e0h,020h,0c0h,00dh,000h	; b0f1  .||x........ ...
	defb 08bh,007h,00dh,0f4h,04ch,074h,048h,088h,088h,0f8h,088h,0f0h,005h,080h,002h,0e0h	; b101  ....LtH.........
	defb 081h,0c0h,00dh,000h,000h	; b111

; ----------------------------------------------------------------------
; DATOS colores_B116: 1 punteros a las tablas de colores de los graficos (el
;   modo / 8 de la lista elige una); lo leen p00:54AC (2 bytes)
;   0xb116..0xb118  (2 bytes)
DATA_colores_B116:
	defw 0b118h	; b116  -> DATA_col_B118

; ----------------------------------------------------------------------
; DATOS col_B118: 8 colores (de 4 bits) para los graficos de 3 bits por punto;
;   lo leen p00:54AC (8 bytes)
;   0xb118..0xb120  (8 bytes)
DATA_col_B118:
	defb 007h,008h,00ah,00bh,00ch,00fh,000h,000h	; b118  ........

; ----------------------------------------------------------------------
; DATOS graf_B120: 2 fichas de graficos (el titulo) de 5 bytes [modo][sitio en
;   la pagina 1][cuantos][puntero], 0xFF acaba: caracteres de 1, 2 o 3 bits
;   por punto que se pasan a 4 bits con la tabla de colores de 0xB116; lo leen
;   p00:54A0 (11 bytes)
;   0xb120..0xb12b  (11 bytes)
DATA_graf_B120:
	defb 004h,001h,040h,02bh,0b1h	; b120
	defb 004h,041h,012h,02bh,0b7h	; b125
	defb 0ffh	; b12a

; ----------------------------------------------------------------------
; DATOS car_B12B: 64 caracteres de 3 bits por punto (24 bytes cada uno), de la
;   lista 0xB120; lo leen p00:54A0 (1536 bytes)
;   0xb12b..0xb72b  (1536 bytes)
DATA_car_B12B:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b12b  ........
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b133  ........
	defb 0ffh,0f7h,0ffh,0ffh,0f3h,0ffh,0ffh,0f1h	; b13b  ........
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b143  ........
	defb 0ffh,0ffh,0ffh,00eh,0ffh,0ffh,0a4h,0ffh	; b14b  ........
	defb 0ffh,0aah,0ffh,0ffh,0aeh,0ffh,0ffh,0aeh	; b153  ........
	defb 0ffh,03fh,01fh,0ffh,0ffh,03fh,0ffh,0ffh	; b15b  .?...?..
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b163  ........
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b16b  ........
	defb 0ffh,03fh,08fh,0ffh,07fh,01fh,0ffh,0ffh	; b173  .?......
	defb 03fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b17b  ?.......
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b183  ........
	defb 040h,003h,0c0h,040h,01fh,0c0h,0c0h,01fh	; b18b  @..@....
	defb 0c0h,040h,01fh,0c0h,040h,006h,0f9h,078h	; b193  .@..@..x
	defb 002h,0f9h,038h,002h,039h,018h,0c2h,039h	; b19b  ..8.9..9
	defb 008h,062h,019h,088h,022h,099h,080h,032h	; b1a3  .b.."..2
	defb 089h,048h,002h,0d9h,058h,002h,0d9h,0f8h	; b1ab  .H..X...
	defb 002h,0f9h,0f8h,002h,0f9h,040h,002h,0c1h	; b1b3  .....@..
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0c0h,0ffh,0ffh	; b1bb  ........
	defb 0c0h,0ffh,0ffh,0c0h,0ffh,0f0h,0cfh,0f8h	; b1c3  ........
	defb 0f0h,0c9h,0f8h,0f2h,009h,0f8h,0f2h,009h	; b1cb  ........
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,010h,0ffh,0ffh	; b1d3  ........
	defb 000h,0ffh,0feh,001h,0ffh,070h,08fh,0f9h	; b1db  .....p..
	defb 030h,089h,0f9h,032h,089h,0f9h,032h,089h	; b1e3  0..2..2.
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,007h,0ffh,0ffh	; b1eb  ........
	defb 007h,0ffh,00fh,0f7h,05fh,007h,056h,05fh	; b1f3  ...._.V_
	defb 0a7h,054h,05fh,0a7h,050h,0ffh,006h,0f1h	; b1fb  .T_.P...
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b203  ........
	defb 0ffh,0ffh,0ffh,080h,0ffh,0ffh,000h,0ffh	; b20b  ........
	defb 0e0h,01fh,0e0h,000h,0e0h,080h,01fh,080h	; b213  ........
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b21b  ........
	defb 0ffh,0ffh,0ffh,03ch,0ffh,0ffh,00ch,0ffh	; b223  ...<....
	defb 03fh,084h,07fh,00fh,060h,01fh,087h,030h	; b22b  ?...`..0
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,080h,0ffh,0ffh	; b233  ........
	defb 080h,0ffh,0e0h,01fh,0f1h,0e0h,013h,0f1h	; b23b  ........
	defb 084h,073h,0c0h,084h,040h,0c0h,09fh,040h	; b243  .s..@..@
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,040h,0ffh,0ffh	; b24b  .....@..
	defb 040h,0ffh,0f0h,00fh,0f8h,071h,008h,0f8h	; b253  @....q..
	defb 032h,0c9h,078h,092h,049h,078h,002h,0f9h	; b25b  2.x.Ix..
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,00ch,0ffh,0ffh	; b263  ........
	defb 000h,0ffh,07fh,080h,0ffh,03ch,083h,0fch	; b26b  .....<..
	defb 020h,09ch,0f0h,023h,090h,0f0h,027h,0d0h	; b273   ..#..'.
	defb 0ffh,0ffh,01fh,0ffh,0ffh,01fh,0ffh,0ffh	; b27b  ........
	defb 000h,0ffh,03fh,0c0h,03fh,000h,03fh,020h	; b283  ..?.?.?
	defb 0c0h,020h,020h,0cfh,020h,020h,08fh,060h	; b28b  .  .  .`
	defb 0ffh,0ffh,0e3h,0ffh,0ffh,083h,0ffh,0ffh	; b293  ........
	defb 003h,0ffh,0cfh,033h,0dfh,027h,0d3h,01fh	; b29b  ...3.'..
	defb 027h,013h,01fh,0c7h,033h,01fh,0c7h,033h	; b2a3  '...3..3
	defb 0f8h,0f2h,009h,0f8h,0c2h,039h,0e0h,0c3h	; b2ab  .....9..
	defb 020h,0e0h,0cfh,020h,0e0h,0cfh,020h,0e0h	; b2b3   .. .. .
	defb 042h,039h,0f8h,042h,039h,0f8h,062h,009h	; b2bb  B9.B9.b.
	defb 0f8h,032h,089h,0f8h,002h,0f9h,000h,002h	; b2c3  .2......
	defb 000h,000h,0ffh,000h,000h,0ffh,000h,000h	; b2cb  ........
	defb 002h,0f9h,0f8h,002h,0f9h,0f8h,002h,089h	; b2d3  ........
	defb 0ffh,00ch,083h,0feh,00ch,0e2h,03ch,049h	; b2db  ......<I
	defb 024h,03ch,089h,064h,03ch,089h,064h,038h	; b2e3  $<.d<.d8
	defb 003h,0e8h,0f8h,002h,0e9h,0f8h,002h,089h	; b2eb  ........
	defb 000h,07ch,003h,009h,0c0h,03bh,039h,080h	; b2f3  .|....9.
	defb 07bh,079h,000h,0cbh,079h,010h,0cbh,079h	; b2fb  {y..y..y
	defb 010h,0cbh,0f9h,030h,08bh,0f1h,024h,093h	; b303  ...0..$.
	defb 00fh,0e3h,018h,00fh,061h,01ch,087h,031h	; b30b  ....a..1
	defb 08ch,0c7h,011h,04ch,0c3h,019h,046h,0e3h	; b313  ...L..F.
	defb 048h,026h,0e3h,048h,026h,0e3h,048h,026h	; b31b  H&.H&.H&
	defb 0c0h,09fh,040h,0c0h,088h,077h,0f1h,004h	; b323  ..@..w..
	defb 0f3h,080h,004h,080h,080h,03fh,080h,080h	; b32b  .....?..
	defb 03fh,080h,080h,008h,0f6h,0f2h,00ch,0f2h	; b333  ?.......
	defb 070h,086h,051h,071h,004h,0d3h,073h,000h	; b33b  p.Qq..s.
	defb 0d6h,073h,000h,0d7h,070h,004h,0d0h,0f0h	; b343  .s..p...
	defb 007h,0d0h,0f0h,007h,090h,0f0h,023h,094h	; b34b  ......#.
	defb 060h,00fh,0e0h,0e4h,008h,0a7h,0e7h,008h	; b353  `.......
	defb 027h,0e7h,008h,0e5h,027h,00ah,025h,027h	; b35b  '...'.%'
	defb 0cah,025h,027h,0cah,025h,027h,0cah,025h	; b363  .%'.%'.%
	defb 01fh,0c7h,033h,01fh,0c7h,033h,01fh,047h	; b36b  ..3..3.G
	defb 033h,01fh,047h,033h,01fh,047h,033h,01fh	; b373  3.G3.G3.
	defb 047h,033h,01fh,047h,033h,01fh,047h,033h	; b37b  G3.G3.G3
	defb 0f8h,072h,009h,0f8h,072h,009h,0f8h,072h	; b383  .r..r..r
	defb 009h,0ffh,070h,00fh,0ffh,0f8h,000h,0ffh	; b38b  ..p.....
	defb 0ffh,000h,0ffh,0ffh,080h,0ffh,0f0h,08fh	; b393  ........
	defb 0f8h,032h,089h,0f8h,032h,089h,0f8h,032h	; b39b  .2..2..2
	defb 089h,0f8h,032h,089h,0f8h,032h,009h,0f8h	; b3a3  ..2..2..
	defb 0f2h,009h,0f1h,0e4h,013h,0e1h,00ch,0e3h	; b3ab  ........
	defb 0f8h,032h,089h,0f8h,032h,089h,0f8h,032h	; b3b3  .2..2..2
	defb 089h,0f8h,032h,089h,0f8h,032h,089h,0f8h	; b3bb  ..2..2..
	defb 033h,088h,0fch,079h,004h,0fch,079h,004h	; b3c3  3..y..y.
	defb 0f1h,024h,093h,0f3h,020h,096h,0f3h,020h	; b3cb  .$.. ..
	defb 096h,0f3h,000h,0b6h,0e3h,008h,0a6h,067h	; b3d3  .......g
	defb 001h,0ech,047h,010h,0cfh,006h,0f0h,00eh	; b3db  ..G.....
	defb 0e3h,048h,026h,0e3h,0c8h,026h,0e3h,0c8h	; b3e3  .H&..&..
	defb 026h,0e3h,0c8h,026h,0c3h,098h,046h,0c3h	; b3eb  &..&..F.
	defb 018h,0c6h,087h,030h,08ch,007h,071h,00ch	; b3f3  ...0..q.
	defb 0f3h,004h,0f3h,0c0h,084h,040h,0c0h,09fh	; b3fb  .....@..
	defb 040h,0c0h,09fh,040h,0c0h,088h,077h,0f1h	; b403  @..@..w.
	defb 08ch,073h,0f1h,0c4h,033h,0e0h,004h,0e0h	; b40b  .s..3...
	defb 0f0h,020h,097h,0f3h,020h,097h,0f3h,020h	; b413  . .. ..
	defb 096h,0f3h,020h,096h,0f3h,020h,097h,0f0h	; b41b  .. .. ..
	defb 024h,090h,0f0h,027h,090h,0f0h,023h,094h	; b423  $..'..#.
	defb 027h,00ah,0e5h,0e7h,00ah,0e5h,0e7h,00ah	; b42b  '.......
	defb 025h,0e7h,0cah,025h,0e7h,008h,0e7h,026h	; b433  %..%...&
	defb 008h,026h,024h,0c9h,024h,024h,0cbh,024h	; b43b  .&$.$$.$
	defb 01fh,047h,033h,01fh,047h,033h,01fh,047h	; b443  .G3.G3.G
	defb 033h,01fh,047h,033h,01fh,047h,033h,01fh	; b44b  3.G3.G3.
	defb 0c7h,033h,01fh,0c7h,033h,03fh,087h,073h	; b453  .3..3?.s
	defb 0f8h,0f0h,088h,0f8h,0f3h,088h,0f8h,0f3h	; b45b  ........
	defb 088h,0f8h,0f0h,08fh,0ffh,0f0h,08fh,0ffh	; b463  ........
	defb 0f8h,080h,0ffh,0ffh,080h,0ffh,0ffh,0ffh	; b46b  ........
	defb 001h,01ch,003h,003h,0f8h,006h,007h,0e1h	; b473  ........
	defb 01ch,01fh,003h,0f8h,0ffh,007h,0e0h,0ffh	; b47b  ........
	defb 01fh,001h,0ffh,0ffh,007h,0ffh,0ffh,0ffh	; b483  ........
	defb 0feh,078h,022h,0ffh,0fch,033h,0ffh,0fch	; b48b  .x"..3..
	defb 071h,0ffh,0feh,078h,0ffh,0ffh,0fch,0ffh	; b493  q..x....
	defb 0ffh,0feh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b49b  ........
	defb 00eh,0e0h,01ah,00eh,040h,03ah,09eh,000h	; b4a3  ....@:..
	defb 0f3h,0ffh,008h,063h,0ffh,09ch,000h,0ffh	; b4ab  ...c....
	defb 0ffh,01ch,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b4b3  ........
	defb 00fh,0e3h,018h,01fh,0c3h,038h,03fh,007h	; b4bb  .....8?.
	defb 0e0h,0ffh,01fh,0c0h,0ffh,03fh,004h,0ffh	; b4c3  .....?..
	defb 0ffh,01ch,0ffh,0ffh,0fch,0ffh,0ffh,0fch	; b4cb  ........
	defb 080h,00fh,080h,080h,03fh,080h,080h,03ch	; b4d3  ....?..<
	defb 083h,083h,020h,09fh,09fh,000h,0fch,0ffh	; b4db  .. .....
	defb 001h,0f0h,0ffh,087h,000h,0ffh,0ffh,003h	; b4e3  ........
	defb 040h,01eh,0c1h,040h,01eh,0c1h,040h,01eh	; b4eb  @..@..@.
	defb 0c1h,0c0h,01eh,0c1h,0c1h,000h,07fh,0ffh	; b4f3  ........
	defb 0c0h,03eh,0ffh,0e1h,000h,0ffh,0ffh,000h	; b4fb  .>......
	defb 0f0h,020h,097h,0f3h,020h,097h,0ffh,020h	; b503  . .. ..
	defb 09eh,0ffh,030h,080h,0ffh,03fh,000h,0ffh	; b50b  ..0..?..
	defb 0ffh,003h,0ffh,0ffh,07fh,0ffh,0ffh,0ffh	; b513  ........
	defb 024h,00bh,0e4h,0e4h,008h,0e7h,0e7h,008h	; b51b  $.......
	defb 027h,0e7h,0c8h,024h,0e7h,0c9h,024h,0e7h	; b523  '..$..$.
	defb 0c9h,024h,0e7h,0c9h,024h,0e7h,0c9h,024h	; b52b  .$..$..$
	defb 03fh,00fh,0e3h,07fh,01fh,0c7h,0ffh,03fh	; b533  ?......?
	defb 087h,0ffh,07fh,00fh,0ffh,0ffh,01fh,0ffh	; b53b  ........
	defb 0ffh,07fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b543  ........
	defb 0e7h,0c9h,024h,0e7h,0c9h,024h,0e7h,0c9h	; b54b  ..$..$..
	defb 024h,0f7h,0c9h,034h,0ffh,0c1h,00ch,0ffh	; b553  $..4....
	defb 0f1h,080h,0ffh,0ffh,0c0h,0ffh,0ffh,0f1h	; b55b  ........
	defb 0ffh,0fbh,0f0h,0ffh,0f9h,0f2h,0ffh,0f8h	; b563  ........
	defb 0f3h,0feh,0f8h,0f2h,0feh,0f8h,0f2h,0feh	; b56b  ........
	defb 0f8h,0f2h,0feh,0f8h,0f2h,0feh,0f8h,0f2h	; b573  ........
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b57b  ........
	defb 000h,0ffh,0ffh,000h,0ffh,000h,0ffh,000h	; b583  ........
	defb 000h,000h,000h,0ffh,000h,000h,0ffh,000h	; b58b  ........
	defb 0ffh,0ffh,07fh,0ffh,0ffh,00fh,0ffh,0ffh	; b593  ........
	defb 000h,0ffh,03fh,0c0h,03fh,000h,03fh,000h	; b59b  ..?.?.?.
	defb 0c0h,000h,000h,0ffh,000h,000h,0ffh,000h	; b5a3  ........
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b5ab  ........
	defb 000h,0ffh,0ffh,000h,0ffh,00eh,0f1h,01fh	; b5b3  ........
	defb 026h,011h,01fh,0c6h,031h,01fh,0c6h,031h	; b5bb  &...1..1
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b5c3  ........
	defb 000h,0ffh,0ffh,000h,0ffh,008h,0f7h,01ch	; b5cb  ........
	defb 020h,014h,01ch,041h,034h,01ch,041h,034h	; b5d3   ..A4.A4
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b5db  ........
	defb 00fh,0ffh,0ffh,00fh,0ffh,03fh,0cfh,07fh	; b5e3  .....?..
	defb 09fh,04fh,07fh,01fh,0cch,07fh,01fh,0cch	; b5eb  .O......
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b5f3  ........
	defb 0f0h,0ffh,0ffh,0f0h,0ffh,0fch,0f3h,0feh	; b5fb  ........
	defb 0fch,0f2h,0feh,0fch,002h,0feh,0fch,002h	; b603  ........
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0f8h,0ffh,0ffh	; b60b  ........
	defb 000h,0ffh,0f8h,007h,0fdh,008h,0f5h,01dh	; b613  ........
	defb 022h,015h,01dh,0c2h,035h,01fh,0c0h,037h	; b61b  "...5..7
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,00fh,0ffh,0ffh	; b623  ........
	defb 00fh,0ffh,03fh,0cfh,07fh,01fh,04fh,07fh	; b62b  ..?...O.
	defb 09fh,04fh,07fh,09fh,04fh,0ffh,01fh,0cfh	; b633  .O..O...
	defb 0ffh,0fch,0f3h,0ffh,0feh,0f1h,0ffh,0ffh	; b63b  ........
	defb 0f8h,0ffh,0ffh,0feh,0ffh,0ffh,0ffh,0ffh	; b643  ........
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b64b  ........
	defb 000h,03fh,0c0h,0e0h,000h,0ffh,0ffh,000h	; b653  .?......
	defb 07fh,0ffh,0c0h,000h,0ffh,0ffh,080h,0ffh	; b65b  ........
	defb 0ffh,0fch,0ffh,0ffh,0fch,0ffh,0ffh,0fch	; b663  ........
	defb 000h,0ffh,000h,000h,070h,08fh,087h,030h	; b66b  ....p..0
	defb 08fh,087h,030h,08ch,087h,031h,08ch,087h	; b673  ..0..1..
	defb 031h,08ch,087h,031h,08ch,087h,031h,08ch	; b67b  1..1..1.
	defb 01fh,0c6h,031h,01fh,006h,0f1h,0ffh,006h	; b683  ..1.....
	defb 0f1h,0ffh,006h,001h,0ffh,0feh,001h,0ffh	; b68b  ........
	defb 0feh,0f9h,0ffh,0feh,0f9h,0ffh,0feh,0f9h	; b693  ........
	defb 01ch,041h,034h,01ch,041h,034h,01ch,041h	; b69b  .A4.A4.A
	defb 034h,01ch,041h,034h,01ch,041h,034h,01ch	; b6a3  4.A4.A4.
	defb 041h,034h,01ch,041h,034h,01ch,041h,034h	; b6ab  A4.A4.A4
	defb 07fh,01fh,0c0h,07fh,01fh,0c0h,07fh,01fh	; b6b3  ........
	defb 0c0h,07fh,000h,0dfh,071h,000h,0d1h,071h	; b6bb  ....q..q
	defb 004h,0d3h,071h,004h,0d3h,071h,004h,0d3h	; b6c3  ..q..q..
	defb 0feh,080h,07eh,0c0h,080h,040h,0c0h,09fh	; b6cb  ..~..@..
	defb 040h,0c0h,01fh,040h,0c0h,001h,05eh,0feh	; b6d3  @..@..^.
	defb 000h,07eh,0feh,000h,002h,0feh,07ch,002h	; b6db  .~....|.
	defb 01fh,0c0h,03fh,000h,0c1h,000h,000h,0feh	; b6e3  ..?.....
	defb 001h,000h,0feh,001h,000h,0c0h,03fh,01fh	; b6eb  ......?.
	defb 0c0h,03fh,01fh,0c0h,030h,01fh,0c7h,030h	; b6f3  .?..0..0
	defb 0ffh,01fh,08fh,0ffh,03fh,080h,0ffh,03fh	; b6fb  ....?..?
	defb 080h,0ffh,03fh,080h,0ffh,020h,09fh,0f0h	; b703  ..?.. ..
	defb 020h,090h,0f0h,027h,010h,0f0h,0e7h,010h	; b70b   ..'....
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,000h,0ffh,0ffh	; b713  ........
	defb 000h,0ffh,0ffh,000h,0ffh,000h,0ffh,001h	; b71b  ........
	defb 002h,001h,001h,0fch,003h,001h,0fch,003h	; b723  ........

; ----------------------------------------------------------------------
; DATOS car_B72B: 18 caracteres de 3 bits por punto (24 bytes cada uno), de la
;   lista 0xB120; lo leen p00:54A0 (432 bytes)
;   0xb72b..0xb8db  (432 bytes)
DATA_car_B72B:
	defb 0ffh,0ffh,0fch,0ffh,0ffh,0fch,0ffh,0ffh	; b72b  ........
	defb 0fch,0ffh,0ffh,0fch,0ffh,0ffh,0f8h,0ffh	; b733  ........
	defb 0fch,0e3h,0feh,0f0h,08eh,0f8h,0c1h,038h	; b73b  .......8
	defb 087h,031h,08ch,087h,031h,08ch,087h,031h	; b743  .1..1..1
	defb 08ch,087h,031h,08ch,087h,031h,08ch,087h	; b74b  ..1..1..
	defb 030h,08fh,000h,078h,000h,000h,0ffh,000h	; b753  0..x....
	defb 0ffh,0feh,0f9h,0ffh,0feh,0f9h,0ffh,0feh	; b75b  ........
	defb 0f1h,0ffh,0feh,001h,0ffh,0fch,003h,0feh	; b763  ........
	defb 008h,0f6h,01ch,001h,034h,01ch,0c1h,034h	; b76b  ....4..4
	defb 01ch,041h,034h,01ch,041h,034h,01ch,041h	; b773  .A4.A4.A
	defb 034h,01ch,041h,034h,01ch,041h,034h,01ch	; b77b  4.A4.A4.
	defb 0c1h,034h,01ch,0c1h,034h,03ch,089h,064h	; b783  .4..4<.d
	defb 071h,004h,0d3h,071h,004h,0d3h,071h,004h	; b78b  q..q..q.
	defb 0d3h,061h,00ch,0e3h,063h,008h,0e6h,043h	; b793  .a..c..C
	defb 018h,0c6h,007h,0b0h,00ch,00fh,0e1h,01ch	; b79b  ........
	defb 0feh,07ch,002h,0feh,07ch,002h,0feh,000h	; b7a3  .|..|...
	defb 07eh,0c0h,000h,040h,0c0h,01fh,040h,0c0h	; b7ab  ~..@..@.
	defb 09fh,040h,0c0h,081h,05eh,0feh,080h,07eh	; b7b3  .@..^..~
	defb 01fh,0c7h,030h,01fh,0c7h,030h,01fh,0c0h	; b7bb  ..0..0..
	defb 03fh,000h,0c1h,000h,000h,0feh,001h,000h	; b7c3  ?.......
	defb 0feh,001h,000h,0c0h,03fh,01fh,0c0h,03fh	; b7cb  ....?..?
	defb 0f0h,0e7h,010h,0f0h,0e0h,01fh,0ffh,060h	; b7d3  .......`
	defb 09fh,0ffh,030h,080h,0ffh,03fh,080h,0ffh	; b7db  ..0..?..
	defb 03fh,080h,0ffh,03fh,09fh,0ffh,03fh,09fh	; b7e3  ?..?..?.
	defb 001h,0fch,003h,001h,000h,0ffh,0ffh,000h	; b7eb  ........
	defb 0ffh,0ffh,000h,000h,0ffh,0ffh,000h,0ffh	; b7f3  ........
	defb 0ffh,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b7fb  ........
	defb 0ffh,0ffh,0fch,0ffh,0feh,081h,0ffh,0c0h	; b803  ........
	defb 09fh,0feh,0c0h,09eh,0f0h,0c1h,090h,0f0h	; b80b  ........
	defb 0c7h,090h,0f0h,0c7h,090h,0f0h,0c6h,091h	; b813  ........
	defb 0e0h,087h,060h,0c0h,01fh,0c0h,080h,03ch	; b81b  ..`....<
	defb 083h,003h,070h,00fh,00fh,0e0h,01ch,01fh	; b823  ..p.....
	defb 0c3h,030h,03fh,08fh,061h,07fh,01fh,0c7h	; b82b  .0?.a...
	defb 000h,0ffh,000h,000h,000h,0ffh,0ffh,000h	; b833  ........
	defb 0ffh,0ffh,000h,000h,0ffh,0ffh,000h,0ffh	; b83b  ........
	defb 0ffh,03fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b843  .?......
	defb 01ch,0c1h,034h,01ch,001h,0f4h,0fch,000h	; b84b  ..4.....
	defb 0f7h,0ffh,000h,007h,0ffh,0fch,000h,0ffh	; b853  ........
	defb 0ffh,0f0h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b85b  ........
	defb 03ch,089h,064h,07ch,019h,0c4h,0fch,038h	; b863  <.d|...8
	defb 087h,0ffh,078h,007h,0ffh,0fch,020h,0ffh	; b86b  ..x... .
	defb 0ffh,0e0h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b873  ........
	defb 01fh,0c3h,038h,03fh,007h,0f2h,0ffh,00fh	; b87b  ..8?....
	defb 0c3h,0ffh,03fh,007h,0ffh,0ffh,00fh,0ffh	; b883  ..?.....
	defb 0ffh,03fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b88b  .?......
	defb 0feh,080h,002h,0feh,0fch,002h,0feh,0fch	; b893  ........
	defb 0f2h,0feh,0fch,0f2h,0ffh,0fch,0f1h,0ffh	; b89b  ........
	defb 0feh,0f0h,0ffh,0ffh,0f0h,0ffh,0ffh,0ffh	; b8a3  ........
	defb 01fh,0c0h,030h,01fh,0c7h,030h,01fh,0c7h	; b8ab  ..0..0..
	defb 033h,01fh,0c7h,033h,0ffh,007h,0f3h,0ffh	; b8b3  3..3....
	defb 00fh,003h,0ffh,0ffh,007h,0ffh,0ffh,0ffh	; b8bb  ........
	defb 0f1h,0c0h,09fh,0ffh,0c0h,09eh,0ffh,0e1h	; b8c3  ........
	defb 080h,0ffh,0ffh,080h,0ffh,0ffh,083h,0ffh	; b8cb  ........
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b8d3  ........

; ----------------------------------------------------------------------
; DATOS dibujo_B8DB: dibujo de caracteres (las secuencias): 0xFE [dx] baja una
;   fila, 0xFF acaba; lo leen p00:5628 (130 bytes)
;   0xb8db..0xb95d  (130 bytes)
DATA_dibujo_B8DB:
	defb 001h,0feh,000h,02eh,030h,02fh,031h,032h,033h,034h,035h,036h,000h,007h,008h,009h	; b8db  ....0/123456....
	defb 00ah,00bh,00ch,00dh,00eh,00fh,010h,002h,0feh,000h,037h,038h,039h,03ah,03bh,03ch	; b8eb  ..........789:.<
	defb 03dh,03eh,03fh,040h,011h,012h,013h,014h,015h,016h,005h,017h,018h,019h,0feh,000h	; b8fb  =>?@............
	defb 000h,041h,042h,043h,044h,045h,046h,047h,048h,049h,01ah,01bh,01ch,01dh,01eh,01fh	; b90b  .ABCDEFGHI......
	defb 006h,020h,021h,022h,0feh,000h,04ah,04bh,04ch,04dh,04eh,04fh,050h,051h,003h,000h	; b91b  . !"..JKLMNOPQ..
	defb 023h,024h,025h,026h,027h,028h,029h,02ah,02bh,02ch,0feh,000h,052h,004h,000h,000h	; b92b  #$%&'()*+,..R...
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,02dh,0feh	; b93b  ..............-.
	defb 000h,000h,000h,000h,000h,0dah,0ebh,0efh,0eeh,0e1h,0edh,0e9h,000h,0d1h,0d9h,0d8h	; b94b  ................
	defb 0d8h,0ffh	; b95b

; ----------------------------------------------------------------------
; DATOS paleta_B95D: paleta comun de las piramides: 10 colores [color][rojo y
;   azul][verde], 0xFF acaba; lo leen p00:5681 (31 bytes)
;   0xb95d..0xb97c  (31 bytes)
DATA_paleta_B95D:
	defb 000h,000h,000h	; b95d
	defb 007h,060h,000h	; b960
	defb 008h,036h,004h	; b963
	defb 009h,060h,004h	; b966
	defb 00ah,070h,007h	; b969
	defb 00bh,077h,007h	; b96c
	defb 00ch,014h,002h	; b96f
	defb 00dh,017h,007h	; b972
	defb 00eh,075h,006h	; b975
	defb 00fh,000h,000h	; b978
	defb 0ffh	; b97b

; ----------------------------------------------------------------------
; DATOS paletas_B97A: 6 punteros, uno por piramide (0xE241, desde 0xB97A): la
;   paleta de sus fases 1-2, 5-6 y 9-10; lo leen p00:5672 (12 bytes)
;   0xb97c..0xb988  (12 bytes)
DATA_paletas_B97A:
	defw 0b988h,0b99bh,0b9aeh,0b9c1h,0b9d4h,0b9e7h	; b97c

; ----------------------------------------------------------------------
; DATOS paleta_B988: paleta de la piramide 1: 6 colores [color][rojo y
;   azul][verde], 0xFF acaba; lo leen p00:5675 (19 bytes)
;   0xb988..0xb99b  (19 bytes)
DATA_paleta_B988:
	defb 001h,040h,002h	; b988
	defb 002h,045h,004h	; b98b
	defb 003h,034h,003h	; b98e
	defb 004h,023h,002h	; b991
	defb 005h,012h,001h	; b994
	defb 006h,000h,000h	; b997
	defb 0ffh	; b99a

; ----------------------------------------------------------------------
; DATOS paleta_B99B: paleta de la piramide 2: 6 colores [color][rojo y
;   azul][verde], 0xFF acaba; lo leen p00:5675 (19 bytes)
;   0xb99b..0xb9ae  (19 bytes)
DATA_paleta_B99B:
	defb 001h,062h,005h	; b99b
	defb 002h,052h,003h	; b99e
	defb 003h,032h,002h	; b9a1
	defb 004h,021h,001h	; b9a4
	defb 005h,010h,000h	; b9a7
	defb 006h,002h,005h	; b9aa
	defb 0ffh	; b9ad

; ----------------------------------------------------------------------
; DATOS paleta_B9AE: paleta de la piramide 3: 6 colores [color][rojo y
;   azul][verde], 0xFF acaba; lo leen p00:5675 (19 bytes)
;   0xb9ae..0xb9c1  (19 bytes)
DATA_paleta_B9AE:
	defb 001h,012h,007h	; b9ae
	defb 002h,002h,000h	; b9b1
	defb 003h,044h,006h	; b9b4
	defb 004h,022h,004h	; b9b7
	defb 005h,000h,002h	; b9ba
	defb 006h,003h,000h	; b9bd
	defb 0ffh	; b9c0

; ----------------------------------------------------------------------
; DATOS paleta_B9C1: paleta de la piramide 4: 6 colores [color][rojo y
;   azul][verde], 0xFF acaba; lo leen p00:5675 (19 bytes)
;   0xb9c1..0xb9d4  (19 bytes)
DATA_paleta_B9C1:
	defb 001h,000h,001h	; b9c1
	defb 002h,011h,002h	; b9c4
	defb 003h,022h,003h	; b9c7
	defb 004h,033h,005h	; b9ca
	defb 005h,077h,007h	; b9cd
	defb 006h,007h,006h	; b9d0
	defb 0ffh	; b9d3

; ----------------------------------------------------------------------
; DATOS paleta_B9D4: paleta de la piramide 5: 6 colores [color][rojo y
;   azul][verde], 0xFF acaba; lo leen p00:5675 (19 bytes)
;   0xb9d4..0xb9e7  (19 bytes)
DATA_paleta_B9D4:
	defb 001h,053h,002h	; b9d4
	defb 002h,042h,001h	; b9d7
	defb 003h,031h,000h	; b9da
	defb 004h,010h,000h	; b9dd
	defb 005h,060h,003h	; b9e0
	defb 006h,060h,000h	; b9e3
	defb 0ffh	; b9e6

; ----------------------------------------------------------------------
; DATOS paleta_B9E7: paleta de la piramide 6: 6 colores [color][rojo y
;   azul][verde], 0xFF acaba; lo leen p00:5675 (19 bytes)
;   0xb9e7..0xb9fa  (19 bytes)
DATA_paleta_B9E7:
	defb 001h,011h,002h	; b9e7
	defb 002h,022h,003h	; b9ea
	defb 003h,033h,004h	; b9ed
	defb 004h,044h,005h	; b9f0
	defb 005h,000h,001h	; b9f3
	defb 006h,070h,000h	; b9f6
	defb 0ffh	; b9f9

; ----------------------------------------------------------------------
; DATOS paletas_B9F8: 6 punteros, uno por piramide (0xE241, desde 0xB9F8): la
;   paleta de sus fases 3-4 y 7-8; lo leen p00:5672 (12 bytes)
;   0xb9fa..0xba06  (12 bytes)
DATA_paletas_B9F8:
	defw 0ba06h,0ba19h,0ba2ch,0ba3fh,0ba52h,0ba65h	; b9fa

; ----------------------------------------------------------------------
; DATOS paleta_BA06: paleta de la piramide 1: 6 colores [color][rojo y
;   azul][verde], 0xFF acaba; lo leen p00:5675 (19 bytes)
;   0xba06..0xba19  (19 bytes)
DATA_paleta_BA06:
	defb 001h,040h,002h	; ba06
	defb 002h,046h,003h	; ba09
	defb 003h,035h,002h	; ba0c
	defb 004h,024h,001h	; ba0f
	defb 005h,012h,000h	; ba12
	defb 006h,000h,000h	; ba15
	defb 0ffh	; ba18

; ----------------------------------------------------------------------
; DATOS paleta_BA19: paleta de la piramide 2: 6 colores [color][rojo y
;   azul][verde], 0xFF acaba; lo leen p00:5675 (19 bytes)
;   0xba19..0xba2c  (19 bytes)
DATA_paleta_BA19:
	defb 001h,063h,003h	; ba19
	defb 002h,052h,002h	; ba1c
	defb 003h,041h,001h	; ba1f
	defb 004h,030h,000h	; ba22
	defb 005h,010h,000h	; ba25
	defb 006h,002h,005h	; ba28
	defb 0ffh	; ba2b

; ----------------------------------------------------------------------
; DATOS paleta_BA2C: paleta de la piramide 3: 6 colores [color][rojo y
;   azul][verde], 0xFF acaba; lo leen p00:5675 (19 bytes)
;   0xba2c..0xba3f  (19 bytes)
DATA_paleta_BA2C:
	defb 001h,054h,006h	; ba2c
	defb 002h,002h,000h	; ba2f
	defb 003h,042h,004h	; ba32
	defb 004h,021h,002h	; ba35
	defb 005h,010h,001h	; ba38
	defb 006h,020h,002h	; ba3b
	defb 0ffh	; ba3e

; ----------------------------------------------------------------------
; DATOS paleta_BA3F: paleta de la piramide 4: 6 colores [color][rojo y
;   azul][verde], 0xFF acaba; lo leen p00:5675 (19 bytes)
;   0xba3f..0xba52  (19 bytes)
DATA_paleta_BA3F:
	defb 001h,001h,000h	; ba3f
	defb 002h,003h,001h	; ba42
	defb 003h,014h,002h	; ba45
	defb 004h,025h,003h	; ba48
	defb 005h,077h,007h	; ba4b
	defb 006h,007h,006h	; ba4e
	defb 0ffh	; ba51

; ----------------------------------------------------------------------
; DATOS paleta_BA52: paleta de la piramide 5: 6 colores [color][rojo y
;   azul][verde], 0xFF acaba; lo leen p00:5675 (19 bytes)
;   0xba52..0xba65  (19 bytes)
DATA_paleta_BA52:
	defb 001h,045h,002h	; ba52
	defb 002h,034h,001h	; ba55
	defb 003h,023h,000h	; ba58
	defb 004h,012h,000h	; ba5b
	defb 005h,046h,003h	; ba5e
	defb 006h,060h,000h	; ba61
	defb 0ffh	; ba64

; ----------------------------------------------------------------------
; DATOS paleta_BA65: paleta de la piramide 6: 6 colores [color][rojo y
;   azul][verde], 0xFF acaba; lo leen p00:5675 (19 bytes)
;   0xba65..0xba78  (19 bytes)
DATA_paleta_BA65:
	defb 001h,031h,002h	; ba65
	defb 002h,042h,003h	; ba68
	defb 003h,053h,004h	; ba6b
	defb 004h,064h,005h	; ba6e
	defb 005h,020h,001h	; ba71
	defb 006h,070h,000h	; ba74
	defb 0ffh	; ba77

; ----------------------------------------------------------------------
; DATOS paleta_BA78: paleta de las musicas: 11 colores [color][rojo y
;   azul][verde], 0xFF acaba; lo leen p00:57C1 (34 bytes)
;   0xba78..0xba9a  (34 bytes)
DATA_paleta_BA78:
	defb 001h,011h,001h	; ba78
	defb 002h,022h,002h	; ba7b
	defb 003h,032h,003h	; ba7e
	defb 004h,044h,004h	; ba81
	defb 007h,077h,007h	; ba84
	defb 008h,014h,001h	; ba87
	defb 009h,012h,000h	; ba8a
	defb 00ah,007h,002h	; ba8d
	defb 00dh,052h,004h	; ba90
	defb 00eh,074h,006h	; ba93
	defb 00fh,000h,000h	; ba96
	defb 0ffh	; ba99

; ----------------------------------------------------------------------
; DATOS rachas_BA9A: rachas a la VRAM (dibujos de los sprites): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:57D3 (107 bytes)
;   0xba9a..0xbb05  (107 bytes)
DATA_rachas_BA9A:
	defb 083h,000h,01ch,03eh,006h,036h,003h,037h,084h,036h,070h,070h,0e4h,009h,000h,08ah	; ba9a  ...>.6.7.6pp....
	defb 080h,0f0h,0f8h,0fch,05eh,00eh,087h,000h,01ch,036h,006h,02ah,087h,02bh,02ah,028h	; baaa  ....^....6.*.+*(
	defb 029h,06fh,04fh,0dbh,009h,000h,089h,080h,0f0h,058h,00ch,0a6h,0f2h,07bh,0e0h,0e0h	; baba  )oO......X...{..
	defb 003h,0c0h,002h,0e0h,084h,070h,078h,038h,018h,004h,008h,084h,00fh,017h,003h,003h	; baca  .....px8........
	defb 003h,007h,002h,00eh,002h,01ch,002h,038h,003h,030h,083h,0f0h,09fh,09fh,003h,0bfh	; bada  .......8.0......
	defb 086h,09fh,0dfh,04fh,067h,037h,01fh,005h,00fh,08ch,0e9h,0fdh,0fdh,0f9h,0f9h,0fbh	; baea  ...Og7..........
	defb 0f2h,0f6h,0e4h,0ech,0c8h,0d8h,003h,0d0h,081h,0f0h,000h	; bafa  ...........

; ----------------------------------------------------------------------
; DATOS sprites_titulo: 256 bytes de dibujos de sprites a 0xF800 (8 sprites de
;   16 x 16); lo leen p00:5608 (256 bytes)
;   0xbb05..0xbc05  (256 bytes)
DATA_sprites_titulo:
	defb 000h,040h,03fh,019h,001h,001h,001h,01fh,00dh,001h,001h,001h,01fh,0fch,070h,000h	; bb05  .@?...........p.
	defb 000h,000h,0feh,00ch,080h,080h,080h,0f8h,09ch,080h,080h,080h,0fch,01fh,006h,000h	; bb15  ................
	defb 000h,000h,000h,026h,018h,000h,000h,000h,012h,00ch,000h,000h,000h,003h,08ch,070h	; bb25  ...&...........p
	defb 000h,000h,001h,0f2h,04ch,040h,040h,000h,060h,05ch,040h,040h,000h,0e0h,019h,006h	; bb35  ....L@@.`\@@....
	defb 000h,000h,001h,07fh,060h,027h,041h,006h,018h,002h,00dh,032h,00ch,078h,033h,000h	; bb45  ....`'A....2.x3.
	defb 000h,0c0h,0c0h,0feh,007h,0f3h,002h,098h,0f4h,040h,060h,060h,070h,0deh,08ch,000h	; bb55  .........@``p...
	defb 000h,000h,000h,000h,01fh,010h,026h,000h,006h,019h,002h,00dh,032h,004h,048h,033h	; bb65  ......&.....2.H3
	defb 000h,000h,000h,001h,0f8h,004h,0f5h,002h,008h,034h,010h,010h,000h,021h,052h,08ch	; bb75  .........4...!R.
	defb 000h,000h,000h,000h,00fh,019h,031h,021h,042h,042h,046h,064h,038h,010h,000h,000h	; bb85  ......1!BBFd8...
	defb 000h,000h,000h,000h,0e0h,010h,008h,004h,004h,004h,004h,00ch,018h,0f0h,060h,000h	; bb95  ..............`.
	defb 000h,000h,000h,000h,000h,006h,008h,010h,021h,021h,021h,002h,044h,028h,010h,000h	; bba5  ........!!!.D(..
	defb 000h,000h,000h,000h,000h,0e0h,090h,088h,000h,002h,002h,002h,004h,008h,090h,060h	; bbb5  ...............`
	defb 000h,008h,00ch,019h,033h,062h,004h,018h,070h,0e0h,04fh,018h,008h,00ch,007h,000h	; bbc5  ....3b..p.O.....
	defb 000h,010h,030h,098h,0cch,046h,020h,018h,00eh,007h,0f2h,018h,010h,030h,0e0h,000h	; bbd5  ..0..F ......0..
	defb 000h,000h,000h,004h,008h,011h,062h,004h,008h,010h,020h,007h,004h,002h,008h,007h	; bbe5  ......b... .....
	defb 000h,000h,000h,020h,010h,088h,046h,020h,010h,008h,004h,0e0h,008h,008h,010h,0e0h	; bbf5  ... ..F ........

; ----------------------------------------------------------------------
; DATOS rect_BC05: 13 x 26 caracteres (p00:573B: B filas de C); lo leen
;   p00:579D (338 bytes)
;   0xbc05..0xbd57  (338 bytes)
DATA_rect_BC05:
	defb 00eh,00ah,00ah,00bh,00bh,00ch,00dh,00dh,00dh,00dh,00dh,00dh,00dh,00dh,00dh,00dh,00dh,00dh,00dh,00dh,00dh,00bh,00bh,00ah,00ah,013h	; bc05  ..........................
	defb 00fh,006h,004h,007h,007h,008h,009h,009h,009h,009h,009h,009h,009h,009h,009h,009h,009h,009h,009h,009h,009h,007h,007h,004h,005h,014h	; bc1f  ..........................
	defb 00fh,015h,01ah,02eh,019h,034h,035h,036h,037h,01ch,01ah,02fh,01eh,032h,033h,01ch,01ah,02eh,019h,034h,035h,036h,037h,01ch,010h,014h	; bc39  .....4567../.23....4567...
	defb 00fh,015h,01bh,025h,018h,026h,027h,028h,029h,01dh,01bh,022h,01fh,024h,021h,01dh,01bh,025h,018h,026h,027h,028h,029h,01dh,010h,014h	; bc53  ...%.&'()..".$!..%.&'()...
	defb 00fh,015h,01bh,025h,018h,026h,027h,028h,029h,01dh,01bh,022h,01fh,024h,021h,01dh,01bh,025h,018h,026h,027h,028h,029h,01dh,010h,014h	; bc6d  ...%.&'()..".$!..%.&'()...
	defb 00fh,015h,01bh,025h,018h,026h,027h,028h,029h,01dh,01bh,022h,01fh,024h,021h,01dh,01bh,025h,018h,026h,027h,028h,029h,01dh,010h,014h	; bc87  ...%.&'()..".$!..%.&'()...
	defb 00fh,015h,01bh,03bh,018h,03dh,03fh,040h,042h,01dh,01bh,030h,020h,038h,03ah,01dh,01bh,03bh,018h,03dh,03fh,040h,042h,01dh,010h,014h	; bca1  .....=?@B..0 8:....=?@B...
	defb 00fh,015h,01bh,03ch,02bh,03eh,02ch,041h,02dh,01dh,01bh,031h,023h,039h,02ah,01dh,01bh,03ch,02bh,03eh,02ch,041h,02dh,01dh,010h,014h	; bcbb  ...<+>,A-..1#9*..<+>,A-...
	defb 00fh,015h,01bh,01dh,01bh,01dh,01bh,01dh,01bh,01dh,01bh,01dh,01bh,01dh,01bh,01dh,01bh,01dh,01bh,01dh,01bh,01dh,01bh,01dh,010h,014h	; bcd5  ..........................
	defb 00fh,015h,01bh,01dh,01bh,01dh,01bh,01dh,01bh,01dh,01bh,01dh,01bh,01dh,01bh,01dh,01bh,01dh,01bh,01dh,01bh,01dh,01bh,01dh,010h,014h	; bcef  ..........................
	defb 00fh,016h,043h,044h,043h,044h,043h,044h,043h,044h,043h,044h,043h,044h,043h,044h,043h,044h,043h,044h,043h,044h,043h,044h,011h,014h	; bd09  ..CDCDCDCDCDCDCDCDCDCDCD..
	defb 001h,002h,012h,017h,012h,017h,012h,017h,012h,017h,012h,017h,012h,017h,012h,017h,012h,017h,012h,017h,012h,017h,012h,017h,003h,001h	; bd23  ..........................
	defb 001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h	; bd3d  ..........................

; ----------------------------------------------------------------------
; DATOS colores_vivos: 5 bytes por piramide (desde 0xBD52): el color de la
;   paleta, cuantos pasos, cada cuantos cuadros y sus colores; lo leen
;   p00:5C24 (30 bytes)
;   0xbd57..0xbd75  (30 bytes)
DATA_colores_vivos:
	defb 006h,00fh,004h,075h,0bdh	; bd57
	defb 006h,008h,008h,093h,0bdh	; bd5c
	defb 002h,004h,010h,0a3h,0bdh	; bd61
	defb 005h,002h,005h,0abh,0bdh	; bd66
	defb 006h,004h,018h,0b3h,0bdh	; bd6b
	defb 006h,008h,008h,0bbh,0bdh	; bd70

; ----------------------------------------------------------------------
; DATOS vivos_1: los 15 pasos del color que cambia solo en la piramide 1; lo
;   leen p00:5C79 (30 bytes)
;   0xbd75..0xbd93  (30 bytes)
DATA_vivos_1:
	defb 000h,000h	; bd75
	defb 010h,000h	; bd77
	defb 020h,000h	; bd79
	defb 030h,000h	; bd7b
	defb 040h,000h	; bd7d
	defb 050h,000h	; bd7f
	defb 060h,000h	; bd81
	defb 070h,000h	; bd83
	defb 071h,001h	; bd85
	defb 072h,002h	; bd87
	defb 073h,003h	; bd89
	defb 074h,004h	; bd8b
	defb 075h,005h	; bd8d
	defb 076h,006h	; bd8f
	defb 077h,007h	; bd91

; ----------------------------------------------------------------------
; DATOS vivos_2: los 8 pasos del color que cambia solo en la piramide 2; lo
;   leen p00:5C79 (16 bytes)
;   0xbd93..0xbda3  (16 bytes)
DATA_vivos_2:
	defb 000h,000h	; bd93
	defb 001h,001h	; bd95
	defb 002h,002h	; bd97
	defb 003h,003h	; bd99
	defb 004h,004h	; bd9b
	defb 005h,005h	; bd9d
	defb 006h,006h	; bd9f
	defb 007h,007h	; bda1

; ----------------------------------------------------------------------
; DATOS vivos_3: los 4 pasos del color que cambia solo en la piramide 3; lo
;   leen p00:5C79 (8 bytes)
;   0xbda3..0xbdab  (8 bytes)
DATA_vivos_3:
	defb 002h,000h	; bda3
	defb 003h,000h	; bda5
	defb 004h,000h	; bda7
	defb 005h,000h	; bda9

; ----------------------------------------------------------------------
; DATOS vivos_4: los 2 pasos del color que cambia solo en la piramide 4; lo
;   leen p00:5C79 (4 bytes)
;   0xbdab..0xbdaf  (4 bytes)
DATA_vivos_4:
	defb 077h,007h	; bdab
	defb 047h,004h	; bdad

; ----------------------------------------------------------------------
; DATOS vivos_4b: los 6 pasos del otro color que cambia en la piramide 4; se
;   solapan 2 bloques: (vivos_5 BDB3-BDBB); lo leen p00:5C79 (12 bytes)
;   0xbdaf..0xbdbb  (12 bytes)
DATA_vivos_4b:
	defb 047h,004h	; bdaf
	defb 077h,007h	; bdb1
	defb 042h,001h	; bdb3
	defb 052h,001h	; bdb5
	defb 062h,001h	; bdb7
	defb 072h,001h	; bdb9

; ----------------------------------------------------------------------
; DATOS vivos_6: los 8 pasos del color que cambia solo en la piramide 6; lo
;   leen p00:5C79 (16 bytes)
;   0xbdbb..0xbdcb  (16 bytes)
DATA_vivos_6:
	defb 000h,000h	; bdbb
	defb 010h,000h	; bdbd
	defb 020h,001h	; bdbf
	defb 030h,001h	; bdc1
	defb 040h,002h	; bdc3
	defb 050h,002h	; bdc5
	defb 060h,003h	; bdc7
	defb 070h,003h	; bdc9

; ----------------------------------------------------------------------
; DATOS relleno_ff: 565 bytes a 0xFF hasta el final del banco: relleno; lo
;   leen nadie (565 bytes)
;   0xbdcb..0xc000  (565 bytes)
DATA_relleno_ff:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bdcb  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bddb  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bdeb  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bdfb  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; be0b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; be1b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; be2b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; be3b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; be4b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; be5b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; be6b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; be7b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; be8b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; be9b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; beab  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bebb  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; becb  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bedb  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; beeb  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; befb  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf0b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf1b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf2b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf3b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf4b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf5b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf6b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf7b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf8b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf9b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfab  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfbb  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfcb  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfdb  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfeb  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh	; bffb
