; ==========================================================================
; KING'S VALLEY II - Konami (1988) - MSX2 - MegaROM RC-761 de 128 KB (Konami SCC) - banco 14 (se ejecuta en 0x8000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x08000


; ----------------------------------------------------------------------
; DATOS grabados: 6 punteros, uno por piramide (0xE241, desde 0x7FFE): los
;   grabados del fondo; lo leen p00:44F8 (12 bytes)
;   0x8000..0x800c  (12 bytes)
DATA_grabados:
	defw 080e4h,08124h,08164h,081a4h,081e4h,08224h	; 8000

; ----------------------------------------------------------------------
; DATOS adornos: 48 punteros: 8 adornos por piramide ((piramide - 1) x 8 +
;   tipo); el tipo dice su tamano; lo leen p00:4647 (96 bytes)
;   0x800c..0x806c  (96 bytes)
DATA_adornos:
	defw 08264h,08274h,08284h,08284h,08284h,08284h,08284h,08284h	; 800c
	defw 08284h,08294h,08294h,08294h,08294h,08294h,08294h,0829ah	; 801c
	defw 082a0h,082a0h,082a0h,082a0h,082a0h,082a8h,082a8h,082a8h	; 802c
	defw 082a8h,082b8h,082b8h,082c0h,082c0h,082c0h,082c0h,082c6h	; 803c
	defw 082c6h,082d6h,082d6h,082d6h,082d6h,082d6h,082d6h,082d6h	; 804c
	defw 082d6h,082e6h,082e6h,082eeh,082eeh,082eeh,082eeh,082eeh	; 805c

; ----------------------------------------------------------------------
; DATOS adornos_fases: 60 punteros, uno por fase (0xE242, desde 0x806A): los
;   adornos de cada pantalla; lo leen p00:4611 (120 bytes)
;   0x806c..0x80e4  (120 bytes)
DATA_adornos_fases:
	defw 082eeh,082f5h,082fch,08309h,08313h,08320h,0832dh,08334h	; 806c
	defw 0833bh,0833ch,08349h,0834ah,08354h,08364h,0836eh,08384h	; 807c
	defw 08385h,083a1h,083b1h,083b8h,083cbh,083cfh,083d9h,083dah	; 808c
	defw 083f3h,083f7h,08401h,0840bh,08412h,08419h,0841ah,08427h	; 809c
	defw 08437h,08453h,08463h,0848eh,08495h,084aeh,084afh,084b9h	; 80ac
	defw 084cch,084cdh,084d1h,084e4h,084eeh,084efh,084f6h,084f7h	; 80bc
	defw 084feh,0850bh,0850ch,08516h,08517h,08539h,0853ah,0854dh	; 80cc
	defw 0854eh,08567h,08568h,0858ah	; 80dc  -> DATA_adornos_fase_57 DATA_adornos_fase_58 DATA_adornos_fase_59 DATA_adornos_fase_60

; ----------------------------------------------------------------------
; DATOS grabado_1: los grabados de la piramide 1: dos de 4 x 8 caracteres
;   (fases impares y pares); lo leen p00:4515 (64 bytes)
;   0x80e4..0x8124  (64 bytes)
DATA_grabado_1:
	defb 037h,037h,026h,027h,028h,029h,036h,036h	; 80e4  77&'()66
	defb 039h,037h,02ah,02bh,02ch,02dh,036h,038h	; 80ec  97*+,-68
	defb 03bh,037h,02eh,02fh,030h,031h,036h,03ah	; 80f4  .7./016:
	defb 037h,037h,032h,033h,034h,035h,036h,036h	; 80fc  77234566
	defb 028h,029h,018h,019h,01ah,018h,026h,027h	; 8104  ()....&'
	defb 02ch,02dh,01bh,01ch,01dh,01eh,02ah,02bh	; 810c  ,-....*+
	defb 030h,031h,01fh,020h,021h,022h,02eh,02fh	; 8114  01. !"./
	defb 034h,035h,023h,024h,025h,023h,032h,033h	; 811c  45#$%#23

; ----------------------------------------------------------------------
; DATOS grabado_2: los grabados de la piramide 2: dos de 4 x 8 caracteres
;   (fases impares y pares); lo leen p00:4515 (64 bytes)
;   0x8124..0x8164  (64 bytes)
DATA_grabado_2:
	defb 038h,018h,039h,03ah,038h,018h,043h,044h	; 8124  8.9:8.CD
	defb 03bh,03ch,03dh,03eh,01ah,043h,045h,046h	; 812c  .<=>.CEF
	defb 03ch,03dh,03fh,040h,047h,045h,046h,01bh	; 8134  <=?@GEF.
	defb 03dh,041h,019h,042h,049h,04ah,04bh,01ch	; 813c  =A.BIJK.
	defb 04ch,01dh,04dh,03ah,04ch,01dh,04dh,03ah	; 8144  L.M:L.M:
	defb 01eh,04eh,03dh,04fh,01eh,04eh,03dh,04fh	; 814c  .N=O.N=O
	defb 04dh,03dh,051h,01fh,04dh,03dh,051h,01fh	; 8154  M=Q.M=Q.
	defb 03dh,04fh,020h,021h,03dh,04fh,020h,021h	; 815c  =O !=O !

; ----------------------------------------------------------------------
; DATOS grabado_3: los grabados de la piramide 3: dos de 4 x 8 caracteres
;   (fases impares y pares); lo leen p00:4515 (64 bytes)
;   0x8164..0x81a4  (64 bytes)
DATA_grabado_3:
	defb 020h,021h,022h,023h,024h,025h,026h,027h	; 8164   !"#$%&'
	defb 028h,029h,02ah,02bh,02ch,02dh,02eh,02fh	; 816c  ()*+,-./
	defb 030h,031h,032h,033h,034h,030h,035h,032h	; 8174  01234052
	defb 036h,037h,038h,039h,03ah,036h,03bh,03ch	; 817c  6789:6.<
	defb 03dh,03eh,03fh,040h,041h,03dh,03eh,03fh	; 8184  =>?@A=>?
	defb 042h,043h,044h,045h,02ch,02dh,043h,044h	; 818c  BCDE,-CD
	defb 030h,031h,047h,048h,049h,046h,035h,047h	; 8194  01GHIF5G
	defb 04ah,037h,04bh,04ch,04dh,036h,037h,04bh	; 819c  J7KLM67K

; ----------------------------------------------------------------------
; DATOS grabado_4: los grabados de la piramide 4: dos de 4 x 8 caracteres
;   (fases impares y pares); lo leen p00:4515 (64 bytes)
;   0x81a4..0x81e4  (64 bytes)
DATA_grabado_4:
	defb 018h,019h,01ah,01bh,01ch,01dh,01eh,01fh	; 81a4  ........
	defb 020h,021h,022h,023h,024h,025h,026h,027h	; 81ac   !"#$%&'
	defb 028h,029h,02ah,02bh,02ch,02dh,02eh,02fh	; 81b4  ()*+,-./
	defb 030h,031h,032h,033h,034h,035h,036h,037h	; 81bc  01234567
	defb 018h,019h,01ah,01bh,01ch,01dh,01eh,01fh	; 81c4  ........
	defb 020h,021h,022h,023h,024h,025h,026h,027h	; 81cc   !"#$%&'
	defb 02eh,02fh,028h,029h,02ah,02bh,02ch,02dh	; 81d4  ./()*+,-
	defb 036h,037h,030h,031h,032h,033h,034h,035h	; 81dc  67012345

; ----------------------------------------------------------------------
; DATOS grabado_5: los grabados de la piramide 5: dos de 4 x 8 caracteres
;   (fases impares y pares); lo leen p00:4515 (64 bytes)
;   0x81e4..0x8224  (64 bytes)
DATA_grabado_5:
	defb 018h,043h,044h,019h,01ah,01bh,01ch,01dh	; 81e4  .CD.....
	defb 01eh,01fh,020h,021h,022h,023h,024h,025h	; 81ec  .. !"#$%
	defb 026h,027h,028h,029h,02ah,02bh,02ch,02dh	; 81f4  &'()*+,-
	defb 02eh,02fh,030h,031h,032h,045h,046h,033h	; 81fc  ./012EF3
	defb 034h,035h,018h,043h,044h,019h,036h,037h	; 8204  45.CD.67
	defb 037h,038h,039h,01fh,020h,03ah,03bh,038h	; 820c  789. :.8
	defb 038h,03ch,03dh,027h,028h,03eh,03fh,037h	; 8214  8<='(>?7
	defb 037h,038h,040h,041h,030h,042h,037h,038h	; 821c  78@A0B78

; ----------------------------------------------------------------------
; DATOS grabado_6: los grabados de la piramide 6: dos de 4 x 8 caracteres
;   (fases impares y pares); lo leen p00:4515 (64 bytes)
;   0x8224..0x8264  (64 bytes)
DATA_grabado_6:
	defb 018h,019h,01ah,01bh,01ch,01dh,01eh,01fh	; 8224  ........
	defb 020h,021h,022h,023h,024h,025h,026h,027h	; 822c   !"#$%&'
	defb 028h,029h,02ah,02bh,02ch,02dh,02eh,02fh	; 8234  ()*+,-./
	defb 030h,031h,032h,033h,034h,035h,036h,037h	; 823c  01234567
	defb 038h,039h,03ah,03bh,044h,048h,048h,045h	; 8244  89:.DHHE
	defb 040h,04dh,04ch,041h,049h,04ah,04bh,049h	; 824c  @MLAIJKI
	defb 042h,04eh,04ah,043h,049h,04ch,04dh,049h	; 8254  BNJCILMI
	defb 03ch,03dh,03eh,03fh,046h,048h,048h,047h	; 825c  <=>?FHHG

; ----------------------------------------------------------------------
; DATOS adorno_1_0: los caracteres del adorno 0 de la piramide 1 (4 x 4); lo
;   leen p00:4663 (16 bytes)
;   0x8264..0x8274  (16 bytes)
DATA_adorno_1_0:
	defb 03ch,03dh,03eh,03fh,040h,041h,042h,043h,044h,045h,046h,047h,048h,049h,04ah,04bh	; 8264  <=>?@ABCDEFGHIJK

; ----------------------------------------------------------------------
; DATOS adorno_1_1: los caracteres del adorno 1 de la piramide 1 (4 x 4); lo
;   leen p00:4663 (16 bytes)
;   0x8274..0x8284  (16 bytes)
DATA_adorno_1_1:
	defb 03ch,03dh,03eh,03fh,040h,04ch,04dh,043h,044h,04eh,04fh,050h,048h,051h,052h,04bh	; 8274  <=>?@LMCDNOPHQRK

; ----------------------------------------------------------------------
; DATOS adorno_1_6: los caracteres del adorno 6 de la piramide 1 (largo:
;   principio, medio y final); se solapan 7 bloques: (adorno_1_7 8284-828A)
;   (adorno_1_2 8284-828C) (adorno_1_3 8284-828C) (adorno_1_4 8284-828C)
;   (adorno_1_5 8284-828C) (adorno_2_0 8284-8294); lo leen p00:4663 (16 bytes)
;   0x8284..0x8294  (16 bytes)
DATA_adorno_1_6:
	defb 022h,023h,024h,025h,026h,027h	; 8284
	defb 028h,029h,02ah,02bh,02ch,02dh	; 828a
	defb 02eh,02fh,030h,031h	; 8290

; ----------------------------------------------------------------------
; DATOS adorno_2_6: los caracteres del adorno 6 de la piramide 2 (largo:
;   principio, medio y final); se solapan 16 bloques: (adorno_2_2 8294-829C)
;   (adorno_2_3 8294-829C) (adorno_2_4 8294-829C) (adorno_2_5 8294-829C)
;   (adorno_2_1 8294-82A4) (adorno_2_7 829A-82A0) (adorno_3_2 82A0-82A8)
;   (adorno_3_3 82A0-82A8) (adorno_3_4 82A0-82A8) (adorno_3_0 82A0-82B0)
;   (adorno_3_1 82A0-82B0) (adorno_3_6 82A8-82AE) (adorno_3_7 82A8-82AE)
;   (adorno_3_5 82A8-82B0) (adorno_4_0 82A8-82B8); lo leen p00:4663 (36 bytes)
;   0x8294..0x82b8  (36 bytes)
DATA_adorno_2_6:
	defb 032h,033h,036h,037h,034h,035h	; 8294
	defb 032h,033h,048h,050h,034h,035h	; 829a
	defb 018h,019h,01ah,01bh,01ch,01dh	; 82a0
	defb 01eh,01fh,038h,043h,039h,03ah	; 82a6
	defb 03eh,03bh,044h,03fh,03dh,040h	; 82ac
	defb 041h,042h,045h,03ch,046h,047h	; 82b2

; ----------------------------------------------------------------------
; DATOS adorno_4_2: los caracteres del adorno 2 de la piramide 4 (4 x 2); se
;   solapan 8 bloques: (adorno_4_1 82B8-82C8) (adorno_4_6 82C0-82C6)
;   (adorno_4_3 82C0-82C8) (adorno_4_4 82C0-82C8) (adorno_4_5 82C0-82C8)
;   (adorno_4_7 82C6-82CC) (adorno_5_0 82C6-82D6); lo leen p00:4663 (30 bytes)
;   0x82b8..0x82d6  (30 bytes)
DATA_adorno_4_2:
	defb 043h,039h,03bh,044h,048h,049h,03ch,046h	; 82b8  C9.DHI<F
	defb 04ah,04bh,04ah,04bh,04ah,04bh,047h,048h	; 82c0  JKJKJKGH
	defb 049h,04ah,04bh,04ch,04dh,04eh,04fh,050h	; 82c8  IJKLMNOP
	defb 051h,052h,053h,054h,055h,056h	; 82d0

; ----------------------------------------------------------------------
; DATOS adorno_5_6: los caracteres del adorno 6 de la piramide 5 (largo:
;   principio, medio y final); se solapan 8 bloques: (adorno_5_7 82D6-82DC)
;   (adorno_5_2 82D6-82DE) (adorno_5_3 82D6-82DE) (adorno_5_4 82D6-82DE)
;   (adorno_5_5 82D6-82DE) (adorno_5_1 82D6-82E6) (adorno_6_0 82D6-82E6); lo
;   leen p00:4663 (16 bytes)
;   0x82d6..0x82e6  (16 bytes)
DATA_adorno_5_6:
	defb 044h,050h,04ch,045h,050h,04dh	; 82d6
	defb 04fh,051h,04fh,04eh,04ah,04fh	; 82dc
	defb 046h,051h,04dh,047h	; 82e2

; ----------------------------------------------------------------------
; DATOS adorno_6_2: los caracteres del adorno 2 de la piramide 6 (4 x 2); se
;   solapan 9 bloques: (adorno_6_1 82E6-82F6) (adorno_6_6 82EE-82F4)
;   (adorno_6_7 82EE-82F4) (adornos_fase_1 82EE-82F5) (adorno_6_3 82EE-82F6)
;   (adorno_6_4 82EE-82F6) (adorno_6_5 82EE-82F6) (adornos_fase_2 82F5-82FC);
;   lo leen p00:4663, p00:4614 (22 bytes)
;   0x82e6..0x82fc  (22 bytes)
DATA_adorno_6_2:
	defb 049h,042h,052h,053h,054h,055h,049h,040h	; 82e6  IBRSTUI@
	defb 090h,030h,000h,091h,0b0h,000h,0ffh,091h	; 82ee  .0......
	defb 040h,000h,091h,0a0h,000h,0ffh	; 82f6

; ----------------------------------------------------------------------
; DATOS adornos_fase_3: los adornos de la fase 3: fichas de 3 bytes [x |
;   tipo][y | pantalla][largo], 0xFF acaba; lo leen p00:4614 (13 bytes)
;   0x82fc..0x8309  (13 bytes)
DATA_adornos_fase_3:
	defb 010h,030h,000h	; 82fc
	defb 010h,0b0h,000h	; 82ff
	defb 011h,031h,000h	; 8302
	defb 011h,0b1h,000h	; 8305
	defb 0ffh	; 8308

; ----------------------------------------------------------------------
; DATOS adornos_fase_4: los adornos de la fase 4: fichas de 3 bytes [x |
;   tipo][y | pantalla][largo], 0xFF acaba; lo leen p00:4614 (10 bytes)
;   0x8309..0x8313  (10 bytes)
DATA_adornos_fase_4:
	defb 011h,070h,000h	; 8309
	defb 050h,020h,000h	; 830c
	defb 050h,0c0h,000h	; 830f
	defb 0ffh	; 8312

; ----------------------------------------------------------------------
; DATOS adornos_fase_5: los adornos de la fase 5: fichas de 3 bytes [x |
;   tipo][y | pantalla][largo], 0xFF acaba; lo leen p00:4614 (13 bytes)
;   0x8313..0x8320  (13 bytes)
DATA_adornos_fase_5:
	defb 021h,0d0h,000h	; 8313
	defb 091h,020h,000h	; 8316
	defb 020h,011h,000h	; 8319
	defb 090h,0c1h,000h	; 831c
	defb 0ffh	; 831f

; ----------------------------------------------------------------------
; DATOS adornos_fase_6: los adornos de la fase 6: fichas de 3 bytes [x |
;   tipo][y | pantalla][largo], 0xFF acaba; lo leen p00:4614 (13 bytes)
;   0x8320..0x832d  (13 bytes)
DATA_adornos_fase_6:
	defb 031h,040h,000h	; 8320
	defb 030h,0a0h,000h	; 8323
	defb 091h,041h,000h	; 8326
	defb 090h,0a1h,000h	; 8329
	defb 0ffh	; 832c

