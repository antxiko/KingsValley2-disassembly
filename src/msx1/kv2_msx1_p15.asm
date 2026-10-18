; ==========================================================================
; KING'S VALLEY II - Konami (1988) - MSX - MegaROM RC-760 de 128 KB (Konami SCC) - banco 15 (se ejecuta en 0xa000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x0a000


; ----------------------------------------------------------------------
; DATOS rachas_9FDA_cola: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0 acaba
;   (sigue del banco 14); lo leen p00:568D (59 bytes)
;   0xa000..0xa03b  (59 bytes)
DATA_rachas_9FDA_cola:
	defb 007h,033h,020h,000h,002h,009h,000h,087h,0c0h,0d0h,0f0h,0c0h,000h,002h,006h,008h	; a000  .3 .............
	defb 000h,088h,004h,07bh,084h,083h,085h,06dh,029h,038h,008h,000h,090h,0f8h,014h,084h	; a010  ...{...m)8......
	defb 002h,0c2h,032h,02dh,00eh,04ch,053h,034h,00dh,002h,01ch,00eh,007h,008h,000h,088h	; a020  ..2-.LS4........
	defb 034h,0e2h,015h,0f9h,00fh,011h,0e7h,01eh,008h,000h,000h	; a030  4..........

; ----------------------------------------------------------------------
; DATOS rachas_A03B: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (98 bytes)
;   0xa03b..0xa09d  (98 bytes)
DATA_rachas_A03B:
	defb 083h,000h,006h,003h,006h,000h,083h,00ch,00bh,003h,005h,000h,08eh,0e8h,078h,0fch	; a03b  ..............x.
	defb 03ch,00ch,002h,000h,000h,030h,078h,088h,000h,088h,0f0h,006h,000h,08bh,078h,07ch	; a04b  <....0x.......x|
	defb 07ah,012h,016h,007h,033h,020h,000h,000h,001h,008h,000h,084h,0c0h,0d0h,0f0h,0c0h	; a05b  z...3 ..........
	defb 003h,000h,081h,070h,007h,000h,089h,004h,079h,084h,083h,085h,06dh,029h,038h,04ch	; a06b  ...p....y...m)8L
	defb 007h,000h,091h,0f8h,014h,084h,002h,0c2h,032h,02dh,00eh,038h,053h,034h,00ch,002h	; a07b  ........2-.8S4..
	defb 001h,001h,000h,003h,008h,000h,088h,0cch,084h,074h,08ch,074h,008h,0f8h,0f0h,008h	; a08b  .........t.t....
	defb 000h,000h	; a09b

; ----------------------------------------------------------------------
; DATOS rachas_A09D: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (94 bytes)
;   0xa09d..0xa0fb  (94 bytes)
DATA_rachas_A09D:
	defb 002h,000h,082h,004h,003h,006h,000h,081h,004h,003h,000h,081h,001h,003h,000h,08eh	; a09d  ................
	defb 0e8h,078h,0fch,03ch,00ch,002h,000h,008h,038h,0f0h,048h,03ch,08eh,004h,006h,000h	; a0ad  .x.<....8.H<....
	defb 08ah,038h,03ch,03ah,00ah,006h,007h,01bh,010h,002h,003h,009h,000h,084h,0c0h,0d0h	; a0bd  .8<:............
	defb 0f0h,0c0h,00bh,000h,088h,004h,03bh,044h,043h,045h,035h,019h,018h,008h,000h,090h	; a0cd  .......DCE5.....
	defb 0f8h,014h,084h,002h,0c2h,032h,02dh,00eh,024h,02bh,01dh,004h,007h,00ah,00fh,007h	; a0dd  .....2-.$+......
	defb 008h,000h,088h,034h,0c4h,00ch,0b4h,0c2h,071h,08bh,09eh,008h,000h,000h	; a0ed  ...4....q.....

