; ==========================================================================
; KING'S VALLEY II - Konami (1988) - MSX - MegaROM RC-760 de 128 KB (Konami SCC) - banco 07 (se ejecuta en 0x6000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x06000


; ----------------------------------------------------------------------
; DATOS graf_6000: 1 fichas de 6 bytes [tercios][colores][caracter][patrones]
;   (lo comun a las piramides), un 0 acaba: rachas a las tablas de patrones y
;   colores de cada tercio marcado; lo leen p00:5033 (7 bytes)
;   0x6000..0x6007  (7 bytes)
DATA_graf_6000:
	defb 007h,073h,060h,05dh,0e7h,063h	; 6000
	defb 000h	; 6006

; ----------------------------------------------------------------------
; DATOS graficos_piramides: 6 punteros, uno por piramide (0xE241, desde
;   0x6005: la entrada 0 son los dos ultimos bytes de la lista de delante); lo
;   leen p00:530C (12 bytes)
;   0x6007..0x6013  (12 bytes)
DATA_graficos_piramides:
	defw 06013h,06026h,06039h,06046h,06053h,06066h	; 6007

; ----------------------------------------------------------------------
; DATOS graf_pir1: 3 fichas de 6 bytes [tercios][colores][caracter][patrones]
;   (la piramide 1), un 0 acaba: rachas a las tablas de patrones y colores de
;   cada tercio marcado; lo leen p00:5033 (19 bytes)
;   0x6013..0x6026  (19 bytes)
DATA_graf_pir1:
	defb 007h,047h,066h,001h,06dh,069h	; 6013
	defb 007h,0d8h,068h,005h,019h,06bh	; 6019
	defb 007h,0dah,063h,001h,044h,066h	; 601f
	defb 000h	; 6025

; ----------------------------------------------------------------------
; DATOS graf_pir2: 3 fichas de 6 bytes [tercios][colores][caracter][patrones]
;   (la piramide 2), un 0 acaba: rachas a las tablas de patrones y colores de
;   cada tercio marcado; lo leen p00:5033 (19 bytes)
;   0x6026..0x6039  (19 bytes)
DATA_graf_pir2:
	defb 007h,0b3h,06bh,001h,099h,06eh	; 6026
	defb 007h,004h,06eh,005h,042h,070h	; 602c
	defb 007h,0dah,063h,001h,044h,066h	; 6032
	defb 000h	; 6038

; ----------------------------------------------------------------------
; DATOS graf_pir3: 2 fichas de 6 bytes [tercios][colores][caracter][patrones]
;   (la piramide 3), un 0 acaba: rachas a las tablas de patrones y colores de
;   cada tercio marcado; lo leen p00:5033 (13 bytes)
;   0x6039..0x6046  (13 bytes)
DATA_graf_pir3:
	defb 007h,0d9h,070h,001h,03bh,073h	; 6039
	defb 007h,0dah,063h,001h,044h,066h	; 603f
	defb 000h	; 6045

; ----------------------------------------------------------------------
; DATOS graf_pir4: 2 fichas de 6 bytes [tercios][colores][caracter][patrones]
;   (la piramide 4), un 0 acaba: rachas a las tablas de patrones y colores de
;   cada tercio marcado; lo leen p00:5033 (13 bytes)
;   0x6046..0x6053  (13 bytes)
DATA_graf_pir4:
	defb 007h,0a4h,074h,001h,05bh,076h	; 6046
	defb 007h,0dah,063h,001h,044h,066h	; 604c
	defb 000h	; 6052

; ----------------------------------------------------------------------
; DATOS graf_pir5: 3 fichas de 6 bytes [tercios][colores][caracter][patrones]
;   (la piramide 5), un 0 acaba: rachas a las tablas de patrones y colores de
;   cada tercio marcado; lo leen p00:5033 (19 bytes)
;   0x6053..0x6066  (19 bytes)
DATA_graf_pir5:
	defb 007h,09ah,077h,001h,06bh,07ah	; 6053
	defb 007h,0e8h,079h,04dh,019h,07ch	; 6059
	defb 007h,0dah,063h,001h,044h,066h	; 605f
	defb 000h	; 6065

; ----------------------------------------------------------------------
; DATOS graf_pir6: 2 fichas de 6 bytes [tercios][colores][caracter][patrones]
;   (la piramide 6), un 0 acaba: rachas a las tablas de patrones y colores de
;   cada tercio marcado; lo leen p00:5033 (13 bytes)
;   0x6066..0x6073  (13 bytes)
DATA_graf_pir6:
	defb 007h,0aah,07ch,003h,018h,07fh	; 6066
	defb 007h,0dah,063h,001h,044h,066h	; 606c
	defb 000h	; 6072

; ----------------------------------------------------------------------
; DATOS rachas_6073: rachas a la VRAM (colores de lo comun a las piramides):
;   [n < 0x80] repite el byte siguiente, [0x80 + n] copia n, [0x80] otro
;   destino, 0 acaba; lo leen p00:5033 (871 bytes)
;   0x6073..0x63da  (871 bytes)
DATA_rachas_6073:
	defb 0b3h,000h,06dh,040h,000h,040h,040h,000h,040h,000h,0b6h,002h,000h,002h,002h,000h	; 6073  ..m@.@@.@.......
	defb 002h,040h,000h,040h,040h,000h,040h,040h,000h,0ffh,03ch,066h,018h,018h,066h,03ch	; 6083  .@.@@.@@..<f..f<
	defb 0ffh,038h,07ch,0fah,0fah,0b2h,044h,038h,000h,0feh,0feh,082h,0bah,082h,0feh,000h	; 6093  .8|...D8........
	defb 000h,080h,0c0h,0fch,003h,0feh,085h,03eh,0dch,000h,001h,01fh,003h,03fh,082h,03eh	; 60a3  .......>.....?.>
	defb 01dh,007h,001h,08ch,000h,00fh,003h,00dh,01dh,038h,030h,040h,0ffh,003h,003h,00fh	; 60b3  .........80@....
	defb 005h,003h,003h,000h,081h,001h,004h,003h,08ah,002h,004h,003h,007h,00fh,00eh,00ch	; 60c3  ................
	defb 01ch,018h,018h,006h,000h,090h,001h,003h,036h,078h,076h,0eeh,0fch,070h,000h,0fch	; 60d3  ........6xv..p..
	defb 0e0h,080h,000h,040h,0c0h,060h,003h,000h,08dh,060h,0b0h,0b8h,0b8h,05ch,05ch,02eh	; 60e3  ...@.`...`...\\.
	defb 02eh,017h,017h,00bh,00ch,003h,003h,000h,085h,0feh,0ffh,0ffh,003h,0feh,003h,000h	; 60f3  ................
	defb 088h,080h,0c0h,000h,0c0h,000h,0e0h,0c0h,080h,003h,000h,082h,0ffh,000h,006h,0c0h	; 6103  ................
	defb 086h,040h,080h,0c0h,000h,0f0h,000h,004h,0c0h,003h,0feh,002h,0fch,0a3h,0f8h,0e1h	; 6113  .@..............
	defb 003h,000h,0f0h,038h,0d8h,01ch,05ch,05ch,0dch,0fch,0c8h,0f8h,0c8h,0f8h,090h,0f0h	; 6123  ...8..\\........
	defb 0e0h,0b8h,078h,074h,004h,07ch,0a4h,0bch,064h,000h,07ch,040h,058h,0c4h,0d4h,0d8h	; 6133  ..xt.|..d.|@X...
	defb 0dch,003h,0f8h,002h,078h,002h,070h,086h,060h,0ech,0f0h,070h,080h,0e8h,003h,0f4h	; 6143  ....x.p.`..p....
	defb 0aah,000h,0bch,030h,02ch,022h,0aah,02ch,0aeh,03ch,0bch,03ch,0bch,038h,0b8h,038h	; 6153  ...0,".,.<.<.8.8
	defb 0b0h,036h,0b8h,018h,0a4h,034h,0bah,03ah,0bah,000h,01fh,038h,037h,031h,077h,076h	; 6163  .6...4.:...871wv
	defb 073h,03bh,03ch,05dh,061h,07dh,07bh,07bh,07ch,07eh,07fh,003h,03fh,002h,01fh,081h	; 6173  s.<]a}{{|~..?...
	defb 00fh,007h,000h,081h,055h,007h,000h,0deh,054h,000h,06ah,075h,06ah,075h,06ah,075h	; 6183  ....U...T.jujuju
	defb 06ah,000h,0aeh,056h,0aeh,056h,0aeh,056h,0aeh,075h,06ah,075h,06ah,075h,06ah,075h	; 6193  j..V.V.V.ujujuju
	defb 06ah,056h,0aeh,056h,0aeh,056h,0aeh,056h,0aeh,074h,069h,072h,065h,06ah,05fh,03fh	; 61a3  jV.V.V.V.tirej_?
	defb 000h,0aah,055h,0aah,055h,0aah,0ffh,0ffh,000h,056h,02eh,096h,04eh,0a6h,0fah,0fch	; 61b3  ..U.U....V..N...
	defb 000h,0ffh,0ffh,0d5h,0a8h,0d0h,0a0h,0d0h,0a0h,0c0h,0a0h,0c0h,080h,0aah,0d5h,0aah	; 61c3  ................
	defb 000h,002h,000h,002h,002h,000h,002h,002h,000h,0ffh,0feh,0f8h,0f4h,0f8h,0f4h,0f8h	; 61d3  ................
	defb 0f4h,03fh,078h,0e0h,0c0h,0c0h,003h,080h,08dh,0f8h,0f4h,0e8h,0d4h,0a8h,055h,0aah	; 61e3  .?x...........U.
	defb 000h,003h,0e1h,0f8h,0fch,0fch,003h,0feh,003h,07fh,002h,03fh,0b3h,01fh,087h,0c0h	; 61f3  ...........?....
	defb 000h,01fh,010h,020h,024h,04ah,044h,04ah,044h,04ah,044h,04ah,044h,04ah,044h,04ah	; 6203  ... $JDJDJDJDJDJ
	defb 044h,04ah,024h,022h,025h,012h,010h,01fh,000h,01fh,010h,020h,025h,04ah,045h,04ah	; 6213  DJ$"%...... %JEJ
	defb 045h,04ah,045h,04ah,045h,04ah,045h,04ah,045h,04ah,025h,022h,025h,012h,010h,01fh	; 6223  EJEJEJEJEJ%"%...
	defb 003h,000h,085h,003h,00fh,01fh,01fh,03fh,003h,000h,085h,0c0h,0f0h,0e8h,0e8h,0f4h	; 6233  .......?........
	defb 003h,03fh,0a7h,01fh,013h,00ch,003h,000h,0f4h,0e4h,0e4h,0c8h,008h,030h,0c0h,000h	; 6243  .?...........0..
	defb 07fh,07fh,060h,060h,067h,077h,07bh,06dh,0feh,0feh,006h,006h,0f6h,0eeh,0deh,0b6h	; 6253  ..``gw{m........
	defb 066h,063h,061h,065h,065h,063h,066h,06ch,066h,0c6h,003h,096h,08bh,0d6h,066h,036h	; 6263  fcaeecflf.....f6
	defb 060h,030h,030h,018h,018h,00ch,00ch,006h,003h,0ffh,002h,000h,094h,001h,003h,007h	; 6273  `00.............
	defb 0ffh,030h,078h,0cch,086h,0c6h,0ech,0f8h,008h,01ch,036h,023h,036h,03ch,060h,0c0h	; 6283  .0x.......6#6<`.
	defb 080h,007h,000h,082h,0a5h,0bdh,003h,099h,093h,0bdh,0a5h,0e7h,079h,073h,067h,067h	; 6293  ............ysgg
	defb 060h,07fh,07fh,000h,09eh,0ceh,0e6h,0f6h,006h,0feh,0feh,000h,007h,00eh,089h,006h	; 62a3  `...............
	defb 0f0h,010h,010h,0d0h,0d0h,010h,0f0h,0e0h,007h,07fh,099h,03fh,0dch,0c4h,0c4h,0d4h	; 62b3  ...........?....
	defb 0d4h,0c4h,0dch,0d8h,001h,001h,003h,003h,007h,007h,00fh,00fh,080h,080h,0c0h,0c0h	; 62c3  ................
	defb 0e0h,0e0h,0f0h,0f0h,003h,07fh,08ah,078h,07ch,06eh,067h,063h,061h,064h,066h,067h	; 62d3  .......x|ngcadfg
	defb 067h,005h,07fh,08bh,060h,067h,067h,066h,064h,061h,063h,067h,06eh,07ch,078h,004h	; 62e3  g...`ggfdacgn|x.
	defb 07fh,002h,0feh,002h,006h,088h,0f6h,076h,0b6h,086h,076h,0f6h,006h,006h,003h,0feh	; 62f3  .......v..v.....
	defb 084h,070h,076h,072h,074h,003h,072h,081h,074h,003h,072h,081h,074h,003h,072h,081h	; 6303  .pvrt.r.t.r.t.r.
	defb 074h,003h,072h,084h,074h,072h,076h,070h,003h,0ffh,002h,081h,089h,09dh,0cbh,0cbh	; 6313  t.r.trvp........
	defb 0e7h,0cbh,0cbh,09dh,09dh,081h,003h,0ffh,084h,0e0h,0e8h,0e8h,0e0h,003h,0e8h,081h	; 6323  ................
	defb 0e0h,003h,0e8h,081h,0e0h,003h,0e8h,081h,0e0h,003h,0e8h,085h,0e0h,0e8h,0e8h,0e0h	; 6333  ................
	defb 000h,007h,070h,089h,060h,00fh,008h,008h,00bh,00bh,008h,00fh,007h,007h,0feh,099h	; 6343  ..p.`...........
	defb 0fch,03bh,023h,023h,02bh,02bh,023h,03bh,01bh,01fh,01fh,03fh,03fh,07fh,07fh,0ffh	; 6353  ..##++#....??...
	defb 0ffh,0f8h,0f8h,0fch,0fch,0feh,0feh,0ffh,0ffh,003h,0feh,08ah,01eh,03eh,076h,0e6h	; 6363  .............>v.
	defb 0c6h,086h,026h,066h,0e6h,0e6h,005h,0feh,08bh,006h,0e6h,0e6h,066h,026h,086h,0c6h	; 6373  ..&f........f&..
	defb 0e6h,076h,03eh,01eh,004h,0feh,002h,07fh,002h,060h,088h,06fh,06eh,06dh,061h,06eh	; 6383  .v>......`.onman
	defb 06fh,060h,060h,003h,07fh,084h,00eh,06eh,04eh,02eh,003h,04eh,081h,02eh,003h,04eh	; 6393  o``....nN..N...N
	defb 081h,02eh,003h,04eh,081h,02eh,003h,04eh,092h,02eh,04eh,06eh,00eh,000h,0ffh,0ffh	; 63a3  ...N...N..Nn....
	defb 081h,081h,0b9h,0d3h,0d3h,0e7h,0cbh,0cbh,09dh,09dh,081h,003h,0ffh,084h,007h,017h	; 63b3  ................
	defb 017h,007h,003h,017h,081h,007h,003h,017h,081h,007h,003h,017h,081h,007h,003h,017h	; 63c3  ................
	defb 085h,007h,017h,017h,007h,000h,000h	; 63d3