; ----------------------------------------------------------------------
; DATOS adornos_fase_7: los adornos de la fase 7: fichas de 3 bytes [x |
;   tipo][y | pantalla][largo], 0xFF acaba; lo leen p00:4614 (7 bytes)
;   0x832d..0x8334  (7 bytes)
DATA_adornos_fase_7:
	defb 010h,040h,000h	; 832d
	defb 011h,0a0h,000h	; 8330
	defb 0ffh	; 8333

; ----------------------------------------------------------------------
; DATOS adornos_fase_8: los adornos de la fase 8: fichas de 3 bytes [x |
;   tipo][y | pantalla][largo], 0xFF acaba; lo leen p00:4614 (7 bytes)
;   0x8334..0x833b  (7 bytes)
DATA_adornos_fase_8:
	defb 031h,042h,000h	; 8334
	defb 030h,08ah,000h	; 8337
	defb 0ffh	; 833a

; ----------------------------------------------------------------------
; DATOS adornos_fase_9: los adornos de la fase 9: fichas de 3 bytes [x |
;   tipo][y | pantalla][largo], 0xFF acaba; lo leen p00:4614 (1 bytes)
;   0x833b..0x833c  (1 bytes)
DATA_adornos_fase_9:
	defb 0ffh	; 833b

; ----------------------------------------------------------------------
; DATOS adornos_fase_10: los adornos de la fase 10: fichas de 3 bytes [x |
;   tipo][y | pantalla][largo], 0xFF acaba; lo leen p00:4614 (13 bytes)
;   0x833c..0x8349  (13 bytes)
DATA_adornos_fase_10:
	defb 009h,050h,000h	; 833c
	defb 009h,0b0h,000h	; 833f
	defb 008h,031h,000h	; 8342
	defb 008h,091h,000h	; 8345
	defb 0ffh	; 8348

; ----------------------------------------------------------------------
; DATOS adornos_fase_11: los adornos de la fase 11: fichas de 3 bytes [x |
;   tipo][y | pantalla][largo], 0xFF acaba; lo leen p00:4614 (1 bytes)
;   0x8349..0x834a  (1 bytes)
DATA_adornos_fase_11:
	defb 0ffh	; 8349

; ----------------------------------------------------------------------
; DATOS adornos_fase_12: los adornos de la fase 12: fichas de 3 bytes [x |
;   tipo][y | pantalla][largo], 0xFF acaba; lo leen p00:4614 (10 bytes)
;   0x834a..0x8354  (10 bytes)
DATA_adornos_fase_12:
	defb 067h,040h,004h	; 834a
	defb 027h,0d0h,004h	; 834d
	defb 050h,051h,000h	; 8350
	defb 0ffh	; 8353

; ----------------------------------------------------------------------
; DATOS adornos_fase_13: los adornos de la fase 13: fichas de 3 bytes [x |
;   tipo][y | pantalla][largo], 0xFF acaba; lo leen p00:4614 (16 bytes)
;   0x8354..0x8364  (16 bytes)
DATA_adornos_fase_13:
	defb 050h,048h,000h	; 8354
	defb 076h,030h,006h	; 8357
	defb 048h,061h,000h	; 835a
	defb 046h,05ah,003h	; 835d
	defb 06eh,09ah,004h	; 8360
	defb 0ffh	; 8363

; ----------------------------------------------------------------------
; DATOS adornos_fase_14: los adornos de la fase 14: fichas de 3 bytes [x |
;   tipo][y | pantalla][largo], 0xFF acaba; lo leen p00:4614 (10 bytes)
;   0x8364..0x836e  (10 bytes)
DATA_adornos_fase_14:
	defb 017h,041h,004h	; 8364
	defb 017h,0b1h,004h	; 8367
	defb 09eh,079h,004h	; 836a
	defb 0ffh	; 836d

; ----------------------------------------------------------------------
; DATOS adornos_fase_15: los adornos de la fase 15: fichas de 3 bytes [x |
;   tipo][y | pantalla][largo], 0xFF acaba; lo leen p00:4614 (22 bytes)
;   0x836e..0x8384  (22 bytes)
DATA_adornos_fase_15:
	defb 00fh,020h,004h	; 836e
	defb 00eh,0c0h,004h	; 8371
	defb 00fh,041h,004h	; 8374
	defb 00fh,0b1h,004h	; 8377
	defb 00eh,022h,004h	; 837a
	defb 008h,072h,000h	; 837d
	defb 00eh,0d2h,004h	; 8380
	defb 0ffh	; 8383

; ----------------------------------------------------------------------
; DATOS adornos_fase_16: los adornos de la fase 16: fichas de 3 bytes [x |
;   tipo][y | pantalla][largo], 0xFF acaba; lo leen p00:4614 (1 bytes)
;   0x8384..0x8385  (1 bytes)
DATA_adornos_fase_16:
	defb 0ffh	; 8384

; ----------------------------------------------------------------------
; DATOS adornos_fase_17: los adornos de la fase 17: fichas de 3 bytes [x |
;   tipo][y | pantalla][largo], 0xFF acaba; lo leen p00:4614 (28 bytes)
;   0x8385..0x83a1  (28 bytes)
DATA_adornos_fase_17:
	defb 00fh,010h,004h	; 8385
	defb 010h,038h,000h	; 8388
	defb 00fh,070h,004h	; 838b
	defb 038h,051h,000h	; 838e
	defb 038h,091h,000h	; 8391
	defb 09eh,031h,004h	; 8394
	defb 09fh,0c1h,004h	; 8397
	defb 00eh,0d2h,004h	; 839a
	defb 09fh,052h,004h	; 839d
	defb 0ffh	; 83a0

; ----------------------------------------------------------------------
; DATOS adornos_fase_18: los adornos de la fase 18: fichas de 3 bytes [x |
;   tipo][y | pantalla][largo], 0xFF acaba; lo leen p00:4614 (16 bytes)
;   0x83a1..0x83b1  (16 bytes)
DATA_adornos_fase_18:
	defb 08eh,088h,006h	; 83a1
	defb 0a7h,041h,003h	; 83a4
	defb 0a6h,0b1h,003h	; 83a7
	defb 010h,0d2h,000h	; 83aa
	defb 070h,012h,000h	; 83ad
	defb 0ffh	; 83b0

; ----------------------------------------------------------------------
; DATOS adornos_fase_19: los adornos de la fase 19: fichas de 3 bytes [x |
;   tipo][y | pantalla][largo], 0xFF acaba; lo leen p00:4614 (7 bytes)
;   0x83b1..0x83b8  (7 bytes)
DATA_adornos_fase_19:
	defb 016h,038h,004h	; 83b1
	defb 016h,0c8h,004h	; 83b4
	defb 0ffh	; 83b7

; ----------------------------------------------------------------------
; DATOS adornos_fase_20: los adornos de la fase 20: fichas de 3 bytes [x |
;   tipo][y | pantalla][largo], 0xFF acaba; lo leen p00:4614 (19 bytes)
;   0x83b8..0x83cb  (19 bytes)
DATA_adornos_fase_20:
	defb 00fh,078h,005h	; 83b8
	defb 086h,060h,004h	; 83bb
	defb 086h,090h,004h	; 83be
	defb 000h,071h,000h	; 83c1
	defb 087h,041h,003h	; 83c4
	defb 087h,0b1h,003h	; 83c7
	defb 0ffh	; 83ca

; ----------------------------------------------------------------------
; DATOS adornos_fase_21: los adornos de la fase 21: fichas de 3 bytes [x |
;   tipo][y | pantalla][largo], 0xFF acaba; lo leen p00:4614 (4 bytes)
;   0x83cb..0x83cf  (4 bytes)
DATA_adornos_fase_21:
	defb 014h,038h,000h	; 83cb
	defb 0ffh	; 83ce

; ----------------------------------------------------------------------
; DATOS adornos_fase_22: los adornos de la fase 22: fichas de 3 bytes [x |
;   tipo][y | pantalla][largo], 0xFF acaba; lo leen p00:4614 (10 bytes)
;   0x83cf..0x83d9  (10 bytes)
DATA_adornos_fase_22:
	defb 034h,0b8h,000h	; 83cf
	defb 06ch,091h,000h	; 83d2
	defb 09ch,0aah,000h	; 83d5
	defb 0ffh	; 83d8

; ----------------------------------------------------------------------
; DATOS adornos_fase_23: los adornos de la fase 23: fichas de 3 bytes [x |
;   tipo][y | pantalla][largo], 0xFF acaba; lo leen p00:4614 (1 bytes)
;   0x83d9..0x83da  (1 bytes)
DATA_adornos_fase_23:
	defb 0ffh	; 83d9

; ----------------------------------------------------------------------
; DATOS adornos_fase_24: los adornos de la fase 24: fichas de 3 bytes [x |
;   tipo][y | pantalla][largo], 0xFF acaba; lo leen p00:4614 (25 bytes)
;   0x83da..0x83f3  (25 bytes)
DATA_adornos_fase_24:
	defb 07ch,038h,000h	; 83da
	defb 09ch,0d0h,000h	; 83dd
	defb 04ch,029h,000h	; 83e0
	defb 07ch,071h,000h	; 83e3
	defb 08ch,03ah,000h	; 83e6
	defb 08ch,0bah,000h	; 83e9
	defb 054h,02bh,000h	; 83ec
	defb 054h,0b3h,000h	; 83ef
	defb 0ffh	; 83f2

; ----------------------------------------------------------------------
; DATOS adornos_fase_25: los adornos de la fase 25: fichas de 3 bytes [x |
;   tipo][y | pantalla][largo], 0xFF acaba; lo leen p00:4614 (4 bytes)
;   0x83f3..0x83f7  (4 bytes)
DATA_adornos_fase_25:
	defb 02ch,028h,000h	; 83f3
	defb 0ffh	; 83f6

; ----------------------------------------------------------------------
; DATOS adornos_fase_26: los adornos de la fase 26: fichas de 3 bytes [x |
;   tipo][y | pantalla][largo], 0xFF acaba; lo leen p00:4614 (10 bytes)
;   0x83f7..0x8401  (10 bytes)
DATA_adornos_fase_26:
	defb 014h,078h,000h	; 83f7
	defb 014h,071h,000h	; 83fa
	defb 014h,072h,000h	; 83fd
	defb 0ffh	; 8400

; ----------------------------------------------------------------------
; DATOS adornos_fase_27: los adornos de la fase 27: fichas de 3 bytes [x |
;   tipo][y | pantalla][largo], 0xFF acaba; lo leen p00:4614 (10 bytes)
;   0x8401..0x840b  (10 bytes)
DATA_adornos_fase_27:
	defb 014h,050h,000h	; 8401
	defb 04ch,091h,000h	; 8404
	defb 084h,072h,000h	; 8407
	defb 0ffh	; 840a

; ----------------------------------------------------------------------
; DATOS adornos_fase_28: los adornos de la fase 28: fichas de 3 bytes [x |
;   tipo][y | pantalla][largo], 0xFF acaba; lo leen p00:4614 (7 bytes)
;   0x840b..0x8412  (7 bytes)
DATA_adornos_fase_28:
	defb 01ch,068h,000h	; 840b
	defb 01ch,0a2h,000h	; 840e
	defb 0ffh	; 8411

; ----------------------------------------------------------------------
; DATOS adornos_fase_29: los adornos de la fase 29: fichas de 3 bytes [x |
;   tipo][y | pantalla][largo], 0xFF acaba; lo leen p00:4614 (7 bytes)
;   0x8412..0x8419  (7 bytes)
DATA_adornos_fase_29:
	defb 08ch,018h,000h	; 8412
	defb 064h,0b8h,000h	; 8415
	defb 0ffh	; 8418

; ----------------------------------------------------------------------
; DATOS adornos_fase_30: los adornos de la fase 30: fichas de 3 bytes [x |
;   tipo][y | pantalla][largo], 0xFF acaba; lo leen p00:4614 (1 bytes)
;   0x8419..0x841a  (1 bytes)
DATA_adornos_fase_30:
	defb 0ffh	; 8419

; ----------------------------------------------------------------------
; DATOS adornos_fase_31: los adornos de la fase 31: fichas de 3 bytes [x |
;   tipo][y | pantalla][largo], 0xFF acaba; lo leen p00:4614 (13 bytes)
;   0x841a..0x8427  (13 bytes)
DATA_adornos_fase_31:
	defb 002h,018h,000h	; 841a
	defb 002h,058h,000h	; 841d
	defb 002h,098h,000h	; 8420
	defb 002h,0d8h,000h	; 8423
	defb 0ffh	; 8426

; ----------------------------------------------------------------------
; DATOS adornos_fase_32: los adornos de la fase 32: fichas de 3 bytes [x |
;   tipo][y | pantalla][largo], 0xFF acaba; lo leen p00:4614 (16 bytes)
;   0x8427..0x8437  (16 bytes)
DATA_adornos_fase_32:
	defb 01eh,0d8h,007h	; 8427
	defb 03eh,018h,007h	; 842a
	defb 03eh,060h,003h	; 842d
	defb 03eh,090h,003h	; 8430
	defb 008h,072h,000h	; 8433
	defb 0ffh	; 8436

; ----------------------------------------------------------------------
; DATOS adornos_fase_33: los adornos de la fase 33: fichas de 3 bytes [x |
;   tipo][y | pantalla][largo], 0xFF acaba; lo leen p00:4614 (28 bytes)
;   0x8437..0x8453  (28 bytes)
DATA_adornos_fase_33:
	defb 00eh,010h,006h	; 8437
	defb 03eh,068h,006h	; 843a
	defb 06eh,0e0h,006h	; 843d
	defb 0a6h,068h,003h	; 8440
	defb 0a6h,0e0h,003h	; 8443
	defb 070h,071h,000h	; 8446
	defb 00ah,012h,000h	; 8449
	defb 00ah,0e2h,000h	; 844c
	defb 010h,072h,000h	; 844f
	defb 0ffh	; 8452

; ----------------------------------------------------------------------
; DATOS adornos_fase_34: los adornos de la fase 34: fichas de 3 bytes [x |
;   tipo][y | pantalla][largo], 0xFF acaba; lo leen p00:4614 (16 bytes)
;   0x8453..0x8463  (16 bytes)
DATA_adornos_fase_34:
	defb 050h,0d0h,000h	; 8453
	defb 00eh,039h,003h	; 8456
	defb 00eh,0b9h,003h	; 8459
	defb 0a6h,062h,003h	; 845c
	defb 0a6h,092h,003h	; 845f
	defb 0ffh	; 8462

; ----------------------------------------------------------------------
; DATOS adornos_fase_35: los adornos de la fase 35: fichas de 3 bytes [x |
;   tipo][y | pantalla][largo], 0xFF acaba; lo leen p00:4614 (43 bytes)
;   0x8463..0x848e  (43 bytes)
DATA_adornos_fase_35:
	defb 012h,038h,000h	; 8463
	defb 010h,070h,000h	; 8466
	defb 012h,0b8h,000h	; 8469
	defb 00ah,059h,000h	; 846c
	defb 00ah,099h,000h	; 846f
	defb 06eh,02ah,004h	; 8472
	defb 06eh,0cah,004h	; 8475
	defb 09eh,02ah,004h	; 8478
	defb 09eh,0cah,004h	; 847b
	defb 00eh,033h,004h	; 847e
	defb 00ah,07bh,000h	; 8481
	defb 00eh,0c3h,004h	; 8484
	defb 050h,073h,000h	; 8487
	defb 09ah,07bh,000h	; 848a
	defb 0ffh	; 848d

; ----------------------------------------------------------------------
; DATOS adornos_fase_36: los adornos de la fase 36: fichas de 3 bytes [x |
;   tipo][y | pantalla][largo], 0xFF acaba; lo leen p00:4614 (7 bytes)
;   0x848e..0x8495  (7 bytes)
DATA_adornos_fase_36:
	defb 010h,052h,000h	; 848e
	defb 010h,092h,000h	; 8491
	defb 0ffh	; 8494

; ----------------------------------------------------------------------
; DATOS adornos_fase_37: los adornos de la fase 37: fichas de 3 bytes [x |
;   tipo][y | pantalla][largo], 0xFF acaba; lo leen p00:4614 (25 bytes)
;   0x8495..0x84ae  (25 bytes)
DATA_adornos_fase_37:
	defb 016h,060h,004h	; 8495
	defb 016h,090h,004h	; 8498
	defb 096h,060h,004h	; 849b
	defb 096h,090h,004h	; 849e
	defb 016h,062h,004h	; 84a1
	defb 016h,092h,004h	; 84a4
	defb 096h,062h,004h	; 84a7
	defb 096h,092h,004h	; 84aa
	defb 0ffh	; 84ad

; ----------------------------------------------------------------------
; DATOS adornos_fase_38: los adornos de la fase 38: fichas de 3 bytes [x |
;   tipo][y | pantalla][largo], 0xFF acaba; lo leen p00:4614 (1 bytes)
;   0x84ae..0x84af  (1 bytes)
DATA_adornos_fase_38:
	defb 0ffh	; 84ae

; ----------------------------------------------------------------------
; DATOS adornos_fase_39: los adornos de la fase 39: fichas de 3 bytes [x |
;   tipo][y | pantalla][largo], 0xFF acaba; lo leen p00:4614 (10 bytes)
;   0x84af..0x84b9  (10 bytes)
DATA_adornos_fase_39:
	defb 042h,090h,000h	; 84af
	defb 062h,060h,000h	; 84b2
	defb 082h,090h,000h	; 84b5
	defb 0ffh	; 84b8

; ----------------------------------------------------------------------
; DATOS adornos_fase_40: los adornos de la fase 40: fichas de 3 bytes [x |
;   tipo][y | pantalla][largo], 0xFF acaba; lo leen p00:4614 (19 bytes)
;   0x84b9..0x84cc  (19 bytes)
DATA_adornos_fase_40:
	defb 022h,040h,000h	; 84b9
	defb 020h,060h,000h	; 84bc
	defb 022h,090h,000h	; 84bf
	defb 022h,061h,000h	; 84c2
	defb 020h,081h,000h	; 84c5
	defb 022h,0b1h,000h	; 84c8
	defb 0ffh	; 84cb

