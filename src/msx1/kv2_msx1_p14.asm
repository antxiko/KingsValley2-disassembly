; ==========================================================================
; KING'S VALLEY II - Konami (1988) - MSX - MegaROM RC-760 de 128 KB (Konami SCC) - banco 14 (se ejecuta en 0x8000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x08000


; ----------------------------------------------------------------------
; DATOS resto_8000: lo apuntan con el banco puesto p00:4645 (0x800C), p00:460F
;   (0x806A); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p00:4645, p00:460F (1239 bytes)
;   0x8000..0x84d7  (1239 bytes)
DATA_resto_8000:
	defb 0e4h,080h,024h,081h,064h,081h,0a4h,081h,0e4h,081h,024h,082h,064h,082h,074h,082h	; 8000  ..$.d.....$.d.t.
	defb 084h,082h,084h,082h,084h,082h,084h,082h,084h,082h,084h,082h,084h,082h,094h,082h	; 8010  ................
	defb 094h,082h,094h,082h,094h,082h,094h,082h,094h,082h,09ah,082h,0a0h,082h,0a0h,082h	; 8020  ................
	defb 0a0h,082h,0a0h,082h,0a0h,082h,0a8h,082h,0a8h,082h,0a8h,082h,0a8h,082h,0a8h,082h	; 8030  ................
	defb 0a8h,082h,0a8h,082h,0a8h,082h,0a8h,082h,0a8h,082h,0aeh,082h,0aeh,082h,0beh,082h	; 8040  ................
	defb 0beh,082h,0beh,082h,0beh,082h,0beh,082h,0beh,082h,0beh,082h,0beh,082h,0ceh,082h	; 8050  ................
	defb 0ceh,082h,0d6h,082h,0d6h,082h,0d6h,082h,0d6h,082h,0d6h,082h,0d6h,082h,0ddh,082h	; 8060  ................
	defb 0e4h,082h,0f1h,082h,0fbh,082h,008h,083h,015h,083h,01ch,083h,023h,083h,024h,083h	; 8070  ............#.$.
	defb 031h,083h,032h,083h,03ch,083h,04ch,083h,056h,083h,06ch,083h,06dh,083h,089h,083h	; 8080  1.2.<.L.V.l.m...
	defb 099h,083h,0a0h,083h,0b3h,083h,0b4h,083h,0b5h,083h,0b6h,083h,0b7h,083h,0b8h,083h	; 8090  ................
	defb 0b9h,083h,0bah,083h,0bbh,083h,0bch,083h,0bdh,083h,0beh,083h,0cbh,083h,0dbh,083h	; 80a0  ................
	defb 0e8h,083h,0fbh,083h,0fch,083h,015h,084h,016h,084h,017h,084h,018h,084h,019h,084h	; 80b0  ................
	defb 01dh,084h,030h,084h,03ah,084h,03bh,084h,042h,084h,043h,084h,04ah,084h,057h,084h	; 80c0  ..0.:...B.C.J.W.
	defb 058h,084h,062h,084h,063h,084h,085h,084h,086h,084h,099h,084h,09ah,084h,0b3h,084h	; 80d0  X.b.c...........
	defb 0b4h,084h,0d6h,084h,045h,045h,033h,01ah,01bh,035h,044h,044h,021h,045h,037h,039h	; 80e0  ....EE3..5DD!E79
	defb 03ah,03bh,044h,020h,023h,045h,03dh,01ch,01dh,03fh,044h,022h,045h,045h,036h,01eh	; 80f0  :.D #E=..?D"EE6.
	defb 01fh,038h,044h,044h,01bh,035h,028h,029h,02ah,028h,033h,01ah,03ah,03bh,02bh,02ch	; 8100  .8DD.5()*(3.:.+,
	defb 02eh,030h,037h,039h,01dh,03fh,018h,02dh,02fh,019h,03dh,01ch,01fh,038h,034h,031h	; 8110  .079.?.-/.=..841
	defb 032h,034h,036h,01eh,020h,021h,02eh,018h,020h,021h,026h,018h,04dh,02ch,01bh,02bh	; 8120  246. !.. !&.M,.+
	defb 023h,026h,019h,027h,02ch,01bh,02dh,04fh,028h,019h,027h,024h,01bh,02fh,022h,030h	; 8130  #&.',.-O(.'$./"0
	defb 01ah,029h,04eh,02ah,01ch,032h,034h,018h,01ch,032h,034h,018h,031h,01dh,01bh,033h	; 8140  .)N*.24..24.1..3
	defb 031h,01dh,01bh,033h,034h,01bh,01eh,032h,034h,01bh,01eh,032h,01bh,033h,035h,01fh	; 8150  1..34..24..2.35.
	defb 01bh,033h,035h,01fh,018h,019h,01ah,01bh,027h,04fh,01dh,01eh,01fh,020h,021h,04eh	; 8160  .35.....'O... !N
	defb 023h,019h,024h,031h,024h,026h,027h,04ch,024h,02ah,02bh,02ch,02dh,02eh,02fh,030h	; 8170  #.$1$&'L$*+,-./0
	defb 031h,04bh,048h,033h,034h,035h,036h,037h,038h,039h,03ah,03bh,03ch,03dh,03eh,04ah	; 8180  1KH3456789:.<=>J
	defb 040h,041h,035h,042h,043h,044h,045h,049h,046h,035h,035h,047h,02dh,03fh,032h,035h	; 8190  @A5BCDEIF55G-?25
	defb 028h,04dh,048h,01ch,018h,019h,01fh,020h,021h,022h,023h,024h,025h,026h,027h,028h	; 81a0  (MH.... !"#$%&'(
	defb 02dh,02eh,01ah,029h,02fh,030h,031h,032h,033h,02ah,034h,035h,02bh,01bh,01ch,01dh	; 81b0  -..)/0123*45+...
	defb 020h,01eh,02ch,020h,018h,019h,01fh,020h,021h,022h,023h,024h,025h,026h,027h,028h	; 81c0   ., ... !"#$%&'(
	defb 02dh,02eh,01ah,029h,02fh,030h,031h,032h,033h,02ah,034h,035h,02bh,01bh,01ch,01dh	; 81d0  -..)/0123*45+...
	defb 020h,01eh,02ch,020h,01ch,01eh,022h,021h,018h,01fh,023h,027h,02dh,020h,01dh,025h	; 81e0   ., .."!..#'- .%
	defb 029h,019h,024h,026h,02eh,033h,01ah,028h,02ah,02bh,036h,02ch,02fh,031h,037h,01bh	; 81f0  ).$&.3.(*+6,/17.
	defb 035h,032h,034h,041h,039h,030h,03ah,03ch,022h,03bh,03eh,03fh,03fh,042h,040h,020h	; 8200  524A90:<".>??B@
	defb 01dh,043h,044h,046h,047h,03fh,04ah,033h,01ah,04bh,038h,048h,03fh,047h,03dh,045h	; 8210  .CDFG?J3.K8H?G=E
	defb 037h,049h,04ch,047h,019h,01ah,01ch,02dh,02eh,030h,032h,035h,01eh,022h,023h,028h	; 8220  7ILG...-.025."#(
	defb 02ah,024h,025h,04ch,01fh,021h,020h,029h,02bh,026h,027h,02fh,018h,01bh,01dh,02ch	; 8230  *$%L.! )+&'/...,
	defb 04dh,031h,033h,034h,036h,037h,038h,039h,036h,043h,043h,039h,03eh,044h,048h,040h	; 8240  M13467896CC9>DH@
	defb 042h,04fh,048h,042h,03fh,050h,046h,041h,042h,044h,04eh,042h,03ah,03bh,03ch,03dh	; 8250  BOHB?PFABDNB:.<=
	defb 03ah,043h,043h,03dh,046h,047h,048h,049h,03ch,04fh,050h,03eh,024h,040h,041h,025h	; 8260  :CC=FGHI<OP>$@A%
	defb 04ah,042h,043h,04bh,046h,047h,048h,049h,03ch,051h,052h,03eh,024h,04ch,026h,027h	; 8270  JBCKFGHI<QR>$L&'
	defb 04ah,04dh,04eh,04bh,045h,049h,04bh,046h,042h,03dh,03fh,043h,03ch,03eh,040h,041h	; 8280  JMNKEIKFB=?C<>@A
	defb 047h,044h,04ah,048h,036h,039h,04ch,025h,038h,03bh,036h,039h,037h,03ah,038h,03bh	; 8290  GDJH69L%8.697:8.
	defb 018h,019h,01ah,01bh,01ch,01dh,01eh,01fh,036h,037h,036h,037h,036h,037h,04dh,04eh	; 82a0  ........676767MN
	defb 055h,054h,04fh,050h,057h,056h,051h,05bh,05ch,058h,052h,053h,05ah,059h,036h,044h	; 82b0  UTOPWVQ[\XRSZY6D
	defb 046h,039h,045h,04bh,045h,048h,046h,044h,04eh,04ah,03ah,04ah,047h,03dh,042h,03fh	; 82c0  F9EKEHFDNJ:JG=B?
	defb 051h,052h,053h,054h,042h,03eh,090h,030h,000h,091h,0b0h,000h,0ffh,091h,040h,000h	; 82d0  QRSTB>.0......@.
	defb 091h,0a0h,000h,0ffh,010h,030h,000h,010h,0b0h,000h,011h,031h,000h,011h,0b1h,000h	; 82e0  .....0.....1....
	defb 0ffh,011h,070h,000h,050h,020h,000h,050h,0c0h,000h,0ffh,021h,0d0h,000h,091h,020h	; 82f0  ..p.P .P...!...
	defb 000h,020h,011h,000h,090h,0c1h,000h,0ffh,031h,040h,000h,030h,0a0h,000h,091h,041h	; 8300  . ......1@.0...A
	defb 000h,090h,0a1h,000h,0ffh,010h,040h,000h,011h,0a0h,000h,0ffh,031h,042h,000h,030h	; 8310  ......@.....1B.0
	defb 08ah,000h,0ffh,0ffh,009h,050h,000h,009h,0b0h,000h,008h,031h,000h,008h,091h,000h	; 8320  .....P.....1....
	defb 0ffh,0ffh,067h,040h,004h,027h,0d0h,004h,050h,051h,000h,0ffh,050h,048h,000h,076h	; 8330  ..g@.'..PQ..PH.v
	defb 030h,006h,048h,061h,000h,046h,05ah,003h,06eh,09ah,004h,0ffh,017h,041h,004h,017h	; 8340  0.Ha.FZ.n....A..
	defb 0b1h,004h,09eh,079h,004h,0ffh,00eh,020h,004h,00eh,0c0h,004h,00eh,041h,004h,00eh	; 8350  ...y... .....A..
	defb 0b1h,004h,00eh,022h,004h,008h,072h,000h,00eh,0d2h,004h,0ffh,0ffh,00fh,010h,004h	; 8360  ..."..r.........
	defb 010h,038h,000h,00fh,070h,004h,038h,051h,000h,038h,091h,000h,09eh,031h,004h,09fh	; 8370  .8..p.8Q.8...1..
	defb 0c1h,004h,00eh,0d2h,004h,09fh,052h,004h,0ffh,08eh,088h,006h,0a7h,041h,003h,0a7h	; 8380  ......R......A..
	defb 0b1h,003h,010h,0d2h,000h,070h,012h,000h,0ffh,016h,038h,004h,016h,0c8h,004h,0ffh	; 8390  .....p....8.....
	defb 00fh,078h,005h,086h,060h,004h,086h,090h,004h,000h,071h,000h,087h,041h,003h,087h	; 83a0  .x..`.....q..A..
	defb 0b1h,003h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,01eh,0d8h	; 83b0  ................
	defb 007h,03eh,018h,007h,03eh,060h,003h,03eh,090h,003h,0ffh,00eh,010h,006h,03eh,068h	; 83c0  .>..>`.>......>h
	defb 006h,06eh,0e0h,006h,0a6h,068h,003h,0a6h,0e0h,003h,0ffh,00eh,039h,003h,00eh,0b9h	; 83d0  .n...h......9...
	defb 003h,0a6h,062h,003h,0a6h,092h,003h,0ffh,06eh,02ah,004h,06eh,0cah,004h,09eh,02ah	; 83e0  ..b.....n*.n...*
	defb 004h,09eh,0cah,004h,00eh,033h,004h,00eh,0c3h,004h,0ffh,0ffh,016h,060h,004h,016h	; 83f0  .....3.......`..
	defb 090h,004h,096h,060h,004h,096h,090h,004h,016h,062h,004h,016h,092h,004h,096h,062h	; 8400  ...`.....b.....b
	defb 004h,096h,092h,004h,0ffh,0ffh,0ffh,0ffh,0ffh,038h,071h,000h,0ffh,020h,020h,000h	; 8410  .........8q..  .
	defb 020h,0c0h,000h,018h,011h,000h,018h,071h,000h,018h,0d1h,000h,010h,072h,000h,0ffh	; 8420   ......q.....r..
	defb 038h,073h,000h,030h,04dh,000h,030h,09dh,000h,0ffh,0ffh,008h,020h,000h,008h,0c0h	; 8430  8s.0M.0..... ...
	defb 000h,0ffh,0ffh,050h,071h,000h,018h,072h,000h,0ffh,010h,018h,000h,010h,0c8h,000h	; 8440  ...Pq..r........
	defb 088h,018h,000h,088h,0c8h,000h,0ffh,0ffh,000h,040h,000h,000h,0a0h,000h,040h,0e0h	; 8450  .........@....@.
	defb 000h,0ffh,0ffh,000h,040h,000h,000h,0a0h,000h,072h,0b8h,000h,080h,020h,000h,000h	; 8460  ....@....r... ..
	defb 021h,000h,000h,041h,000h,052h,0b9h,000h,080h,0c1h,000h,000h,022h,000h,000h,082h	; 8470  !..A.R......"...
	defb 000h,080h,0c2h,000h,0ffh,0ffh,000h,080h,000h,000h,0c0h,000h,032h,0b8h,000h,092h	; 8480  ............2...
	defb 0b8h,000h,040h,001h,000h,052h,0b9h,000h,0ffh,0ffh,000h,020h,000h,000h,0c0h,000h	; 8490  ..@..R..... ....
	defb 060h,0a0h,000h,092h,0b8h,000h,000h,021h,000h,000h,0c1h,000h,072h,039h,000h,080h	; 84a0  `......!....r9..
	defb 001h,000h,0ffh,0ffh,000h,080h,000h,020h,040h,000h,000h,041h,000h,000h,0a1h,000h	; 84b0  ....... @..A....
	defb 000h,022h,000h,060h,022h,000h,072h,0bah,000h,000h,0a3h,000h,040h,023h,000h,092h	; 84c0  .".`".r.....@#..
	defb 03bh,000h,0a0h,063h,000h,0ffh,0ffh	; 84d0

; ----------------------------------------------------------------------
; DATOS posturas: 7 punteros, uno por lo que lleva el personaje (0xE287): una
;   tabla por direccion; lo leen p00:567A (14 bytes)
;   0x84d7..0x84e5  (14 bytes)
DATA_posturas:
	defw 084e5h,084f9h,08511h,08529h,08541h,08559h,08571h	; 84d7

; ----------------------------------------------------------------------
; DATOS postura_0: 10 punteros, uno por direccion: las rachas de sus sprites;
;   lo leen p00:5686 (20 bytes)
;   0x84e5..0x84f9  (20 bytes)
DATA_postura_0:
	defw 085a5h,08604h,08662h,086bch,0871bh,08778h,087d1h,0881fh	; 84e5
	defw 08873h,088cfh	; 84f5  -> DATA_rachas_8873 DATA_rachas_88CF

; ----------------------------------------------------------------------
; DATOS postura_1: 12 punteros, uno por direccion: las rachas de sus sprites;
;   lo leen p00:5686 (24 bytes)
;   0x84f9..0x8511  (24 bytes)
DATA_postura_1:
	defw 089e9h,08a4ah,08aach,08b0bh,08b6ch,08bcdh,08c2bh,08c87h	; 84f9
	defw 08ce3h,0892bh,08d4dh,0898ah	; 8509  -> DATA_rachas_8CE3 DATA_rachas_892B DATA_rachas_8D4D DATA_rachas_898A

; ----------------------------------------------------------------------
; DATOS postura_2: 12 punteros, uno por direccion: las rachas de sus sprites;
;   lo leen p00:5686 (24 bytes)
;   0x8511..0x8529  (24 bytes)
DATA_postura_2:
	defw 08db5h,08e18h,08e7dh,08edch,08f3fh,08fa3h,09001h,09061h	; 8511
	defw 090bfh,0892bh,09128h,0898ah	; 8521  -> DATA_rachas_90BF DATA_rachas_892B DATA_rachas_9128 DATA_rachas_898A

; ----------------------------------------------------------------------
; DATOS postura_3: 12 punteros, uno por direccion: las rachas de sus sprites;
;   lo leen p00:5686 (24 bytes)
;   0x8529..0x8541  (24 bytes)
DATA_postura_3:
	defw 09672h,096e6h,09759h,097c9h,0983dh,098b1h,09922h,0997ch	; 8529
	defw 099ddh,09a3bh,09a9bh,09af9h	; 8539  -> DATA_rachas_99DD DATA_rachas_9A3B DATA_rachas_9A9B DATA_rachas_9AF9

; ----------------------------------------------------------------------
; DATOS postura_4: 12 punteros, uno por direccion: las rachas de sus sprites;
;   lo leen p00:5686 (24 bytes)
;   0x8541..0x8559  (24 bytes)
DATA_postura_4:
	defw 0918fh,091ffh,09271h,092ddh,0934dh,093bfh,0942dh,09491h	; 8541
	defw 094f2h,09553h,095b2h,09613h	; 8551  -> DATA_rachas_94F2 DATA_rachas_9553 DATA_rachas_95B2 DATA_rachas_9613

; ----------------------------------------------------------------------
; DATOS postura_5: 12 punteros, uno por direccion: las rachas de sus sprites;
;   lo leen p00:5686 (24 bytes)
;   0x8559..0x8571  (24 bytes)
DATA_postura_5:
	defw 09fdah,0a03bh,0a09dh,0a0fbh,0a15ch,0a1bdh,0a21ah,0a273h	; 8559
	defw 0a2cdh,0a32dh,0a389h,0a3e9h	; 8569

; ----------------------------------------------------------------------
; DATOS postura_6: 12 punteros, uno por direccion: las rachas de sus sprites;
;   lo leen p00:5686 (24 bytes)
;   0x8571..0x8589  (24 bytes)
DATA_postura_6:
	defw 09b59h,09bb8h,09c17h,09c76h,09cd5h,09d33h,09d91h,09dedh	; 8571
	defw 09e48h,09ea7h,09f11h,09f70h	; 8581  -> DATA_rachas_9E48 DATA_rachas_9EA7 DATA_rachas_9F11 DATA_rachas_9F70

; ----------------------------------------------------------------------
; DATOS spr_8589: 7 punteros a las rachas de los sprites del personaje muerto,
;   por direccion; lo leen p00:5696 (14 bytes)
;   0x8589..0x8597  (14 bytes)
DATA_spr_8589:
	defw 0a446h,0a4a2h,0a4fch,0a559h,0a5c1h,0a62fh,0a69eh	; 8589

; ----------------------------------------------------------------------
; DATOS spr_8597: 7 punteros a las rachas de los sprites del personaje en
;   pausa; lo leen p00:56A6 (14 bytes)
;   0x8597..0x85a5  (14 bytes)
DATA_spr_8597:
	defw 0b5b7h,0b422h,0b48ah,0b4e8h,0b550h,0a5c1h,0a62fh	; 8597

; ----------------------------------------------------------------------
; DATOS rachas_85A5: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D, p00:5824 (95 bytes)
;   0x85a5..0x8604  (95 bytes)
DATA_rachas_85A5:
	defb 002h,000h,082h,004h,003h,006h,000h,096h,004h,00bh,000h,001h,003h,001h,000h,000h	; 85a5  ................
	defb 0e8h,078h,0fch,03ch,00ch,002h,000h,008h,01ch,0e8h,000h,0f0h,0eeh,018h,008h,000h	; 85b5  .x.<............
	defb 002h,002h,086h,006h,007h,003h,000h,010h,012h,009h,000h,087h,0c0h,0d0h,0f0h,0c0h	; 85c5  ................
	defb 000h,002h,006h,008h,000h,088h,004h,00bh,004h,003h,005h,005h,009h,008h,008h,000h	; 85d5  ................
	defb 090h,0f8h,014h,084h,002h,0c2h,032h,02dh,00eh,004h,01bh,024h,02dh,012h,01ch,00eh	; 85e5  ......2-...$-...
	defb 007h,008h,000h,088h,034h,0e2h,015h,0f9h,00fh,011h,0e7h,01eh,008h,000h,000h	; 85f5  ....4..........

; ----------------------------------------------------------------------
; DATOS rachas_8604: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D, p00:582D (94 bytes)
;   0x8604..0x8662  (94 bytes)
DATA_rachas_8604:
	defb 083h,000h,004h,003h,007h,000h,002h,003h,005h,000h,08eh,0e8h,078h,0fch,03ch,00ch	; 8604  ............x.<.
	defb 002h,000h,000h,030h,078h,088h,000h,088h,0f0h,008h,000h,002h,002h,083h,006h,007h	; 8614  ...0x...........
	defb 003h,003h,000h,081h,001h,008h,000h,084h,0c0h,0d0h,0f0h,0c0h,003h,000h,081h,070h	; 8624  ...............p
	defb 007h,000h,089h,004h,00bh,004h,003h,005h,005h,009h,008h,004h,007h,000h,091h,0f8h	; 8634  ................
	defb 014h,084h,002h,0c2h,032h,02dh,00eh,038h,003h,004h,004h,002h,001h,001h,000h,003h	; 8644  ....2-.8........
	defb 008h,000h,088h,0cch,084h,074h,08ch,074h,008h,0f8h,0f0h,008h,000h,000h	; 8654  .....t.t......

; ----------------------------------------------------------------------
; DATOS rachas_8662: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D, p00:5836 (90 bytes)
;   0x8662..0x86bc  (90 bytes)
DATA_rachas_8662:
	defb 002h,000h,082h,004h,003h,00ah,000h,081h,001h,003h,000h,08eh,0e8h,078h,0fch,03ch	; 8662  .............x.<
	defb 00ch,002h,000h,008h,038h,0f0h,048h,03ch,08eh,004h,008h,000h,002h,002h,086h,006h	; 8672  ....8.H<........
	defb 007h,003h,000h,002h,003h,009h,000h,086h,0c0h,0d0h,0f0h,0c0h,000h,002h,009h,000h	; 8682  ................
	defb 088h,004h,00bh,004h,003h,005h,005h,009h,008h,008h,000h,090h,0f8h,014h,084h,002h	; 8692  ................
	defb 0c2h,032h,02dh,00eh,004h,003h,005h,004h,007h,00ah,00fh,007h,008h,000h,088h,034h	; 86a2  .2-............4
	defb 0c6h,00dh,0b6h,0c2h,071h,08bh,09eh,008h,000h,000h	; 86b2  ....q.....

; ----------------------------------------------------------------------
; DATOS rachas_86BC: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D, p00:5860 (95 bytes)
;   0x86bc..0x871b  (95 bytes)
DATA_rachas_86BC:
	defb 002h,000h,092h,017h,01eh,03fh,03ch,030h,040h,000h,010h,038h,017h,000h,00fh,077h	; 86bc  .....?<0@..8...w
	defb 018h,000h,000h,020h,0c0h,006h,000h,086h,020h,0d0h,000h,080h,0c0h,080h,009h,000h	; 86cc  ... .... .......
	defb 087h,003h,00bh,00fh,003h,000h,040h,060h,008h,000h,002h,040h,086h,060h,0e0h,0c0h	; 86dc  ......@`...@.`..
	defb 000h,008h,048h,008h,000h,088h,01fh,028h,021h,040h,043h,04ch,0b4h,070h,008h,000h	; 86ec  ..H....(!@CL.p..
	defb 090h,020h,0d0h,020h,0c0h,0a0h,0a0h,090h,010h,02ch,047h,0a8h,09fh,0f0h,088h,0e7h	; 86fc  . . .....,G.....
	defb 078h,008h,000h,088h,020h,0d8h,024h,0b4h,048h,038h,070h,0e0h,008h,000h,000h	; 870c  x... .$.H8p....

; ----------------------------------------------------------------------
; DATOS rachas_871B: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D, p00:5869 (93 bytes)
;   0x871b..0x8778  (93 bytes)
DATA_rachas_871B:
	defb 093h,000h,017h,01eh,03fh,03ch,030h,040h,000h,000h,00ch,01eh,011h,000h,011h,00fh	; 871b  ....?<0@........
	defb 000h,000h,020h,0c0h,007h,000h,002h,0c0h,00ch,000h,084h,003h,00bh,00fh,003h,003h	; 872b  .. .............
	defb 000h,081h,00eh,007h,000h,002h,040h,083h,060h,0e0h,0c0h,003h,000h,081h,080h,007h	; 873b  ......@.`.......
	defb 000h,089h,01fh,028h,021h,040h,043h,04ch,0b4h,070h,01ch,007h,000h,091h,020h,0d0h	; 874b  ...(!@CL.p.... .
	defb 020h,0c0h,0a0h,0a0h,090h,010h,020h,033h,021h,02eh,031h,02eh,010h,01fh,00fh,008h	; 875b   ..... 3!.1.....
	defb 000h,088h,0c0h,020h,020h,040h,080h,080h,000h,0c0h,008h,000h,000h	; 876b  ...  @.......

; ----------------------------------------------------------------------
; DATOS rachas_8778: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D, p00:5872 (89 bytes)
;   0x8778..0x87d1  (89 bytes)
DATA_rachas_8778:
	defb 002h,000h,092h,017h,01eh,03fh,03ch,030h,040h,000h,010h,01ch,00fh,012h,03ch,071h	; 8778  .....?<0@.....<q
	defb 020h,000h,000h,020h,0c0h,00ah,000h,081h,080h,00ah,000h,086h,003h,00bh,00fh,003h	; 8788   .. ............
	defb 000h,040h,009h,000h,002h,040h,086h,060h,0e0h,0c0h,000h,040h,0c0h,008h,000h,088h	; 8798  .@...@.`...@....
	defb 01fh,028h,021h,040h,043h,04ch,0b4h,070h,008h,000h,090h,020h,0d0h,020h,0c0h,0a0h	; 87a8  .(!@CL.p... . ..
	defb 0a0h,090h,010h,02ch,063h,0b0h,06dh,043h,08eh,0d1h,079h,008h,000h,088h,020h,0c0h	; 87b8  ...,c.mC..y... .
	defb 0a0h,020h,0e0h,050h,0f0h,0e0h,008h,000h,000h	; 87c8  . .P.....

; ----------------------------------------------------------------------
; DATOS rachas_87D1: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (78 bytes)
;   0x87d1..0x881f  (78 bytes)
DATA_rachas_87D1:
	defb 09eh,000h,001h,006h,00fh,00fh,02fh,037h,01fh,007h,018h,00fh,004h,003h,007h,007h	; 87d1  ....../7........
	defb 001h,000h,080h,060h,0f0h,0f0h,0f4h,0ech,098h,0e0h,014h,0f8h,00ch,0f0h,038h,01dh	; 87e1  ...`..........8.
	defb 000h,081h,004h,00ch,000h,088h,006h,009h,010h,030h,050h,048h,060h,038h,008h,000h	; 87f1  .........0PH`8..
	defb 090h,060h,090h,008h,00ch,00ah,012h,064h,01ah,027h,010h,00bh,00ch,008h,008h,00eh	; 8801  .`.....d.'......
	defb 01fh,008h,000h,087h,0eah,006h,0f2h,00ch,0c6h,0bch,080h,009h,000h,000h	; 8811  ..............

; ----------------------------------------------------------------------
; DATOS rachas_881F: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (84 bytes)
;   0x881f..0x8873  (84 bytes)
DATA_rachas_881F:
	defb 0a0h,001h,006h,00fh,00fh,02fh,037h,01fh,007h,000h,02ch,01fh,030h,00fh,01ch,000h	; 881f  ...../7...,.0...
	defb 000h,080h,060h,0f0h,0f0h,0f4h,0ech,098h,0e0h,008h,038h,0f0h,020h,0c0h,0e0h,0e0h	; 882f  ..`.......8. ...
	defb 080h,00bh,000h,081h,030h,00eh,000h,081h,004h,00dh,000h,088h,009h,010h,030h,050h	; 883f  ....0.........0P
	defb 048h,020h,038h,04fh,008h,000h,08fh,090h,008h,00ch,00ah,012h,064h,01ah,0f4h,053h	; 884f  H 8O........d..S
	defb 060h,04fh,030h,063h,03dh,001h,009h,000h,088h,0c4h,008h,0d0h,030h,010h,010h,070h	; 885f  `O0c=.......0..p
	defb 0f8h,008h,000h,000h	; 886f

; ----------------------------------------------------------------------
; DATOS rachas_8873: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (92 bytes)
;   0x8873..0x88cf  (92 bytes)
DATA_rachas_8873:
	defb 002h,000h,083h,009h,006h,001h,005h,000h,085h,018h,007h,000h,007h,002h,003h,000h	; 8873  ................
	defb 08dh,0d0h,0f0h,0f8h,078h,018h,004h,000h,01ch,038h,0c0h,028h,0dch,008h,009h,000h	; 8883  ....x....8.(....
	defb 088h,004h,005h,00dh,00fh,027h,020h,000h,002h,009h,000h,086h,080h,0a0h,0e0h,080h	; 8893  .....' .........
	defb 002h,006h,009h,000h,088h,009h,016h,009h,006h,00bh,00ah,012h,030h,008h,000h,08fh	; 88a3  ............0...
	defb 0f0h,028h,008h,004h,084h,064h,05ah,01ch,058h,047h,038h,00dh,038h,01dh,00eh,009h	; 88b3  .(...dZ.XG8.8...
	defb 000h,087h,062h,0c5h,039h,0d6h,022h,0f6h,01ch,009h,000h,000h	; 88c3  ..b.9.".....

; ----------------------------------------------------------------------
; DATOS rachas_88CF: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (92 bytes)
;   0x88cf..0x892b  (92 bytes)
DATA_rachas_88CF:
	defb 002h,000h,08dh,00bh,00fh,01fh,01eh,018h,020h,000h,038h,01ch,003h,014h,03bh,010h	; 88cf  ........ .8.....
	defb 003h,000h,083h,090h,060h,080h,005h,000h,085h,018h,0e0h,000h,0e0h,040h,00ah,000h	; 88df  ....`........@..
	defb 086h,001h,005h,007h,001h,040h,060h,009h,000h,088h,020h,0a0h,0b0h,0f0h,0e4h,004h	; 88ef  .....@`... .....
	defb 000h,040h,008h,000h,088h,00fh,014h,010h,020h,021h,026h,05ah,038h,008h,000h,08fh	; 88ff  .@...... !&Z8...
	defb 090h,068h,090h,060h,0d0h,050h,048h,00ch,046h,0a3h,09ch,06bh,044h,06fh,038h,009h	; 890f  .h.`.PH.F..kDo8.
	defb 000h,087h,01ah,0e2h,01ch,0b0h,01ch,0b8h,070h,009h,000h,000h	; 891f  ........p...

; ----------------------------------------------------------------------
; DATOS rachas_892B: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (95 bytes)
;   0x892b..0x898a  (95 bytes)
DATA_rachas_892B:
	defb 002h,000h,082h,004h,003h,006h,000h,096h,00ch,00bh,000h,001h,003h,001h,000h,000h	; 892b  ................
	defb 0e8h,078h,0fch,03ch,00ch,002h,000h,008h,01ch,0e8h,000h,0f0h,0eeh,018h,008h,000h	; 893b  .x.<............
	defb 002h,002h,086h,006h,007h,033h,020h,000h,002h,009h,000h,087h,0c0h,0d0h,0f0h,0c0h	; 894b  .....3 .........
	defb 000h,002h,006h,008h,000h,088h,004h,00bh,004h,003h,005h,005h,009h,038h,008h,000h	; 895b  .............8..
	defb 090h,0f8h,014h,084h,002h,0c2h,032h,02dh,00eh,04ch,053h,034h,00dh,002h,01ch,00eh	; 896b  ......2-.LS4....
	defb 007h,008h,000h,088h,034h,0e2h,015h,0f9h,00fh,011h,0e7h,01eh,008h,000h,000h	; 897b  ....4..........

; ----------------------------------------------------------------------
; DATOS rachas_898A: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (95 bytes)
;   0x898a..0x89e9  (95 bytes)
DATA_rachas_898A:
	defb 002h,000h,092h,017h,01eh,03fh,03ch,030h,040h,000h,010h,038h,017h,000h,00fh,077h	; 898a  .....?<0@..8...w
	defb 018h,000h,000h,020h,0c0h,006h,000h,086h,030h,0d0h,000h,080h,0c0h,080h,009h,000h	; 899a  ... ....0.......
	defb 087h,003h,00bh,00fh,003h,000h,040h,060h,008h,000h,002h,040h,086h,060h,0e0h,0cch	; 89aa  ......@`...@.`..
	defb 004h,000h,040h,008h,000h,088h,01fh,028h,021h,040h,043h,04ch,0b4h,070h,008h,000h	; 89ba  ..@....(!@CL.p..
	defb 090h,020h,0d0h,020h,0c0h,0a0h,0a0h,090h,01ch,02ch,047h,0a8h,09fh,0f0h,088h,0e7h	; 89ca  . . .....,G.....
	defb 078h,008h,000h,088h,032h,0cah,02ch,0b0h,040h,038h,070h,0e0h,008h,000h,000h	; 89da  x...2.,.@8p....

; ----------------------------------------------------------------------
; DATOS rachas_89E9: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (97 bytes)
;   0x89e9..0x8a4a  (97 bytes)
DATA_rachas_89E9:
	defb 002h,000h,082h,004h,003h,006h,000h,096h,00ch,00bh,000h,001h,003h,001h,000h,000h	; 89e9  ................
	defb 0e8h,078h,0fch,03ch,00ch,002h,000h,008h,01ch,0e8h,000h,0f0h,0eeh,018h,005h,000h	; 89f9  .x.<............
	defb 003h,030h,002h,032h,086h,036h,007h,033h,020h,000h,002h,009h,000h,087h,0c0h,0d0h	; 8a09  .0.2.6.3 .......
	defb 0f0h,0c0h,000h,002h,006h,008h,000h,088h,034h,04bh,04ch,04bh,04dh,04dh,049h,0f8h	; 8a19  ........4KLKMMI.
	defb 008h,000h,090h,0f8h,014h,084h,002h,0c2h,032h,02dh,00eh,04ch,053h,034h,00dh,002h	; 8a29  ........2-.LS4..
	defb 01ch,00eh,007h,008h,000h,088h,034h,0e2h,015h,0f9h,00fh,011h,0e7h,01eh,008h,000h	; 8a39  ......4.........
	defb 000h	; 8a49

; ----------------------------------------------------------------------
; DATOS rachas_8A4A: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (98 bytes)
;   0x8a4a..0x8aac  (98 bytes)
DATA_rachas_8A4A:
	defb 083h,000h,004h,003h,006h,000h,083h,00ch,00bh,003h,005h,000h,08eh,0e8h,078h,0fch	; 8a4a  ..............x.
	defb 03ch,00ch,002h,000h,000h,030h,078h,088h,000h,088h,0f0h,005h,000h,003h,030h,002h	; 8a5a  <....0x.......0.
	defb 032h,087h,036h,007h,033h,020h,000h,000h,001h,008h,000h,084h,0c0h,0d0h,0f0h,0c0h	; 8a6a  2.6.3 ..........
	defb 003h,000h,081h,070h,007h,000h,089h,034h,04bh,04ch,04bh,04dh,04dh,049h,0f8h,04ch	; 8a7a  ...p...4KLKMMI.L
	defb 007h,000h,091h,0f8h,014h,084h,002h,0c2h,032h,02dh,00eh,038h,053h,034h,00ch,002h	; 8a8a  ........2-.8S4..
	defb 001h,001h,000h,003h,008h,000h,088h,0cch,084h,074h,08ch,074h,008h,0f8h,0f0h,008h	; 8a9a  .........t.t....
	defb 000h,000h	; 8aaa

; ----------------------------------------------------------------------
; DATOS rachas_8AAC: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (95 bytes)
;   0x8aac..0x8b0b  (95 bytes)
DATA_rachas_8AAC:
	defb 002h,000h,082h,004h,003h,006h,000h,081h,004h,003h,000h,081h,001h,003h,000h,08eh	; 8aac  ................
	defb 0e8h,078h,0fch,03ch,00ch,002h,000h,008h,038h,0f0h,048h,03ch,08eh,004h,005h,000h	; 8abc  .x.<....8.H<....
	defb 08bh,010h,018h,018h,01ah,01ah,016h,007h,01bh,010h,002h,003h,009h,000h,084h,0c0h	; 8acc  ................
	defb 0d0h,0f0h,0c0h,00bh,000h,088h,01ch,02bh,024h,027h,025h,025h,029h,078h,008h,000h	; 8adc  .......+$'%%)x..
	defb 090h,0f8h,014h,084h,002h,0c2h,032h,02dh,00eh,024h,02bh,01dh,004h,007h,00ah,00fh	; 8aec  ......2-.$+.....
	defb 007h,008h,000h,088h,034h,0c4h,00ch,0b4h,0c2h,071h,08bh,09eh,008h,000h,000h	; 8afc  ....4....q.....

; ----------------------------------------------------------------------
; DATOS rachas_8B0B: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (97 bytes)
;   0x8b0b..0x8b6c  (97 bytes)
DATA_rachas_8B0B:
	defb 002h,000h,092h,017h,01eh,03fh,03ch,030h,040h,000h,010h,038h,017h,000h,00fh,077h	; 8b0b  .....?<0@..8...w
	defb 018h,000h,000h,020h,0c0h,006h,000h,086h,030h,0d0h,000h,080h,0c0h,080h,009h,000h	; 8b1b  ... ....0.......
	defb 087h,003h,00bh,00fh,003h,000h,040h,060h,005h,000h,003h,00ch,002h,04ch,086h,06ch	; 8b2b  ......@`.....L.l
	defb 0e0h,0cch,004h,000h,040h,008h,000h,088h,01fh,028h,021h,040h,043h,04ch,0b4h,070h	; 8b3b  ....@....(!@CL.p
	defb 008h,000h,090h,02ch,0d2h,032h,0d2h,0b2h,0b2h,092h,01fh,02ch,047h,0a8h,09fh,0f0h	; 8b4b  ...,.2.....,G...
	defb 088h,0e7h,078h,008h,000h,088h,032h,0cah,02ch,0b0h,040h,038h,070h,0e0h,008h,000h	; 8b5b  ..x...2.,.@8p...
	defb 000h	; 8b6b

; ----------------------------------------------------------------------
; DATOS rachas_8B6C: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (97 bytes)
;   0x8b6c..0x8bcd  (97 bytes)
DATA_rachas_8B6C:
	defb 093h,000h,017h,01eh,03fh,03ch,030h,040h,000h,000h,00ch,01eh,011h,000h,011h,00fh	; 8b6c  ....?<0@........
	defb 000h,000h,020h,0c0h,006h,000h,083h,030h,0d0h,0c0h,00ch,000h,084h,003h,00bh,00fh	; 8b7c  .. ....0........
	defb 003h,003h,000h,081h,00eh,004h,000h,003h,00ch,002h,04ch,087h,06ch,0e0h,0cch,004h	; 8b8c  ..........L.l...
	defb 000h,000h,080h,007h,000h,089h,01fh,028h,021h,040h,043h,04ch,0b4h,070h,01ch,007h	; 8b9c  .......(!@CL.p..
	defb 000h,091h,02ch,0d2h,032h,0d2h,0b2h,0b2h,092h,01fh,032h,033h,021h,02eh,031h,02eh	; 8bac  ..,.2.....23!.1.
	defb 010h,01fh,00fh,008h,000h,088h,0cah,02ch,030h,040h,080h,080h,000h,0c0h,008h,000h	; 8bbc  .......,0@......
	defb 000h	; 8bcc

; ----------------------------------------------------------------------
; DATOS rachas_8BCD: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (94 bytes)
;   0x8bcd..0x8c2b  (94 bytes)
DATA_rachas_8BCD:
	defb 002h,000h,092h,017h,01eh,03fh,03ch,030h,040h,000h,010h,01ch,00fh,012h,03ch,071h	; 8bcd  .....?<0@.....<q
	defb 020h,000h,000h,020h,0c0h,006h,000h,081h,020h,003h,000h,081h,080h,00ah,000h,084h	; 8bdd   .. .... .......
	defb 003h,00bh,00fh,003h,008h,000h,08bh,008h,018h,018h,058h,058h,068h,0e0h,0d8h,008h	; 8bed  ..........XXh...
	defb 040h,0c0h,008h,000h,088h,01fh,028h,021h,040h,043h,04ch,0b4h,070h,008h,000h,090h	; 8bfd  @.....(!@CL.p...
	defb 038h,0d4h,024h,0e4h,0a4h,0a4h,094h,01eh,02ch,023h,030h,02dh,043h,08eh,0d1h,079h	; 8c0d  8.$.....,#0-C..y
	defb 008h,000h,088h,024h,0d4h,0b8h,020h,0e0h,050h,0f0h,0e0h,008h,000h,000h	; 8c1d  ...$.. .P.....

; ----------------------------------------------------------------------
; DATOS rachas_8C2B: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (92 bytes)
;   0x8c2b..0x8c87  (92 bytes)
DATA_rachas_8C2B:
	defb 09eh,003h,00ch,01fh,01fh,05fh,06fh,03fh,00fh,020h,038h,01fh,008h,007h,00eh,00eh	; 8c2b  ....._o?. 8.....
	defb 002h,000h,0c0h,0e0h,0e0h,0e8h,0d8h,030h,0c0h,014h,078h,0cch,020h,0e0h,070h,00ch	; 8c3b  .......0..x. .p.
	defb 000h,081h,040h,007h,000h,004h,00ch,081h,004h,003h,000h,081h,00ch,00bh,000h,08ah	; 8c4b  ..@.............
	defb 003h,00ch,013h,020h,060h,0a0h,090h,0c0h,0b0h,05fh,005h,000h,093h,00ch,012h,0d2h	; 8c5b  ... `...._......
	defb 032h,012h,01ah,016h,026h,0cfh,032h,0eah,047h,020h,017h,018h,011h,011h,01dh,03eh	; 8c6b  2...&.2.G .....>
	defb 008h,000h,086h,086h,032h,0dch,010h,08ch,078h,00ah,000h,000h	; 8c7b  ....2...x...

; ----------------------------------------------------------------------
; DATOS rachas_8C87: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (92 bytes)
;   0x8c87..0x8ce3  (92 bytes)
DATA_rachas_8C87:
	defb 09fh,000h,003h,00ch,01fh,01fh,05fh,06fh,03fh,00fh,050h,03fh,060h,01fh,039h,001h	; 8c87  ......_o?.P?`.9.
	defb 001h,000h,000h,0c0h,0e0h,0e0h,0e8h,0d8h,030h,0c0h,000h,0e8h,070h,098h,0c0h,0c0h	; 8c97  ........0...p...
	defb 00ch,000h,081h,040h,008h,000h,002h,018h,081h,008h,005h,000h,081h,018h,00ah,000h	; 8ca7  ...@............
	defb 089h,003h,00ch,013h,020h,060h,0a0h,090h,040h,0b0h,007h,000h,091h,018h,0e4h,024h	; 8cb7  .... `..@......$
	defb 014h,01ch,014h,024h,0cch,03eh,0afh,0c0h,09fh,060h,0c6h,07ah,002h,001h,008h,000h	; 8cc7  ...$.>...`.z....
	defb 088h,0e4h,014h,08ch,064h,038h,020h,0e0h,0f0h,008h,000h,000h	; 8cd7  ....d8 .....

; ----------------------------------------------------------------------
; DATOS rachas_8CE3: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (106 bytes)
;   0x8ce3..0x8d4d  (106 bytes)
DATA_rachas_8CE3:
	defb 085h,000h,004h,003h,000h,010h,003h,000h,084h,008h,004h,003h,003h,005h,000h,08fh	; 8ce3  ................
	defb 0e8h,078h,0fch,03ch,00ch,002h,000h,000h,030h,078h,088h,000h,088h,0f0h,000h,004h	; 8cf3  .x.<....0x......
	defb 018h,088h,010h,018h,000h,002h,002h,016h,017h,003h,003h,000h,081h,001h,008h,000h	; 8d03  ................
	defb 084h,0c0h,0d0h,0f0h,0c0h,003h,000h,081h,070h,003h,000h,081h,018h,004h,024h,088h	; 8d13  ........p.....$.
	defb 02bh,024h,07fh,02dh,03dh,029h,028h,014h,007h,000h,091h,0f8h,014h,084h,002h,0c2h	; 8d23  +$.-=)(.........
	defb 032h,02dh,00eh,038h,00bh,004h,004h,002h,001h,001h,000h,003h,008h,000h,088h,0cch	; 8d33  2-.8............
	defb 084h,074h,08ch,074h,008h,0f8h,0f0h,008h,000h,000h	; 8d43  .t.t......

; ----------------------------------------------------------------------
; DATOS rachas_8D4D: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (104 bytes)
;   0x8d4d..0x8db5  (104 bytes)
DATA_rachas_8D4D:
	defb 095h,000h,017h,01eh,03fh,03ch,030h,040h,000h,000h,00ch,01eh,011h,000h,011h,00fh	; 8d4d  ....?<0@........
	defb 000h,000h,020h,0c0h,000h,008h,003h,000h,084h,010h,020h,0c0h,0c0h,00ch,000h,084h	; 8d5d  .. ....... .....
	defb 003h,00bh,00fh,003h,003h,000h,081h,00eh,004h,018h,088h,008h,018h,000h,040h,040h	; 8d6d  ..............@@
	defb 068h,0e8h,0c0h,003h,000h,081h,080h,007h,000h,089h,01fh,028h,021h,040h,043h,04ch	; 8d7d  h..........(!@CL
	defb 0b4h,070h,01ch,003h,000h,081h,018h,004h,024h,090h,0d4h,024h,0feh,0b4h,0bch,094h	; 8d8d  .p......$..$....
	defb 014h,028h,033h,021h,02eh,031h,02eh,010h,01fh,00fh,008h,000h,088h,0d0h,020h,020h	; 8d9d  .(3!.1........
	defb 040h,080h,080h,000h,0c0h,008h,000h,000h	; 8dad  @.......

; ----------------------------------------------------------------------
; DATOS rachas_8DB5: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (99 bytes)
;   0x8db5..0x8e18  (99 bytes)
DATA_rachas_8DB5:
	defb 002h,000h,082h,004h,003h,006h,000h,096h,00ch,00bh,000h,001h,003h,001h,000h,000h	; 8db5  ................
	defb 0e8h,078h,0fch,03ch,00ch,002h,000h,008h,01ch,0e8h,000h,0f0h,0eeh,018h,004h,000h	; 8dc5  .x.<............
	defb 002h,010h,08ah,030h,020h,062h,062h,066h,007h,033h,020h,000h,002h,009h,000h,087h	; 8dd5  ...0 bbf.3 .....
	defb 0c0h,0d0h,0f0h,0c0h,000h,002h,006h,008h,000h,088h,02ch,02bh,04ch,053h,095h,095h	; 8de5  ..........,+LS..
	defb 099h,078h,008h,000h,090h,0f8h,014h,084h,002h,0c2h,032h,02dh,00eh,04ch,053h,034h	; 8df5  .x........2-.LS4
	defb 00dh,002h,01ch,00eh,007h,008h,000h,088h,034h,0e2h,015h,0f9h,00fh,011h,0e7h,01eh	; 8e05  ........4.......
	defb 008h,000h,000h	; 8e15

; ----------------------------------------------------------------------
; DATOS rachas_8E18: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (101 bytes)
;   0x8e18..0x8e7d  (101 bytes)
DATA_rachas_8E18:
	defb 083h,000h,004h,003h,006h,000h,083h,00ch,00bh,003h,005h,000h,08eh,0e8h,078h,0fch	; 8e18  ..............x.
	defb 03ch,00ch,002h,000h,000h,030h,078h,088h,000h,088h,0f0h,004h,000h,002h,010h,08bh	; 8e28  <....0x.........
	defb 030h,020h,062h,062h,066h,007h,033h,020h,000h,000h,001h,008h,000h,084h,0c0h,0d0h	; 8e38  0 bbf.3 ........
	defb 0f0h,0c0h,003h,000h,081h,070h,006h,000h,08ah,010h,02ch,02bh,04ch,053h,095h,095h	; 8e48  .....p....,+LS..
	defb 099h,078h,04ch,007h,000h,091h,0f8h,014h,084h,002h,0c2h,032h,02dh,00eh,038h,053h	; 8e58  .xL........2-.8S
	defb 034h,00ch,002h,001h,001h,000h,003h,008h,000h,088h,0cch,084h,074h,08ch,074h,008h	; 8e68  4...........t.t.
	defb 0f8h,0f0h,008h,000h,000h	; 8e78

; ----------------------------------------------------------------------
; DATOS rachas_8E7D: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (95 bytes)
;   0x8e7d..0x8edc  (95 bytes)
DATA_rachas_8E7D:
	defb 084h,000h,008h,004h,003h,006h,000h,081h,004h,003h,000h,081h,001h,003h,000h,08eh	; 8e7d  ................
	defb 0e8h,078h,0fch,03ch,00ch,002h,000h,008h,038h,0f0h,048h,03ch,08eh,004h,006h,000h	; 8e8d  .x.<....8.H<....
	defb 08ah,018h,010h,032h,032h,036h,007h,01bh,010h,002h,003h,009h,000h,084h,0c0h,0d0h	; 8e9d  ...226..........
	defb 0f0h,0c0h,00ah,000h,089h,008h,014h,01bh,024h,02bh,04dh,04dh,049h,038h,008h,000h	; 8ead  ........$+MMI8..
	defb 090h,0f8h,014h,084h,002h,0c2h,032h,02dh,00eh,024h,02bh,01dh,004h,007h,00ah,00fh	; 8ebd  ......2-.$+.....
	defb 007h,008h,000h,088h,034h,0c4h,00ch,0b4h,0c2h,071h,08bh,09eh,008h,000h,000h	; 8ecd  ....4....q.....

; ----------------------------------------------------------------------
; DATOS rachas_8EDC: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (99 bytes)
;   0x8edc..0x8f3f  (99 bytes)
DATA_rachas_8EDC:
	defb 002h,000h,092h,017h,01eh,03fh,03ch,030h,040h,000h,010h,038h,017h,000h,00fh,077h	; 8edc  .....?<0@..8...w
	defb 018h,000h,000h,020h,0c0h,006h,000h,086h,030h,0d0h,000h,080h,0c0h,080h,009h,000h	; 8eec  ... ....0.......
	defb 087h,003h,00bh,00fh,003h,000h,040h,060h,004h,000h,002h,008h,08ah,00ch,004h,046h	; 8efc  ......@`.......F
	defb 046h,066h,0e0h,0cch,004h,000h,040h,008h,000h,088h,01fh,028h,021h,040h,043h,04ch	; 8f0c  Ff....@....(!@CL
	defb 0b4h,070h,008h,000h,090h,034h,0d4h,032h,0cah,0a9h,0a9h,099h,01eh,02ch,047h,0a8h	; 8f1c  .p...4.2.....,G.
	defb 09fh,0f0h,088h,0e7h,078h,008h,000h,088h,032h,0cah,02ch,0b0h,040h,038h,070h,0e0h	; 8f2c  ....x...2.,.@8p.
	defb 008h,000h,000h	; 8f3c

; ----------------------------------------------------------------------
; DATOS rachas_8F3F: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (100 bytes)
;   0x8f3f..0x8fa3  (100 bytes)
DATA_rachas_8F3F:
	defb 093h,000h,017h,01eh,03fh,03ch,030h,040h,000h,000h,00ch,01eh,011h,000h,011h,00fh	; 8f3f  ....?<0@........
	defb 000h,000h,020h,0c0h,006h,000h,083h,030h,0d0h,0c0h,00ch,000h,084h,003h,00bh,00fh	; 8f4f  .. ....0........
	defb 003h,003h,000h,081h,00eh,003h,000h,002h,008h,08bh,00ch,004h,046h,046h,066h,0e0h	; 8f5f  ............FFf.
	defb 0cch,004h,000h,000h,080h,007h,000h,089h,01fh,028h,021h,040h,043h,04ch,0b4h,070h	; 8f6f  .........(!@CL.p
	defb 01ch,006h,000h,092h,008h,034h,0d4h,032h,0cah,0a9h,0a9h,099h,01eh,032h,033h,021h	; 8f7f  .....4.2.....23!
	defb 02eh,031h,02eh,010h,01fh,00fh,008h,000h,088h,0cah,02ch,030h,040h,080h,080h,000h	; 8f8f  .1........,0@...
	defb 0c0h,008h,000h,000h	; 8f9f

; ----------------------------------------------------------------------
; DATOS rachas_8FA3: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (94 bytes)
;   0x8fa3..0x9001  (94 bytes)
DATA_rachas_8FA3:
	defb 002h,000h,092h,017h,01eh,03fh,03ch,030h,040h,000h,010h,01ch,00fh,012h,03ch,071h	; 8fa3  .....?<0@.....<q
	defb 020h,000h,010h,020h,0c0h,006h,000h,081h,020h,003h,000h,081h,080h,00ah,000h,084h	; 8fb3   .. .... .......
	defb 003h,00bh,00fh,003h,009h,000h,08ah,018h,008h,04ch,04ch,06ch,0e0h,0d8h,008h,040h	; 8fc3  .........LLl...@
	defb 0c0h,008h,000h,088h,01fh,028h,021h,040h,043h,04ch,0b4h,070h,007h,000h,091h,010h	; 8fd3  .....(!@CL.p....
	defb 028h,0d8h,024h,0d4h,0b2h,0b2h,092h,01ch,02ch,023h,030h,02dh,043h,08eh,0d1h,079h	; 8fe3  (.$.....,#0-C..y
	defb 008h,000h,088h,024h,0d4h,0b8h,020h,0e0h,050h,0f0h,0e0h,008h,000h,000h	; 8ff3  ...$.. .P.....

; ----------------------------------------------------------------------
; DATOS rachas_9001: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (96 bytes)
;   0x9001..0x9061  (96 bytes)
DATA_rachas_9001:
	defb 09eh,003h,00ch,01fh,01fh,05fh,06fh,03fh,00fh,020h,038h,01fh,008h,007h,00eh,00eh	; 9001  ....._o?. 8.....
	defb 002h,000h,0c0h,0e0h,0e0h,0e8h,0d8h,030h,0c0h,014h,078h,0cch,020h,0e0h,070h,00ch	; 9011  .......0..x. .p.
	defb 000h,081h,040h,006h,000h,002h,008h,088h,00ch,004h,006h,002h,002h,000h,000h,00ch	; 9021  ..@.............
	defb 00bh,000h,08ah,003h,00ch,013h,020h,060h,0a0h,090h,0c0h,0b0h,05fh,004h,000h,094h	; 9031  ...... `...._...
	defb 008h,014h,014h,0d2h,02ah,019h,01dh,015h,027h,0ceh,032h,0eah,047h,020h,017h,018h	; 9041  ....*...'.2.G ..
	defb 011h,011h,01dh,03eh,008h,000h,086h,086h,032h,0dch,010h,08ch,078h,00ah,000h,000h	; 9051  ...>....2...x...

; ----------------------------------------------------------------------
; DATOS rachas_9061: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (94 bytes)
;   0x9061..0x90bf  (94 bytes)
DATA_rachas_9061:
	defb 09fh,000h,003h,00ch,01fh,01fh,05fh,06fh,03fh,00fh,050h,03fh,060h,01fh,039h,001h	; 9061  ......_o?.P?`.9.
	defb 001h,000h,000h,0c0h,0e0h,0e0h,0e8h,0d8h,030h,0c0h,000h,0e8h,070h,098h,0c0h,0c0h	; 9071  ........0...p...
	defb 00ch,000h,081h,040h,008h,000h,002h,008h,082h,00ch,004h,003h,002h,082h,004h,018h	; 9081  ...@............
	defb 00ah,000h,089h,003h,00ch,013h,020h,060h,0a0h,090h,040h,0b0h,007h,000h,091h,008h	; 9091  ...... `..@.....
	defb 0d4h,034h,012h,01ah,015h,025h,0cdh,03ah,0afh,0c0h,09fh,060h,0c6h,07ah,002h,001h	; 90a1  .4...%.:...`.z..
	defb 008h,000h,088h,0e4h,014h,08ch,064h,038h,020h,0e0h,0f0h,008h,000h,000h	; 90b1  ......d8 .....

; ----------------------------------------------------------------------
; DATOS rachas_90BF: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (105 bytes)
;   0x90bf..0x9128  (105 bytes)
DATA_rachas_90BF:
	defb 083h,000h,004h,003h,005h,000h,084h,008h,004h,003h,003h,005h,000h,09bh,0e8h,078h	; 90bf  ...............x
	defb 0fch,03ch,00ch,002h,000h,000h,030h,078h,088h,000h,088h,0f0h,000h,000h,008h,008h	; 90cf  .<....0x........
	defb 018h,010h,030h,030h,032h,002h,016h,017h,003h,003h,000h,081h,001h,008h,000h,084h	; 90df  ..002...........
	defb 0c0h,0d0h,0f0h,0c0h,003h,000h,081h,070h,004h,000h,08ch,008h,014h,014h,024h,02bh	; 90ef  .......p......$+
	defb 04ch,04bh,04dh,03dh,029h,028h,014h,007h,000h,091h,0f8h,014h,084h,002h,0c2h,032h	; 90ff  LKM=)(.........2
	defb 02dh,00eh,038h,00bh,004h,004h,002h,001h,001h,000h,003h,008h,000h,088h,0cch,084h	; 910f  -.8.............
	defb 074h,08ch,074h,008h,0f8h,0f0h,008h,000h,000h	; 911f  t.t......

; ----------------------------------------------------------------------
; DATOS rachas_9128: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (103 bytes)
;   0x9128..0x918f  (103 bytes)
DATA_rachas_9128:
	defb 093h,000h,017h,01eh,03fh,03ch,030h,040h,000h,000h,00ch,01eh,011h,000h,011h,00fh	; 9128  ....?<0@........
	defb 000h,000h,020h,0c0h,005h,000h,084h,010h,020h,0c0h,0c0h,00ch,000h,084h,003h,00bh	; 9138  .. ..... .......
	defb 00fh,003h,003h,000h,08dh,00eh,000h,010h,010h,018h,008h,00ch,00ch,04ch,040h,068h	; 9148  .............L@h
	defb 0e8h,0c0h,003h,000h,081h,080h,007h,000h,089h,01fh,028h,021h,040h,043h,04ch,0b4h	; 9158  ..........(!@CL.
	defb 070h,01ch,004h,000h,094h,010h,028h,028h,024h,0d4h,032h,0d2h,0b2h,0bch,094h,014h	; 9168  p.....(($.2.....
	defb 028h,033h,021h,02eh,031h,02eh,010h,01fh,00fh,008h,000h,088h,0d0h,020h,020h,040h	; 9178  (3!.1........  @
	defb 080h,080h,000h,0c0h,008h,000h,000h	; 9188

; ----------------------------------------------------------------------
; DATOS rachas_918F: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (112 bytes)
;   0x918f..0x91ff  (112 bytes)
DATA_rachas_918F:
	defb 002h,000h,083h,009h,006h,001h,005h,000h,098h,008h,057h,000h,003h,007h,002h,000h	; 918f  ..........W.....
	defb 000h,0d0h,0f0h,0f8h,078h,018h,004h,000h,010h,038h,0d0h,000h,0e0h,0dch,030h,000h	; 919f  ....x....8....0.
	defb 003h,006h,000h,098h,004h,005h,00dh,00fh,027h,020h,000h,004h,000h,0c8h,0f0h,038h	; 91af  ........' .....8
	defb 008h,004h,004h,000h,000h,080h,0a0h,0e0h,080h,000h,004h,00ch,004h,000h,08ch,003h	; 91bf  ................
	defb 004h,003h,000h,009h,016h,009h,006h,00bh,00ah,012h,030h,004h,000h,094h,0c8h,034h	; 91cf  ..........0....4
	defb 008h,0c4h,0f4h,02ah,00ah,004h,084h,064h,05ah,01ch,058h,057h,0a8h,05bh,004h,038h	; 91df  ...*...dZ.XW.[.8
	defb 01dh,00eh,008h,000h,088h,068h,0c4h,02ah,0f2h,01eh,022h,0ceh,03ch,008h,000h,000h	; 91ef  .....h.*..".<...

; ----------------------------------------------------------------------
; DATOS rachas_91FF: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (114 bytes)
;   0x91ff..0x9271  (114 bytes)
DATA_rachas_91FF:
	defb 084h,000h,009h,006h,001h,005h,000h,098h,008h,056h,007h,000h,001h,001h,000h,000h	; 91ff  .........V......
	defb 0d0h,0f0h,0f8h,078h,018h,004h,000h,000h,060h,0f0h,010h,000h,010h,0e0h,000h,003h	; 920f  ...x....`.......
	defb 006h,000h,095h,004h,005h,00dh,00fh,027h,020h,000h,000h,002h,0c8h,0f0h,038h,008h	; 921f  .......' .....8.
	defb 004h,004h,000h,000h,080h,0a0h,0e0h,080h,003h,000h,081h,0e0h,003h,000h,08dh,003h	; 922f  ................
	defb 004h,003h,000h,009h,016h,009h,006h,00bh,00ah,012h,030h,058h,003h,000h,095h,0c8h	; 923f  ..........0X....
	defb 034h,008h,0c4h,0f4h,02ah,00ah,004h,084h,064h,05ah,01ch,070h,057h,0a9h,058h,005h	; 924f  4...*...dZ.pW.X.
	defb 002h,002h,001h,007h,008h,000h,088h,098h,008h,0e8h,018h,0e8h,010h,0f0h,0e0h,008h	; 925f  ................
	defb 000h,000h	; 926f

; ----------------------------------------------------------------------
; DATOS rachas_9271: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (108 bytes)
;   0x9271..0x92dd  (108 bytes)
DATA_rachas_9271:
	defb 002h,000h,083h,009h,006h,001h,006h,000h,084h,028h,000h,000h,003h,003h,000h,090h	; 9271  .........(......
	defb 0d0h,0f0h,0f8h,078h,018h,004h,000h,010h,070h,0e0h,010h,078h,01ch,008h,000h,001h	; 9281  ...x....p..x....
	defb 006h,000h,095h,004h,005h,00dh,00fh,017h,010h,002h,003h,000h,0e4h,078h,01ch,004h	; 9291  .............x..
	defb 006h,002h,000h,000h,080h,0a0h,0e0h,080h,007h,000h,08ch,001h,002h,001h,000h,009h	; 92a1  ................
	defb 016h,009h,006h,00bh,00ah,012h,010h,004h,000h,094h,0e4h,01ah,084h,062h,0fah,029h	; 92b1  .............b.)
	defb 00dh,006h,084h,064h,05ah,01ch,028h,02fh,055h,03ch,00fh,014h,01fh,00fh,008h,000h	; 92c1  ...dZ.(/U<......
	defb 088h,068h,088h,018h,0e8h,084h,0e2h,016h,03ch,008h,000h,000h	; 92d1  .h......<...

; ----------------------------------------------------------------------
; DATOS rachas_92DD: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (112 bytes)
;   0x92dd..0x934d  (112 bytes)
DATA_rachas_92DD:
	defb 002h,000h,093h,00bh,00fh,01fh,01eh,018h,020h,000h,008h,01ch,00bh,000h,007h,03bh	; 92dd  ........ .......
	defb 00ch,000h,000h,090h,060h,080h,005h,000h,098h,010h,0eah,000h,0c0h,0e0h,040h,000h	; 92ed  ....`.........@.
	defb 013h,00fh,01ch,010h,020h,020h,000h,000h,001h,005h,007h,001h,000h,020h,030h,000h	; 92fd  ....  ....... 0.
	defb 0c0h,006h,000h,088h,020h,0a0h,0b0h,0f0h,0e4h,004h,000h,020h,004h,000h,08ch,013h	; 930d  .... ...... ....
	defb 02ch,010h,023h,02fh,054h,050h,020h,021h,026h,05ah,038h,004h,000h,094h,0c0h,020h	; 931d  ,.#/TP !&Z8....
	defb 0c0h,000h,090h,068h,090h,060h,0d0h,050h,048h,00ch,016h,023h,054h,04fh,078h,044h	; 932d  ...h.`.PH..#TOxD
	defb 073h,03ch,008h,000h,088h,01ah,0eah,015h,0dah,020h,01ch,0b8h,070h,008h,000h,000h	; 933d  s<....... ..p...

; ----------------------------------------------------------------------
; DATOS rachas_934D: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (114 bytes)
;   0x934d..0x93bf  (114 bytes)
DATA_rachas_934D:
	defb 094h,000h,00bh,00fh,01fh,01eh,018h,020h,000h,000h,006h,00fh,008h,000h,008h,007h	; 934d  ....... ........
	defb 000h,000h,090h,060h,080h,005h,000h,093h,010h,06ah,0e0h,000h,080h,080h,000h,013h	; 935d  ...`.....j......
	defb 00fh,01ch,010h,020h,020h,000h,000h,001h,005h,007h,001h,003h,000h,082h,007h,0c0h	; 936d  ...  ...........
	defb 006h,000h,089h,020h,0a0h,0b0h,0f0h,0e4h,004h,000h,000h,040h,003h,000h,08dh,013h	; 937d  ... .......@....
	defb 02ch,010h,023h,02fh,054h,050h,020h,021h,026h,05ah,038h,00eh,003h,000h,095h,0c0h	; 938d  ,.#/TP !&Z8.....
	defb 020h,0c0h,000h,090h,068h,090h,060h,0d0h,050h,048h,00ch,01ah,019h,010h,017h,018h	; 939d   ...h.`.PH......
	defb 017h,008h,00fh,007h,008h,000h,088h,0eah,095h,01ah,0a0h,040h,040h,080h,0e0h,008h	; 93ad  ...........@@...
	defb 000h,000h	; 93bd

; ----------------------------------------------------------------------
; DATOS rachas_93BF: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (110 bytes)
;   0x93bf..0x942d  (110 bytes)
DATA_rachas_93BF:
	defb 002h,000h,093h,00bh,00fh,01fh,01eh,018h,020h,000h,008h,00eh,007h,008h,01eh,038h	; 93bf  ........ ......8
	defb 010h,000h,000h,090h,060h,080h,006h,000h,092h,014h,000h,000h,0c0h,000h,000h,027h	; 93cf  ....`..........'
	defb 01eh,038h,020h,060h,040h,000h,000h,001h,005h,007h,001h,004h,000h,081h,080h,006h	; 93df  .8 `@...........
	defb 000h,088h,020h,0a0h,0b0h,0f0h,0e8h,008h,040h,0c0h,004h,000h,08ch,027h,058h,021h	; 93ef  .. .....@....'X!
	defb 046h,05fh,094h,0b0h,060h,021h,026h,05ah,038h,004h,000h,094h,080h,040h,080h,000h	; 93ff  F_..`!&Z8....@..
	defb 090h,068h,090h,060h,0d0h,050h,048h,008h,016h,011h,018h,017h,021h,047h,068h,03ch	; 940f  .h.`.PH.....!Gh<
	defb 008h,000h,088h,014h,0f4h,0aah,03ch,0f0h,028h,0f8h,0f0h,008h,000h,000h	; 941f  ......<.(.....

; ----------------------------------------------------------------------
; DATOS rachas_942D: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (100 bytes)
;   0x942d..0x9491  (100 bytes)
DATA_rachas_942D:
	defb 09eh,000h,00ch,01ch,018h,058h,068h,038h,04dh,020h,038h,01fh,008h,007h,00eh,00eh	; 942d  .....Xh8M 8.....
	defb 002h,000h,000h,040h,020h,050h,0c0h,020h,0c2h,014h,07ch,0c8h,020h,0e0h,070h,004h	; 943d  ...@ P. ..|. .p.
	defb 000h,088h,002h,000h,001h,001h,003h,003h,002h,002h,008h,000h,083h,03ch,0f0h,080h	; 944d  .............<..
	defb 003h,000h,002h,00ch,00bh,000h,08bh,002h,005h,00fh,012h,022h,064h,0a4h,095h,0c5h	; 945d  ..........."d...
	defb 0b2h,05fh,005h,000h,093h,03ch,0c2h,00ch,070h,0a0h,0d0h,0ach,032h,0d2h,03dh,0eah	; 946d  ._...<..p...2.=.
	defb 047h,020h,017h,018h,011h,011h,01dh,03eh,008h,000h,086h,082h,034h,0d8h,010h,08ch	; 947d  G .....>....4...
	defb 078h,00ah,000h,000h	; 948d

; ----------------------------------------------------------------------
; DATOS rachas_9491: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (97 bytes)
;   0x9491..0x94f2  (97 bytes)
DATA_rachas_9491:
	defb 003h,000h,08dh,010h,011h,040h,061h,023h,003h,050h,03fh,060h,01fh,039h,001h,001h	; 9491  .....@a#.P?`.9..
	defb 003h,000h,08ch,020h,060h,0a8h,058h,020h,0c0h,000h,0e4h,078h,098h,0c0h,0c0h,005h	; 94a1  ... `.X ...x....
	defb 000h,088h,008h,003h,006h,004h,00ch,00ch,008h,048h,008h,000h,082h,0f0h,0c0h,005h	; 94b1  .........H......
	defb 000h,002h,018h,00ah,000h,089h,00bh,017h,01ch,029h,06ah,0b3h,092h,054h,0b4h,007h	; 94c1  .........)j..T..
	defb 000h,091h,0f0h,008h,030h,0d0h,098h,054h,0a4h,0d8h,024h,0afh,0c0h,09fh,060h,0c6h	; 94d1  ....0..T..$...`.
	defb 07ah,002h,001h,008h,000h,088h,0e4h,01ah,084h,064h,038h,020h,0e0h,0f0h,008h,000h	; 94e1  z........d8 ....
	defb 000h	; 94f1

; ----------------------------------------------------------------------
; DATOS rachas_94F2: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (97 bytes)
;   0x94f2..0x9553  (97 bytes)
DATA_rachas_94F2:
	defb 082h,000h,004h,006h,000h,098h,00ch,006h,003h,000h,000h,003h,003h,001h,000h,0e8h	; 94f2  ................
	defb 078h,0fch,03ch,00ch,002h,000h,000h,030h,078h,030h,000h,030h,0ech,018h,006h,000h	; 9502  x.<....0x0.0....
	defb 087h,00eh,038h,022h,05ah,053h,041h,040h,00bh,000h,088h,0c0h,0d0h,0f0h,0c0h,000h	; 9512  ..8"ZSA@........
	defb 000h,0c0h,0c0h,007h,000h,089h,004h,00bh,00fh,031h,047h,05dh,0a5h,0ach,0b2h,007h	; 9522  .........1G]....
	defb 000h,091h,0f8h,014h,084h,002h,0c2h,032h,02dh,00eh,038h,0a9h,044h,003h,003h,004h	; 9532  .......2-.8.D...
	defb 01ch,00eh,007h,008h,000h,088h,0cch,084h,008h,038h,0cch,012h,0e6h,03ch,008h,000h	; 9542  .........8...<..
	defb 000h	; 9552

; ----------------------------------------------------------------------
; DATOS rachas_9553: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (95 bytes)
;   0x9553..0x95b2  (95 bytes)
DATA_rachas_9553:
	defb 002h,000h,082h,004h,003h,006h,000h,096h,004h,000h,003h,060h,023h,031h,000h,000h	; 9553  ...........`#1..
	defb 0e8h,078h,0fch,03ch,00ch,002h,000h,00ch,01ch,008h,080h,000h,0ech,018h,008h,000h	; 9563  .x.<............
	defb 002h,002h,086h,016h,037h,023h,060h,058h,058h,009h,000h,087h,0c0h,0d0h,0f0h,0c0h	; 9573  ....7#`XX.......
	defb 000h,020h,030h,008h,000h,088h,004h,00bh,004h,003h,005h,015h,029h,048h,008h,000h	; 9583  . 0.........)H..
	defb 090h,0f8h,014h,084h,002h,0c2h,032h,02dh,00eh,054h,09bh,0a7h,0a4h,09fh,05ch,04eh	; 9593  ......2-.T....\N
	defb 037h,008h,000h,088h,032h,0e2h,0d4h,048h,0fch,012h,0e6h,03ch,008h,000h,000h	; 95a3  7...2..H...<...

; ----------------------------------------------------------------------
; DATOS rachas_95B2: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (97 bytes)
;   0x95b2..0x9613  (97 bytes)
DATA_rachas_95B2:
	defb 092h,000h,017h,01eh,03fh,03ch,030h,040h,000h,000h,00ch,01eh,00ch,000h,00ch,037h	; 95b2  ....?<0@.......7
	defb 018h,000h,020h,006h,000h,088h,030h,060h,0c0h,000h,000h,0c0h,0c0h,080h,008h,000h	; 95c2  .. ...0`........
	defb 088h,003h,00bh,00fh,003h,000h,000h,003h,003h,006h,000h,087h,070h,01ch,044h,05ah	; 95d2  ............p.DZ
	defb 0cah,082h,002h,00ah,000h,089h,01fh,028h,021h,040h,043h,04ch,0b4h,070h,01ch,007h	; 95e2  .......(!@CL.p..
	defb 000h,091h,020h,0d0h,0f0h,08ch,0e2h,0bah,0a5h,035h,04dh,033h,021h,010h,01ch,033h	; 95f2  .. ......5M3!..3
	defb 048h,067h,03ch,008h,000h,088h,095h,022h,0c0h,0c0h,020h,038h,070h,0e0h,008h,000h	; 9602  Hg<....".. 8p...
	defb 000h	; 9612

; ----------------------------------------------------------------------
; DATOS rachas_9613: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (95 bytes)
;   0x9613..0x9672  (95 bytes)
DATA_rachas_9613:
	defb 002h,000h,092h,017h,01eh,03fh,03ch,030h,040h,000h,030h,038h,010h,001h,000h,037h	; 9613  .....?<0@.08...7
	defb 018h,000h,000h,020h,0c0h,006h,000h,086h,020h,000h,0c0h,006h,0c4h,08ch,009h,000h	; 9623  ... .... .......
	defb 087h,003h,00bh,00fh,003h,000h,004h,00ch,008h,000h,002h,040h,086h,068h,0ech,0c4h	; 9633  ...........@.h..
	defb 006h,01ah,01ah,008h,000h,088h,01fh,028h,021h,040h,043h,04ch,0b4h,070h,008h,000h	; 9643  .......(!@CL.p..
	defb 090h,020h,0d0h,020h,0c0h,0a0h,0a8h,094h,012h,04ch,047h,02bh,012h,03fh,048h,067h	; 9653  . . .....LG+.?Hg
	defb 03ch,008h,000h,088h,02ah,0d9h,0e5h,025h,0f9h,03ah,072h,0ech,008h,000h,000h	; 9663  <...*..%.:r....

; ----------------------------------------------------------------------
; DATOS rachas_9672: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (116 bytes)
;   0x9672..0x96e6  (116 bytes)
DATA_rachas_9672:
	defb 002h,000h,0a3h,004h,003h,004h,008h,018h,060h,040h,000h,00ch,00bh,000h,001h,003h	; 9672  ........`@......
	defb 001h,000h,000h,0e8h,078h,0fch,03ch,00ch,002h,000h,008h,01ch,0e8h,000h,0f0h,0eeh	; 9682  ....x.<.........
	defb 018h,000h,001h,003h,001h,002h,003h,000h,002h,002h,086h,006h,007h,033h,020h,000h	; 9692  .............3 .
	defb 002h,003h,0c0h,081h,080h,005h,000h,087h,0c0h,0d0h,0f0h,0c0h,000h,002h,006h,004h	; 96a2  ................
	defb 000h,08ch,001h,002h,004h,002h,005h,00bh,00ch,00bh,015h,065h,099h,0b8h,003h,000h	; 96b2  ...........e....
	defb 081h,0c0h,003h,020h,091h,040h,0f8h,014h,084h,002h,0c2h,032h,02dh,00eh,04ch,053h	; 96c2  ... .@.....2-.LS
	defb 034h,00dh,002h,01ch,00eh,007h,008h,000h,088h,034h,0e2h,015h,0f9h,00fh,011h,0e7h	; 96d2  4........4......
	defb 01eh,008h,000h,000h	; 96e2

; ----------------------------------------------------------------------
; DATOS rachas_96E6: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (115 bytes)
;   0x96e6..0x9759  (115 bytes)
DATA_rachas_96E6:
	defb 08ch,000h,004h,003h,004h,008h,018h,060h,040h,000h,00ch,00bh,003h,005h,000h,093h	; 96e6  .......`@.......
	defb 0e8h,078h,0fch,03ch,00ch,002h,000h,000h,030h,078h,088h,000h,088h,0f0h,000h,001h	; 96f6  .x.<....0x......
	defb 003h,001h,002h,003h,000h,002h,002h,08ah,006h,007h,033h,020h,000h,000h,001h,0c0h	; 9706  ..........3 ....
	defb 0c0h,080h,005h,000h,084h,0c0h,0d0h,0f0h,0c0h,003h,000h,081h,070h,003h,000h,090h	; 9716  ............p...
	defb 001h,002h,004h,002h,005h,00bh,00ch,00bh,015h,065h,099h,0b8h,04ch,000h,000h,0c0h	; 9726  .........e..L...
	defb 003h,020h,092h,040h,0f8h,014h,084h,002h,0c2h,032h,02dh,00eh,038h,053h,034h,00ch	; 9736  . .@.....2-.8S4.
	defb 002h,001h,001h,000h,003h,008h,000h,088h,0cch,084h,074h,08ch,074h,008h,0f8h,0f0h	; 9746  ..........t.t...
	defb 008h,000h,000h	; 9756

; ----------------------------------------------------------------------
; DATOS rachas_9759: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (112 bytes)
;   0x9759..0x97c9  (112 bytes)
DATA_rachas_9759:
	defb 002h,000h,089h,004h,003h,000h,000h,008h,030h,020h,000h,004h,003h,000h,081h,001h	; 9759  ........0 ......
	defb 003h,000h,093h,0e8h,078h,0fch,03ch,00ch,002h,000h,008h,038h,0f0h,048h,03ch,08eh	; 9769  ....x.<....8.H<.
	defb 004h,000h,000h,001h,000h,001h,003h,000h,002h,002h,08ah,006h,007h,01bh,010h,002h	; 9779  ................
	defb 003h,060h,0e0h,0e0h,0c0h,005h,000h,084h,0c0h,0d0h,0f0h,0c0h,008h,000h,08bh,001h	; 9789  .`..............
	defb 002h,001h,006h,00bh,004h,007h,00dh,035h,049h,058h,003h,000h,095h,060h,090h,010h	; 9799  .......5IX...`..
	defb 010h,020h,0f8h,014h,084h,002h,0c2h,032h,02dh,00eh,024h,02bh,01dh,004h,007h,00ah	; 97a9  . .....2-.$+....
	defb 00fh,007h,008h,000h,088h,034h,0c4h,00ch,0b4h,0c2h,071h,08bh,09eh,008h,000h,000h	; 97b9  .....4....q.....

; ----------------------------------------------------------------------
; DATOS rachas_97C9: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (116 bytes)
;   0x97c9..0x983d  (116 bytes)
DATA_rachas_97C9:
	defb 002h,000h,09eh,017h,01eh,03fh,03ch,030h,040h,000h,010h,038h,017h,000h,00fh,077h	; 97c9  .....?<0@..8...w
	defb 018h,000h,000h,020h,0c0h,020h,010h,018h,006h,002h,000h,030h,0d0h,000h,080h,0c0h	; 97d9  ... . .....0....
	defb 080h,003h,003h,081h,001h,005h,000h,08ch,003h,00bh,00fh,003h,000h,040h,060h,000h	; 97e9  .............@`.
	defb 080h,0c0h,080h,040h,003h,000h,002h,040h,086h,060h,0e0h,0cch,004h,000h,040h,003h	; 97f9  ...@...@.`....@.
	defb 000h,081h,003h,003h,004h,089h,002h,01fh,028h,021h,040h,043h,04ch,0b4h,070h,004h	; 9809  ........(!@CL.p.
	defb 000h,094h,080h,040h,020h,040h,0a0h,0d0h,030h,0d0h,0a8h,0a6h,099h,01dh,02ch,047h	; 9819  ...@ @..0.....,G
	defb 0a8h,09fh,0f0h,088h,0e7h,078h,008h,000h,088h,032h,0cah,02ch,0b0h,040h,038h,070h	; 9829  .....x...2.,.@8p
	defb 0e0h,008h,000h,000h	; 9839

; ----------------------------------------------------------------------
; DATOS rachas_983D: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (116 bytes)
;   0x983d..0x98b1  (116 bytes)
DATA_rachas_983D:
	defb 09ch,000h,017h,01eh,03fh,03ch,030h,040h,000h,000h,00ch,01eh,011h,000h,011h,00fh	; 983d  ....?<0@........
	defb 000h,000h,020h,0c0h,020h,010h,018h,006h,002h,000h,030h,0d0h,0c0h,004h,000h,002h	; 984d  .. . .....0.....
	defb 003h,081h,001h,005h,000h,084h,003h,00bh,00fh,003h,003h,000h,085h,00eh,080h,0c0h	; 985d  ................
	defb 080h,040h,003h,000h,002h,040h,08ah,060h,0e0h,0cch,004h,000h,000h,080h,000h,000h	; 986d  .@...@.`........
	defb 003h,003h,004h,08ah,002h,01fh,028h,021h,040h,043h,04ch,0b4h,070h,01ch,003h,000h	; 987d  ......(!@CL.p...
	defb 095h,080h,040h,020h,040h,0a0h,0d0h,030h,0d0h,0a8h,0a6h,099h,01dh,032h,033h,021h	; 988d  ..@ @..0.....23!
	defb 02eh,031h,02eh,010h,01fh,00fh,008h,000h,088h,0cah,02ch,030h,040h,080h,080h,000h	; 989d  .1........,0@...
	defb 0c0h,008h,000h,000h	; 98ad

; ----------------------------------------------------------------------
; DATOS rachas_98B1: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (113 bytes)
;   0x98b1..0x9922  (113 bytes)
DATA_rachas_98B1:
	defb 002h,000h,099h,017h,01eh,03fh,03ch,030h,040h,000h,010h,01ch,00fh,012h,03ch,071h	; 98b1  .....?<0@.....<q
	defb 020h,000h,000h,020h,0c0h,000h,000h,010h,00ch,004h,000h,020h,003h,000h,086h,080h	; 98c1   .. ....... ....
	defb 000h,006h,007h,007h,003h,005h,000h,084h,003h,00bh,00fh,003h,005h,000h,083h,080h	; 98d1  ................
	defb 000h,080h,003h,000h,002h,040h,086h,060h,0e0h,0d8h,008h,040h,0c0h,003h,000h,08dh	; 98e1  .....@.`...@....
	defb 006h,009h,008h,008h,004h,01fh,028h,021h,040h,043h,04ch,0b4h,070h,005h,000h,093h	; 98f1  ......(!@CL.p...
	defb 080h,040h,080h,060h,0d0h,020h,0e0h,0b0h,0ach,092h,01ah,02ch,023h,030h,02dh,043h	; 9901  .@.`. .....,#0-C
	defb 08eh,0d1h,079h,008h,000h,088h,024h,0d4h,0b8h,020h,0e0h,050h,0f0h,0e0h,008h,000h	; 9911  ..y...$.. .P....
	defb 000h	; 9921

; ----------------------------------------------------------------------
; DATOS rachas_9922: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (90 bytes)
;   0x9922..0x997c  (90 bytes)
DATA_rachas_9922:
	defb 09eh,003h,00ch,01fh,01fh,05fh,06fh,03fh,04fh,020h,038h,01fh,008h,007h,00eh,00eh	; 9922  ....._o?O 8.....
	defb 002h,000h,0c8h,0e8h,0e0h,0e8h,0d8h,030h,0c0h,014h,078h,0cch,020h,0e0h,070h,012h	; 9932  .......0..x. .p.
	defb 000h,003h,01ch,081h,014h,006h,000h,081h,00ch,00bh,000h,08eh,003h,00ch,013h,020h	; 9942  ...............
	defb 060h,0a0h,090h,0c0h,0b0h,05fh,000h,000h,008h,014h,003h,022h,091h,0eah,034h,014h	; 9952  `...._....."..4.
	defb 01ch,014h,024h,0cch,032h,0eah,047h,020h,017h,018h,011h,011h,01dh,03eh,008h,000h	; 9962  ..$.2.G .....>..
	defb 086h,086h,032h,0dch,010h,08ch,078h,00ah,000h,000h	; 9972  ..2...x...

; ----------------------------------------------------------------------
; DATOS rachas_997C: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (97 bytes)
;   0x997c..0x99dd  (97 bytes)
DATA_rachas_997C:
	defb 09fh,000h,003h,00ch,01fh,01fh,05fh,06fh,03fh,00fh,050h,03fh,060h,01fh,039h,001h	; 997c  ......_o?.P?`.9.
	defb 001h,000h,000h,0c0h,0e0h,0e0h,0e8h,0d8h,030h,0c0h,000h,0e8h,070h,098h,0c0h,0c0h	; 998c  ........0...p...
	defb 00ch,000h,081h,040h,005h,000h,081h,010h,003h,038h,081h,008h,006h,000h,081h,018h	; 999c  ...@.....8......
	defb 00ah,000h,089h,003h,00ch,013h,020h,060h,0a0h,090h,040h,0b0h,004h,000h,094h,010h	; 99ac  ...... `..@.....
	defb 028h,044h,044h,0c4h,034h,018h,018h,014h,024h,0c8h,038h,0afh,0c0h,09fh,060h,0c6h	; 99bc  (DD.4...$.8...`.
	defb 07ah,002h,001h,008h,000h,088h,0e4h,014h,08ch,064h,038h,020h,0e0h,0f0h,008h,000h	; 99cc  z........d8 ....
	defb 000h	; 99dc

; ----------------------------------------------------------------------
; DATOS rachas_99DD: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (94 bytes)
;   0x99dd..0x9a3b  (94 bytes)
DATA_rachas_99DD:
	defb 002h,000h,082h,004h,003h,006h,000h,096h,004h,001h,001h,000h,003h,001h,000h,000h	; 99dd  ................
	defb 0e8h,078h,0fch,03ch,00ch,002h,008h,01ch,018h,080h,000h,0f0h,0ech,018h,008h,000h	; 99ed  .x.<............
	defb 002h,002h,086h,006h,007h,003h,000h,00ch,02ch,009h,000h,086h,0c0h,0d0h,0e0h,080h	; 99fd  ........,.......
	defb 020h,030h,009h,000h,088h,004h,00bh,004h,003h,005h,005h,009h,008h,008h,000h,090h	; 9a0d   0..............
	defb 0f8h,014h,084h,002h,0c2h,032h,02dh,016h,004h,00bh,032h,052h,08fh,084h,08eh,077h	; 9a1d  .....2-...2R...w
	defb 008h,000h,088h,062h,0c6h,04ch,0f8h,00ch,012h,0e6h,03ch,008h,000h,000h	; 9a2d  ...b.L....<...

; ----------------------------------------------------------------------
; DATOS rachas_9A3B: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (96 bytes)
;   0x9a3b..0x9a9b  (96 bytes)
DATA_rachas_9A3B:
	defb 083h,000h,004h,003h,006h,000h,097h,002h,003h,000h,000h,003h,003h,001h,000h,0e8h	; 9a3b  ................
	defb 078h,0fch,03ch,00ch,002h,000h,000h,030h,078h,010h,000h,030h,0ech,018h,007h,000h	; 9a4b  x.<....0x..0....
	defb 086h,002h,072h,07ah,073h,02dh,008h,00bh,000h,088h,0c0h,0d0h,0f0h,0c0h,000h,000h	; 9a5b  ..rzs-..........
	defb 0c0h,0c0h,007h,000h,089h,004h,00bh,004h,003h,075h,08dh,085h,08ch,052h,007h,000h	; 9a6b  .........u...R..
	defb 091h,0f8h,014h,084h,002h,0c2h,032h,02dh,00eh,038h,035h,00ch,003h,003h,004h,01ch	; 9a7b  ......2-.85.....
	defb 00eh,007h,008h,000h,088h,0cch,084h,028h,038h,0cch,012h,0e6h,03ch,008h,000h,000h	; 9a8b  .......(8...<...

; ----------------------------------------------------------------------
; DATOS rachas_9A9B: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (94 bytes)
;   0x9a9b..0x9af9  (94 bytes)
DATA_rachas_9A9B:
	defb 002h,000h,092h,017h,01eh,03fh,03ch,030h,040h,010h,038h,018h,001h,000h,00fh,037h	; 9a9b  .....?<0@.8....7
	defb 018h,000h,000h,020h,0c0h,006h,000h,086h,020h,080h,080h,000h,0c0h,080h,009h,000h	; 9aab  ... .... .......
	defb 086h,003h,00bh,007h,001h,004h,00ch,009h,000h,002h,040h,086h,060h,0e0h,0c0h,000h	; 9abb  ..........@.`...
	defb 030h,034h,008h,000h,088h,01fh,028h,021h,040h,043h,04ch,0b4h,068h,008h,000h,090h	; 9acb  04....(!@CL.h...
	defb 020h,0d0h,020h,0c0h,0a0h,0a0h,090h,010h,046h,063h,032h,01fh,030h,048h,067h,03ch	; 9adb   . .....Fc2.0Hg<
	defb 008h,000h,088h,020h,0d0h,04ch,04ah,0f1h,021h,071h,0eeh,008h,000h,000h	; 9aeb  ... .LJ.!q....

; ----------------------------------------------------------------------
; DATOS rachas_9AF9: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (96 bytes)
;   0x9af9..0x9b59  (96 bytes)
DATA_rachas_9AF9:
	defb 093h,000h,017h,01eh,03fh,03ch,030h,040h,000h,000h,00ch,01eh,008h,000h,00ch,037h	; 9af9  ....?<0@.......7
	defb 018h,000h,020h,0c0h,006h,000h,087h,040h,0c0h,000h,000h,0c0h,0c0h,080h,008h,000h	; 9b09  .. ....@........
	defb 088h,003h,00bh,00fh,003h,000h,000h,003h,003h,007h,000h,086h,040h,04eh,05eh,0ceh	; 9b19  ............@N^.
	defb 0b4h,010h,00ah,000h,089h,01fh,028h,021h,040h,043h,04ch,0b4h,070h,01ch,007h,000h	; 9b29  ......(!@CL.p...
	defb 091h,020h,0d0h,020h,0c0h,0aeh,0b1h,0a1h,031h,04ah,033h,021h,014h,01ch,033h,048h	; 9b39  . . ....1J3!..3H
	defb 067h,03ch,008h,000h,088h,0ach,030h,0c0h,0c0h,020h,038h,070h,0e0h,008h,000h,000h	; 9b49  g<....0.. 8p....

; ----------------------------------------------------------------------
; DATOS rachas_9B59: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (95 bytes)
;   0x9b59..0x9bb8  (95 bytes)
DATA_rachas_9B59:
	defb 002h,000h,082h,004h,003h,006h,000h,096h,00fh,001h,001h,000h,003h,001h,000h,000h	; 9b59  ................
	defb 0e8h,078h,0fch,03ch,00ch,002h,000h,00ch,09ch,088h,080h,04ch,0eeh,018h,008h,000h	; 9b69  .x.<.......L....
	defb 002h,002h,086h,006h,007h,000h,000h,060h,00ch,009h,000h,087h,0c0h,0d0h,0f0h,040h	; 9b79  .......`.......@
	defb 000h,020h,030h,008h,000h,088h,004h,00bh,004h,003h,005h,005h,009h,008h,008h,000h	; 9b89  . 0.............
	defb 090h,0f8h,014h,084h,002h,0c2h,032h,02dh,00eh,00fh,070h,09eh,072h,013h,01ch,00eh	; 9b99  ......2-..p.r...
	defb 007h,008h,000h,088h,0b2h,062h,054h,04ch,0b2h,011h,0e7h,01eh,008h,000h,000h	; 9ba9  .....bTL.......

; ----------------------------------------------------------------------
; DATOS rachas_9BB8: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (95 bytes)
;   0x9bb8..0x9c17  (95 bytes)
DATA_rachas_9BB8:
	defb 083h,000h,004h,003h,006h,000h,083h,00fh,001h,001h,005h,000h,08eh,0e8h,078h,0fch	; 9bb8  ..............x.
	defb 03ch,00ch,002h,000h,00ch,09ch,088h,080h,048h,0f8h,0f0h,008h,000h,002h,002h,087h	; 9bc8  <.......H.......
	defb 006h,007h,000h,000h,060h,00ch,00ch,008h,000h,087h,0c0h,0d0h,0f0h,040h,000h,020h	; 9bd8  ....`........@.
	defb 030h,008h,000h,089h,004h,00bh,004h,003h,005h,005h,009h,008h,00fh,007h,000h,091h	; 9be8  0...............
	defb 0f8h,014h,084h,002h,0c2h,032h,02dh,00eh,0b2h,070h,09eh,072h,013h,00dh,001h,000h	; 9bf8  .....2-..p.r....
	defb 003h,008h,000h,088h,062h,054h,04ch,0b4h,004h,008h,0f8h,0f0h,008h,000h,000h	; 9c08  ....bTL........

; ----------------------------------------------------------------------
; DATOS rachas_9C17: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (95 bytes)
;   0x9c17..0x9c76  (95 bytes)
DATA_rachas_9C17:
	defb 002h,000h,082h,004h,003h,006h,000h,081h,007h,003h,000h,081h,001h,003h,000h,08eh	; 9c17  ................
	defb 0e8h,078h,0fch,03ch,00ch,002h,000h,006h,0ceh,0c4h,0c0h,004h,08eh,004h,008h,000h	; 9c27  .x.<............
	defb 002h,002h,086h,006h,007h,000h,000h,030h,006h,009h,000h,087h,0c0h,0d0h,0f0h,000h	; 9c37  .......0........
	defb 000h,010h,018h,008h,000h,088h,004h,00bh,004h,003h,005h,005h,009h,008h,008h,000h	; 9c47  ................
	defb 090h,0f8h,014h,084h,002h,0c2h,032h,02dh,00eh,007h,038h,04fh,039h,009h,006h,00fh	; 9c57  ......2-..8O9...
	defb 007h,008h,000h,088h,0f9h,031h,02ah,024h,0fah,071h,08bh,09eh,008h,000h,000h	; 9c67  .....1*$.q.....

; ----------------------------------------------------------------------
; DATOS rachas_9C76: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (95 bytes)
;   0x9c76..0x9cd5  (95 bytes)
DATA_rachas_9C76:
	defb 002h,000h,092h,017h,01eh,03fh,03ch,030h,040h,000h,030h,039h,011h,001h,032h,077h	; 9c76  .....?<0@.09..2w
	defb 018h,000h,000h,020h,0c0h,006h,000h,086h,0f0h,080h,080h,000h,0c0h,080h,009h,000h	; 9c86  ... ............
	defb 087h,003h,00bh,00fh,002h,000h,004h,00ch,008h,000h,002h,040h,086h,060h,0e0h,000h	; 9c96  ...........@.`..
	defb 000h,006h,030h,008h,000h,088h,01fh,028h,021h,040h,043h,04ch,0b4h,070h,008h,000h	; 9ca6  ..0....(!@CL.p..
	defb 090h,020h,0d0h,020h,0c0h,0a0h,0a0h,090h,010h,04dh,046h,02ah,032h,04dh,088h,0e7h	; 9cb6  . . .....MF*2M..
	defb 078h,008h,000h,088h,0f0h,00eh,079h,04eh,0c8h,038h,070h,0e0h,008h,000h,000h	; 9cc6  x.....yN.8p....

; ----------------------------------------------------------------------
; DATOS rachas_9CD5: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (94 bytes)
;   0x9cd5..0x9d33  (94 bytes)
DATA_rachas_9CD5:
	defb 093h,000h,017h,01eh,03fh,03ch,030h,040h,000h,030h,039h,011h,001h,012h,01fh,00fh	; 9cd5  ....?<0@.09.....
	defb 000h,000h,020h,0c0h,006h,000h,083h,0f0h,080h,080h,00ch,000h,087h,003h,00bh,00fh	; 9ce5  .. .............
	defb 002h,000h,004h,00ch,008h,000h,002h,040h,087h,060h,0e0h,000h,000h,006h,030h,030h	; 9cf5  .......@.`....00
	defb 007h,000h,089h,01fh,028h,021h,040h,043h,04ch,0b4h,070h,04dh,007h,000h,091h,020h	; 9d05  ....(!@CL.pM...
	defb 0d0h,020h,0c0h,0a0h,0a0h,090h,010h,0f0h,046h,02ah,032h,02dh,020h,010h,01fh,00fh	; 9d15  . ......F*2- ...
	defb 008h,000h,088h,00eh,079h,04eh,0c8h,0b0h,080h,000h,0c0h,008h,000h,000h	; 9d25  ....yN........

; ----------------------------------------------------------------------
; DATOS rachas_9D33: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (94 bytes)
;   0x9d33..0x9d91  (94 bytes)
DATA_rachas_9D33:
	defb 002h,000h,092h,017h,01eh,03fh,03ch,030h,040h,000h,060h,073h,023h,003h,020h,071h	; 9d33  .....?<0@.`s#. q
	defb 020h,000h,000h,020h,0c0h,006h,000h,081h,0e0h,003h,000h,081h,080h,00ah,000h,087h	; 9d43   .. ............
	defb 003h,00bh,00fh,000h,000h,008h,018h,008h,000h,002h,040h,086h,060h,0e0h,000h,000h	; 9d53  ..........@.`...
	defb 00ch,060h,008h,000h,088h,01fh,028h,021h,040h,043h,04ch,0b4h,070h,008h,000h,090h	; 9d63  .`....(!@CL.p...
	defb 020h,0d0h,020h,0c0h,0a0h,0a0h,090h,010h,09fh,08ch,054h,024h,05fh,08eh,0d1h,079h	; 9d73   . .......T$_..y
	defb 008h,000h,088h,0e0h,01ch,0f2h,09ch,090h,060h,0f0h,0e0h,008h,000h,000h	; 9d83  ........`.....

; ----------------------------------------------------------------------
; DATOS rachas_9D91: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (92 bytes)
;   0x9d91..0x9ded  (92 bytes)
DATA_rachas_9D91:
	defb 09eh,003h,00ch,01fh,01fh,05fh,06fh,03fh,00fh,020h,038h,01fh,008h,007h,00eh,00eh	; 9d91  ....._o?. 8.....
	defb 002h,01ch,0dch,0ech,0e4h,0e8h,0dah,032h,0c0h,014h,078h,0cch,020h,0e0h,070h,00ch	; 9da1  .......2..x. .p.
	defb 000h,081h,040h,005h,000h,003h,008h,007h,000h,081h,00ch,00bh,000h,08ah,003h,00ch	; 9db1  ..@.............
	defb 013h,020h,060h,0a0h,090h,0c0h,0b0h,05fh,003h,000h,081h,008h,003h,014h,091h,0e2h	; 9dc1  . `...._........
	defb 022h,012h,01ah,017h,025h,0cdh,032h,0eah,047h,020h,017h,018h,011h,011h,01dh,03eh	; 9dd1  "...%.2.G .....>
	defb 008h,000h,086h,086h,032h,0dch,010h,08ch,078h,00ah,000h,000h	; 9de1  ....2...x...

; ----------------------------------------------------------------------
; DATOS rachas_9DED: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (91 bytes)
;   0x9ded..0x9e48  (91 bytes)
DATA_rachas_9DED:
	defb 09fh,000h,003h,00ch,01fh,01fh,05fh,06fh,03fh,00fh,050h,03fh,060h,01fh,039h,001h	; 9ded  ......_o?.P?`.9.
	defb 001h,000h,000h,0c0h,0e8h,0e0h,0e8h,0d8h,030h,0c4h,000h,0e8h,070h,098h,0c0h,0c0h	; 9dfd  ........0...p...
	defb 00ch,000h,081h,040h,007h,000h,003h,010h,006h,000h,081h,018h,00ah,000h,089h,003h	; 9e0d  ...@............
	defb 00ch,013h,020h,060h,0a0h,090h,040h,0b0h,006h,000h,092h,010h,028h,0e8h,02ch,014h	; 9e1d  .. `..@.....(.,.
	defb 01ch,014h,026h,0ceh,03ah,0afh,0c0h,09fh,060h,0c6h,07ah,002h,001h,008h,000h,088h	; 9e2d  ..&.:...`.z.....
	defb 0e4h,014h,08ch,064h,038h,020h,0e0h,0f0h,008h,000h,000h	; 9e3d  ...d8 .....

; ----------------------------------------------------------------------
; DATOS rachas_9E48: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (95 bytes)
;   0x9e48..0x9ea7  (95 bytes)
DATA_rachas_9E48:
	defb 002h,000h,082h,004h,003h,006h,000h,096h,00fh,001h,001h,000h,001h,001h,000h,000h	; 9e48  ................
	defb 0e8h,078h,0fch,03ch,00ch,002h,000h,00ch,09ch,088h,080h,040h,0ech,018h,008h,000h	; 9e58  .x.<.......@....
	defb 002h,002h,086h,006h,007h,000h,000h,060h,00ch,009h,000h,087h,0c0h,0d0h,0f0h,040h	; 9e68  .......`.......@
	defb 000h,020h,030h,008h,000h,088h,004h,00bh,004h,003h,005h,005h,009h,008h,008h,000h	; 9e78  . 0.............
	defb 090h,0f8h,014h,084h,002h,0c2h,032h,02dh,00eh,01fh,070h,09eh,072h,013h,00eh,00eh	; 9e88  ......2-..p.r...
	defb 01fh,008h,000h,088h,0b2h,062h,054h,048h,0bch,012h,0e6h,03ch,008h,000h,000h	; 9e98  .....bTH...<...

; ----------------------------------------------------------------------
; DATOS rachas_9EA7: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (106 bytes)
;   0x9ea7..0x9f11  (106 bytes)
DATA_rachas_9EA7:
	defb 082h,000h,003h,007h,000h,097h,007h,011h,000h,000h,001h,003h,001h,000h,078h,0fch	; 9ea7  ..............x.
	defb 03ch,00ch,002h,000h,006h,00eh,0c4h,0c0h,0c0h,030h,0ech,098h,010h,003h,000h,081h	; 9eb7  <........0......
	defb 004h,003h,000h,002h,002h,087h,006h,007h,000h,000h,020h,006h,006h,003h,000h,081h	; 9ec7  .......... .....
	defb 0e8h,004h,000h,086h,0c0h,0d0h,0f0h,000h,010h,018h,008h,000h,08ah,004h,00bh,004h	; 9ed7  ................
	defb 003h,003h,005h,005h,009h,008h,00fh,006h,000h,092h,0f8h,014h,084h,002h,0c2h,0f2h	; 9ee7  ................
	defb 03dh,02eh,009h,0f1h,038h,04eh,039h,009h,01eh,01ch,00eh,007h,008h,000h,088h,02ah	; 9ef7  =...8N9........*
	defb 024h,038h,0cch,012h,066h,0ach,038h,008h,000h,000h	; 9f07  $8..f.8...

; ----------------------------------------------------------------------
; DATOS rachas_9F11: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (95 bytes)
;   0x9f11..0x9f70  (95 bytes)
DATA_rachas_9F11:
	defb 002h,000h,092h,017h,01eh,03fh,03ch,030h,040h,000h,030h,039h,011h,001h,002h,037h	; 9f11  .....?<0@.09...7
	defb 018h,000h,000h,020h,0c0h,006h,000h,086h,0f0h,080h,080h,000h,080h,080h,009h,000h	; 9f21  ... ............
	defb 087h,003h,00bh,00fh,002h,000h,004h,00ch,008h,000h,002h,040h,086h,060h,0e0h,000h	; 9f31  ...........@.`..
	defb 000h,006h,030h,008h,000h,088h,01fh,028h,021h,040h,043h,04ch,0b4h,070h,008h,000h	; 9f41  ..0....(!@CL.p..
	defb 090h,020h,0d0h,020h,0c0h,0a0h,0a0h,090h,010h,04dh,046h,02ah,012h,03dh,048h,067h	; 9f51  . . .....MF*.=Hg
	defb 03ch,008h,000h,088h,0f8h,00eh,079h,04eh,0c8h,070h,070h,0f8h,008h,000h,000h	; 9f61  <.....yN.pp....

; ----------------------------------------------------------------------
; DATOS rachas_9F70: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (106 bytes)
;   0x9f70..0x9fda  (106 bytes)
DATA_rachas_9F70:
	defb 092h,000h,01eh,03fh,03ch,030h,040h,000h,060h,070h,023h,003h,003h,00ch,037h,019h	; 9f70  ...?<0@.`p#...7.
	defb 008h,000h,0c0h,007h,000h,087h,0e0h,088h,000h,000h,080h,0c0h,080h,003h,000h,081h	; 9f80  ................
	defb 017h,004h,000h,086h,003h,00bh,00fh,000h,008h,018h,005h,000h,081h,020h,003h,000h	; 9f90  ............. ..
	defb 002h,040h,087h,060h,0e0h,000h,000h,004h,060h,060h,006h,000h,08ah,01fh,028h,021h	; 9fa0  .@.`....``....(!
	defb 040h,043h,04fh,0bch,074h,090h,08fh,006h,000h,092h,020h,0d0h,020h,0c0h,0c0h,0a0h	; 9fb0  @CO.t..... . ...
	defb 0a0h,090h,010h,0f0h,054h,024h,01ch,033h,048h,066h,035h,01ch,008h,000h,088h,01ch	; 9fc0  ....T$.3Hf5.....
	defb 072h,09ch,090h,078h,038h,070h,0e0h,008h,000h,000h	; 9fd0  r..x8p....

; ----------------------------------------------------------------------
; DATOS rachas_9FDA: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0 acaba
;   (sigue en el banco 15, en 0xA000); lo leen p00:568D (38 bytes)
;   0x9fda..0xa000  (38 bytes)
DATA_rachas_9FDA:
	defb 002h,000h,082h,004h,003h,006h,000h,096h,00ch,00bh,000h,001h,003h,001h,000h,000h	; 9fda  ................
	defb 0e8h,078h,0fch,03ch,00ch,002h,000h,008h,01ch,0e8h,000h,0f0h,0eeh,018h,006h,000h	; 9fea  .x.<............
	defb 08ah,078h,07ch,07ah,012h,016h	; 9ffa