; ----------------------------------------------------------------------
; DATOS rachas_63DA: rachas a la VRAM (colores de la piramide 1): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:5033 (13 bytes)
;   0x63da..0x63e7  (13 bytes)
DATA_rachas_63DA:
	defb 083h,060h,06fh,06fh,005h,060h,083h,006h,0f6h,0f6h,005h,006h,000h	; 63da  .`oo.`.......

; ----------------------------------------------------------------------
; DATOS rachas_63E7: rachas a la VRAM (patrones de lo comun a las piramides):
;   [n < 0x80] repite el byte siguiente, [0x80 + n] copia n, [0x80] otro
;   destino, 0 acaba; lo leen p00:5033 (403 bytes)
;   0x63e7..0x657a  (403 bytes)
DATA_rachas_63E7:
	defb 018h,0e1h,089h,011h,0f1h,0f1h,061h,061h,0e1h,0e1h,011h,0f1h,007h,0e1h,081h,0f1h	; 63e7  ......aa........
	defb 007h,0e1h,002h,0f1h,08eh,0e1h,0f1h,0f1h,0e1h,0e1h,051h,0f1h,0f1h,0e1h,0f1h,0f1h	; 63f7  ..........Q.....
	defb 0e1h,0e1h,051h,006h,0f1h,002h,0e1h,08dh,0f1h,0e1h,0e1h,041h,0e1h,041h,0f1h,011h	; 6407  ..Q........A.A..
	defb 091h,061h,091h,041h,0e1h,003h,0f1h,005h,091h,08dh,061h,091h,061h,091h,091h,0f1h	; 6417  .a.A......a.a...
	defb 0e1h,051h,0e1h,0f1h,0e1h,051h,0e1h,008h,091h,009h,0f1h,082h,0e1h,0a1h,003h,091h	; 6427  .Q...Q..........
	defb 004h,0b1h,00ch,0a1h,004h,0b1h,004h,0a1h,008h,061h,006h,0e1h,081h,011h,009h,0e1h	; 6437  .........a......
	defb 004h,061h,081h,041h,00dh,051h,08ch,041h,051h,041h,051h,041h,051h,041h,051h,041h	; 6447  .a.A.Q.AQAQAQAQA
	defb 051h,041h,051h,003h,041h,086h,051h,041h,051h,041h,051h,041h,003h,051h,08ch,041h	; 6457  QAQ.A.QAQAQA.Q.A
	defb 051h,041h,051h,041h,051h,041h,051h,041h,051h,041h,051h,003h,041h,086h,051h,041h	; 6467  QAQAQAQAQAQ.A.QA
	defb 051h,041h,051h,041h,003h,051h,08ch,041h,051h,041h,051h,041h,051h,041h,051h,041h	; 6477  QAQA.Q.AQAQAQAQA
	defb 051h,041h,051h,003h,041h,09dh,051h,041h,051h,041h,051h,041h,051h,071h,071h,041h	; 6487  QAQ.A.QAQAQAQqqA
	defb 071h,041h,071h,041h,071h,041h,071h,041h,071h,041h,071h,041h,071h,041h,071h,041h	; 6497  qAqAqAqAqAqAqAqA
	defb 071h,041h,071h,04ah,041h,002h,0ffh,00ah,0f7h,084h,075h,054h,041h,041h,008h,0e1h	; 64a7  qAqJA.....uTAA..
	defb 002h,0f5h,013h,075h,083h,054h,041h,041h,010h,054h,030h,071h,004h,0a1h,081h,0b1h	; 64b7  ...u.TAA.T0q....
	defb 003h,0f1h,004h,0b1h,003h,0f1h,003h,0b1h,002h,0a1h,081h,091h,003h,0a1h,084h,0b1h	; 64c7  ................
	defb 0a1h,0a1h,091h,005h,0a1h,007h,091h,081h,0a1h,01fh,091h,003h,011h,005h,0f1h,081h	; 64d7  ................
	defb 011h,007h,0f1h,01eh,091h,081h,061h,007h,091h,081h,061h,009h,0f1h,007h,0e1h,081h	; 64e7  ......a...a.....
	defb 051h,007h,0f1h,081h,051h,008h,0e1h,092h,0f1h,091h,0f1h,091h,0f1h,091h,0f1h,091h	; 64f7  Q...Q...........
	defb 0a1h,061h,0a1h,061h,0a1h,061h,0a1h,061h,011h,071h,00bh,051h,081h,071h,003h,051h	; 6507  .a.a.a.a.q.Q.q.Q
	defb 081h,041h,00ch,051h,084h,041h,011h,011h,071h,00ch,051h,083h,041h,011h,0a1h,015h	; 6517  .A.Q.A..q.Q.A...
	defb 091h,084h,081h,011h,0a9h,099h,00bh,091h,084h,096h,066h,011h,091h,017h,061h,008h	; 6527  ..........f...a.
	defb 0f1h,007h,0e1h,081h,051h,007h,0f1h,081h,051h,008h,0e1h,092h,0f1h,091h,0f1h,091h	; 6537  ....Q...Q.......
	defb 0f1h,091h,0fah,096h,0a1h,061h,0a1h,061h,0a1h,061h,0a5h,065h,011h,071h,00bh,051h	; 6547  .....a.a.a.e.q.Q
	defb 081h,071h,003h,051h,081h,041h,00ch,051h,084h,041h,011h,011h,071h,00ch,051h,083h	; 6557  .q.Q.A.Q.A..q.Q.
	defb 041h,011h,0a1h,015h,091h,002h,081h,082h,0a9h,099h,00ch,091h,083h,061h,011h,091h	; 6567  A............a..
	defb 017h,061h,000h	; 6577

; ----------------------------------------------------------------------
; DATOS rachas_657A: rachas a la VRAM (un paso de los caracteres animados): [n
;   < 0x80] repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino,
;   0 acaba; lo leen p00:4EB9 (26 bytes)
;   0x657a..0x6594  (26 bytes)
DATA_rachas_657A:
	defb 004h,0a1h,081h,0b1h,003h,0f1h,004h,0b1h,003h,0f1h,003h,0b1h,002h,0a1h,081h,091h	; 657a  ................
	defb 003h,0a1h,084h,0b1h,0a1h,0a1h,091h,004h,0a1h,000h	; 658a  ..........

; ----------------------------------------------------------------------
; DATOS rachas_6594: rachas a la VRAM (un paso de los caracteres animados): [n
;   < 0x80] repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino,
;   0 acaba; lo leen p00:4EB9 (24 bytes)
;   0x6594..0x65ac  (24 bytes)
DATA_rachas_6594:
	defb 006h,0f1h,002h,0b1h,005h,0f1h,002h,0b1h,003h,0a1h,083h,091h,0a1h,0a1h,003h,091h	; 6594  ................
	defb 084h,0a1h,091h,0a1h,0a1h,004h,091h,000h	; 65a4  ........

; ----------------------------------------------------------------------
; DATOS rachas_65AC: rachas a la VRAM (un paso de los caracteres animados): [n
;   < 0x80] repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino,
;   0 acaba; lo leen p00:4EB9 (23 bytes)
;   0x65ac..0x65c3  (23 bytes)
DATA_rachas_65AC:
	defb 004h,0f1h,002h,0b1h,002h,0a1h,005h,0b1h,002h,0a1h,002h,091h,002h,0a1h,003h,091h	; 65ac  ................
	defb 004h,0a1h,003h,091h,003h,0a1h,000h	; 65bc

; ----------------------------------------------------------------------
; DATOS rachas_65C3: rachas a la VRAM (un paso de los caracteres animados): [n
;   < 0x80] repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino,
;   0 acaba; lo leen p00:4EB9 (27 bytes)
;   0x65c3..0x65de  (27 bytes)
DATA_rachas_65C3:
	defb 004h,0b1h,002h,0a1h,081h,091h,006h,0a1h,081h,091h,003h,0a1h,003h,091h,002h,0a1h	; 65c3  ................
	defb 002h,0b1h,003h,091h,002h,0a1h,083h,0b1h,0f1h,0f1h,000h	; 65d3  ...........

; ----------------------------------------------------------------------
; DATOS rachas_65DE: rachas a la VRAM (un paso de los caracteres animados): [n
;   < 0x80] repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino,
;   0 acaba; lo leen p00:4EB9 (26 bytes)
;   0x65de..0x65f8  (26 bytes)
DATA_rachas_65DE:
	defb 004h,0a1h,083h,091h,0a1h,0a1h,005h,091h,002h,0a1h,004h,091h,002h,0a1h,081h,0b1h	; 65de  ................
	defb 003h,0f1h,084h,091h,0a1h,0a1h,0b1h,004h,0f1h,000h	; 65ee  ..........

; ----------------------------------------------------------------------
; DATOS rachas_65F8: rachas a la VRAM (un paso de los caracteres animados): [n
;   < 0x80] repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino,
;   0 acaba; lo leen p00:4EB9 (24 bytes)
;   0x65f8..0x6610  (24 bytes)
DATA_rachas_65F8:
	defb 005h,0a1h,003h,091h,004h,0a1h,003h,091h,003h,0a1h,081h,0b1h,003h,0f1h,002h,0b1h	; 65f8  ................
	defb 082h,0a1h,0b1h,003h,0f1h,003h,0b1h,000h	; 6608  ........

; ----------------------------------------------------------------------
; DATOS rachas_6610: rachas a la VRAM (un paso de los caracteres animados): [n
;   < 0x80] repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino,
;   0 acaba; lo leen p00:4EB9 (23 bytes)
;   0x6610..0x6627  (23 bytes)
DATA_rachas_6610:
	defb 006h,091h,002h,0a1h,005h,091h,002h,0a1h,002h,0b1h,003h,0f1h,002h,0b1h,002h,0a1h	; 6610  ................
	defb 003h,0f1h,002h,0b1h,003h,0a1h,000h	; 6620

; ----------------------------------------------------------------------
; DATOS rachas_6627: rachas a la VRAM (un paso de los caracteres animados): [n
;   < 0x80] repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino,
;   0 acaba; lo leen p00:4EB9 (29 bytes)
;   0x6627..0x6644  (29 bytes)
DATA_rachas_6627:
	defb 004h,091h,002h,0a1h,082h,0b1h,0f1h,005h,0a1h,081h,0b1h,004h,0f1h,002h,0b1h,002h	; 6627  ................
	defb 0a1h,002h,091h,088h,0f1h,0b1h,0b1h,0a1h,0a1h,091h,0a1h,0f1h,000h	; 6637  .............

; ----------------------------------------------------------------------
; DATOS rachas_6644: rachas a la VRAM (patrones de la piramide 1): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:5033 (3 bytes)
;   0x6644..0x6647  (3 bytes)
DATA_rachas_6644:
	defb 010h,0a1h,000h	; 6644

