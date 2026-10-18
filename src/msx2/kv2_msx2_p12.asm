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
; DATOS resto_A000: lo apuntan con el banco puesto p12:BE04 (0xA868), p12:BE0A
;   (0xA878), p12:BE10 (0xA888), p00:5B1C (0xAA29), p00:5BF1 (0xAA29),
;   p00:5BFD (0xAA89); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p12:BE04, p12:BE0A, p12:BE10, p00:5B1C, p00:5BF1,
;   p00:5BFD (5120 bytes)
;   0xa000..0xb400  (5120 bytes)
DATA_resto_A000:
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
	defb 000h,0c1h,01fh,0c1h,01fh,0c1h,01fh,0c4h,09bh,0c5h,09bh,0c5h,01ch,0c4h,01ch,0c4h	; a120  ................
	defb 01ch,0c4h,002h,08ah,004h,084h,0c2h,085h,0c5h,002h,08ah,004h,084h,0c2h,085h,0c5h	; a130  ................
	defb 014h,0c2h,006h,0c4h,014h,0c2h,006h,0c4h,014h,0c2h,006h,0c4h,014h,0c2h,006h,0c4h	; a140  ................
	defb 014h,0c2h,006h,0c4h,002h,0c2h,086h,00ah,0c2h,006h,0c4h,002h,0c2h,086h,00ah,0c2h	; a150  ................
	defb 006h,0c4h,002h,0c2h,018h,0c4h,002h,0c2h,018h,0c4h,002h,0c2h,018h,0c4h,002h,0c2h	; a160  ................
	defb 00ch,08ah,002h,0c4h,002h,0c2h,00ch,08ah,002h,0ffh,0c1h,03fh,021h,0c1h,09eh,0c2h	; a170  ...........?!...
	defb 09eh,0c1h,03fh,021h,0c1h,083h,0c2h,006h,0c2h,008h,082h,008h,0c1h,083h,0c2h,006h	; a180  ..?!............
	defb 0c2h,008h,082h,00ch,0c2h,006h,0c2h,006h,082h,002h,082h,00ah,0c2h,006h,0c2h,006h	; a190  ................
	defb 082h,002h,082h,00ah,0c2h,082h,004h,0c2h,004h,0c2h,006h,0c2h,008h,0c2h,082h,004h	; a1a0  ................
	defb 0c2h,004h,0c2h,006h,0c2h,008h,0c2h,082h,004h,0c2h,004h,0c2h,082h,002h,082h,0c2h	; a1b0  ................
	defb 008h,0c2h,082h,004h,0c2h,004h,0c2h,082h,002h,082h,0c2h,008h,0c2h,002h,082h,002h	; a1c0  ................
	defb 0c2h,004h,0c2h,006h,0c2h,008h,0c2h,002h,082h,002h,0c2h,004h,0c2h,006h,0c2h,008h	; a1d0  ................
	defb 0c2h,002h,082h,002h,0c2h,004h,0c2h,006h,0c2h,008h,0c2h,002h,082h,002h,0c2h,016h	; a1e0  ................
	defb 0c2h,004h,082h,0c2h,016h,0c2h,004h,082h,0c2h,012h,0c8h,002h,0deh,002h,0d6h,01fh	; a1f0  ................
	defb 0c1h,01fh,0c1h,01fh,0c2h,09bh,0c5h,09bh,0c4h,01ch,0c4h,01ch,0c4h,01ch,0c4h,012h	; a200  ................
	defb 0c2h,086h,002h,0c4h,012h,0c2h,086h,002h,0c4h,012h,0c2h,008h,0c4h,012h,0c2h,008h	; a210  ................
	defb 0c4h,012h,0c2h,008h,0c4h,012h,0c2h,008h,0c4h,012h,0c2h,086h,002h,0c4h,012h,0c2h	; a220  ................
	defb 086h,002h,0c4h,012h,0c2h,008h,0c4h,012h,0c2h,008h,0c4h,012h,0c2h,008h,0c4h,012h	; a230  ................
	defb 0c2h,008h,0c4h,004h,0c2h,088h,004h,0c2h,086h,003h,0c3h,004h,0c2h,088h,004h,0c2h	; a240  ................
	defb 086h,003h,0ffh,0e7h,011h,084h,0c2h,084h,002h,0c3h,011h,084h,0c2h,084h,002h,0c6h	; a250  ................
	defb 012h,0c2h,006h,0c6h,012h,0c2h,006h,0c6h,002h,086h,0c2h,008h,0c2h,006h,0c6h,002h	; a260  ................
	defb 086h,0c2h,008h,0c2h,006h,0c6h,012h,0c2h,006h,0c6h,01ah,0c6h,01ah,0c6h,01ah,0c6h	; a270  ................
	defb 002h,086h,0c2h,004h,08ah,002h,0c6h,002h,086h,0c2h,004h,08ah,002h,0c6h,01ah,0c6h	; a280  ................
	defb 01ah,0c6h,01ah,0c6h,01ah,0c6h,098h,0c8h,098h,0c3h,01fh,0c1h,01fh,0c1h,01fh,0ffh	; a290  ................
	defb 0c9h,002h,0d6h,004h,0c2h,006h,0c2h,004h,0c2h,006h,0c6h,004h,0c2h,006h,0c2h,004h	; a2a0  ................
	defb 0c2h,006h,0c6h,004h,0c2h,006h,0c2h,004h,0c2h,006h,0c6h,004h,0c2h,006h,0c2h,004h	; a2b0  ................
	defb 0c2h,082h,0c2h,082h,0c6h,004h,0c2h,006h,0c2h,004h,0c2h,082h,0c2h,082h,0c6h,004h	; a2c0  ................
	defb 0c2h,006h,0c2h,004h,0c2h,006h,0c6h,004h,0c2h,006h,0c2h,004h,0c2h,006h,0c6h,004h	; a2d0  ................
	defb 0c2h,006h,0c2h,004h,0c2h,006h,0c6h,004h,0c2h,006h,0c2h,006h,082h,002h,082h,004h	; a2e0  ................
	defb 0c2h,004h,0c2h,006h,0c2h,006h,082h,002h,082h,004h,0c2h,004h,0c2h,006h,0c2h,008h	; a2f0  ................
	defb 082h,006h,0c2h,004h,0c2h,006h,0c2h,008h,082h,006h,0c2h,01eh,0c2h,01eh,0c2h,01eh	; a300  ................
	defb 0c2h,01eh,0c3h,09dh,0c3h,09dh,0c2h,03fh,021h,0ffh,0e5h,088h,006h,086h,005h,0c7h	; a310  .......?!.......
	defb 088h,006h,086h,005h,0c7h,088h,010h,0c8h,088h,010h,0c6h,01ah,0c6h,010h,086h,0c2h	; a320  ................
	defb 002h,0c6h,010h,086h,0c2h,002h,0c6h,016h,0c2h,002h,0c6h,016h,0c2h,002h,0c6h,016h	; a330  ................
	defb 0c2h,002h,0c6h,010h,086h,0c2h,002h,0c6h,010h,086h,0c2h,002h,0c6h,01ah,0c6h,01ah	; a340  ................
	defb 0c6h,01ah,0c6h,01ah,0c8h,096h,002h,0c8h,096h,002h,0c4h,01dh,0c3h,01dh,0c3h,01dh	; a350  ................
	defb 0ffh,0c4h,000h,026h,003h,0a6h,041h,022h,05bh,000h,000h,050h,018h,090h,01bh,0ffh	; a360  ...&..A"[..P....
	defb 04ah,01ah,005h,02dh,0c6h,042h,000h,007h,001h,0c7h,002h,048h,01ch,088h,01fh,007h	; a370  J..-.B.....H....
	defb 03dh,0c7h,03eh,082h,05bh,0ffh,087h,003h,088h,01ch,048h,01fh,047h,03ch,087h,03fh	; a380  =.>.[.....H.G<.?
	defb 002h,059h,0c2h,05ah,000h,034h,00ch,0ffh,08bh,01ah,0b4h,00fh,000h,095h,013h,0ffh	; a390  .Y.Z.4..........
	defb 096h,003h,000h,0c5h,022h,005h,037h,0c5h,04ah,001h,05fh,0ffh,003h,003h,0c5h,00eh	; a3a0  ....".7.J._.....
	defb 005h,023h,0c5h,036h,005h,04bh,000h,005h,04dh,0e5h,04dh,0e5h,04eh,0a1h,05fh,0ffh	; a3b0  .#.6.K..M.M.N._.
	defb 0c5h,011h,045h,025h,0c5h,038h,0ffh,004h,001h,0eah,001h,0e4h,002h,0b7h,003h,0a4h	; a3c0  ..E%.8..........
	defb 012h,0ech,022h,06ah,028h,023h,053h,023h,050h,000h,092h,017h,000h,000h,000h,086h	; a3d0  .."j(#S#P.......
	defb 03eh,000h,0ffh,06eh,014h,000h,0a6h,018h,028h,021h,024h,023h,0a4h,032h,0a9h,039h	; a3e0  >..n....(!$#.2.9
	defb 026h,042h,000h,000h,0d2h,01ah,082h,058h,082h,05bh,0ffh,08eh,000h,0c6h,002h,098h	; a3f0  &B.....X.[......
	defb 003h,084h,050h,004h,052h,0ffh,090h,000h,007h,002h,094h,003h,000h,044h,019h,0c4h	; a400  ..P.R........D..
	defb 019h,044h,01bh,0c6h,028h,046h,02ah,046h,040h,046h,041h,0c8h,042h,082h,058h,0c2h	; a410  .D..(F*F@FA.B.X.
	defb 059h,0ffh,08fh,018h,04fh,01bh,047h,039h,087h,03ah,0ffh,086h,000h,0c6h,001h,0c6h	; a420  Y...O.G9.:......
	defb 002h,046h,019h,04ch,01ah,048h,01bh,046h,030h,0c4h,039h,0c6h,042h,0c4h,048h,000h	; a430  .F.L.H.F0.9.B.H.
	defb 0a9h,015h,0a9h,017h,0a9h,038h,0a9h,03ah,0ffh,0a9h,021h,0a9h,023h,0a9h,02ch,0a9h	; a440  .....8.:..!.#.,.
	defb 02eh,0ffh,026h,014h,0b2h,017h,029h,038h,000h,0a1h,05fh,0ffh,0a4h,003h,046h,029h	; a450  ..&...)8.._...F)
	defb 086h,039h,044h,042h,000h,0ffh,0ffh,0b2h,017h,000h,005h,00fh,069h,01eh,007h,033h	; a460  .9DB........i..3
	defb 084h,04eh,0ffh,0a4h,020h,006h,029h,0c6h,02ah,0a3h,040h,0ffh,045h,00ch,064h,011h	; a470  .N.. .).*.@.E.d.
	defb 024h,021h,0a8h,023h,0c7h,031h,047h,043h,004h,04dh,000h,066h,002h,085h,02ah,062h	; a480  $!.#.1GC.M.f..*b
	defb 05ah,000h,0a4h,013h,064h,023h,0a4h,033h,064h,043h,0a4h,053h,0c4h,052h,0ffh,0c4h	; a490  Z...d#.3dC.S.R..
	defb 002h,0a4h,003h,064h,013h,0a4h,023h,066h,027h,0a6h,037h,064h,04fh,024h,03fh,000h	; a4a0  ...d..#f'.7dO$?.
	defb 086h,019h,000h,084h,015h,004h,026h,084h,036h,004h,047h,000h,0e5h,04ah,0ffh,02bh	; a4b0  ......&.6.G..J.+
	defb 01ch,045h,049h,0a5h,04ah,0ffh,066h,014h,0edh,014h,044h,027h,005h,037h,045h,048h	; a4c0  .EI.J.f...D'.7EH
	defb 005h,04ah,0c5h,04ah,000h,028h,03dh,000h,032h,014h,0abh,017h,024h,021h,0a4h,022h	; a4d0  .J.J.(=.2...$!."
	defb 0a3h,042h,003h,04eh,063h,016h,000h,046h,010h,042h,027h,047h,029h,002h,037h,0c6h	; a4e0  .B.Nc..F.B'G).7.
	defb 03eh,0ffh,043h,010h,086h,044h,006h,045h,0ffh,089h,010h,046h,013h,0c5h,021h,045h	; a4f0  >.C..D.E...F..!E
	defb 035h,047h,043h,005h,04ah,000h,037h,004h,0c4h,010h,0ceh,021h,04eh,023h,0c6h,030h	; a500  5GC.J.7....!N#.0
	defb 046h,032h,042h,05ah,0ffh,0c8h,011h,0b7h,007h,0c4h,028h,046h,029h,044h,032h,044h	; a510  F2BZ......(F)D2D
	defb 038h,0c4h,051h,042h,058h,0ffh,037h,000h,04eh,002h,0d0h,011h,04ch,01bh,0c6h,020h	; a520  8.QBX.7.N...L..
	defb 0c5h,048h,085h,04bh,0ffh,0b7h,003h,048h,000h,0c6h,001h,044h,011h,044h,012h,004h	; a530  .H.K...H...D.D..
	defb 021h,08dh,028h,087h,042h,000h,048h,013h,044h,021h,0c4h,031h,084h,042h,0c4h,050h	; a540  !.(.B.H.D!.1.B.P
	defb 0ffh,0c4h,000h,0c8h,022h,044h,031h,0c4h,040h,044h,043h,084h,051h,0c4h,052h,0ffh	; a550  ...."D1.@DC.Q.R.
	defb 0c7h,020h,08eh,023h,004h,02fh,0ffh,083h,001h,0c3h,002h,084h,01dh,048h,03fh,024h	; a560  . .#./.......H?$
	defb 02ch,084h,04eh,000h,0e2h,016h,022h,01fh,0a2h,02fh,022h,02fh,0e2h,036h,062h,037h	; a570  ,.N..."../"/.6b7
	defb 0a2h,03eh,022h,03fh,0a2h,03fh,062h,046h,0e2h,046h,062h,047h,022h,044h,062h,04ch	; a580  .>"?.?bF.FbG"DbL
	defb 0a2h,04fh,022h,054h,062h,027h,000h,051h,014h,0cbh,015h,0ffh,045h,034h,02dh,015h	; a590  .O"Tb'.Q....E4-.
	defb 0c5h,048h,0ffh,085h,014h,00eh,015h,08ch,017h,006h,047h,000h,065h,01ch,083h,025h	; a5a0  .H........G.e..%
	defb 044h,033h,0e3h,040h,0ffh,084h,010h,00ch,003h,0c5h,01dh,0abh,030h,067h,031h,003h	; a5b0  D3.@........0g1.
	defb 041h,0a4h,04fh,001h,05dh,0ffh,004h,001h,084h,013h,084h,020h,044h,021h,087h,032h	; a5c0  A.O.]...... D!.2
	defb 004h,04dh,001h,05fh,000h,086h,018h,0c6h,01ah,082h,032h,042h,03ah,082h,042h,046h	; a5d0  .M._......2B:.BF
	defb 048h,006h,04ah,082h,05bh,0ffh,0d0h,019h,0ffh,045h,000h,005h,002h,085h,003h,089h	; a5e0  H.J.[....E......
	defb 014h,08ah,033h,007h,017h,000h,023h,018h,003h,01bh,000h,034h,00ch,084h,00eh,084h	; a5f0  ..3...#....4....
	defb 02ch,024h,04dh,084h,04fh,0ffh,0a4h,01fh,0a4h,02dh,004h,02fh,0a4h,03ch,004h,03eh	; a600  ,$M.O....-./.<.>
	defb 0a4h,04fh,000h,000h,0ffh,06ah,02fh,000h,0ffh,0ffh,0ffh,0c6h,044h,000h,027h,040h	; a610  .O...j/.....D.'@
	defb 0ffh,0ffh,0a4h,033h,000h,0ffh,0ffh,046h,038h,000h,0abh,01bh,000h,024h,01ch,026h	; a620  ...3...F8....$.&
	defb 015h,0e2h,015h,0a2h,016h,0a4h,017h,0a2h,024h,062h,02ch,0e2h,02ch,022h,035h,062h	; a630  ........$b,.,"5b
	defb 03dh,0a2h,045h,0e4h,03eh,024h,02fh,064h,01fh,0a4h,04fh,000h,003h,003h,004h,019h	; a640  =.E.>$/d..O.....
	defb 0c4h,01ah,0c4h,03ah,021h,05ch,0ffh,024h,000h,02ah,038h,0cah,010h,0d3h,011h,0c9h	; a650  ...:!\.$.*8.....
	defb 012h,0b4h,013h,0ffh,026h,000h,0a6h,003h,00ch,01ah,005h,04fh,000h,087h,002h,0c6h	; a660  ....&......O....
	defb 01ch,086h,034h,08bh,036h,0ffh,085h,001h,0cch,01ch,046h,037h,004h,04eh,081h,05dh	; a670  ..4.6.....F7.N.]
	defb 046h,01eh,0ffh,00ch,01eh,006h,01fh,000h,037h,004h,086h,048h,0c7h,02ch,0c5h,035h	; a680  F.......7..H.,.5
	defb 006h,026h,047h,012h,0ffh,066h,034h,0b3h,013h,001h,05fh,0ffh,037h,000h,08ah,000h	; a690  .&G..f4..._.7...
	defb 0c2h,020h,042h,021h,042h,022h,0c2h,022h,002h,029h,082h,029h,082h,02ah,0c2h,030h	; a6a0  . B!B".".).).*.0
	defb 042h,031h,042h,032h,0c2h,032h,002h,039h,082h,039h,082h,03ah,044h,042h,083h,052h	; a6b0  B1B2.2.9.9.:DB.R
	defb 0ffh,048h,014h,08ah,034h,0c6h,00eh,003h,003h,082h,00ch,000h,0ffh,0c1h,05eh,0ffh	; a6c0  .H..4.........^.
	defb 0ffh,0c5h,002h,000h,046h,003h,089h,03fh,0ffh,0c8h,028h,048h,032h,08eh,02bh,084h	; a6d0  ....F..?..(H2.+.
	defb 050h,084h,051h,002h,05bh,0ffh,084h,003h,046h,028h,00dh,029h,0cbh,02ah,0c5h,049h	; a6e0  P.Q.[...F(.).*.I
	defb 048h,043h,0ffh,088h,000h,086h,001h,008h,003h,084h,003h,0cah,028h,0c8h,021h,0aeh	; a6f0  HC..........(.!.
	defb 023h,000h,051h,014h,0ffh,047h,014h,046h,02ah,088h,02bh,0ffh,0ffh,0c5h,000h,0c8h	; a700  #.Q..G.F*.+.....
	defb 040h,045h,02eh,084h,03ah,0c4h,04ah,08dh,017h,000h,053h,014h,025h,01ah,00bh,02dh	; a710  @E..:.J...S.%..-
	defb 086h,02fh,0ffh,0d1h,015h,086h,016h,046h,02fh,0c2h,05ah,0ffh,056h,000h,0ffh,0ceh	; a720  ./.....F/.Z.V...
	defb 002h,046h,031h,000h,022h,04ch,0a2h,04fh,000h,041h,05ch,082h,042h,002h,03bh,082h	; a730  .F1."L.O.A\.B...
	defb 043h,0ffh,042h,040h,0c2h,038h,042h,041h,081h,05fh,0ffh,045h,000h,082h,014h,002h	; a740  C.B@.8BA._.E....
	defb 01dh,082h,025h,002h,02eh,082h,036h,002h,03fh,0ffh,082h,014h,082h,015h,082h,016h	; a750  ..%...6.?.......
	defb 002h,01dh,002h,01eh,0c2h,01eh,082h,024h,082h,025h,042h,026h,002h,02dh,0c2h,02dh	; a760  .......$.%B&.-.-
	defb 082h,034h,042h,035h,0c2h,03ch,083h,003h,000h,000h,000h,000h,000h,02bh,030h,0abh	; a770  .4B5.<.......+0.
	defb 033h,0ffh,04bh,033h,0b1h,01bh,0ffh,0ffh,066h,014h,066h,017h,0e6h,02ch,0e6h,02eh	; a780  3.K3....f.f..,..
	defb 086h,045h,046h,046h,000h,000h,000h,000h,024h,01ch,064h,01dh,0e4h,01eh,0e6h,015h	; a790  .EFF....$.d.....
	defb 024h,034h,024h,036h,024h,037h,000h,000h,086h,028h,046h,021h,046h,02bh,002h,043h	; a7a0  $4$6$7...(F!F+.C
	defb 0c2h,04ah,082h,052h,000h,082h,021h,0ffh,0c2h,035h,044h,01fh,004h,03fh,000h,06bh	; a7b0  .J.R..!..5D..?.k
	defb 034h,0a2h,02dh,0e4h,025h,022h,026h,0a9h,002h,0ffh,028h,001h,0ach,002h,0ffh,066h	; a7c0  4.-.%"&...(....f
	defb 000h,0a1h,05eh,0ffh,068h,018h,021h,05dh,0a1h,05eh,000h,08bh,000h,04bh,003h,085h	; a7d0  ..^.h.!].^...K..
	defb 04ch,045h,04fh,0ffh,08bh,000h,04bh,003h,081h,05ch,041h,05fh,0ffh,08bh,000h,04bh	; a7e0  LEO...K..\A_...K
	defb 003h,085h,04ch,045h,04fh,04ah,02eh,0ffh,08bh,000h,04bh,003h,085h,04ch,045h,04fh	; a7f0  ..LEOJ....K..LEO
	defb 0ffh,08bh,000h,04bh,003h,085h,04ch,045h,04fh,0e8h,02dh,0ffh,08bh,000h,04bh,003h	; a800  ...K..LEO.-...K.
	defb 088h,040h,048h,043h,000h,0ffh,086h,040h,004h,01ah,0ffh,044h,018h,006h,042h,082h	; a810  .@HC...@...D..B.
	defb 03ah,002h,033h,087h,017h,000h,082h,018h,082h,028h,082h,038h,0c2h,020h,0c2h,030h	; a820  :.3......(.8. .0
	defb 0c2h,040h,002h,029h,002h,039h,002h,049h,042h,031h,042h,041h,082h,032h,082h,042h	; a830  .@.).9.IB1BA.2.B
	defb 0c2h,02ah,0c2h,03ah,0c2h,04ah,002h,023h,002h,033h,002h,043h,042h,01bh,042h,02bh	; a840  .*.:.J.#.3.CB.B+
	defb 042h,03bh,0c2h,050h,0ffh,04ah,032h,0c8h,012h,0ffh,046h,002h,004h,051h,042h,05bh	; a850  B..P.J2...F..QB[
	defb 0ffh,004h,001h,04ah,003h,042h,05ah,000h,053h,014h,0a3h,045h,0e4h,035h,022h,052h	; a860  ...J.BZ.S..E.5"R
	defb 082h,05bh,0ffh,056h,000h,064h,04ah,096h,003h,0ffh,000h,044h,014h,044h,034h,084h	; a870  .[.V.dJ....D.D4.
	defb 024h,083h,044h,0ffh,0ffh,044h,027h,045h,047h,084h,037h,000h,0e2h,014h,0e2h,016h	; a880  $.D..D'EG.7.....
	defb 0a2h,01ch,022h,01fh,067h,024h,067h,027h,0a4h,034h,024h,037h,0e6h,03ch,0e2h,03dh	; a890  ..".g$g'.4$7.<.=
	defb 0e6h,03eh,0a2h,045h,022h,046h,022h,04dh,0e2h,04dh,0a2h,04eh,0a2h,055h,022h,056h	; a8a0  .>.E"F"M.M.N.U"V
	defb 000h,0e6h,02ch,024h,023h,0ffh,002h,01ah,0b0h,023h,0ffh,0ffh,010h,01ah,0a6h,003h	; a8b0  ..,$#....#......
	defb 000h,088h,022h,000h,086h,037h,000h,064h,028h,064h,029h,064h,02ah,064h,02bh,0a4h	; a8c0  .."..7.d(d)d*d+.
	defb 038h,024h,039h,0a4h,039h,024h,03ah,0a4h,03ah,024h,03bh,0e4h,048h,0e4h,049h,0e4h	; a8d0  8$9.9$:.:$..H.I.
	defb 04ah,0ffh,002h,039h,082h,031h,0c6h,019h,000h,0ffh,0ffh,0ffh,008h,022h,000h,0ffh	; a8e0  J..9.1......."..
	defb 00ah,025h,0ffh,084h,017h,000h,000h,0e5h,045h,000h,0c5h,048h,000h,0ffh,052h,014h	; a8f0  .%......E..H..R.
	defb 042h,022h,082h,01ah,0c2h,022h,002h,01bh,042h,023h,085h,017h,0ffh,000h,0e4h,052h	; a900  B"..."..B#.....R
	defb 0ffh,0e4h,002h,0e5h,015h,000h,0a5h,000h,048h,017h,006h,02dh,002h,037h,0ffh,0a1h	; a910  ........H..-.7..
	defb 05ch,000h,02fh,010h,0a4h,013h,0ffh,024h,010h,000h,0ach,024h,0ffh,02eh,017h,0e4h	; a920  \./....$...$....
	defb 04eh,000h,000h,034h,010h,0c9h,018h,046h,035h,045h,042h,0c7h,02ah,049h,013h,0b4h	; a930  N..4...F5EB.*I..
	defb 013h,0ffh,034h,010h,0c5h,014h,042h,019h,0c3h,01ah,047h,013h,0b4h,013h,085h,04ch	; a940  ..4...B...G....L
	defb 083h,042h,003h,04bh,041h,05eh,0ffh,037h,000h,0b7h,003h,0c2h,044h,004h,03dh,046h	; a950  .B.KA^.7....D.=F
	defb 035h,048h,026h,088h,01eh,0ffh,037h,000h,0b7h,003h,093h,000h,005h,00dh,043h,00dh	; a960  5H&...7.......C.
	defb 081h,00dh,043h,002h,084h,026h,0c4h,01eh,0c4h,036h,006h,02fh,000h,089h,010h,007h	; a970  ..C..&...6./....
	defb 029h,085h,041h,086h,036h,008h,01fh,0ffh,087h,010h,003h,019h,082h,01ah,005h,017h	; a980  ).A.6...........
	defb 0c3h,048h,043h,041h,0c3h,046h,044h,04fh,003h,045h,0ffh,088h,02dh,007h,00fh,000h	; a990  .HCA.FDO.E..-...
	defb 035h,00ch,0c5h,028h,082h,058h,0c2h,059h,0ffh,0cah,03ah,082h,05bh,0ffh,091h,00ch	; a9a0  5..(.X.Y..:.[...
	defb 046h,022h,044h,042h,0b5h,00fh,042h,058h,082h,059h,002h,05bh,0ffh,023h,000h,096h	; a9b0  F"DB..BX.Y.[.#..
	defb 000h,0c5h,001h,0c4h,01dh,0ffh,0c4h,002h,096h,003h,0ffh,056h,000h,08ch,001h,006h	; a9c0  ...........V....
	defb 003h,0b6h,003h,000h,066h,029h,066h,02ah,000h,04ah,020h,08ch,021h,048h,023h,0ffh	; a9d0  ....f)f*.J .!H#.
	defb 044h,011h,008h,022h,047h,041h,005h,04bh,000h,0ffh,0ffh,005h,025h,000h,065h,03eh	; a9e0  D.."GA.K....%.e>
	defb 000h,024h,034h,0ffh,0aeh,027h,000h,08ch,010h,04ah,013h,0e3h,029h,006h,029h,0e5h	; a9f0  .$4..'...J..).).
	defb 039h,046h,040h,086h,043h,000h,0c4h,010h,0e8h,01dh,0ffh,0e4h,01dh,0e8h,03dh,0abh	; aa00  9F@.C.........=.
	defb 023h,004h,013h,000h,0a4h,02eh,028h,02fh,0ffh,02ah,02eh,0b0h,015h,000h,0ffh,0ffh	; aa10  #.....(/.*......
	defb 0ffh,0ffh,0c3h,00ch,003h,019h,043h,025h,000h,000h,01ch,022h,063h,063h,063h,022h	; aa20  ......C%..."ccc"
	defb 01ch,000h,018h,038h,018h,018h,018h,018h,07eh,000h,03eh,063h,003h,00eh,03ch,070h	; aa30  ...8....~.>c..<p
	defb 07fh,000h,03eh,063h,003h,00eh,003h,063h,03eh,000h,00eh,01eh,036h,066h,066h,07fh	; aa40  ..>c...c>...6ff.
	defb 006h,000h,07fh,060h,07eh,063h,003h,063h,03eh,000h,03eh,063h,060h,07eh,063h,063h	; aa50  ...`~c.c>.>c`~cc
	defb 03eh,000h,07fh,063h,006h,00ch,018h,018h,018h,000h,03eh,063h,063h,03eh,063h,063h	; aa60  >..c......>cc>cc
	defb 03eh,000h,03eh,063h,063h,03fh,003h,063h,03eh,03ch,042h,099h,0a1h,0a1h,099h,042h	; aa70  >.>cc?.c><B....B
	defb 03ch,000h,018h,018h,018h,018h,018h,000h,018h,000h,000h,000h,000h,000h,000h,000h	; aa80  <...............
	defb 000h,000h,01ch,036h,063h,063h,07fh,063h,063h,000h,07eh,063h,063h,07eh,063h,063h	; aa90  ...6cc.cc.~cc~cc
	defb 07eh,000h,03eh,063h,060h,060h,060h,063h,03eh,000h,07ch,066h,063h,063h,063h,066h	; aaa0  ~.>c```c>.|fcccf
	defb 07ch,000h,07fh,060h,060h,07eh,060h,060h,07fh,000h,07fh,060h,060h,07eh,060h,060h	; aab0  |..``~``...``~``
	defb 060h,000h,03eh,063h,060h,067h,063h,063h,03fh,000h,063h,063h,063h,07fh,063h,063h	; aac0  `.>c`gcc?.ccc.cc
	defb 063h,000h,03ch,018h,018h,018h,018h,018h,03ch,000h,01fh,006h,006h,006h,006h,066h	; aad0  c.<.....<......f
	defb 03ch,000h,063h,066h,06ch,078h,07ch,06eh,067h,000h,060h,060h,060h,060h,060h,060h	; aae0  <.cflx|ng.``````
	defb 07fh,000h,063h,077h,07fh,07fh,06bh,063h,063h,000h,063h,073h,07bh,07fh,06fh,067h	; aaf0  ..cw..kcc.cs{.og
	defb 063h,000h,03eh,063h,063h,063h,063h,063h,03eh,000h,07eh,063h,063h,063h,07eh,060h	; ab00  c.>ccccc>.~ccc~`
	defb 060h,000h,03eh,063h,063h,063h,06fh,066h,03dh,000h,07eh,063h,063h,062h,07ch,066h	; ab10  `.>cccof=.~ccb|f
	defb 063h,000h,03eh,063h,060h,03eh,003h,063h,03eh,000h,07eh,018h,018h,018h,018h,018h	; ab20  c.>c`>.c>.~.....
	defb 018h,000h,063h,063h,063h,063h,063h,063h,03eh,000h,063h,063h,063h,063h,036h,01ch	; ab30  ..cccccc>.cccc6.
	defb 008h,000h,063h,063h,06bh,06bh,07fh,077h,022h,000h,063h,076h,03ch,01ch,01eh,037h	; ab40  ..cckk.w".cv<..7
	defb 063h,000h,066h,066h,07eh,03ch,018h,018h,018h,000h,07fh,007h,00eh,01ch,038h,070h	; ab50  c.ff~<........8p
	defb 07fh,000h,07fh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,07eh,000h,000h	; ab60  .............~..
	defb 000h,000h,03ch,066h,066h,00ch,018h,000h,018h,000h,000h,000h,000h,000h,000h,030h	; ab70  ..<ff..........0
	defb 030h,000h,000h,000h,018h,018h,000h,000h,000h,028h,028h,000h,000h,000h,000h,000h	; ab80  0........((.....
	defb 000h,0ffh,033h,033h,033h,033h,033h,033h,0ffh,0feh,030h,030h,030h,030h,030h,030h	; ab90  ..333333..000000
	defb 0feh,002h,002h,02ah,0aah,02ah,002h,002h,002h,000h,000h,0feh,001h,0feh,000h,000h	; aba0  ...*.*..........
	defb 000h,091h,081h,081h,081h,081h,081h,061h,011h,051h,051h,051h,0f7h,0f1h,0f1h,0f1h	; abb0  .......a.QQQ....
	defb 0f1h,000h,000h,000h,0f0h,00fh,0ffh,0ffh,0afh,0f7h,071h,071h,0afh,0f7h,071h,071h	; abc0  ..........qq..qq
	defb 0afh,0fah,0afh,0afh,0afh,00fh,0ffh,0ffh,0afh,000h,000h,000h,0f0h,000h,000h,000h	; abd0  ................
	defb 000h,000h,000h,000h,000h,0ffh,0ffh,0ffh,000h,0ddh,0ddh,0ddh,0f0h,0bbh,0bbh,0bbh	; abe0  ................
	defb 0bfh,0bbh,0bbh,0bbh,0f0h,0ffh,0ffh,0ffh,000h,000h,000h,000h,000h,000h,000h,000h	; abf0  ................
	defb 000h,048h,020h,0e4h,0efh,000h,0f9h,0efh,0f5h,0f2h,000h,0e2h,0e5h,0f3h,0f4h,000h	; ac00  .H .............
	defb 0dbh,0dbh,0ffh,01dh,0ach,02ah,0ach,04fh,0ach,07ch,0ach,09fh,0ach,020h,090h,0e4h	; ac10  .....*.O.|... ..
	defb 0ebh,0e8h,0e0h,000h,0ebh,0f1h,0f0h,0dbh,0dbh,0ffh,020h,088h,0f0h,0eeh,0f5h,000h	; ac20  .......... .....
	defb 0f0h,0ebh,000h,0f0h,0ddh,0e7h,0e1h,0feh,020h,098h,0ddh,000h,0eah,0e1h,0f3h,000h	; ac30  ........ .......
	defb 0efh,0f0h,0e1h,0ech,0feh,020h,0a8h,0e2h,0ebh,0eeh,0f3h,0ddh,0eeh,0e0h,0ffh,018h	; ac40  ..... ..........
	defb 080h,0e4h,0e1h,0ddh,0f2h,0e1h,0eah,000h,0e7h,0eah,0ebh,0f3h,0efh,0feh,030h,090h	; ac50  ..............0.
	defb 0f3h,0e4h,0e1h,0eah,0feh,020h,0a0h,0f0h,0e4h,0e5h,0efh,000h,0e3h,0ddh,0e9h,0e1h	; ac60  ..... ..........
	defb 0feh,030h,0b0h,0f3h,0e5h,0e8h,0e8h,000h,0e1h,0eah,0e0h,0ffh,012h,088h,0ebh,0e4h	; ac70  .0..............
	defb 0dbh,000h,0e9h,0f5h,000h,0e3h,0ebh,0e0h,0dbh,0feh,020h,098h,0e5h,000h,0deh,0e1h	; ac80  .......... .....
	defb 0e8h,0e5h,0e1h,0f2h,0e1h,0feh,040h,0a8h,0e5h,0eah,000h,0e3h,0ebh,0e0h,0ffh,018h	; ac90  ......@.........
	defb 088h,0ddh,0f0h,000h,0e8h,0ebh,0eah,0e3h,000h,0e8h,0ddh,0efh,0f0h,0feh,030h,098h	; aca0  ..............0.
	defb 0e2h,0e5h,0eah,0ddh,0e8h,0feh,020h,0a8h,0dfh,0ebh,0f1h,0eah,0f0h,000h,0e0h,0ebh	; acb0  ...... .........
	defb 0f3h,0eah,0ffh,048h,048h,0dfh,0ebh,0eah,0e3h,0eeh,0ddh,0f0h,0f1h,0e8h,0ddh,0f0h	; acc0  ...HH...........
	defb 0e5h,0ebh,0eah,0efh,0feh,040h,058h,0f0h,0ebh,000h,0f2h,0e5h,0dfh,0e7h,000h,0f4h	; acd0  .....@X.........
	defb 0fah,0fbh,000h,0dbh,0feh,048h,068h,0f5h,0ebh,0f1h,000h,0e4h,0e1h,0eeh,0ebh,0e5h	; ace0  .....Hh.........
	defb 0dfh,0ddh,0e8h,0e8h,0f5h,0feh,040h,078h,0f1h,0eah,0efh,0e1h,0ddh,0e8h,0e1h,0e0h	; acf0  ......@x........
	defb 000h,0ddh,0e8h,0e8h,000h,0f0h,0e4h,0e1h,0feh,040h,088h,0e8h,0ebh,0dfh,0e7h,0efh	; ad00  .........@......
	defb 0f7h,0ffh,028h,080h,0ddh,0e8h,0e8h,000h,0f5h,0ebh,0f1h,000h,0e4h,0ddh,0f2h,0e1h	; ad10  ..(.............
	defb 000h,0f0h,0ebh,000h,0e0h,0ebh,000h,0eah,0ebh,0f3h,0feh,028h,090h,0e5h,0efh,000h	; ad20  ...........(....
	defb 0f0h,0f1h,0eeh,0eah,000h,0ebh,0e2h,0e2h,000h,0f0h,0e4h,0e1h,000h,0efh,0f3h,0e5h	; ad30  ................
	defb 0dfh,0e4h,0feh,028h,0a0h,0f0h,0ebh,000h,0efh,0ddh,0f2h,0e1h,000h,0f0h,0e4h,0e1h	; ad40  ...(............
	defb 000h,0f3h,0ebh,0eeh,0e8h,0e0h,0f7h,0ffh,048h,0a0h,0ech,0f1h,0efh,0e4h,000h,0efh	; ad50  ........H.......
	defb 0ech,0ddh,0dfh,0e1h,000h,0e7h,0e1h,0f5h,0ffh,060h,0a0h,0e0h,0ddh,0eah,0e3h,0e1h	; ad60  .........`......
	defb 0eeh,000h,0dbh,0dbh,0dbh,0ffh,092h,0adh,09ah,0adh,002h,0aeh,0cbh,0adh,046h,0aeh	; ad70  ..............F.
	defb 05eh,0aeh,078h,0aeh,0c5h,0aeh,088h,0adh,060h,048h,0f0h,0e4h,0e1h,000h,0e1h,0eah	; ad80  ^.x.....`H......
	defb 0e0h,0ffh,068h,048h,0efh,0f0h,0ddh,0e2h,0e2h,0ffh,040h,030h,0ech,0eeh,0ebh,0e3h	; ad90  ..hH......@0....
	defb 0eeh,0ddh,0e9h,0feh,070h,050h,0e5h,0f7h,0ddh,0e7h,0ddh,0e0h,0ddh,0feh,070h,060h	; ada0  ....pP........p`
	defb 0e7h,0f7h,0eah,0ddh,0e3h,0ddh,0e1h,0feh,070h,070h,0f0h,0f7h,0ebh,0e7h,0ddh,0feh	; adb0  ........pp......
	defb 070h,080h,0f0h,0f7h,0ebh,0f0h,0efh,0f1h,0e7h,0ddh,0ffh,040h,030h,0e3h,0eeh,0ddh	; adc0  p..........@0...
	defb 0ech,0e4h,0e5h,0dfh,0feh,070h,050h,0e4h,0f7h,0e9h,0ddh,0e7h,0e5h,0f0h,0ddh,0eah	; add0  .....pP.........
	defb 0e5h,0feh,070h,060h,0e9h,0f7h,0f0h,0ddh,0deh,0ddh,0f0h,0ddh,0feh,070h,070h,0efh	; ade0  ..p`.........pp.
	defb 0f7h,0f1h,0e1h,0eah,0ebh,0feh,070h,080h,0efh,0f7h,0e5h,0f3h,0ddh,0e9h,0ebh,0f0h	; adf0  ......p.........
	defb 0ebh,0ffh,040h,030h,0efh,0ebh,0f1h,0eah,0e0h,0feh,070h,050h,0e7h,0f7h,0f1h,0e1h	; ae00  ..@0......pP....
	defb 0e4h,0ddh,0eeh,0ddh,0feh,070h,060h,0e9h,0f7h,0e5h,0e7h,0ddh,0eeh,0e5h,0e7h,0ebh	; ae10  .....p`.........
	defb 0feh,070h,070h,0f5h,0f7h,0e9h,0ddh,0eah,0eah,0ebh,0feh,070h,080h,0f0h,0f7h,0e2h	; ae20  .pp........p....
	defb 0f1h,0eeh,0f1h,0e7h,0ddh,0f3h,0ddh,0feh,070h,090h,0e7h,0f7h,0f5h,0ddh,0e9h,0ddh	; ae30  ........p.......
	defb 0efh,0e4h,0e5h,0f0h,0ddh,0ffh,040h,030h,0f0h,0e5h,0f0h,0e8h,0e1h,000h,0e0h,0e1h	; ae40  ......@0........
	defb 0efh,0e5h,0e3h,0eah,0feh,070h,050h,0eah,0f7h,0efh,0ddh,0f0h,0ebh,0ffh,040h,030h	; ae50  .....pP.......@0
	defb 0e3h,0ddh,0e9h,0e1h,000h,0e0h,0e1h,0efh,0e5h,0e3h,0eah,0feh,070h,050h,0efh,0f7h	; ae60  ............pP..
	defb 0e5h,0f3h,0ddh,0e9h,0ebh,0f0h,0ebh,0ffh,040h,030h,0efh,0ech,0e1h,0dfh,0e5h,0ddh	; ae70  ........@0......
	defb 0e8h,000h,0f0h,0e4h,0ddh,0eah,0e7h,0efh,0feh,070h,050h,0e4h,0ddh,0e8h,0feh,070h	; ae80  .........pP....p
	defb 060h,0e5h,0e7h,0f1h,0feh,070h,070h,0efh,0ddh,0e8h,0f0h,0feh,070h,080h,0f0h,0e1h	; ae90  `....pp.....p...
	defb 0eeh,0ddh,0feh,070h,090h,0eeh,0ebh,0ebh,0e9h,000h,000h,0d1h,0d0h,0d0h,0d8h,0feh	; aea0  ...p............
	defb 070h,0a0h,0eeh,0ebh,0ebh,0e9h,000h,000h,0d1h,0d0h,0d1h,0d3h,0feh,070h,0b0h,0eeh	; aeb0  p............p..
	defb 0dfh,0d7h,0d2h,0d7h,0ffh,050h,040h,0ech,0eeh,0e1h,0efh,0e1h,0eah,0f0h,0e1h,0e0h	; aec0  .....P@.........
	defb 000h,0deh,0f5h,0feh,068h,050h,0e7h,0ebh,0eah,0ddh,0e9h,0e5h,0ffh,030h,030h,0f0h	; aed0  ....hP.......00.
	defb 0e4h,0ddh,0eah,0e7h,0efh,000h,0f0h,0ebh,000h,0f5h,0ebh,0f1h,0eeh,000h,0dfh,0ebh	; aee0  ................
	defb 0f1h,0eeh,0ddh,0e3h,0e1h,0feh,010h,050h,0f0h,0e4h,0e1h,000h,0f3h,0ebh,0eeh,0e8h	; aef0  .......P........
	defb 0e0h,000h,0e4h,0ddh,0efh,000h,0deh,0e1h,0e1h,0eah,000h,0efh,0ddh,0f2h,0e1h,0e0h	; af00  ................
	defb 000h,0dbh,0dbh,0feh,058h,070h,0f3h,0e1h,0e8h,0e8h,000h,0e0h,0ebh,0eah,0e1h,0f7h	; af10  ....Xp..........
	defb 0ffh,038h,010h,0dfh,0ebh,0eah,0e3h,0eeh,0ddh,0f0h,0f1h,0e8h,0ddh,0f0h,0e5h,0ebh	; af20  .8..............
	defb 0eah,0efh,000h,0dbh,0dbh,0dbh,0ffh,058h,0a0h,0e1h,060h,0a0h,0e8h,068h,0a0h,0e3h	; af30  .......X..`..h..
	defb 070h,0a0h,0e5h,078h,0a0h,0f6h,080h,0a0h,0ddh,088h,0a0h,0f8h,090h,0a0h,0f8h,098h	; af40  p..x............
	defb 0a0h,0f8h,06dh,0afh,07dh,0afh,08eh,0afh,09ah,0afh,0abh,0afh,0bbh,0afh,0cdh,0afh	; af50  ..m.}...........
	defb 050h,08ch,0e4h,0e9h,0f3h,0ebh,000h,0e5h,0f2h,0f2h,0efh,0f2h,0ffh,048h,09ch,0e4h	; af60  P............H..
	defb 0e9h,0f3h,0ebh,000h,0e9h,0efh,000h,0e5h,0f2h,0f2h,0efh,0f2h,0ffh,048h,09ch,0e6h	; af70  .............H..
	defb 0e9h,0ech,0e5h,000h,0eeh,0efh,0f4h,000h,0e6h,0efh,0f5h,0eeh,0e4h,0ffh,058h,09ch	; af80  ..............X.
	defb 0e4h,0e9h,0f3h,0ebh,000h,0e6h,0f5h,0ech,0ech,0ffh,040h,09ch,0e4h,0e9h,0f3h,0ebh	; af90  ..........@.....
	defb 000h,0eeh,0efh,0f4h,000h,0f2h,0e5h,0e1h,0e4h,0f9h,0ffh,048h,09ch,0f7h,0f2h,0e9h	; afa0  ...........H....
	defb 0f4h,0e5h,000h,0f0h,0f2h,0efh,0f4h,0e5h,0e3h,0f4h,0ffh,048h,09ch,0f4h,0efh,0efh	; afb0  ...........H....
	defb 000h,0edh,0e1h,0eeh,0eeh,0f9h,000h,0e6h,0e9h,0ech,0e5h,0f3h,0ffh,048h,09ch,0e4h	; afc0  .............H..
	defb 0e1h,0f4h,0e1h,0f4h,0f9h,0f0h,0e5h,0e5h,0f2h,0f2h,0efh,0f2h,0ffh,000h,07fh,07fh	; afd0  ................
	defb 07eh,07ch,078h,07eh,07eh,000h,0feh,03eh,03eh,03eh,03eh,03eh,03eh,07eh,07eh,07eh	; afe0  ~|x~~..>>>>>>~~~
	defb 07eh,07eh,07eh,07fh,000h,03eh,03eh,03eh,03eh,03eh,03eh,0feh,000h,000h,07fh,078h	; aff0  ~~~..>>>>>>....x
	defb 070h,071h,071h,07fh,07eh,000h,0feh,01eh,00eh,08eh,08eh,01eh,03eh,07ch,078h,071h	; b000  pqq.~.......>|xq
	defb 071h,070h,070h,07fh,000h,07eh,0feh,0feh,0feh,00eh,00eh,0feh,000h,000h,07fh,078h	; b010  qpp..~.........x
	defb 070h,071h,07fh,07eh,07eh,000h,0feh,01eh,00eh,08eh,08eh,01eh,00eh,07fh,071h,071h	; b020  pq.~~.........qq
	defb 071h,070h,078h,07fh,000h,08eh,08eh,08eh,08eh,00eh,01eh,0feh,000h,000h,07fh,07fh	; b030  qpx.............
	defb 07fh,07eh,07eh,07ch,07dh,000h,0feh,01eh,01eh,01eh,01eh,01eh,01eh,079h,07bh,070h	; b040  .~~|}........y{p
	defb 070h,07fh,07fh,07fh,000h,01eh,01eh,00eh,00eh,01eh,01eh,0feh,000h,000h,07fh,070h	; b050  p..............p
	defb 070h,071h,071h,070h,070h,000h,0feh,00eh,00eh,0feh,0feh,01eh,00eh,071h,07fh,07fh	; b060  pqqpp........q..
	defb 071h,070h,078h,07fh,000h,000h,07fh,078h,070h,071h,071h,070h,070h,000h,0feh,01eh	; b070  qpx....xpqqpp...
	defb 00eh,08eh,0feh,01eh,00eh,071h,071h,071h,071h,070h,078h,07fh,000h,000h,07fh,070h	; b080  .....qqqqpx....p
	defb 070h,07fh,07fh,07fh,07eh,000h,0feh,00eh,00eh,08eh,01eh,01eh,03eh,07eh,07eh,07ch	; b090  p...~.......>~~|
	defb 07ch,07ch,07ch,07fh,000h,03eh,03eh,07eh,07eh,07eh,07eh,0feh,000h,000h,07fh,078h	; b0a0  |||..>>~~~~....x
	defb 070h,071h,071h,078h,070h,000h,07fh,078h,070h,071h,071h,071h,071h,000h,0feh,01eh	; b0b0  pqqxp..xpqqqq...
	defb 00eh,08eh,08eh,08eh,08eh,070h,078h,07fh,071h,070h,078h,07fh,000h,00eh,00eh,08eh	; b0c0  .....px.qpx.....
	defb 08eh,00eh,01eh,0feh,000h,000h,07fh,073h,063h,043h,043h,063h,063h,063h,063h,063h	; b0d0  .......scCCccccc
	defb 063h,063h,063h,07fh,000h,000h,07fh,061h,040h,048h,048h,048h,078h,071h,063h,047h	; b0e0  ccc....a@HHHxqcG
	defb 047h,040h,040h,07fh,000h,000h,0feh,086h,002h,022h,022h,022h,022h,022h,022h,022h	; b0f0  G@@......"""""""
	defb 022h,002h,086h,0feh,000h,000h,0feh,0e6h,0c6h,086h,086h,0c6h,0c6h,0c6h,0c6h,0c6h	; b100  "...............
	defb 0c6h,0c6h,0c6h,0feh,000h,000h,0feh,086h,002h,022h,022h,022h,0e2h,0c6h,08eh,01eh	; b110  ........."""....
	defb 01eh,002h,002h,0feh,000h,000h,0feh,086h,002h,022h,022h,0e2h,0c6h,0c2h,0e2h,022h	; b120  .........""...."
	defb 022h,002h,086h,0feh,000h,000h,0feh,0e6h,0e6h,0c6h,0c6h,086h,0a6h,026h,066h,002h	; b130  "............&f.
	defb 002h,0e6h,0e6h,0feh,000h,000h,0feh,002h,002h,03eh,03eh,006h,002h,0e2h,0e2h,022h	; b140  .........>>...."
	defb 022h,002h,086h,0feh,000h,000h,0feh,086h,002h,022h,03eh,006h,002h,000h,0feh,002h	; b150  "........">.....
	defb 002h,0f2h,0e2h,0e6h,0c6h,0c6h,08eh,08eh,08eh,08eh,08eh,0feh,000h,000h,0feh,086h	; b160  ................
	defb 002h,022h,022h,086h,002h,002h,082h,0e2h,022h,002h,086h,0feh,000h,000h,000h,000h	; b170  ."".....".......
	defb 000h,000h,000h,000h,000h,040h,040h,0f3h,0f4h,0e1h,0f2h,0f4h,000h,000h,0f3h,0e5h	; b180  .....@@.........
	defb 0ech,0e5h,0e3h,0f4h,0feh,080h,050h,0eeh,0efh,0f2h,0edh,0e1h,0ech,0feh,080h,060h	; b190  ......P........`
	defb 0f0h,0e1h,0f3h,0f3h,0f7h,0efh,0f2h,0e4h,0feh,080h,070h,0f3h,0f4h,0e1h,0e7h,0e5h	; b1a0  ..........p.....
	defb 000h,0ech,0efh,0e1h,0e4h,0ffh,000h,000h,000h,03fh,03fh,03fh,000h,000h,000h,000h	; b1b0  .........???....
	defb 000h,000h,000h,000h,000h,000h,000h,080h,0c0h,0e0h,0f0h,0e0h,0c0h,080h,000h,000h	; b1c0  ................
	defb 000h,000h,000h,000h,000h,000h,0aah,0ach,0aah,0cah,0ach,0aah,0cah,0aah,0a9h,09fh	; b1d0  ................
	defb 099h,0f9h,09fh,099h,0f9h,09ah,0a9h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,09ah,0a9h,0ffh	; b1e0  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,09ah,0cfh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fch,0a9h,0ffh	; b1f0  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,09ah,0a9h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,09ah,0cfh,0ffh	; b200  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0fch,0a9h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,09ah,0a9h,0ffh	; b210  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,09ah,0cfh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fch,0a9h,0ffh	; b220  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,09ah,0a9h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,09ah,0cfh,0ffh	; b230  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0fch,0a9h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,09ah,0a9h,0ffh	; b240  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,09ah,068h,020h,0eeh,0e9h,0e3h,0e5h,000h,0dbh,0feh,038h	; b250  ......h .......8
	defb 030h,0ech,0e5h,0f4h,0f3h,000h,0e7h,0efh,000h,0eeh,0e5h,0f8h,0f4h,000h,0f3h,0f4h	; b260  0...............
	defb 0e1h,0e7h,0e5h,0feh,048h,050h,0f3h,0f0h,0e5h,0e3h,0e9h,0e1h,0ech,000h,0e2h,0efh	; b270  ....HP..........
	defb 0eeh,0f5h,0f3h,0ffh,048h,040h,0f3h,0e5h,0e3h,0f2h,0e5h,0f4h,000h,0e3h,0efh,0edh	; b280  ....H@..........
	defb 0edh,0e1h,0eeh,0e4h,0feh,060h,058h,0e6h,0fdh,0fdh,0f4h,0fdh,0fdh,0fdh,0ech,0feh	; b290  .....`X.........
	defb 060h,068h,0fdh,0fdh,0f9h,0fdh,0fdh,0fdh,0fdh,0fdh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b2a0  `h..............
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b2b0  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b2c0  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b2d0  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b2e0  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b2f0  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b300  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b310  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b320  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b330  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b340  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b350  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b360  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b370  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b380  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b390  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b3a0  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b3b0  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b3c0  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b3d0  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b3e0  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b3f0  ................

; ======================================================================
; CODIGO 0xb400..0xb42f  (47 bytes)
; ======================================================================


L_B400:
	ld hl,0b548h		;b400
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
	inc hl			;b413
	ld de,0ef10h		;b414
	ldi		;b417
	xor a			;b419
	ld (de),a			;b41a
	inc de			;b41b
	ld bc,00003h		;b41c
	ldir		;b41f
	ret			;b421
L_B422:
	ld hl,0ef10h		;b422
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
	exx			;b437
	ld a,(0e243h)		;b438   ; lee la pantalla de la fase (desde 1)
	cp (hl)			;b43b
	ret nz			;b43c
	ld a,(0e280h)		;b43d   ; lee el estado del personaje
	dec a			;b440
	ret nz			;b441
	call L_B4AC		;b442
	ret nc			;b445
	ld hl,0ef11h		;b446
	inc (hl)			;b449
	inc l			;b44a
	inc l			;b44b
	inc l			;b44c
	inc l			;b44d
	ld (hl),040h		;b44e
	call 096ffh		;b450   ; devuelve el fondo de los bloques de esta pantalla
	call 090abh		;b453   ; las cosas de la lista 0xEE50 (por numero): lo que habia debajo se devuelve
	call L_B4E3		;b456
	call 090f7h		;b459   ; las de la lista, al reves: guarda el fondo y pinta la cosa
	call 096cfh		;b45c   ; pinta los bloques de esta pantalla
	jp 042efh		;b45f
L_B462:
	ld hl,0ef15h		;b462
	dec (hl)			;b465
	ret nz			;b466
	ld hl,0ef11h		;b467
	inc (hl)			;b46a
	ret			;b46b
L_B46C:
	exx			;b46c
	ld a,(0e243h)		;b46d   ; lee la pantalla de la fase (desde 1)
	cp (hl)			;b470
	ret nz			;b471
	call L_B4C9		;b472
	ret nc			;b475
	call 042bbh		;b476   ; pide el sonido 0x2E
	ld hl,0ef11h		;b479
	inc (hl)			;b47c
	call 096ffh		;b47d   ; devuelve el fondo de los bloques de esta pantalla
	call 090abh		;b480   ; las cosas de la lista 0xEE50 (por numero): lo que habia debajo se devuelve
	call L_B50B		;b483
	call 056c5h		;b486   ; un dibujo de 16 x 16 de 0xB1D6 en la posicion de 0xEF13 (HMMC)
	call 090f7h		;b489   ; las de la lista, al reves: guarda el fondo y pinta la cosa
	jp 096cfh		;b48c
L_B48F:
	exx			;b48f
	ld a,(0e243h)		;b490   ; lee la pantalla de la fase (desde 1)
	cp (hl)			;b493
	ret nz			;b494
	call L_B4C9		;b495
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
	inc l			;b4ac
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
	inc l			;b4c9
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
	ld hl,0ef13h		;b4e3
	call L_B4FC		;b4e6
	ld hl,0ef13h		;b4e9
	ld e,(hl)			;b4ec
	inc l			;b4ed
	ld d,(hl)			;b4ee
	ld hl,0b4f8h		;b4ef
	ld bc,00202h		;b4f2
	jp 0573bh		;b4f5

; ----------------------------------------------------------------------
; DATOS resto_B4F8: lo apuntan con el banco puesto p12:B4EF (0xB4F8); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p12:B4EF (4 bytes)
;   0xb4f8..0xb4fc  (4 bytes)
DATA_resto_B4F8:
	defb 0cah,0cbh,0cch,0cdh	; b4f8

; ======================================================================
; CODIGO 0xb4fc..0xb548  (76 bytes)
; ======================================================================


L_B4FC:
	ld a,(hl)			;b4fc
	inc l			;b4fd
	ld h,(hl)			;b4fe
	ld l,a			;b4ff
	ld de,000b0h		;b500
	ld bc,01010h		;b503
	ld a,004h		;b506
	jp 05029h		;b508
L_B50B:
	ld hl,0ef13h		;b50b
	ld e,(hl)			;b50e
	inc l			;b50f
	ld d,(hl)			;b510
	ld hl,000b0h		;b511
	ld bc,01010h		;b514
	ld a,001h		;b517
	jp 05029h		;b519
L_B51C:
	ld hl,0ef10h		;b51c
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
	call L_B53A		;b534
	jp 0583bh		;b537
L_B53A:
	ld ix,0ef10h		;b53a
	ld a,(ix+000h)		;b53e
	dec a			;b541
	jp z,L_B917		;b542
	jp L_B6B0		;b545

; ----------------------------------------------------------------------
; DATOS resto_B548: lo apuntan con el banco puesto p12:B400 (0xB548), p12:B932
;   (0xB585), p12:B743 (0xB5B8), p12:B897 (0xB5C7), p12:B701 (0xB5E0),
;   p12:B7EE (0xB64C); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p12:B400, p12:B932, p12:B743, p12:B897, p12:B701,
;   p12:B7EE (360 bytes)
;   0xb548..0xb6b0  (360 bytes)
DATA_resto_B548:
	defb 007h,001h,002h,008h,008h,014h,002h,002h,088h,030h,018h,001h,004h,028h,0e0h,01dh	; b548  .........0...(..
	defb 002h,001h,0a8h,0e0h,020h,001h,003h,080h,030h,023h,002h,003h,018h,0d8h,028h,001h	; b558  .... ...0#....(.
	defb 001h,080h,070h,02bh,002h,001h,0a0h,098h,032h,001h,002h,0a8h,018h,034h,002h,001h	; b568  ..p+....2....4..
	defb 0a8h,0e0h,035h,001h,003h,038h,0b0h,037h,002h,002h,078h,0c0h,000h,050h,018h,0f3h	; b578  ..5..8.7..x..P..
	defb 0efh,0f5h,0eeh,0e4h,000h,0f3h,0e5h,0ech,0e5h,0e3h,0f4h,0feh,040h,0a8h,0f3h,0e5h	; b588  ............@...
	defb 0ech,0e5h,0e3h,0f4h,000h,0fch,0fch,0fch,000h,0f3h,0f0h,0e1h,0e3h,0e5h,0feh,058h	; b598  ...............X
	defb 0b8h,0e5h,0eeh,0e4h,000h,0fch,0fch,0fch,000h,0f2h,0e5h,0f4h,0f5h,0f2h,0eeh,0ffh	; b5a8  ................
	defb 050h,018h,0f0h,0f5h,0fah,0fah,0ech,0e5h,000h,000h,0e7h,0e1h,0edh,0e5h,0ffh,060h	; b5b8  P..............`
	defb 090h,0e1h,0ech,0ech,000h,0f2h,0e9h,0e7h,0e8h,0f4h,0feh,060h,0a0h,0f2h,0e5h,0f3h	; b5c8  ...........`....
	defb 0f4h,000h,000h,0d3h,000h,0f5h,0f0h,0ffh,0e8h,0b5h,001h,0b6h,01ah,0b6h,033h,0b6h	; b5d8  ..............3.
	defb 00bh,011h,017h,004h,012h,00ah,001h,00ch,00dh,013h,007h,016h,009h,018h,00eh,015h	; b5e8  ................
	defb 008h,014h,003h,000h,006h,002h,010h,005h,00fh,004h,012h,00fh,00bh,003h,008h,018h	; b5f8  ................
	defb 017h,007h,013h,010h,005h,00ch,000h,00eh,015h,016h,011h,006h,00ah,001h,009h,00dh	; b608  ................
	defb 014h,002h,007h,014h,00bh,010h,018h,012h,001h,006h,00ch,005h,008h,015h,00ah,011h	; b618  ................
	defb 00dh,00eh,016h,002h,009h,000h,013h,00fh,017h,003h,004h,00fh,004h,008h,002h,00bh	; b628  ................
	defb 000h,00dh,016h,00eh,013h,006h,00ch,007h,012h,015h,014h,017h,011h,018h,00ah,005h	; b638  ................
	defb 010h,003h,009h,001h,035h,035h,035h,035h,001h,002h,003h,004h,005h,006h,007h,008h	; b648  ....5555........
	defb 009h,00ah,00bh,00ch,00dh,00eh,00fh,010h,011h,012h,013h,00ch,014h,015h,016h,00ch	; b658  ................
	defb 017h,018h,019h,01ah,01bh,00ah,016h,00ch,01ch,01dh,01eh,01fh,020h,024h,021h,025h	; b668  ............ $!%
	defb 020h,026h,021h,027h,020h,028h,021h,029h,020h,02ah,021h,02bh,020h,02ch,021h,02dh	; b678   &!' (!) *!+ ,!-
	defb 020h,02eh,021h,02fh,020h,030h,021h,025h,020h,031h,021h,032h,020h,033h,021h,025h	; b688   .!/ 0!% 1!2 3!%
	defb 020h,024h,021h,034h,022h,024h,023h,025h,022h,026h,023h,027h,022h,028h,023h,029h	; b698   $!4"$#%"&#'"(#)
	defb 022h,02ah,023h,02bh,022h,02ch,023h,02dh	; b6a8  "*#+",#-

; ======================================================================
; CODIGO 0xb6b0..0xb6be  (14 bytes)
; ======================================================================


L_B6B0:
	ld a,(0e20ch)		;b6b0   ; lee las teclas: lo que se acaba de pulsar (bit 0 pausa, 1 recuadro, 3 musica, 4 disparo)
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
	call 04e98h		;b6ca   ; pantalla en negro: quita sprites, borra la pagina y apaga la pantalla
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
	call L_B71E		;b6e3
	ld hl,0b8afh		;b6e6
	call 051d0h		;b6e9   ; pinta un letrero: [D][E] y caracteres; 0xFE trae otra posicion; 0xFF acaba
	inc (ix+001h)		;b6ec
	jp 0420dh		;b6ef
L_B6F2:
	ld a,(0e207h)		;b6f2   ; lee el mando: lo que se acaba de pulsar
	and 010h		;b6f5
	ret z			;b6f7
	inc (ix+001h)		;b6f8
	ld hl,0b8beh		;b6fb
	jp 051d4h		;b6fe
L_B701:
	ld hl,0b5e0h		;b701
	ld a,(0e203h)		;b704   ; lee la cuenta de cuadros
	and 003h		;b707
	call 04d4ch		;b709   ; HL = la palabra A de la tabla de HL
	ld de,0ef20h		;b70c
	ld bc,00019h		;b70f
	ldir		;b712
	inc (ix+001h)		;b714
	xor a			;b717
	ld (ix+002h),a		;b718
	ld (ix+003h),a		;b71b
L_B71E:
	ld hl,0ef20h		;b71e
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
	ld a,(hl)			;b72d
	call L_B7EC		;b72e
	pop hl			;b731
	inc hl			;b732
	pop de			;b733
	ld a,d			;b734
	add a,010h		;b735
	ld d,a			;b737
	pop bc			;b738
	djnz L_B72A		;b739
	pop de			;b73b
	ld a,e			;b73c
	add a,010h		;b73d
	ld e,a			;b73f
	pop bc			;b740
	djnz L_B727		;b741
	ld hl,0b5b8h		;b743
	jp 051d0h		;b746
L_B749:
	call L_B8CF		;b749
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
	call L_B7FA		;b78a
	ret z			;b78d
	push hl			;b78e
	push bc			;b78f
	call L_B824		;b790
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
	ex de,hl			;b7ad
	ld (hl),000h		;b7ae
	inc hl			;b7b0
	ld (hl),b			;b7b1
	inc (ix+003h)		;b7b2
	ld a,b			;b7b5
	jr L_B7C5		;b7b6
L_B7B8:
	ex de,hl			;b7b8
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
	call L_B80F		;b7c8
	pop af			;b7cb
	call L_B7EC		;b7cc
	pop bc			;b7cf
	pop de			;b7d0
	ret			;b7d1
L_B7D2:
	ex de,hl			;b7d2
	ld (hl),000h		;b7d3
	inc hl			;b7d5
	inc hl			;b7d6
	inc hl			;b7d7
	inc hl			;b7d8
	inc hl			;b7d9
	ld (hl),b			;b7da
	inc (ix+002h)		;b7db
	ld a,b			;b7de
	jr L_B7C5		;b7df
L_B7E1:
	ex de,hl			;b7e1
	ld (hl),000h		;b7e2
	dec hl			;b7e4
	ld (hl),b			;b7e5
	dec (ix+003h)		;b7e6
	ld a,b			;b7e9
	jr L_B7C5		;b7ea
L_B7EC:
	add a,a			;b7ec
	add a,a			;b7ed
	ld hl,0b64ch		;b7ee
	call 0408fh		;b7f1   ; suma A a HL (HL = HL + A)
	ld bc,00202h		;b7f4
	jp 05737h		;b7f7
L_B7FA:
	ld d,(ix+002h)		;b7fa
	ld e,(ix+003h)		;b7fd
L_B800:
	ld a,d			;b800
	add a,a			;b801
	add a,a			;b802
	add a,d			;b803
	add a,e			;b804
	ld hl,0ef20h		;b805
	call 0408fh		;b808   ; suma A a HL (HL = HL + A)
	ld a,(hl)			;b80b
	ld b,a			;b80c
	and a			;b80d
	ret			;b80e
L_B80F:
	ld a,(ix+002h)		;b80f
	add a,a			;b812
	add a,a			;b813
	add a,a			;b814
	add a,a			;b815
	add a,030h		;b816
	ld e,a			;b818
	ld a,(ix+003h)		;b819
	add a,a			;b81c
	add a,a			;b81d
	add a,a			;b81e
	add a,a			;b81f
	add a,058h		;b820
	ld d,a			;b822
	ret			;b823
L_B824:
	ld d,(ix+002h)		;b824
	ld e,(ix+003h)		;b827
	ld c,001h		;b82a
	ld a,d			;b82c
	and a			;b82d
	jr z,L_B837		;b82e
	push de			;b830
	dec d			;b831
	call L_B800		;b832
	pop de			;b835
	ret z			;b836
L_B837:
	inc c			;b837
	ld a,d			;b838
	cp 004h		;b839
	jr nc,L_B844		;b83b
	push de			;b83d
	inc d			;b83e
	call L_B800		;b83f
	pop de			;b842
	ret z			;b843
L_B844:
	inc c			;b844
	ld a,e			;b845
	and a			;b846
	jr z,L_B850		;b847
	push de			;b849
	dec e			;b84a
	call L_B800		;b84b
	pop de			;b84e
	ret z			;b84f
L_B850:
	inc c			;b850
	ld a,e			;b851
	cp 004h		;b852
	jr nc,L_B85B		;b854
	inc e			;b856
	call L_B800		;b857
	ret z			;b85a
L_B85B:
	ld c,000h		;b85b
	ret			;b85d
L_B85E:
	ld de,0ef20h		;b85e
	ld hl,0ef21h		;b861
	ld a,(de)			;b864
	cp 001h		;b865
	jr nz,L_B876		;b867
L_B869:
	ld a,(de)			;b869
	inc a			;b86a
	cp (hl)			;b86b
	jr nz,L_B876		;b86c
	cp 018h		;b86e
	jr z,L_B87A		;b870
	inc de			;b872
	inc hl			;b873
	jr L_B869		;b874
L_B876:
	dec (ix+001h)		;b876
	ret			;b879
L_B87A:
	call 05d41h		;b87a   ; los atributos de los sprites (0xE800, 0x80 bytes) a 0xE0: fuera de la pantalla
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
	ld a,(0e207h)		;b89d   ; lee el mando: lo que se acaba de pulsar
	and 010h		;b8a0
	ret z			;b8a2
L_B8A3:
	ld bc,00007h		;b8a3
	ld (ix+000h),b		;b8a6
	call 00047h		;b8a9   ; BIOS WRTVDP - Writes data in the VDP-register
	jp 041e0h		;b8ac

; ----------------------------------------------------------------------
; DATOS resto_B8AF: lo apuntan con el banco puesto p12:B6E6 (0xB8AF), p12:B891
;   (0xB8AF), p12:B6FB (0xB8BE); el tamano es lo que hay hasta lo siguiente,
;   no sale de recorrerlo; lo leen p12:B6E6, p12:B891, p12:B6FB (32 bytes)
;   0xb8af..0xb8cf  (32 bytes)
DATA_resto_B8AF:
	defb 050h,0a0h,0e5h,0eeh,0e4h,000h,000h,0e5h,0f3h,0e3h,000h,0ebh,0e5h,0f9h,0feh,048h	; b8af  P..............H
	defb 090h,0f0h,0f5h,0f3h,0e8h,000h,0f3h,0f0h,0e1h,0e3h,0e5h,000h,0ebh,0e5h,0f9h,0ffh	; b8bf  ................

; ======================================================================
; CODIGO 0xb8cf..0xb913  (68 bytes)
; ======================================================================


L_B8CF:
	ld hl,0e800h		;b8cf   ; apunta a los atributos de los sprites (y, x, dibujo, color); al cargar graficos, su bufer
	ld de,0b913h		;b8d2
	ld bc,00400h		;b8d5
	exx			;b8d8
	ld hl,0d200h		;b8d9   ; apunta a los colores de los sprites (16 bytes por sprite)
	exx			;b8dc
L_B8DD:
	push bc			;b8dd
	ld a,(ix+002h)		;b8de
	add a,a			;b8e1
	add a,a			;b8e2
	add a,a			;b8e3
	add a,a			;b8e4
	add a,034h		;b8e5
	ld c,a			;b8e7
	ld a,b			;b8e8
	cp 003h		;b8e9
	jr nc,L_B8F1		;b8eb
	ld a,c			;b8ed
	add a,010h		;b8ee
	ld c,a			;b8f0
L_B8F1:
	ld (hl),c			;b8f1
	inc hl			;b8f2
	ld a,(ix+003h)		;b8f3
	add a,a			;b8f6
	add a,a			;b8f7
	add a,a			;b8f8
	add a,a			;b8f9
	add a,05ch		;b8fa
	ld (hl),a			;b8fc
	pop bc			;b8fd
	inc hl			;b8fe
	ld (hl),c			;b8ff
	ld a,c			;b900
	add a,004h		;b901
	ld c,a			;b903
	inc hl			;b904
	inc hl			;b905
	ld a,(de)			;b906
	inc de			;b907
	exx			;b908
	ld b,010h		;b909
L_B90B:
	ld (hl),a			;b90b
	inc hl			;b90c
	djnz L_B90B		;b90d
	exx			;b90f
	djnz L_B8DD		;b910
	ret			;b912

; ----------------------------------------------------------------------
; DATOS resto_B913: lo apuntan con el banco puesto p12:B8D2 (0xB913); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p12:B8D2 (4 bytes)
;   0xb913..0xb917  (4 bytes)
DATA_resto_B913:
	defb 00dh,04eh,00dh,04eh	; b913

; ======================================================================
; CODIGO 0xb917..0xb98a  (115 bytes)
; ======================================================================


L_B917:
	ld a,(ix+001h)		;b917
	cp 001h		;b91a
	jr z,L_B938		;b91c
	jr nc,L_B981		;b91e
	call 04e98h		;b920   ; pantalla en negro: quita sprites, borra la pagina y apaga la pantalla
	call 057ach		;b923   ; los graficos de la lista 0xB7DF (bancos 7-8-9) y la paleta de 0xBA78
	call 057cah		;b926   ; las rachas de 0xBA9A a 0xF800 (dibujos de los sprites)
	call 0578dh		;b929   ; un dibujo de caracteres de 0xBC05 en 0x1830 (13 x 26), con la pantalla apagada
	call 05d41h		;b92c   ; los atributos de los sprites (0xE800, 0x80 bytes) a 0xE0: fuera de la pantalla
	inc (ix+001h)		;b92f
	ld hl,0b585h		;b932
	jp 051d0h		;b935
L_B938:
	call L_B9B0		;b938
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
	dec (ix+001h)		;b981
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
	ld hl,0e800h		;b9b0   ; apunta a los atributos de los sprites (y, x, dibujo, color); al cargar graficos, su bufer
	ld de,0ba0dh		;b9b3
	ld bc,00400h		;b9b6
	exx			;b9b9
	ld hl,0d200h		;b9ba   ; apunta a los colores de los sprites (16 bytes por sprite)
	exx			;b9bd
L_B9BE:
	push bc			;b9be
	ld a,(ix+002h)		;b9bf
	exx			;b9c2
	ld de,0b9fah		;b9c3
	add a,e			;b9c6
	ld e,a			;b9c7
	jr nc,L_B9CB		;b9c8
	inc d			;b9ca
L_B9CB:
	ld a,(de)			;b9cb
	exx			;b9cc
	push af			;b9cd
	rra			;b9ce
	ld c,078h		;b9cf
	jr nc,L_B9D5		;b9d1
	ld c,060h		;b9d3
L_B9D5:
	ld a,b			;b9d5
	cp 003h		;b9d6
	jr nc,L_B9DE		;b9d8
	ld a,c			;b9da
	add a,010h		;b9db
	ld c,a			;b9dd
L_B9DE:
	ld (hl),c			;b9de
	pop af			;b9df
	inc hl			;b9e0
	and 0feh		;b9e1
	ld (hl),a			;b9e3
	pop bc			;b9e4
	inc hl			;b9e5
	ld (hl),c			;b9e6
	ld a,c			;b9e7
	add a,004h		;b9e8
	ld c,a			;b9ea
	inc hl			;b9eb
	inc hl			;b9ec
	ld a,(de)			;b9ed
	inc de			;b9ee
	exx			;b9ef
	ld b,010h		;b9f0
L_B9F2:
	ld (hl),a			;b9f2
	inc hl			;b9f3
	djnz L_B9F2		;b9f4
	exx			;b9f6
	djnz L_B9BE		;b9f7
	ret			;b9f9

; ----------------------------------------------------------------------
; DATOS resto_B9FA: lo apuntan con el banco puesto p12:B9C3 (0xB9FA), p12:B9B3
;   (0xBA0D); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p12:B9C3, p12:B9B3 (23 bytes)
;   0xb9fa..0xba11  (23 bytes)
DATA_resto_B9FA:
	defb 02ch,033h,03ch,045h,04ch,055h,05ch,06ch,073h,07ch,085h,08ch,09ch,0a3h,0ach,0b5h	; b9fa  ,3<ELU\ls|......
	defb 0bch,0c5h,0cch,00dh,04eh,00dh,04eh	; ba0a

; ======================================================================
; CODIGO 0xba11..0xba3b  (42 bytes)
; ======================================================================


L_BA11:
	ld hl,001ffh		;ba11
	ld (0e209h),hl		;ba14
	ld hl,0e219h		;ba17
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
	xor a			;ba2d
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
	ld a,(0e248h)		;ba41   ; lee el borde por el que se sale de la pantalla (1 arriba, 2 abajo, 3 izquierda, 4 derecha)
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
	xor a			;ba57
	ld (0e24dh),a		;ba58   ; guarda la marca de borde sin pantalla al otro lado
	call 05dfeh		;ba5b   ; pasa a la pantalla de al lado al salir por el borde 0xE248 (1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ld a,(0e24dh)		;ba5e   ; lee la marca de borde sin pantalla al otro lado
	and a			;ba61
	ret nz			;ba62
	jp 04369h		;ba63
L_BA66:
	ld hl,0e20ah		;ba66
	dec (hl)			;ba69
	jr nz,L_BA7A		;ba6a
	dec hl			;ba6c
	inc (hl)			;ba6d
	inc hl			;ba6e
	call L_BA80		;ba6f
	cp 0ffh		;ba72
	jr z,L_BA50		;ba74
	ld hl,0e20ah		;ba76
	ld (hl),c			;ba79
L_BA7A:
	call L_BA80		;ba7a
	jp 05434h		;ba7d
L_BA80:
	dec hl			;ba80
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
; DATOS sin identificar  0xba94..0xbc6e  (474 bytes)
DATA_BA94:
	defb 0a0h,0bah,0d6h,0bah,014h,0bbh,05ah,0bbh,0bah,0bbh,016h,0bch,02eh,000h,00fh,008h	; ba94  ......Z.........
	defb 010h,000h,00dh,004h,011h,000h,037h,008h,01bh,000h,019h,008h,011h,000h,010h,008h	; baa4  ......7.........
	defb 00dh,000h,043h,008h,00ch,000h,058h,004h,013h,000h,003h,008h,008h,000h,009h,010h	; bab4  ..C...X.........
	defb 012h,000h,039h,008h,015h,000h,01fh,004h,047h,000h,010h,004h,00eh,000h,009h,008h	; bac4  ..9.....G.......
	defb 000h,0ffh,029h,000h,090h,004h,01bh,000h,0adh,008h,01ah,000h,003h,008h,00bh,000h	; bad4  ..).............
	defb 018h,001h,00ah,000h,019h,008h,008h,000h,023h,001h,006h,000h,004h,004h,00dh,000h	; bae4  ........#.......
	defb 00dh,010h,033h,000h,00eh,008h,00ah,000h,01eh,004h,008h,000h,017h,001h,004h,000h	; baf4  ..3.............
	defb 00dh,004h,00dh,000h,01eh,010h,02fh,000h,06ch,004h,042h,000h,030h,004h,000h,0ffh	; bb04  ....../.l.B.0...
	defb 036h,000h,02dh,004h,008h,014h,01ah,004h,010h,000h,02dh,008h,002h,009h,033h,001h	; bb14  6.-.......-...3.
	defb 001h,009h,072h,008h,014h,000h,032h,002h,011h,000h,01ah,008h,00ah,018h,01eh,008h	; bb24  ..r...2.........
	defb 006h,000h,032h,004h,007h,000h,008h,008h,00dh,000h,008h,010h,037h,000h,051h,008h	; bb34  ..2.........7.Q.
	defb 002h,009h,024h,001h,008h,000h,012h,008h,002h,018h,016h,008h,001h,009h,028h,001h	; bb44  ..$...........(.
	defb 001h,005h,0a0h,004h,000h,0ffh,041h,000h,040h,004h,001h,000h,0a4h,008h,002h,00ah	; bb54  ......A.@.......
	defb 015h,002h,006h,000h,01eh,004h,001h,006h,00bh,002h,001h,006h,00fh,004h,001h,006h	; bb64  ................
	defb 00ch,002h,001h,006h,00fh,004h,001h,006h,00ch,002h,002h,006h,00eh,004h,001h,006h	; bb74  ................
	defb 00bh,002h,002h,006h,015h,004h,001h,006h,00eh,002h,001h,006h,016h,004h,00fh,000h	; bb84  ................
	defb 013h,004h,007h,000h,001h,004h,003h,000h,002h,004h,01fh,000h,01eh,004h,01dh,000h	; bb94  ................
	defb 005h,004h,009h,014h,001h,004h,00eh,000h,006h,014h,05eh,004h,013h,000h,037h,008h	; bba4  ..........^...7.
	defb 002h,018h,012h,010h,000h,0ffh,036h,000h,051h,004h,033h,000h,006h,010h,02eh,000h	; bbb4  ......6.Q.3.....
	defb 084h,004h,00dh,000h,007h,010h,012h,000h,00eh,008h,009h,000h,019h,001h,00ch,008h	; bbc4  ................
	defb 018h,001h,005h,000h,008h,004h,001h,005h,014h,001h,002h,000h,008h,008h,001h,000h	; bbd4  ................
	defb 015h,001h,032h,004h,00ah,000h,019h,004h,007h,000h,00dh,010h,022h,000h,012h,004h	; bbe4  ..2........."...
	defb 00eh,000h,012h,004h,004h,014h,00dh,004h,004h,014h,007h,004h,00fh,000h,00fh,008h	; bbf4  ................
	defb 007h,018h,00dh,008h,01dh,000h,015h,008h,043h,000h,00fh,004h,001h,000h,025h,008h	; bc04  ........C.....%.
	defb 000h,0ffh,040h,000h,032h,008h,004h,000h,013h,004h,00ah,000h,04dh,002h,003h,000h	; bc14  ..@.2.......M...
	defb 009h,004h,00bh,000h,026h,004h,00bh,014h,01bh,004h,006h,014h,010h,004h,005h,014h	; bc24  ....&...........
	defb 00dh,004h,01dh,000h,008h,004h,004h,014h,028h,004h,007h,014h,013h,004h,028h,000h	; bc34  ........(.....(.
	defb 045h,004h,00eh,000h,004h,004h,00eh,000h,01dh,004h,00bh,000h,014h,010h,01ch,000h	; bc44  E...............
	defb 029h,004h,005h,014h,00bh,004h,005h,014h,019h,004h,003h,014h,022h,004h,006h,014h	; bc54  )..........."...
	defb 005h,004h,033h,000h,00bh,018h,008h,008h,000h,0ffh	; bc64  ..3.......

; ======================================================================
; CODIGO 0xbc6e..0xbd97  (297 bytes)
; ======================================================================


L_BC6E:
	xor a			;bc6e
	ld hl,0e910h		;bc6f
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
	ld a,(0e902h)		;bc86
	or a			;bc89
	ret nz			;bc8a
	ld hl,0e900h		;bc8b   ; apunta a el mapa de la fase: 0xC0 bytes por pantalla, 4 casillas por byte
	dec (hl)			;bc8e
	ret nz			;bc8f
	ld (hl),002h		;bc90
	ld ix,0e910h		;bc92
	ld b,020h		;bc96
L_BC98:
	ld a,(ix+000h)		;bc98
	or a			;bc9b
	jr z,L_BCA6		;bc9c
	ld de,00010h		;bc9e
	add ix,de		;bca1
	djnz L_BC98		;bca3
	ret			;bca5
L_BCA6:
	xor a			;bca6
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
	call L_BD74		;bcc2
	ld (ix+005h),l		;bcc5
	ld (ix+006h),h		;bcc8
	ld (ix+007h),e		;bccb
	ld (ix+008h),d		;bcce
	ret			;bcd1
L_BCD2:
	call L_BC86		;bcd2
	call L_BD30		;bcd5
	call L_BCDD		;bcd8
	jr L_BD4B		;bcdb
L_BCDD:
	ld ix,0e910h		;bcdd
	ld b,020h		;bce1
L_BCE3:
	ld a,(ix+000h)		;bce3
	or a			;bce6
	push bc			;bce7
	call nz,L_BCF4		;bce8
	pop bc			;bceb
	ld de,00010h		;bcec
	add ix,de		;bcef
	djnz L_BCE3		;bcf1
	ret			;bcf3
L_BCF4:
	ld e,(ix+001h)		;bcf4
	ld d,(ix+002h)		;bcf7
	ld l,(ix+005h)		;bcfa
	ld h,(ix+006h)		;bcfd
	add hl,de			;bd00
	ld (ix+001h),l		;bd01
	ld (ix+002h),h		;bd04
	ld e,(ix+003h)		;bd07
	ld d,(ix+004h)		;bd0a
	ld l,(ix+007h)		;bd0d
	ld h,(ix+008h)		;bd10
	add hl,de			;bd13
	ld (ix+003h),l		;bd14
	ld (ix+004h),h		;bd17
	ld a,(ix+002h)		;bd1a
	add a,010h		;bd1d
	cp 020h		;bd1f
	jr c,L_BD2B		;bd21
	ld a,(ix+004h)		;bd23
	add a,010h		;bd26
	cp 020h		;bd28
	ret nc			;bd2a
L_BD2B:
	ld (ix+000h),000h		;bd2b
	ret			;bd2f
L_BD30:
	ld hl,0e800h		;bd30   ; apunta a los atributos de los sprites (y, x, dibujo, color); al cargar graficos, su bufer
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
	ld ix,0e910h		;bd4b
	ld hl,0e800h		;bd4f   ; apunta a los atributos de los sprites (y, x, dibujo, color); al cargar graficos, su bufer
	ld b,020h		;bd52
L_BD54:
	ld a,(ix+000h)		;bd54
	or a			;bd57
	push bc			;bd58
	call nz,L_BD65		;bd59
	pop bc			;bd5c
	ld de,00010h		;bd5d
	add ix,de		;bd60
	djnz L_BD54		;bd62
	ret			;bd64
L_BD65:
	ld a,(ix+002h)		;bd65
	ld (hl),a			;bd68
	inc hl			;bd69
	ld a,(ix+004h)		;bd6a
	ld (hl),a			;bd6d
	inc hl			;bd6e
	ld (hl),0d0h		;bd6f
	inc hl			;bd71
	inc hl			;bd72
	ret			;bd73
L_BD74:
	push af			;bd74
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
; DATOS resto_BD97: lo apuntan con el banco puesto p12:BD87 (0xBD97), p12:BD75
;   (0xBDB7); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p12:BD87, p12:BD75 (64 bytes)
;   0xbd97..0xbdd7  (64 bytes)
DATA_resto_BD97:
	defb 000h,000h,023h,0ffh,080h,000h,04bh,0ffh,080h,0ffh,000h,001h,080h,000h,023h,0ffh	; bd97  ..#...K.......#.
	defb 0ddh,000h,04bh,0ffh,080h,0ffh,000h,000h,0b5h,000h,000h,0ffh,0b5h,000h,0ddh,000h	; bda7  ..K.............
	defb 000h,001h,080h,0ffh,023h,0ffh,0b5h,000h,023h,0ffh,000h,000h,0ddh,000h,080h,000h	; bdb7  ....#...#.......
	defb 080h,0ffh,04bh,0ffh,0ddh,000h,000h,0ffh,0b5h,000h,000h,000h,04bh,0ffh,080h,000h	; bdc7  ..K.........K...

; ======================================================================
; CODIGO 0xbdd7..0xbe67  (144 bytes)
; ======================================================================


L_BDD7:
	call L_BDF7		;bdd7
L_BDDA:
	ld hl,0e830h		;bdda
	ld a,(0edcbh)		;bddd
	ld (hl),a			;bde0
	inc hl			;bde1
	ld a,(0edcch)		;bde2
	ld (hl),a			;bde5
	inc hl			;bde6
	ld (hl),0d0h		;bde7
	ld hl,0d2c0h		;bde9
	ld de,0d2c1h		;bdec
	ld bc,0000fh		;bdef
	ld (hl),007h		;bdf2
	ldir		;bdf4
	ret			;bdf6
L_BDF7:
	ld a,(0edd8h)		;bdf7
	or a			;bdfa
	ld a,004h		;bdfb
	jr z,L_BE01		;bdfd
	ld a,034h		;bdff
L_BE01:
	ld hl,0e800h		;be01   ; apunta a los atributos de los sprites (y, x, dibujo, color); al cargar graficos, su bufer
	ld de,0a868h		;be04
	call L_BE18		;be07
	ld de,0a878h		;be0a
	call L_BE18		;be0d
	ld de,0a888h		;be10
	call L_BE18		;be13
	jr L_BE35		;be16
L_BE18:
	ld b,002h		;be18
L_BE1A:
	ld (hl),e			;be1a
	inc hl			;be1b
	ld (hl),d			;be1c
	inc hl			;be1d
	ld (hl),a			;be1e
	inc hl			;be1f
	inc hl			;be20
	add a,004h		;be21
	ld (hl),e			;be23
	inc hl			;be24
	ld (hl),d			;be25
	inc hl			;be26
	ld (hl),a			;be27
	inc hl			;be28
	inc hl			;be29
	push af			;be2a
	ld a,d			;be2b
	add a,010h		;be2c
	ld d,a			;be2e
	pop af			;be2f
	add a,004h		;be30
	djnz L_BE1A		;be32
	ret			;be34
L_BE35:
	ld hl,0d200h		;be35   ; apunta a los colores de los sprites (16 bytes por sprite)
	ld de,0d201h		;be38
	ld bc,0000fh		;be3b
	ld (hl),00dh		;be3e
	ldir		;be40
	call L_BE5D		;be42
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
	inc hl			;be5d
	inc de			;be5e
	ld bc,0000fh		;be5f
	ld (hl),04eh		;be62
	ldir		;be64
	ret			;be66

; ----------------------------------------------------------------------
; DATOS resto_BE67: lo apuntan con el banco puesto p12:BE75 (0xBE67), p12:BEB3
;   (0xBE6E); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p12:BE75, p12:BEB3 (14 bytes)
;   0xbe67..0xbe75  (14 bytes)
DATA_resto_BE67:
	defb 048h,070h,0f3h,0ebh,0e9h,0f0h,0ffh,048h,070h,0e6h,0e9h,0eeh,0e4h,0ffh	; be67  Hp.....Hp.....

; ======================================================================
; CODIGO 0xbe75..0xbf0e  (153 bytes)
; ======================================================================


L_BE75:
	ld hl,0be67h		;be75
	call 051d0h		;be78   ; pinta un letrero: [D][E] y caracteres; 0xFE trae otra posicion; 0xFF acaba
	call L_BEF3		;be7b
L_BE7E:
	call 000e1h		;be7e   ; BIOS TAPION - Reads the header block after turning the cassette motor on
	jp c,L_BEFC		;be81
L_BE84:
	ld c,010h		;be84
L_BE86:
	exx			;be86
	call 000e4h		;be87   ; BIOS TAPIN - Reads data from the tape
	exx			;be8a
	jp c,L_BEFC		;be8b
	cp 0aah		;be8e
	jr nz,L_BE84		;be90
	dec c			;be92
	jr nz,L_BE86		;be93
	ld hl,0ee50h		;be95   ; apunta a la lista de las cosas de 0xE300 por orden de pintado
	ld bc,00008h		;be98
	call L_BF1B		;be9b
	jr c,L_BEFC		;be9e
	call 000f0h		;bea0   ; BIOS TAPOOF - Stops writing on the tape
	ld hl,0ee50h		;bea3   ; apunta a la lista de las cosas de 0xE300 por orden de pintado
	ld de,0e270h		;bea6   ; apunta a el nombre de la fase del editor (11 letras)
	ld b,008h		;bea9
L_BEAB:
	ld a,(de)			;beab
	cp (hl)			;beac
	jr nz,L_BE75		;bead
	inc de			;beaf
	inc hl			;beb0
	djnz L_BEAB		;beb1
	ld hl,0be6eh		;beb3
	call 051d0h		;beb6   ; pinta un letrero: [D][E] y caracteres; 0xFE trae otra posicion; 0xFF acaba
	call L_BEF3		;beb9
	call 000e1h		;bebc   ; BIOS TAPION - Reads the header block after turning the cassette motor on
	jr c,L_BEFC		;bebf
	ld ix,06c6dh		;bec1
	ld d,000h		;bec5
	ld b,006h		;bec7
L_BEC9:
	push bc			;bec9
	ld l,(ix+000h)		;beca
	ld h,(ix+001h)		;becd
	ld c,(ix+002h)		;bed0
	ld b,(ix+003h)		;bed3
	call L_BF1B		;bed6
	pop bc			;bed9
	jr c,L_BEFC		;beda
	inc ix		;bedc
	inc ix		;bede
	inc ix		;bee0
	inc ix		;bee2
	djnz L_BEC9		;bee4
	exx			;bee6
	call 000e4h		;bee7   ; BIOS TAPIN - Reads data from the tape
	exx			;beea
	jr c,L_BEFC		;beeb
	cp d			;beed
	jr nz,L_BEFC		;beee
	jp 000f0h		;bef0   ; BIOS TAPOOF - Stops writing on the tape
L_BEF3:
	ld hl,0ee50h		;bef3   ; apunta a la lista de las cosas de 0xE300 por orden de pintado
	ld de,07070h		;bef6
	jp 08a1ah		;bef9
L_BEFC:
	call 000f0h		;befc   ; BIOS TAPOOF - Stops writing on the tape
	call 04e98h		;beff   ; pantalla en negro: quita sprites, borra la pagina y apaga la pantalla
	ld hl,0bf0eh		;bf02
	call 051d0h		;bf05   ; pinta un letrero: [D][E] y caracteres; 0xFE trae otra posicion; 0xFF acaba
	ld a,002h		;bf08
	ld (0e27fh),a		;bf0a   ; guarda el resultado de grabar o cargar (0 bien, 2 error)
	ret			;bf0d

; ----------------------------------------------------------------------
; DATOS resto_BF0E: lo apuntan con el banco puesto p12:BF02 (0xBF0E); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p12:BF02 (13 bytes)
;   0xbf0e..0xbf1b  (13 bytes)
DATA_resto_BF0E:
	defb 050h,060h,0ech,0efh,0e1h,0e4h,000h,0e5h,0f2h,0f2h,0efh,0f2h,0ffh	; bf0e  P`...........

; ======================================================================
; CODIGO 0xbf1b..0xbf94  (121 bytes)
; ======================================================================


L_BF1B:
	exx			;bf1b
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
	ld a,0ffh		;bf2b
	call 000eah		;bf2d   ; BIOS TAPOON - Turns on the cassette motor and writes the header
	jp c,L_BF82		;bf30
	ld b,010h		;bf33
L_BF35:
	ld a,0aah		;bf35
	exx			;bf37
	call 000edh		;bf38   ; BIOS TAPOUT - Writes data on the tape
	exx			;bf3b
	jr c,L_BF82		;bf3c
	djnz L_BF35		;bf3e
	ld hl,0e270h		;bf40   ; apunta a el nombre de la fase del editor (11 letras)
	ld bc,00008h		;bf43
	call L_BFA1		;bf46
	jr c,L_BF82		;bf49
	call 000f0h		;bf4b   ; BIOS TAPOOF - Stops writing on the tape
	xor a			;bf4e
	call 000eah		;bf4f   ; BIOS TAPOON - Turns on the cassette motor and writes the header
	jr c,L_BF82		;bf52
	ld ix,06c6dh		;bf54
	ld d,000h		;bf58
	ld b,006h		;bf5a
L_BF5C:
	push bc			;bf5c
	ld l,(ix+000h)		;bf5d
	ld h,(ix+001h)		;bf60
	ld c,(ix+002h)		;bf63
	ld b,(ix+003h)		;bf66
	call L_BFA1		;bf69
	pop bc			;bf6c
	jr c,L_BF82		;bf6d
	inc ix		;bf6f
	inc ix		;bf71
	inc ix		;bf73
	inc ix		;bf75
	djnz L_BF5C		;bf77
	ld a,d			;bf79
	call 000edh		;bf7a   ; BIOS TAPOUT - Writes data on the tape
	jr c,L_BF82		;bf7d
	jp 000f0h		;bf7f   ; BIOS TAPOOF - Stops writing on the tape
L_BF82:
	call 000f0h		;bf82   ; BIOS TAPOOF - Stops writing on the tape
	call 04e98h		;bf85   ; pantalla en negro: quita sprites, borra la pagina y apaga la pantalla
	ld hl,0bf94h		;bf88
	call 051d0h		;bf8b   ; pinta un letrero: [D][E] y caracteres; 0xFE trae otra posicion; 0xFF acaba
	ld a,002h		;bf8e
	ld (0e27fh),a		;bf90   ; guarda el resultado de grabar o cargar (0 bien, 2 error)
	ret			;bf93

; ----------------------------------------------------------------------
; DATOS resto_BF94: lo apuntan con el banco puesto p12:BF88 (0xBF94); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p12:BF88 (13 bytes)
;   0xbf94..0xbfa1  (13 bytes)
DATA_resto_BF94:
	defb 050h,060h,0f3h,0e1h,0f6h,0e5h,000h,0e5h,0f2h,0f2h,0efh,0f2h,0ffh	; bf94  P`...........

; ======================================================================
; CODIGO 0xbfa1..0xbfb3  (18 bytes)
; ======================================================================


L_BFA1:
	ld a,(hl)			;bfa1
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