; ----------------------------------------------------------------------
; DATOS adornos_fase_41: los adornos de la fase 41: fichas de 3 bytes [x |
;   tipo][y | pantalla][largo], 0xFF acaba; lo leen p00:4614 (1 bytes)
;   0x84cc..0x84cd  (1 bytes)
DATA_adornos_fase_41:
	defb 0ffh	; 84cc

; ----------------------------------------------------------------------
; DATOS adornos_fase_42: los adornos de la fase 42: fichas de 3 bytes [x |
;   tipo][y | pantalla][largo], 0xFF acaba; lo leen p00:4614 (4 bytes)
;   0x84cd..0x84d1  (4 bytes)
DATA_adornos_fase_42:
	defb 038h,071h,000h	; 84cd
	defb 0ffh	; 84d0

; ----------------------------------------------------------------------
; DATOS adornos_fase_43: los adornos de la fase 43: fichas de 3 bytes [x |
;   tipo][y | pantalla][largo], 0xFF acaba; lo leen p00:4614 (19 bytes)
;   0x84d1..0x84e4  (19 bytes)
DATA_adornos_fase_43:
	defb 020h,020h,000h	; 84d1
	defb 020h,0c0h,000h	; 84d4
	defb 018h,011h,000h	; 84d7
	defb 018h,071h,000h	; 84da
	defb 018h,0d1h,000h	; 84dd
	defb 010h,072h,000h	; 84e0
	defb 0ffh	; 84e3

; ----------------------------------------------------------------------
; DATOS adornos_fase_44: los adornos de la fase 44: fichas de 3 bytes [x |
;   tipo][y | pantalla][largo], 0xFF acaba; lo leen p00:4614 (10 bytes)
;   0x84e4..0x84ee  (10 bytes)
DATA_adornos_fase_44:
	defb 038h,073h,000h	; 84e4
	defb 030h,04dh,000h	; 84e7
	defb 030h,09dh,000h	; 84ea
	defb 0ffh	; 84ed

; ----------------------------------------------------------------------
; DATOS adornos_fase_45: los adornos de la fase 45: fichas de 3 bytes [x |
;   tipo][y | pantalla][largo], 0xFF acaba; lo leen p00:4614 (1 bytes)
;   0x84ee..0x84ef  (1 bytes)
DATA_adornos_fase_45:
	defb 0ffh	; 84ee

; ----------------------------------------------------------------------
; DATOS adornos_fase_46: los adornos de la fase 46: fichas de 3 bytes [x |
;   tipo][y | pantalla][largo], 0xFF acaba; lo leen p00:4614 (7 bytes)
;   0x84ef..0x84f6  (7 bytes)
DATA_adornos_fase_46:
	defb 008h,020h,000h	; 84ef
	defb 008h,0c0h,000h	; 84f2
	defb 0ffh	; 84f5

; ----------------------------------------------------------------------
; DATOS adornos_fase_47: los adornos de la fase 47: fichas de 3 bytes [x |
;   tipo][y | pantalla][largo], 0xFF acaba; lo leen p00:4614 (1 bytes)
;   0x84f6..0x84f7  (1 bytes)
DATA_adornos_fase_47:
	defb 0ffh	; 84f6

; ----------------------------------------------------------------------
; DATOS adornos_fase_48: los adornos de la fase 48: fichas de 3 bytes [x |
;   tipo][y | pantalla][largo], 0xFF acaba; lo leen p00:4614 (7 bytes)
;   0x84f7..0x84fe  (7 bytes)
DATA_adornos_fase_48:
	defb 050h,071h,000h	; 84f7
	defb 018h,072h,000h	; 84fa
	defb 0ffh	; 84fd

; ----------------------------------------------------------------------
; DATOS adornos_fase_49: los adornos de la fase 49: fichas de 3 bytes [x |
;   tipo][y | pantalla][largo], 0xFF acaba; lo leen p00:4614 (13 bytes)
;   0x84fe..0x850b  (13 bytes)
DATA_adornos_fase_49:
	defb 010h,018h,000h	; 84fe
	defb 010h,0c8h,000h	; 8501
	defb 088h,018h,000h	; 8504
	defb 088h,0c8h,000h	; 8507
	defb 0ffh	; 850a

; ----------------------------------------------------------------------
; DATOS adornos_fase_50: los adornos de la fase 50: fichas de 3 bytes [x |
;   tipo][y | pantalla][largo], 0xFF acaba; lo leen p00:4614 (1 bytes)
;   0x850b..0x850c  (1 bytes)
DATA_adornos_fase_50:
	defb 0ffh	; 850b

; ----------------------------------------------------------------------
; DATOS adornos_fase_51: los adornos de la fase 51: fichas de 3 bytes [x |
;   tipo][y | pantalla][largo], 0xFF acaba; lo leen p00:4614 (10 bytes)
;   0x850c..0x8516  (10 bytes)
DATA_adornos_fase_51:
	defb 000h,040h,000h	; 850c
	defb 000h,0a0h,000h	; 850f
	defb 040h,0e0h,000h	; 8512
	defb 0ffh	; 8515

; ----------------------------------------------------------------------
; DATOS adornos_fase_52: los adornos de la fase 52: fichas de 3 bytes [x |
;   tipo][y | pantalla][largo], 0xFF acaba; lo leen p00:4614 (1 bytes)
;   0x8516..0x8517  (1 bytes)
DATA_adornos_fase_52:
	defb 0ffh	; 8516

; ----------------------------------------------------------------------
; DATOS adornos_fase_53: los adornos de la fase 53: fichas de 3 bytes [x |
;   tipo][y | pantalla][largo], 0xFF acaba; lo leen p00:4614 (34 bytes)
;   0x8517..0x8539  (34 bytes)
DATA_adornos_fase_53:
	defb 000h,040h,000h	; 8517
	defb 000h,0a0h,000h	; 851a
	defb 072h,0b8h,000h	; 851d
	defb 080h,020h,000h	; 8520
	defb 000h,021h,000h	; 8523
	defb 000h,041h,000h	; 8526
	defb 052h,0b9h,000h	; 8529
	defb 080h,0c1h,000h	; 852c
	defb 000h,022h,000h	; 852f
	defb 000h,082h,000h	; 8532
	defb 080h,0c2h,000h	; 8535
	defb 0ffh	; 8538

; ----------------------------------------------------------------------
; DATOS adornos_fase_54: los adornos de la fase 54: fichas de 3 bytes [x |
;   tipo][y | pantalla][largo], 0xFF acaba; lo leen p00:4614 (1 bytes)
;   0x8539..0x853a  (1 bytes)
DATA_adornos_fase_54:
	defb 0ffh	; 8539

; ----------------------------------------------------------------------
; DATOS adornos_fase_55: los adornos de la fase 55: fichas de 3 bytes [x |
;   tipo][y | pantalla][largo], 0xFF acaba; lo leen p00:4614 (19 bytes)
;   0x853a..0x854d  (19 bytes)
DATA_adornos_fase_55:
	defb 000h,080h,000h	; 853a
	defb 000h,0c0h,000h	; 853d
	defb 032h,0b8h,000h	; 8540
	defb 092h,0b8h,000h	; 8543
	defb 040h,001h,000h	; 8546
	defb 052h,0b9h,000h	; 8549
	defb 0ffh	; 854c

; ----------------------------------------------------------------------
; DATOS adornos_fase_56: los adornos de la fase 56: fichas de 3 bytes [x |
;   tipo][y | pantalla][largo], 0xFF acaba; lo leen p00:4614 (1 bytes)
;   0x854d..0x854e  (1 bytes)
DATA_adornos_fase_56:
	defb 0ffh	; 854d

; ----------------------------------------------------------------------
; DATOS adornos_fase_57: los adornos de la fase 57: fichas de 3 bytes [x |
;   tipo][y | pantalla][largo], 0xFF acaba; lo leen p00:4614 (25 bytes)
;   0x854e..0x8567  (25 bytes)
DATA_adornos_fase_57:
	defb 000h,020h,000h	; 854e
	defb 000h,0c0h,000h	; 8551
	defb 060h,0a0h,000h	; 8554
	defb 092h,0b8h,000h	; 8557
	defb 000h,021h,000h	; 855a
	defb 000h,0c1h,000h	; 855d
	defb 072h,039h,000h	; 8560
	defb 080h,001h,000h	; 8563
	defb 0ffh	; 8566

; ----------------------------------------------------------------------
; DATOS adornos_fase_58: los adornos de la fase 58: fichas de 3 bytes [x |
;   tipo][y | pantalla][largo], 0xFF acaba; lo leen p00:4614 (1 bytes)
;   0x8567..0x8568  (1 bytes)
DATA_adornos_fase_58:
	defb 0ffh	; 8567

; ----------------------------------------------------------------------
; DATOS adornos_fase_59: los adornos de la fase 59: fichas de 3 bytes [x |
;   tipo][y | pantalla][largo], 0xFF acaba; lo leen p00:4614 (34 bytes)
;   0x8568..0x858a  (34 bytes)
DATA_adornos_fase_59:
	defb 000h,080h,000h	; 8568
	defb 020h,040h,000h	; 856b
	defb 000h,041h,000h	; 856e
	defb 000h,0a1h,000h	; 8571
	defb 000h,022h,000h	; 8574
	defb 060h,022h,000h	; 8577
	defb 072h,0bah,000h	; 857a
	defb 000h,0a3h,000h	; 857d
	defb 040h,023h,000h	; 8580
	defb 092h,03bh,000h	; 8583
	defb 0a0h,063h,000h	; 8586
	defb 0ffh	; 8589

; ----------------------------------------------------------------------
; DATOS adornos_fase_60: los adornos de la fase 60: fichas de 3 bytes [x |
;   tipo][y | pantalla][largo], 0xFF acaba; lo leen p00:4614 (1 bytes)
;   0x858a..0x858b  (1 bytes)
DATA_adornos_fase_60:
	defb 0ffh	; 858a

; ----------------------------------------------------------------------
; DATOS posturas: 7 punteros, uno por lo que lleva el personaje (0xE287): sus
;   sprites; lo leen p00:58EE (14 bytes)
;   0x858b..0x8599  (14 bytes)
DATA_posturas:
	defw 08599h,085bah,085e3h,0860ch,08631h,08652h,08677h	; 858b

; ----------------------------------------------------------------------
; DATOS postura_0: los sprites del personaje con lo que lleva 0: fichas de 4
;   bytes (con la cifra baja del primero 0: [destino][rachas]; si no, [n |
;   destino][de]: n bloques en espejo), 0xFF acaba; lo leen p00:58F6 (33
;   bytes)
;   0x8599..0x85ba  (33 bytes)
DATA_postura_0:
	defb 000h,0e0h,0d4h,086h	; 8599
	defb 0d6h,0e0h,000h,0e0h	; 859d
	defb 080h,0e1h,05dh,087h	; 85a1
	defb 052h,0e2h,000h,0e2h	; 85a5
	defb 000h,0e3h,0d9h,08fh	; 85a9
	defb 0d6h,0e3h,000h,0e3h	; 85ad
	defb 080h,0e4h,05dh,090h	; 85b1
	defb 052h,0e5h,000h,0e5h	; 85b5
	defb 0ffh	; 85b9

; ----------------------------------------------------------------------
; DATOS postura_1: los sprites del personaje con lo que lleva 1: fichas de 4
;   bytes (con la cifra baja del primero 0: [destino][rachas]; si no, [n |
;   destino][de]: n bloques en espejo), 0xFF acaba; lo leen p00:58F6 (41
;   bytes)
;   0x85ba..0x85e3  (41 bytes)
DATA_postura_1:
	defb 000h,0e0h,0eeh,087h	; 85ba
	defb 0d6h,0e0h,000h,0e0h	; 85be
	defb 080h,0e1h,076h,088h	; 85c2
	defb 040h,0e2h,010h,095h	; 85c6
	defb 094h,0e2h,000h,0e2h	; 85ca
	defb 000h,0e3h,0d4h,090h	; 85ce
	defb 0d6h,0e3h,000h,0e3h	; 85d2
	defb 080h,0e4h,0aah,091h	; 85d6
	defb 040h,0e5h,027h,092h	; 85da
	defb 094h,0e5h,000h,0e5h	; 85de
	defb 0ffh	; 85e2

; ----------------------------------------------------------------------
; DATOS postura_2: los sprites del personaje con lo que lleva 2: fichas de 4
;   bytes (con la cifra baja del primero 0: [destino][rachas]; si no, [n |
;   destino][de]: n bloques en espejo), 0xFF acaba; lo leen p00:58F6 (41
;   bytes)
;   0x85e3..0x860c  (41 bytes)
DATA_postura_2:
	defb 000h,0e0h,011h,089h	; 85e3
	defb 0d6h,0e0h,000h,0e0h	; 85e7
	defb 080h,0e1h,0a0h,089h	; 85eb
	defb 040h,0e2h,010h,095h	; 85ef
	defb 094h,0e2h,000h,0e2h	; 85f3
	defb 000h,0e3h,0d4h,090h	; 85f7
	defb 0d6h,0e3h,000h,0e3h	; 85fb
	defb 080h,0e4h,0aah,091h	; 85ff
	defb 040h,0e5h,027h,092h	; 8603
	defb 094h,0e5h,000h,0e5h	; 8607
	defb 0ffh	; 860b

; ----------------------------------------------------------------------
; DATOS postura_3: los sprites del personaje con lo que lleva 3: fichas de 4
;   bytes (con la cifra baja del primero 0: [destino][rachas]; si no, [n |
;   destino][de]: n bloques en espejo), 0xFF acaba; lo leen p00:58F6 (37
;   bytes)
;   0x860c..0x8631  (37 bytes)
DATA_postura_3:
	defb 000h,0e0h,03fh,08ah	; 860c
	defb 0d6h,0e0h,000h,0e0h	; 8610
	defb 080h,0e1h,0fah,08ah	; 8614
	defb 094h,0e2h,000h,0e2h	; 8618
	defb 000h,0e3h,0d4h,090h	; 861c
	defb 0d6h,0e3h,000h,0e3h	; 8620
	defb 080h,0e4h,058h,091h	; 8624
	defb 000h,0e5h,054h,092h	; 8628
	defb 094h,0e5h,000h,0e5h	; 862c
	defb 0ffh	; 8630

; ----------------------------------------------------------------------
; DATOS postura_4: los sprites del personaje con lo que lleva 4: fichas de 4
;   bytes (con la cifra baja del primero 0: [destino][rachas]; si no, [n |
;   destino][de]: n bloques en espejo), 0xFF acaba; lo leen p00:58F6 (33
;   bytes)
;   0x8631..0x8652  (33 bytes)
DATA_postura_4:
	defb 000h,0e0h,008h,08dh	; 8631
	defb 0d6h,0e0h,000h,0e0h	; 8635
	defb 080h,0e1h,0c1h,08dh	; 8639
	defb 094h,0e2h,000h,0e2h	; 863d
	defb 000h,0e3h,004h,093h	; 8641
	defb 0d6h,0e3h,000h,0e3h	; 8645
	defb 080h,0e4h,088h,093h	; 8649
	defb 094h,0e5h,000h,0e5h	; 864d
	defb 0ffh	; 8651

; ----------------------------------------------------------------------
; DATOS postura_5: los sprites del personaje con lo que lleva 5: fichas de 4
;   bytes (con la cifra baja del primero 0: [destino][rachas]; si no, [n |
;   destino][de]: n bloques en espejo), 0xFF acaba; lo leen p00:58F6 (37
;   bytes)
;   0x8652..0x8677  (37 bytes)
DATA_postura_5:
	defb 000h,0e0h,0c6h,08bh	; 8652
	defb 0d6h,0e0h,000h,0e0h	; 8656
	defb 080h,0e1h,04fh,08ch	; 865a
	defb 094h,0e2h,000h,0e2h	; 865e
	defb 000h,0e3h,0d4h,090h	; 8662
	defb 0d6h,0e3h,000h,0e3h	; 8666
	defb 080h,0e4h,058h,091h	; 866a
	defb 000h,0e5h,0adh,092h	; 866e
	defb 094h,0e5h,000h,0e5h	; 8672
	defb 0ffh	; 8676

; ----------------------------------------------------------------------
; DATOS postura_6: los sprites del personaje con lo que lleva 6: fichas de 4
;   bytes (con la cifra baja del primero 0: [destino][rachas]; si no, [n |
;   destino][de]: n bloques en espejo), 0xFF acaba; lo leen p00:58F6 (37
;   bytes)
;   0x8677..0x869c  (37 bytes)
DATA_postura_6:
	defb 000h,0e0h,086h,08eh	; 8677
	defb 0d6h,0e0h,000h,0e0h	; 867b
	defb 080h,0e1h,00eh,08fh	; 867f
	defb 094h,0e2h,000h,0e2h	; 8683
	defb 000h,0e3h,032h,094h	; 8687
	defb 0d6h,0e3h,000h,0e3h	; 868b
	defb 080h,0e4h,058h,091h	; 868f
	defb 000h,0e5h,0b7h,094h	; 8693
	defb 094h,0e5h,000h,0e5h	; 8697
	defb 0ffh	; 869b

; ----------------------------------------------------------------------
; DATOS columnas_postura: 14 posiciones de la pagina 1 (una por direccion
;   0xE285) de donde se copia el dibujo del personaje; lo leen p00:5891 (28
;   bytes)
;   0x869c..0x86b8  (28 bytes)
DATA_columnas_postura:
	defb 0c0h,000h	; 869c
	defb 0c0h,080h	; 869e
	defb 0c1h,000h	; 86a0
	defb 0c1h,080h	; 86a2
	defb 0c2h,000h	; 86a4
	defb 0c2h,080h	; 86a6
	defb 0c3h,000h	; 86a8
	defb 0c3h,080h	; 86aa
	defb 0c4h,000h	; 86ac
	defb 0c4h,080h	; 86ae
	defb 0c4h,000h	; 86b0
	defb 0c4h,080h	; 86b2
	defb 0c5h,000h	; 86b4
	defb 0c5h,080h	; 86b6