; ----------------------------------------------------------------------
; DATOS rachas_6647: rachas a la VRAM (colores de la piramide 1): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:5033 (657 bytes)
;   0x6647..0x68d8  (657 bytes)
DATA_rachas_6647:
	defb 002h,000h,085h,030h,062h,07fh,03fh,002h,003h,000h,085h,00ch,046h,0feh,0fch,040h	; 6647  ...0b.?.....F..@
	defb 003h,000h,085h,030h,062h,07fh,03fh,002h,003h,000h,087h,00ch,046h,0feh,0fch,040h	; 6657  ...0b.?.....F..@
	defb 000h,082h,006h,0feh,085h,082h,080h,0c4h,0f0h,0f8h,003h,0feh,0d1h,082h,002h,026h	; 6667  ...............&
	defb 08eh,01eh,07eh,0feh,0feh,082h,098h,082h,0c0h,0c6h,0f6h,0f8h,0feh,082h,012h,046h	; 6677  ..~............F
	defb 00eh,05eh,01eh,07eh,0feh,082h,040h,019h,098h,080h,083h,0c3h,0f0h,080h,004h,030h	; 6687  .^.~..@........0
	defb 002h,012h,006h,00eh,03eh,002h,082h,0feh,0feh,0fch,0fch,0fbh,0fbh,080h,080h,0f2h	; 6697  ....>...........
	defb 0f0h,0f1h,0f9h,0fch,0feh,082h,082h,0feh,0f8h,0f3h,0f3h,0e8h,0e0h,082h,080h,0c8h	; 66a7  ................
	defb 0e1h,0e0h,0f1h,0f9h,0fch,082h,080h,0f0h,0c1h,080h,0b0h,0b2h,000h,008h,003h,003h	; 66b7  ................
	defb 002h,088h,0abh,0c0h,0f2h,080h,082h,0feh,0feh,03eh,03eh,0deh,0deh,002h,002h,05eh	; 66c7  .........>>....^
	defb 01eh,09eh,0beh,07eh,0feh,082h,082h,0feh,01eh,0ceh,0c6h,016h,006h,040h,002h,016h	; 66d7  ...~.........@..
	defb 086h,00eh,08eh,09eh,03eh,042h,002h,01eh,086h,002h,012h,042h,0ffh,010h,003h,0c0h	; 66e7  ....>B.....B....
	defb 002h,012h,0ffh,006h,05eh,002h,033h,030h,0b3h,098h,0cch,01fh,03fh,01eh,0cch,00ch	; 66f7  ....^.30....?...
	defb 0cdh,019h,033h,0f8h,0fch,078h,00fh,06fh,0a7h,043h,0c3h,043h,09bh,07bh,0f0h,0f6h	; 6707  ..3..x.o.C.C.{..
	defb 0e7h,0c3h,0c3h,0c2h,0d9h,0deh,0ffh,008h,004h,0e3h,0d1h,0a5h,04dh,09dh,0ffh,010h	; 6717  ............M...
	defb 020h,0c7h,08bh,0a5h,0b2h,0b9h,03bh,09bh,043h,0c3h,083h,067h,06fh,00fh,0dch,0d9h	; 6727   .......C..go...
	defb 0c2h,0c3h,0c1h,0e6h,0f6h,0f0h,066h,061h,031h,058h,03eh,05fh,02fh,05fh,046h,086h	; 6737  ......fa1X>_/_F.
	defb 08ch,01ah,07ch,0fah,0f4h,0fah,02fh,05ch,039h,054h,026h,061h,029h,04ch,0f4h,03ah	; 6747  ..|.../\9T&a)L.:
	defb 09ch,02ah,044h,086h,094h,032h,01eh,018h,030h,044h,094h,014h,014h,016h,0bch,00ch	; 6757  .*D..2..0D......
	defb 0a6h,0a1h,028h,0a8h,028h,068h,081h,0ceh,0e1h,0f7h,097h,0cah,078h,03ch,0bch,00ch	; 6767  ..(.(h......x<..
	defb 0a6h,0a1h,003h,028h,089h,068h,0ffh,0e7h,0c3h,000h,000h,0ffh,0ffh,018h,003h,0eeh	; 6777  ...(.h..........
	defb 085h,06eh,01eh,008h,0f4h,00eh,003h,077h,0ffh,076h,070h,040h,027h,070h,03ch,03fh	; 6787  .n.....w.vp@'p<?
	defb 063h,0cfh,098h,099h,032h,031h,004h,0c1h,0c3h,039h,006h,0e3h,0b1h,051h,052h,044h	; 6797  c...21...9...QRD
	defb 08bh,018h,033h,0e8h,0dbh,03ch,020h,083h,0c3h,09ch,060h,0c7h,08dh,08ah,04eh,022h	; 67a7  ..3..< ...`...N"
	defb 0d1h,018h,0cch,017h,0dbh,03ch,03ch,0fch,0c6h,0f3h,019h,099h,04ch,08ch,0dfh,0efh	; 67b7  .....<<.....L...
	defb 0ech,0c8h,000h,0e4h,0eeh,0eeh,0fbh,0f7h,037h,013h,000h,027h,077h,077h,0e6h,0e6h	; 67c7  ........7..'ww..
	defb 0cah,01ch,068h,0f1h,083h,01dh,000h,0ffh,0ffh,000h,000h,0c3h,0e7h,018h,067h,067h	; 67d7  ..h...........gg
	defb 053h,038h,016h,08fh,0c1h,0b8h,01dh,083h,0f1h,0e8h,01ch,0cah,0e6h,0e6h,03eh,030h	; 67e7  S8............>0
	defb 001h,033h,033h,099h,0cch,066h,0b8h,0c1h,08fh,017h,038h,053h,067h,067h,0bdh,05dh	; 67f7  .33..f....8Sgg.]
	defb 02dh,091h,0c3h,0e4h,008h,0f7h,0bdh,0bah,0ffh,0b4h,089h,0c3h,027h,010h,0efh,07ch	; 6807  -...........'..|
	defb 00ch,080h,0cch,0cch,0d9h,033h,066h,009h,007h,007h,019h,0fch,018h,004h,00dh,066h	; 6817  .....3f........f
	defb 0cch,098h,0b3h,033h,001h,031h,02eh,0c8h,0f0h,0f0h,04ch,01fh,00ch,010h,098h,066h	; 6827  ...3.1....L....f
	defb 033h,019h,0cch,0cch,080h,08ch,074h,087h,07fh,0beh,08eh,046h,0a5h,056h,02bh,070h	; 6837  3.....t....F.V+p
	defb 07fh,0beh,0b8h,0b1h,0d2h,0b5h,0eah,054h,028h,02bh,014h,0cah,005h,003h,000h,095h	; 6847  .......T(+......
	defb 00ah,0eah,014h,029h,0d0h,0e0h,000h,006h,003h,05bh,05ch,006h,003h,05bh,05ch,040h	; 6857  ...).....[\..[\@
	defb 080h,09ah,032h,040h,080h,09ah,032h,088h,044h,022h,011h,088h,044h,022h,011h,040h	; 6867  ..2@..2.D"..D".@
	defb 030h,039h,008h,08dh,0d6h,06bh,034h,081h,086h,0ceh,088h,0d8h,0b5h,0ebh,017h,008h	; 6877  09...k4.........
	defb 011h,022h,0c4h,088h,011h,022h,0c4h,012h,0c7h,013h,018h,02ch,037h,078h,060h,080h	; 6887  ."...".....,7x`.
	defb 048h,0c8h,018h,034h,0ech,01eh,006h,001h,0c3h,081h,0e3h,073h,074h,029h,00fh,01eh	; 6897  H..4.......st)..
	defb 00ch,031h,027h,08fh,0d6h,01bh,032h,040h,098h,0c6h,0f2h,0f8h,0b5h,06eh,026h,001h	; 68a7  .1'...2@.....n&.
	defb 0f3h,089h,005h,072h,089h,070h,089h,073h,0e7h,0c8h,0d0h,0a7h,048h,007h,048h,067h	; 68b7  ...r.p.s....H.Hg
	defb 09ah,0cdh,070h,018h,01fh,045h,030h,099h,0adh,0dbh,087h,00ch,0fch,0d1h,006h,0cch	; 68c7  ..p..E0.........
	defb 000h	; 68d7

; ----------------------------------------------------------------------
; DATOS rachas_68D8: rachas a la VRAM (colores de la piramide 1): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:5033 (149 bytes)
;   0x68d8..0x696d  (149 bytes)
DATA_rachas_68D8:
	defb 007h,0feh,085h,000h,0c6h,0e6h,0f8h,0fch,003h,0feh,0a9h,000h,006h,02eh,09eh,03eh	; 68d8  ...............>
	defb 07eh,0feh,0feh,000h,08ch,08ch,0c0h,0f0h,0f8h,0fch,0feh,000h,022h,002h,00eh,05eh	; 68e8  ~..........."..^
	defb 03eh,07eh,0feh,000h,018h,018h,080h,082h,0c2h,0f0h,0f8h,000h,098h,000h,012h,002h	; 68f8  >~..............
	defb 00eh,01eh,03eh,000h,003h,0feh,0d3h,0f8h,0f6h,0f6h,0e0h,000h,0e0h,0f4h,0f0h,0fah	; 6908  ..>.............
	defb 0fch,0feh,0feh,000h,0feh,0fch,0f0h,0e6h,0e6h,0d0h,080h,000h,080h,0e0h,0e8h,0e0h	; 6918  ................
	defb 0f0h,0f8h,0fah,000h,0f8h,0e0h,0c0h,080h,0b0h,030h,004h,000h,000h,002h,082h,0c8h	; 6928  .........0......
	defb 0e0h,0f8h,0feh,000h,0feh,0feh,03eh,01eh,06eh,06eh,00eh,000h,006h,02eh,08eh,0beh	; 6938  ......>.nn......
	defb 03eh,07eh,0feh,000h,07eh,03eh,00eh,066h,066h,012h,002h,000h,002h,006h,016h,006h	; 6948  >~..~>.ff.......
	defb 08eh,08eh,01eh,000h,01eh,086h,002h,002h,018h,098h,003h,000h,002h,0c0h,085h,022h	; 6958  ..............."
	defb 006h,01eh,0beh,000h,000h	; 6968

; ----------------------------------------------------------------------
; DATOS rachas_696D: rachas a la VRAM (patrones de la piramide 1): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:5033 (364 bytes)
;   0x696d..0x6ad9  (364 bytes)
DATA_rachas_696D:
	defb 004h,091h,081h,0a1h,007h,091h,081h,0a1h,003h,091h,004h,0e1h,081h,0f1h,007h,0e1h	; 696d  ................
	defb 081h,0f1h,003h,0e1h,0ffh,0e1h,0f1h,0a1h,0a1h,091h,081h,061h,061h,0e1h,0f1h,0a1h	; 697d  ...........aa...
	defb 0a1h,091h,081h,061h,061h,0e1h,0f1h,0a1h,0a1h,091h,081h,061h,061h,0e1h,0f1h,0a1h	; 698d  ...aa......aa...
	defb 0a1h,091h,081h,061h,061h,0e1h,0f1h,0a1h,0a1h,091h,081h,061h,061h,0e1h,0f1h,0a1h	; 699d  ...aa......aa...
	defb 0a1h,091h,081h,061h,061h,0e1h,0f1h,0a1h,0a1h,091h,081h,061h,061h,0e1h,0f1h,0a1h	; 69ad  ...aa......aa...
	defb 0a1h,091h,081h,061h,061h,0e1h,0f1h,0a1h,0a1h,091h,081h,061h,061h,0e1h,0f1h,0a1h	; 69bd  ...aa......aa...
	defb 0a1h,091h,081h,061h,061h,0e1h,0f1h,0a1h,0a1h,091h,081h,061h,061h,0e1h,0f1h,0a1h	; 69cd  ...aa......aa...
	defb 0a1h,091h,081h,061h,081h,011h,0a1h,091h,0a1h,091h,081h,061h,061h,0e1h,0f1h,0a1h	; 69dd  ...a.......aa...
	defb 0a1h,091h,081h,061h,061h,0e1h,0f1h,0a1h,0a1h,091h,081h,061h,061h,0e1h,0f1h,0a1h	; 69ed  ...aa......aa...
	defb 0a1h,091h,081h,061h,099h,061h,0e1h,0f1h,0a1h,0a1h,091h,081h,061h,061h,0e1h,0f1h	; 69fd  ...a.a......aa..
	defb 0a1h,0a1h,091h,081h,011h,081h,011h,0a1h,091h,0a1h,091h,081h,061h,061h,07fh,041h	; 6a0d  ............aa.A
	defb 006h,041h,081h,054h,007h,041h,003h,054h,005h,041h,003h,054h,002h,041h,081h,051h	; 6a1d  .A.T.A.T.A.T.A.Q
	defb 007h,041h,002h,054h,007h,051h,007h,041h,002h,054h,007h,051h,007h,041h,081h,051h	; 6a2d  .A.T.Q.A.T.Q.A.Q
	defb 00ah,041h,081h,051h,007h,041h,081h,051h,005h,041h,002h,051h,081h,041h,004h,051h	; 6a3d  .A.Q.A.Q.A.Q.A.Q
	defb 081h,041h,003h,051h,082h,041h,054h,003h,041h,002h,051h,081h,041h,005h,051h,081h	; 6a4d  .A.Q.AT.A.Q.A.Q.
	defb 041h,003h,051h,008h,041h,004h,051h,081h,041h,003h,051h,008h,041h,081h,054h,007h	; 6a5d  A.Q.A.Q.A.Q.A.T.
	defb 041h,081h,054h,007h,041h,006h,051h,00ah,041h,006h,051h,00ah,041h,021h,051h,08ah	; 6a6d  A.T.A.Q.A.Q.A!Q.
	defb 041h,051h,051h,041h,041h,051h,051h,041h,041h,051h,003h,041h,081h,051h,005h,041h	; 6a7d  AQQAAQQAAQ.A.Q.A
	defb 005h,051h,003h,041h,005h,054h,003h,041h,005h,054h,003h,041h,005h,051h,003h,041h	; 6a8d  .Q.A.T.A.T.A.Q.A
	defb 003h,051h,005h,041h,003h,051h,003h,041h,003h,054h,004h,051h,083h,041h,051h,051h	; 6a9d  .Q.A.Q.A.T.Q.AQQ
	defb 003h,041h,002h,051h,083h,041h,051h,051h,003h,041h,002h,051h,002h,054h,08eh,051h	; 6aad  .A.Q.AQQ.A.Q.T.Q
	defb 041h,041h,051h,041h,041h,054h,054h,051h,041h,041h,051h,041h,041h,004h,054h,084h	; 6abd  AAQAATTQAAQAA.T.
	defb 041h,051h,051h,041h,004h,054h,084h,041h,051h,051h,041h,000h	; 6acd  AQQA.T.AQQA.

; ----------------------------------------------------------------------
; DATOS rachas_6AD9: rachas a la VRAM (un paso del caracter animado de la
;   piramide 1): [n < 0x80] repite el byte siguiente, [0x80 + n] copia n,
;   [0x80] otro destino, 0 acaba; lo leen p00:4EB9 (32 bytes)
;   0x6ad9..0x6af9  (32 bytes)
DATA_rachas_6AD9:
	defb 002h,054h,08eh,051h,041h,041h,071h,041h,041h,054h,054h,051h,041h,041h,071h,041h	; 6ad9  .T.QAAqAATTQAAqA
	defb 041h,004h,054h,084h,041h,051h,071h,041h,004h,054h,084h,041h,051h,071h,041h,000h	; 6ae9  A.T.AQqA.T.AQqA.

; ----------------------------------------------------------------------
; DATOS rachas_6AF9: rachas a la VRAM (un paso del caracter animado de la
;   piramide 1): [n < 0x80] repite el byte siguiente, [0x80 + n] copia n,
;   [0x80] otro destino, 0 acaba; lo leen p00:4EB9 (32 bytes)
;   0x6af9..0x6b19  (32 bytes)
DATA_rachas_6AF9:
	defb 002h,054h,08eh,051h,041h,041h,051h,041h,041h,054h,054h,051h,041h,041h,051h,041h	; 6af9  .T.QAAQAATTQAAQA
	defb 041h,004h,054h,084h,041h,051h,051h,041h,004h,054h,084h,041h,051h,051h,041h,000h	; 6b09  A.T.AQQA.T.AQQA.

; ----------------------------------------------------------------------
; DATOS rachas_6B19: rachas a la VRAM (patrones de la piramide 1): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:5033 (154 bytes)
;   0x6b19..0x6bb3  (154 bytes)
DATA_rachas_6B19:
	defb 0deh,091h,0a1h,0f1h,0a1h,091h,081h,061h,061h,091h,0a1h,0f1h,0a1h,091h,081h,061h	; 6b19  .......aa......a
	defb 061h,091h,0a1h,0f1h,0a1h,091h,081h,061h,061h,091h,0a1h,0f1h,0a1h,091h,081h,061h	; 6b29  a......aa......a
	defb 061h,091h,0a1h,0f1h,0a1h,091h,081h,061h,061h,091h,0a1h,0f1h,0a1h,091h,081h,061h	; 6b39  a......aa......a
	defb 061h,091h,0a1h,0f1h,0a1h,091h,081h,061h,061h,091h,0a1h,0f1h,0a1h,091h,081h,061h	; 6b49  a......aa......a
	defb 061h,091h,0a1h,0f1h,0a1h,091h,081h,061h,061h,091h,0a1h,0f1h,0a1h,091h,081h,061h	; 6b59  a......aa......a
	defb 061h,091h,0a1h,0f1h,0a1h,091h,081h,061h,061h,091h,0a1h,0f1h,0a1h,091h,081h,003h	; 6b69  a......aa.......
	defb 061h,0adh,0a1h,0f1h,0a1h,091h,081h,061h,061h,091h,0a1h,0f1h,0a1h,091h,081h,061h	; 6b79  a......aa......a
	defb 061h,091h,0a1h,0f1h,0a1h,091h,081h,061h,061h,091h,0a1h,0f1h,0a1h,091h,081h,061h	; 6b89  a......aa......a
	defb 061h,091h,0a1h,0f1h,0a1h,091h,081h,061h,061h,091h,0a1h,0f1h,0a1h,091h,081h,003h	; 6b99  a......aa.......
	defb 061h,087h,0a1h,0f1h,0a1h,091h,081h,061h,061h,000h	; 6ba9  a......aa.

; ----------------------------------------------------------------------
; DATOS rachas_6BB3: rachas a la VRAM (colores de la piramide 2): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:5033 (593 bytes)
;   0x6bb3..0x6e04  (593 bytes)
DATA_rachas_6BB3:
	defb 004h,06fh,004h,060h,004h,0f6h,004h,006h,004h,06fh,004h,060h,004h,0f6h,004h,006h	; 6bb3  .o.`.....o.`....
	defb 008h,0bah,084h,080h,084h,0b0h,0b8h,004h,0bah,085h,002h,022h,08ah,01ah,03ah,003h	; 6bc3  ..........."..:.
	defb 0bah,08fh,098h,082h,080h,086h,0b6h,0b8h,0bah,0ffh,012h,042h,00ah,05ah,01ah,03ah	; 6bd3  ...........B.Z.:
	defb 0bah,003h,019h,084h,098h,080h,083h,083h,003h,0b0h,086h,030h,002h,012h,002h,00ah	; 6be3  ...........0....
	defb 03ah,004h,0bah,002h,0b8h,003h,0bbh,086h,080h,0b2h,0b0h,0b1h,0b9h,0b8h,004h,0bah	; 6bf3  :...............
	defb 08ch,0b8h,0b3h,0b3h,0a8h,0a0h,002h,080h,088h,0a1h,0a0h,0b1h,0b9h,003h,0b8h,086h	; 6c03  ................
	defb 0a0h,081h,080h,030h,031h,004h,004h,003h,002h,088h,081h,0a0h,005h,0bah,002h,03ah	; 6c13  ...01..........:
	defb 003h,0dah,086h,002h,05ah,01ah,09ah,0bah,03ah,004h,0bah,084h,01ah,0cah,0c2h,012h	; 6c23  ....Z...:.......
	defb 003h,002h,08dh,012h,082h,00ah,08ah,09ah,03ah,0ffh,01ah,002h,082h,002h,012h,040h	; 6c33  ........:......@
	defb 005h,0c0h,002h,012h,0deh,002h,05ah,0bah,036h,05bh,0adh,0d6h,06bh,0b5h,01ah,04ch	; 6c43  ......Z.6[..k..L
	defb 014h,029h,052h,0a4h,049h,092h,024h,048h,00ch,0d9h,0e3h,076h,0b8h,09dh,02eh,066h	; 6c53  .)R.I.$H...v...f
	defb 0ach,0d9h,063h,036h,0d8h,08dh,036h,063h,0e8h,050h,0a2h,0c5h,066h,0b3h,005h,016h	; 6c63  ..c6..6c.P..f...
	defb 068h,0b4h,0d8h,069h,0b2h,045h,00bh,016h,0c8h,090h,022h,045h,086h,01bh,02dh,016h	; 6c73  h..i.E...."E..-.
	defb 068h,0b4h,0c8h,001h,0a2h,035h,01bh,02dh,0c8h,010h,0a0h,0c0h,060h,0b0h,000h,03ch	; 6c83  h....5.-....`..<
	defb 018h,000h,07eh,000h,05ah,000h,07eh,000h,064h,0e4h,0e0h,0eeh,0e0h,044h,0f4h,0e4h	; 6c93  ..~.Z.~.d....D..
	defb 07ch,000h,070h,003h,0aah,084h,070h,000h,07eh,070h,004h,07eh,0ffh,070h,0ffh,0fch	; 6ca3  |.p...p.~p.~.p..
	defb 0c1h,000h,0fch,000h,0fch,0c1h,000h,03ch,038h,030h,020h,001h,002h,005h,00ah,090h	; 6cb3  .......<80 .....
	defb 020h,040h,080h,00eh,01eh,03eh,000h,07ch,078h,070h,060h,009h,004h,012h,025h,090h	; 6cc3   @...>.|xp`...%.
	defb 040h,020h,050h,0c0h,080h,00ch,03ch,07eh,07eh,070h,001h,022h,035h,01bh,02ch,0c4h	; 6cd3  @ P...<~~p."5.,.
	defb 090h,020h,040h,080h,006h,006h,026h,03ch,030h,020h,001h,002h,005h,00bh,016h,0c8h	; 6ce3  . @...&<0 ......
	defb 090h,020h,040h,080h,005h,004h,025h,0e0h,0c0h,001h,000h,002h,005h,00bh,016h,0c8h	; 6cf3  . @...%.........
	defb 090h,020h,040h,080h,00ch,01dh,03ch,0e4h,000h,0e0h,002h,024h,031h,01bh,02ch,00bh	; 6d03  . @...<....$1.,.
	defb 005h,002h,001h,050h,0b0h,064h,0c8h,005h,00bh,006h,004h,080h,040h,0a0h,0d0h,0c0h	; 6d13  ...P.d......@...
	defb 090h,020h,040h,080h,000h,001h,002h,090h,020h,040h,080h,002h,08bh,005h,00bh,016h	; 6d23  . @..... @......
	defb 00bh,005h,002h,001h,040h,0b0h,060h,0c8h,003h,00fh,004h,02dh,081h,015h,003h,00fh	; 6d33  ....@.`....-....
	defb 002h,015h,084h,000h,00fh,0ffh,015h,004h,02dh,003h,00fh,003h,0e1h,004h,0b4h,086h	; 6d43  ........-.......
	defb 0a8h,000h,0e1h,000h,0a8h,0a8h,003h,0e1h,081h,0a8h,004h,0b4h,003h,0e1h,0ffh,000h	; 6d53  ................
	defb 07eh,000h,01fh,01fh,00fh,03eh,063h,0fbh,01dh,0e5h,019h,006h,002h,001h,081h,0e3h	; 6d63  ~....>c.........
	defb 03fh,00fh,0a7h,0bdh,0bdh,09dh,057h,0beh,070h,04fh,030h,0c0h,080h,000h,001h,086h	; 6d73  ?.....W.pO0.....
	defb 0f8h,0e0h,0cbh,07bh,07bh,072h,0d5h,000h,0feh,000h,0f8h,0f8h,0f0h,0fch,086h,078h	; 6d83  ...{{r.........x
	defb 03ch,03ch,001h,07dh,001h,03dh,03ch,01eh,03ch,03ch,080h,0beh,080h,0bch,03ch,08fh	; 6d93  <<.}.=<.<<....<.
	defb 09fh,089h,016h,0c2h,0e0h,030h,008h,01ch,07fh,07fh,0f3h,0e0h,0e0h,0f0h,078h,038h	; 6da3  .....0........x8
	defb 0feh,0feh,0cfh,007h,007h,00fh,01eh,05dh,03eh,03eh,07ch,07fh,07fh,03ch,000h,07ah	; 6db3  .......]>>|..<.z
	defb 0fch,0fch,07eh,0feh,0feh,07ch,000h,011h,0e1h,0c1h,00dh,01dh,00eh,037h,07fh,0e3h	; 6dc3  ..~..|.......7..
	defb 0f2h,022h,0d0h,087h,00fh,018h,020h,008h,007h,003h,060h,070h,0e0h,0d8h,0a1h,0fch	; 6dd3  .".... ...`p....
	defb 03fh,078h,0ffh,03eh,001h,03eh,078h,000h,000h,03ch,066h,0c3h,018h,0c3h,066h,000h	; 6de3  ?x.>.>x..<f...f.
	defb 07eh,038h,000h,066h,000h,038h,07eh,000h,066h,0e0h,0efh,000h,0e6h,0b6h,040h,0b6h	; 6df3  ~8.f.8~.f.....@.
	defb 000h	; 6e03

; ----------------------------------------------------------------------
; DATOS rachas_6E04: rachas a la VRAM (colores de la piramide 2): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:5033 (149 bytes)
;   0x6e04..0x6e99  (149 bytes)
DATA_rachas_6E04:
	defb 007h,0feh,085h,000h,0c6h,0e6h,0f8h,0fch,003h,0feh,0a9h,000h,006h,02eh,09eh,03eh	; 6e04  ...............>
	defb 07eh,0feh,0feh,000h,08ch,08ch,0c0h,0f0h,0f8h,0fch,0feh,000h,022h,002h,00eh,05eh	; 6e14  ~..........."..^
	defb 03eh,07eh,0feh,000h,018h,018h,080h,082h,0c2h,0f0h,0f8h,000h,098h,000h,012h,002h	; 6e24  >~..............
	defb 00eh,01eh,03eh,000h,003h,0feh,0d3h,0f8h,0f6h,0f6h,0e0h,000h,0e0h,0f4h,0f0h,0fah	; 6e34  ..>.............
	defb 0fch,0feh,0feh,000h,0feh,0fch,0f0h,0e6h,0e6h,0d0h,080h,000h,080h,0e0h,0e8h,0e0h	; 6e44  ................
	defb 0f0h,0f8h,0fah,000h,0f8h,0e0h,0c0h,080h,0b0h,030h,004h,000h,000h,002h,082h,0c8h	; 6e54  .........0......
	defb 0e0h,0f8h,0feh,000h,0feh,0feh,03eh,01eh,06eh,06eh,00eh,000h,006h,02eh,08eh,0beh	; 6e64  ......>.nn......
	defb 03eh,07eh,0feh,000h,07eh,03eh,00eh,066h,066h,012h,002h,000h,002h,006h,016h,006h	; 6e74  >~..~>.ff.......
	defb 08eh,08eh,01eh,000h,01eh,086h,002h,002h,018h,098h,003h,000h,002h,0c0h,085h,022h	; 6e84  ..............."
	defb 006h,01eh,0beh,000h,000h	; 6e94

; ----------------------------------------------------------------------
; DATOS rachas_6E99: rachas a la VRAM (patrones de la piramide 2): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:5033 (369 bytes)
;   0x6e99..0x700a  (369 bytes)
DATA_rachas_6E99:
	defb 0ffh,011h,0f1h,0a1h,091h,0f1h,0a1h,0a1h,091h,011h,0f1h,0a1h,091h,0f1h,0a1h,0a1h	; 6e99  ................
	defb 091h,011h,0f1h,091h,061h,0f1h,091h,091h,061h,011h,0f1h,091h,061h,0f1h,091h,091h	; 6ea9  ....a...a...a...
	defb 061h,0e1h,0f1h,0b1h,0a1h,091h,081h,061h,011h,0e1h,0f1h,0b1h,0a1h,091h,081h,061h	; 6eb9  a......a.......a
	defb 011h,0e1h,0f1h,0b1h,0a1h,091h,081h,061h,011h,0e1h,0f1h,0b1h,0a1h,091h,081h,061h	; 6ec9  .......a.......a
	defb 011h,0e1h,0f1h,0b1h,0a1h,091h,081h,061h,011h,011h,0f1h,0b1h,0a1h,091h,081h,061h	; 6ed9  .......a.......a
	defb 011h,011h,0f1h,0b1h,0a1h,091h,081h,061h,011h,0e1h,0f1h,0b1h,0a1h,091h,081h,061h	; 6ee9  .......a.......a
	defb 011h,0e1h,0f1h,0b1h,0a1h,091h,081h,061h,011h,0e1h,0f1h,0b1h,0a1h,091h,081h,061h	; 6ef9  .......a.......a
	defb 061h,0e1h,0f1h,0b1h,0a1h,091h,081h,061h,011h,0e1h,0f1h,0b1h,0a1h,091h,081h,061h	; 6f09  a......a.......a
	defb 002h,011h,0adh,0f1h,0a1h,0a1h,091h,081h,061h,011h,0e1h,0f1h,0b1h,0a1h,091h,081h	; 6f19  ........a.......
	defb 061h,011h,0e1h,0f1h,0b1h,0a1h,091h,081h,061h,011h,0e1h,0f1h,0b1h,0a1h,091h,081h	; 6f29  a.......a.......
	defb 061h,011h,0e1h,0f1h,0b1h,0a1h,091h,081h,061h,011h,0e1h,0f1h,0b1h,0a1h,091h,091h	; 6f39  a.......a.......
	defb 003h,011h,087h,0f1h,0b1h,0a1h,091h,081h,061h,011h,046h,061h,014h,041h,090h,054h	; 6f49  ........a.Fa.A.T
	defb 011h,041h,011h,054h,041h,041h,054h,011h,041h,011h,041h,054h,011h,041h,054h,004h	; 6f59  .A.TAAT.A.AT.AT.
	defb 041h,081h,054h,005h,041h,008h,061h,008h,041h,00ah,061h,005h,041h,00ah,061h,006h	; 6f69  A.T.A.a.A.a.A.a.
	defb 041h,00ah,061h,005h,041h,00bh,061h,006h,041h,009h,061h,008h,041h,00ah,061h,006h	; 6f79  A.a.A.a.A.a.A.a.
	defb 041h,008h,061h,004h,041h,083h,011h,098h,011h,004h,081h,084h,061h,011h,098h,011h	; 6f89  A.a.A.......a...
	defb 003h,081h,084h,098h,011h,081h,091h,003h,081h,086h,011h,098h,011h,011h,086h,011h	; 6f99  ................
	defb 006h,061h,081h,086h,003h,061h,085h,011h,086h,011h,061h,081h,003h,061h,083h,011h	; 6fa9  .a...a....a..a..
	defb 086h,011h,004h,081h,006h,061h,00ah,081h,006h,061h,00ah,081h,004h,061h,004h,081h	; 6fb9  .....a...a...a..
	defb 004h,061h,002h,051h,081h,041h,004h,081h,084h,061h,051h,051h,041h,004h,081h,004h	; 6fc9  .a.Q.A...aQQA...
	defb 061h,081h,051h,014h,071h,081h,061h,007h,071h,081h,061h,00ah,071h,008h,061h,081h	; 6fd9  a.Q.q.a.q.a.q.a.
	defb 051h,007h,071h,005h,061h,087h,051h,075h,011h,051h,061h,051h,075h,004h,041h,083h	; 6fe9  Q.q.a.Qu.QaQu.A.
	defb 051h,061h,051h,003h,041h,085h,054h,041h,064h,041h,054h,008h,041h,082h,061h,041h	; 6ff9  QaQ.A.TAdAT.A.aA
	defb 000h	; 7009

; ----------------------------------------------------------------------
; DATOS rachas_700A: rachas a la VRAM (un paso del caracter animado de la
;   piramide 2): [n < 0x80] repite el byte siguiente, [0x80 + n] copia n,
;   [0x80] otro destino, 0 acaba; lo leen p00:4EB9 (28 bytes)
;   0x700a..0x7026  (28 bytes)
DATA_rachas_700A:
	defb 087h,051h,075h,011h,051h,011h,051h,075h,004h,041h,083h,051h,011h,051h,003h,041h	; 700a  .Qu.Q.Qu.A.Q.Q.A
	defb 085h,054h,041h,014h,041h,054h,008h,041h,082h,011h,041h,000h	; 701a  .TA.AT.A..A.

; ----------------------------------------------------------------------
; DATOS rachas_7026: rachas a la VRAM (un paso del caracter animado de la
;   piramide 2): [n < 0x80] repite el byte siguiente, [0x80 + n] copia n,
;   [0x80] otro destino, 0 acaba; lo leen p00:4EB9 (28 bytes)
;   0x7026..0x7042  (28 bytes)
DATA_rachas_7026:
	defb 087h,051h,075h,011h,051h,061h,051h,075h,004h,041h,083h,051h,061h,051h,003h,041h	; 7026  .Qu.QaQu.A.QaQ.A
	defb 085h,054h,041h,064h,041h,054h,008h,041h,082h,061h,041h,000h	; 7036  .TAdAT.A.aA.

; ----------------------------------------------------------------------
; DATOS rachas_7042: rachas a la VRAM (patrones de la piramide 2): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:5033 (151 bytes)
;   0x7042..0x70d9  (151 bytes)
DATA_rachas_7042:
	defb 085h,051h,0e1h,0f1h,0e1h,051h,003h,041h,085h,051h,0e1h,0f1h,0e1h,051h,003h,041h	; 7042  .Q...Q.A.Q...Q.A
	defb 085h,051h,0e1h,0f1h,0e1h,051h,003h,041h,085h,051h,0e1h,0f1h,0e1h,051h,003h,041h	; 7052  .Q...Q.A.Q...Q.A
	defb 085h,051h,0e1h,0f1h,0e1h,051h,003h,041h,085h,051h,0e1h,0f1h,0e1h,051h,003h,041h	; 7062  .Q...Q.A.Q...Q.A
	defb 085h,051h,0e1h,0f1h,0e1h,051h,003h,041h,085h,051h,0e1h,0f1h,0e1h,051h,003h,041h	; 7072  .Q...Q.A.Q...Q.A
	defb 085h,051h,0e1h,0f1h,0e1h,051h,003h,041h,085h,051h,0e1h,0f1h,0e1h,051h,003h,041h	; 7082  .Q...Q.A.Q...Q.A
	defb 085h,051h,0e1h,0f1h,0e1h,051h,003h,041h,085h,051h,0e1h,0f1h,0e1h,051h,004h,041h	; 7092  .Q...Q.A.Q...Q.A
	defb 084h,0e1h,0f1h,0e1h,051h,003h,041h,085h,051h,0e1h,0f1h,0e1h,051h,003h,041h,085h	; 70a2  ....Q.A.Q...Q.A.
	defb 051h,0e1h,0f1h,0e1h,051h,003h,041h,085h,051h,0e1h,0f1h,0e1h,051h,003h,041h,085h	; 70b2  Q...Q.A.Q...Q.A.
	defb 051h,0e1h,0f1h,0e1h,051h,003h,041h,085h,051h,0e1h,0f1h,0e1h,051h,004h,041h,084h	; 70c2  Q...Q.A.Q...Q.A.
	defb 0e1h,0f1h,0e1h,051h,003h,041h,000h	; 70d2

; ----------------------------------------------------------------------
; DATOS rachas_70D9: rachas a la VRAM (colores de la piramide 3): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:5033 (610 bytes)
;   0x70d9..0x733b  (610 bytes)
DATA_rachas_70D9:
	defb 002h,040h,08eh,060h,030h,05ch,027h,020h,040h,002h,002h,004h,00eh,034h,0e4h,002h	; 70d9  .@.`0\' @....4..
	defb 002h,003h,060h,082h,01fh,07fh,003h,060h,003h,006h,082h,0f8h,0feh,003h,006h,098h	; 70e9  ..`....`........
	defb 0dbh,05ah,03ch,018h,03ch,03ch,05ah,0dbh,000h,040h,030h,0f6h,03ch,03ch,0ffh,0dbh	; 70f9  .Z<.<<Z..@0.<<..
	defb 001h,002h,00ch,07fh,03ch,03ch,0ffh,0dbh,004h,000h,084h,080h,0b0h,0feh,0dbh,005h	; 7109  ....<<..........
	defb 000h,083h,003h,07fh,0dbh,006h,000h,082h,0c0h,0d0h,006h,000h,098h,001h,01bh,0dbh	; 7119  ................
	defb 0feh,03ch,0fch,0f8h,038h,0f8h,0d8h,0d0h,0f8h,038h,0f8h,0fch,03ch,0feh,0dah,0c8h	; 7129  .<..8....8..<...
	defb 0f0h,030h,0e0h,0e0h,020h,004h,0c0h,08bh,000h,0c0h,0e0h,030h,0f0h,0d0h,0c0h,080h	; 7139  .0.. ......0....
	defb 000h,0c0h,080h,004h,000h,09dh,080h,000h,080h,080h,000h,080h,0c0h,0dbh,07fh,03ch	; 7149  ...............<
	defb 03fh,01fh,01ch,01fh,01bh,00bh,01fh,01ch,01fh,03fh,03ch,07fh,05bh,013h,00fh,00ch	; 7159  ?........?<.[...
	defb 007h,007h,004h,004h,003h,08bh,000h,003h,007h,00ch,00fh,00bh,003h,001h,000h,003h	; 7169  ................
	defb 001h,004h,000h,0a0h,001h,000h,001h,001h,000h,001h,003h,0d1h,0c1h,082h,040h,081h	; 7179  ..............@.
	defb 000h,000h,070h,087h,0cfh,0bbh,0c7h,0ffh,0f2h,024h,080h,0c0h,0d0h,081h,0a0h,002h	; 7189  ..p......$......
	defb 09fh,03fh,0e3h,013h,003h,000h,0ffh,0a0h,088h,0fah,0feh,040h,034h,05dh,0ffh,0f7h	; 7199  .?.........@4]..
	defb 0e3h,0e3h,0f7h,0e3h,0d3h,0c3h,0e7h,087h,0cfh,087h,055h,0e3h,0c3h,0c7h,08fh,0feh	; 71a9  ..........U.....
	defb 0f9h,0c4h,0a0h,0fch,007h,0f3h,0b9h,00ch,006h,007h,00fh,010h,001h,001h,0c1h,0c5h	; 71b9  ................
	defb 083h,0c1h,087h,0cfh,098h,0b0h,060h,040h,0c0h,080h,0c0h,010h,040h,0cah,0a0h,0e1h	; 71c9  ......`@....@...
	defb 0f4h,0f9h,0f5h,010h,001h,001h,0c1h,0c5h,083h,0c1h,084h,009h,084h,000h,042h,001h	; 71d9  ..............B.
	defb 08bh,003h,00fh,03fh,0f8h,0d4h,051h,000h,081h,003h,007h,001h,020h,008h,078h,0feh	; 71e9  ...?..Q..... .x.
	defb 0c7h,0bfh,063h,098h,0d8h,0ech,0eeh,03fh,01fh,007h,08fh,000h,000h,093h,005h,0afh	; 71f9  ..c....?........
	defb 07fh,0fah,0fah,0e0h,0e0h,0d1h,0c0h,062h,083h,02bh,01fh,000h,010h,001h,0a0h,002h	; 7209  .......b.+......
	defb 09fh,03fh,0e3h,005h,002h,004h,0cdh,040h,080h,0a0h,080h,0d0h,0e0h,0f8h,07fh,0b5h	; 7219  .?.....@........
	defb 008h,000h,052h,0bch,047h,083h,0c3h,0d3h,0e1h,0e5h,0f1h,0e5h,061h,040h,040h,060h	; 7229  ..R.G.......a@@`
	defb 020h,0a1h,0b1h,093h,0c0h,0e0h,0e8h,0f0h,0f0h,0e8h,0e0h,0d8h,050h,011h,002h,00fh	; 7239   ...........P...
	defb 025h,00fh,017h,027h,0feh,0f8h,0fch,0e1h,087h,0ceh,01ch,0dch,0e0h,0a8h,0c0h,0d0h	; 7249  %..'............
	defb 080h,0a0h,000h,000h,0ffh,0e7h,099h,067h,041h,060h,0a0h,0a1h,0d0h,0c0h,080h,040h	; 7259  .......gA`.....@
	defb 080h,000h,080h,014h,00ch,000h,0c1h,002h,008h,024h,016h,000h,000h,004h,000h,040h	; 7269  .........$.....@
	defb 008h,0aah,0eeh,02fh,07fh,00bh,017h,001h,012h,040h,000h,000h,081h,0ebh,0bdh,0c7h	; 7279  .../.....@......
	defb 07dh,0aah,09ah,0e4h,0d2h,0c0h,0e5h,080h,020h,080h,080h,07fh,0bah,010h,044h,010h	; 7289  }....... .....D.
	defb 080h,000h,000h,020h,0f4h,0fdh,07fh,0bfh,01fh,01fh,0bfh,010h,000h,002h,001h,001h	; 7299  ... ............
	defb 0b0h,002h,081h,04fh,03fh,0ffh,0ffh,07fh,003h,0feh,095h,0d7h,0a3h,0a3h,0d7h,0efh	; 72a9  ...O?...........
	defb 0dfh,02ah,010h,080h,000h,040h,090h,0c0h,0e0h,0d4h,0e0h,025h,00ah,028h,000h,008h	; 72b9  .*...@.....%.(..
	defb 004h,000h,08ch,002h,000h,021h,005h,023h,00fh,007h,0feh,0f9h,054h,028h,080h,004h	; 72c9  .....!.#....T(..
	defb 000h,0afh,001h,002h,004h,020h,00fh,0bfh,07fh,0feh,0ffh,07fh,09fh,0abh,001h,0e0h	; 72d9  ..... ..........
	defb 0c0h,0c8h,0e0h,080h,0a0h,000h,080h,000h,000h,047h,00bh,003h,000h,004h,000h,001h	; 72e9  .........G......
	defb 008h,044h,090h,0c1h,0d1h,0e1h,0e4h,0f0h,0e4h,006h,001h,083h,0ffh,0beh,014h,022h	; 72f9  .D............."
	defb 080h,003h,0ffh,08bh,08fh,003h,001h,000h,006h,01eh,03fh,0f1h,0c0h,000h,07eh,003h	; 7309  ..........?...~.
	defb 0ffh,092h,07eh,001h,001h,0f3h,0ffh,075h,048h,030h,0adh,0ffh,0ffh,083h,001h,006h	; 7319  ..~....uH0......
	defb 006h,0ffh,00fh,003h,003h,001h,08ah,07eh,0ffh,0ffh,07eh,001h,001h,003h,003h,087h	; 7329  .......~..~.....
	defb 087h,000h	; 7339

; ----------------------------------------------------------------------
; DATOS rachas_733B: rachas a la VRAM (patrones de la piramide 3): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:5033 (217 bytes)
;   0x733b..0x7414  (217 bytes)
DATA_rachas_733B:
	defb 004h,091h,081h,081h,003h,091h,002h,081h,081h,091h,008h,081h,083h,091h,081h,091h	; 733b  ................
	defb 005h,081h,093h,091h,081h,091h,081h,081h,061h,086h,091h,0fah,098h,081h,086h,061h	; 734b  ........a......a
	defb 081h,081h,091h,0a8h,096h,081h,004h,061h,084h,091h,0a8h,096h,081h,007h,061h,081h	; 735b  .......a......a.
	defb 081h,008h,061h,081h,081h,013h,061h,084h,081h,091h,081h,081h,004h,061h,084h,081h	; 736b  ..a...a......a..
	defb 091h,081h,081h,004h,061h,084h,081h,091h,081h,081h,005h,061h,082h,091h,081h,015h	; 737b  ....a......a....
	defb 061h,084h,081h,091h,081h,081h,004h,061h,084h,081h,091h,081h,081h,004h,061h,084h	; 738b  a......a......a.
	defb 081h,091h,081h,081h,005h,061h,082h,091h,081h,013h,061h,008h,0c2h,004h,0c1h,00bh	; 739b  .....a....a.....
	defb 0c2h,081h,0c1h,00ch,0c2h,004h,0c1h,008h,0c2h,004h,0c1h,005h,0c2h,007h,0c1h,008h	; 73ab  ................
	defb 0c2h,008h,0c1h,018h,0c2h,081h,0c1h,00ch,0c2h,007h,0c1h,00ah,0c2h,002h,0c1h,00fh	; 73bb  ................
	defb 0c2h,081h,0c1h,008h,0c2h,002h,0c1h,00eh,0c2h,008h,0c1h,010h,0c2h,008h,0c1h,008h	; 73cb  ................
	defb 0c2h,008h,0c1h,028h,0c2h,005h,0c1h,016h,0c2h,005h,0c1h,00dh,0c2h,008h,0c1h,02bh	; 73db  ...(...........+
	defb 0c2h,081h,0c1h,01fh,0c2h,084h,051h,0c1h,0c1h,0cch,004h,0c2h,006h,0c1h,002h,051h	; 73eb  ......Q........Q
	defb 005h,0c1h,081h,051h,003h,052h,081h,051h,004h,0c1h,006h,0c2h,002h,0c1h,002h,051h	; 73fb  ...Q.R.Q.......Q
	defb 081h,0c5h,005h,0c1h,004h,051h,006h,0c1h,000h	; 740b  .....Q...

; ----------------------------------------------------------------------
; DATOS rachas_7414: rachas a la VRAM (un paso del caracter animado de la
;   piramide 3): [n < 0x80] repite el byte siguiente, [0x80 + n] copia n,
;   [0x80] otro destino, 0 acaba; lo leen p00:4EB9 (36 bytes)
;   0x7414..0x7438  (36 bytes)
DATA_rachas_7414:
	defb 084h,041h,0c1h,0c1h,0cch,004h,0c2h,006h,0c1h,002h,041h,005h,0c1h,081h,041h,003h	; 7414  .A........A...A.
	defb 042h,081h,041h,004h,0c1h,006h,0c2h,002h,0c1h,002h,041h,081h,0c4h,005h,0c1h,004h	; 7424  B.A.......A.....
	defb 041h,006h,0c1h,000h	; 7434

; ----------------------------------------------------------------------
; DATOS rachas_7438: rachas a la VRAM (un paso del caracter animado de la
;   piramide 3): [n < 0x80] repite el byte siguiente, [0x80 + n] copia n,
;   [0x80] otro destino, 0 acaba; lo leen p00:4EB9 (36 bytes)
;   0x7438..0x745c  (36 bytes)
DATA_rachas_7438:
	defb 084h,051h,0c1h,0c1h,0cch,004h,0c2h,006h,0c1h,002h,051h,005h,0c1h,081h,051h,003h	; 7438  .Q........Q...Q.
	defb 052h,081h,051h,004h,0c1h,006h,0c2h,002h,0c1h,002h,051h,081h,0c5h,005h,0c1h,004h	; 7448  R.Q.......Q.....
	defb 051h,006h,0c1h,000h	; 7458

; ----------------------------------------------------------------------
; DATOS sin identificar  0x745c..0x74a4  (72 bytes)
DATA_745C:
	defb 084h,071h,0c1h,0c1h,0cch,004h,0c2h,006h,0c1h,002h,071h,005h,0c1h,081h,071h,003h	; 745c  .q........q...q.
	defb 072h,081h,071h,004h,0c1h,006h,0c2h,002h,0c1h,002h,071h,081h,0c7h,005h,0c1h,004h	; 746c  r.q.......q.....
	defb 071h,006h,0c1h,000h,084h,0f1h,0c1h,0c1h,0cch,004h,0c2h,006h,0c1h,002h,0f1h,005h	; 747c  q...............
	defb 0c1h,081h,0f1h,003h,0f2h,081h,0f1h,004h,0c1h,006h,0c2h,002h,0c1h,002h,0f1h,081h	; 748c  ................
	defb 0cfh,005h,0c1h,004h,0f1h,006h,0c1h,000h	; 749c  ........

; ----------------------------------------------------------------------
; DATOS rachas_74A4: rachas a la VRAM (colores de la piramide 4): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:5033 (439 bytes)
;   0x74a4..0x765b  (439 bytes)
DATA_rachas_74A4:
	defb 0ffh,000h,038h,070h,070h,07fh,03fh,000h,030h,000h,01ch,00eh,00eh,0feh,0fch,000h	; 74a4  ..8pp.?.0.......
	defb 00ch,000h,038h,070h,070h,07fh,03fh,000h,030h,000h,01ch,00eh,00eh,0feh,0fch,000h	; 74b4  ..8pp.?.0.......
	defb 00ch,0feh,0feh,07fh,0bfh,0dfh,0aah,000h,000h,0e1h,0f0h,079h,0bch,0dfh,0aah,014h	; 74c4  ...........y....
	defb 001h,086h,02eh,01fh,03fh,0dfh,0aah,010h,040h,088h,0c0h,065h,0b0h,0ddh,0aah,044h	; 74d4  ....?...@..e...D
	defb 089h,012h,026h,007h,04fh,01fh,0aah,014h,049h,040h,080h,012h,080h,0c4h,0a8h,044h	; 74e4  ..&.O...I@.....D
	defb 0b9h,008h,000h,093h,003h,027h,08ah,016h,05dh,0feh,0feh,07eh,0bch,0d8h,0adh,040h	; 74f4  .....'..]..~...@
	defb 024h,0f9h,0f8h,07ch,0bfh,0dfh,0aah,010h,040h,0f6h,0cch,050h,0a0h,0d0h,0a4h,040h	; 7504  $..|....@..P...@
	defb 0a0h,0e4h,0f2h,0d0h,0a0h,0c4h,0a2h,050h,0c4h,094h,088h,050h,0c0h,080h,090h,080h	; 7514  .......P...P....
	defb 0bah,020h,008h,0a0h,080h,090h,0c0h,0a0h,050h,0c4h,07eh,07eh,07fh,03fh,01fh,0aah	; 7524  . ......P.~~.?..
	defb 000h,000h,09eh,01eh,03fh,0bfh,0dfh,0aah,000h,000h,06eh,032h,00bh,007h,00fh,02ah	; 7534  ....?.....n2...*
	defb 000h,000h,026h,04eh,00bh,007h,027h,04ah,000h,000h,02ch,012h,00bh,003h,001h,009h	; 7544  ..&N..'J..,.....
	defb 001h,004h,010h,004h,001h,009h,003h,00ah,000h,000h,024h,003h,042h,0bdh,024h,018h	; 7554  ..........$.B.$.
	defb 001h,003h,024h,042h,042h,000h,03fh,0d5h,0ffh,0aah,0fah,09fh,07fh,0ffh,0fbh,0fbh	; 7564  ..$BB.?.........
	defb 07bh,07dh,05fh,0aah,015h,0ffh,020h,099h,066h,024h,0ffh,0bfh,054h,000h,004h,099h	; 7574  {}_... .f$..T...
	defb 066h,024h,0f8h,082h,002h,042h,024h,099h,066h,024h,00ch,046h,040h,040h,024h,099h	; 7584  f$...B$.f$.F@@$.
	defb 066h,024h,024h,042h,042h,002h,004h,0c0h,0f0h,070h,024h,003h,042h,085h,024h,099h	; 7594  f$$BB....p$.B.$.
	defb 066h,024h,024h,003h,042h,0bdh,020h,083h,00fh,03fh,024h,042h,0ffh,00fh,07fh,0c8h	; 75a4  f$$.B. ..?$B....
	defb 0d7h,0ffh,024h,042h,002h,0f0h,0fch,0a1h,040h,0e8h,024h,042h,040h,008h,010h,031h	; 75b4  ..$B....@.$B@..1
	defb 062h,064h,027h,045h,04fh,04fh,01eh,09eh,05eh,01eh,0c0h,03eh,07fh,057h,0d4h,0eah	; 75c4  bd'EOO..^..>.W..
	defb 0f5h,0fah,0a8h,050h,02ch,094h,08ch,05ch,0dch,0dch,020h,041h,043h,047h,00fh,09fh	; 75d4  ...P,..\.. ACG..
	defb 01fh,03fh,084h,003h,0c2h,095h,0c4h,061h,026h,020h,080h,0a0h,050h,0fbh,0ffh,07ch	; 75e4  .?.....a& ..P..|
	defb 03fh,038h,021h,040h,040h,042h,024h,099h,066h,024h,004h,003h,042h,08ch,024h,099h	; 75f4  ?8!@@B$.f$..B.$.
	defb 066h,024h,07fh,0fbh,0ffh,0ffh,0fbh,0f7h,0e7h,0cbh,003h,0ffh,002h,0f6h,09ch,0ech	; 7604  f$..............
	defb 0c0h,000h,00eh,056h,047h,04bh,007h,08bh,045h,002h,07fh,0bfh,07fh,02ah,095h,0e0h	; 7614  ...VGK..E....*..
	defb 0ffh,0ffh,0bch,078h,0f9h,0f3h,0c7h,01fh,0ffh,0ffh,07fh,007h,0ffh,0a8h,0a7h,0cbh	; 7624  ...x............
	defb 0a5h,0d3h,0e9h,0f0h,0c4h,004h,01dh,00ch,006h,006h,083h,043h,001h,080h,0b1h,0f6h	; 7634  ...........C....
	defb 0fch,078h,078h,031h,082h,004h,0e8h,0f4h,0e0h,03eh,0f8h,0feh,0efh,0f4h,003h,001h	; 7644  .xx1.....>......
	defb 003h,001h,01fh,0f8h,0f0h,0fch,000h	; 7654

; ----------------------------------------------------------------------
; DATOS rachas_765B: rachas a la VRAM (patrones de la piramide 4): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:5033 (289 bytes)
;   0x765b..0x777c  (289 bytes)
DATA_rachas_765B:
	defb 002h,061h,084h,081h,091h,091h,081h,004h,061h,084h,081h,091h,091h,081h,003h,061h	; 765b  .a......a......a
	defb 085h,091h,0a1h,031h,031h,0a1h,004h,091h,08ah,0a1h,031h,031h,0a1h,091h,091h,0f1h	; 766b  ...11.....11....
	defb 0a1h,091h,081h,004h,061h,084h,0f1h,0a1h,091h,081h,004h,061h,084h,0f1h,0a1h,091h	; 767b  ....a......a....
	defb 081h,004h,061h,084h,0f1h,0a1h,091h,081h,004h,061h,084h,0f1h,0a1h,091h,081h,004h	; 768b  ..a......a......
	defb 061h,084h,0f1h,0a1h,0a1h,081h,004h,061h,084h,0f1h,0a1h,091h,081h,004h,061h,084h	; 769b  a......a......a.
	defb 0f1h,0a1h,091h,081h,004h,061h,084h,0f1h,0a1h,091h,081h,004h,061h,084h,0f1h,0a1h	; 76ab  .....a......a...
	defb 091h,081h,004h,061h,084h,0f1h,0a1h,091h,081h,004h,061h,084h,0f1h,0a1h,091h,081h	; 76bb  ...a......a.....
	defb 003h,061h,085h,0e1h,091h,0a1h,091h,081h,004h,061h,084h,0f1h,0a1h,091h,081h,004h	; 76cb  .a.......a......
	defb 061h,084h,0f1h,0a1h,091h,081h,004h,061h,084h,0f1h,0a1h,091h,081h,004h,061h,084h	; 76db  a......a......a.
	defb 0f1h,0a1h,091h,081h,004h,061h,084h,0f1h,0a1h,091h,081h,003h,061h,085h,0e1h,091h	; 76eb  .....a......a...
	defb 0a1h,091h,081h,004h,061h,081h,021h,004h,0c1h,004h,021h,003h,0c1h,085h,031h,021h	; 76fb  ....a.!...!...1!
	defb 021h,0c2h,0c2h,00ah,0c1h,083h,011h,0c1h,021h,007h,0c1h,081h,021h,007h,0c1h,081h	; 770b  !.......!...!...
	defb 021h,007h,0c1h,084h,021h,0c1h,0c1h,021h,004h,0c1h,004h,021h,004h,0c1h,084h,021h	; 771b  !...!..!...!...!
	defb 0c1h,0c1h,021h,007h,0c1h,085h,021h,0c1h,011h,031h,021h,003h,0c2h,085h,021h,0c1h	; 772b  ..!...!..1!...!.
	defb 0c1h,031h,021h,003h,0c2h,081h,021h,007h,0c1h,002h,021h,006h,0c1h,004h,021h,004h	; 773b  .1!...!...!...!.
	defb 0c2h,005h,021h,003h,0c1h,081h,021h,007h,0c1h,003h,021h,083h,0c1h,021h,0c1h,005h	; 774b  ..!...!...!..!..
	defb 021h,005h,0c1h,081h,021h,004h,0c1h,084h,021h,0c1h,0c1h,021h,004h,0c1h,081h,021h	; 775b  !...!...!..!...!
	defb 04ah,0c1h,002h,0c2h,084h,0f2h,071h,0cfh,0c1h,006h,0c2h,084h,0c1h,071h,0cfh,0c1h	; 776b  J.....q......q..
	defb 000h	; 777b

; ----------------------------------------------------------------------
; DATOS rachas_777C: rachas a la VRAM (un paso del caracter animado de la
;   piramide 4): [n < 0x80] repite el byte siguiente, [0x80 + n] copia n,
;   [0x80] otro destino, 0 acaba; lo leen p00:4EB9 (15 bytes)
;   0x777c..0x778b  (15 bytes)
DATA_rachas_777C:
	defb 002h,0c2h,084h,072h,0f1h,0c7h,0c1h,006h,0c2h,084h,0c1h,0f1h,0c7h,0c1h,000h	; 777c  ...r...........

; ----------------------------------------------------------------------
; DATOS rachas_778B: rachas a la VRAM (un paso del caracter animado de la
;   piramide 4): [n < 0x80] repite el byte siguiente, [0x80 + n] copia n,
;   [0x80] otro destino, 0 acaba; lo leen p00:4EB9 (15 bytes)
;   0x778b..0x779a  (15 bytes)
DATA_rachas_778B:
	defb 002h,0c2h,084h,0f2h,071h,0cfh,0c1h,006h,0c2h,084h,0c1h,071h,0cfh,0c1h,000h	; 778b  ....q......q...

; ----------------------------------------------------------------------
; DATOS rachas_779A: rachas a la VRAM (colores de la piramide 5): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:5033 (590 bytes)
;   0x779a..0x79e8  (590 bytes)
DATA_rachas_779A:
	defb 002h,037h,006h,060h,002h,0ech,006h,006h,002h,037h,006h,060h,002h,0ech,006h,006h	; 779a  .7.`.....7.`....
	defb 0deh,07ch,0feh,07ch,0ffh,0c7h,0efh,0c7h,0ffh,040h,0e4h,070h,0ffh,0c7h,0efh,0c7h	; 77aa  .|.|.....@.p....
	defb 000h,000h,026h,00ch,000h,047h,0efh,0c7h,000h,018h,082h,040h,0ffh,0c4h,0eeh,0c7h	; 77ba  ..&..G.....@....
	defb 0ffh,010h,046h,00ch,0ffh,007h,06fh,0c7h,0ffh,040h,019h,018h,0ffh,082h,0c7h,0c2h	; 77ca  ..F...o..@......
	defb 0ffh,004h,030h,000h,000h,027h,00fh,007h,000h,07ch,0feh,07ch,000h,0c4h,0ebh,0c3h	; 77da  ..0..'...|.|....
	defb 000h,070h,0f2h,078h,000h,0c5h,0ech,0c6h,000h,07ch,0f8h,078h,0f0h,0c3h,0e8h,0c0h	; 77ea  .p.x.....|.x....
	defb 0ffh,040h,0c8h,060h,0ffh,0c1h,0e9h,0c4h,000h,078h,0e0h,040h,0ffh,080h,0a2h,003h	; 77fa  .@.`.....x.@....
	defb 000h,0adh,003h,000h,000h,080h,0c0h,0c2h,0ffh,07ch,07eh,07ch,0ffh,007h,0cfh,0c7h	; 780a  .........|~|....
	defb 000h,000h,05eh,01ch,0ffh,087h,07fh,0c7h,0ffh,07ch,01eh,00ch,0ffh,0c7h,017h,003h	; 781a  ..^......|......
	defb 000h,000h,016h,004h,0ffh,087h,08fh,047h,0ffh,01ch,006h,000h,000h,003h,043h,003h	; 782a  .......G......C.
	defb 000h,0ffh,0c0h,040h,000h,003h,007h,047h,000h,030h,080h,080h,0dfh,0c7h,061h,060h	; 783a  ...@...G.0....a`
	defb 0b2h,01eh,08fh,0c4h,0e9h,0dbh,0fah,0f9h,0f2h,04fh,09fh,05fh,0dbh,097h,023h,0f1h	; 784a  .........O._..#.
	defb 078h,04dh,006h,086h,0e3h,0fbh,001h,001h,00ch,000h,0c0h,0fch,00fh,01fh,003h,007h	; 785a  xM..............
	defb 0f0h,012h,0e2h,060h,038h,0c0h,0e0h,0c6h,08eh,000h,007h,018h,067h,052h,029h,0a5h	; 786a  ...`8.......gR).
	defb 094h,006h,00ch,001h,0c3h,0f1h,0fch,018h,03dh,00ah,061h,0f8h,09ch,0cfh,0efh,0c6h	; 787a  ........=.a.....
	defb 006h,01ch,0ffh,081h,07bh,0e0h,0ffh,0e7h,083h,060h,080h,037h,096h,069h,029h,090h	; 788a  ....{....`.7.i).
	defb 0cch,01fh,0e3h,0fch,0f0h,01fh,09fh,066h,083h,0c3h,061h,011h,0f8h,005h,0f3h,009h	; 789a  .......f..a.....
	defb 0e0h,001h,000h,010h,030h,068h,0d0h,0d0h,0e6h,0b8h,0dch,0eeh,0feh,0ech,09ch,038h	; 78aa  ....0h.........8
	defb 070h,0aeh,0f8h,01fh,07fh,00fh,083h,0c0h,0e0h,073h,063h,073h,077h,03fh,0beh,09eh	; 78ba  p........scsw?..
	defb 09fh,0cdh,0b3h,0f9h,079h,07dh,0fch,0eeh,0ceh,0c6h,067h,00bh,00bh,016h,00ch,008h	; 78ca  ....y}....g.....
	defb 000h,080h,071h,063h,007h,003h,01ch,006h,047h,048h,0e0h,0e0h,0d0h,0bch,040h,078h	; 78da  ..qc....GH....@x
	defb 004h,0f0h,0e2h,01eh,002h,03dh,00bh,007h,007h,00eh,01ch,039h,037h,07fh,077h,03bh	; 78ea  .....=.....97.w.
	defb 01dh,0ceh,007h,003h,0c1h,0f0h,0feh,0f8h,01fh,000h,0ffh,07fh,00fh,083h,080h,080h	; 78fa  ................
	defb 083h,0c1h,066h,0f9h,0f8h,00fh,03fh,0c7h,0f8h,033h,009h,094h,096h,069h,0ech,001h	; 790a  ..f...?..3...i..
	defb 006h,007h,090h,0cfh,0a0h,01fh,088h,086h,0c3h,029h,0a5h,094h,04ah,0e6h,018h,0e0h	; 791a  .........)..J...
	defb 000h,0c1h,0e7h,000h,007h,0deh,081h,0ffh,038h,060h,063h,0f7h,0f3h,039h,01fh,086h	; 792a  ........8`c..9..
	defb 050h,0bch,018h,03fh,08fh,0c3h,080h,030h,060h,06fh,00bh,096h,0ach,099h,083h,0bbh	; 793a  P..?...0`o......
	defb 0bbh,0fch,003h,000h,08fh,003h,0dfh,0aeh,0cfh,01fh,0c0h,0fch,00fh,01fh,003h,007h	; 794a  ................
	defb 0f0h,018h,0ffh,081h,07bh,0e0h,0ffh,0e7h,083h,0c0h,007h,018h,067h,052h,029h,0a5h	; 795a  ....{.......gR).
	defb 094h,00eh,007h,0f3h,0f9h,0fch,0feh,0ffh,0ffh,07fh,03fh,0bch,0c1h,0c3h,067h,067h	; 796a  ..........?...gg
	defb 0b7h,0c3h,03ch,0c3h,0ffh,0c3h,003h,000h,002h,00fh,08eh,01eh,002h,03dh,08bh,087h	; 797a  ..<..........=..
	defb 087h,00fh,0e0h,0c0h,0f8h,0f0h,03fh,003h,000h,003h,070h,081h,08eh,003h,0dfh,083h	; 798a  ......?...p.....
	defb 0cfh,001h,07ch,005h,0feh,095h,07ch,0b3h,0f8h,078h,07ch,0fch,0eeh,0ceh,0c7h,0c1h	; 799a  ..|...|..x|.....
	defb 066h,0f9h,0f8h,00fh,03fh,087h,0e0h,0ffh,0ffh,01ch,063h,003h,0f7h,08eh,067h,0ffh	; 79aa  f...?.....c...g.
	defb 0ffh,03ch,0c3h,0e7h,0f7h,0f7h,0e7h,003h,03ch,0c3h,0ffh,0c3h,003h,0ffh,094h,05fh	; 79ba  .<......<......_
	defb 000h,080h,0c1h,0e3h,07bh,003h,001h,00eh,01ch,039h,037h,07fh,077h,0bbh,09dh,000h	; 79ca  ....{....97.w...
	defb 01fh,03fh,03fh,004h,0bfh,085h,001h,03ch,0c3h,0ffh,0c3h,003h,0ffh,000h	; 79da  .??....<......

; ----------------------------------------------------------------------
; DATOS rachas_79E8: rachas a la VRAM (colores de la piramide 5): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:5033 (131 bytes)
;   0x79e8..0x7a6b  (131 bytes)
DATA_rachas_79E8:
	defb 0ffh,0c3h,071h,038h,03ch,03ch,07ch,07dh,0fbh,002h,086h,0cch,06eh,077h,039h,084h	; 79e8  ..q8<<|}....nw9.
	defb 0ceh,07ch,0ffh,07fh,03fh,01eh,000h,039h,04dh,0c4h,0c1h,087h,017h,072h,0bdh,08fh	; 79f8  .|..?..9M....r..
	defb 0b7h,04dh,00dh,019h,019h,031h,036h,069h,070h,070h,069h,066h,060h,032h,01eh,00ch	; 7a08  .M...16ippif`2..
	defb 000h,0b8h,071h,074h,073h,072h,034h,038h,00ch,0c3h,08eh,01ch,03ch,03ch,03eh,0beh	; 7a18  ..qtsr48....<<>.
	defb 0dfh,040h,061h,033h,076h,0eeh,09ch,021h,073h,03eh,0ffh,0feh,0fch,078h,000h,09ch	; 7a28  .@a3v..!s>...x..
	defb 0b2h,023h,083h,0e1h,0e8h,04eh,0bdh,0f1h,0edh,0b2h,0b0h,098h,098h,08ch,06ch,096h	; 7a38  .#...N........l.
	defb 00eh,00eh,096h,066h,006h,04ch,078h,030h,000h,01dh,08eh,02eh,0ceh,04eh,02ch,01ch	; 7a48  ...f.Lx0.....N,.
	defb 030h,039h,05ch,061h,0beh,0d9h,003h,07fh,0bch,09ch,03ah,086h,07dh,09bh,0c0h,0feh	; 7a58  09\a......:.}...
	defb 081h,03dh,000h	; 7a68

; ----------------------------------------------------------------------
; DATOS rachas_7A6B: rachas a la VRAM (patrones de la piramide 5): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:5033 (430 bytes)
;   0x7a6b..0x7c19  (430 bytes)
DATA_rachas_7A6B:
	defb 082h,0b1h,091h,007h,0b1h,081h,091h,006h,0b1h,082h,071h,051h,007h,071h,081h,051h	; 7a6b  ..........qQ.q.Q
	defb 006h,071h,08eh,0f1h,074h,051h,011h,0f1h,074h,051h,011h,0f1h,071h,051h,011h,0f1h	; 7a7b  .q..tQ..tQ..qQ..
	defb 071h,003h,051h,0a0h,071h,051h,051h,0f1h,071h,051h,051h,0f1h,071h,051h,011h,0f1h	; 7a8b  q.Q.qQQ.qQQ.qQ..
	defb 071h,051h,011h,0f1h,071h,051h,011h,0f1h,071h,051h,011h,0f1h,041h,051h,011h,0f1h	; 7a9b  qQ..qQ..qQ..AQ..
	defb 071h,051h,011h,0f1h,003h,071h,0aah,0f1h,071h,051h,051h,0f1h,071h,051h,011h,0f1h	; 7aab  qQ...q..qQQ.qQ..
	defb 071h,051h,011h,0f1h,071h,051h,011h,0f1h,071h,051h,011h,0f1h,071h,051h,011h,0f1h	; 7abb  qQ..qQ..qQ..qQ..
	defb 071h,051h,011h,0f1h,071h,051h,010h,0f1h,071h,051h,0f1h,0f1h,071h,051h,011h,0f1h	; 7acb  qQ..qQ..qQ..qQ..
	defb 071h,006h,041h,08bh,0f1h,071h,051h,011h,0f1h,071h,051h,011h,0f1h,071h,051h,003h	; 7adb  q.A..qQ..qQ..qQ.
	defb 071h,08ch,051h,011h,0f1h,071h,051h,011h,0f1h,071h,051h,011h,0f1h,071h,003h,051h	; 7aeb  q.Q..qQ..qQ..q.Q
	defb 088h,071h,051h,011h,0f1h,071h,051h,011h,0f1h,003h,071h,081h,0f1h,005h,071h,085h	; 7afb  .qQ..qQ...q...q.
	defb 051h,061h,0f1h,071h,051h,021h,061h,003h,091h,084h,098h,086h,086h,061h,005h,091h	; 7b0b  Qa.qQ!a......a..
	defb 007h,061h,081h,091h,005h,081h,081h,091h,004h,081h,081h,098h,004h,081h,004h,096h	; 7b1b  .a..............
	defb 081h,086h,003h,096h,002h,091h,005h,061h,007h,091h,002h,081h,083h,098h,086h,086h	; 7b2b  .......a........
	defb 003h,081h,008h,061h,081h,081h,003h,091h,005h,081h,002h,061h,002h,081h,003h,091h	; 7b3b  ...a.......a....
	defb 084h,098h,081h,081h,061h,006h,081h,00ah,061h,006h,081h,004h,091h,005h,061h,007h	; 7b4b  ....a...a.....a.
	defb 091h,08ah,081h,061h,061h,086h,098h,089h,068h,061h,061h,081h,005h,091h,002h,081h	; 7b5b  ...aa...haa.....
	defb 002h,061h,005h,081h,084h,061h,081h,081h,098h,003h,091h,002h,081h,003h,061h,003h	; 7b6b  .a...a........a.
	defb 081h,002h,086h,083h,098h,081h,081h,007h,091h,009h,061h,005h,081h,081h,091h,005h	; 7b7b  ..........a.....
	defb 061h,083h,096h,091h,091h,003h,096h,081h,086h,004h,096h,004h,081h,081h,098h,004h	; 7b8b  a...............
	defb 081h,081h,091h,006h,081h,004h,061h,003h,091h,081h,081h,004h,061h,002h,091h,084h	; 7b9b  ......a.....a...
	defb 098h,086h,086h,061h,003h,091h,083h,096h,091h,091h,006h,061h,081h,091h,006h,081h	; 7bab  ...a.......a....
	defb 082h,091h,081h,007h,061h,002h,081h,004h,061h,082h,091h,098h,005h,086h,085h,098h	; 7bbb  ....a...a.......
	defb 086h,061h,061h,081h,004h,091h,084h,061h,086h,086h,098h,004h,091h,084h,081h,061h	; 7bcb  .aa....a.......a
	defb 091h,081h,004h,061h,083h,091h,081h,081h,009h,061h,005h,081h,002h,086h,082h,098h	; 7bdb  ...a.....a......
	defb 081h,005h,061h,082h,091h,081h,006h,061h,082h,091h,081h,004h,061h,084h,091h,098h	; 7beb  ..a....a....a...
	defb 088h,086h,006h,061h,002h,081h,003h,061h,002h,091h,002h,081h,002h,061h,002h,081h	; 7bfb  ...a...a.....a..
	defb 002h,091h,002h,081h,005h,061h,084h,091h,098h,081h,086h,003h,061h,000h	; 7c0b  .....a......a.

; ----------------------------------------------------------------------
; DATOS rachas_7C19: rachas a la VRAM (patrones de la piramide 5): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:5033 (112 bytes)
;   0x7c19..0x7c89  (112 bytes)
DATA_rachas_7C19:
	defb 002h,091h,002h,0a1h,003h,0b1h,086h,0a1h,081h,091h,081h,091h,061h,003h,096h,088h	; 7c19  ............a...
	defb 0a9h,091h,091h,081h,061h,091h,061h,061h,003h,096h,002h,086h,002h,081h,087h,091h	; 7c29  ....a.aa........
	defb 081h,091h,091h,081h,061h,061h,004h,081h,002h,061h,083h,081h,091h,081h,009h,061h	; 7c39  ....aa...a.....a
	defb 002h,091h,002h,0a1h,003h,0b1h,086h,0a1h,081h,091h,081h,091h,061h,003h,096h,084h	; 7c49  ............a...
	defb 0a9h,099h,091h,081h,004h,061h,003h,096h,002h,086h,002h,081h,087h,091h,081h,091h	; 7c59  .....a..........
	defb 091h,081h,061h,061h,004h,081h,002h,061h,083h,081h,091h,081h,009h,061h,081h,0b1h	; 7c69  ..aa...a.....a..
	defb 003h,081h,085h,086h,096h,061h,061h,0b1h,003h,081h,084h,086h,096h,061h,061h,000h	; 7c79  .....aa......aa.

; ----------------------------------------------------------------------
; DATOS rachas_7C89: rachas a la VRAM (un paso del caracter animado de la
;   piramide 5): [n < 0x80] repite el byte siguiente, [0x80 + n] copia n,
;   [0x80] otro destino, 0 acaba; lo leen p00:4EB9 (18 bytes)
;   0x7c89..0x7c9b  (18 bytes)
DATA_rachas_7C89:
	defb 081h,0b1h,003h,081h,085h,086h,096h,061h,061h,0b1h,003h,081h,084h,086h,096h,061h	; 7c89  .......aa......a
	defb 061h,000h	; 7c99

; ----------------------------------------------------------------------
; DATOS rachas_7C9B: rachas a la VRAM (un paso del caracter animado de la
;   piramide 5): [n < 0x80] repite el byte siguiente, [0x80 + n] copia n,
;   [0x80] otro destino, 0 acaba; lo leen p00:4EB9 (15 bytes)
;   0x7c9b..0x7caa  (15 bytes)
DATA_rachas_7C9B:
	defb 004h,081h,084h,086h,096h,061h,061h,004h,081h,084h,086h,096h,061h,061h,000h	; 7c9b  .....aa.....aa.

; ----------------------------------------------------------------------
; DATOS rachas_7CAA: rachas a la VRAM (colores de la piramide 6): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:5033 (622 bytes)
;   0x7caa..0x7f18  (622 bytes)
DATA_rachas_7CAA:
	defb 083h,060h,06fh,06fh,005h,060h,083h,006h,0f6h,0f6h,005h,006h,008h,0feh,084h,0c6h	; 7caa  .`oo.`..........
	defb 0e6h,0f8h,0fch,004h,0feh,085h,006h,02eh,09eh,03eh,07eh,003h,0feh,002h,08ch,09dh	; 7cba  .........>~.....
	defb 0c0h,0f0h,0f8h,0fch,0feh,0ffh,022h,002h,00eh,05eh,03eh,07eh,0feh,0ffh,018h,018h	; 7cca  ......"..^>~....
	defb 080h,082h,0c2h,0f0h,0f8h,0ffh,098h,000h,012h,002h,00eh,01eh,03eh,004h,0feh,08ah	; 7cda  ............>...
	defb 0f8h,0f6h,0f6h,0e0h,0ffh,0e0h,0f4h,0f0h,0fah,0fch,004h,0feh,09dh,0fch,0f0h,0e6h	; 7cea  ................
	defb 0e6h,0d0h,080h,0ffh,080h,0e0h,0e8h,0e0h,0f0h,0f8h,0fah,000h,0f8h,0e0h,0c0h,080h	; 7cfa  ................
	defb 0b0h,030h,004h,0ffh,000h,002h,082h,0c8h,0e0h,0f8h,004h,0feh,0a4h,03eh,01eh,06eh	; 7d0a  .0...........>.n
	defb 06eh,00eh,0ffh,006h,02eh,08eh,0beh,03eh,07eh,0feh,0ffh,07eh,03eh,00eh,066h,066h	; 7d1a  n......>~..~>.ff
	defb 012h,002h,0ffh,002h,006h,016h,006h,08eh,08eh,01eh,0ffh,01eh,086h,002h,002h,018h	; 7d2a  ................
	defb 098h,003h,000h,002h,0c0h,0b9h,022h,006h,01eh,0beh,000h,0f0h,0c0h,003h,0c7h,030h	; 7d3a  ......"........0
	defb 08ch,063h,080h,080h,063h,08ch,030h,0c7h,003h,0c0h,0f0h,0b7h,003h,0c0h,0f0h,03ch	; 7d4a  .c..c.0........<
	defb 0cfh,0f3h,03ch,03ch,0f3h,0cfh,03ch,0f0h,0c0h,003h,0b7h,0f0h,0f0h,0fch,03fh,00fh	; 7d5a  ..<<..<.......?.
	defb 003h,0c0h,0f0h,0f0h,0c0h,003h,00fh,03fh,0fch,0f0h,0f0h,0fch,03fh,00fh,003h,003h	; 7d6a  .......?....?...
	defb 034h,0cfh,000h,0fdh,0fdh,0fch,0fch,003h,00fh,03fh,0fch,0efh,0e7h,0c0h,00eh,03ch	; 7d7a  4........?.....<
	defb 0f3h,0cfh,03ch,00fh,003h,03ch,0fch,0f0h,0c0h,003h,00fh,00fh,003h,0c0h,0f0h,0fch	; 7d8a  ..<..<..........
	defb 03ch,003h,00fh,03ch,0cfh,0f3h,03ch,00eh,0c0h,0e7h,0efh,03ch,0f3h,0cfh,03ch,070h	; 7d9a  <..<..<....<..<p
	defb 003h,0e7h,0f7h,0f0h,0c0h,003h,00fh,03fh,03ch,0c0h,0f0h,0f7h,0e7h,003h,070h,03ch	; 7daa  .......?<.....p<
	defb 0cfh,0f3h,03ch,0f0h,0c0h,03ch,03fh,00fh,003h,0c0h,0f0h,00fh,0ffh,09fh,030h,02eh	; 7dba  ..<..<?.......0.
	defb 060h,005h,06eh,0f6h,020h,03fh,09fh,000h,00fh,0f0h,0ffh,071h,0f8h,0fah,002h,0fah	; 7dca  `.n. ?.....q....
	defb 000h,0f8h,002h,0fah,004h,0fch,0f9h,0ffh,0f0h,03fh,0ffh,0f0h,0c0h,002h,00ah,03ah	; 7dda  .........?.....:
	defb 002h,002h,0b8h,03dh,01dh,0c0h,0f0h,0f0h,03fh,078h,000h,0feh,0f8h,003h,00fh,00fh	; 7dea  ...=....?x......
	defb 0fch,0e0h,0e4h,0e4h,004h,0c0h,0f0h,0fch,03fh,00fh,00fh,03fh,0fch,0f0h,0c0h,003h	; 7dfa  ........?..?....
	defb 00fh,00fh,003h,0c0h,0f0h,0fch,03fh,00fh,00fh,0edh,0c0h,003h,00fh,03ch,0f3h,0cfh	; 7e0a  ......?......<..
	defb 03ch,03ch,0cfh,0f3h,03ch,00fh,003h,0c0h,0edh,00fh,003h,0c0h,0e3h,00ch,031h,0c6h	; 7e1a  <<..<.........1.
	defb 001h,001h,0c6h,031h,00ch,0e3h,0c0h,003h,00fh,080h,070h,077h,06fh,01eh,03eh,0bdh	; 7e2a  ...1......pwo.>.
	defb 033h,0bfh,03fh,07fh,07fh,0ffh,0f8h,0c0h,000h,0fdh,003h,0feh,0a0h,0ffh,01fh,003h	; 7e3a  3.?.............
	defb 000h,001h,00eh,0eeh,0f6h,078h,07ch,0bdh,0cch,033h,0bdh,03eh,00eh,067h,077h,070h	; 7e4a  .....x|..3.>.gwp
	defb 080h,000h,0c0h,0f8h,0ffh,07fh,07fh,03fh,0bfh,000h,003h,01fh,0ffh,003h,0feh,08bh	; 7e5a  .......?........
	defb 0fdh,0cch,0bdh,07ch,070h,0e6h,0eeh,00eh,001h,08eh,03eh,003h,0fch,006h,0f8h,003h	; 7e6a  ...|p.....>.....
	defb 0fch,084h,03eh,08eh,071h,07ch,003h,03fh,006h,01fh,003h,03fh,08ch,07ch,071h,05ch	; 7e7a  ..>.q|.?...?.|q\
	defb 03ah,05ch,03ah,05ch,03ah,05ch,03ah,000h,0aah,003h,0ffh,085h,0aah,055h,000h,03ch	; 7e8a  :\:\:\:......U.<
	defb 000h,003h,07eh,084h,000h,03ch,000h,000h,006h,07eh,003h,000h,090h,0feh,000h,0feh	; 7e9a  ..~..<...~......
	defb 002h,0f2h,012h,010h,016h,0f4h,004h,0fch,000h,0feh,000h,000h,038h,004h,0bbh,084h	; 7eaa  ............8...
	defb 038h,000h,000h,038h,004h,0bbh,085h,038h,000h,07eh,07eh,000h,004h,07eh,082h,000h	; 7eba  8..8...8.~~..~..
	defb 0ffh,005h,080h,09fh,0ffh,000h,03fh,0fch,0f0h,0c0h,001h,004h,011h,00eh,0fch,0ffh	; 7eca  ......?.........
	defb 00fh,003h,078h,07eh,080h,07fh,012h,012h,013h,080h,038h,038h,002h,010h,0ffh,0ffh	; 7eda  ..x~......88....
	defb 0e7h,018h,0e7h,003h,0ffh,084h,07eh,066h,018h,066h,004h,07eh,0a0h,0cch,0bdh,07ch	; 7eea  ......~f.f.~...|
	defb 071h,0e7h,0efh,00fh,05fh,033h,0bdh,03eh,08eh,0e7h,0f7h,0f0h,0fah,05fh,00fh,0efh	; 7efa  q..._3.>....._..
	defb 0f7h,079h,07ch,0bdh,0cch,0fah,0f0h,0f7h,0efh,09eh,03eh,0bdh,033h,000h	; 7f0a  .y|.......>.3.