; ----------------------------------------------------------------------
; DATOS rachas_A0FB: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (97 bytes)
;   0xa0fb..0xa15c  (97 bytes)
DATA_rachas_A0FB:
	defb 002h,000h,092h,017h,01eh,03fh,03ch,030h,040h,000h,010h,038h,017h,000h,00fh,077h	; a0fb  .....?<0@..8...w
	defb 018h,000h,000h,020h,0c0h,006h,000h,086h,030h,0d0h,000h,080h,0c0h,080h,009h,000h	; a10b  ... ....0.......
	defb 087h,003h,00bh,00fh,003h,000h,040h,060h,006h,000h,08ah,01eh,03eh,05eh,048h,068h	; a11b  ......@`....>^Hh
	defb 0e0h,0cch,004h,000h,040h,008h,000h,088h,01fh,028h,021h,040h,043h,04ch,0b4h,070h	; a12b  ....@....(!@CL.p
	defb 008h,000h,090h,020h,0deh,021h,0c1h,0a1h,0b6h,094h,01ch,02ch,047h,0a8h,09fh,0f0h	; a13b  ... .!.....,G...
	defb 088h,0e7h,078h,008h,000h,088h,032h,0cah,02ch,0b0h,040h,038h,070h,0e0h,008h,000h	; a14b  ..x...2.,.@8p...
	defb 000h	; a15b

; ----------------------------------------------------------------------
; DATOS rachas_A15C: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (97 bytes)
;   0xa15c..0xa1bd  (97 bytes)
DATA_rachas_A15C:
	defb 093h,000h,017h,01eh,03fh,03ch,030h,040h,000h,000h,00ch,01eh,011h,000h,011h,00fh	; a15c  ....?<0@........
	defb 000h,000h,060h,0c0h,006h,000h,083h,030h,0d0h,0c0h,00ch,000h,084h,003h,00bh,00fh	; a16c  ..`....0........
	defb 003h,003h,000h,081h,00eh,005h,000h,08bh,01eh,03eh,05eh,048h,068h,0e0h,0cch,004h	; a17c  .........>^Hh...
	defb 000h,000h,080h,007h,000h,089h,01fh,028h,021h,040h,043h,04ch,0b4h,070h,01ch,007h	; a18c  .......(!@CL.p..
	defb 000h,091h,020h,09eh,021h,0c1h,0a1h,0b6h,094h,01ch,032h,033h,021h,02eh,031h,02eh	; a19c  .. .!.....23!.1.
	defb 010h,01fh,00fh,008h,000h,088h,0cah,02ch,030h,040h,080h,080h,000h,0c0h,008h,000h	; a1ac  .......,0@......
	defb 000h	; a1bc

; ----------------------------------------------------------------------
; DATOS rachas_A1BD: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (93 bytes)
;   0xa1bd..0xa21a  (93 bytes)
DATA_rachas_A1BD:
	defb 002h,000h,092h,017h,01eh,03fh,03ch,030h,040h,000h,010h,01ch,00fh,012h,03ch,071h	; a1bd  .....?<0@.....<q
	defb 020h,000h,000h,020h,0c0h,006h,000h,081h,020h,003h,000h,081h,080h,00ah,000h,084h	; a1cd   .. .... .......
	defb 003h,00bh,00fh,003h,009h,000h,08ah,01ch,03ch,05ch,050h,060h,0e0h,0d8h,008h,040h	; a1dd  ........<\P`...@
	defb 0c0h,008h,000h,088h,01fh,028h,021h,040h,043h,04ch,0b4h,070h,008h,000h,090h,020h	; a1ed  .....(!@CL.p...
	defb 0dch,022h,0c2h,0a2h,0ach,098h,018h,02ch,023h,030h,02dh,043h,08eh,0d1h,079h,008h	; a1fd  .".....,#0-C..y.
	defb 000h,088h,024h,0d4h,0b8h,020h,0e0h,050h,0f0h,0e0h,008h,000h,000h	; a20d  ..$.. .P.....

; ----------------------------------------------------------------------
; DATOS rachas_A21A: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (89 bytes)
;   0xa21a..0xa273  (89 bytes)
DATA_rachas_A21A:
	defb 091h,003h,00ch,01fh,01fh,05fh,06fh,03fh,00fh,020h,038h,01fh,008h,007h,00eh,00eh	; a21a  ....._o?. 8.....
	defb 002h,000h,003h,080h,002h,0c0h,088h,030h,0c0h,014h,078h,0cch,020h,0e0h,070h,00ch	; a22a  .......0..x. .p.
	defb 000h,081h,040h,009h,000h,003h,03eh,002h,008h,082h,004h,00ch,00bh,000h,08ah,003h	; a23a  ..@...>.........
	defb 00ch,013h,020h,060h,0a0h,090h,0c0h,0b0h,05fh,007h,000h,081h,0feh,003h,041h,08dh	; a24a  .. `...._.....A.
	defb 036h,034h,0cah,032h,0eah,047h,020h,017h,018h,011h,011h,01dh,03eh,008h,000h,086h	; a25a  64.2.G .....>...
	defb 086h,032h,0dch,010h,08ch,078h,00ah,000h,000h	; a26a  .2...x...

; ----------------------------------------------------------------------
; DATOS rachas_A273: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (90 bytes)
;   0xa273..0xa2cd  (90 bytes)
DATA_rachas_A273:
	defb 093h,000h,003h,00ch,01fh,01fh,05fh,06fh,03fh,00fh,050h,03fh,060h,01fh,039h,001h	; a273  ......_o?.P?`.9.
	defb 001h,000h,000h,080h,003h,000h,089h,080h,000h,0c0h,000h,0e8h,070h,098h,0c0h,0c0h	; a283  ............p...
	defb 00ch,000h,081h,040h,00ah,000h,003h,07ch,002h,010h,082h,008h,018h,00ah,000h,089h	; a293  ...@...|........
	defb 003h,00ch,013h,020h,060h,0a0h,090h,040h,0b0h,008h,000h,082h,0c0h,07ch,003h,082h	; a2a3  ... `..@.....|..
	defb 08bh,06ch,0e8h,034h,0afh,0c0h,09fh,060h,0c6h,07ah,002h,001h,008h,000h,088h,0e4h	; a2b3  .l.4...`.z......
	defb 014h,08ch,064h,038h,020h,0e0h,0f0h,008h,000h,000h	; a2c3  ..d8 .....

; ----------------------------------------------------------------------
; DATOS rachas_A2CD: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (96 bytes)
;   0xa2cd..0xa32d  (96 bytes)
DATA_rachas_A2CD:
	defb 002h,000h,083h,013h,00dh,003h,004h,000h,08dh,020h,010h,00fh,000h,007h,00fh,004h	; a2cd  ......... ......
	defb 000h,000h,0a0h,0e0h,0e0h,0c0h,003h,000h,087h,040h,0e0h,040h,000h,0c0h,0b0h,060h	; a2dd  .........@.@...`
	defb 008h,000h,088h,008h,00bh,05bh,05fh,00fh,000h,000h,008h,007h,000h,086h,008h,01ch	; a2ed  .....[_.........
	defb 00eh,00fh,0b2h,010h,00bh,000h,088h,013h,02ch,012h,00ch,017h,054h,0a4h,0a0h,008h	; a2fd  ........,...T...
	defb 000h,090h,0e0h,050h,018h,014h,022h,0f1h,0f0h,04dh,050h,02fh,010h,017h,008h,070h	; a30d  ...P.."..MP/...p
	defb 03bh,01ch,008h,000h,088h,0aah,010h,0a0h,0e0h,030h,048h,098h,0e0h,008h,000h,000h	; a31d  .........0H.....

; ----------------------------------------------------------------------
; DATOS rachas_A32D: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (92 bytes)
;   0xa32d..0xa389  (92 bytes)
DATA_rachas_A32D:
	defb 002h,000h,003h,001h,004h,000h,097h,006h,00fh,003h,000h,007h,00fh,004h,000h,000h	; a32d  ................
	defb 0a0h,0e0h,0f0h,0f0h,030h,008h,000h,000h,0c0h,0c0h,000h,0c0h,0b0h,060h,005h,000h	; a33d  ....0........`..
	defb 003h,07ch,088h,010h,013h,043h,039h,030h,000h,000h,008h,00ah,000h,082h,040h,0c0h	; a34d  .|...C90......@.
	defb 00ch,000h,081h,07fh,003h,082h,084h,06fh,06ch,0bch,0c6h,008h,000h,090h,0e0h,050h	; a35d  .......ol......P
	defb 010h,008h,008h,0c8h,0b4h,038h,049h,030h,01ch,017h,008h,070h,03bh,01ch,008h,000h	; a36d  .....8I0...p....
	defb 088h,0e0h,020h,020h,0e0h,030h,048h,098h,0e0h,008h,000h,000h	; a37d  ..  .0H.....

; ----------------------------------------------------------------------
; DATOS rachas_A389: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (96 bytes)
;   0xa389..0xa3e9  (96 bytes)
DATA_rachas_A389:
	defb 002h,000h,084h,005h,007h,007h,003h,003h,000h,08ch,002h,007h,002h,000h,003h,00dh	; a389  ................
	defb 006h,000h,000h,0c8h,0b0h,0c0h,004h,000h,087h,004h,008h,0f0h,000h,0e0h,0f0h,020h	; a399  ...............
	defb 007h,000h,086h,010h,038h,070h,0f0h,04dh,008h,00bh,000h,088h,010h,0d0h,0dah,0fah	; a3a9  ....8p.M........
	defb 0f0h,000h,000h,010h,008h,000h,088h,007h,00ah,018h,028h,044h,08fh,00fh,0b2h,008h	; a3b9  ..........(D....
	defb 000h,090h,0c8h,034h,048h,030h,0e8h,02ah,025h,005h,055h,008h,005h,007h,00ch,012h	; a3c9  ...4H0.*%.U.....
	defb 019h,007h,008h,000h,088h,00ah,0f4h,008h,0e8h,010h,00eh,0dch,038h,008h,000h,000h	; a3d9  ............8...

; ----------------------------------------------------------------------
; DATOS rachas_A3E9: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (93 bytes)
;   0xa3e9..0xa446  (93 bytes)
DATA_rachas_A3E9:
	defb 002h,000h,090h,005h,007h,00fh,00fh,00ch,010h,000h,000h,003h,003h,000h,003h,00dh	; a3e9  ................
	defb 006h,000h,000h,003h,080h,004h,000h,087h,060h,0f0h,0c0h,000h,0e0h,0f0h,020h,00ah	; a3f9  ........`..... .
	defb 000h,082h,002h,003h,009h,000h,003h,03eh,088h,008h,0c8h,0c2h,00ch,00ch,000h,000h	; a409  .......>........
	defb 010h,008h,000h,088h,007h,00ah,008h,010h,010h,013h,02dh,01ch,008h,000h,081h,0feh	; a419  ..........-.....
	defb 003h,041h,08ch,0f6h,036h,03dh,063h,007h,004h,004h,007h,00ch,012h,019h,007h,008h	; a429  .A..6=c.........
	defb 000h,088h,092h,00ch,038h,0e8h,010h,00eh,0dch,038h,008h,000h,000h	; a439  ....8....8...

; ----------------------------------------------------------------------
; DATOS rachas_A446: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (92 bytes)
;   0xa446..0xa4a2  (92 bytes)
DATA_rachas_A446:
	defb 084h,000h,009h,006h,001h,006h,000h,095h,007h,000h,003h,007h,002h,000h,000h,0d0h	; a446  ................
	defb 0f0h,0f8h,078h,018h,004h,000h,088h,0f8h,0f0h,000h,0e0h,090h,060h,008h,000h,088h	; a456  ..x.........`...
	defb 004h,003h,00dh,00fh,006h,000h,000h,004h,009h,000h,002h,080h,081h,070h,00ch,000h	; a466  .............p..
	defb 089h,009h,016h,009h,006h,00bh,00ch,012h,010h,009h,007h,000h,091h,0f0h,028h,008h	; a476  ..............(.
	defb 004h,084h,064h,07ah,08ch,074h,007h,008h,00bh,024h,038h,01dh,00eh,001h,008h,000h	; a486  ..dz.t...$8.....
	defb 088h,004h,008h,0f8h,018h,068h,090h,0f0h,0e0h,008h,000h,000h	; a496  .....h......

; ----------------------------------------------------------------------
; DATOS rachas_A4A2: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (90 bytes)
;   0xa4a2..0xa4fc  (90 bytes)
DATA_rachas_A4A2:
	defb 0a0h,001h,006h,00fh,00fh,02fh,037h,01fh,007h,010h,01ch,003h,01ch,00fh,004h,000h	; a4a2  ...../7.........
	defb 000h,080h,060h,0f0h,0f0h,0f4h,0ech,098h,0e0h,008h,01ch,0f8h,010h,0e0h,070h,0e0h	; a4b2  ..`...........p.
	defb 040h,00ah,000h,082h,060h,040h,00eh,000h,082h,006h,002h,00ah,000h,08ah,001h,006h	; a4c2  @...`@..........
	defb 009h,010h,030h,050h,048h,060h,098h,0afh,006h,000h,091h,080h,060h,090h,008h,00ch	; a4d2  ..0PH`......`...
	defb 00ah,012h,066h,019h,0f5h,063h,01ch,063h,030h,01bh,00dh,001h,009h,000h,088h,0e2h	; a4e2  ..f..c.c0.......
	defb 004h,0e8h,018h,088h,010h,0a0h,0f0h,008h,000h,000h	; a4f2  ..........

; ----------------------------------------------------------------------
; DATOS rachas_A4FC: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (93 bytes)
;   0xa4fc..0xa559  (93 bytes)
DATA_rachas_A4FC:
	defb 095h,000h,002h,003h,007h,007h,006h,008h,000h,004h,007h,003h,000h,001h,002h,001h	; a4fc  ................
	defb 000h,000h,0e4h,0d8h,0e0h,080h,003h,000h,087h,040h,0c0h,0f8h,000h,0f0h,078h,090h	; a50c  .........@....x.
	defb 00bh,000h,081h,003h,00ch,000h,088h,008h,070h,06ch,0bch,018h,000h,000h,008h,008h	; a51c  ........pl......
	defb 000h,089h,003h,005h,004h,008h,008h,009h,017h,00ch,00bh,007h,000h,091h,0e4h,01ah	; a52c  ................
	defb 024h,018h,074h,08ch,092h,042h,0a4h,008h,004h,007h,006h,005h,002h,003h,001h,008h	; a53c  $.t..B..........
	defb 000h,088h,038h,004h,0f4h,009h,087h,06eh,0dch,0e0h,008h,000h,000h	; a54c  ..8....n.....

; ----------------------------------------------------------------------
; DATOS rachas_A559: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (104 bytes)
;   0xa559..0xa5c1  (104 bytes)
DATA_rachas_A559:
	defb 09fh,003h,004h,003h,00ch,010h,010h,000h,000h,009h,01eh,00fh,004h,003h,007h,003h	; a559  ................
	defb 001h,0f0h,008h,0f0h,00ch,002h,002h,000h,000h,028h,01ch,0e0h,01ch,0f8h,010h,080h	; a569  .........(......
	defb 008h,000h,085h,002h,007h,006h,033h,020h,006h,000h,081h,0c0h,004h,000h,088h,0d0h	; a579  ......3 ........
	defb 038h,0d8h,036h,002h,000h,000h,0c0h,007h,000h,08ah,003h,004h,00bh,00ch,013h,02dh	; a589  8.6............-
	defb 028h,039h,04ch,056h,005h,000h,093h,0c0h,030h,008h,0f4h,00ch,0f2h,02dh,0c5h,027h	; a599  (9LV....0....-.'
	defb 0c9h,0d5h,021h,010h,00bh,00ch,008h,004h,002h,007h,008h,000h,088h,0e2h,01ch,023h	; a5a9  ..!............#
	defb 006h,0ech,058h,0c0h,080h,008h,000h,000h	; a5b9  ..X.....

; ----------------------------------------------------------------------
; DATOS rachas_A5C1: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (110 bytes)
;   0xa5c1..0xa62f  (110 bytes)
DATA_rachas_A5C1:
	defb 09eh,007h,008h,007h,018h,020h,020h,000h,000h,012h,03ch,01fh,008h,007h,00eh,007h	; a5c1  .....  ...<.....
	defb 002h,0e0h,010h,0e0h,018h,004h,004h,000h,000h,050h,038h,0c0h,038h,0f0h,020h,004h	; a5d1  .........P8.8. .
	defb 000h,081h,001h,004h,000h,088h,005h,00eh,00dh,066h,040h,000h,000h,001h,003h,000h	; a5e1  .........f@.....
	defb 081h,080h,004h,000h,088h,0a0h,070h,0b0h,06ch,004h,000h,000h,080h,006h,000h,08bh	; a5f1  ......p.l.......
	defb 001h,006h,008h,017h,018h,027h,05ah,051h,072h,099h,0adh,005h,000h,093h,080h,060h	; a601  .....'ZQr......`
	defb 010h,0e8h,018h,0e4h,05ah,08ah,04eh,092h,0aah,043h,020h,016h,018h,011h,008h,005h	; a611  ....Z.N..C .....
	defb 00fh,008h,000h,087h,0c4h,038h,046h,00ch,0d8h,0b0h,080h,009h,000h,000h	; a621  .....8F.......

; ----------------------------------------------------------------------
; DATOS rachas_A62F: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (111 bytes)
;   0xa62f..0xa69e  (111 bytes)
DATA_rachas_A62F:
	defb 0a3h,007h,008h,007h,018h,020h,020h,000h,000h,00ah,01ch,003h,01ch,00fh,004h,000h	; a62f  .....  .........
	defb 000h,0e0h,010h,0e0h,018h,004h,004h,000h,000h,048h,03ch,0f8h,010h,0e0h,070h,0e0h	; a63f  .........H<...p.
	defb 040h,000h,000h,001h,004h,000h,088h,005h,00eh,00dh,036h,020h,000h,000h,001h,003h	; a64f  @.........6 ....
	defb 000h,081h,080h,004h,000h,088h,0a0h,070h,0b0h,066h,002h,000h,000h,080h,006h,000h	; a65f  .......p.f......
	defb 08bh,001h,006h,008h,017h,018h,027h,05ah,051h,072h,049h,055h,005h,000h,092h,080h	; a66f  ......'ZQrIU....
	defb 060h,010h,0e8h,018h,0e4h,05ah,08ah,04eh,099h,0b5h,023h,01ch,062h,030h,01bh,00dh	; a67f  `....Z.N..#.b0..
	defb 001h,009h,000h,088h,0c2h,004h,068h,018h,088h,010h,0a0h,0f0h,008h,000h,000h	; a68f  ......h........

; ----------------------------------------------------------------------
; DATOS rachas_A69E: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (58 bytes)
;   0xa69e..0xa6d8  (58 bytes)
DATA_rachas_A69E:
	defb 00ah,000h,086h,018h,006h,00fh,00fh,007h,00bh,00ah,000h,086h,006h,030h,078h,0f8h	; a69e  .............0x.
	defb 0f0h,0e8h,00ch,000h,082h,038h,020h,00eh,000h,082h,00eh,008h,011h,000h,081h,038h	; a6ae  .....8 ........8
	defb 00fh,000h,089h,00eh,044h,046h,039h,010h,030h,058h,054h,03fh,008h,000h,088h,011h	; a6be  ....DF9.0XT?....
	defb 031h,04eh,084h,006h,00dh,015h,0feh,008h,000h,000h	; a6ce  1N........

; ----------------------------------------------------------------------
; DATOS rachas_A6D8: rachas a la VRAM (sprites o pantallas): [n < 0x80] repite
;   el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0 acaba; lo
;   leen p00:56BC (160 bytes)
;   0xa6d8..0xa778  (160 bytes)
DATA_rachas_A6D8:
	defb 006h,000h,083h,0ffh,07fh,03fh,00bh,000h,002h,040h,085h,07ch,07eh,07ch,040h,040h	; a6d8  .....?...@.|~|@@
	defb 006h,000h,089h,00ch,01ch,00eh,00eh,007h,007h,00ch,001h,001h,00bh,000h,08ah,0c0h	; a6e8  ................
	defb 000h,080h,0c0h,0c0h,0e0h,0e0h,070h,070h,038h,007h,000h,002h,001h,093h,00ch,007h	; a6f8  ......pp8.......
	defb 007h,00eh,00eh,01ch,00ch,000h,000h,038h,070h,070h,0e0h,0e0h,0c0h,0c0h,080h,000h	; a708  .......8pp......
	defb 0c0h,00eh,000h,083h,07fh,0ffh,07fh,006h,000h,08ah,010h,038h,038h,070h,070h,0f0h	; a718  ...........88pp.
	defb 0e0h,0e0h,0c0h,080h,008h,000h,083h,07fh,0ffh,07fh,00dh,000h,08ah,080h,0c0h,0e0h	; a728  ................
	defb 0e0h,0f0h,070h,070h,038h,038h,010h,005h,000h,093h,001h,003h,007h,00fh,00eh,00fh	; a738  ..pp88..........
	defb 007h,007h,003h,003h,001h,000h,000h,020h,070h,0f0h,0e0h,0c0h,080h,004h,000h,002h	; a748  ....... p.......
	defb 080h,003h,0c0h,004h,000h,083h,003h,00fh,00fh,003h,01fh,084h,01bh,00fh,00eh,003h	; a758  ................
	defb 006h,000h,08ah,0c0h,0f0h,050h,0d8h,0e8h,0a8h,058h,090h,070h,0c0h,003h,000h,000h	; a768  .....P...X.p....

; ----------------------------------------------------------------------
; DATOS letreros_sitios: 2 punteros: el letrero de cada minijuego escondido;
;   lo leen p00:4BA6 (4 bytes)
;   0xa778..0xa77c  (4 bytes)
DATA_letreros_sitios:
	defw 0a77ch,0a78ah	; a778  -> DATA_letrero_sitio1 DATA_letrero_sitio2

; ----------------------------------------------------------------------
; DATOS letrero_sitio1: letrero (del sitio escondido 1): [x][y] y caracteres,
;   0xFE [x][y] otro sitio, 0xFF acaba; lo leen p00:4F11 (14 bytes)
;   0xa77c..0xa78a  (14 bytes)
DATA_letrero_sitio1:
	defb 050h,050h,0edh,0f5h,0f3h,0e9h,0e3h,000h,0f3h,0f4h,0e1h,0e7h,0e5h,0ffh	; a77c  PP............

; ----------------------------------------------------------------------
; DATOS letrero_sitio2: letrero (del sitio escondido 2): [x][y] y caracteres,
;   0xFE [x][y] otro sitio, 0xFF acaba; lo leen p00:4F11 (15 bytes)
;   0xa78a..0xa799  (15 bytes)
DATA_letrero_sitio2:
	defb 048h,050h,0f0h,0f5h,0fah,0fah,0ech,0e5h,000h,0f3h,0f4h,0e1h,0e7h,0e5h,0ffh	; a78a  HP.............

; ----------------------------------------------------------------------
; DATOS resto_A799: lo apuntan con el banco puesto p00:5331 (0xA799), p00:5338
;   (0xA7BA), p00:57B2 (0xA838); el tamano es lo que hay hasta lo siguiente,
;   no sale de recorrerlo; lo leen p00:5331, p00:5338, p00:57B2 (814 bytes)
;   0xa799..0xaac7  (814 bytes)
DATA_resto_A799:
	defb 002h,048h,0c7h,0a7h,003h,058h,007h,0a8h,003h,064h,067h,0a8h,002h,07ch,0c7h,0a8h	; a799  .H...X...dg..|..
	defb 003h,084h,007h,0aah,001h,090h,007h,0a9h,007h,098h,027h,0a9h,003h,0b4h,067h,0aah	; a7a9  ..........'...g.
	defb 000h,002h,002h,048h,050h,002h,003h,064h,070h,002h,001h,090h,094h,000h,000h,01bh	; a7b9  ...HP..dp.......
	defb 03dh,006h,01bh,041h,070h,03dh,043h,09fh,0beh,030h,010h,000h,000h,003h,000h,080h	; a7c9  =..Ap=C..0......
	defb 0c0h,060h,0a0h,040h,0e0h,0d0h,0b8h,064h,09ch,078h,0f6h,0cfh,0e6h,0ech,01bh,03dh	; a7d9  .`.@...d.x.....=
	defb 006h,01bh,041h,070h,003h,03fh,07eh,060h,028h,050h,060h,020h,000h,000h,080h,0c0h	; a7e9  ..Ap.?~`(P` ....
	defb 060h,0a0h,040h,0e0h,0d0h,0b8h,074h,0ech,05ch,0b8h,0b0h,058h,00ch,0bch,003h,008h	; a7f9  `.@...t.\..X....
	defb 007h,010h,006h,030h,077h,07bh,0cch,04fh,0e7h,0cdh,01eh,01ch,00eh,03ch,0c0h,010h	; a809  ...0w{.O.....<..
	defb 0e0h,008h,060h,00ch,0eeh,0deh,033h,0f2h,0e7h,0b3h,078h,038h,070h,03ch,003h,007h	; a819  ..`...3...x8p<..
	defb 037h,02bh,02bh,02ch,017h,01bh,00ch,007h,007h,004h,003h,00fh,00eh,01eh,0e0h,0f0h	; a829  7++,............
	defb 0f0h,0e8h,0e8h,018h,0f6h,0e2h,01ah,0fch,0e0h,018h,0e8h,01ch,000h,000h,007h,00fh	; a839  ................
	defb 00fh,017h,017h,018h,06fh,047h,058h,03fh,007h,018h,017h,038h,000h,000h,0c0h,0e0h	; a849  ....oGX?...8....
	defb 0ech,0d4h,0d4h,034h,0e8h,0d8h,030h,0e0h,0e0h,020h,0c0h,0f0h,070h,078h,000h,00eh	; a859  ...4..0.. ..px..
	defb 016h,002h,003h,003h,007h,075h,015h,03ah,00bh,01dh,085h,0eeh,062h,01ah,000h,000h	; a869  .....u.:....b...
	defb 000h,030h,06dh,065h,0b5h,0bdh,0c1h,0abh,02bh,0abh,0abh,0aah,028h,020h,00fh,000h	; a879  .0me....+...( ..
	defb 00fh,009h,013h,01fh,00eh,001h,00fh,07eh,060h,042h,025h,000h,000h,003h,0f8h,07ch	; a889  .......~`B%....|
	defb 000h,07eh,000h,07fh,000h,0dch,0dch,038h,000h,0ach,0fah,090h,0f8h,0f8h,01fh,000h	; a899  .~.....8........
	defb 01eh,012h,026h,0c0h,0fch,09fh,043h,004h,003h,000h,001h,001h,001h,000h,0f0h,0f8h	; a8a9  ..&...C.........
	defb 000h,0fch,000h,0feh,000h,0b8h,038h,067h,09ch,075h,0d1h,046h,006h,00ch,007h,00fh	; a8b9  ......8g.u.F....
	defb 0d7h,098h,0afh,0b0h,04fh,070h,027h,018h,010h,024h,02eh,02eh,00eh,005h,0c0h,0e0h	; a8c9  ....Op'..$......
	defb 0d0h,030h,0e8h,018h,0e6h,002h,0cah,034h,050h,0e8h,0e8h,0e8h,050h,000h,007h,00fh	; a8d9  .0.....4P...P...
	defb 017h,018h,02fh,030h,0cfh,080h,0a7h,058h,014h,02eh,02eh,02eh,014h,001h,0c0h,0e0h	; a8e9  ../0...X........
	defb 0d6h,032h,0eah,01ah,0e4h,01ch,0c8h,030h,010h,048h,0e8h,0e8h,0e0h,040h,077h,0cdh	; a8f9  .2.....0.H...@w.
	defb 062h,088h,0ddh,0ddh,0a3h,04bh,01dh,000h,017h,03bh,054h,068h,016h,074h,0c0h,0a0h	; a909  b....K....Th.t..
	defb 060h,0a8h,0dch,0ceh,0b5h,0abh,047h,0c3h,0a5h,076h,0a8h,058h,014h,02fh,006h,00dh	; a919  `.....G..v.X./..
	defb 01bh,035h,04fh,02fh,0f6h,0bbh,0e8h,0bbh,0f6h,077h,02dh,01fh,00fh,007h,0c0h,060h	; a929  .5O/.....w-....`
	defb 0b8h,0dch,06eh,0e3h,0dch,0bfh,02fh,0bdh,0bfh,0dbh,0deh,0ech,068h,0f0h,007h,00dh	; a939  ..n.../.....h...
	defb 01fh,02eh,073h,0fch,0eeh,0fah,0beh,0f8h,0e7h,09eh,07fh,037h,01dh,00fh,0c0h,050h	; a949  ..s........7...P
	defb 0e8h,0cch,0b6h,07bh,0f5h,0beh,0edh,07bh,0b6h,0cch,0dch,0d8h,0b0h,0a0h,00fh,016h	; a959  ...{...{........
	defb 037h,07bh,0dbh,0fdh,0bdh,0f4h,0fdh,03bh,0c7h,076h,03bh,01dh,006h,003h,0e0h,0f0h	; a969  7{.......v......
	defb 0f8h,0b4h,0eeh,06fh,0ddh,017h,0ddh,06fh,0f4h,0f2h,0ach,0d8h,0b0h,060h,005h,00dh	; a979  ...o...o.....`..
	defb 01bh,03bh,033h,06dh,0deh,0b7h,07dh,0afh,0deh,06dh,033h,017h,00ah,003h,0f0h,0b8h	; a989  ..3m..}..m3.....
	defb 0ech,0feh,079h,0e7h,01fh,07dh,05fh,077h,03fh,0ceh,074h,0f8h,0b0h,0e0h,000h,000h	; a999  ..y..}_w?.t.....
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,003h,00fh,01fh,000h,000h	; a9a9  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,0c0h,0f0h,0f8h,000h,000h	; a9b9  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,006h,01fh,03fh,0feh,000h,000h	; a9c9  ............?...
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,0e0h,038h,05ch,0efh,000h,000h	; a9d9  ...........8\...
	defb 000h,000h,000h,000h,000h,000h,008h,000h,064h,061h,009h,03ch,07eh,0fch,000h,000h	; a9e9  ........da.<~...
	defb 000h,000h,000h,000h,000h,000h,010h,040h,00ch,08ch,0a0h,018h,00ch,0c7h,000h,000h	; a9f9  .......@........
	defb 000h,000h,000h,000h,000h,000h,003h,005h,00fh,00fh,007h,005h,003h,001h,000h,000h	; aa09  ................
	defb 000h,000h,000h,000h,000h,000h,000h,0c0h,0a0h,0e0h,0c0h,0e0h,040h,000h,000h,000h	; aa19  ............@...
	defb 000h,000h,003h,007h,01bh,03fh,03fh,01fh,00fh,01fh,01fh,00bh,003h,001h,000h,000h	; aa29  .....??.........
	defb 000h,000h,080h,0c0h,030h,0d8h,0d8h,0d0h,0a0h,0f0h,0f0h,0a0h,080h,000h,003h,007h	; aa39  ....0...........
	defb 037h,079h,0f7h,0ffh,0ffh,07fh,03fh,06fh,06fh,033h,00fh,005h,003h,001h,080h,0dch	; aa49  7y....?oo3......
	defb 0feh,0feh,01ch,0eeh,0efh,0efh,0dfh,0f6h,0f8h,0f8h,0f8h,0b0h,0c0h,080h,000h,000h	; aa59  ................
	defb 000h,000h,000h,001h,004h,000h,008h,000h,004h,001h,000h,000h,000h,000h,000h,000h	; aa69  ................
	defb 000h,000h,000h,000h,040h,000h,020h,000h,040h,000h,000h,000h,000h,000h,000h,000h	; aa79  ....@. .@.......
	defb 000h,001h,011h,008h,000h,000h,030h,000h,000h,008h,011h,001h,000h,000h,000h,000h	; aa89  ......0.........
	defb 000h,000h,010h,020h,000h,000h,018h,000h,000h,020h,010h,000h,000h,000h,001h,001h	; aa99  ... ..... ......
	defb 001h,021h,010h,008h,000h,000h,0f0h,000h,000h,008h,010h,021h,001h,001h,000h,000h	; aaa9  .!.........!....
	defb 000h,008h,010h,020h,000h,000h,01eh,000h,000h,020h,010h,008h,000h,000h	; aab9  ... ..... ....

; ----------------------------------------------------------------------
; DATOS rect_AAC7: 12 x 12 caracteres (p00:53D6: B filas de C); lo leen
;   p00:56FF (144 bytes)
;   0xaac7..0xab57  (144 bytes)
DATA_rect_AAC7:
	defb 001h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,004h	; aac7  ............
	defb 003h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,003h	; aad3  ............
	defb 003h,000h,000h,000h,008h,009h,00ah,00bh,00ch,000h,000h,003h	; aadf  ............
	defb 003h,000h,000h,000h,00dh,00eh,000h,00fh,010h,000h,000h,003h	; aaeb  ............
	defb 003h,000h,000h,011h,012h,000h,013h,014h,015h,000h,000h,003h	; aaf7  ............
	defb 003h,000h,000h,016h,017h,000h,018h,019h,01ah,000h,000h,003h	; ab03  ............
	defb 003h,000h,000h,01bh,01ch,01dh,01eh,01fh,020h,000h,000h,003h	; ab0f  ........ ...
	defb 003h,000h,000h,021h,022h,023h,024h,025h,026h,000h,000h,003h	; ab1b  ...!"#$%&...
	defb 003h,000h,000h,027h,028h,029h,02ah,02bh,02ch,02dh,000h,003h	; ab27  ...'()*+,-..
	defb 003h,000h,000h,02eh,02fh,030h,031h,032h,033h,034h,000h,003h	; ab33  ..../01234..
	defb 003h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,003h	; ab3f  ............
	defb 005h,006h,006h,006h,006h,006h,006h,006h,006h,006h,006h,007h	; ab4b  ............

; ----------------------------------------------------------------------
; DATOS rect_AB57: 12 x 12 caracteres (p00:53D6: B filas de C); lo leen
;   p00:56F0 (144 bytes)
;   0xab57..0xabe7  (144 bytes)
DATA_rect_AB57:
	defb 001h,003h,003h,003h,003h,003h,003h,003h,003h,003h,003h,004h	; ab57  ............
	defb 002h,000h,000h,000h,000h,009h,000h,000h,000h,000h,000h,005h	; ab63  ............
	defb 002h,000h,000h,000h,00ah,00bh,00ch,042h,000h,000h,000h,005h	; ab6f  .......B....
	defb 002h,000h,000h,000h,031h,00dh,031h,00eh,00fh,010h,000h,005h	; ab7b  ....1.1.....
	defb 002h,014h,00ch,043h,011h,000h,012h,013h,023h,000h,01bh,005h	; ab87  ...C....#...
	defb 002h,015h,016h,017h,018h,01dh,000h,031h,01ah,02ch,01ch,005h	; ab93  .......1.,..
	defb 002h,025h,023h,024h,022h,03eh,046h,021h,000h,01eh,01dh,005h	; ab9f  .%#$">F!....
	defb 002h,026h,027h,028h,029h,044h,045h,020h,01fh,03fh,01dh,005h	; abab  .&'()DE .?..
	defb 002h,000h,02ah,02bh,02ch,02dh,000h,02fh,030h,031h,032h,005h	; abb7  ..*+,-./012.
	defb 002h,000h,041h,023h,013h,02eh,023h,01eh,01eh,033h,034h,005h	; abc3  ..A#..#..34.
	defb 002h,03ch,03bh,03ah,039h,038h,013h,040h,035h,036h,037h,005h	; abcf  .<.:98.@567.
	defb 006h,008h,008h,008h,008h,008h,008h,008h,008h,008h,008h,007h	; abdb  ............

; ----------------------------------------------------------------------
; DATOS columnas_23: 48 punteros a columnas de 23 caracteres (32 seguidas
;   desde la que se pide); lo leen p00:5769 (96 bytes)
;   0xabe7..0xac47  (96 bytes)
DATA_columnas_23:
	defw 0ac47h,0ac5fh,0ac77h,0ac8fh,0aca7h,0acbfh,0acd7h,0acefh	; abe7
	defw 0ad07h,0ad1fh,0ad37h,0ad4fh,0ad67h,0ad7fh,0ad97h,0adafh	; abf7
	defw 0adc7h,0addfh,0adf7h,0ae0fh,0ae27h,0ae3fh,0ae57h,0ae6fh	; ac07
	defw 0ae87h,0ae9fh,0aeb7h,0aecfh,0aee7h,0aeffh,0af17h,0af2fh	; ac17
	defw 0af47h,0af5fh,0af77h,0af8fh,0afa7h,0afbfh,0afd7h,0afefh	; ac27
	defw 0b007h,0b01fh,0b037h,0b04fh,0b067h,0b07fh,0b097h,0b0afh	; ac37

; ----------------------------------------------------------------------
; DATOS col23_00: columna de 23 caracteres en 24 bytes (el ultimo no lo lee
;   nadie: p00:5772 pide 0x17 filas); lo leen p00:53D9 (24 bytes)
;   0xac47..0xac5f  (24 bytes)
DATA_col23_00:
	defb 095h,060h,070h,081h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,076h,068h,078h,058h,080h,090h,093h	; ac47  .`p..............vhxX...

; ----------------------------------------------------------------------
; DATOS col23_01: columna de 23 caracteres en 24 bytes (el ultimo no lo lee
;   nadie: p00:5772 pide 0x17 filas); lo leen p00:53D9 (24 bytes)
;   0xac5f..0xac77  (24 bytes)
DATA_col23_01:
	defb 0a9h,061h,071h,082h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,079h,076h,067h,077h,059h,080h,083h,093h	; ac5f  .aq.............yvgwY...

; ----------------------------------------------------------------------
; DATOS col23_02: columna de 23 caracteres en 24 bytes (el ultimo no lo lee
;   nadie: p00:5772 pide 0x17 filas); lo leen p00:53D9 (24 bytes)
;   0xac77..0xac8f  (24 bytes)
DATA_col23_02:
	defb 0aah,062h,072h,082h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,079h,079h,076h,068h,078h,058h,080h,090h,093h	; ac77  .br............yyvhxX...

; ----------------------------------------------------------------------
; DATOS col23_03: columna de 23 caracteres en 24 bytes (el ultimo no lo lee
;   nadie: p00:5772 pide 0x17 filas); lo leen p00:53D9 (24 bytes)
;   0xac8f..0xaca7  (24 bytes)
DATA_col23_03:
	defb 0abh,063h,073h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,079h,079h,000h,076h,067h,077h,059h,080h,083h,093h	; ac8f  .cs...........yy.vgwY...

; ----------------------------------------------------------------------
; DATOS col23_04: columna de 23 caracteres en 24 bytes (el ultimo no lo lee
;   nadie: p00:5772 pide 0x17 filas); lo leen p00:53D9 (24 bytes)
;   0xaca7..0xacbf  (24 bytes)
DATA_col23_04:
	defb 0ach,064h,074h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,079h,079h,076h,068h,078h,058h,080h,090h,093h	; aca7  .dt............yyvhxX...

; ----------------------------------------------------------------------
; DATOS col23_05: columna de 23 caracteres en 24 bytes (el ultimo no lo lee
;   nadie: p00:5772 pide 0x17 filas); lo leen p00:53D9 (24 bytes)
;   0xacbf..0xacd7  (24 bytes)
DATA_col23_05:
	defb 0adh,065h,075h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,079h,000h,076h,067h,077h,059h,080h,083h,093h	; acbf  .eu............y.vgwY...

; ----------------------------------------------------------------------
; DATOS col23_06: columna de 23 caracteres en 24 bytes (el ultimo no lo lee
;   nadie: p00:5772 pide 0x17 filas); lo leen p00:53D9 (24 bytes)
;   0xacd7..0xacef  (24 bytes)
DATA_col23_06:
	defb 0aeh,066h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,076h,068h,078h,058h,080h,090h,093h	; acd7  .f...............vhxX...

; ----------------------------------------------------------------------
; DATOS col23_07: columna de 23 caracteres en 24 bytes (el ultimo no lo lee
;   nadie: p00:5772 pide 0x17 filas); lo leen p00:53D9 (24 bytes)
;   0xacef..0xad07  (24 bytes)
DATA_col23_07:
	defb 0afh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,076h,067h,077h,059h,080h,083h,093h	; acef  .................vgwY...

; ----------------------------------------------------------------------
; DATOS col23_08: columna de 23 caracteres en 24 bytes (el ultimo no lo lee
;   nadie: p00:5772 pide 0x17 filas); lo leen p00:53D9 (24 bytes)
;   0xad07..0xad1f  (24 bytes)
DATA_col23_08:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,076h,068h,078h,058h,080h,090h,093h	; ad07  .................vhxX...

; ----------------------------------------------------------------------
; DATOS col23_09: columna de 23 caracteres en 24 bytes (el ultimo no lo lee
;   nadie: p00:5772 pide 0x17 filas); lo leen p00:53D9 (24 bytes)
;   0xad1f..0xad37  (24 bytes)
DATA_col23_09:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,076h,067h,077h,059h,080h,083h,093h	; ad1f  .................vgwY...

; ----------------------------------------------------------------------
; DATOS col23_10: columna de 23 caracteres en 24 bytes (el ultimo no lo lee
;   nadie: p00:5772 pide 0x17 filas); lo leen p00:53D9 (24 bytes)
;   0xad37..0xad4f  (24 bytes)
DATA_col23_10:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,085h,079h,076h,068h,078h,058h,080h,090h,093h	; ad37  ................yvhxX...

; ----------------------------------------------------------------------
; DATOS col23_11: columna de 23 caracteres en 24 bytes (el ultimo no lo lee
;   nadie: p00:5772 pide 0x17 filas); lo leen p00:53D9 (24 bytes)
;   0xad4f..0xad67  (24 bytes)
DATA_col23_11:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,079h,079h,076h,067h,077h,059h,080h,083h,093h	; ad4f  ...............yyvgwY...

; ----------------------------------------------------------------------
; DATOS col23_12: columna de 23 caracteres en 24 bytes (el ultimo no lo lee
;   nadie: p00:5772 pide 0x17 filas); lo leen p00:53D9 (24 bytes)
;   0xad67..0xad7f  (24 bytes)
DATA_col23_12:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,079h,000h,000h,076h,068h,078h,058h,080h,090h,093h	; ad67  ..............y..vhxX...

; ----------------------------------------------------------------------
; DATOS col23_13: columna de 23 caracteres en 24 bytes (el ultimo no lo lee
;   nadie: p00:5772 pide 0x17 filas); lo leen p00:53D9 (24 bytes)
;   0xad7f..0xad97  (24 bytes)
DATA_col23_13:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,091h,079h,079h,000h,076h,067h,077h,059h,080h,083h,093h	; ad7f  ..............yy.vgwY...

; ----------------------------------------------------------------------
; DATOS col23_14: columna de 23 caracteres en 24 bytes (el ultimo no lo lee
;   nadie: p00:5772 pide 0x17 filas); lo leen p00:53D9 (24 bytes)
;   0xad97..0xadaf  (24 bytes)
DATA_col23_14:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,06bh,000h,000h,000h,076h,068h,078h,058h,080h,090h,093h	; ad97  .............k...vhxX...

; ----------------------------------------------------------------------
; DATOS col23_15: columna de 23 caracteres en 24 bytes (el ultimo no lo lee
;   nadie: p00:5772 pide 0x17 filas); lo leen p00:53D9 (24 bytes)
;   0xadaf..0xadc7  (24 bytes)
DATA_col23_15:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,076h,067h,077h,059h,080h,083h,093h	; adaf  .................vgwY...

; ----------------------------------------------------------------------
; DATOS col23_16: columna de 23 caracteres en 24 bytes (el ultimo no lo lee
;   nadie: p00:5772 pide 0x17 filas); lo leen p00:53D9 (24 bytes)
;   0xadc7..0xaddf  (24 bytes)
DATA_col23_16:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,076h,068h,078h,058h,080h,090h,093h	; adc7  .................vhxX...

; ----------------------------------------------------------------------
; DATOS col23_17: columna de 23 caracteres en 24 bytes (el ultimo no lo lee
;   nadie: p00:5772 pide 0x17 filas); lo leen p00:53D9 (24 bytes)
;   0xaddf..0xadf7  (24 bytes)
DATA_col23_17:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,076h,067h,077h,059h,080h,083h,093h	; addf  .................vgwY...

; ----------------------------------------------------------------------
; DATOS col23_18: columna de 23 caracteres en 24 bytes (el ultimo no lo lee
;   nadie: p00:5772 pide 0x17 filas); lo leen p00:53D9 (24 bytes)
;   0xadf7..0xae0f  (24 bytes)
DATA_col23_18:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,079h,076h,068h,078h,080h,080h,090h,093h	; adf7  ................yvhx....

; ----------------------------------------------------------------------
; DATOS col23_19: columna de 23 caracteres en 24 bytes (el ultimo no lo lee
;   nadie: p00:5772 pide 0x17 filas); lo leen p00:53D9 (24 bytes)
;   0xae0f..0xae27  (24 bytes)
DATA_col23_19:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,05eh,000h,076h,067h,077h,080h,080h,083h,093h	; ae0f  ...............^.vgw....

; ----------------------------------------------------------------------
; DATOS col23_20: columna de 23 caracteres en 24 bytes (el ultimo no lo lee
;   nadie: p00:5772 pide 0x17 filas); lo leen p00:53D9 (24 bytes)
;   0xae27..0xae3f  (24 bytes)
DATA_col23_20:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,091h,079h,000h,076h,068h,078h,080h,080h,090h,093h	; ae27  ...............y.vhx....

; ----------------------------------------------------------------------
; DATOS col23_21: columna de 23 caracteres en 24 bytes (el ultimo no lo lee
;   nadie: p00:5772 pide 0x17 filas); lo leen p00:53D9 (24 bytes)
;   0xae3f..0xae57  (24 bytes)
DATA_col23_21:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,06bh,079h,000h,086h,089h,08ch,080h,080h,083h,093h	; ae3f  ..............ky........

; ----------------------------------------------------------------------
; DATOS col23_22: columna de 23 caracteres en 24 bytes (el ultimo no lo lee
;   nadie: p00:5772 pide 0x17 filas); lo leen p00:53D9 (24 bytes)
;   0xae57..0xae6f  (24 bytes)
DATA_col23_22:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,086h,089h,08ch,087h,05ch,08dh,080h,080h,090h,093h	; ae57  ..................\.....

; ----------------------------------------------------------------------
; DATOS col23_23: columna de 23 caracteres en 24 bytes (el ultimo no lo lee
;   nadie: p00:5772 pide 0x17 filas); lo leen p00:53D9 (24 bytes)
;   0xae6f..0xae87  (24 bytes)
DATA_col23_23:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,087h,05ch,08dh,088h,08bh,08eh,080h,080h,083h,093h	; ae6f  ...............\........

; ----------------------------------------------------------------------
; DATOS col23_24: columna de 23 caracteres en 24 bytes (el ultimo no lo lee
;   nadie: p00:5772 pide 0x17 filas); lo leen p00:53D9 (24 bytes)
;   0xae87..0xae9f  (24 bytes)
DATA_col23_24:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,086h,089h,088h,08bh,08eh,086h,089h,08ch,080h,080h,090h,093h	; ae87  ........................

; ----------------------------------------------------------------------
; DATOS col23_25: columna de 23 caracteres en 24 bytes (el ultimo no lo lee
;   nadie: p00:5772 pide 0x17 filas); lo leen p00:53D9 (24 bytes)
;   0xae9f..0xaeb7  (24 bytes)
DATA_col23_25:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,086h,089h,087h,086h,089h,086h,089h,08ch,07ch,08dh,080h,080h,083h,093h	; ae9f  ..................|.....

; ----------------------------------------------------------------------
; DATOS col23_26: columna de 23 caracteres en 24 bytes (el ultimo no lo lee
;   nadie: p00:5772 pide 0x17 filas); lo leen p00:53D9 (24 bytes)
;   0xaeb7..0xaecf  (24 bytes)
DATA_col23_26:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,086h,089h,087h,086h,089h,08ch,06ch,087h,05ch,08dh,07dh,08eh,080h,080h,090h,093h	; aeb7  ..............l.\.}.....

; ----------------------------------------------------------------------
; DATOS col23_27: columna de 23 caracteres en 24 bytes (el ultimo no lo lee
;   nadie: p00:5772 pide 0x17 filas); lo leen p00:53D9 (24 bytes)
;   0xaecf..0xaee7  (24 bytes)
DATA_col23_27:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,087h,086h,088h,087h,05ch,08dh,07dh,088h,08bh,08eh,07eh,08ch,080h,080h,083h,093h	; aecf  ............\.}...~.....

; ----------------------------------------------------------------------
; DATOS col23_28: columna de 23 caracteres en 24 bytes (el ultimo no lo lee
;   nadie: p00:5772 pide 0x17 filas); lo leen p00:53D9 (24 bytes)
;   0xaee7..0xaeff  (24 bytes)
DATA_col23_28:
	defb 000h,000h,000h,000h,000h,000h,05bh,069h,088h,087h,086h,088h,08bh,08eh,07eh,06fh,07fh,07ah,05fh,08dh,080h,080h,090h,093h	; aee7  ......[i......~o.z_.....

; ----------------------------------------------------------------------
; DATOS col23_29: columna de 23 caracteres en 24 bytes (el ultimo no lo lee
;   nadie: p00:5772 pide 0x17 filas); lo leen p00:53D9 (24 bytes)
;   0xaeff..0xaf17  (24 bytes)
DATA_col23_29:
	defb 000h,000h,000h,000h,000h,05bh,069h,08ah,08ah,088h,087h,086h,089h,08ch,07ch,07bh,08dh,088h,08bh,08eh,080h,080h,083h,093h	; aeff  .....[i.......|{........

; ----------------------------------------------------------------------
; DATOS col23_30: columna de 23 caracteres en 24 bytes (el ultimo no lo lee
;   nadie: p00:5772 pide 0x17 filas); lo leen p00:53D9 (24 bytes)
;   0xaf17..0xaf2f  (24 bytes)
DATA_col23_30:
	defb 000h,000h,000h,000h,05bh,069h,08ah,08ah,086h,089h,088h,087h,05ch,08dh,07dh,08bh,06dh,06ah,06ah,06ah,080h,080h,090h,093h	; af17  ....[i......\.}.mjjj....

; ----------------------------------------------------------------------
; DATOS col23_31: columna de 23 caracteres en 24 bytes (el ultimo no lo lee
;   nadie: p00:5772 pide 0x17 filas); lo leen p00:53D9 (24 bytes)
;   0xaf2f..0xaf47  (24 bytes)
DATA_col23_31:
	defb 000h,000h,000h,000h,000h,000h,05bh,069h,087h,05ch,086h,088h,08bh,08eh,07eh,089h,06eh,000h,000h,000h,080h,080h,083h,093h	; af2f  ......[i.\....~.n.......

; ----------------------------------------------------------------------
; DATOS col23_32: columna de 23 caracteres en 24 bytes (el ultimo no lo lee
;   nadie: p00:5772 pide 0x17 filas); lo leen p00:53D9 (24 bytes)
;   0xaf47..0xaf5f  (24 bytes)
DATA_col23_32:
	defb 000h,000h,000h,05bh,069h,08ah,08ah,086h,089h,08ch,096h,0a2h,0a5h,086h,089h,08ch,06eh,000h,000h,000h,080h,080h,090h,093h	; af47  ...[i...........n.......

; ----------------------------------------------------------------------
; DATOS col23_33: columna de 23 caracteres en 24 bytes (el ultimo no lo lee
;   nadie: p00:5772 pide 0x17 filas); lo leen p00:53D9 (24 bytes)
;   0xaf5f..0xaf77  (24 bytes)
DATA_col23_33:
	defb 000h,000h,000h,000h,000h,05bh,069h,087h,05ch,08dh,07dh,08bh,08eh,087h,05ch,08dh,09dh,09fh,09fh,09fh,080h,080h,083h,093h	; af5f  .....[i.\.}...\.........

; ----------------------------------------------------------------------
; DATOS col23_34: columna de 23 caracteres en 24 bytes (el ultimo no lo lee
;   nadie: p00:5772 pide 0x17 filas); lo leen p00:53D9 (24 bytes)
;   0xaf77..0xaf8f  (24 bytes)
DATA_col23_34:
	defb 000h,000h,000h,000h,000h,000h,05bh,088h,08bh,08eh,07eh,086h,089h,088h,08bh,08eh,09eh,086h,089h,08ch,080h,080h,090h,093h	; af77  ......[...~.............

; ----------------------------------------------------------------------
; DATOS col23_35: columna de 23 caracteres en 24 bytes (el ultimo no lo lee
;   nadie: p00:5772 pide 0x17 filas); lo leen p00:53D9 (24 bytes)
;   0xaf8f..0xafa7  (24 bytes)
DATA_col23_35:
	defb 000h,000h,000h,000h,05bh,069h,08ah,08ah,0a0h,0a3h,0a4h,087h,05ch,08dh,07ah,09bh,09ch,087h,05ch,08dh,080h,080h,083h,093h	; af8f  ....[i......\.z...\.....

; ----------------------------------------------------------------------
; DATOS col23_36: columna de 23 caracteres en 24 bytes (el ultimo no lo lee
;   nadie: p00:5772 pide 0x17 filas); lo leen p00:53D9 (24 bytes)
;   0xafa7..0xafbf  (24 bytes)
DATA_col23_36:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,087h,0a2h,086h,088h,08bh,08eh,086h,089h,08ch,088h,08bh,08eh,080h,080h,090h,093h	; afa7  ........................

; ----------------------------------------------------------------------
; DATOS col23_37: columna de 23 caracteres en 24 bytes (el ultimo no lo lee
;   nadie: p00:5772 pide 0x17 filas); lo leen p00:53D9 (24 bytes)
;   0xafbf..0xafd7  (24 bytes)
DATA_col23_37:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,088h,08bh,087h,0a2h,098h,0a8h,087h,05ch,08dh,086h,089h,08ch,080h,080h,083h,093h	; afbf  ...............\........

; ----------------------------------------------------------------------
; DATOS col23_38: columna de 23 caracteres en 24 bytes (el ultimo no lo lee
;   nadie: p00:5772 pide 0x17 filas); lo leen p00:53D9 (24 bytes)
;   0xafd7..0xafef  (24 bytes)
DATA_col23_38:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,088h,08bh,087h,05ch,088h,08bh,08eh,087h,05ch,08dh,080h,080h,090h,093h	; afd7  .............\....\.....

; ----------------------------------------------------------------------
; DATOS col23_39: columna de 23 caracteres en 24 bytes (el ultimo no lo lee
;   nadie: p00:5772 pide 0x17 filas); lo leen p00:53D9 (24 bytes)
;   0xafef..0xb007  (24 bytes)
DATA_col23_39:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,088h,08bh,097h,07ah,09bh,088h,08bh,08eh,080h,080h,083h,093h	; afef  ...............z........

; ----------------------------------------------------------------------
; DATOS col23_40: columna de 23 caracteres en 24 bytes (el ultimo no lo lee
;   nadie: p00:5772 pide 0x17 filas); lo leen p00:53D9 (24 bytes)
;   0xb007..0xb01f  (24 bytes)
DATA_col23_40:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,088h,08bh,086h,089h,08ch,080h,080h,090h,093h	; b007  ........................

; ----------------------------------------------------------------------
; DATOS col23_41: columna de 23 caracteres en 24 bytes (el ultimo no lo lee
;   nadie: p00:5772 pide 0x17 filas); lo leen p00:53D9 (24 bytes)
;   0xb01f..0xb037  (24 bytes)
DATA_col23_41:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,0a7h,087h,05ch,08dh,080h,080h,083h,093h	; b01f  ..................\.....

; ----------------------------------------------------------------------
; DATOS col23_42: columna de 23 caracteres en 24 bytes (el ultimo no lo lee
;   nadie: p00:5772 pide 0x17 filas); lo leen p00:53D9 (24 bytes)
;   0xb037..0xb04f  (24 bytes)
DATA_col23_42:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,079h,079h,088h,08bh,08eh,080h,080h,090h,093h	; b037  ...............yy.......

; ----------------------------------------------------------------------
; DATOS col23_43: columna de 23 caracteres en 24 bytes (el ultimo no lo lee
;   nadie: p00:5772 pide 0x17 filas); lo leen p00:53D9 (24 bytes)
;   0xb04f..0xb067  (24 bytes)
DATA_col23_43:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,091h,079h,079h,076h,067h,077h,080h,080h,083h,093h	; b04f  ...............yyvgw....

; ----------------------------------------------------------------------
; DATOS col23_44: columna de 23 caracteres en 24 bytes (el ultimo no lo lee
;   nadie: p00:5772 pide 0x17 filas); lo leen p00:53D9 (24 bytes)
;   0xb067..0xb07f  (24 bytes)
DATA_col23_44:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,076h,068h,078h,080h,080h,090h,093h	; b067  .................vhx....

; ----------------------------------------------------------------------
; DATOS col23_45: columna de 23 caracteres en 24 bytes (el ultimo no lo lee
;   nadie: p00:5772 pide 0x17 filas); lo leen p00:53D9 (24 bytes)
;   0xb07f..0xb097  (24 bytes)
DATA_col23_45:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,079h,000h,000h,076h,067h,077h,080h,080h,083h,093h	; b07f  ..............y..vgw....

; ----------------------------------------------------------------------
; DATOS col23_46: columna de 23 caracteres en 24 bytes (el ultimo no lo lee
;   nadie: p00:5772 pide 0x17 filas); lo leen p00:53D9 (24 bytes)
;   0xb097..0xb0af  (24 bytes)
DATA_col23_46:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,076h,068h,078h,058h,080h,090h,093h	; b097  .................vhxX...

; ----------------------------------------------------------------------
; DATOS col23_47: columna de 23 caracteres en 24 bytes (el ultimo no lo lee
;   nadie: p00:5772 pide 0x17 filas); lo leen p00:53D9 (24 bytes)
;   0xb0af..0xb0c7  (24 bytes)
DATA_col23_47:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,076h,067h,077h,059h,080h,083h,093h	; b0af  .................vgwY...

; ----------------------------------------------------------------------
; DATOS rect_B0C7: 7 x 3 caracteres (p00:53D6: B filas de C); lo leen p00:5719
;   (21 bytes)
;   0xb0c7..0xb0dc  (21 bytes)
DATA_rect_B0C7:
	defb 002h,003h,009h	; b0c7
	defb 001h,046h,00dh	; b0ca
	defb 019h,01eh,01dh	; b0cd
	defb 015h,020h,00eh	; b0d0
	defb 018h,01ah,00ah	; b0d3
	defb 00fh,01fh,029h	; b0d6
	defb 025h,01ch,02ah	; b0d9

; ----------------------------------------------------------------------
; DATOS rect_B0DC: 12 x 12 caracteres (p00:53D6: B filas de C); lo leen
;   p00:5711 (144 bytes)
;   0xb0dc..0xb16c  (144 bytes)
DATA_rect_B0DC:
	defb 00ch,037h,037h,037h,037h,037h,037h,037h,037h,037h,037h,00bh	; b0dc  .7777777777.
	defb 010h,040h,040h,040h,040h,040h,040h,040h,040h,040h,040h,01bh	; b0e8  .@@@@@@@@@@.
	defb 010h,03ch,03dh,03dh,03dh,02bh,040h,03bh,03fh,034h,040h,01bh	; b0f4  .<===+@.?4@.
	defb 010h,03eh,000h,000h,000h,033h,040h,002h,003h,026h,040h,01bh	; b100  .>...3@..&@.
	defb 010h,03eh,000h,000h,000h,033h,02eh,012h,01eh,021h,02dh,01bh	; b10c  .>...3...!-.
	defb 010h,036h,039h,03ah,03ah,038h,030h,004h,01eh,027h,02ch,01bh	; b118  .69::80..',.
	defb 010h,03ch,03dh,03dh,03dh,02bh,032h,014h,047h,022h,031h,01bh	; b124  .<===+2.G"1.
	defb 010h,03eh,000h,000h,000h,033h,035h,006h,007h,028h,02fh,01bh	; b130  .>...35..(/.
	defb 010h,03eh,000h,000h,000h,033h,040h,016h,017h,023h,040h,01bh	; b13c  .>...3@..#@.
	defb 010h,036h,039h,03ah,03ah,038h,040h,025h,01ch,02ah,040h,01bh	; b148  .69::8@%.*@.
	defb 010h,040h,040h,040h,040h,040h,040h,040h,040h,040h,040h,01bh	; b154  .@@@@@@@@@@.
	defb 013h,011h,011h,011h,011h,011h,011h,011h,011h,011h,011h,024h	; b160  ...........$

; ----------------------------------------------------------------------
; DATOS rect_B16C: 2 x 3 caracteres (p00:53D6: B filas de C); lo leen p00:572C
;   (6 bytes)
;   0xb16c..0xb172  (6 bytes)
DATA_rect_B16C:
	defb 045h,04ah,04ah	; b16c
	defb 04ah,04ah,04ah	; b16f

; ----------------------------------------------------------------------
; DATOS rect_B172: 2 x 3 caracteres (p00:53D6: B filas de C); lo leen p00:5731
;   (6 bytes)
;   0xb172..0xb178  (6 bytes)
DATA_rect_B172:
	defb 048h,049h,049h	; b172
	defb 049h,049h,049h	; b175

; ----------------------------------------------------------------------
; DATOS rect_B178: 2 x 3 caracteres (p00:53D6: B filas de C); lo leen p00:5744
;   (6 bytes)
;   0xb178..0xb17e  (6 bytes)
DATA_rect_B178:
	defb 043h,044h,044h	; b178
	defb 044h,044h,044h	; b17b

; ----------------------------------------------------------------------
; DATOS rect_B17E: 2 x 3 caracteres (p00:53D6: B filas de C); lo leen p00:5749
;   (6 bytes)
;   0xb17e..0xb184  (6 bytes)
DATA_rect_B17E:
	defb 041h,042h,042h	; b17e
	defb 042h,042h,042h	; b181

; ----------------------------------------------------------------------
; DATOS rect_B184: 16 x 12 caracteres (p00:53D6: B filas de C); lo leen
;   p00:5785 (192 bytes)
;   0xb184..0xb244  (192 bytes)
DATA_rect_B184:
	defb 049h,080h,0b6h,0b8h,0b8h,0b8h,0b8h,0b8h,0b8h,0b9h,07eh,060h	; b184  I.........~`
	defb 062h,06fh,063h,086h,07bh,07bh,07bh,07bh,082h,06dh,06fh,067h	; b190  boc.{{{{.mog
	defb 062h,06fh,05fh,0b1h,06ah,05eh,05eh,06ch,0aah,06eh,06fh,067h	; b19c  bo_.j^^l.nog
	defb 062h,06fh,05fh,0b1h,069h,000h,000h,06bh,0aah,06eh,06fh,067h	; b1a8  bo_.i..k.nog
	defb 062h,06fh,05fh,0b1h,069h,000h,000h,06bh,0aah,06eh,06fh,067h	; b1b4  bo_.i..k.nog
	defb 062h,06fh,05fh,0b1h,069h,000h,000h,06bh,0aah,06eh,06fh,067h	; b1c0  bo_.i..k.nog
	defb 062h,06fh,05fh,0b1h,069h,000h,000h,06bh,0aah,06eh,06fh,067h	; b1cc  bo_.i..k.nog
	defb 062h,06fh,05fh,0b1h,069h,000h,000h,06bh,0aah,06eh,06fh,067h	; b1d8  bo_.i..k.nog
	defb 062h,06fh,05fh,0b1h,069h,000h,000h,06bh,0aah,06eh,06fh,067h	; b1e4  bo_.i..k.nog
	defb 062h,06fh,05fh,0b1h,069h,000h,000h,06bh,0aah,06eh,06fh,067h	; b1f0  bo_.i..k.nog
	defb 062h,06fh,05fh,0b1h,069h,000h,000h,06bh,0aah,06eh,06fh,067h	; b1fc  bo_.i..k.nog
	defb 062h,06fh,05fh,0b1h,069h,000h,000h,06bh,0aah,06eh,06fh,067h	; b208  bo_.i..k.nog
	defb 062h,06fh,05fh,0b1h,069h,000h,000h,06bh,0aah,06eh,06fh,067h	; b214  bo_.i..k.nog
	defb 062h,06fh,05fh,0b1h,089h,0a9h,09ah,08ch,0aah,06eh,06fh,067h	; b220  bo_......nog
	defb 062h,06fh,095h,09ch,0a8h,091h,0a8h,0a8h,0a0h,051h,06fh,067h	; b22c  bo.......Qog
	defb 087h,09ch,0a8h,0a3h,0a3h,0a8h,0a8h,0a8h,0a6h,0aeh,0a0h,085h	; b238  ............

; ----------------------------------------------------------------------
; DATOS rect_B244: 16 x 12 caracteres (p00:53D6: B filas de C); lo leen
;   p00:578B (192 bytes)
;   0xb244..0xb304  (192 bytes)
DATA_rect_B244:
	defb 065h,0b4h,0b5h,0b5h,0b5h,0b5h,0b5h,0b5h,0b5h,0b5h,0b7h,064h	; b244  e..........d
	defb 0ach,068h,0bah,0b3h,0b3h,0b3h,0b3h,0b3h,0bdh,0bch,071h,0abh	; b250  .h........q.
	defb 0ach,068h,0b2h,074h,052h,073h,073h,050h,072h,0b0h,071h,0abh	; b25c  .h.tRssPr.q.
	defb 0ach,068h,0b2h,074h,075h,000h,000h,070h,072h,0b0h,071h,0abh	; b268  .h.tu..pr.q.
	defb 0ach,068h,0b2h,074h,075h,000h,000h,070h,072h,0b0h,071h,0abh	; b274  .h.tu..pr.q.
	defb 0ach,068h,0b2h,074h,075h,000h,000h,070h,072h,0b0h,071h,0abh	; b280  .h.tu..pr.q.
	defb 0ach,068h,0b2h,074h,075h,000h,000h,070h,072h,0b0h,071h,0abh	; b28c  .h.tu..pr.q.
	defb 0ach,068h,0b2h,074h,075h,000h,000h,070h,072h,0b0h,071h,0abh	; b298  .h.tu..pr.q.
	defb 0ach,068h,0b2h,074h,075h,000h,000h,070h,072h,0b0h,071h,0abh	; b2a4  .h.tu..pr.q.
	defb 0ach,068h,0b2h,074h,075h,000h,000h,070h,072h,0b0h,071h,0abh	; b2b0  .h.tu..pr.q.
	defb 0ach,068h,0b2h,074h,075h,000h,000h,070h,072h,0b0h,071h,0abh	; b2bc  .h.tu..pr.q.
	defb 0ach,068h,0b2h,074h,075h,000h,000h,070h,072h,0b0h,071h,0abh	; b2c8  .h.tu..pr.q.
	defb 0ach,068h,0b2h,074h,075h,000h,000h,070h,072h,0b0h,071h,0abh	; b2d4  .h.tu..pr.q.
	defb 0ach,068h,0b2h,074h,047h,07ch,076h,048h,072h,0b0h,071h,0abh	; b2e0  .h.tG|vHr.q.
	defb 0ach,068h,07dh,08bh,0a7h,0a8h,0a4h,0a2h,092h,088h,071h,0abh	; b2ec  .h}.......q.
	defb 08ah,077h,098h,09dh,0a8h,0a8h,0a2h,0a8h,0a2h,09fh,08dh,078h	; b2f8  .w.........x

; ----------------------------------------------------------------------
; DATOS rect_B304: 12 x 2 caracteres (p00:53D6: B filas de C); lo leen
;   p00:579D (24 bytes)
;   0xb304..0xb31c  (24 bytes)
DATA_rect_B304:
	defb 094h,059h	; b304
	defb 05ah,05ch	; b306
	defb 05ah,05ch	; b308
	defb 05ah,05ch	; b30a
	defb 05ah,05ch	; b30c
	defb 05ah,05ch	; b30e
	defb 05ah,05ch	; b310
	defb 0c4h,0c1h	; b312
	defb 0c8h,0c6h	; b314
	defb 0c8h,0c6h	; b316
	defb 0c8h,0c6h	; b318
	defb 0beh,0beh	; b31a

; ----------------------------------------------------------------------
; DATOS rect_B31C: 12 x 4 caracteres (p00:53D6: B filas de C); lo leen
;   p00:57AF (48 bytes)
;   0xb31c..0xb34c  (48 bytes)
DATA_rect_B31C:
	defb 083h,07ah,07ah,05dh	; b31c
	defb 05bh,06fh,06fh,05ch	; b320
	defb 05bh,06fh,06fh,05ch	; b324
	defb 05bh,06fh,06fh,05ch	; b328
	defb 05bh,06fh,06fh,05ch	; b32c
	defb 05bh,06fh,06fh,05ch	; b330
	defb 05bh,06fh,06fh,05ch	; b334
	defb 0c4h,0c0h,0c0h,0c1h	; b338
	defb 0c8h,0cdh,0cdh,0c6h	; b33c
	defb 0c8h,0cdh,0cdh,0c6h	; b340
	defb 0c8h,0cdh,0cdh,0c6h	; b344
	defb 0cch,0cbh,0cbh,0cah	; b348

; ----------------------------------------------------------------------
; DATOS rect_B34C: 14 x 6 caracteres (p00:53D6: B filas de C); lo leen
;   p00:57C1 (84 bytes)
;   0xb34c..0xb3a0  (84 bytes)
DATA_rect_B34C:
	defb 08eh,08fh,08fh,08fh,08fh,081h	; b34c
	defb 061h,06fh,06fh,06fh,06fh,05ch	; b352
	defb 061h,06fh,06fh,06fh,06fh,05ch	; b358
	defb 061h,06fh,06fh,06fh,06fh,05ch	; b35e
	defb 061h,06fh,06fh,06fh,06fh,05ch	; b364
	defb 061h,06fh,06fh,06fh,06fh,05ch	; b36a
	defb 061h,06fh,06fh,06fh,06fh,05ch	; b370
	defb 061h,06fh,06fh,06fh,06fh,05ch	; b376
	defb 0c2h,0c3h,0c3h,0c3h,0c3h,0c5h	; b37c
	defb 0c9h,0cdh,0cdh,0cdh,0cdh,0c7h	; b382
	defb 0c9h,0cdh,0cdh,0cdh,0cdh,0c7h	; b388
	defb 0c9h,0cdh,0cdh,0cdh,0cdh,0c7h	; b38e
	defb 0c9h,0cdh,0cdh,0cdh,0cdh,0c7h	; b394
	defb 0bfh,0bfh,0bfh,0bfh,0bfh,0bfh	; b39a

; ----------------------------------------------------------------------
; DATOS rect_B3A0: 6 x 6 caracteres (p00:53D6: B filas de C); lo leen p00:57D8
;   (36 bytes)
;   0xb3a0..0xb3c4  (36 bytes)
DATA_rect_B3A0:
	defb 0c2h,0c3h,0c3h,0c3h,0c3h,0c5h	; b3a0
	defb 0c9h,0cdh,0cdh,0cdh,0cdh,0c7h	; b3a6
	defb 0c9h,0cdh,0cdh,0cdh,0cdh,0c7h	; b3ac
	defb 0c9h,0cdh,0cdh,0cdh,0cdh,0c7h	; b3b2
	defb 0c9h,0cdh,0cdh,0cdh,0cdh,0c7h	; b3b8
	defb 0cfh,0cfh,0cfh,0cfh,0cfh,0cfh	; b3be

; ----------------------------------------------------------------------
; DATOS rect_B3C4: 14 x 6 caracteres (p00:53D6: B filas de C); lo leen
;   p00:57F1 (84 bytes)
;   0xb3c4..0xb418  (84 bytes)
DATA_rect_B3C4:
	defb 08eh,08fh,08fh,08fh,08fh,081h	; b3c4
	defb 061h,06fh,06fh,06fh,06fh,05ch	; b3ca
	defb 061h,06fh,06fh,06fh,06fh,05ch	; b3d0
	defb 061h,06fh,06fh,06fh,06fh,05ch	; b3d6
	defb 061h,06fh,06fh,06fh,06fh,05ch	; b3dc
	defb 061h,06fh,06fh,06fh,06fh,05ch	; b3e2
	defb 061h,06fh,06fh,06fh,06fh,05ch	; b3e8
	defb 061h,06fh,06fh,06fh,06fh,05ch	; b3ee
	defb 000h,000h,000h,000h,000h,000h	; b3f4
	defb 000h,000h,000h,000h,000h,000h	; b3fa
	defb 000h,000h,000h,000h,000h,000h	; b400
	defb 000h,000h,000h,000h,000h,000h	; b406
	defb 000h,000h,000h,000h,000h,000h	; b40c
	defb 0a8h,0a8h,0a8h,0a8h,0a8h,0a8h	; b412

; ----------------------------------------------------------------------
; DATOS rachas_B418: rachas a la VRAM (sprites o pantallas): [n < 0x80] repite
;   el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0 acaba; lo
;   leen p00:5848 (5 bytes)
;   0xb418..0xb41d  (5 bytes)
DATA_rachas_B418:
	defb 081h,080h,01fh,000h,000h	; b418

; ----------------------------------------------------------------------
; DATOS rachas_B41D: rachas a la VRAM (sprites o pantallas): [n < 0x80] repite
;   el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0 acaba; lo
;   leen p00:580C (5 bytes)
;   0xb41d..0xb422  (5 bytes)
DATA_rachas_B41D:
	defb 002h,0c0h,01eh,000h,000h	; b41d

; ----------------------------------------------------------------------
; DATOS rachas_B422: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (104 bytes)
;   0xb422..0xb48a  (104 bytes)
DATA_rachas_B422:
	defb 09fh,001h,007h,008h,007h,018h,020h,020h,000h,000h,018h,03ch,036h,030h,036h,006h	; b422  ......  ...<606.
	defb 000h,080h,0e0h,010h,0e0h,018h,004h,004h,000h,000h,018h,03ch,06ch,00ch,06ch,060h	; b432  ...........<l.l`
	defb 006h,000h,08ah,005h,00dh,00dh,007h,003h,000h,000h,001h,000h,070h,006h,000h,08ah	; b442  ............p...
	defb 0a0h,0b0h,0b0h,0e0h,0c0h,000h,000h,080h,000h,00eh,008h,000h,089h,001h,006h,008h	; b452  ................
	defb 017h,018h,027h,05ah,052h,032h,007h,000h,091h,080h,060h,010h,0e8h,018h,0e4h,05ah	; b462  ..'ZR2....`....Z
	defb 04ah,04ch,018h,024h,043h,049h,04eh,049h,088h,076h,008h,000h,088h,018h,024h,0c2h	; b472  JL.$CINI.v....$.
	defb 092h,072h,092h,011h,06eh,008h,000h,000h	; b482  .r..n...

; ----------------------------------------------------------------------
; DATOS rachas_B48A: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (94 bytes)
;   0xb48a..0xb4e8  (94 bytes)
DATA_rachas_B48A:
	defb 002h,000h,08ch,001h,007h,008h,007h,018h,020h,020h,000h,030h,078h,06ch,036h,004h	; b48a  ........  .0xl6.
	defb 000h,08ch,080h,0e0h,010h,0e0h,018h,004h,004h,000h,00ch,01eh,036h,06ch,009h,000h	; b49a  ............6l..
	defb 088h,005h,00dh,00dh,007h,003h,000h,000h,071h,008h,000h,088h,0a0h,0b0h,0b0h,0e0h	; b4aa  ........q.......
	defb 0c0h,000h,000h,08eh,00ah,000h,087h,001h,006h,008h,017h,018h,027h,05ah,009h,000h	; b4ba  ............'Z..
	defb 08fh,080h,060h,010h,0e8h,018h,0e4h,05ah,052h,032h,048h,084h,093h,049h,08eh,07fh	; b4ca  ..`....ZR2H..I..
	defb 008h,000h,088h,04ah,04ch,012h,021h,0c9h,092h,071h,0feh,008h,000h,000h	; b4da  ...JL.!..q....

; ----------------------------------------------------------------------
; DATOS rachas_B4E8: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (104 bytes)
;   0xb4e8..0xb550  (104 bytes)
DATA_rachas_B4E8:
	defb 09fh,001h,007h,008h,007h,018h,020h,020h,000h,000h,018h,03ch,036h,030h,036h,006h	; b4e8  ......  ...<606.
	defb 000h,080h,0e0h,010h,0e0h,018h,004h,004h,000h,000h,018h,03ch,06ch,00ch,06ch,060h	; b4f8  ...........<l.l`
	defb 006h,000h,08ah,005h,00eh,00dh,007h,003h,000h,000h,001h,000h,070h,006h,000h,08ah	; b508  ............p...
	defb 0a0h,070h,0b0h,0e0h,0c0h,000h,000h,080h,000h,00eh,008h,000h,089h,001h,006h,008h	; b518  .p..............
	defb 017h,018h,027h,05ah,051h,032h,007h,000h,091h,080h,060h,010h,0e8h,018h,0e4h,05ah	; b528  ..'ZQ2....`....Z
	defb 08ah,04ch,018h,024h,043h,049h,04eh,049h,088h,076h,008h,000h,088h,018h,024h,0c2h	; b538  .L.$CINI.v....$.
	defb 092h,072h,092h,011h,06eh,008h,000h,000h	; b548  .r..n...

; ----------------------------------------------------------------------
; DATOS rachas_B550: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D (103 bytes)
;   0xb550..0xb5b7  (103 bytes)
DATA_rachas_B550:
	defb 002h,000h,08ch,001h,007h,008h,007h,018h,020h,020h,000h,030h,078h,06ch,036h,004h	; b550  ........  .0xl6.
	defb 000h,08fh,080h,0e0h,010h,0e0h,018h,004h,004h,000h,00ch,01eh,036h,06ch,000h,000h	; b560  ............6l..
	defb 020h,003h,000h,08eh,040h,000h,000h,005h,00eh,00dh,007h,003h,000h,000h,071h,000h	; b570   ...@.........q.
	defb 008h,001h,005h,000h,088h,0a0h,070h,0b0h,0e0h,0c0h,000h,000h,08eh,00ah,000h,087h	; b580  ......p.........
	defb 001h,006h,008h,017h,018h,027h,05ah,009h,000h,08fh,080h,060h,010h,0e8h,018h,0e4h	; b590  .....'Z....`....
	defb 05ah,051h,032h,048h,084h,093h,049h,08eh,07fh,008h,000h,088h,08ah,04ch,012h,021h	; b5a0  ZQ2H..I......L.!
	defb 0c9h,092h,071h,0feh,008h,000h,000h	; b5b0

; ----------------------------------------------------------------------
; DATOS rachas_B5B7: rachas a la VRAM (sprites del personaje): [n < 0x80]
;   repite el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0
;   acaba; lo leen p00:568D, p00:581B (102 bytes)
;   0xb5b7..0xb61d  (102 bytes)
DATA_rachas_B5B7:
	defb 09fh,001h,007h,008h,007h,018h,020h,020h,000h,000h,018h,03ch,016h,000h,007h,00eh	; b5b7  ......  ...<....
	defb 000h,080h,0e0h,010h,0e0h,018h,004h,004h,000h,000h,018h,03ch,068h,000h,0e0h,070h	; b5c7  ...........<h..p
	defb 009h,000h,088h,005h,00dh,00dh,007h,003h,000h,040h,041h,008h,000h,088h,0a0h,0b0h	; b5d7  .........@A.....
	defb 0b0h,0e0h,0c0h,000h,002h,082h,006h,000h,08ah,001h,006h,008h,017h,018h,027h,05ah	; b5e7  ..............'Z
	defb 052h,032h,018h,006h,000h,092h,080h,060h,010h,0e8h,018h,0e4h,05ah,04ah,04ch,018h	; b5f7  R2.....`....ZJL.
	defb 024h,043h,0a9h,0beh,048h,011h,01eh,03eh,008h,000h,088h,024h,0c2h,095h,07dh,012h	; b607  $C..H..>...$..}.
	defb 088h,078h,07ch,008h,000h,000h	; b617

; ----------------------------------------------------------------------
; DATOS rachas_B61D: rachas a la VRAM (sprites o pantallas): [n < 0x80] repite
;   el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0 acaba; lo
;   leen p00:5325 (564 bytes)
;   0xb61d..0xb851  (564 bytes)
DATA_rachas_B61D:
	defb 0a0h,001h,006h,00fh,00fh,02fh,037h,01fh,007h,018h,03fh,017h,000h,00fh,00eh,000h	; b61d  ...../7...?.....
	defb 000h,080h,060h,0f0h,0f0h,0f4h,0ech,098h,0e0h,018h,0f4h,0f0h,000h,0f0h,010h,000h	; b62d  ..`.............
	defb 070h,009h,000h,082h,040h,060h,00ch,000h,081h,002h,005h,000h,081h,060h,008h,000h	; b63d  p...@`.......`..
	defb 08ah,001h,006h,009h,010h,030h,050h,048h,020h,018h,027h,006h,000h,090h,080h,060h	; b64d  .....0PH .'....`
	defb 090h,008h,00ch,00ah,012h,064h,01eh,0e5h,040h,0a8h,09fh,070h,011h,00eh,00ah,000h	; b65d  .....d..@..p....
	defb 088h,00ah,00ch,0f0h,008h,0e8h,098h,088h,070h,008h,000h,09eh,001h,006h,00fh,00fh	; b66d  ........p.......
	defb 02fh,037h,01fh,007h,018h,02fh,00fh,000h,00fh,008h,000h,00eh,080h,060h,0f0h,0f0h	; b67d  /7.../.......`..
	defb 0f4h,0ech,098h,0e0h,018h,0fch,0e8h,000h,0f0h,070h,009h,000h,081h,040h,005h,000h	; b68d  .........p...@..
	defb 081h,006h,00bh,000h,082h,002h,006h,00bh,000h,08ah,001h,006h,009h,010h,030h,050h	; b69d  ..............0P
	defb 048h,020h,078h,0a7h,006h,000h,092h,080h,060h,090h,008h,00ch,00ah,012h,064h,018h	; b6ad  H x.....`.....d.
	defb 0e4h,050h,030h,00fh,010h,017h,019h,011h,00eh,008h,000h,086h,002h,015h,0f9h,00eh	; b6bd  .P0.............
	defb 088h,070h,00bh,000h,08dh,001h,002h,007h,007h,017h,01fh,007h,008h,01fh,00fh,000h	; b6cd  .p..............
	defb 007h,006h,003h,000h,08eh,080h,040h,0e0h,0e0h,0e8h,098h,0e0h,010h,0f8h,0e0h,000h	; b6dd  ......@.........
	defb 0e0h,020h,060h,00bh,000h,081h,020h,00dh,000h,081h,004h,00fh,000h,088h,001h,002h	; b6ed  . `... .........
	defb 005h,008h,018h,028h,020h,018h,008h,000h,08fh,080h,040h,0a0h,010h,018h,014h,064h	; b6fd  ...( .....@....d
	defb 01ch,017h,020h,050h,03fh,008h,009h,006h,009h,000h,088h,0eah,004h,018h,0f0h,010h	; b70d  .. P?...........
	defb 0d0h,090h,0e0h,009h,000h,09dh,001h,002h,007h,007h,017h,01fh,007h,008h,01fh,007h	; b71d  ................
	defb 000h,007h,004h,006h,000h,000h,080h,040h,0e0h,0e0h,0e8h,098h,0e0h,010h,0f8h,0f0h	; b72d  .......@........
	defb 000h,0e0h,060h,00ah,000h,081h,020h,011h,000h,081h,004h,00dh,000h,088h,001h,002h	; b73d  ..`... .........
	defb 005h,008h,018h,028h,020h,038h,008h,000h,090h,080h,040h,0a0h,010h,018h,014h,064h	; b74d  ...( 8....@....d
	defb 018h,057h,020h,018h,00fh,008h,00bh,009h,007h,008h,000h,087h,0e8h,004h,00ah,0fch	; b75d  .W .............
	defb 010h,090h,060h,00dh,000h,08ah,001h,002h,007h,007h,00bh,007h,000h,00fh,008h,007h	; b76d  ..`.............
	defb 006h,000h,08bh,080h,040h,0e0h,0e0h,090h,0e0h,000h,0e0h,000h,0e0h,0e0h,00dh,000h	; b77d  ....@...........
	defb 081h,010h,00eh,000h,081h,008h,007h,000h,08ch,001h,002h,005h,008h,008h,014h,018h	; b78d  ................
	defb 00fh,010h,027h,018h,007h,004h,000h,08dh,080h,040h,0a0h,010h,010h,068h,010h,0f8h	; b79d  ..'......@...h..
	defb 014h,0f8h,010h,010h,0e0h,024h,000h,08bh,001h,002h,007h,007h,00bh,007h,000h,007h	; b7ad  .....$..........
	defb 000h,007h,007h,005h,000h,08ah,080h,040h,0e0h,0e0h,090h,0e0h,000h,0f0h,010h,0e0h	; b7bd  .......@........
	defb 00dh,000h,081h,010h,010h,000h,081h,008h,006h,000h,08dh,001h,002h,005h,008h,008h	; b7cd  ................
	defb 014h,008h,01fh,028h,01fh,008h,008h,007h,003h,000h,08ch,080h,040h,0a0h,010h,010h	; b7dd  ...(........@...
	defb 068h,018h,0f0h,008h,0e4h,018h,0e0h,028h,000h,087h,001h,003h,007h,003h,004h,00bh	; b7ed  h......(........
	defb 003h,009h,000h,085h,080h,0c0h,0e0h,0c0h,030h,003h,0c0h,007h,000h,089h,001h,002h	; b7fd  ........0.......
	defb 004h,008h,00ch,00bh,014h,00ch,003h,007h,000h,08ah,080h,040h,020h,010h,030h,0c8h	; b80d  ...........@ .0.
	defb 030h,020h,020h,0c0h,047h,000h,085h,001h,003h,007h,003h,00ch,003h,003h,008h,000h	; b81d  0  .G...........
	defb 087h,080h,0c0h,0e0h,0c0h,020h,0d0h,0c0h,008h,000h,08ah,001h,002h,004h,008h,00ch	; b82d  ..... ..........
	defb 013h,00ch,004h,004h,003h,006h,000h,089h,080h,040h,020h,010h,030h,0d0h,028h,030h	; b83d  .........@ .0.(0
	defb 0c0h,041h,000h,000h	; b84d

; ----------------------------------------------------------------------
; DATOS rachas_B851: rachas a la VRAM (sprites o pantallas): [n < 0x80] repite
;   el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0 acaba; lo
;   leen p00:5803 (274 bytes)
;   0xb851..0xb963  (274 bytes)
DATA_rachas_B851:
	defb 084h,000h,001h,006h,00fh,003h,01fh,08dh,05fh,06fh,03fh,00fh,000h,000h,003h,01fh	; b851  ........_o?.....
	defb 02fh,000h,080h,060h,0f0h,003h,0f8h,0b5h,0fah,0e6h,09ch,0f0h,000h,000h,0c0h,0e0h	; b861  /..`............
	defb 0f8h,001h,006h,009h,010h,020h,020h,060h,0a0h,090h,040h,030h,01fh,00fh,01ch,020h	; b871  .....  `..@0...
	defb 050h,080h,060h,090h,008h,004h,004h,006h,005h,019h,062h,00ch,0f8h,0f0h,020h,018h	; b881  P.`.......b... .
	defb 004h,02fh,077h,067h,064h,003h,007h,007h,004h,006h,006h,000h,006h,004h,000h,002h	; b891  ./wgd...........
	defb 0f4h,085h,0e2h,020h,0c0h,0e0h,0e0h,003h,060h,084h,0e0h,0a0h,040h,0e0h,006h,000h	; b8a1  ... ....`...@...
	defb 082h,010h,020h,00dh,000h,081h,004h,00ch,000h,08dh,050h,088h,098h,09bh,06ch,058h	; b8b1  .. .......P...lX
	defb 028h,00bh,009h,009h,00fh,009h,007h,003h,001h,002h,00ah,085h,01dh,0dah,034h,010h	; b8c1  (.............4.
	defb 010h,003h,090h,08ah,010h,050h,0b0h,010h,0e0h,0e0h,000h,001h,006h,00fh,003h,01fh	; b8d1  .....P..........
	defb 08dh,05fh,06fh,03fh,00fh,000h,000h,003h,007h,01fh,000h,080h,060h,0f0h,003h,0f8h	; b8e1  ._o?........`...
	defb 0b0h,0fah,0e6h,09ch,0f0h,000h,000h,0c0h,0f8h,0f4h,001h,006h,009h,010h,020h,020h	; b8f1  ..............
	defb 060h,0a0h,090h,040h,030h,01fh,00fh,004h,018h,020h,080h,060h,090h,008h,004h,004h	; b901  `..@0.... .`....
	defb 006h,005h,019h,062h,00ch,0f8h,0f0h,038h,004h,00ah,02fh,02fh,047h,004h,003h,007h	; b911  ...b...8..//G...
	defb 007h,003h,006h,092h,007h,005h,002h,007h,000h,000h,0f4h,0eeh,0e6h,026h,0c0h,0e0h	; b921  .............&..
	defb 0e0h,020h,060h,060h,000h,060h,007h,000h,081h,020h,010h,000h,082h,008h,004h,00ah	; b931  . ``.`... ......
	defb 000h,002h,050h,085h,0b8h,05bh,02ch,008h,008h,003h,009h,093h,008h,00ah,00dh,008h	; b941  ..P..[,.........
	defb 007h,007h,00ah,011h,019h,0d9h,036h,01ah,014h,0d0h,090h,090h,0f0h,090h,0e0h,003h	; b951  ......6.........
	defb 080h,000h	; b961

; ----------------------------------------------------------------------
; DATOS rachas_B963: rachas a la VRAM (sprites o pantallas): [n < 0x80] repite
;   el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0 acaba; lo
;   leen p00:583F (307 bytes)
;   0xb963..0xba96  (307 bytes)
DATA_rachas_B963:
	defb 09fh,001h,007h,008h,007h,018h,020h,020h,000h,000h,010h,03ch,01eh,008h,007h,00fh	; b963  ......  ...<....
	defb 006h,080h,0e0h,010h,0e0h,018h,004h,004h,000h,000h,010h,038h,040h,038h,0f0h,020h	; b973  ...........8@8.
	defb 008h,000h,088h,005h,00dh,00dh,067h,043h,000h,000h,001h,008h,000h,088h,0a0h,0b0h	; b983  ......gC........
	defb 0b0h,0ech,0c4h,000h,000h,080h,006h,000h,08bh,001h,006h,008h,017h,018h,027h,05ah	; b993  ..............'Z
	defb 052h,072h,098h,0ach,005h,000h,093h,080h,060h,010h,0e8h,018h,0e4h,05ah,04ah,04eh	; b9a3  Rr......`....ZJN
	defb 012h,02ah,043h,021h,016h,018h,010h,009h,007h,00fh,008h,000h,087h,0c4h,0b8h,047h	; b9b3  .*C!...........G
	defb 00eh,0dch,0b8h,090h,00ah,000h,087h,001h,007h,008h,007h,018h,020h,020h,003h,000h	; b9c3  ............  ..
	defb 08ch,01ch,036h,020h,007h,00eh,000h,080h,0e0h,010h,0e0h,018h,004h,003h,000h,086h	; b9d3  ..6 ............
	defb 00ch,038h,070h,000h,0f0h,038h,008h,000h,088h,005h,00dh,00dh,007h,003h,000h,000h	; b9e3  .8p..8..........
	defb 019h,008h,000h,088h,0a0h,0b0h,0b2h,0e6h,0c0h,000h,000h,080h,006h,000h,08ah,001h	; b9f3  ................
	defb 006h,008h,017h,018h,027h,05ah,052h,032h,008h,006h,000h,092h,080h,060h,010h,0e8h	; ba03  ....'ZR2.....`..
	defb 018h,0e4h,05ah,04eh,04dh,019h,01ch,023h,049h,046h,038h,011h,03eh,07ch,008h,000h	; ba13  ..ZNM..#IF8.>|..
	defb 088h,032h,0c4h,088h,070h,008h,0c4h,03eh,01fh,009h,000h,084h,001h,003h,000h,003h	; ba23  .2..p..>........
	defb 005h,000h,096h,008h,01ch,00eh,000h,007h,00eh,000h,080h,0e0h,010h,0e0h,018h,004h	; ba33  ................
	defb 004h,000h,000h,018h,03ch,068h,000h,0e0h,070h,004h,000h,08ch,040h,048h,048h,058h	; ba43  ....<h..p...@HHX
	defb 051h,0f5h,0f5h,067h,003h,000h,000h,001h,008h,000h,088h,0a0h,0b0h,0b0h,0e0h,0c0h	; ba53  Q..g............
	defb 000h,002h,082h,006h,000h,08ah,001h,046h,0ach,0b7h,0b4h,0a7h,0aeh,00ah,00ah,098h	; ba63  .......F........
	defb 006h,000h,092h,080h,060h,010h,0e8h,018h,0e4h,05ah,04ah,04ch,018h,0f4h,063h,011h	; ba73  ....`....ZJL..c.
	defb 00eh,008h,011h,01eh,03eh,008h,000h,088h,024h,0c2h,095h,07dh,012h,088h,078h,07ch	; ba83  ....>...$..}..x|
	defb 008h,000h,000h	; ba93

; ----------------------------------------------------------------------
; DATOS rachas_BA96: rachas a la VRAM (sprites o pantallas): [n < 0x80] repite
;   el byte siguiente, [0x80 + n] copia n, [0x80] otro destino, 0 acaba; lo
;   leen p00:5605 (139 bytes)
;   0xba96..0xbb21  (139 bytes)
DATA_rachas_BA96:
	defb 083h,000h,01ch,036h,006h,022h,087h,023h,022h,020h,020h,060h,040h,0c0h,009h,000h	; ba96  ...6.".#"  `@...
	defb 08ah,080h,0f0h,058h,00ch,006h,002h,003h,000h,000h,008h,007h,014h,086h,015h,017h	; baa6  ...X............
	defb 016h,010h,030h,024h,00bh,000h,085h,0a0h,0f0h,058h,00ch,084h,003h,000h,009h,008h	; bab6  ..0$.....X......
	defb 084h,009h,00fh,00fh,01bh,00dh,000h,083h,0a0h,0f0h,078h,006h,080h,085h,0c0h,040h	; bac6  ..........x....@
	defb 060h,030h,018h,004h,008h,081h,00fh,005h,001h,087h,003h,002h,006h,004h,00ch,008h	; bad6  `0..............
	defb 018h,003h,010h,083h,0f0h,060h,060h,003h,040h,085h,060h,020h,030h,018h,008h,006h	; bae6  .....``.@.` 0...
	defb 000h,08bh,016h,002h,002h,006h,006h,004h,00ch,008h,018h,010h,030h,004h,020h,083h	; baf6  ............0. .
	defb 000h,01fh,01fh,003h,03fh,002h,01fh,081h,00fh,007h,007h,084h,000h,0e8h,0fch,0fch	; bb06  ....?...........
	defb 003h,0f8h,002h,0f0h,002h,0e0h,005h,0c0h,081h,000h,000h	; bb16  ...........

; ----------------------------------------------------------------------
; DATOS rachas_BB21: rachas a la VRAM (el titulo) con su destino delante (2
;   bytes); lo leen p00:4E23 (127 bytes)
;   0xbb21..0xbba0  (127 bytes)
DATA_rachas_BB21:
	defb 000h,018h,084h,000h,040h,03fh,019h,003h,001h,082h,01fh,00dh,003h,001h,083h,01fh	; bb21  ....@?..........
	defb 0fch,070h,003h,000h,082h,0feh,00ch,003h,080h,082h,0f8h,09ch,003h,080h,083h,0fch	; bb31  .p..............
	defb 01fh,006h,003h,000h,09eh,001h,07fh,020h,027h,041h,006h,018h,002h,00dh,032h,00ch	; bb41  ....... 'A....2.
	defb 078h,033h,001h,000h,0c0h,0c0h,0feh,007h,0f3h,002h,098h,0f4h,040h,060h,060h,070h	; bb51  x3..........@``p
	defb 0deh,0cch,080h,004h,000h,08ah,00fh,019h,031h,021h,042h,042h,046h,064h,038h,010h	; bb61  ........1!BBFd8.
	defb 006h,000h,083h,0e0h,010h,008h,004h,004h,094h,00ch,018h,0f0h,060h,000h,000h,008h	; bb71  ............`...
	defb 00ch,019h,033h,062h,004h,018h,070h,0e0h,04fh,018h,008h,00ch,007h,003h,000h,08eh	; bb81  ..3b..p.O.......
	defb 020h,0b0h,09eh,0c4h,020h,018h,00eh,007h,0fah,018h,010h,030h,0f0h,000h,000h	; bb91   ... ......0...

; ----------------------------------------------------------------------
; DATOS resto_BBA0: lo apuntan con el banco puesto p02:9D0F (0xBBA0); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p02:9D0F (20 bytes)
;   0xbba0..0xbbb4  (20 bytes)
DATA_resto_BBA0:
	defb 0ffh,0fch,0f8h,008h,000h,000h,0f8h,008h,000h,000h,0f8h,008h,000h,000h,0f8h,008h	; bba0  ................
	defb 000h,000h,0f8h,008h	; bbb0

; ----------------------------------------------------------------------
; DATOS relleno_ff: 1100 bytes a 0xFF hasta el final del banco: relleno; lo
;   leen nadie (1100 bytes)
;   0xbbb4..0xc000  (1100 bytes)
DATA_relleno_ff:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bbb4  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bbc4  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bbd4  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bbe4  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bbf4  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bc04  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bc14  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bc24  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bc34  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bc44  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bc54  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bc64  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bc74  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bc84  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bc94  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bca4  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bcb4  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bcc4  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bcd4  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bce4  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bcf4  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bd04  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bd14  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bd24  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bd34  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bd44  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bd54  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bd64  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bd74  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bd84  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bd94  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bda4  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bdb4  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bdc4  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bdd4  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bde4  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bdf4  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; be04  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; be14  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; be24  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; be34  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; be44  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; be54  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; be64  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; be74  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; be84  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; be94  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bea4  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; beb4  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bec4  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bed4  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bee4  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bef4  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf04  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf14  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf24  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf34  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf44  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf54  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf64  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf74  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf84  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf94  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfa4  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfb4  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfc4  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfd4  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfe4  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bff4  ............