; ----------------------------------------------------------------------
; DATOS columnas_postura2: otras 14, para la segunda copia; lo leen p00:58AB
;   (28 bytes)
;   0x86b8..0x86d4  (28 bytes)
DATA_columnas_postura2:
	defb 0c6h,000h	; 86b8
	defb 0c6h,080h	; 86ba
	defb 0c7h,000h	; 86bc
	defb 0c7h,080h	; 86be
	defb 0c8h,000h	; 86c0
	defb 0c8h,080h	; 86c2
	defb 0c9h,000h	; 86c4
	defb 0c9h,080h	; 86c6
	defb 0cah,000h	; 86c8
	defb 0cah,080h	; 86ca
	defb 0cah,000h	; 86cc
	defb 0cah,080h	; 86ce
	defb 0cbh,000h	; 86d0
	defb 0cbh,080h	; 86d2

; ----------------------------------------------------------------------
; DATOS rachas_86D4: rachas a la VRAM (sprites): [n < 0x80] repite el byte
;   siguiente, [0x80 + n] copia n, [0x80] otro destino, 0 acaba; lo leen
;   p00:5AB1, p00:590A (137 bytes)
;   0x86d4..0x875d  (137 bytes)
DATA_rachas_86D4:
	defb 008h,000h,088h,004h,00bh,004h,003h,005h,005h,009h,008h,008h,000h,088h,0f8h,0b4h	; 86d4  ................
	defb 0fch,03eh,0feh,03eh,02fh,00eh,008h,000h,088h,004h,00fh,007h,003h,007h,007h,00fh	; 86e4  .>.>/...........
	defb 00fh,008h,000h,088h,0f8h,05ch,084h,0c2h,0c2h,0f2h,0fdh,0feh,007h,000h,089h,004h	; 86f4  .....\..........
	defb 00bh,004h,003h,005h,005h,009h,008h,004h,007h,000h,089h,0f8h,0b4h,0fch,03eh,0feh	; 8704  ..............>.
	defb 03eh,02fh,00eh,038h,007h,000h,089h,004h,00fh,007h,003h,007h,007h,00fh,00fh,007h	; 8714  >/.8............
	defb 007h,000h,089h,0f8h,05ch,084h,0c2h,0c2h,0f2h,0fdh,0feh,0f8h,008h,000h,088h,004h	; 8724  ....\...........
	defb 00bh,004h,003h,005h,005h,009h,008h,008h,000h,088h,0f8h,0b4h,0fch,03eh,0feh,03eh	; 8734  .............>.>
	defb 02fh,00eh,008h,000h,088h,004h,00fh,007h,003h,007h,007h,00fh,00fh,008h,000h,088h	; 8744  /...............
	defb 0f8h,05ch,084h,0c2h,0c2h,0f2h,0fdh,0feh,000h	; 8754  .\.......