; ----------------------------------------------------------------------
; DATOS rachas_7F18: rachas a la VRAM (patrones de la piramide 6): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0 acaba
;   (sigue en el banco 8, en 0x8000); lo leen p00:5033 (232 bytes)
;   0x7f18..0x8000  (232 bytes)
DATA_rachas_7F18:
	defb 002h,0f1h,081h,051h,004h,0e1h,084h,051h,0f1h,0f1h,051h,004h,0e1h,0ffh,051h,0a1h	; 7f18  ...Q...Q..Q...Q.
	defb 0b1h,0f1h,0b1h,0a1h,0a1h,091h,011h,0a1h,0b1h,0f1h,0b1h,0a1h,0a1h,091h,011h,0a1h	; 7f28  ................
	defb 0b1h,0f1h,0b1h,0a1h,0a1h,091h,011h,0a1h,0b1h,0f1h,0b1h,0a1h,0a1h,091h,011h,0a1h	; 7f38  ................
	defb 0b1h,0f1h,0b1h,0a1h,0a1h,091h,011h,0a1h,0b1h,0f1h,0b1h,0a1h,0a1h,091h,011h,0a1h	; 7f48  ................
	defb 0b1h,0f1h,0b1h,0a1h,0a1h,091h,011h,0a1h,0b1h,0f1h,0b1h,0a1h,0a1h,091h,011h,0a1h	; 7f58  ................
	defb 0b1h,0f1h,0b1h,0a1h,0a1h,091h,011h,0a1h,0b1h,0f1h,0b1h,0a1h,0a1h,091h,011h,0a1h	; 7f68  ................
	defb 0b1h,0f1h,0b1h,0a1h,0a1h,091h,0f1h,0a1h,0b1h,0f1h,0b1h,0a1h,0a1h,091h,011h,0a1h	; 7f78  ................
	defb 0b1h,0f1h,0b1h,0a1h,0a1h,091h,011h,0a1h,0b1h,0f1h,0b1h,0a1h,0a1h,091h,011h,0a1h	; 7f88  ................
	defb 0b1h,0f1h,0b1h,0a1h,0a1h,091h,011h,0a1h,0b1h,0f1h,0b1h,0a1h,0a1h,08eh,091h,011h	; 7f98  ................
	defb 0a1h,0b1h,0f1h,0b1h,0a1h,0a1h,091h,011h,0a1h,0b1h,0f1h,0b1h,005h,0a1h,089h,0b1h	; 7fa8  ................
	defb 0f1h,0b1h,0a1h,0a1h,091h,061h,0c1h,0c1h,004h,021h,084h,0c1h,061h,061h,0c1h,004h	; 7fb8  .....a...!..aa..
	defb 021h,004h,0c1h,00ch,021h,008h,0c1h,004h,021h,00ah,0c1h,085h,051h,041h,041h,0c1h	; 7fc8  !...!...!...QAA.
	defb 051h,003h,041h,007h,0c1h,005h,021h,006h,0c1h,004h,021h,004h,0c1h,081h,031h,006h	; 7fd8  Q.A...!...!...1.
	defb 021h,082h,0c1h,031h,006h,021h,082h,0c1h,031h,003h,021h,004h,0c1h,082h,031h,021h	; 7fe8  !..1.!..1.!...1!
	defb 003h,0c1h,005h,021h,006h,0c1h,002h,021h	; 7ff8  ...!...!