; ----------------------------------------------------------------------
; DATOS rachas_875D: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:590A (145 bytes)
;   0x875d..0x87ee  (145 bytes)
DATA_rachas_875D:
	defb 007h,000h,089h,001h,006h,00bh,017h,037h,05fh,07fh,07fh,03fh,007h,000h,089h,080h	; 875d  .......7_..?....
	defb 0e0h,0f0h,0f8h,0fch,0feh,0feh,0fch,0fah,007h,000h,089h,001h,007h,00dh,018h,038h	; 876d  ...............8
	defb 070h,048h,060h,038h,007h,000h,089h,080h,060h,090h,008h,00ch,00ah,012h,064h,01eh	; 877d  pH`8....`.....d.
	defb 006h,000h,08ah,001h,006h,00bh,017h,037h,05fh,07fh,03fh,03fh,04fh,006h,000h,08ah	; 878d  .......7_.??O...
	defb 080h,0e0h,0f0h,0f8h,0fch,0feh,0feh,0fch,0feh,0fch,006h,000h,08ah,001h,007h,00dh	; 879d  ................
	defb 018h,038h,070h,048h,020h,038h,07fh,006h,000h,08ah,080h,060h,090h,008h,00ch,00ah	; 87ad  .8pH 8.....`....
	defb 012h,064h,01ah,0f4h,008h,000h,088h,009h,017h,009h,006h,00bh,00ah,012h,070h,008h	; 87bd  .d............p.
	defb 000h,088h,0f0h,068h,0f8h,07ch,0fch,07ch,05eh,01ch,008h,000h,088h,009h,01eh,00fh	; 87cd  ...h.|.|^.......
	defb 007h,00fh,00fh,01fh,07fh,008h,000h,088h,0f0h,0b8h,008h,084h,084h,0e4h,0fah,0fch	; 87dd  ................
	defb 000h	; 87ed

; ----------------------------------------------------------------------
; DATOS rachas_87EE: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:590A (136 bytes)
;   0x87ee..0x8876  (136 bytes)
DATA_rachas_87EE:
	defb 008h,000h,088h,034h,05bh,05ch,05bh,05dh,05dh,079h,0f8h,008h,000h,088h,0f8h,0b4h	; 87ee  ...4[\[]]y......
	defb 0fch,03eh,0feh,03eh,02fh,00eh,008h,000h,088h,034h,06fh,06fh,06bh,06fh,06fh,04fh	; 87fe  .>.>/....4ookooO
	defb 0ffh,008h,000h,088h,0f8h,05ch,084h,0c2h,0c2h,0f2h,0fdh,0feh,007h,000h,089h,034h	; 880e  .....\.........4
	defb 05bh,05ch,05bh,05dh,05dh,079h,0f8h,04ch,007h,000h,089h,0f8h,0b4h,0fch,03eh,0feh	; 881e  [\[]]y.L......>.
	defb 03eh,02fh,00eh,038h,007h,000h,089h,034h,06fh,06fh,06bh,06fh,06fh,04fh,0ffh,07fh	; 882e  >/.8...4ookooO..
	defb 007h,000h,089h,0f8h,05ch,084h,0c2h,0c2h,0f2h,0fdh,0feh,0f8h,008h,000h,088h,01ch	; 883e  ....\...........
	defb 02bh,02ch,02fh,02dh,02dh,039h,078h,008h,000h,088h,0f8h,0b4h,0fch,03eh,0feh,03eh	; 884e  +,/--9x......>.>
	defb 02fh,00eh,008h,000h,082h,01ch,03fh,004h,037h,082h,02fh,07fh,008h,000h,088h,0f8h	; 885e  /.....?.7./.....
	defb 05ch,084h,0c2h,0c2h,0f2h,0fdh,0feh,000h	; 886e  \.......

; ----------------------------------------------------------------------
; DATOS rachas_8876: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:590A (155 bytes)
;   0x8876..0x8911  (155 bytes)
DATA_rachas_8876:
	defb 006h,000h,086h,003h,00dh,017h,02fh,06fh,0bfh,003h,0ffh,081h,07fh,005h,000h,085h	; 8876  ....../o........
	defb 00ch,016h,0d6h,0f6h,0f6h,003h,0feh,083h,0ffh,0f2h,0feh,006h,000h,08ah,003h,00eh	; 8886  ................
	defb 01bh,030h,070h,0e0h,090h,0c0h,0b0h,05fh,005h,000h,08bh,00ch,01ah,0dah,03ah,01ah	; 8896  .0p...._......:.
	defb 01ah,016h,026h,0cfh,03eh,0eah,007h,000h,089h,003h,00dh,017h,02fh,06fh,0bfh,0ffh	; 88a6  ..&.>......./o..
	defb 07fh,0bfh,007h,000h,083h,018h,0ech,0ech,005h,0fch,081h,0feh,007h,000h,089h,003h	; 88b6  ................
	defb 00eh,01bh,030h,070h,0e0h,090h,040h,0f0h,007h,000h,089h,018h,0f4h,034h,014h,01ch	; 88c6  ..0p..@......4..
	defb 014h,024h,0cch,03eh,003h,000h,081h,018h,004h,02ch,088h,02bh,02ch,07fh,03dh,03dh	; 88d6  .$.>.....,.+,.==
	defb 029h,028h,01ch,007h,000h,089h,0f8h,0b4h,0fch,03eh,0feh,03eh,02fh,00eh,038h,003h	; 88e6  )(.......>.>/.8.
	defb 000h,081h,018h,004h,034h,084h,03fh,037h,07fh,02fh,003h,03fh,081h,017h,007h,000h	; 88f6  ....4.?7./.?....
	defb 089h,0f8h,05ch,084h,0c2h,0c2h,0f2h,0fdh,0feh,0f8h,000h	; 8906  ..\........

; ----------------------------------------------------------------------
; DATOS rachas_8911: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:590A (143 bytes)
;   0x8911..0x89a0  (143 bytes)
DATA_rachas_8911:
	defb 007h,000h,089h,010h,02ch,02bh,05ch,053h,0b5h,0b5h,0f9h,078h,008h,000h,088h,0f8h	; 8911  ....,+\S...x....
	defb 0b4h,0fch,03eh,0feh,03eh,02fh,00eh,007h,000h,089h,010h,03ch,03fh,06fh,073h,0d7h	; 8921  ..>.>/.....<?os.
	defb 0d7h,09fh,07fh,008h,000h,088h,0f8h,05ch,084h,0c2h,0c2h,0f2h,0fdh,0feh,006h,000h	; 8931  .......\........
	defb 08ah,010h,02ch,02bh,05ch,053h,0b5h,0b5h,0f9h,078h,04ch,007h,000h,089h,0f8h,0b4h	; 8941  ..,+\S...xL.....
	defb 0fch,03eh,0feh,03eh,02fh,00eh,038h,006h,000h,08ah,010h,03ch,03fh,06fh,073h,0d7h	; 8951  .>.>/.8....<?os.
	defb 0d7h,09fh,07fh,07fh,007h,000h,089h,0f8h,05ch,084h,0c2h,0c2h,0f2h,0fdh,0feh,0f8h	; 8961  ........\.......
	defb 007h,000h,089h,008h,014h,01bh,02ch,02bh,05dh,05dh,079h,038h,008h,000h,088h,0f8h	; 8971  ......,+]]y8....
	defb 0b4h,0fch,03eh,0feh,03eh,02fh,00eh,007h,000h,089h,008h,01ch,01fh,037h,03bh,06fh	; 8981  ..>.>/.......7.o
	defb 06fh,04fh,03fh,008h,000h,088h,0f8h,05ch,084h,0c2h,0c2h,0f2h,0fdh,0feh,000h	; 8991  oO?....\.......

; ----------------------------------------------------------------------
; DATOS rachas_89A0: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:590A (159 bytes)
;   0x89a0..0x8a3f  (159 bytes)
DATA_rachas_89A0:
	defb 006h,000h,086h,003h,00dh,017h,02fh,06fh,0bfh,003h,0ffh,081h,07fh,004h,000h,08ch	; 89a0  ....../o........
	defb 008h,014h,014h,0dah,0eah,0fdh,0fdh,0ffh,0ffh,0feh,0f2h,0feh,006h,000h,08ah,003h	; 89b0  ................
	defb 00eh,01bh,030h,070h,0e0h,090h,0c0h,0b0h,05fh,004h,000h,08ch,008h,01ch,01ch,0d6h	; 89c0  ..0p...._.......
	defb 02eh,01bh,01fh,015h,027h,0ceh,03eh,0eah,007h,000h,089h,003h,00dh,017h,02fh,06fh	; 89d0  ....'.>......./o
	defb 0bfh,0ffh,07fh,0bfh,007h,000h,089h,008h,0d4h,0f4h,0fah,0fah,0fdh,0fdh,0ffh,0feh	; 89e0  ................
	defb 007h,000h,089h,003h,00eh,01bh,030h,070h,0e0h,090h,040h,0f0h,007h,000h,089h,008h	; 89f0  ......0p..@.....
	defb 0dch,03ch,016h,01eh,017h,027h,0cdh,03ah,004h,000h,08ch,008h,014h,014h,02ch,02bh	; 8a00  .<...'.:......,+
	defb 05ch,05bh,07dh,03dh,029h,028h,01ch,007h,000h,089h,0f8h,0b4h,0fch,03eh,0feh,03eh	; 8a10  \[}=)(.......>.>
	defb 02fh,00eh,038h,004h,000h,088h,008h,01ch,01ch,034h,03fh,06fh,06bh,04fh,003h,03fh	; 8a20  /.8......4?okO.?
	defb 081h,017h,007h,000h,089h,0f8h,05ch,084h,0c2h,0c2h,0f2h,0fdh,0feh,0f8h,000h	; 8a30  ......\........

; ----------------------------------------------------------------------
; DATOS rachas_8A3F: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:590A (187 bytes)
;   0x8a3f..0x8afa  (187 bytes)
DATA_rachas_8A3F:
	defb 004h,000h,08ch,001h,002h,006h,003h,007h,00bh,00ch,00fh,01dh,07dh,0f9h,0f8h,003h	; 8a3f  ............}...
	defb 000h,081h,0c0h,003h,020h,089h,0c0h,0f8h,0b4h,0fch,03eh,0feh,03eh,02fh,00eh,004h	; 8a4f  .... .....>.>/..
	defb 000h,08ch,001h,003h,005h,002h,005h,00fh,00fh,00bh,017h,067h,09fh,0bfh,003h,000h	; 8a5f  ...........g....
	defb 081h,0c0h,003h,0e0h,089h,040h,0f8h,05ch,084h,0c2h,0c2h,0f2h,0fdh,0feh,003h,000h	; 8a6f  .....@.\........
	defb 090h,001h,002h,006h,003h,007h,00bh,00ch,00fh,01dh,07dh,0f9h,0f8h,04ch,000h,000h	; 8a7f  ..........}..L..
	defb 0c0h,003h,020h,08ah,0c0h,0f8h,0b4h,0fch,03eh,0feh,03eh,02fh,00eh,038h,003h,000h	; 8a8f  .. .....>.>/.8..
	defb 090h,001h,003h,005h,002h,005h,00fh,00fh,00bh,017h,067h,09fh,0bfh,07fh,000h,000h	; 8a9f  ..........g.....
	defb 0c0h,003h,0e0h,08ah,040h,0f8h,05ch,084h,0c2h,0c2h,0f2h,0fdh,0feh,0f8h,005h,000h	; 8aaf  ....@.\.........
	defb 08bh,001h,003h,001h,007h,00bh,004h,007h,00dh,03dh,079h,078h,003h,000h,08dh,060h	; 8abf  .........=yx...`
	defb 090h,010h,010h,0e0h,0f8h,0b4h,0fch,03eh,0feh,03eh,02fh,00eh,005h,000h,08bh,001h	; 8acf  .......>.>/.....
	defb 002h,001h,006h,00fh,007h,007h,00fh,037h,04fh,05fh,003h,000h,081h,060h,003h,0f0h	; 8adf  .......7O_...`..
	defb 089h,020h,0f8h,05ch,084h,0c2h,0c2h,0f2h,0fdh,0feh,000h	; 8aef  . .\.......

; ----------------------------------------------------------------------
; DATOS rachas_8AFA: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:590A (204 bytes)
;   0x8afa..0x8bc6  (204 bytes)
DATA_rachas_8AFA:
	defb 006h,000h,086h,003h,00dh,017h,02fh,06fh,0bfh,003h,0ffh,085h,07fh,000h,000h,008h	; 8afa  ....../o........
	defb 014h,003h,022h,083h,0feh,0fch,0f4h,004h,0fch,082h,0f2h,0feh,006h,000h,08eh,003h	; 8b0a  ..".............
	defb 00eh,01bh,030h,070h,0e0h,090h,0c0h,0b0h,05fh,000h,000h,008h,01ch,003h,03eh,089h	; 8b1a  ..0p...._.....>.
	defb 0eah,034h,01ch,01ch,014h,024h,0cch,03eh,0eah,007h,000h,089h,003h,00dh,017h,02fh	; 8b2a  .4...$.>......./
	defb 06fh,0bfh,0ffh,07fh,0bfh,004h,000h,08ch,010h,028h,044h,044h,0c4h,0fch,0f8h,0f8h	; 8b3a  o........(DD....
	defb 0fch,0fch,0f8h,0f8h,007h,000h,089h,003h,00eh,01bh,030h,070h,0e0h,090h,040h,0f0h	; 8b4a  ..........0p..@.
	defb 004h,000h,08ch,010h,038h,07ch,07ch,0fch,034h,018h,018h,014h,024h,0c8h,038h,008h	; 8b5a  ....8||.4...$.8.
	defb 000h,088h,004h,00bh,004h,003h,005h,005h,009h,008h,008h,000h,088h,0f8h,0b4h,0fch	; 8b6a  ................
	defb 03eh,0feh,03eh,02fh,01eh,008h,000h,088h,004h,00fh,007h,003h,007h,007h,00fh,00fh	; 8b7a  >.>/............
	defb 008h,000h,088h,0f8h,05ch,084h,0c2h,0c2h,0f2h,0fdh,0f6h,007h,000h,089h,004h,00bh	; 8b8a  ....\...........
	defb 004h,003h,075h,09dh,08dh,08ch,056h,007h,000h,089h,0f8h,0b4h,0fch,03eh,0feh,03eh	; 8b9a  ..u...V......>.>
	defb 02fh,00eh,038h,007h,000h,089h,004h,00fh,007h,003h,077h,0efh,0f7h,0ffh,07bh,007h	; 8baa  /.8.......w...{.
	defb 000h,089h,0f8h,05ch,084h,0c2h,0c2h,0f2h,0fdh,0feh,0f8h,000h	; 8bba  ...\........

; ----------------------------------------------------------------------
; DATOS rachas_8BC6: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:590A (137 bytes)
;   0x8bc6..0x8c4f  (137 bytes)
DATA_rachas_8BC6:
	defb 008h,000h,088h,004h,07bh,084h,083h,0bdh,07dh,029h,038h,008h,000h,088h,0f8h,0b4h	; 8bc6  ....{...})8.....
	defb 0fch,03eh,0feh,03eh,02fh,00eh,008h,000h,088h,004h,07fh,0ffh,0ffh,0c7h,06fh,03fh	; 8bd6  .>.>/.........o?
	defb 03fh,008h,000h,088h,0f8h,05ch,084h,0c2h,0c2h,0f2h,0fdh,0feh,007h,000h,089h,004h	; 8be6  ?....\..........
	defb 07bh,084h,083h,0bdh,07dh,029h,038h,04ch,007h,000h,089h,0f8h,0b4h,0fch,03eh,0feh	; 8bf6  {...})8L......>.
	defb 03eh,02fh,00eh,038h,007h,000h,089h,004h,07fh,0ffh,0ffh,0c7h,06fh,03fh,03fh,07fh	; 8c06  >/.8........o??.
	defb 007h,000h,089h,0f8h,05ch,084h,0c2h,0c2h,0f2h,0fdh,0feh,0f8h,008h,000h,088h,004h	; 8c16  ....\...........
	defb 03bh,044h,043h,05dh,03dh,019h,018h,008h,000h,088h,0f8h,0b4h,0fch,03eh,0feh,03eh	; 8c26  .DC]=........>.>
	defb 02fh,00eh,008h,000h,088h,004h,03fh,07fh,07fh,067h,037h,01fh,01fh,008h,000h,088h	; 8c36  /.....?..g7.....
	defb 0f8h,05ch,084h,0c2h,0c2h,0f2h,0fdh,0feh,000h	; 8c46  .\.......

; ----------------------------------------------------------------------
; DATOS rachas_8C4F: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:590A (185 bytes)
;   0x8c4f..0x8d08  (185 bytes)
DATA_rachas_8C4F:
	defb 006h,000h,086h,003h,00dh,017h,02fh,06fh,0bfh,003h,0ffh,081h,07fh,007h,000h,089h	; 8c4f  ....../o........
	defb 0feh,0c1h,0c1h,0dfh,0feh,0fch,0fah,0f2h,0feh,006h,000h,08ah,003h,00eh,01bh,030h	; 8c5f  ...............0
	defb 070h,0e0h,090h,0c0h,0b0h,05fh,007h,000h,089h,0feh,07fh,07fh,061h,036h,034h,0ceh	; 8c6f  p...._......a64.
	defb 03eh,0eah,007h,000h,089h,003h,00dh,017h,02fh,06fh,0bfh,0ffh,07fh,0bfh,008h,000h	; 8c7f  >......./o......
	defb 088h,0c0h,0fch,082h,082h,0beh,0fch,0f8h,0f4h,007h,000h,089h,003h,00eh,01bh,030h	; 8c8f  ...............0
	defb 070h,0e0h,090h,040h,0f0h,008h,000h,088h,0c0h,07ch,0feh,0feh,0c2h,06ch,0e8h,03ch	; 8c9f  p..@.....|...l.<
	defb 008h,000h,088h,013h,02eh,013h,00ch,017h,054h,0a4h,0a0h,008h,000h,088h,0e0h,0d0h	; 8caf  ........T.......
	defb 0f8h,0f4h,0e2h,0f9h,0fch,04fh,008h,000h,088h,013h,03dh,01eh,00fh,01fh,05fh,0ffh	; 8cbf  .....O....=..._.
	defb 0ffh,008h,000h,088h,0e0h,070h,018h,01ch,03eh,0f7h,0f3h,0fdh,008h,000h,088h,07fh	; 8ccf  .....p..>.......
	defb 082h,083h,0beh,07fh,07ch,0bch,0c6h,008h,000h,083h,0e0h,0d0h,0f0h,003h,0f8h,082h	; 8cdf  ....|...........
	defb 0bch,038h,008h,000h,088h,07fh,0ffh,0feh,0c3h,06fh,06fh,0ffh,0ffh,008h,000h,088h	; 8cef  .8.......oo.....
	defb 0e0h,070h,010h,008h,008h,0c8h,0f4h,0f8h,000h	; 8cff  .p.......

; ----------------------------------------------------------------------
; DATOS rachas_8D08: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:590A (185 bytes)
;   0x8d08..0x8dc1  (185 bytes)
DATA_rachas_8D08:
	defb 004h,000h,08ch,003h,004h,003h,000h,009h,017h,009h,006h,00bh,00ah,012h,030h,004h	; 8d08  ..............0.
	defb 000h,08ch,0c8h,03ch,0c8h,0f4h,0f4h,06ah,0fah,07ch,0fch,07ch,05eh,01ch,004h,000h	; 8d18  ...<...j.|.|^...
	defb 08ch,003h,007h,003h,000h,009h,01eh,00fh,007h,00fh,00fh,01fh,03fh,004h,000h,08ch	; 8d28  ............?...
	defb 0c8h,0f4h,038h,0cch,0fch,0beh,00eh,084h,084h,0e4h,0fah,0fch,003h,000h,08dh,003h	; 8d38  ..8.............
	defb 004h,003h,000h,009h,017h,009h,006h,00bh,00ah,012h,030h,058h,003h,000h,08dh,0c8h	; 8d48  ..........0X....
	defb 03ch,0c8h,0f4h,0f4h,06ah,0fah,07ch,0fch,07ch,05eh,01ch,070h,003h,000h,08dh,003h	; 8d58  <...j.|.|^.p....
	defb 007h,003h,000h,009h,01eh,00fh,007h,00fh,00fh,01fh,03fh,07fh,003h,000h,08dh,0c8h	; 8d68  ..........?.....
	defb 0f4h,038h,0cch,0fch,0beh,00eh,084h,084h,0e4h,0fah,0fch,0f0h,004h,000h,08ch,001h	; 8d78  .8..............
	defb 002h,001h,000h,009h,017h,009h,006h,00bh,00ah,012h,010h,004h,000h,08ch,0e4h,01eh	; 8d88  ................
	defb 0e4h,07ah,0fah,06dh,0fdh,07eh,0fch,07ch,05eh,01ch,004h,000h,08ch,001h,003h,001h	; 8d98  .z.m.~.|^.......
	defb 000h,009h,01eh,00fh,007h,00fh,00fh,01fh,01fh,004h,000h,08ch,0e4h,0fah,09ch,066h	; 8da8  ...............f
	defb 0feh,0bbh,00fh,086h,084h,0e4h,0fah,0fch,000h	; 8db8  .........

; ----------------------------------------------------------------------
; DATOS rachas_8DC1: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:590A (197 bytes)
;   0x8dc1..0x8e86  (197 bytes)
DATA_rachas_8DC1:
	defb 005h,000h,08bh,002h,005h,00fh,016h,02eh,06dh,0bdh,0fdh,0fdh,0ffh,07fh,005h,000h	; 8dc1  ........m.......
	defb 08bh,03ch,0c2h,03ch,0f0h,0a0h,0d0h,0ech,0fah,0f2h,0ffh,0feh,005h,000h,08bh,002h	; 8dd1  .<.<............
	defb 007h,00fh,01bh,033h,076h,0e6h,097h,0c7h,0b2h,05fh,005h,000h,08bh,03ch,0feh,0cch	; 8de1  ...3v...._...<..
	defb 070h,0e0h,0f0h,0bch,036h,0deh,03dh,0eah,007h,000h,089h,00bh,017h,01ch,02bh,06ah	; 8df1  p...6.=.......+j
	defb 0b7h,0f7h,077h,0b7h,007h,000h,089h,0f0h,008h,0f0h,0f0h,0f8h,07ch,0bch,0d8h,0f4h	; 8e01  ..w.........|...
	defb 007h,000h,089h,00bh,01fh,01fh,03dh,07fh,0fbh,09ah,05ch,0fch,007h,000h,089h,0f0h	; 8e11  ......=...\.....
	defb 0f8h,030h,0d0h,098h,0d4h,0e4h,0f8h,02ch,007h,000h,089h,004h,00bh,00fh,031h,04fh	; 8e21  .0.....,......1O
	defb 05dh,0b5h,0ach,0bah,007h,000h,089h,0f8h,0b4h,0fch,03eh,0feh,03eh,02fh,00eh,038h	; 8e31  ].........>.>/.8
	defb 007h,000h,089h,004h,00fh,00fh,03fh,077h,07fh,0efh,0ffh,0f7h,007h,000h,089h,0f8h	; 8e41  ......?w........
	defb 05ch,084h,0c2h,0c2h,0f2h,0fdh,0feh,0f8h,008h,000h,088h,004h,00bh,004h,003h,005h	; 8e51  \...............
	defb 015h,029h,058h,008h,000h,088h,0f8h,0b4h,0fch,03eh,0feh,03eh,02fh,00eh,008h,000h	; 8e61  .)X......>.>/...
	defb 088h,004h,00fh,007h,003h,007h,017h,03fh,06fh,008h,000h,088h,0f8h,05ch,084h,0c2h	; 8e71  .......?o....\..
	defb 0c2h,0f2h,0fdh,0feh,000h	; 8e81

; ----------------------------------------------------------------------
; DATOS rachas_8E86: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:590A (136 bytes)
;   0x8e86..0x8f0e  (136 bytes)
DATA_rachas_8E86:
	defb 008h,000h,088h,004h,00bh,004h,003h,005h,005h,009h,008h,008h,000h,088h,0f8h,0b4h	; 8e86  ................
	defb 0fch,03eh,0feh,03eh,02fh,00eh,008h,000h,088h,004h,00fh,007h,003h,007h,007h,00fh	; 8e96  .>.>/...........
	defb 00fh,008h,000h,088h,0f8h,05ch,084h,0c2h,0c2h,0f2h,0fdh,0feh,007h,000h,089h,004h	; 8ea6  .....\..........
	defb 00bh,004h,003h,005h,005h,009h,008h,00fh,007h,000h,089h,0f8h,0b4h,0fch,03eh,0feh	; 8eb6  ..............>.
	defb 03eh,02fh,00eh,0beh,007h,000h,086h,004h,00fh,007h,003h,007h,007h,003h,00fh,007h	; 8ec6  >/..............
	defb 000h,089h,0f8h,05ch,084h,0c2h,0c2h,0f2h,0fdh,0feh,0f2h,008h,000h,088h,004h,00bh	; 8ed6  ...\............
	defb 004h,003h,005h,005h,009h,008h,008h,000h,088h,0f8h,0b4h,0fch,03eh,0feh,03eh,02fh	; 8ee6  ............>.>/
	defb 00eh,008h,000h,088h,004h,00fh,007h,003h,007h,007h,00fh,00fh,008h,000h,088h,0f8h	; 8ef6  ................
	defb 05ch,084h,0c2h,0c2h,0f2h,0fdh,0feh,000h	; 8f06  \.......

; ----------------------------------------------------------------------
; DATOS rachas_8F0E: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:590A (203 bytes)
;   0x8f0e..0x8fd9  (203 bytes)
DATA_rachas_8F0E:
	defb 006h,000h,086h,003h,00dh,017h,02fh,06fh,0bfh,003h,0ffh,081h,07fh,003h,000h,088h	; 8f0e  ....../o........
	defb 008h,014h,014h,01ch,0e2h,0eeh,0feh,0feh,003h,0ffh,082h,0f2h,0feh,006h,000h,08ah	; 8f1e  ................
	defb 003h,00eh,01bh,030h,070h,0e0h,090h,0c0h,0b0h,05fh,003h,000h,08dh,008h,01ch,01ch	; 8f2e  ...0p...._......
	defb 014h,0feh,032h,012h,01ah,017h,025h,0cdh,03eh,0eah,007h,000h,089h,003h,00dh,017h	; 8f3e  ..2...%.>.......
	defb 02fh,06fh,0bfh,0ffh,07fh,0bfh,006h,000h,087h,010h,028h,0e8h,0fch,0f4h,0fch,0fch	; 8f4e  /o........(.....
	defb 003h,0feh,007h,000h,089h,003h,00eh,01bh,030h,070h,0e0h,090h,040h,0f0h,006h,000h	; 8f5e  ........0p..@...
	defb 08ah,010h,038h,0f8h,02ch,01ch,01ch,014h,026h,0ceh,03ah,008h,000h,088h,004h,00bh	; 8f6e  ..8.,...&.:.....
	defb 004h,003h,005h,005h,009h,008h,008h,000h,088h,0f8h,0b4h,0fch,03eh,0feh,03eh,02fh	; 8f7e  ............>.>/
	defb 00eh,008h,000h,088h,004h,00fh,007h,003h,007h,007h,00fh,00fh,008h,000h,088h,0f8h	; 8f8e  ................
	defb 05ch,084h,0c2h,0c2h,0f2h,0fdh,0feh,006h,000h,08ah,004h,00bh,004h,003h,003h,005h	; 8f9e  \...............
	defb 005h,009h,008h,00fh,006h,000h,08ah,0f8h,0b4h,0fch,03eh,0feh,0feh,03fh,02eh,00fh	; 8fae  ..........>..?..
	defb 0ffh,006h,000h,087h,004h,00fh,007h,003h,003h,007h,007h,003h,00fh,006h,000h,08ah	; 8fbe  ................
	defb 0f8h,05ch,084h,0c2h,0c2h,0f2h,0fdh,0feh,0f9h,0f1h,000h	; 8fce  .\.........

; ----------------------------------------------------------------------
; DATOS rachas_8FD9: rachas a la VRAM (sprites): [n < 0x80] repite el byte
;   siguiente, [0x80 + n] copia n, [0x80] otro destino, 0 acaba; lo leen
;   p00:5ABA, p00:590A (132 bytes)
;   0x8fd9..0x905d  (132 bytes)
DATA_rachas_8FD9:
	defb 088h,004h,01fh,02fh,02dh,012h,01dh,00fh,007h,008h,000h,084h,03ch,0feh,0fdh,0f9h	; 8fd9  .../-.......<...
	defb 003h,0ffh,081h,01eh,008h,000h,088h,007h,01bh,034h,03fh,013h,01eh,00eh,007h,008h	; 8fe9  .........4?.....
	defb 000h,088h,0f4h,0e2h,017h,0ffh,00fh,011h,0e7h,01eh,008h,000h,088h,003h,007h,007h	; 8ff9  ................
	defb 002h,001h,001h,000h,003h,008h,000h,003h,0fch,085h,08ch,07ch,0f8h,0f8h,0f0h,008h	; 9009  ...........|....
	defb 000h,088h,003h,004h,004h,003h,001h,001h,000h,003h,008h,000h,088h,0cch,084h,074h	; 9019  ...............t
	defb 0fch,0f4h,008h,0f8h,0f0h,008h,000h,088h,004h,003h,005h,004h,007h,00bh,00fh,007h	; 9029  ................
	defb 008h,000h,088h,03ch,0feh,0fdh,0feh,0feh,0ffh,08fh,09eh,008h,000h,082h,007h,003h	; 9039  ...<............
	defb 003h,007h,083h,00ah,00fh,007h,008h,000h,088h,0f4h,0c6h,00fh,0b6h,0c2h,071h,08bh	; 9049  ..............q.
	defb 09eh,008h,000h,000h	; 9059

; ----------------------------------------------------------------------
; DATOS rachas_905D: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:590A (119 bytes)
;   0x905d..0x90d4  (119 bytes)
DATA_rachas_905D:
	defb 082h,03fh,01fh,005h,00fh,081h,01fh,008h,000h,003h,0feh,084h,0fch,0feh,0bch,080h	; 905d  .?..............
	defb 009h,000h,088h,027h,010h,00bh,00ch,008h,008h,00eh,01fh,008h,000h,087h,0eah,006h	; 906d  ...'............
	defb 0f2h,00ch,0c6h,0bch,080h,009h,000h,003h,07fh,084h,03fh,07fh,03dh,001h,009h,000h	; 907d  ..........?.=...
	defb 082h,0fch,0f8h,005h,0f0h,081h,0f8h,008h,000h,087h,053h,060h,04fh,030h,063h,03dh	; 908d  ..........S`O0c=
	defb 001h,009h,000h,088h,0c4h,008h,0d0h,030h,010h,010h,070h,0f8h,008h,000h,087h,098h	; 909d  .......0..p.....
	defb 0bfh,07bh,00dh,03bh,01fh,00eh,009h,000h,083h,07eh,0fdh,0f9h,003h,0feh,081h,01ch	; 90ad  .{.......~......
	defb 009h,000h,087h,0ffh,0c7h,07ch,00fh,03ch,01dh,00eh,009h,000h,087h,0e2h,0c7h,03fh	; 90bd  .....|.<.......?
	defb 0d6h,022h,0f6h,01ch,009h,000h,000h	; 90cd

; ----------------------------------------------------------------------
; DATOS rachas_90D4: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:590A (132 bytes)
;   0x90d4..0x9158  (132 bytes)
DATA_rachas_90D4:
	defb 088h,04ch,05fh,03fh,00dh,002h,01dh,00fh,007h,008h,000h,084h,03ch,0feh,0fdh,0f9h	; 90d4  .L_?........<...
	defb 003h,0ffh,081h,01eh,008h,000h,088h,07fh,073h,034h,00fh,003h,01eh,00eh,007h,008h	; 90e4  ........s4......
	defb 000h,088h,0f4h,0e2h,017h,0ffh,00fh,011h,0e7h,01eh,008h,000h,088h,05fh,03fh,00fh	; 90f4  ............._?.
	defb 002h,001h,001h,000h,003h,008h,000h,003h,0fch,085h,08ch,07ch,0f8h,0f8h,0f0h,008h	; 9104  ...........|....
	defb 000h,088h,073h,034h,00ch,003h,001h,001h,000h,003h,008h,000h,088h,0cch,084h,074h	; 9114  ..s4...........t
	defb 0fch,0f4h,008h,0f8h,0f0h,008h,000h,088h,024h,02fh,01dh,004h,007h,00bh,00fh,007h	; 9124  ........$/......
	defb 008h,000h,081h,03ch,003h,0fch,084h,0feh,0ffh,08fh,09eh,008h,000h,088h,03fh,03bh	; 9134  ...<..........?.
	defb 01fh,007h,007h,00ah,00fh,007h,008h,000h,088h,0f4h,0c4h,00ch,0b4h,0c2h,071h,08bh	; 9144  ..............q.
	defb 09eh,008h,000h,000h	; 9154

; ----------------------------------------------------------------------
; DATOS rachas_9158: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:590A (82 bytes)
;   0x9158..0x91aa  (82 bytes)
DATA_rachas_9158:
	defb 082h,07fh,03fh,005h,01fh,081h,03eh,008h,000h,002h,0feh,084h,0fch,0f0h,0fch,078h	; 9158  ..?...>........x
	defb 00ah,000h,088h,047h,020h,017h,018h,011h,011h,01dh,03eh,008h,000h,086h,086h,032h	; 9168  ...G .....>....2
	defb 0dch,010h,08ch,078h,00ah,000h,003h,0ffh,085h,07fh,0ffh,07bh,003h,001h,008h,000h	; 9178  ...x.......{....
	defb 081h,0e4h,003h,0fch,084h,0f8h,0e0h,0e0h,0f0h,008h,000h,088h,0afh,0c0h,09fh,060h	; 9188  ...............`
	defb 0c6h,07ah,002h,001h,008h,000h,088h,0fch,014h,08ch,064h,038h,020h,0e0h,0f0h,008h	; 9198  .z........d8 ...
	defb 000h,000h	; 91a8

; ----------------------------------------------------------------------
; DATOS rachas_91AA: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:590A (125 bytes)
;   0x91aa..0x9227  (125 bytes)
DATA_rachas_91AA:
	defb 082h,07fh,03fh,005h,01fh,081h,03eh,008h,000h,002h,0feh,084h,0fch,0f0h,0fch,078h	; 91aa  ..?...>........x
	defb 00ah,000h,088h,047h,020h,017h,018h,011h,011h,01dh,03eh,008h,000h,086h,086h,032h	; 91ba  ...G .....>....2
	defb 0dch,010h,08ch,078h,00ah,000h,003h,0ffh,085h,07fh,0ffh,07bh,003h,001h,008h,000h	; 91ca  ...x.......{....
	defb 081h,0e4h,003h,0fch,084h,0f8h,0e0h,0e0h,0f0h,008h,000h,088h,0afh,0c0h,09fh,060h	; 91da  ...............`
	defb 0c6h,07ah,002h,001h,008h,000h,088h,0fch,014h,08ch,064h,038h,020h,0e0h,0f0h,008h	; 91ea  .z........d8 ...
	defb 000h,088h,00fh,007h,007h,002h,001h,001h,000h,003h,008h,000h,003h,0fch,085h,08ch	; 91fa  ................
	defb 07ch,0f8h,0f8h,0f0h,008h,000h,088h,00bh,004h,004h,003h,001h,001h,000h,003h,008h	; 920a  |...............
	defb 000h,088h,0cch,084h,074h,0fch,0f4h,008h,0f8h,0f0h,008h,000h,000h	; 921a  ....t........

; ----------------------------------------------------------------------
; DATOS rachas_9227: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:590A (45 bytes)
;   0x9227..0x9254  (45 bytes)
DATA_rachas_9227:
	defb 088h,04ch,05fh,03fh,00dh,002h,01dh,00fh,007h,008h,000h,084h,03ch,0feh,0fdh,0f9h	; 9227  .L_?........<...
	defb 003h,0ffh,081h,01eh,008h,000h,088h,07fh,073h,034h,00fh,003h,01eh,00eh,007h,008h	; 9237  ........s4......
	defb 000h,088h,0f4h,0e2h,017h,0ffh,00fh,011h,0e7h,01eh,008h,000h,000h	; 9247  .............

; ----------------------------------------------------------------------
; DATOS rachas_9254: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:590A (89 bytes)
;   0x9254..0x92ad  (89 bytes)
DATA_rachas_9254:
	defb 088h,004h,00fh,032h,073h,0cfh,087h,08fh,077h,008h,000h,088h,07eh,0deh,0cch,0f8h	; 9254  ...2s...w...~...
	defb 0fch,0feh,0feh,03ch,008h,000h,088h,007h,00bh,03fh,05eh,0bfh,0fch,0feh,077h,008h	; 9264  ...<.....?^...w.
	defb 000h,088h,0e2h,0e6h,07ch,0f8h,00ch,012h,0e6h,03ch,008h,000h,088h,035h,00eh,003h	; 9274  ....|....<...5..
	defb 003h,005h,01fh,00fh,007h,008h,000h,002h,0fch,086h,0b8h,038h,0fch,0feh,0feh,03ch	; 9284  ...........8...<
	defb 008h,000h,088h,03fh,00dh,003h,003h,006h,01ch,00eh,007h,008h,000h,088h,0cch,084h	; 9294  ...?............
	defb 068h,0f8h,0cch,012h,0e6h,03ch,008h,000h,000h	; 92a4  h....<...

; ----------------------------------------------------------------------
; DATOS rachas_92AD: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:590A (87 bytes)
;   0x92ad..0x9304  (87 bytes)
DATA_rachas_92AD:
	defb 088h,070h,03fh,01fh,017h,00bh,077h,03fh,01ch,008h,000h,088h,0eah,0f0h,0e0h,0e0h	; 92ad  .p?...w?........
	defb 0f0h,0f8h,0f8h,0e0h,008h,000h,088h,05fh,02fh,010h,01fh,00ch,078h,03bh,01ch,008h	; 92bd  ......._/...x...
	defb 000h,088h,0bah,010h,0a0h,0e0h,030h,048h,098h,0e0h,008h,000h,088h,04fh,03fh,01fh	; 92cd  ......0H.....O?.
	defb 017h,00bh,077h,03fh,01ch,008h,000h,004h,0e0h,084h,0f0h,0f8h,0f8h,0e0h,008h,000h	; 92dd  ..w?............
	defb 088h,079h,030h,01ch,01fh,00ch,078h,03bh,01ch,008h,000h,088h,0e0h,020h,020h,0e0h	; 92ed  .y0...x......  .
	defb 030h,048h,098h,0e0h,008h,000h,000h	; 92fd

; ----------------------------------------------------------------------
; DATOS rachas_9304: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:590A (132 bytes)
;   0x9304..0x9388  (132 bytes)
DATA_rachas_9304:
	defb 088h,058h,05fh,0ffh,05bh,005h,03bh,01fh,00eh,008h,000h,084h,078h,0fch,0fah,0f2h	; 9304  .X_.[.......x...
	defb 003h,0feh,081h,03ch,008h,000h,088h,07fh,077h,0a8h,05fh,006h,03ch,01dh,00eh,008h	; 9314  ...<....w._.<...
	defb 000h,088h,0e8h,0c4h,02eh,0feh,01eh,022h,0ceh,03ch,008h,000h,088h,05fh,0ffh,05fh	; 9324  .......".<..._._
	defb 005h,002h,003h,001h,007h,008h,000h,003h,0f8h,085h,018h,0f8h,0f0h,0f0h,0e0h,008h	; 9334  ................
	defb 000h,088h,077h,0a9h,058h,007h,003h,002h,001h,007h,008h,000h,088h,098h,008h,0e8h	; 9344  ..w.X...........
	defb 0f8h,0e8h,010h,0f0h,0e0h,008h,000h,088h,028h,02fh,07dh,03ch,00fh,017h,01fh,00fh	; 9354  ........(/}<....
	defb 008h,000h,081h,078h,003h,0f8h,084h,0fch,0feh,01eh,03ch,008h,000h,002h,03fh,086h	; 9364  ...x......<...?.
	defb 057h,03fh,00fh,014h,01fh,00fh,008h,000h,088h,0e8h,088h,018h,0e8h,084h,0e2h,016h	; 9374  W?..............
	defb 03ch,008h,000h,000h	; 9384

; ----------------------------------------------------------------------
; DATOS rachas_9388: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:590A (170 bytes)
;   0x9388..0x9432  (170 bytes)
DATA_rachas_9388:
	defb 082h,07fh,03fh,005h,01fh,081h,03eh,008h,000h,086h,0feh,0fch,0f8h,0f0h,0fch,078h	; 9388  ..?...>........x
	defb 00ah,000h,088h,047h,020h,017h,018h,011h,011h,01dh,03eh,008h,000h,086h,082h,034h	; 9398  ...G .....>....4
	defb 0d8h,010h,08ch,078h,00ah,000h,003h,0ffh,085h,07fh,0ffh,07bh,003h,001h,008h,000h	; 93a8  ...x.......{....
	defb 088h,0e4h,0feh,0fch,0fch,0f8h,0e0h,0e0h,0f0h,008h,000h,088h,0afh,0c0h,09fh,060h	; 93b8  ...............`
	defb 0c6h,07ah,002h,001h,008h,000h,088h,0fch,01ah,084h,064h,038h,020h,0e0h,0f0h,008h	; 93c8  .z........d8 ...
	defb 000h,088h,0adh,046h,003h,003h,005h,01fh,00fh,007h,008h,000h,002h,0fch,086h,0b8h	; 93d8  ...F............
	defb 038h,0fch,0feh,0feh,03ch,008h,000h,088h,0ebh,045h,003h,003h,006h,01ch,00eh,007h	; 93e8  8...<....E......
	defb 008h,000h,088h,0cch,084h,048h,0f8h,0cch,012h,0e6h,03ch,008h,000h,088h,054h,0bfh	; 93f8  .....H....<...T.
	defb 0a7h,0afh,0bfh,05fh,04fh,037h,008h,000h,088h,03eh,0feh,0dch,0c8h,0fch,0feh,0feh	; 9408  ..._O7...>......
	defb 03ch,008h,000h,088h,077h,0dbh,0ffh,0f4h,0dfh,07ch,07eh,037h,008h,000h,088h,0f2h	; 9418  <...w....|~7....
	defb 0e2h,0f4h,078h,0fch,012h,0e6h,03ch,008h,000h,000h	; 9428  ..x...<...

; ----------------------------------------------------------------------
; DATOS rachas_9432: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:590A (133 bytes)
;   0x9432..0x94b7  (133 bytes)
DATA_rachas_9432:
	defb 088h,00fh,070h,0bfh,073h,017h,01fh,00fh,007h,008h,000h,088h,0beh,0feh,0dch,0cch	; 9432  ..p.s...........
	defb 0feh,0ffh,0ffh,01eh,008h,000h,088h,00fh,07fh,0deh,07eh,01bh,01ch,00eh,007h,008h	; 9442  ..........~.....
	defb 000h,088h,0f2h,062h,074h,07ch,0b2h,011h,0e7h,01eh,008h,000h,088h,070h,0bfh,073h	; 9452  ...bt|.......p.s
	defb 017h,00dh,001h,000h,003h,008h,000h,088h,0feh,0dch,0cch,0fch,0fch,0f8h,0f8h,0f0h	; 9462  ................
	defb 008h,000h,088h,07fh,0deh,07eh,01bh,00dh,001h,000h,003h,008h,000h,088h,062h,074h	; 9472  .....~........bt
	defb 07ch,0b4h,004h,008h,0f8h,0f0h,008h,000h,088h,007h,038h,05fh,039h,00bh,007h,00fh	; 9482  |.........8_9...
	defb 007h,008h,000h,088h,0ffh,07fh,0eeh,0e4h,0feh,0ffh,08fh,09eh,008h,000h,088h,007h	; 9492  ................
	defb 03fh,06fh,03fh,00dh,006h,00fh,007h,008h,000h,088h,0f9h,0b1h,03ah,03ch,0fah,071h	; 94a2  ?o?.........:<.q
	defb 08bh,09eh,008h,000h,000h	; 94b2

; ----------------------------------------------------------------------
; DATOS rachas_94B7: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:590A (89 bytes)
;   0x94b7..0x9510  (89 bytes)
DATA_rachas_94B7:
	defb 088h,01fh,070h,0bfh,073h,017h,00fh,00fh,01fh,008h,000h,088h,0beh,0feh,0dch,0c8h	; 94b7  ..p.s...........
	defb 0fch,0feh,0feh,03ch,008h,000h,088h,01fh,07fh,0deh,07eh,01bh,00eh,00eh,01fh,008h	; 94c7  ...<......~.....
	defb 000h,088h,0f2h,062h,074h,078h,0bch,012h,0e6h,03ch,008h,000h,088h,038h,05fh,039h	; 94d7  ...btx...<...8_9
	defb 00bh,01eh,01dh,00fh,007h,008h,000h,088h,06eh,0e4h,0f8h,0fch,0feh,0feh,0bch,038h	; 94e7  ........n......8
	defb 008h,000h,088h,03fh,06eh,03fh,00dh,01fh,01eh,00eh,007h,008h,000h,088h,0bah,03ch	; 94f7  ...?n?.........<
	defb 038h,0cch,012h,066h,0ach,038h,008h,000h,000h	; 9507  8..f.8...

; ----------------------------------------------------------------------
; DATOS rachas_9510: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:590A (45 bytes)
;   0x9510..0x953d  (45 bytes)
DATA_rachas_9510:
	defb 008h,000h,088h,004h,00bh,004h,003h,005h,005h,009h,038h,008h,000h,088h,0f8h,0b4h	; 9510  ..........8.....
	defb 0fch,03eh,0feh,03eh,02fh,00eh,008h,000h,088h,004h,00fh,007h,003h,007h,007h,00fh	; 9520  .>.>/...........
	defb 03fh,008h,000h,088h,0f8h,05ch,084h,0c2h,0c2h,0f2h,0fdh,0feh,000h	; 9530  ?....\.......

; ----------------------------------------------------------------------
; DATOS rachas_953D: rachas a la VRAM (sprites del personaje muerto): [n <
;   0x80] repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:592E (612 bytes)
;   0x953d..0x97a1  (612 bytes)
DATA_rachas_953D:
	defb 007h,000h,089h,009h,017h,009h,006h,00bh,00ch,012h,010h,009h,007h,000h,089h,0f0h	; 953d  ................
	defb 068h,0f8h,07ch,0fch,07ch,07eh,08ch,0fch,007h,000h,089h,009h,01eh,00fh,007h,00fh	; 954d  h.|.|~..........
	defb 00fh,01fh,01fh,00fh,007h,000h,091h,0f0h,0b8h,008h,084h,084h,0e4h,0fah,0fch,074h	; 955d  ...............t
	defb 007h,00fh,00bh,027h,03bh,01fh,00eh,001h,008h,000h,081h,0fch,004h,0f8h,002h,0f0h	; 956d  ...'............
	defb 081h,0e0h,008h,000h,088h,007h,008h,00fh,024h,03ch,01dh,00eh,001h,008h,000h,088h	; 957d  ........$<......
	defb 004h,008h,0f8h,018h,068h,090h,0f0h,0e0h,00eh,000h,08ah,001h,006h,00bh,017h,037h	; 958d  ....h..........7
	defb 05fh,07fh,07fh,09fh,0bfh,006h,000h,085h,080h,0e0h,0f0h,0f8h,0fch,003h,0feh,082h	; 959d  _...............
	defb 0f9h,0fdh,006h,000h,08ah,001h,007h,00dh,018h,038h,070h,048h,060h,0f8h,0efh,006h	; 95ad  .........8pH`...
	defb 000h,091h,080h,060h,090h,008h,00ch,00ah,012h,066h,01fh,0f7h,07fh,01fh,07fh,03fh	; 95bd  ...`.....f.....?
	defb 01fh,00dh,001h,009h,000h,082h,0feh,0fch,003h,0f8h,083h,0f0h,0e0h,0f0h,008h,000h	; 95cd  ................
	defb 087h,063h,01ch,063h,030h,01bh,00dh,001h,009h,000h,088h,0e2h,004h,0e8h,018h,088h	; 95dd  .c.c0...........
	defb 010h,0a0h,0f0h,00fh,000h,083h,003h,005h,007h,003h,00fh,083h,01fh,00ch,00fh,007h	; 95ed  ................
	defb 000h,089h,0e4h,0bah,0e4h,098h,0f4h,08ch,092h,042h,0e4h,007h,000h,089h,003h,007h	; 95fd  .........B......
	defb 004h,008h,008h,009h,017h,00fh,00bh,007h,000h,08ah,0e4h,05eh,03ch,078h,07ch,0fch	; 960d  ...........^<x|.
	defb 0feh,0feh,0bch,00fh,004h,007h,002h,003h,081h,001h,008h,000h,088h,0f8h,0fch,0f4h	; 961d  ................
	defb 0f9h,0f7h,0feh,0dch,0e0h,008h,000h,088h,008h,004h,007h,006h,005h,002h,003h,001h	; 962d  ................
	defb 008h,000h,088h,038h,004h,0fch,009h,08fh,06eh,0dch,0e0h,00eh,000h,08ah,003h,005h	; 963d  ...8....n.......
	defb 00bh,00fh,01fh,03dh,038h,039h,04ch,05fh,005h,000h,08bh,0c0h,070h,0f8h,0fch,0fch	; 964d  ...=89L_....p...
	defb 0feh,02fh,0c7h,027h,0c9h,0fdh,006h,000h,08ah,003h,006h,00fh,00ch,013h,02fh,02fh	; 965d  ./.'..........//
	defb 03fh,07fh,076h,005h,000h,08dh,0c0h,0b0h,008h,0f4h,00ch,0f2h,0fdh,0fdh,0ffh,0ffh	; 966d  ?.v.............
	defb 0d7h,03fh,01fh,003h,00fh,083h,007h,003h,007h,008h,000h,088h,0feh,0fch,03fh,0feh	; 967d  .?............?.
	defb 0fch,0d8h,0c0h,080h,008h,000h,088h,021h,010h,00bh,00ch,008h,004h,002h,007h,008h	; 968d  .......!........
	defb 000h,088h,0e2h,01ch,0e3h,006h,0ech,058h,0c0h,080h,00dh,000h,08bh,001h,006h,00bh	; 969d  .......X........
	defb 017h,01fh,03fh,07ah,071h,072h,099h,0bfh,005h,000h,08bh,080h,0e0h,0f0h,0f8h,0f8h	; 96ad  ..?zqr..........
	defb 0fch,05eh,08eh,04eh,092h,0fah,005h,000h,08bh,001h,007h,00ch,01fh,018h,027h,05fh	; 96bd  .^.N..........'_
	defb 05fh,07fh,0ffh,0edh,005h,000h,093h,080h,060h,010h,0e8h,018h,0e4h,0fah,0fah,0feh	; 96cd  _.......`.......
	defb 0feh,0aeh,07fh,03fh,01eh,01fh,01fh,00fh,007h,00fh,008h,000h,087h,0fch,0f8h,07eh	; 96dd  ...?...........~
	defb 0fch,0f8h,0b0h,080h,009h,000h,088h,043h,020h,017h,018h,011h,008h,005h,00fh,008h	; 96ed  .......C .......
	defb 000h,087h,0c4h,038h,0c6h,00ch,0d8h,0b0h,080h,00eh,000h,08bh,001h,006h,00bh,017h	; 96fd  ...8............
	defb 01fh,03fh,07ah,071h,072h,049h,05fh,005h,000h,08bh,080h,0e0h,0f0h,0f8h,0f8h,0fch	; 970d  .?zqrI_.........
	defb 05eh,08eh,04eh,099h,0fdh,005h,000h,08bh,001h,007h,00ch,01fh,018h,027h,05fh,05fh	; 971d  ^.N..........'__
	defb 07fh,07fh,075h,005h,000h,092h,080h,060h,010h,0e8h,018h,0e4h,0fah,0fah,0feh,0ffh	; 972d  ..u....`........
	defb 0b7h,03fh,01fh,07eh,03fh,01fh,00dh,001h,009h,000h,088h,0feh,0fch,078h,0f8h,0f8h	; 973d  .?.~?........x..
	defb 0f0h,0e0h,0f0h,008h,000h,087h,023h,01ch,063h,030h,01bh,00dh,001h,009h,000h,088h	; 974d  ......#.c0......
	defb 0c2h,004h,0e8h,018h,088h,010h,0a0h,0f0h,017h,000h,081h,038h,00fh,000h,081h,00eh	; 975d  ...........8....
	defb 00fh,000h,081h,038h,00fh,000h,089h,00eh,044h,05eh,03fh,01fh,03fh,05fh,05fh,03fh	; 976d  ...8....D^?.?__?
	defb 008h,000h,088h,011h,037h,07eh,0fch,0feh,0fdh,0fdh,0feh,008h,000h,088h,07ch,066h	; 977d  ....7~........|f
	defb 039h,010h,030h,078h,074h,03fh,008h,000h,088h,01fh,039h,04eh,084h,006h,00fh,017h	; 978d  9.0xt?....9N....
	defb 0feh,008h,000h,000h	; 979d

; ----------------------------------------------------------------------
; DATOS rachas_97A1: rachas a la VRAM (sprites): [n < 0x80] repite el byte
;   siguiente, [0x80 + n] copia n, [0x80] otro destino, 0 acaba; lo leen
;   p00:595B (296 bytes)
;   0x97a1..0x98c9  (296 bytes)
DATA_rachas_97A1:
	defb 005h,000h,002h,001h,090h,00bh,017h,009h,004h,009h,009h,012h,012h,00ch,030h,078h	; 97a1  ..............0x
	defb 078h,0f0h,0f0h,0e0h,0e0h,003h,0c0h,083h,040h,0a0h,040h,008h,000h,002h,001h,096h	; 97b1  x.......@.@.....
	defb 00ah,01eh,00fh,007h,00fh,00fh,01eh,01eh,00ch,030h,048h,048h,090h,090h,020h,020h	; 97c1  .........0HH..
	defb 040h,040h,0c0h,0c0h,0e0h,040h,009h,000h,084h,07fh,0ffh,0ffh,07fh,00ah,000h,088h	; 97d1  @@...@..........
	defb 020h,050h,0deh,0c1h,0c1h,0deh,050h,020h,00ah,000h,084h,07fh,080h,080h,07fh,00ah	; 97e1   P....P ........
	defb 000h,088h,020h,070h,0feh,07fh,07fh,0feh,070h,020h,004h,000h,08bh,00ch,012h,012h	; 97f1  .. p....p ......
	defb 009h,009h,004h,009h,017h,00bh,001h,001h,008h,000h,083h,040h,0a0h,040h,003h,0c0h	; 9801  ...........@.@..
	defb 002h,0e0h,002h,0f0h,002h,078h,08ch,030h,00ch,01eh,01eh,00fh,00fh,007h,00fh,01eh	; 9811  .....x.0........
	defb 00ah,001h,001h,008h,000h,08dh,040h,0e0h,0c0h,0c0h,040h,040h,020h,020h,090h,090h	; 9821  ......@...@@  ..
	defb 048h,048h,030h,003h,000h,083h,001h,002h,005h,003h,00bh,002h,005h,002h,002h,081h	; 9831  HH0.............
	defb 001h,003h,000h,08eh,060h,0b0h,070h,0e0h,0c0h,080h,000h,080h,080h,0c0h,0c0h,0e0h	; 9841  ....`.p.........
	defb 060h,0c0h,004h,000h,08bh,001h,003h,006h,00ch,00dh,00ch,006h,006h,003h,003h,001h	; 9851  `...............
	defb 003h,000h,08eh,060h,0d0h,090h,020h,040h,080h,000h,080h,080h,040h,040h,020h,0a0h	; 9861  ...`.. @....@@ .
	defb 0c0h,008h,000h,085h,001h,07fh,080h,0ffh,07fh,006h,000h,08ah,030h,058h,058h,0b0h	; 9871  ............0XX.
	defb 0b0h,030h,060h,060h,0c0h,080h,00bh,000h,085h,001h,07fh,0ffh,080h,07fh,006h,000h	; 9881  .0``............
	defb 083h,030h,068h,068h,003h,0d0h,002h,0a0h,082h,040h,080h,008h,000h,085h,07fh,080h	; 9891  .0hh.....@......
	defb 0ffh,07fh,001h,00bh,000h,084h,080h,040h,0a0h,0a0h,003h,0d0h,002h,068h,081h,030h	; 98a1  .......@.....h.0
	defb 006h,000h,085h,07fh,0ffh,080h,07fh,001h,00bh,000h,08ch,080h,0c0h,060h,060h,030h	; 98b1  .............``0
	defb 0b0h,0b0h,058h,058h,030h,000h,000h,000h	; 98c1  ..XX0...

; ----------------------------------------------------------------------
; DATOS lista_sprites: lista de sprites: [n][dibujo][puntero], un 0 acaba; lo
;   leen p00:5508 (33 bytes)
;   0x98c9..0x98ea  (33 bytes)
DATA_lista_sprites:
	defb 004h,048h,0f7h,098h	; 98c9
	defb 006h,068h,077h,099h	; 98cd
	defb 006h,080h,037h,09ah	; 98d1
	defb 004h,0b0h,0f7h,09ah	; 98d5
	defb 002h,0c0h,077h,09bh	; 98d9
	defb 004h,0d0h,0b7h,09bh	; 98dd
	defb 004h,0e0h,037h,09ch	; 98e1
	defb 004h,0f0h,0b7h,09ch	; 98e5
	defb 000h	; 98e9

; ----------------------------------------------------------------------
; DATOS lista_vueltas: sprites que se copian dados la vuelta: [tipo][n][de][a]
;   (1 de arriba abajo, 2 de izquierda a derecha), un 0 acaba; lo leen
;   p00:553D (13 bytes)
;   0x98ea..0x98f7  (13 bytes)
DATA_lista_vueltas:
	defb 002h,004h,048h,058h	; 98ea
	defb 002h,006h,080h,098h	; 98ee
	defb 002h,002h,0c0h,0c8h	; 98f2
	defb 000h	; 98f6

; ----------------------------------------------------------------------
; DATOS spr_98F7: 4 sprites de 16 x 16 (32 bytes cada uno) que se copian al
;   dibujo 72; lo leen p00:5530 (128 bytes)
;   0x98f7..0x9977  (128 bytes)
DATA_spr_98F7:
	defb 000h,01fh,03fh,07fh,07fh,07dh,0feh,0ffh,079h,07fh,0cfh,0bch,0dbh,01fh,00dh,00fh	; 98f7  ..?..}..y.......
	defb 000h,080h,0c0h,0e0h,0f0h,050h,0f0h,0d0h,0b8h,0b8h,06ch,09ch,076h,0ffh,0b7h,0beh	; 9907  .....P....l.v...
	defb 000h,01fh,024h,042h,079h,066h,0bfh,08fh,047h,07eh,0b8h,073h,0d7h,016h,00eh,008h	; 9917  ..$Byf..G~.s....
	defb 000h,080h,040h,020h,090h,0f0h,0b0h,030h,068h,068h,0d4h,0e4h,08eh,019h,079h,062h	; 9927  ..@ ...0hh....yb
	defb 01fh,03fh,07fh,07fh,07dh,0ffh,0ffh,07fh,060h,0dfh,077h,06bh,071h,021h,000h,001h	; 9937  .?..}...`.wkq!..
	defb 080h,0c0h,0e0h,0f0h,050h,0f0h,0d0h,038h,0f8h,0ech,09ch,07ch,0f4h,0f8h,0e8h,0f4h	; 9947  ....P..8...|....
	defb 01fh,024h,042h,079h,066h,0bfh,09eh,060h,05fh,0bfh,06ch,05ah,051h,021h,000h,001h	; 9957  .$Byf..`_.lZQ!..
	defb 080h,040h,020h,090h,0f0h,0b0h,030h,0e8h,0c8h,014h,064h,0c4h,08ch,018h,098h,00ch	; 9967  .@ ...0...d.....

; ----------------------------------------------------------------------
; DATOS spr_9977: 6 sprites de 16 x 16 (32 bytes cada uno) que se copian al
;   dibujo 104; lo leen p00:5530 (192 bytes)
;   0x9977..0x9a37  (192 bytes)
DATA_spr_9977:
	defb 003h,00fh,018h,017h,03fh,03fh,05fh,0b7h,0efh,0ffh,0ffh,0feh,0fdh,03ah,02eh,07ah	; 9977  ....??_......:.z
	defb 0c0h,0f0h,008h,0e8h,0f4h,0fch,0fah,0cdh,0b7h,0ffh,0ffh,07fh,0bfh,05ch,074h,05eh	; 9987  .............\t^
	defb 003h,00ch,017h,018h,02fh,039h,06fh,0c8h,094h,0b3h,018h,031h,0e3h,026h,032h,046h	; 9997  ..../9o....1.&2F
	defb 0c0h,030h,0f8h,018h,0fch,09ch,0f6h,033h,069h,0cdh,018h,08ch,0c7h,064h,04ch,062h	; 99a7  .0.....3i....dLb
	defb 007h,00bh,017h,037h,077h,07bh,05ch,05bh,02eh,02fh,01fh,00ch,00fh,01fh,01eh,03eh	; 99b7  ...7w{\[./.....>
	defb 0e0h,0d0h,0e8h,0e8h,0e8h,0deh,03fh,0dfh,07bh,0feh,0fch,01ch,0fch,0feh,01ch,000h	; 99c7  ......?.{.......
	defb 007h,00ch,018h,038h,058h,054h,06bh,06ch,037h,030h,018h,00bh,00ch,011h,012h,022h	; 99d7  ...8XTkl70....."
	defb 0e0h,030h,018h,018h,018h,02eh,0d9h,03dh,0e5h,002h,01ch,0e4h,014h,0e2h,01ch,000h	; 99e7  .0.....=........
	defb 007h,00bh,017h,017h,017h,07bh,0fch,0fbh,0deh,07fh,03fh,038h,03fh,07fh,038h,000h	; 99f7  .....{....?8?.8.
	defb 0e0h,0d0h,0e8h,0ech,0eeh,0deh,03ah,0dah,074h,0f4h,0f8h,030h,0f0h,0f8h,078h,07ch	; 9a07  ......:.t..0..x|
	defb 007h,00ch,018h,018h,018h,074h,09bh,0bch,0a7h,040h,038h,027h,028h,047h,038h,000h	; 9a17  .....t...@8'(G8.
	defb 0e0h,030h,018h,01ch,01ah,02ah,0d6h,036h,0ech,00ch,018h,0d0h,030h,088h,048h,044h	; 9a27  .0...*.6....0.HD

; ----------------------------------------------------------------------
; DATOS spr_9A37: 6 sprites de 16 x 16 (32 bytes cada uno) que se copian al
;   dibujo 128; lo leen p00:5530 (192 bytes)
;   0x9a37..0x9af7  (192 bytes)
DATA_spr_9A37:
	defb 000h,00eh,01fh,03fh,017h,005h,03dh,06dh,02bh,036h,054h,0fah,0cah,07dh,037h,01ah	; 9a37  ...?..=m+6T..}7.
	defb 000h,000h,060h,0feh,0ffh,0fdh,0fdh,0fdh,0fdh,0d5h,0d5h,055h,057h,05eh,0f8h,020h	; 9a47  ..`........UW^.
	defb 000h,00eh,011h,029h,015h,006h,03eh,05eh,03eh,02fh,05fh,0b7h,0bfh,04bh,02dh,01ah	; 9a57  ...)..>^>/_..K-.
	defb 000h,000h,060h,09eh,025h,0b7h,097h,047h,07fh,07fh,07fh,0ffh,0fdh,0f6h,0d8h,020h	; 9a67  ..`.%..G.......
	defb 00fh,018h,01fh,01fh,01fh,03fh,03fh,01fh,03fh,078h,07fh,076h,03bh,013h,007h,003h	; 9a77  .....??.?x.v....
	defb 0f8h,00ch,0fch,086h,0feh,083h,0feh,0e2h,082h,0c4h,0fch,0aah,0fch,048h,0e8h,0f0h	; 9a87  .............H..
	defb 00fh,017h,01fh,010h,016h,02ch,021h,016h,038h,047h,04fh,055h,02bh,013h,004h,003h	; 9a97  .....,!.8GOU+...
	defb 0f8h,0f4h,0fch,0fah,0feh,0fdh,0feh,01eh,07eh,0fch,0fch,056h,0fch,0b8h,018h,0f0h	; 9aa7  ........~..V....
	defb 01fh,030h,03fh,03fh,07fh,0ffh,0ffh,0e3h,07ch,02bh,004h,003h,002h,003h,001h,000h	; 9ab7  .0??....|+......
	defb 0f0h,018h,0f8h,00ch,0fch,086h,0fch,0e4h,006h,01bh,066h,09dh,077h,0d6h,03ch,018h	; 9ac7  ..........f.w.<.
	defb 01fh,02fh,03fh,021h,06dh,09fh,081h,0bch,05fh,02fh,007h,003h,003h,002h,001h,000h	; 9ad7  ./?!m..._/......
	defb 0f0h,0e8h,0f8h,0f4h,0fch,0fah,0fch,01ch,0feh,0fdh,0fah,0efh,0b9h,0dah,024h,018h	; 9ae7  ..............$.

; ----------------------------------------------------------------------
; DATOS spr_9AF7: 4 sprites de 16 x 16 (32 bytes cada uno) que se copian al
;   dibujo 176; lo leen p00:5530 (128 bytes)
;   0x9af7..0x9b77  (128 bytes)
DATA_spr_9AF7:
	defb 00fh,017h,0e8h,0e7h,0d0h,0efh,0f0h,0efh,05fh,03fh,03fh,07fh,07dh,05dh,02bh,01fh	; 9af7  ........_??.}]+.
	defb 0e0h,0d0h,028h,0c8h,014h,0eeh,01fh,0ffh,0fbh,0feh,0fch,0dch,0dch,0b4h,0e8h,0f0h	; 9b07  ..(.............
	defb 00fh,018h,0ffh,03fh,07fh,07fh,0bfh,09fh,078h,027h,02fh,05bh,053h,073h,03fh,01fh	; 9b17  ...?....x'/[Ss?.
	defb 0e0h,030h,0f8h,0f8h,0fch,0feh,0f9h,0edh,035h,0cah,0ach,034h,034h,0fch,0f8h,0f0h	; 9b27  .0......5..44...
	defb 007h,00bh,014h,013h,028h,077h,0f8h,0ffh,0dfh,07fh,03fh,03bh,03bh,02dh,017h,00fh	; 9b37  ....(w....?..-..
	defb 0f0h,0e8h,017h,0e7h,00bh,0f7h,00fh,0f7h,0fah,0fch,0fch,0feh,0beh,0bah,0d4h,0f8h	; 9b47  ................
	defb 007h,00ch,01fh,01fh,03fh,07fh,09fh,0b7h,0ach,053h,035h,02ch,02ch,03fh,01fh,00fh	; 9b57  ....?....S5,,?..
	defb 0f0h,018h,0ffh,0fch,0feh,0feh,0fdh,0f9h,01eh,0e4h,0f4h,0dah,0cah,0ceh,0fch,0f8h	; 9b67  ................

; ----------------------------------------------------------------------
; DATOS spr_9B77: 2 sprites de 16 x 16 (32 bytes cada uno) que se copian al
;   dibujo 192; lo leen p00:5530 (64 bytes)
;   0x9b77..0x9bb7  (64 bytes)
DATA_spr_9B77:
	defb 037h,058h,0b7h,0fdh,0a7h,0b6h,0bdh,0f5h,067h,01fh,014h,022h,057h,04eh,03ch,046h	; 9b77  7X......g.."WN<F
	defb 0c0h,060h,078h,0f4h,072h,0f1h,0fah,0deh,096h,05ah,039h,04eh,0eah,072h,03eh,021h	; 9b87  .`x.r....Z9N.r>!
	defb 037h,06fh,0dah,0b7h,07fh,05bh,05eh,0beh,07ah,01fh,01bh,03fh,069h,07ah,034h,07ah	; 9b97  7o...[^.z..?iz4z
	defb 0c0h,0a0h,0d8h,09ch,0deh,02fh,027h,07dh,0f5h,0bfh,0efh,0feh,096h,05eh,02ah,03fh	; 9ba7  ...../'}.....^*?

; ----------------------------------------------------------------------
; DATOS spr_9BB7: 4 sprites de 16 x 16 (32 bytes cada uno) que se copian al
;   dibujo 208; lo leen p00:5530 (128 bytes)
;   0x9bb7..0x9c37  (128 bytes)
DATA_spr_9BB7:
	defb 00fh,010h,020h,070h,098h,08fh,0c7h,08fh,0dfh,0afh,0dfh,07fh,03fh,01fh,00fh,007h	; 9bb7  .. p........?...
	defb 0e0h,090h,048h,034h,01eh,0ffh,0ffh,07fh,0dfh,0ffh,0ffh,0ffh,0feh,0fch,0f8h,0f0h	; 9bc7  ..H4............
	defb 00fh,01fh,03fh,05fh,0efh,0f6h,0b8h,0f8h,0a8h,0deh,0bfh,06dh,036h,01bh,00ch,007h	; 9bd7  ..?_.......m6...
	defb 0e0h,0f0h,0f8h,0cch,0f2h,089h,01fh,08dh,02fh,00fh,0f5h,05bh,0beh,074h,0d8h,0f0h	; 9be7  ......../..[.t..
	defb 007h,00ch,014h,026h,04bh,095h,0bbh,0e3h,0d7h,0e6h,0ffh,0ffh,07fh,03fh,01fh,00fh	; 9bf7  ...&K........?..
	defb 0f0h,008h,004h,00eh,01bh,0e1h,0e7h,0efh,0bfh,0ffh,0ffh,0feh,0fch,0f8h,0f0h,0e0h	; 9c07  ................
	defb 007h,00bh,01bh,039h,07dh,0fah,0e4h,0dch,0ach,0f9h,09ch,0a7h,05bh,037h,01fh,00fh	; 9c17  ...9}.......[7..
	defb 0f0h,0f8h,0fch,0fah,0f5h,09fh,019h,011h,053h,035h,03bh,036h,0ech,0f8h,0f0h,0e0h	; 9c27  ........S5.6....

; ----------------------------------------------------------------------
; DATOS spr_9C37: 4 sprites de 16 x 16 (32 bytes cada uno) que se copian al
;   dibujo 224; lo leen p00:5530 (128 bytes)
;   0x9c37..0x9cb7  (128 bytes)
DATA_spr_9C37:
	defb 000h,000h,000h,000h,000h,003h,00ah,01fh,01fh,00fh,00fh,01fh,01fh,00bh,001h,000h	; 9c37  ................
	defb 000h,000h,000h,000h,000h,080h,070h,0b8h,0b8h,0b0h,060h,0f0h,0f0h,0a0h,000h,000h	; 9c47  ......p...`.....
	defb 000h,000h,000h,000h,003h,00ch,015h,020h,020h,010h,010h,020h,020h,014h,00ah,001h	; 9c57  .......  ..  ...
	defb 000h,000h,000h,000h,080h,070h,088h,044h,044h,048h,090h,008h,008h,050h,0a0h,000h	; 9c67  .....p.DDH...P..
	defb 000h,003h,037h,079h,077h,07fh,03fh,03fh,07fh,06fh,06fh,033h,00fh,007h,001h,000h	; 9c77  ..7yw.??.oo3....
	defb 000h,08ch,0deh,0feh,01ch,0e8h,0ech,0eeh,0deh,0f4h,0f8h,0f8h,0f8h,0b0h,000h,000h	; 9c87  ................
	defb 003h,034h,048h,086h,088h,080h,040h,040h,080h,090h,090h,04ch,030h,008h,006h,001h	; 9c97  .4H...@@...L0...
	defb 08ch,052h,021h,001h,0e2h,014h,012h,011h,021h,00ah,004h,004h,004h,048h,0f0h,000h	; 9ca7  .R!.....!....H..

; ----------------------------------------------------------------------
; DATOS spr_9CB7: 4 sprites de 16 x 16 (32 bytes cada uno) que se copian al
;   dibujo 240; lo leen p00:5530 (128 bytes)
;   0x9cb7..0x9d37  (128 bytes)
DATA_spr_9CB7:
	defb 000h,000h,000h,001h,011h,00dh,00ah,004h,038h,004h,00ah,00dh,011h,001h,000h,000h	; 9cb7  ........8.......
	defb 000h,000h,000h,000h,010h,060h,0a0h,040h,038h,040h,0a0h,060h,010h,000h,000h,000h	; 9cc7  .....`.@8@.`....
	defb 000h,000h,000h,000h,000h,000h,005h,003h,007h,003h,005h,000h,000h,000h,000h,000h	; 9cd7  ................
	defb 000h,000h,000h,000h,000h,000h,040h,080h,0c0h,080h,040h,000h,000h,000h,000h,000h	; 9ce7  ......@...@.....
	defb 001h,001h,041h,033h,02ch,010h,010h,020h,0e0h,020h,010h,010h,02ch,033h,041h,001h	; 9cf7  ..A3,.. . ..,3A.
	defb 000h,000h,004h,098h,068h,010h,010h,008h,00eh,008h,010h,010h,078h,098h,00ch,000h	; 9d07  ....h.......x...
	defb 000h,000h,000h,000h,013h,00fh,00fh,01fh,01fh,01fh,00fh,00fh,013h,000h,000h,000h	; 9d17  ................
	defb 000h,000h,000h,000h,090h,0e0h,0e0h,0f0h,0f0h,0f0h,0e0h,0e0h,080h,000h,000h,000h	; 9d27  ................

; ----------------------------------------------------------------------
; DATOS letreros_sitios: 2 punteros: el letrero de cada minijuego escondido;
;   lo leen p00:4BA5 (4 bytes)
;   0x9d37..0x9d3b  (4 bytes)
DATA_letreros_sitios:
	defw 09d3bh,09d49h	; 9d37  -> DATA_letrero_sitio1 DATA_letrero_sitio2

; ----------------------------------------------------------------------
; DATOS letrero_sitio1: letrero (del sitio escondido 1): [x][y] y caracteres,
;   0xFE [x][y] otro sitio, 0xFF acaba; lo leen p00:51D6 (14 bytes)
;   0x9d3b..0x9d49  (14 bytes)
DATA_letrero_sitio1:
	defb 050h,050h,0edh,0f5h,0f3h,0e9h,0e3h,000h,0f3h,0f4h,0e1h,0e7h,0e5h,0ffh	; 9d3b  PP............

; ----------------------------------------------------------------------
; DATOS letrero_sitio2: letrero (del sitio escondido 2): [x][y] y caracteres,
;   0xFE [x][y] otro sitio, 0xFF acaba; lo leen p00:51D6 (15 bytes)
;   0x9d49..0x9d58  (15 bytes)
DATA_letrero_sitio2:
	defb 048h,050h,0f0h,0f5h,0fah,0fah,0ech,0e5h,000h,0f3h,0f4h,0e1h,0e7h,0e5h,0ffh	; 9d49  HP.............

; ----------------------------------------------------------------------
; DATOS columnas_27: 47 punteros a columnas de 27 caracteres (32 seguidas
;   desde la que se pide: 0, 4 o 0x0F); lo leen p00:59FF (94 bytes)
;   0x9d58..0x9db6  (94 bytes)
DATA_columnas_27:
	defw 09db8h,09dd3h,09deeh,09e09h,09e24h,09e3fh,09e5ah,09e75h	; 9d58
	defw 09e90h,09eabh,09ec6h,09ee1h,09efch,09f17h,09f32h,09f4dh	; 9d68
	defw 09f68h,09f83h,09f9eh,09fb9h,09fd4h,09fefh,0a00ah,0a025h	; 9d78
	defw 0a040h,0a05bh,0a076h,0a091h,0a0ach,0a0c7h,0a0e2h,0a0fdh	; 9d88
	defw 0a118h,0a133h,0a14eh,0a169h,0a184h,0a19fh,0a1bah,0a1d5h	; 9d98
	defw 0a1f0h,0a20bh,0a226h,0a241h,0a25ch,0a277h,0a292h	; 9da8

; ----------------------------------------------------------------------
; DATOS sin identificar  0x9db6..0x9db8  (2 bytes)
DATA_9DB6:
	defb 0adh,0a2h	; 9db6

; ----------------------------------------------------------------------
; DATOS col27_00: columna de 27 caracteres; lo leen p00:5742 (27 bytes)
;   0x9db8..0x9dd3  (27 bytes)
DATA_col27_00:
	defb 0a1h,0a0h,0a0h,05dh,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,063h,083h,083h,07ch,095h,000h,08ch,081h,09eh,0a6h,064h,07eh,09eh	; 9db8  ...]..........c..|......d~.

; ----------------------------------------------------------------------
; DATOS col27_01: columna de 27 caracteres; lo leen p00:5742 (27 bytes)
;   0x9dd3..0x9dee  (27 bytes)
DATA_col27_01:
	defb 06ah,0a1h,06dh,05dh,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,063h,083h,083h,075h,08ah,000h,087h,081h,09eh,0a6h,064h,07eh,09eh	; 9dd3  j.m]..........c..u......d~.

; ----------------------------------------------------------------------
; DATOS col27_02: columna de 27 caracteres; lo leen p00:5742 (27 bytes)
;   0x9dee..0x9e09  (27 bytes)
DATA_col27_02:
	defb 09fh,0a2h,06eh,05eh,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,063h,083h,083h,083h,08eh,095h,087h,081h,09eh,0a6h,064h,07eh,09eh	; 9dee  ..n^..........c.........d~.

; ----------------------------------------------------------------------
; DATOS col27_03: columna de 27 caracteres; lo leen p00:5742 (27 bytes)
;   0x9e09..0x9e24  (27 bytes)
DATA_col27_03:
	defb 09dh,06dh,06fh,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,063h,083h,083h,07ch,08eh,095h,087h,081h,09eh,0a6h,064h,07eh,09eh	; 9e09  .mo...........c..|......d~.

; ----------------------------------------------------------------------
; DATOS col27_04: columna de 27 caracteres; lo leen p00:5742 (27 bytes)
;   0x9e24..0x9e3f  (27 bytes)
DATA_col27_04:
	defb 06dh,06eh,07dh,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,063h,083h,075h,065h,095h,095h,087h,081h,09eh,0a6h,064h,07eh,09eh	; 9e24  mn}...........c.ue......d~.

; ----------------------------------------------------------------------
; DATOS col27_05: columna de 27 caracteres; lo leen p00:5742 (27 bytes)
;   0x9e3f..0x9e5a  (27 bytes)
DATA_col27_05:
	defb 09ch,07fh,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,063h,083h,083h,07ch,095h,095h,087h,081h,09eh,0a6h,064h,07eh,09eh	; 9e3f  ..............c..|......d~.

; ----------------------------------------------------------------------
; DATOS col27_06: columna de 27 caracteres; lo leen p00:5742 (27 bytes)
;   0x9e5a..0x9e75  (27 bytes)
DATA_col27_06:
	defb 07dh,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,063h,083h,075h,08ah,000h,000h,087h,081h,09eh,0a6h,064h,07eh,09eh	; 9e5a  }.............c.u.......d~.

; ----------------------------------------------------------------------
; DATOS col27_07: columna de 27 caracteres; lo leen p00:5742 (27 bytes)
;   0x9e75..0x9e90  (27 bytes)
DATA_col27_07:
	defb 0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,063h,083h,083h,083h,08ah,000h,087h,081h,09eh,0a6h,064h,07eh,09eh	; 9e75  ..............c.........d~.

; ----------------------------------------------------------------------
; DATOS col27_08: columna de 27 caracteres; lo leen p00:5742 (27 bytes)
;   0x9e90..0x9eab  (27 bytes)
DATA_col27_08:
	defb 0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,063h,083h,083h,083h,083h,096h,087h,081h,09eh,0a6h,064h,07eh,09eh	; 9e90  ..............c.........d~.

; ----------------------------------------------------------------------
; DATOS col27_09: columna de 27 caracteres; lo leen p00:5742 (27 bytes)
;   0x9eab..0x9ec6  (27 bytes)
DATA_col27_09:
	defb 0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,063h,083h,083h,083h,083h,000h,087h,081h,09eh,0a6h,064h,07eh,09eh	; 9eab  ..............c.........d~.

; ----------------------------------------------------------------------
; DATOS col27_10: columna de 27 caracteres; lo leen p00:5742 (27 bytes)
;   0x9ec6..0x9ee1  (27 bytes)
DATA_col27_10:
	defb 0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,063h,083h,083h,083h,08dh,08ch,087h,081h,09eh,0a6h,064h,07eh,09eh	; 9ec6  ..............c.........d~.

; ----------------------------------------------------------------------
; DATOS col27_11: columna de 27 caracteres; lo leen p00:5742 (27 bytes)
;   0x9ee1..0x9efc  (27 bytes)
DATA_col27_11:
	defb 0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,063h,083h,083h,083h,05fh,095h,087h,081h,09eh,0a6h,064h,07eh,09eh	; 9ee1  ..............c..._.....d~.

; ----------------------------------------------------------------------
; DATOS col27_12: columna de 27 caracteres; lo leen p00:5742 (27 bytes)
;   0x9efc..0x9f17  (27 bytes)
DATA_col27_12:
	defb 0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,063h,083h,083h,08dh,08eh,095h,087h,081h,09eh,0a6h,064h,07eh,09eh	; 9efc  ..............c.........d~.

; ----------------------------------------------------------------------
; DATOS col27_13: columna de 27 caracteres; lo leen p00:5742 (27 bytes)
;   0x9f17..0x9f32  (27 bytes)
DATA_col27_13:
	defb 0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,063h,083h,083h,08eh,095h,095h,087h,081h,09eh,0a6h,064h,07eh,09eh	; 9f17  ..............c.........d~.

; ----------------------------------------------------------------------
; DATOS col27_14: columna de 27 caracteres; lo leen p00:5742 (27 bytes)
;   0x9f32..0x9f4d  (27 bytes)
DATA_col27_14:
	defb 0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,063h,07bh,065h,095h,095h,095h,087h,081h,09eh,0a6h,064h,07eh,09eh	; 9f32  ..............c{e.......d~.

; ----------------------------------------------------------------------
; DATOS col27_15: columna de 27 caracteres; lo leen p00:5742 (27 bytes)
;   0x9f4d..0x9f68  (27 bytes)
DATA_col27_15:
	defb 0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,063h,07ch,06ah,095h,000h,000h,087h,081h,09eh,0a6h,064h,07eh,09eh	; 9f4d  ..............c|j.......d~.

; ----------------------------------------------------------------------
; DATOS col27_16: columna de 27 caracteres; lo leen p00:5742 (27 bytes)
;   0x9f68..0x9f83  (27 bytes)
DATA_col27_16:
	defb 0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,063h,07bh,08ah,000h,095h,000h,087h,081h,09eh,0a6h,064h,07eh,09eh	; 9f68  ..............c{........d~.

; ----------------------------------------------------------------------
; DATOS col27_17: columna de 27 caracteres; lo leen p00:5742 (27 bytes)
;   0x9f83..0x9f9e  (27 bytes)
DATA_col27_17:
	defb 0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,063h,083h,083h,08ah,000h,000h,087h,081h,09eh,0a6h,064h,07eh,09eh	; 9f83  ..............c.........d~.

; ----------------------------------------------------------------------
; DATOS col27_18: columna de 27 caracteres; lo leen p00:5742 (27 bytes)
;   0x9f9e..0x9fb9  (27 bytes)
DATA_col27_18:
	defb 0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,063h,083h,083h,083h,000h,000h,087h,081h,09eh,064h,064h,07eh,09eh	; 9f9e  ..............c........dd~.

; ----------------------------------------------------------------------
; DATOS col27_19: columna de 27 caracteres; lo leen p00:5742 (27 bytes)
;   0x9fb9..0x9fd4  (27 bytes)
DATA_col27_19:
	defb 0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,063h,083h,083h,083h,096h,095h,087h,081h,09eh,064h,064h,07eh,09eh	; 9fb9  ..............c........dd~.

; ----------------------------------------------------------------------
; DATOS col27_20: columna de 27 caracteres; lo leen p00:5742 (27 bytes)
;   0x9fd4..0x9fef  (27 bytes)
DATA_col27_20:
	defb 0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,063h,083h,083h,0a7h,095h,000h,087h,081h,09eh,064h,064h,07eh,09eh	; 9fd4  ..............c........dd~.

; ----------------------------------------------------------------------
; DATOS col27_21: columna de 27 caracteres (sigue en el banco 15, en 0xA000);
;   lo leen p00:5742 (17 bytes)
;   0x9fef..0xa000  (17 bytes)
DATA_col27_21:
	defb 0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,0a5h,063h,083h,075h	; 9fef  ..............c.u
