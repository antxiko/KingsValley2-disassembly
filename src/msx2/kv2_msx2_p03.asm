; ==========================================================================
; KING'S VALLEY II - Konami (1988) - MSX2 - MegaROM RC-761 de 128 KB (Konami SCC) - banco 03 (se ejecuta en 0xa000)
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
lad08h:	equ 0x0ad08

; ======================================================================
; CODIGO 0xa000..0xa075  (117 bytes)
; ======================================================================


L_A000:
	ld a,003h		;a000   ; estado 3 y el sonido 0x3C
	ld (0e280h),a		;a002   ; guarda el estado del personaje
	jp 042f3h		;a005
L_A008:
	ld a,(0e2a6h)		;a008   ; saltar (disparo sin nada en la mano): si no hay techo, estado 1 con velocidad -4 y el sonido 0x13
	or a			;a00b
	ret nz			;a00c
	ld a,(0e287h)		;a00d   ; lee la postura del personaje
	or a			;a010
	ret nz			;a011
	ld a,(0e282h)		;a012   ; lee la y del personaje
	cp 0f8h		;a015
	ret nc			;a017
	ld l,a			;a018
	ld a,(0e284h)		;a019   ; lee la x del personaje
	ld h,a			;a01c
	ld c,000h		;a01d
	call 09910h		;a01f   ; NC si hay pared en la direccion C (tres puntos de la orilla, en el mapa de la pantalla)
	ret nc			;a022
	ld a,(0e288h)		;a023   ; la direccion del salto: la que llevaba
	ld (0e289h),a		;a026
	ld a,(0e294h)		;a029
	ld b,a			;a02c
	ld a,008h		;a02d
	add a,b			;a02f   ; mira hacia 8 + su lado
	ld (0e285h),a		;a030   ; guarda hacia donde mira el personaje
	xor a			;a033
	ld (0e2a5h),a		;a034
	ld hl,0fc00h		;a037   ; 0xE292: la velocidad en y (16 bits, -4)
	ld (0e292h),hl		;a03a
	call 0423ah		;a03d   ; pide el sonido 0x13
	ld hl,0e280h		;a040   ; apunta a el estado del personaje
	inc (hl)			;a043
	ret			;a044
L_A045:
	ld a,(0e2a6h)		;a045   ; usar lo que lleva (disparo con algo en la mano)
	or a			;a048
	ret nz			;a049
	ld a,(0e287h)		;a04a   ; lee la postura del personaje
	and a			;a04d
	ret z			;a04e
	ld a,(0e207h)		;a04f   ; lee el mando: lo que se acaba de pulsar
	bit 4,a		;a052
	ret z			;a054
	ld hl,0e300h		;a055   ; apunta a las cosas que se cogen y se llevan (64 x 8 bytes)
	ld b,040h		;a058
L_A05A:
	ld a,(hl)			;a05a   ; busca en 0xE300 la cosa llevada (cifra alta 1)
	rra			;a05b
	rra			;a05c
	rra			;a05d
	rra			;a05e
	and 00fh		;a05f
	dec a			;a061
	jr z,L_A06B		;a062
	ld de,00008h		;a064
	add hl,de			;a067
	djnz L_A05A		;a068
	ret			;a06a
L_A06B:
	ld (0e2a0h),hl		;a06b   ; 0xE2A0 = la cosa; cada tipo, lo suyo (tabla detras)
	ld a,(0e287h)		;a06e   ; lee la postura del personaje
	dec a			;a071
	call 04099h		;a072   ; el despachador de Konami: la tabla va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_A075: 6 destinos del despachador p00:4099 (call en p03:A072, el
;   indice en A): A081, A081, A0A6, A0A6, A0F0, A0F0; lo leen p03:A072 (12
;   bytes)
;   0xa075..0xa081  (12 bytes)
DATA_tabla_A075:
	defw 0a081h,0a081h,0a0a6h,0a0a6h,0a0f0h,0a0f0h	; a075

; ======================================================================
; CODIGO 0xa081..0xa6e0  (1631 bytes)
; ======================================================================


L_A081:
	ld hl,0e2a9h		;a081   ; tipos 1 y 2: lanzarla (hasta 6 en el aire, 0xE2A9)
	ld a,(hl)			;a084
	cp 006h		;a085
	ret nc			;a087
	inc (hl)			;a088
	ld a,(0e294h)		;a089
	or a			;a08c
	ld a,00ah		;a08d
	jr z,L_A093		;a08f
	ld a,00ch		;a091
L_A093:
	ld (0e285h),a		;a093   ; guarda hacia donde mira el personaje
	ld a,008h		;a096
	ld (0e286h),a		;a098
L_A09B:
	ld a,(0e287h)		;a09b   ; el estado del personaje: 7 + el tipo (la animacion de usarla)
	and 00fh		;a09e
	add a,007h		;a0a0
	ld (0e280h),a		;a0a2   ; guarda el estado del personaje
	ret			;a0a5
L_A0A6:
	ld a,(0e294h)		;a0a6   ; tipos 3 y 4: cavar hacia abajo, si las dos casillas de debajo son de ladrillo (2)
	or a			;a0a9
	ld bc,0f80ah		;a0aa
	jr z,L_A0B2		;a0ad
	ld bc,0080ch		;a0af
L_A0B2:
	ld a,c			;a0b2
	exx			;a0b3
	ld c,a			;a0b4
	exx			;a0b5
	ld a,(0e284h)		;a0b6   ; lee la x del personaje
	add a,004h		;a0b9
	and 0f8h		;a0bb
	add a,b			;a0bd
	ld h,a			;a0be
	ld a,(0e282h)		;a0bf   ; lee la y del personaje
	add a,010h		;a0c2
	and 0f8h		;a0c4
	ld l,a			;a0c6
	ld (0e2a2h),hl		;a0c7   ; 0xE2A2: donde se cava
	push hl			;a0ca
	call 098e2h		;a0cb   ; A = la casilla del mapa de la pantalla (0xE250) en el pixel (x H, y L)
	pop hl			;a0ce
	cp 002h		;a0cf
	ret nz			;a0d1
	ld a,h			;a0d2
	add a,008h		;a0d3
	ld h,a			;a0d5
	call 098e2h		;a0d6   ; A = la casilla del mapa de la pantalla (0xE250) en el pixel (x H, y L)
	cp 002h		;a0d9
	ret nz			;a0db
	exx			;a0dc
	ld a,c			;a0dd
	ld (0e285h),a		;a0de   ; guarda hacia donde mira el personaje
	exx			;a0e1
	ld hl,(0e2a0h)		;a0e2   ; la cosa pasa a usarse (cifra alta + 1)
	ld a,010h		;a0e5
	add a,(hl)			;a0e7
	ld (hl),a			;a0e8
	ld a,020h		;a0e9
	ld (0e286h),a		;a0eb
	jr L_A09B		;a0ee
L_A0F0:
	ld a,(0e294h)		;a0f0   ; tipos 5 y 6: cavar hacia el lado, si las dos casillas de al lado son de ladrillo
	or a			;a0f3
	ld b,0feh		;a0f4
	ld a,00ah		;a0f6
	jr z,L_A0FE		;a0f8
	ld b,012h		;a0fa
	ld a,00ch		;a0fc
L_A0FE:
	exx			;a0fe
	ld c,a			;a0ff
	exx			;a100
	ld a,(0e284h)		;a101   ; lee la x del personaje
	add a,b			;a104
	and 0f8h		;a105
	ld h,a			;a107
	ld a,(0e282h)		;a108   ; lee la y del personaje
	and 0f8h		;a10b
	ld l,a			;a10d
	ld (0e2a2h),hl		;a10e
	call 098dch		;a111   ; A = la casilla del mapa de la pantalla en (H, L), sin tocar HL
	cp 002h		;a114
	ret nz			;a116
	ld a,l			;a117
	add a,008h		;a118
	ld l,a			;a11a
	call 098e2h		;a11b   ; A = la casilla del mapa de la pantalla (0xE250) en el pixel (x H, y L)
	cp 002h		;a11e
	ret nz			;a120
	exx			;a121
	ld a,c			;a122
	ld (0e285h),a		;a123   ; guarda hacia donde mira el personaje
	exx			;a126
	ld hl,(0e2a0h)		;a127
	ld a,010h		;a12a
	add a,(hl)			;a12c
	ld (hl),a			;a12d
	ld a,020h		;a12e
	ld (0e286h),a		;a130
	jp L_A09B		;a133
L_A136:
	ld de,0fec0h		;a136   ; en el aire, el paso hacia el lado del salto (0xFEC0 o 0x0140)
	ld c,002h		;a139
	bit 2,a		;a13b
	jp nz,L_A14B		;a13d
	ld de,00140h		;a140
	ld c,003h		;a143
	bit 3,a		;a145
	jp nz,L_A14B		;a147
	ret			;a14a
L_A14B:
	ld hl,(0e283h)		;a14b   ; si no hay pared, se mueve; si la hay, se queda pegado
	add hl,de			;a14e
	ld a,h			;a14f
	cp 0f0h		;a150
	jp nc,09fd0h		;a152
	push bc			;a155
	push hl			;a156
	ld a,(0e2a5h)		;a157
	or a			;a15a
	ld a,(0e282h)		;a15b   ; lee la y del personaje
	jr z,L_A162		;a15e
	add a,006h		;a160
L_A162:
	call L_A16D		;a162   ; NC si hay pared al lado en la altura A
	pop hl			;a165
	pop bc			;a166
	jp c,09fd0h		;a167
	jp 09fc1h		;a16a
L_A16D:
	add a,008h		;a16d   ; NC si hay pared al lado en la altura A
	ld l,a			;a16f
	ld a,c			;a170
	sub 002h		;a171
	ld h,0ffh		;a173
	jr z,L_A179		;a175
	ld h,010h		;a177
L_A179:
	ld a,(0e284h)		;a179   ; lee la x del personaje
	add a,h			;a17c
	ld h,a			;a17d
	call 098dch		;a17e   ; A = la casilla del mapa de la pantalla en (H, L), sin tocar HL
	sub 002h		;a181
	ret nc			;a183
	ld a,l			;a184
	and 0f8h		;a185
	add a,006h		;a187
	ld a,a			;a189
	call 098e2h		;a18a   ; A = la casilla del mapa de la pantalla (0xE250) en el pixel (x H, y L)
	sub 002h		;a18d
	ret			;a18f
L_A190:
	xor a			;a190   ; estado 1: el salto
	ld (0e2a5h),a		;a191
	call L_A1C1		;a194   ; la caida: la velocidad sube 0x80 por cuadro hasta 4
	ld a,(0e289h)		;a197
	and 00ch		;a19a
	call nz,L_A136		;a19c   ; en el aire, el paso hacia el lado del salto (0xFEC0 o 0x0140)
	call L_A535		;a19f   ; mira si toca suelo
	ld a,(0efc0h)		;a1a2   ; lee un dato de paso de la rutina en curso
	or a			;a1a5
	ret z			;a1a6
	call L_A446		;a1a7   ; en el suelo: estado 0, el paso y el sonido 0x38
	xor a			;a1aa
	ld (0e280h),a		;a1ab   ; guarda el estado del personaje
	ld (0e2a6h),a		;a1ae
	ld (0e2a5h),a		;a1b1
	ld (0e295h),a		;a1b4
	inc a			;a1b7
	ld (0e296h),a		;a1b8
	call 09f20h		;a1bb   ; el dibujo del paso (tablas 0x9F45 y 0x9F49 segun hacia donde mira)
	jp 042e3h		;a1be
L_A1C1:
	ld hl,(0e292h)		;a1c1   ; la caida: la velocidad sube 0x80 por cuadro hasta 4
	ld a,h			;a1c4
	cp 004h		;a1c5
	jr z,L_A1E1		;a1c7
	ld de,00080h		;a1c9
	add hl,de			;a1cc
	ld (0e292h),hl		;a1cd
	ex de,hl			;a1d0
L_A1D1:
	ld hl,(0e281h)		;a1d1   ; la y + la velocidad
	add hl,de			;a1d4
	ld (0e281h),hl		;a1d5
	call L_A1E6		;a1d8   ; C si tiene techo o suelo (dos puntos de cada lado)
	ret c			;a1db
	ld hl,0e2a5h		;a1dc
	inc (hl)			;a1df
	ret			;a1e0
L_A1E1:
	ld de,00400h		;a1e1
	jr L_A1D1		;a1e4
L_A1E6:
	ld l,h			;a1e6   ; C si tiene techo o suelo (dos puntos de cada lado)
	dec l			;a1e7
	call L_A1F9		;a1e8   ; dos puntos en la fila L: x + 2 y x + 14
	ret nc			;a1eb
	ld a,l			;a1ec
	inc a			;a1ed
	and 0f8h		;a1ee
	add a,008h		;a1f0
	ld l,a			;a1f2
	call L_A1F9		;a1f3   ; dos puntos en la fila L: x + 2 y x + 14
	ret nc			;a1f6
	inc l			;a1f7
	inc l			;a1f8
L_A1F9:
	ld a,(0e284h)		;a1f9   ; dos puntos en la fila L: x + 2 y x + 14
	add a,002h		;a1fc
	ld h,a			;a1fe
	call 098dch		;a1ff   ; A = la casilla del mapa de la pantalla en (H, L), sin tocar HL
	sub 002h		;a202
	ret nc			;a204
	ld a,h			;a205
	add a,00ch		;a206
	ld h,a			;a208
	call 098dch		;a209   ; A = la casilla del mapa de la pantalla en (H, L), sin tocar HL
	sub 002h		;a20c
	ret			;a20e
L_A20F:
	call L_A653		;a20f   ; estado 2: en la escalera
	ld a,(0e208h)		;a212   ; izquierda o derecha
	and 00ch		;a215
	jr z,L_A290		;a217
	rra			;a219
	rra			;a21a
	rra			;a21b
	ld c,002h		;a21c
	jr c,L_A221		;a21e
	inc c			;a220
L_A221:
	ld a,(0e282h)		;a221   ; lee la y del personaje
	ld l,a			;a224
	ld a,(0e284h)		;a225   ; lee la x del personaje
	ld h,a			;a228
	push hl			;a229
	push bc			;a22a
	call 09910h		;a22b   ; si hay pared, sigue en la escalera
	pop bc			;a22e
	pop hl			;a22f
	jr nc,L_A290		;a230
	ld a,l			;a232
	add a,004h		;a233
	ld l,a			;a235
	ld a,c			;a236
	cp 002h		;a237
	ld a,0fch		;a239
	jr z,L_A23F		;a23b
	ld a,014h		;a23d
L_A23F:
	add a,h			;a23f
	ld h,a			;a240
	call 098dch		;a241   ; las casillas de la escalera de delante...
	or a			;a244
	jr nz,L_A270		;a245
	ld a,l			;a247
	add a,008h		;a248
	ld l,a			;a24a
	call 098dch		;a24b   ; A = la casilla del mapa de la pantalla en (H, L), sin tocar HL
	or a			;a24e
	jr nz,L_A270		;a24f
	ld a,l			;a251
	add a,008h		;a252
	ld l,a			;a254
	call 098dch		;a255   ; A = la casilla del mapa de la pantalla en (H, L), sin tocar HL
	or a			;a258
	jr z,L_A270		;a259
	ld a,l			;a25b
	sub 010h		;a25c
L_A25E:
	and 0f8h		;a25e   ; ...acaba: estado 0, en el suelo
	ld h,a			;a260
	xor a			;a261
	ld (0e280h),a		;a262   ; guarda el estado del personaje
	ld (0e2a4h),a		;a265
	ld (0e2a6h),a		;a268
	ld l,a			;a26b
	ld (0e281h),hl		;a26c
	ret			;a26f
L_A270:
	ld a,(0e282h)		;a270   ; sin escalera ni suelo: cae
	add a,004h		;a273
	ld l,a			;a275
	ld a,(0e284h)		;a276   ; lee la x del personaje
	ld h,a			;a279
	ld c,001h		;a27a
	push hl			;a27c
	call 09910h		;a27d   ; NC si hay pared en la direccion C (tres puntos de la orilla, en el mapa de la pantalla)
	pop hl			;a280
	ld a,l			;a281
	jr nc,L_A25E		;a282
	xor a			;a284
	ld (0e280h),a		;a285   ; guarda el estado del personaje
	ld (0e2a4h),a		;a288
	inc a			;a28b
	ld (0e2a6h),a		;a28c
	ret			;a28f
L_A290:
	call L_A48F		;a290   ; subir o bajar por la escalera
	ld a,(0e280h)		;a293   ; lee el estado del personaje
	cp 002h		;a296
	ret nz			;a298
	call L_A476		;a299   ; Z si hay escalera arriba o abajo; si no, se cae
	ld a,(0e280h)		;a29c   ; lee el estado del personaje
	cp 002h		;a29f
	ret nz			;a2a1
	call L_A2BB		;a2a2   ; un paso en la escalera (0xE28A o 0xE28C segun la direccion)
	ld a,(0e288h)		;a2a5
	and 003h		;a2a8
	ret z			;a2aa
	ld hl,0e296h		;a2ab   ; cada 4 cuadros el paso (xor 1)
	dec (hl)			;a2ae
	ret nz			;a2af
	ld (hl),004h		;a2b0
	ld a,(0e285h)		;a2b2   ; lee hacia donde mira el personaje
	xor 001h		;a2b5
	ld (0e285h),a		;a2b7   ; guarda hacia donde mira el personaje
	ret			;a2ba
L_A2BB:
	ld de,(0e28ah)		;a2bb   ; un paso en la escalera (0xE28A o 0xE28C segun la direccion)
	ld c,000h		;a2bf
	ld a,(0e288h)		;a2c1
	rra			;a2c4
	jr c,L_A2D6		;a2c5
	ld de,(0e28ch)		;a2c7
	ld c,001h		;a2cb
	rra			;a2cd
	jr c,L_A2D6		;a2ce
	ld hl,0e296h		;a2d0
	ld (hl),001h		;a2d3
	ret			;a2d5
L_A2D6:
	ld hl,(0e281h)		;a2d6
	add hl,de			;a2d9
	ld a,h			;a2da
	cp 0e8h		;a2db
	jr nc,L_A2EC		;a2dd
	push bc			;a2df
	push hl			;a2e0
	ld l,h			;a2e1
	ld a,(0e284h)		;a2e2   ; lee la x del personaje
	ld h,a			;a2e5
	call 09910h		;a2e6   ; NC si hay pared en la direccion C (tres puntos de la orilla, en el mapa de la pantalla)
	pop hl			;a2e9
	pop bc			;a2ea
	ret nc			;a2eb
L_A2EC:
	ld (0e281h),hl		;a2ec
	ret			;a2ef
L_A2F0:
	ld a,(0e284h)		;a2f0   ; estado 3: cae 4 pixeles por cuadro hasta el suelo, con el sonido 0x38
	ld h,a			;a2f3
	ld a,(0e282h)		;a2f4   ; lee la y del personaje
	add a,004h		;a2f7
	ld l,a			;a2f9
	ld (0e282h),a		;a2fa   ; guarda la y del personaje
	cp 0adh		;a2fd
	ret nc			;a2ff
	call L_A512		;a300   ; Z si debajo de los pies no hay nada (tres puntos)
	ret z			;a303
	call L_A446		;a304   ; la y a la fila de 8, sin la parte fina
	xor a			;a307
	ld (0e280h),a		;a308   ; guarda el estado del personaje
	ld (0e2a6h),a		;a30b
	inc a			;a30e
	ld (0e296h),a		;a30f
	jp 042e3h		;a312
L_A315:
	ld de,00a06h		;a315   ; estado 4 (rendirse): da vueltas hasta 10 pasos
	ld c,004h		;a318
	jr L_A321		;a31a
L_A31C:
	ld de,00504h		;a31c   ; estado 5 (muerto por un enemigo): 5 pasos
	ld c,000h		;a31f
L_A321:
	ld hl,0e296h		;a321
	dec (hl)			;a324
	ret nz			;a325
	ld a,(0e295h)		;a326
	cp d			;a329
	jr z,L_A34B		;a32a
	ld (hl),003h		;a32c
	ld hl,0e285h		;a32e   ; apunta a hacia donde mira el personaje
	inc (hl)			;a331
	ld a,(hl)			;a332
	cp e			;a333
	ret nz			;a334
	ld a,(0e295h)		;a335
	inc a			;a338
	ld (0e295h),a		;a339
	cp d			;a33c
	jr z,L_A341		;a33d
	ld (hl),c			;a33f
	ret			;a340
L_A341:
	ld (hl),006h		;a341   ; al acabar, el sonido 0x29 y una espera de 0x28
	ld hl,0e296h		;a343
	ld (hl),028h		;a346
	jp 042a7h		;a348
L_A34B:
	xor a			;a34b   ; la fase vuelve a empezar (0xE246 = 0)
	ld (0e246h),a		;a34c   ; guarda la marca de fase empezada
	ret			;a34f
L_A350:
	ld hl,0e299h		;a350   ; estado 6: entra andando hacia la izquierda 0x12 pasos
	inc (hl)			;a353
	ld a,(hl)			;a354
	sub 012h		;a355
	jr z,L_A368		;a357
	xor a			;a359
	ld (0e283h),a		;a35a
	ld a,(0e284h)		;a35d   ; lee la x del personaje
	dec a			;a360
	dec a			;a361
	ld (0e284h),a		;a362   ; guarda la x del personaje
	jp 09f19h		;a365
L_A368:
	ld (0e280h),a		;a368   ; guarda el estado del personaje
	ret			;a36b
L_A36C:
	ld hl,0e299h		;a36c   ; estado 7: hacia la derecha
	inc (hl)			;a36f
	ld a,(hl)			;a370
	sub 012h		;a371
	jr z,L_A368		;a373
	xor a			;a375
	ld (0e283h),a		;a376
	ld a,(0e284h)		;a379   ; lee la x del personaje
	inc a			;a37c
	inc a			;a37d
	ld (0e284h),a		;a37e   ; guarda la x del personaje
	jp 09f19h		;a381
L_A384:
	ld hl,0e286h		;a384   ; estados 8 y 9: lanzar: a los 4 cuadros la mano cambia
	dec (hl)			;a387
	jr z,L_A393		;a388
	ld a,(hl)			;a38a
	cp 004h		;a38b
	ret nz			;a38d
	ld hl,0e285h		;a38e   ; apunta a hacia donde mira el personaje
	inc (hl)			;a391
	ret			;a392
L_A393:
	xor a			;a393   ; al acabar, la cosa sale volando desde la mano
	ld (0e287h),a		;a394   ; guarda la postura del personaje
	ld (0e280h),a		;a397   ; guarda el estado del personaje
	ld a,(0e294h)		;a39a
	or a			;a39d
	ld a,003h		;a39e
	jr nz,L_A3A3		;a3a0
	xor a			;a3a2
L_A3A3:
	ld (0e285h),a		;a3a3   ; guarda hacia donde mira el personaje
	ld hl,0e2a0h		;a3a6   ; la cosa: en vuelo (cifra alta + 1), su y...
	ld a,(hl)			;a3a9
	inc l			;a3aa
	ld h,(hl)			;a3ab
	ld l,a			;a3ac
	ld a,010h		;a3ad
	add a,(hl)			;a3af
	ld (hl),a			;a3b0
	inc l			;a3b1
	push hl			;a3b2
	ld a,(0e282h)		;a3b3   ; lee la y del personaje
	and 0f8h		;a3b6
	ld (hl),a			;a3b8
	ld l,a			;a3b9
	ld a,(0e284h)		;a3ba   ; ...y su x, 16 pixeles mas alla si no hay pared
	ld h,a			;a3bd
	ld b,000h		;a3be
	ld a,(0e294h)		;a3c0
	or a			;a3c3
	ld c,003h		;a3c4
	jr z,L_A3CE		;a3c6
	cp 0e8h		;a3c8
	jr nc,L_A3DD		;a3ca
	jr L_A3D4		;a3cc
L_A3CE:
	dec c			;a3ce
	ld a,h			;a3cf
	cp 010h		;a3d0
	jr c,L_A3DD		;a3d2
L_A3D4:
	call 09910h		;a3d4   ; NC si hay pared en la direccion C (tres puntos de la orilla, en el mapa de la pantalla)
	ld b,000h		;a3d7
	jr nc,L_A3DD		;a3d9
	ld b,010h		;a3db
L_A3DD:
	pop hl			;a3dd
	inc l			;a3de
	ld c,004h		;a3df
	ld a,(0e294h)		;a3e1
	or a			;a3e4
	ld a,(0e284h)		;a3e5   ; lee la x del personaje
	jr nz,L_A3EF		;a3e8
	ld c,003h		;a3ea
	sub b			;a3ec
	jr L_A3F0		;a3ed
L_A3EF:
	add a,b			;a3ef
L_A3F0:
	ld (hl),a			;a3f0
	ret nc			;a3f1
	inc l			;a3f2   ; si sale de la pantalla, pasa a la de al lado
	push hl			;a3f3
	ld a,(0e243h)		;a3f4   ; lee la pantalla de la fase (desde 1)
	push bc			;a3f7
	call 05df0h		;a3f8   ; C = la casilla de la rejilla en la que esta la pantalla A
	pop bc			;a3fb
	ld b,a			;a3fc
	ld a,c			;a3fd
	call 05e38h		;a3fe
	ld a,l			;a401
	pop hl			;a402
	ld (hl),a			;a403
	ret			;a404
L_A405:
	ld a,(0e286h)		;a405   ; estados 10-13: cavar, con los sonidos 0x15, 0x17, 0x18 o 0x16 cada 4 cuadros
	and 003h		;a408
	call z,04244h		;a40a   ; pide el sonido 0x15
	jr L_A42B		;a40d
L_A40F:
	ld a,(0e286h)		;a40f
	and 003h		;a412
	call z,0424eh		;a414   ; pide el sonido 0x17
	jr L_A42B		;a417
L_A419:
	ld a,(0e286h)		;a419
	and 003h		;a41c
	call z,04253h		;a41e   ; pide el sonido 0x18
	jr L_A42B		;a421
L_A423:
	ld a,(0e286h)		;a423
	and 003h		;a426
	call z,04249h		;a428   ; pide el sonido 0x16
L_A42B:
	ld hl,0e286h		;a42b   ; el golpe: cada 4 cuadros cambia la mano
	dec (hl)			;a42e
	ld a,(hl)			;a42f
	rra			;a430
	rra			;a431
	ret c			;a432
	ld a,(0e285h)		;a433   ; lee hacia donde mira el personaje
	xor 001h		;a436
	ld (0e285h),a		;a438   ; guarda hacia donde mira el personaje
	ret			;a43b
L_A43C:
	ld hl,0e2a8h		;a43c   ; estado 14: al empezar, parpadea 0xE2A8 cuadros
	dec (hl)			;a43f
	ret nz			;a440
	xor a			;a441
	ld (0e280h),a		;a442   ; guarda el estado del personaje
	ret			;a445
L_A446:
	ld a,(0e282h)		;a446   ; la y a la fila de 8, sin la parte fina
	and 0f8h		;a449
	ld h,a			;a44b
	ld l,000h		;a44c
	ld (0e281h),hl		;a44e
	ret			;a451
L_A452:
	ld a,(0e2a4h)		;a452   ; C mientras 0xE2A4 < 6 (los primeros cuadros, sin teclas)
	cp 006h		;a455
	ret nc			;a457
	inc a			;a458
	ld (0e2a4h),a		;a459
	scf			;a45c
	ret			;a45d
L_A45E:
	ld a,(0e284h)		;a45e   ; Z si toca escalera a la altura de los pies
	add a,002h		;a461
	ld h,a			;a463
	ld a,(0e282h)		;a464   ; lee la y del personaje
	ld l,a			;a467
	call 098dch		;a468   ; A = la casilla del mapa de la pantalla en (H, L), sin tocar HL
	dec a			;a46b
	ret z			;a46c
	ld a,h			;a46d
	add a,00ch		;a46e
	ld h,a			;a470
	call 098e2h		;a471   ; A = la casilla del mapa de la pantalla (0xE250) en el pixel (x H, y L)
	dec a			;a474
	ret			;a475
L_A476:
	ld a,(0e284h)		;a476   ; Z si hay escalera arriba o abajo; si no, se cae
	ld h,a			;a479
	ld a,(0e282h)		;a47a   ; lee la y del personaje
	ld l,a			;a47d
	call 098dch		;a47e   ; A = la casilla del mapa de la pantalla en (H, L), sin tocar HL
	dec a			;a481
	ret z			;a482
	ld a,l			;a483
	add a,010h		;a484
	ld l,a			;a486
	call 098e2h		;a487   ; A = la casilla del mapa de la pantalla (0xE250) en el pixel (x H, y L)
	dec a			;a48a
	ret z			;a48b
	jp 09fd4h		;a48c
L_A48F:
	ld a,(0e284h)		;a48f   ; fin de la escalera: arriba o abajo hay suelo
	ld h,a			;a492
	ld a,(0e282h)		;a493   ; lee la y del personaje
	add a,012h		;a496
	ld l,a			;a498
	ld a,(0e288h)		;a499
	rra			;a49c
	jr c,L_A4D0		;a49d
	rra			;a49f
	ret nc			;a4a0
	call 098dch		;a4a1   ; A = la casilla del mapa de la pantalla en (H, L), sin tocar HL
	cp 002h		;a4a4
	jr nc,L_A4B2		;a4a6
	ld a,h			;a4a8
	add a,008h		;a4a9
	ld h,a			;a4ab
	call 098dch		;a4ac   ; A = la casilla del mapa de la pantalla en (H, L), sin tocar HL
	cp 002h		;a4af
	ret c			;a4b1
L_A4B2:
	ld a,l			;a4b2
	cp 0c0h		;a4b3
	ret nc			;a4b5
	sub 00bh		;a4b6
L_A4B8:
	and 0f8h		;a4b8
	ld h,a			;a4ba
	xor a			;a4bb
	ld l,a			;a4bc
	ld (0e281h),hl		;a4bd
	ld (0e280h),a		;a4c0   ; guarda el estado del personaje
	ld (0e2a6h),a		;a4c3
	inc a			;a4c6
	ld (0e2a7h),a		;a4c7
	ld (0e296h),a		;a4ca
	jp 09f19h		;a4cd
L_A4D0:
	ld a,(0e282h)		;a4d0   ; lee la y del personaje
	sub 008h		;a4d3
	cp 008h		;a4d5
	ret c			;a4d7
	ld a,l			;a4d8
	sub 010h		;a4d9
	ld l,a			;a4db
	call 098dch		;a4dc   ; A = la casilla del mapa de la pantalla en (H, L), sin tocar HL
	or a			;a4df
	ret nz			;a4e0
	ld a,l			;a4e1
	add a,009h		;a4e2
	ld l,a			;a4e4
	call 098dch		;a4e5   ; A = la casilla del mapa de la pantalla en (H, L), sin tocar HL
	or a			;a4e8
	ret nz			;a4e9
	ld a,l			;a4ea
	sub 009h		;a4eb
	jr L_A4B8		;a4ed
L_A4EF:
	ld b,000h		;a4ef   ; hacia donde mira (0xE294) segun izquierda y derecha
	ld a,(0e288h)		;a4f1
	rra			;a4f4
	rra			;a4f5
	and 003h		;a4f6
	ret z			;a4f8
	rra			;a4f9
	jr c,L_A4FF		;a4fa
	inc b			;a4fc
	rra			;a4fd
	ret nc			;a4fe
L_A4FF:
	ld a,b			;a4ff
	ld a,(0e294h)		;a500
	cp b			;a503
	ld a,b			;a504
	ld (0e294h),a		;a505
	ret z			;a508
	xor a			;a509
	ld (0e295h),a		;a50a
	inc a			;a50d
	ld (0e296h),a		;a50e
	ret			;a511
L_A512:
	ld a,(0e282h)		;a512   ; Z si debajo de los pies no hay nada (tres puntos)
	add a,010h		;a515
	ld l,a			;a517
	ld a,(0e284h)		;a518   ; lee la x del personaje
	add a,003h		;a51b
	ld h,a			;a51d
	call 098dch		;a51e   ; A = la casilla del mapa de la pantalla en (H, L), sin tocar HL
	or a			;a521
	ret nz			;a522
	ld a,h			;a523
	add a,005h		;a524
	ld h,a			;a526
	call 098dch		;a527   ; A = la casilla del mapa de la pantalla en (H, L), sin tocar HL
	or a			;a52a
	ret nz			;a52b
	ld a,h			;a52c
	add a,005h		;a52d
	ld h,a			;a52f
	call 098dch		;a530   ; A = la casilla del mapa de la pantalla en (H, L), sin tocar HL
	or a			;a533
	ret			;a534
L_A535:
	xor a			;a535   ; 0xEFC0 = 1 si toca suelo
	ld (0efc0h),a		;a536   ; guarda un dato de paso de la rutina en curso
	call L_A512		;a539   ; Z si debajo de los pies no hay nada (tres puntos)
	ret z			;a53c
	dec a			;a53d
	jr nz,L_A55F		;a53e
	ld a,l			;a540
	sub 00ch		;a541
	and 0f8h		;a543
	ld l,a			;a545
	call 098dch		;a546   ; A = la casilla del mapa de la pantalla en (H, L), sin tocar HL
	or a			;a549
	jr nz,L_A565		;a54a
	ld a,l			;a54c
	add a,008h		;a54d
	ld l,a			;a54f
	call 098dch		;a550   ; A = la casilla del mapa de la pantalla en (H, L), sin tocar HL
	or a			;a553
	jr nz,L_A565		;a554
	ld a,l			;a556
	add a,008h		;a557
	ld l,a			;a559
	call 098dch		;a55a   ; A = la casilla del mapa de la pantalla en (H, L), sin tocar HL
	or a			;a55d
	ret z			;a55e
L_A55F:
	ld a,001h		;a55f
	ld (0efc0h),a		;a561   ; guarda un dato de paso de la rutina en curso
	ret			;a564
L_A565:
	ld a,(0e282h)		;a565   ; lee la y del personaje
	add a,010h		;a568
	ld l,a			;a56a
	call L_A571		;a56b   ; C si debajo hay ladrillo (tres puntos)
	ret c			;a56e
	jr L_A55F		;a56f
L_A571:
	ld a,(0e284h)		;a571   ; C si debajo hay ladrillo (tres puntos)
	add a,003h		;a574
	ld h,a			;a576
	call 098dch		;a577   ; A = la casilla del mapa de la pantalla en (H, L), sin tocar HL
	sub 002h		;a57a
	ret nc			;a57c
	ld a,h			;a57d
	add a,005h		;a57e
	ld h,a			;a580
	call 098dch		;a581   ; A = la casilla del mapa de la pantalla en (H, L), sin tocar HL
	sub 002h		;a584
	ret nc			;a586
	ld a,h			;a587
	add a,005h		;a588
	ld h,a			;a58a
	call 098dch		;a58b   ; A = la casilla del mapa de la pantalla en (H, L), sin tocar HL
	sub 002h		;a58e
	ret			;a590
L_A591:
	call L_A5FB		;a591   ; bajar a una escalera
	ld a,(0e280h)		;a594   ; lee el estado del personaje
	cp 002h		;a597
	ret z			;a599
	ld a,(0e282h)		;a59a   ; lee la y del personaje
	add a,010h		;a59d
	ld l,a			;a59f
	jr L_A5B1		;a5a0
L_A5A2:
	call L_A5FB		;a5a2   ; subir a una escalera
	ld a,(0e280h)		;a5a5   ; lee el estado del personaje
	cp 002h		;a5a8
	ret z			;a5aa
	ld a,(0e282h)		;a5ab   ; lee la y del personaje
	add a,00ah		;a5ae
	ld l,a			;a5b0
L_A5B1:
	ld a,(0e284h)		;a5b1   ; hay escalera delante (casilla 1): estado 2
	ld h,a			;a5b4
	call 098dch		;a5b5   ; A = la casilla del mapa de la pantalla en (H, L), sin tocar HL
	dec a			;a5b8
	ld bc,00c0ch		;a5b9
	jr z,L_A5CC		;a5bc
	ld bc,0f400h		;a5be
	ld a,h			;a5c1
	add a,010h		;a5c2
	ld h,a			;a5c4
	push bc			;a5c5
	call 098dch		;a5c6   ; A = la casilla del mapa de la pantalla en (H, L), sin tocar HL
	pop bc			;a5c9
	dec a			;a5ca
	ret nz			;a5cb
L_A5CC:
	ld a,h			;a5cc
	add a,b			;a5cd
	ld h,a			;a5ce
	push bc			;a5cf
	call 098dch		;a5d0   ; A = la casilla del mapa de la pantalla en (H, L), sin tocar HL
	pop bc			;a5d3
	dec a			;a5d4
	ret nz			;a5d5
	ld a,h			;a5d6
	sub c			;a5d7
	and 0f8h		;a5d8
	ld h,a			;a5da
	ld l,000h		;a5db
	push hl			;a5dd
	call L_A603		;a5de   ; C si la escalera se corta
	pop hl			;a5e1
	ret c			;a5e2
	ld (0e283h),hl		;a5e3
	xor a			;a5e6
	ld (0e295h),a		;a5e7
	ld (0e2a4h),a		;a5ea
	inc a			;a5ed
	ld (0e296h),a		;a5ee
	inc a			;a5f1
	ld (0e280h),a		;a5f2   ; guarda el estado del personaje
	ld a,006h		;a5f5
	ld (0e285h),a		;a5f7   ; guarda hacia donde mira el personaje
	ret			;a5fa
L_A5FB:
	ld a,(0e282h)		;a5fb   ; lee la y del personaje
	add a,002h		;a5fe
	ld l,a			;a600
	jr L_A5B1		;a601
L_A603:
	ld a,(0e208h)		;a603   ; C si la escalera se corta
	rra			;a606
	ld a,(0e282h)		;a607   ; lee la y del personaje
	jr c,L_A60E		;a60a
	add a,010h		;a60c
L_A60E:
	ld l,a			;a60e
L_A60F:
	ld c,0ffh		;a60f
L_A611:
	inc c			;a611
	ld a,h			;a612
	or a			;a613
	jr z,L_A621		;a614
	sub 008h		;a616
	ld h,a			;a618
	push bc			;a619
	call 098dch		;a61a   ; A = la casilla del mapa de la pantalla en (H, L), sin tocar HL
	pop bc			;a61d
	dec a			;a61e
	jr z,L_A611		;a61f
L_A621:
	ld a,c			;a621
	rra			;a622
	ret			;a623
L_A624:
	ld a,(0e208h)		;a624   ; 0xE288 = arriba (4) o abajo (8), el ultimo pulsado
	and 00ch		;a627
	ld b,a			;a629
	ld c,000h		;a62a
	jr z,L_A64E		;a62c
	ld a,(0e207h)		;a62e   ; lee el mando: lo que se acaba de pulsar
	and 00ch		;a631
	cp 00ch		;a633
	ret z			;a635
	bit 2,a		;a636
	ld c,004h		;a638
	jr nz,L_A64E		;a63a
	bit 3,a		;a63c
	ld c,008h		;a63e
	jr nz,L_A64E		;a640
	ld a,b			;a642
	cp 00ch		;a643
	ret z			;a645
	bit 2,a		;a646
	ld c,004h		;a648
	jr nz,L_A64E		;a64a
	ld c,008h		;a64c
L_A64E:
	ld a,c			;a64e
	ld (0e288h),a		;a64f
	ret			;a652
L_A653:
	ld a,(0e208h)		;a653   ; 0xE288 = izquierda (1) o derecha (2), el ultimo pulsado
	and 003h		;a656
	ld b,a			;a658
	ld c,000h		;a659
	jr z,L_A64E		;a65b
	ld a,(0e207h)		;a65d   ; lee el mando: lo que se acaba de pulsar
	and 003h		;a660
	cp 003h		;a662
	ret z			;a664
	rra			;a665
	ld c,001h		;a666
	jr c,L_A64E		;a668
	rra			;a66a
	ld c,002h		;a66b
	jr c,L_A64E		;a66d
	ld a,b			;a66f
	cp 003h		;a670
	ret z			;a672
	rra			;a673
	ld c,001h		;a674
	jr c,L_A64E		;a676
	ld c,002h		;a678
	jr L_A64E		;a67a
L_A67C:
	ld a,(0e282h)		;a67c   ; sale de la pantalla: 0xE248 = el borde (1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	add a,008h		;a67f
	cp 002h		;a681
	jr c,L_A6A8		;a683
	sub 008h		;a685
	cp 0aeh		;a687
	jr nc,L_A6B4		;a689
	ld a,(0e294h)		;a68b
	or a			;a68e
	ld a,(0e284h)		;a68f   ; lee la x del personaje
	jr z,L_A69D		;a692
	cp 0f1h		;a694
	ret c			;a696
	ld a,004h		;a697
	ld (0e248h),a		;a699   ; guarda el borde por el que se sale de la pantalla (1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ret			;a69c
L_A69D:
	add a,008h		;a69d
	cp 00ah		;a69f
	ret nc			;a6a1
	ld a,003h		;a6a2
	ld (0e248h),a		;a6a4   ; guarda el borde por el que se sale de la pantalla (1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ret			;a6a7
L_A6A8:
	ld a,(0e280h)		;a6a8   ; lee el estado del personaje
	sub 002h		;a6ab
	ret nz			;a6ad
	ld a,001h		;a6ae
	ld (0e248h),a		;a6b0   ; guarda el borde por el que se sale de la pantalla (1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ret			;a6b3
L_A6B4:
	cp 0f0h		;a6b4
	ret nc			;a6b6
	ld a,002h		;a6b7
	ld (0e248h),a		;a6b9   ; guarda el borde por el que se sale de la pantalla (1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ret			;a6bc
L_A6BD:
	ld a,(0e248h)		;a6bd   ; un cuadro de las 64 cosas de 0xE300: cada tipo, su rutina (tabla detras)
	or a			;a6c0
	ret nz			;a6c1
	ld ix,0e300h		;a6c2   ; apunta a las cosas que se cogen y se llevan (64 x 8 bytes)
	ld b,040h		;a6c6
L_A6C8:
	push bc			;a6c8
	call L_A6D5		;a6c9
	pop bc			;a6cc
	ld de,00008h		;a6cd
	add ix,de		;a6d0
	djnz L_A6C8		;a6d2
	ret			;a6d4
L_A6D5:
	ld a,(ix+000h)		;a6d5
	or a			;a6d8
	ret z			;a6d9
	dec a			;a6da
	and 00fh		;a6db
	call 04099h		;a6dd   ; el despachador de Konami: la tabla va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_A6E0: 6 destinos del despachador p00:4099 (call en p03:A6DD, el
;   indice en A): A6EC, A89B, AA66, AB09, AB5D, ABF5; lo leen p03:A6DD (12
;   bytes)
;   0xa6e0..0xa6ec  (12 bytes)
DATA_tabla_A6E0:
	defw 0a6ech,0a89bh,0aa66h,0ab09h,0ab5dh,0abf5h	; a6e0

; ======================================================================
; CODIGO 0xa6ec..0xa6f5  (9 bytes)
; ======================================================================


L_A6EC:
	call L_AC63		;a6ec   ; tipo 1, por su estado (cifra alta)
	sub 001h		;a6ef
	ret c			;a6f1
	call 04099h		;a6f2   ; el despachador de Konami: la tabla va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_A6F5: 5 destinos del despachador p00:4099 (call en p03:A6F2, el
;   indice en A): A6FF, A706, A717, A743, A76E; lo leen p03:A6F2 (10 bytes)
;   0xa6f5..0xa6ff  (10 bytes)
DATA_tabla_A6F5:
	defw 0a6ffh,0a706h,0a717h,0a743h,0a76eh	; a6f5

; ======================================================================
; CODIGO 0xa6ff..0xa8a4  (421 bytes)
; ======================================================================


L_A6FF:
	ld a,(0e243h)		;a6ff   ; en la mano: en la pantalla del personaje
	ld (ix+003h),a		;a702
	ret			;a705
L_A706:
	ld (ix+004h),000h		;a706   ; lanzado: sale
	ld a,(0e294h)		;a70a
	ld (ix+007h),a		;a70d
	call L_A921		;a710
	call L_A79F		;a713   ; al salir de la mano, se coloca delante (sin meterse en la pared)
	ret nc			;a716
L_A717:
	call L_A87F		;a717   ; vuela en linea recta
	call L_A787		;a71a   ; C si es la cosa que ha dado a un enemigo (0xE2E8)
	jr nc,L_A724		;a71d
	ld a,(ix+007h)		;a71f
	jr L_A729		;a722
L_A724:
	call L_A826		;a724   ; 4 pixeles hacia su lado
	ret c			;a727
	ld a,c			;a728
L_A729:
	rra			;a729
	ld a,004h		;a72a
	jr nc,L_A72F		;a72c
	xor a			;a72e
L_A72F:
	add a,(ix+002h)		;a72f
	and 0f8h		;a732
	cp 0f1h		;a734
	jr c,L_A73A		;a736
	ld a,0f0h		;a738
L_A73A:
	ld (ix+002h),a		;a73a
	call L_A921		;a73d
	jp L_A814		;a740
L_A743:
	call L_A787		;a743   ; cae al suelo y se para
	call L_A87F		;a746   ; el dibujo de la cosa en vuelo, cada dos cuadros; el sonido 0x1C
	dec (ix+006h)		;a749
	ret nz			;a74c
	xor a			;a74d
	ld (ix+006h),004h		;a74e
	ld (ix+005h),a		;a752
	ld (ix+007h),a		;a755
	call L_A921		;a758
	call L_AA17		;a75b
	ld a,(ix+000h)		;a75e
	and 0f0h		;a761
	ret nz			;a763
	ld a,(0e243h)		;a764   ; lee la pantalla de la fase (desde 1)
	cp (ix+003h)		;a767
	ret nz			;a76a
	jp 042dbh		;a76b
L_A76E:
	call L_A787		;a76e   ; cae
	call L_A87F		;a771   ; el dibujo de la cosa en vuelo, cada dos cuadros; el sonido 0x1C
	call L_A9BA		;a774   ; cae cada vez mas deprisa (tabla 0xAA60) hasta el suelo
	ld a,(ix+000h)		;a777
	and 0f0h		;a77a
	ret nz			;a77c
	ld a,(0e243h)		;a77d   ; lee la pantalla de la fase (desde 1)
	cp (ix+003h)		;a780
	ret nz			;a783
	jp 042dbh		;a784
L_A787:
	ld a,(0edcdh)		;a787   ; C si es la cosa que ha dado a un enemigo (0xE2E8)
	and a			;a78a
	ret z			;a78b
	push ix		;a78c
	pop de			;a78e
	ld hl,(0e2e8h)		;a78f
	and a			;a792
	sbc hl,de		;a793
	jr nz,L_A79D		;a795
	xor a			;a797
	ld (0edcdh),a		;a798
	scf			;a79b
	ret			;a79c
L_A79D:
	and a			;a79d
	ret			;a79e
L_A79F:
	ld a,(0e243h)		;a79f   ; al salir de la mano, se coloca delante (sin meterse en la pared)
	cp (ix+003h)		;a7a2
	ret nz			;a7a5
	ld a,008h		;a7a6
	add a,(ix+002h)		;a7a8
	cp 0eeh		;a7ab
	jr c,L_A7B3		;a7ad
	ld a,0e8h		;a7af
	jr L_A7B9		;a7b1
L_A7B3:
	cp 008h		;a7b3
	jr nc,L_A7B9		;a7b5
	ld a,008h		;a7b7
L_A7B9:
	ld h,a			;a7b9
	ld l,(ix+001h)		;a7ba
	call 098dch		;a7bd   ; A = la casilla del mapa de la pantalla en (H, L), sin tocar HL
	sub 002h		;a7c0
	ld b,010h		;a7c2
	jr nc,L_A7F9		;a7c4
	ld a,l			;a7c6
	add a,008h		;a7c7
	ld l,a			;a7c9
	call 098dch		;a7ca   ; A = la casilla del mapa de la pantalla en (H, L), sin tocar HL
	sub 002h		;a7cd
	ld b,010h		;a7cf
	jr nc,L_A7F9		;a7d1
	ld a,l			;a7d3
	sub 008h		;a7d4
	ld l,a			;a7d6
	ld a,(0e294h)		;a7d7
	or a			;a7da
	ld a,h			;a7db
	jr nz,L_A7E2		;a7dc
	sub 008h		;a7de
	jr L_A7E4		;a7e0
L_A7E2:
	add a,008h		;a7e2
L_A7E4:
	ld h,a			;a7e4
	ret c			;a7e5
	call 098dch		;a7e6   ; A = la casilla del mapa de la pantalla en (H, L), sin tocar HL
	sub 002h		;a7e9
	jr nc,L_A7F7		;a7eb
	ld a,l			;a7ed
	add a,009h		;a7ee
	ld l,a			;a7f0
	call 098dch		;a7f1   ; A = la casilla del mapa de la pantalla en (H, L), sin tocar HL
	sub 002h		;a7f4
	ret c			;a7f6
L_A7F7:
	ld b,008h		;a7f7
L_A7F9:
	ld a,(0e294h)		;a7f9
	or a			;a7fc
	ld a,b			;a7fd
	jr z,L_A804		;a7fe
	sub 008h		;a800
	neg		;a802
L_A804:
	add a,(ix+002h)		;a804
	and 0f8h		;a807
	ld (ix+002h),a		;a809
	call L_A814		;a80c   ; IX+06 = 0x18
	call L_A921		;a80f
	and a			;a812
	ret			;a813
L_A814:
	ld (ix+006h),018h		;a814   ; IX+06 = 0x18
	ret			;a818
L_A819:
	ld a,b			;a819   ; se mueve B pixeles
	bit 7,a		;a81a
	ld c,003h		;a81c
	jr z,L_A830		;a81e
	neg		;a820
	ld b,a			;a822
	dec c			;a823
	jr L_A836		;a824
L_A826:
	ld a,(ix+007h)		;a826   ; 4 pixeles hacia su lado
	or a			;a829
	ld bc,00402h		;a82a
	jr z,L_A836		;a82d
	inc c			;a82f
L_A830:
	ld a,(ix+002h)		;a830
	add a,b			;a833
	jr L_A83A		;a834
L_A836:
	ld a,(ix+002h)		;a836
	sub b			;a839
L_A83A:
	ld (ix+002h),a		;a83a
	jr c,L_A853		;a83d
	ld a,(0e243h)		;a83f   ; lee la pantalla de la fase (desde 1)
	cp (ix+003h)		;a842
	jr nz,L_A866		;a845
	ld h,(ix+002h)		;a847
	ld l,(ix+001h)		;a84a
	push bc			;a84d
	call 09910h		;a84e   ; NC si hay pared en la direccion C (tres puntos de la orilla, en el mapa de la pantalla)
	pop bc			;a851
	ret			;a852
L_A853:
	ld a,(ix+003h)		;a853   ; pasa a la pantalla de al lado
	push bc			;a856
	call 05df0h		;a857   ; C = la casilla de la rejilla en la que esta la pantalla A
	pop bc			;a85a
	ld b,a			;a85b
	push bc			;a85c
	ld a,c			;a85d
	inc a			;a85e
	call 05e38h		;a85f
	pop bc			;a862
	ld (ix+003h),l		;a863
L_A866:
	ld b,(ix+003h)		;a866   ; C si hay pared delante en el mapa de su pantalla
	ld hl,0e840h		;a869
	ld de,000c0h		;a86c
L_A86F:
	add hl,de			;a86f
	djnz L_A86F		;a870
	ex de,hl			;a872
	ld h,(ix+002h)		;a873
	ld l,(ix+001h)		;a876
	push bc			;a879
	call 09933h		;a87a   ; lo mismo con el mapa de DE
	pop bc			;a87d
	ret			;a87e
L_A87F:
	ld a,(0e203h)		;a87f   ; el dibujo de la cosa en vuelo, cada dos cuadros; el sonido 0x1C
	and 001h		;a882
	ret nz			;a884
	ld a,(ix+004h)		;a885
	inc a			;a888
	cp 003h		;a889
	jr c,L_A897		;a88b
	ld a,(0e243h)		;a88d   ; lee la pantalla de la fase (desde 1)
	cp (ix+003h)		;a890
	call z,04267h		;a893   ; pide el sonido 0x1C
	xor a			;a896
L_A897:
	ld (ix+004h),a		;a897
	ret			;a89a
L_A89B:
	call L_AC63		;a89b   ; tipo 2: va y vuelve
	sub 001h		;a89e
	ret c			;a8a0
	call 04099h		;a8a1   ; el despachador de Konami: la tabla va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_A8A4: 5 destinos del despachador p00:4099 (call en p03:A8A1, el
;   indice en A): A6FF, A8AE, A8C7, A975, A994; lo leen p03:A8A1 (10 bytes)
;   0xa8a4..0xa8ae  (10 bytes)
DATA_tabla_A8A4:
	defw 0a6ffh,0a8aeh,0a8c7h,0a975h,0a994h	; a8a4

; ======================================================================
; CODIGO 0xa8ae..0xa961  (179 bytes)
; ======================================================================


L_A8AE:
	ld (ix+004h),003h		;a8ae
	ld (ix+005h),000h		;a8b2
	ld (ix+006h),008h		;a8b6
	ld a,(0e294h)		;a8ba
	ld (ix+007h),a		;a8bd
	call L_A921		;a8c0
	call L_A79F		;a8c3   ; al salir de la mano, se coloca delante (sin meterse en la pared)
	ret nc			;a8c6
L_A8C7:
	call L_A99D		;a8c7   ; la velocidad sale de las tablas 0xA961 y 0xA96B: frena y vuelve
	call L_A787		;a8ca   ; C si es la cosa que ha dado a un enemigo (0xE2E8)
	jr nc,L_A8D4		;a8cd
	ld a,(ix+007h)		;a8cf
	jr L_A90A		;a8d2
L_A8D4:
	dec (ix+006h)		;a8d4
	jr nz,L_A8F1		;a8d7
	ld a,(ix+005h)		;a8d9
	inc a			;a8dc
	cp 009h		;a8dd
	jr c,L_A8E3		;a8df
	ld a,009h		;a8e1
L_A8E3:
	ld (ix+005h),a		;a8e3
	ld e,a			;a8e6
	ld d,000h		;a8e7
	ld hl,0a96bh		;a8e9
	add hl,de			;a8ec
	ld a,(hl)			;a8ed
	ld (ix+006h),a		;a8ee
L_A8F1:
	ld e,(ix+005h)		;a8f1
	ld d,000h		;a8f4
	ld hl,0a961h		;a8f6
	add hl,de			;a8f9
	ld a,(ix+007h)		;a8fa
	or a			;a8fd
	ld a,(hl)			;a8fe
	jr nz,L_A903		;a8ff
	neg		;a901
L_A903:
	ld b,a			;a903
	call L_A819		;a904   ; se mueve B pixeles
	jr c,L_A92A		;a907
	ld a,c			;a909
L_A90A:
	rra			;a90a
	ld a,004h		;a90b
	jr nc,L_A910		;a90d
	xor a			;a90f
L_A910:
	add a,(ix+002h)		;a910
	and 0f8h		;a913
	cp 0f1h		;a915
	jr c,L_A91B		;a917
	ld a,0f0h		;a919
L_A91B:
	ld (ix+002h),a		;a91b
	call L_A814		;a91e   ; IX+06 = 0x18
L_A921:
	ld a,(ix+000h)		;a921
	add a,010h		;a924
	ld (ix+000h),a		;a926
	ret			;a929
L_A92A:
	ld a,(0e287h)		;a92a   ; vuelve a la mano si el personaje la toca (a menos de 13 pixeles), con el sonido 0x35
	or a			;a92d
	ret nz			;a92e
	ld a,(0e243h)		;a92f   ; lee la pantalla de la fase (desde 1)
	cp (ix+003h)		;a932
	ret nz			;a935
	ld a,(0e282h)		;a936   ; lee la y del personaje
	sub (ix+001h)		;a939
	jr nc,L_A940		;a93c
	neg		;a93e
L_A940:
	cp 00dh		;a940
	ret nc			;a942
	ld a,(0e284h)		;a943   ; lee la x del personaje
	sub (ix+002h)		;a946
	jr nc,L_A94D		;a949
	neg		;a94b
L_A94D:
	cp 00dh		;a94d
	ret nc			;a94f
	ld hl,0e2a9h		;a950
	dec (hl)			;a953
	call 042d7h		;a954   ; pide el sonido 0x35
	ld (ix+000h),012h		;a957
	ld a,002h		;a95b
	ld (0e287h),a		;a95d   ; guarda la postura del personaje
	ret			;a960

; ----------------------------------------------------------------------
; DATOS resto_A961: lo apuntan con el banco puesto p03:A8F6 (0xA961), p03:A8E9
;   (0xA96B); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p03:A8F6, p03:A8E9 (20 bytes)
;   0xa961..0xa975  (20 bytes)
DATA_resto_A961:
	defb 004h,003h,002h,001h,000h,0ffh,0feh,0fdh,0fch,0fbh,008h,006h,004h,003h,002h,003h	; a961  ................
	defb 004h,006h,008h,0ffh	; a971

; ======================================================================
; CODIGO 0xa975..0xaa60  (235 bytes)
; ======================================================================


L_A975:
	call L_A787		;a975   ; cae y se para
	call L_A99D		;a978   ; su dibujo, cada dos cuadros; el sonido 0x1B
	dec (ix+006h)		;a97b
	ret nz			;a97e
	xor a			;a97f
	ld (ix+004h),003h		;a980
	ld (ix+005h),a		;a984
	ld (ix+006h),004h		;a987
	ld (ix+007h),a		;a98b
	call L_A921		;a98e
	jp L_AA17		;a991
L_A994:
	call L_A787		;a994   ; C si es la cosa que ha dado a un enemigo (0xE2E8)
	call L_A99D		;a997   ; su dibujo, cada dos cuadros; el sonido 0x1B
	jp L_A9BA		;a99a
L_A99D:
	ld a,(0e203h)		;a99d   ; su dibujo, cada dos cuadros; el sonido 0x1B
	and 001h		;a9a0
	ret nz			;a9a2
	ld a,(ix+004h)		;a9a3
	inc a			;a9a6
	cp 006h		;a9a7
	jr c,L_A9B6		;a9a9
	ld a,(0e243h)		;a9ab   ; lee la pantalla de la fase (desde 1)
	cp (ix+003h)		;a9ae
	call z,04262h		;a9b1   ; pide el sonido 0x1B
	ld a,003h		;a9b4
L_A9B6:
	ld (ix+004h),a		;a9b6
	ret			;a9b9
L_A9BA:
	dec (ix+006h)		;a9ba   ; cae cada vez mas deprisa (tabla 0xAA60) hasta el suelo
	ld a,(ix+005h)		;a9bd
	jr nz,L_A9D6		;a9c0
	cp 005h		;a9c2
	jr nc,L_A9CA		;a9c4
	inc a			;a9c6
	ld (ix+005h),a		;a9c7
L_A9CA:
	ld e,a			;a9ca
	ld d,000h		;a9cb
	ld hl,0aa60h		;a9cd
	add hl,de			;a9d0
	ld a,(hl)			;a9d1
	ld (ix+006h),a		;a9d2
	ld a,e			;a9d5
L_A9D6:
	inc a			;a9d6
	add a,(ix+001h)		;a9d7
	ld (ix+001h),a		;a9da
	cp 0b8h		;a9dd
	jr nc,L_AA03		;a9df
	ld a,(0e243h)		;a9e1   ; lee la pantalla de la fase (desde 1)
	cp (ix+003h)		;a9e4
	jr nz,L_AA17		;a9e7
	ld a,(ix+001h)		;a9e9
	add a,010h		;a9ec
	cp 0b8h		;a9ee
	jr c,L_A9F4		;a9f0
	ld a,0b8h		;a9f2
L_A9F4:
	ld l,a			;a9f4
	ld a,(ix+002h)		;a9f5
	add a,008h		;a9f8
	ld h,a			;a9fa
	call 098e2h		;a9fb   ; A = la casilla del mapa de la pantalla (0xE250) en el pixel (x H, y L)
	cp 002h		;a9fe
	jr nc,L_AA30		;aa00
	ret			;aa02
L_AA03:
	ld a,008h		;aa03   ; se sale por abajo: a la pantalla de abajo
	ld (ix+001h),a		;aa05
	ld a,(ix+003h)		;aa08
	call 05df0h		;aa0b   ; C = la casilla de la rejilla en la que esta la pantalla A
	ld b,a			;aa0e
	ld a,002h		;aa0f
	call 05e38h		;aa11
	ld (ix+003h),l		;aa14
L_AA17:
	ld b,(ix+003h)		;aa17
	ld hl,0e840h		;aa1a
	ld de,000c0h		;aa1d
L_AA20:
	add hl,de			;aa20
	djnz L_AA20		;aa21
	ex de,hl			;aa23
	ld h,(ix+002h)		;aa24
	ld l,(ix+001h)		;aa27
	ld c,001h		;aa2a
	call 09933h		;aa2c   ; lo mismo con el mapa de DE
	ret c			;aa2f
L_AA30:
	ld hl,0e2a9h		;aa30   ; en el suelo: se queda, y se pinta
	dec (hl)			;aa33
	ld a,(ix+001h)		;aa34
	and 0f8h		;aa37
	ld (ix+001h),a		;aa39
	ld a,(ix+000h)		;aa3c
	and 00fh		;aa3f
	ld (ix+000h),a		;aa41
	ld a,(0e243h)		;aa44   ; lee la pantalla de la fase (desde 1)
	cp (ix+003h)		;aa47
	ret nz			;aa4a
	call 09237h		;aa4b   ; pasa la cosa de IX al principio de la lista
	push ix		;aa4e
	call 096ffh		;aa50   ; devuelve el fondo de los bloques de esta pantalla
	pop ix		;aa53
	call 09116h		;aa55   ; una cosa de 0xE300 en el suelo: guarda su fondo y la pinta (0x9328 + 4 x (tipo - 1))
	push ix		;aa58
	call 096cfh		;aa5a   ; pinta los bloques de esta pantalla
	pop ix		;aa5d
	ret			;aa5f

; ----------------------------------------------------------------------
; DATOS resto_AA60: lo apuntan con el banco puesto p03:A9CD (0xAA60); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p03:A9CD (6 bytes)
;   0xaa60..0xaa66  (6 bytes)
DATA_resto_AA60:
	defb 003h,003h,003h,003h,003h,0ffh	; aa60

; ======================================================================
; CODIGO 0xaa66..0xaa6f  (9 bytes)
; ======================================================================


L_AA66:
	call L_AC63		;aa66   ; tipo 3: cava hacia abajo una vez
	sub 001h		;aa69
	ret c			;aa6b
	call 04099h		;aa6c   ; el despachador de Konami: la tabla va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_AA6F: 3 destinos del despachador p00:4099 (call en p03:AA6C, el
;   indice en A): A6FF, AA75, AA84; lo leen p03:AA6C (6 bytes)
;   0xaa6f..0xaa75  (6 bytes)
DATA_tabla_AA6F:
	defw 0a6ffh,0aa75h,0aa84h	; aa6f  -> L_A6FF L_AA75 L_AA84

; ======================================================================
; CODIGO 0xaa75..0xab03  (142 bytes)
; ======================================================================


L_AA75:
	ld (ix+006h),008h		;aa75
	ld (ix+005h),0ffh		;aa79
	ld (ix+007h),000h		;aa7d
	jp L_A921		;aa81
L_AA84:
	call L_AAA9		;aa84   ; cuando acaba, vuelve a la mano vacia
	ld a,(ix+007h)		;aa87
	or a			;aa8a
	ret z			;aa8b
L_AA8C:
	ld a,(0e294h)		;aa8c   ; el personaje sin nada y en el estado 0
	or a			;aa8f
	ld a,003h		;aa90
	jr nz,L_AA95		;aa92
	xor a			;aa94
L_AA95:
	ld (0e285h),a		;aa95   ; guarda hacia donde mira el personaje
	xor a			;aa98
	ld (ix+000h),a		;aa99
	ld (0e287h),a		;aa9c   ; guarda la postura del personaje
	ld a,(0e298h)		;aa9f   ; lee la marca de personaje muerto
	or a			;aaa2
	ret nz			;aaa3
	xor a			;aaa4
	ld (0e280h),a		;aaa5   ; guarda el estado del personaje
	ret			;aaa8
L_AAA9:
	dec (ix+006h)		;aaa9   ; cada 8 cuadros, el paso del agujero: los dos caracteres de 0xAB03
	ret nz			;aaac
	ld (ix+006h),008h		;aaad
	ld a,(ix+005h)		;aab1
	inc a			;aab4
	cp 003h		;aab5
	jr z,L_AAE7		;aab7
	push af			;aab9
	ld hl,(0e2a2h)		;aaba
	ld d,h			;aabd
	ld e,l			;aabe
	ld bc,00102h		;aabf
	call 056deh		;aac2
	pop af			;aac5
	ld (ix+005h),a		;aac6
	add a,a			;aac9
	ld e,a			;aaca
	ld d,000h		;aacb
	ld hl,0ab03h		;aacd
	add hl,de			;aad0
	ex de,hl			;aad1
	ld hl,(0e2a2h)		;aad2
	ld a,(de)			;aad5
	ex de,hl			;aad6
	inc hl			;aad7
	push hl			;aad8
	push de			;aad9
	call 05767h		;aada   ; pinta el caracter A sin su color 0 (p00:5219)
	pop de			;aadd
	pop hl			;aade
	ld a,d			;aadf
	add a,008h		;aae0
	ld d,a			;aae2
	ld a,(hl)			;aae3
	jp 05767h		;aae4
L_AAE7:
	ld hl,(0e2a2h)		;aae7   ; al tercer paso, el agujero: las casillas a 0 en el mapa
	ld d,h			;aaea
	ld e,l			;aaeb
	ld bc,00102h		;aaec
	call 056deh		;aaef
	inc (ix+007h)		;aaf2
	ld hl,(0e2a2h)		;aaf5
	ld a,(0e243h)		;aaf8   ; lee la pantalla de la fase (desde 1)
	ld d,a			;aafb
	ld bc,00102h		;aafc
	xor a			;aaff
	jp 063edh		;ab00

; ----------------------------------------------------------------------
; DATOS resto_AB03: lo apuntan con el banco puesto p03:AACD (0xAB03); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p03:AACD (6 bytes)
;   0xab03..0xab09  (6 bytes)
DATA_resto_AB03:
	defb 006h,007h,008h,009h,00ah,00bh	; ab03

; ======================================================================
; CODIGO 0xab09..0xab12  (9 bytes)
; ======================================================================


L_AB09:
	call L_AC63		;ab09   ; tipo 4: cava hacia abajo mientras haya ladrillo
	sub 001h		;ab0c
	ret c			;ab0e
	call 04099h		;ab0f   ; el despachador de Konami: la tabla va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_AB12: 4 destinos del despachador p00:4099 (call en p03:AB0F, el
;   indice en A): A6FF, AB1A, AB29, AB52; lo leen p03:AB0F (8 bytes)
;   0xab12..0xab1a  (8 bytes)
DATA_tabla_AB12:
	defw 0a6ffh,0ab1ah,0ab29h,0ab52h	; ab12  -> L_A6FF L_AB1A L_AB29 L_AB52

; ======================================================================
; CODIGO 0xab1a..0xab66  (76 bytes)
; ======================================================================


L_AB1A:
	ld (ix+006h),008h		;ab1a
	ld (ix+005h),0ffh		;ab1e
	ld (ix+007h),000h		;ab22
	jp L_A921		;ab26
L_AB29:
	call L_AAA9		;ab29   ; cada 8 cuadros, el paso del agujero: los dos caracteres de 0xAB03
	ld a,(ix+007h)		;ab2c
	or a			;ab2f
	ret z			;ab30
	ld hl,(0e2a2h)		;ab31   ; la fila de debajo: si tambien es de ladrillo, sigue
	ld a,l			;ab34
	add a,008h		;ab35
	ld l,a			;ab37
	ld (0e2a2h),hl		;ab38
	call 098dch		;ab3b   ; A = la casilla del mapa de la pantalla en (H, L), sin tocar HL
	cp 002h		;ab3e
	jp nz,L_AA8C		;ab40
	ld a,h			;ab43
	add a,008h		;ab44
	ld h,a			;ab46
	call 098e2h		;ab47   ; A = la casilla del mapa de la pantalla (0xE250) en el pixel (x H, y L)
	cp 002h		;ab4a
	jp nz,L_AA8C		;ab4c
	call L_AB1A		;ab4f
L_AB52:
	call L_AAA9		;ab52   ; cada 8 cuadros, el paso del agujero: los dos caracteres de 0xAB03
	ld a,(ix+007h)		;ab55
	or a			;ab58
	ret z			;ab59
	jp L_AA8C		;ab5a
L_AB5D:
	call L_AC63		;ab5d   ; tipo 5: cava hacia el lado una vez
	sub 001h		;ab60
	ret c			;ab62
	call 04099h		;ab63   ; el despachador de Konami: la tabla va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_AB66: 3 destinos del despachador p00:4099 (call en p03:AB63, el
;   indice en A): A6FF, AB6C, AB7B; lo leen p03:AB63 (6 bytes)
;   0xab66..0xab6c  (6 bytes)
DATA_tabla_AB66:
	defw 0a6ffh,0ab6ch,0ab7bh	; ab66  -> L_A6FF L_AB6C L_AB7B

; ======================================================================
; CODIGO 0xab6c..0xabe9  (125 bytes)
; ======================================================================


L_AB6C:
	ld (ix+006h),008h		;ab6c
	ld (ix+005h),0ffh		;ab70
	ld (ix+007h),000h		;ab74
	jp L_A921		;ab78
L_AB7B:
	call L_AB86		;ab7b   ; cada 8 cuadros, el paso del agujero (tablas 0xABE9 y 0xABEF segun el lado)
	ld a,(ix+007h)		;ab7e
	or a			;ab81
	ret z			;ab82
	jp L_AA8C		;ab83
L_AB86:
	dec (ix+006h)		;ab86   ; cada 8 cuadros, el paso del agujero (tablas 0xABE9 y 0xABEF segun el lado)
	ret nz			;ab89
	ld (ix+006h),008h		;ab8a
	ld a,(ix+005h)		;ab8e
	inc a			;ab91
	cp 003h		;ab92
	jr z,L_ABCD		;ab94
	push af			;ab96
	ld hl,(0e2a2h)		;ab97
	ld d,h			;ab9a
	ld e,l			;ab9b
	ld bc,00201h		;ab9c
	call 056deh		;ab9f
	pop af			;aba2
	ld (ix+005h),a		;aba3
	add a,a			;aba6
	ld e,a			;aba7
	ld d,000h		;aba8
	ld hl,0abe9h		;abaa
	ld a,(0e294h)		;abad
	or a			;abb0
	jr z,L_ABB6		;abb1
	ld hl,0abefh		;abb3
L_ABB6:
	add hl,de			;abb6
	ex de,hl			;abb7
	ld hl,(0e2a2h)		;abb8
	ld a,(de)			;abbb
	ex de,hl			;abbc
	inc hl			;abbd
	push hl			;abbe
	push de			;abbf
	call 05767h		;abc0   ; pinta el caracter A sin su color 0 (p00:5219)
	pop de			;abc3
	pop hl			;abc4
	ld a,e			;abc5
	add a,008h		;abc6
	ld e,a			;abc8
	ld a,(hl)			;abc9
	jp 05767h		;abca
L_ABCD:
	ld hl,(0e2a2h)		;abcd   ; al tercer paso, las casillas a 0
	ld d,h			;abd0
	ld e,l			;abd1
	ld bc,00201h		;abd2
	call 056deh		;abd5
	inc (ix+007h)		;abd8
	ld hl,(0e2a2h)		;abdb
	ld a,(0e243h)		;abde   ; lee la pantalla de la fase (desde 1)
	ld d,a			;abe1
	ld bc,00201h		;abe2
	xor a			;abe5
	jp 063edh		;abe6

; ----------------------------------------------------------------------
; DATOS resto_ABE9: lo apuntan con el banco puesto p03:ABAA (0xABE9), p03:ABB3
;   (0xABEF); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p03:ABAA, p03:ABB3 (12 bytes)
;   0xabe9..0xabf5  (12 bytes)
DATA_resto_ABE9:
	defb 00ch,00dh,00eh,00fh,010h,011h,012h,013h,014h,015h,016h,017h	; abe9  ............

; ======================================================================
; CODIGO 0xabf5..0xabfe  (9 bytes)
; ======================================================================


L_ABF5:
	call L_AC63		;abf5   ; tipo 6: cava hacia el lado mientras haya ladrillo, y el personaje avanza
	sub 001h		;abf8
	ret c			;abfa
	call 04099h		;abfb   ; el despachador de Konami: la tabla va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_ABFE: 4 destinos del despachador p00:4099 (call en p03:ABFB, el
;   indice en A): A6FF, AC06, AC15, AC58; lo leen p03:ABFB (8 bytes)
;   0xabfe..0xac06  (8 bytes)
DATA_tabla_ABFE:
	defw 0a6ffh,0ac06h,0ac15h,0ac58h	; abfe  -> L_A6FF L_AC06 L_AC15 L_AC58

; ======================================================================
; CODIGO 0xac06..0xacdc  (214 bytes)
; ======================================================================


L_AC06:
	ld (ix+006h),008h		;ac06
	ld (ix+005h),0ffh		;ac0a
	ld (ix+007h),000h		;ac0e
	jp L_A921		;ac12
L_AC15:
	call L_AB86		;ac15   ; cada 8 cuadros, el paso del agujero (tablas 0xABE9 y 0xABEF segun el lado)
	ld a,(ix+007h)		;ac18
	or a			;ac1b
	ret z			;ac1c
	ld hl,(0e2a2h)		;ac1d
	ld b,0f8h		;ac20
	ld a,(0e294h)		;ac22
	or a			;ac25
	jr z,L_AC2A		;ac26
	ld b,008h		;ac28
L_AC2A:
	ld a,h			;ac2a
	add a,b			;ac2b
	ld h,a			;ac2c
	ld (0e2a2h),hl		;ac2d
	call 098dch		;ac30   ; A = la casilla del mapa de la pantalla en (H, L), sin tocar HL
	cp 002h		;ac33
	jp nz,L_AA8C		;ac35
	ld a,l			;ac38
	add a,008h		;ac39
	ld l,a			;ac3b
	call 098e2h		;ac3c   ; A = la casilla del mapa de la pantalla (0xE250) en el pixel (x H, y L)
	cp 002h		;ac3f
	jp nz,L_AA8C		;ac41
	ld a,(0e294h)		;ac44
	or a			;ac47
	ld b,008h		;ac48
	jr nz,L_AC4E		;ac4a
	ld b,0f8h		;ac4c
L_AC4E:
	ld a,(0e284h)		;ac4e   ; lee la x del personaje
	add a,b			;ac51
	ld (0e284h),a		;ac52   ; guarda la x del personaje
	jp L_AC06		;ac55
L_AC58:
	call L_AB86		;ac58   ; cada 8 cuadros, el paso del agujero (tablas 0xABE9 y 0xABEF segun el lado)
	ld a,(ix+007h)		;ac5b
	or a			;ac5e
	ret z			;ac5f
	jp L_AA8C		;ac60
L_AC63:
	ld a,(ix+000h)		;ac63   ; A = el estado de la cosa (cifra alta)
	rra			;ac66
	rra			;ac67
	rra			;ac68
	rra			;ac69
	and 00fh		;ac6a
	ret			;ac6c
L_AC6D:
	ld (0e252h),a		;ac6d   ; crea un enemigo del tipo C (1-4) en (E, D) de la pantalla A, si hay ficha libre en 0xE500
	ld a,c			;ac70
	cp 005h		;ac71
	ret nc			;ac73
	exx			;ac74
	ld hl,0e500h		;ac75   ; apunta a los enemigos (8 x 32 bytes)
	ld b,008h		;ac78
	ld de,00020h		;ac7a
	xor a			;ac7d
L_AC7E:
	cp (hl)			;ac7e
	jr z,L_AC86		;ac7f
	add hl,de			;ac81
	djnz L_AC7E		;ac82
	scf			;ac84
	ret			;ac85
L_AC86:
	push hl			;ac86
	push hl			;ac87
	pop ix		;ac88
	exx			;ac8a
	pop hl			;ac8b
	call L_AC91		;ac8c   ; la ficha: tipo, y, x, el mapa de su pantalla, la pantalla...
	xor a			;ac8f
	ret			;ac90
L_AC91:
	ld (hl),c			;ac91   ; la ficha: tipo, y, x, el mapa de su pantalla, la pantalla...
	inc l			;ac92
	ld (hl),000h		;ac93
	inc l			;ac95
	ld (hl),000h		;ac96
	inc l			;ac98
	ld (hl),e			;ac99
	inc l			;ac9a
	ld (hl),000h		;ac9b
	inc l			;ac9d
	ld (hl),d			;ac9e
	inc l			;ac9f
	ld (hl),000h		;aca0
	ld de,00006h		;aca2
	add hl,de			;aca5
	push hl			;aca6
	ld a,(0e252h)		;aca7
	call L_AD15		;acaa   ; DE = el mapa de la pantalla A
	pop hl			;acad
	ld (hl),e			;acae
	inc l			;acaf
	ld (hl),d			;acb0
	inc l			;acb1
	ld (hl),000h		;acb2
	inc l			;acb4
	ld (hl),000h		;acb5
	inc l			;acb7
	ld a,(0e252h)		;acb8
	ld (hl),a			;acbb
	inc l			;acbc
	inc l			;acbd
	ld (hl),001h		;acbe
	inc l			;acc0
	ld (hl),000h		;acc1
	inc l			;acc3
	inc l			;acc4
	ld (hl),b			;acc5
	inc l			;acc6
	push hl			;acc7
	call L_ACE4		;acc8   ; sus colores y su dibujo
	ld a,(0e252h)		;accb
	call L_B266		;acce   ; A = la casilla de la rejilla de la pantalla A
	pop hl			;acd1
	ld (hl),a			;acd2
	ld de,0ffeah		;acd3
	add hl,de			;acd6
	ld a,(hl)			;acd7
	dec a			;acd8
	call 04099h		;acd9   ; el despachador de Konami: la tabla va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_ACDC: 4 destinos del despachador p00:4099 (call en p03:ACD9, el
;   indice en A): AD2C, AD2C, B274, B67E; lo leen p03:ACD9 (8 bytes)
;   0xacdc..0xace4  (8 bytes)
DATA_tabla_ACDC:
	defw 0ad2ch,0ad2ch,0b274h,0b67eh	; acdc  -> L_AD2C L_AD2C L_B274 L_B67E

; ======================================================================
; CODIGO 0xace4..0xad09  (37 bytes)
; ======================================================================


L_ACE4:
	ld a,(0f0f4h)		;ace4   ; sus colores: en MSX2 dos (tabla 0xAD0B), en MSX1 uno (0xAD08)
	and a			;ace7
	ld a,(ix+000h)		;ace8
	jr z,L_ACFE		;aceb
	add a,a			;aced
	ld de,0ad0bh		;acee
	call 04094h		;acf1   ; suma A a DE (DE = DE + A)
	ld a,(de)			;acf4
	ld (ix+01eh),a		;acf5
	inc de			;acf8
	ld a,(de)			;acf9
	ld (ix+01fh),a		;acfa
	ret			;acfd
L_ACFE:
	ld de,lad08h		;acfe
	call 04094h		;ad01   ; suma A a DE (DE = DE + A)
	ld a,(de)			;ad04
	ld (ix+01eh),a		;ad05
L_AD08:
	ret			;ad08

; ----------------------------------------------------------------------
; DATOS resto_AD09: lo apuntan con el banco puesto p03:ACEE (0xAD0B), p01:744A
;   (0xAD12); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p03:ACEE, p01:744A (12 bytes)
;   0xad09..0xad15  (12 bytes)
DATA_resto_AD09:
	defb 00fh,00ah,00ah,009h,00bh,04ch,00ah,047h,00bh,04ch,00bh,04ch	; ad09  .....L.G.L.L

; ======================================================================
; CODIGO 0xad15..0xad86  (113 bytes)
; ======================================================================


L_AD15:
	dec a			;ad15   ; DE = el mapa de la pantalla A
	ld h,a			;ad16
	ld l,000h		;ad17
	ld e,l			;ad19
	ld d,h			;ad1a
	srl d		;ad1b
	rr e		;ad1d
	srl d		;ad1f
	rr e		;ad21
	and a			;ad23
	sbc hl,de		;ad24
	ld de,0e900h		;ad26   ; apunta a el mapa de la fase: 0xC0 bytes por pantalla, 4 casillas por byte
	add hl,de			;ad29
	ex de,hl			;ad2a
	ret			;ad2b
L_AD2C:
	ld (ix+018h),000h		;ad2c   ; el enemigo sale de su sitio: el dibujo de salida (0x93B2) y espera 0x20
	ld (ix+011h),0ffh		;ad30
	ld hl,093b2h		;ad34
	call L_AD53		;ad37   ; pinta 3 x 2 caracteres en el sitio del enemigo
	call L_B223		;ad3a   ; C = el lado hacia el personaje (0 izquierda, 1 derecha), por columnas de la rejilla o por x
	inc c			;ad3d
	inc c			;ad3e
	ld (ix+00bh),c		;ad3f
	ld a,(ix+000h)		;ad42
	dec a			;ad45
	call z,L_AE1A		;ad46   ; da la vuelta (IX+0B xor 1)
	ld (ix+014h),020h		;ad49
	ld hl,04271h		;ad4d
	jp L_B294		;ad50
L_AD53:
	ld a,(0e243h)		;ad53   ; pinta 3 x 2 caracteres en el sitio del enemigo
	cp (ix+010h)		;ad56
	ret nz			;ad59
	push ix		;ad5a
	push hl			;ad5c
	call 096ffh		;ad5d   ; devuelve el fondo de los bloques de esta pantalla
	call 090abh		;ad60   ; las cosas de la lista 0xEE50 (por numero): lo que habia debajo se devuelve
	pop hl			;ad63
	pop ix		;ad64
	ld a,(ix+003h)		;ad66
	sub 008h		;ad69
	ld e,a			;ad6b
	ld d,(ix+005h)		;ad6c
	ld bc,00302h		;ad6f
	call 0573bh		;ad72   ; un rectangulo de caracteres de HL: B filas de C, sin pintar el color 0
	push ix		;ad75
	call 090f7h		;ad77   ; las de la lista, al reves: guarda el fondo y pinta la cosa
	call 096cfh		;ad7a   ; pinta los bloques de esta pantalla
	pop ix		;ad7d
	ret			;ad7f
L_AD80:
	ld a,(ix+001h)		;ad80   ; un cuadro de un enemigo de tipo 1, por pasos (IX+01)
	call 04099h		;ad83   ; el despachador de Konami: la tabla va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_AD86: 5 destinos del despachador p00:4099 (call en p03:AD83, el
;   indice en A): AE35, AE55, AD90, ADBB, ADFA; lo leen p03:AD83 (10 bytes)
;   0xad86..0xad90  (10 bytes)
DATA_tabla_AD86:
	defw 0ae35h,0ae55h,0ad90h,0adbbh,0adfah	; ad86

; ======================================================================
; CODIGO 0xad90..0xae29  (153 bytes)
; ======================================================================


L_AD90:
	call L_B15E		;ad90   ; paso 2: espera y empieza a andar
	ld a,004h		;ad93
	jp c,L_AF2C		;ad95
	ld (ix+011h),000h		;ad98
	dec (ix+014h)		;ad9c
	ret nz			;ad9f
	ld de,00180h		;ada0
	call L_B29C		;ada3   ; la velocidad en x
	call L_AE1A		;ada6   ; da la vuelta (IX+0B xor 1)
	call L_B165		;ada9   ; NC si puede avanzar hacia donde mira
	jp c,L_AE51		;adac
	call L_AE1A		;adaf   ; da la vuelta (IX+0B xor 1)
	call L_B165		;adb2   ; NC si puede avanzar hacia donde mira
	jp nc,06608h		;adb5
	jp L_AE51		;adb8
L_ADBB:
	ld (ix+006h),001h		;adbb   ; paso 3: anda
	call L_AF14		;adbf   ; el dibujo al andar: segun el lado y cada 4 cuadros
	call L_B15E		;adc2   ; NC si no tiene suelo
	jr nc,L_ADCF		;adc5
	call L_B833		;adc7   ; se centra en la casilla en la direccion en la que va
	ld a,004h		;adca
	jp L_AF2C		;adcc
L_ADCF:
	call L_B165		;adcf   ; NC si puede avanzar hacia donde mira
	jr nc,L_ADDF		;add2
	call L_B00F		;add4   ; A = el borde por el que el enemigo saldria hacia la pantalla del personaje (0 si esta en ella)
	dec a			;add7
	cp (ix+00bh)		;add8
	ret nz			;addb
	jp L_B0A6		;addc
L_ADDF:
	inc (ix+018h)		;addf
	ld a,(ix+018h)		;ade2
	cp 010h		;ade5
	jp nc,06608h		;ade7
L_ADEA:
	call L_B833		;adea   ; se centra en la casilla en la direccion en la que va
	ld (ix+014h),010h		;aded
	ld (ix+006h),000h		;adf1
	ld (ix+001h),002h		;adf5
	ret			;adf9
L_ADFA:
	ld (ix+006h),001h		;adfa   ; paso 4: cae; al llegar al suelo vuelve a andar hacia el otro lado
	call L_B17A		;adfe   ; C si puede seguir cayendo
	ret c			;ae01
	call L_B833		;ae02   ; se centra en la casilla en la direccion en la que va
	call L_B548		;ae05   ; el sonido 0x14 si esta en esta pantalla
	call L_ADEA		;ae08
	ld (ix+006h),000h		;ae0b
	ld a,(ix+019h)		;ae0f
	xor 001h		;ae12
	or 002h		;ae14
	ld (ix+00bh),a		;ae16
	ret			;ae19
L_AE1A:
	ld a,(ix+00bh)		;ae1a   ; da la vuelta (IX+0B xor 1)
	xor 001h		;ae1d
	ld (ix+00bh),a		;ae1f
	ret			;ae22
L_AE23:
	ld a,(ix+001h)		;ae23   ; un cuadro de un enemigo de tipo 2, por pasos (IX+01)
	call 04099h		;ae26   ; el despachador de Konami: la tabla va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_AE29: 6 destinos del despachador p00:4099 (call en p03:AE26, el
;   indice en A): AE35, AE55, AE8B, AEB5, AF4E, AF8A; lo leen p03:AE26 (12
;   bytes)
;   0xae29..0xae35  (12 bytes)
DATA_tabla_AE29:
	defw 0ae35h,0ae55h,0ae8bh,0aeb5h,0af4eh,0af8ah	; ae29

; ======================================================================
; CODIGO 0xae35..0xb0f1  (700 bytes)
; ======================================================================


L_AE35:
	dec (ix+014h)		;ae35   ; paso 0: espera, pinta su salida (0x93B8), el sonido 0x41 y ya mata (IX+13 = 2)
	ret nz			;ae38
	ld hl,093b8h		;ae39
	call L_AD53		;ae3c   ; pinta 3 x 2 caracteres en el sitio del enemigo
	ld hl,04307h		;ae3f
	call L_B294		;ae42   ; si esta en esta pantalla, salta a HL (un sonido)
	ld (ix+013h),002h		;ae45
	ld (ix+011h),000h		;ae49
	ld (ix+014h),020h		;ae4d
L_AE51:
	inc (ix+001h)		;ae51   ; el paso siguiente
	ret			;ae54
L_AE55:
	dec (ix+014h)		;ae55   ; paso 1: espera, borra la salida, ya mata y se le puede matar (IX+13 = 3), el sonido 0x25
	ret nz			;ae58
	call L_AE6F		;ae59   ; borra los 3 x 2 caracteres de la salida y pinta el sitio (0x93AC)
	ld (ix+013h),003h		;ae5c
	ld (ix+014h),020h		;ae60
	ld a,(0e243h)		;ae64   ; lee la pantalla de la fase (desde 1)
	cp (ix+010h)		;ae67
	call z,04294h		;ae6a   ; pide el sonido 0x25
	jr L_AE51		;ae6d
L_AE6F:
	ld a,(0e243h)		;ae6f   ; borra los 3 x 2 caracteres de la salida y pinta el sitio (0x93AC)
	cp (ix+010h)		;ae72
	ret nz			;ae75
	ld d,(ix+005h)		;ae76
	ld a,(ix+003h)		;ae79
	sub 008h		;ae7c
	ld e,a			;ae7e
	ld bc,00302h		;ae7f
	call 056deh		;ae82
	ld hl,093ach		;ae85
	jp L_AD53		;ae88
L_AE8B:
	call L_B15E		;ae8b   ; paso 2: espera y sale hacia el personaje
	jp c,L_AF2A		;ae8e
	ld (ix+011h),000h		;ae91
	dec (ix+014h)		;ae95
	ret nz			;ae98
	call L_B211		;ae99   ; la cuenta IX+0E a cero
	call L_AFAA		;ae9c   ; mira hacia el personaje
	ld de,00180h		;ae9f
	call L_B29C		;aea2   ; la velocidad en x
	call L_B165		;aea5   ; NC si puede avanzar hacia donde mira
	jr c,L_AE51		;aea8
	call L_AE1A		;aeaa   ; da la vuelta (IX+0B xor 1)
	call L_B165		;aead   ; NC si puede avanzar hacia donde mira
	jp nc,06608h		;aeb0
	jr L_AE51		;aeb3
L_AEB5:
	ld (ix+006h),001h		;aeb5   ; paso 3: anda; si el personaje esta en otra pantalla, va hacia ella
	call L_AF14		;aeb9   ; el dibujo al andar: segun el lado y cada 4 cuadros
	call L_B15E		;aebc   ; NC si no tiene suelo
	jr nc,L_AEC6		;aebf
	call L_B833		;aec1   ; se centra en la casilla en la direccion en la que va
	jr L_AF2A		;aec4
L_AEC6:
	call L_B00F		;aec6   ; A = el borde por el que el enemigo saldria hacia la pantalla del personaje (0 si esta en ella)
	dec a			;aec9
	cp (ix+00bh)		;aeca
	jp z,L_B0A6		;aecd
	call L_B165		;aed0   ; NC si puede avanzar hacia donde mira
	jr c,L_AEE6		;aed3
	call L_B833		;aed5   ; se centra en la casilla en la direccion en la que va
	inc (ix+018h)		;aed8
	ld a,(ix+018h)		;aedb
	cp 010h		;aede
	jp nc,06608h		;aee0
	jp L_AF7D		;aee3
L_AEE6:
	call L_B23F		;aee6   ; en la misma columna de la rejilla: sube o baja segun el personaje
	dec c			;aee9
	ret m			;aeea
	jr z,L_AEF5		;aeeb
	call L_B143		;aeed   ; Z si debajo hay escalera
	ret nz			;aef0
	ld a,001h		;aef1
	jr L_AEFA		;aef3
L_AEF5:
	call L_B150		;aef5   ; Z si a su altura hay escalera
	ret nz			;aef8
	xor a			;aef9
L_AEFA:
	ld (ix+00bh),a		;aefa
	ld de,00280h		;aefd
	call L_B2A3		;af00   ; la velocidad en y
	ld de,00000h		;af03
	call L_B29C		;af06   ; la velocidad en x
	ld a,(ix+005h)		;af09
	and 0f8h		;af0c
	ld (ix+005h),a		;af0e
	jp L_AE51		;af11
L_AF14:
	ld c,001h		;af14   ; el dibujo al andar: segun el lado y cada 4 cuadros
	bit 0,(ix+00bh)		;af16
	jr z,L_AF1E		;af1a
	ld c,003h		;af1c
L_AF1E:
	ld a,(0e203h)		;af1e   ; lee la cuenta de cuadros
	and 004h		;af21
	jr z,L_AF26		;af23
	inc c			;af25
L_AF26:
	ld (ix+011h),c		;af26
	ret			;af29
L_AF2A:
	ld a,005h		;af2a   ; cae (paso 5)
L_AF2C:
	ld (ix+001h),a		;af2c   ; pasa al paso A: cae con velocidad 5 en y
	xor a			;af2f
	ld (ix+009h),a		;af30
	ld (ix+00ah),a		;af33
	ld a,(ix+00bh)		;af36
	ld (ix+019h),a		;af39
	ld (ix+00bh),001h		;af3c
	ld (ix+007h),000h		;af40
	ld (ix+008h),005h		;af44
L_AF48:
	ld hl,042b3h		;af48   ; el sonido 0x2C si esta en esta pantalla
	jp L_B294		;af4b
L_AF4E:
	ld (ix+006h),001h		;af4e   ; paso: cae hasta el suelo
	ld c,005h		;af52
	call L_AF1E		;af54
	call L_B0F9		;af57   ; C si al moverse en vertical choca
	jp c,L_AF73		;af5a
	call L_B00F		;af5d   ; A = el borde por el que el enemigo saldria hacia la pantalla del personaje (0 si esta en ella)
	dec a			;af60
	cp (ix+00bh)		;af61
	jr z,L_AF6A		;af64
	call L_B165		;af66   ; NC si puede avanzar hacia donde mira
	ret c			;af69
L_AF6A:
	ld a,(ix+00bh)		;af6a
	xor 001h		;af6d
	ld (ix+00bh),a		;af6f
	ret			;af72
L_AF73:
	call L_B833		;af73   ; se centra en la casilla en la direccion en la que va
	xor a			;af76
	ld (ix+002h),a		;af77
	ld (ix+018h),a		;af7a
L_AF7D:
	ld (ix+014h),010h		;af7d
	ld (ix+006h),000h		;af81
	ld (ix+001h),002h		;af85
	ret			;af89
L_AF8A:
	ld (ix+006h),001h		;af8a   ; paso: cae; al llegar al suelo, vuelve a andar
	call L_B17A		;af8e   ; C si puede seguir cayendo
	ret c			;af91
	call L_B833		;af92   ; se centra en la casilla en la direccion en la que va
	call L_B548		;af95   ; el sonido 0x14 si esta en esta pantalla
	call L_AF7D		;af98
	ld a,(ix+019h)		;af9b
	xor 001h		;af9e
	or 003h		;afa0
	ld (ix+00bh),a		;afa2
	ld (ix+006h),000h		;afa5
	ret			;afa9
L_AFAA:
	call L_B223		;afaa   ; mira hacia el personaje
	ld a,c			;afad
	or 002h		;afae
	ld (ix+00bh),a		;afb0
	ret			;afb3
L_AFB4:
	ld ix,0e500h		;afb4   ; al entrar en una pantalla, se quitan los enemigos que esten a menos de 24 pixeles del personaje
	call 09a0bh		;afb8   ; E = la y del personaje, D = su x
	ld b,008h		;afbb
L_AFBD:
	ld a,(ix+000h)		;afbd
	and a			;afc0
	jr z,L_AFEC		;afc1
	bit 0,(ix+013h)		;afc3
	jr z,L_AFEC		;afc7
	ld a,(0e243h)		;afc9   ; lee la pantalla de la fase (desde 1)
	cp (ix+010h)		;afcc
	jr nz,L_AFEC		;afcf
	ld a,(ix+003h)		;afd1
	sub e			;afd4
	add a,018h		;afd5
	cp 030h		;afd7
	jr nc,L_AFEC		;afd9
	ld a,(ix+005h)		;afdb
	sub d			;afde
	add a,018h		;afdf
	cp 030h		;afe1
	jr nc,L_AFEC		;afe3
	push de			;afe5
	push bc			;afe6
	call L_AFF6		;afe7   ; el enemigo de tipo 4 en los pasos 1 o 4 deja algo (0xB9F0); todos se van
	pop bc			;afea
	pop de			;afeb
L_AFEC:
	ex de,hl			;afec
	ld de,00020h		;afed
	add ix,de		;aff0
	ex de,hl			;aff2
	djnz L_AFBD		;aff3
	ret			;aff5
L_AFF6:
	ld a,(ix+000h)		;aff6   ; el enemigo de tipo 4 en los pasos 1 o 4 deja algo (0xB9F0); todos se van
	cp 004h		;aff9
	jp nz,06706h		;affb
	ld a,(ix+001h)		;affe
	cp 004h		;b001
	jr z,L_B009		;b003
	dec a			;b005
	jp nz,06706h		;b006
L_B009:
	call L_B9F0		;b009   ; quita del mapa sus cuatro casillas, devolviendo lo que habia
	jp 06706h		;b00c
L_B00F:
	ld a,(0e243h)		;b00f   ; A = el borde por el que el enemigo saldria hacia la pantalla del personaje (0 si esta en ella)
	cp (ix+010h)		;b012
	jp z,L_B0A4		;b015
	call 09a0bh		;b018   ; E = la y del personaje, D = su x
	ld l,(ix+003h)		;b01b
	ld h,(ix+005h)		;b01e
	ld a,(ix+00bh)		;b021
	ret z			;b024
	dec a			;b025
	jr z,L_B048		;b026
	dec a			;b028
	jr z,L_B062		;b029
	dec a			;b02b
	jr z,L_B07C		;b02c
	ld a,l			;b02e
	cp 018h		;b02f
	jr nc,L_B0A4		;b031
	ld a,e			;b033
	cp 098h		;b034
	jr c,L_B0A4		;b036
	ld a,h			;b038
	sub d			;b039
	add a,018h		;b03a
	cp 030h		;b03c
	jr nc,L_B0A4		;b03e
	ld a,001h		;b040
	call L_B096		;b042   ; Z si la pantalla de ese lado es la del personaje
	jr nz,L_B0A4		;b045
	ret			;b047
L_B048:
	ld a,l			;b048   ; por abajo
	cp 098h		;b049
	jr c,L_B0A4		;b04b
	ld a,e			;b04d
	cp 010h		;b04e
	jr nc,L_B0A4		;b050
	ld a,h			;b052
	sub d			;b053
	add a,018h		;b054
	cp 030h		;b056
	jr nc,L_B0A4		;b058
	ld a,002h		;b05a
	call L_B096		;b05c   ; Z si la pantalla de ese lado es la del personaje
	jr nz,L_B0A4		;b05f
	ret			;b061
L_B062:
	ld a,h			;b062   ; por la izquierda
	cp 018h		;b063
	jr nc,L_B0A4		;b065
	ld a,d			;b067
	cp 0d8h		;b068
	jr c,L_B0A4		;b06a
	ld a,l			;b06c
	sub e			;b06d
	add a,018h		;b06e
	cp 030h		;b070
	jr nc,L_B0A4		;b072
	ld a,003h		;b074
	call L_B096		;b076   ; Z si la pantalla de ese lado es la del personaje
	jr nz,L_B0A4		;b079
	ret			;b07b
L_B07C:
	ld a,h			;b07c   ; por la derecha
	cp 0d8h		;b07d
	jr c,L_B0A4		;b07f
	ld a,d			;b081
	cp 018h		;b082
	jr nc,L_B0A4		;b084
	ld a,l			;b086
	sub e			;b087
	add a,018h		;b088
	cp 030h		;b08a
	jr nc,L_B0A4		;b08c
	ld a,004h		;b08e
	call L_B096		;b090   ; Z si la pantalla de ese lado es la del personaje
	jr nz,L_B0A4		;b093
	ret			;b095
L_B096:
	push af			;b096   ; Z si la pantalla de ese lado es la del personaje
	ld b,(ix+016h)		;b097
	call 05e38h		;b09a
	ld a,(0e244h)		;b09d   ; lee la casilla de la rejilla de la pantalla
	cp h			;b0a0
	pop bc			;b0a1
	ld a,b			;b0a2
	ret			;b0a3
L_B0A4:
	xor a			;b0a4
	ret			;b0a5
L_B0A6:
	ld a,(ix+00bh)		;b0a6   ; pasa por el borde: su sitio en la pantalla nueva, si alli esta libre
	add a,a			;b0a9
	ld hl,0b0f1h		;b0aa
	call 0408fh		;b0ad   ; suma A a HL (HL = HL + A)
	ld c,(hl)			;b0b0
	inc hl			;b0b1
	ld b,(hl)			;b0b2
	call L_B216		;b0b3   ; DE = el mapa del enemigo
	ld a,c			;b0b6
	add a,l			;b0b7
	ld l,a			;b0b8
	ld a,b			;b0b9
	add a,h			;b0ba
	ld h,a			;b0bb
	call L_B0E5		;b0bc   ; C si la casilla esta libre
	ret nc			;b0bf
	ld a,008h		;b0c0
	add a,h			;b0c2
	ld h,a			;b0c3
	call L_B0E5		;b0c4   ; C si la casilla esta libre
	ret nc			;b0c7
	ld a,008h		;b0c8
	add a,l			;b0ca
	ld l,a			;b0cb
	call L_B0E5		;b0cc   ; C si la casilla esta libre
	ld a,0f8h		;b0cf
	add a,h			;b0d1
	ld h,a			;b0d2
	call L_B0E5		;b0d3   ; C si la casilla esta libre
	ret nc			;b0d6
	call L_B21C		;b0d7   ; L = la y del enemigo, H = su x
	ld a,c			;b0da
	add a,l			;b0db
	ld (ix+003h),a		;b0dc
	ld a,b			;b0df
	add a,h			;b0e0
	ld (ix+005h),a		;b0e1
	ret			;b0e4
L_B0E5:
	push de			;b0e5   ; C si la casilla esta libre
	push hl			;b0e6
	push bc			;b0e7
	call 098e6h		;b0e8   ; A = la casilla del mapa de DE en el pixel (H, L): 0 libre, 1-3 ladrillo o cosa
	pop bc			;b0eb
	pop hl			;b0ec
	pop de			;b0ed
	sub 001h		;b0ee
	ret			;b0f0

; ----------------------------------------------------------------------
; DATOS resto_B0F1: lo apuntan con el banco puesto p03:B0AA (0xB0F1); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p03:B0AA (8 bytes)
;   0xb0f1..0xb0f9  (8 bytes)
DATA_resto_B0F1:
	defb 010h,000h,0f0h,000h,000h,010h,000h,0f0h	; b0f1  ........

; ======================================================================
; CODIGO 0xb0f9..0xb13d  (68 bytes)
; ======================================================================


L_B0F9:
	ld a,(ix+00bh)		;b0f9   ; C si al moverse en vertical choca
	dec a			;b0fc
	jr z,L_B128		;b0fd
L_B0FF:
	call L_B1AC		;b0ff   ; el sitio al que iria con su velocidad (C si se sale de la pantalla)
	ccf			;b102
	ret nc			;b103
	ld a,l			;b104
	add a,007h		;b105
	and 0f8h		;b107
	ld l,a			;b109
	call L_B12F		;b10a   ; Z si en el mapa del enemigo la casilla es escalera (1)
	ret z			;b10d
	ld a,008h		;b10e
	add a,l			;b110
	ld l,a			;b111
	call L_B12F		;b112   ; Z si en el mapa del enemigo la casilla es escalera (1)
	ret z			;b115
	ld a,008h		;b116
	add a,h			;b118
	ld h,a			;b119
	call L_B12F		;b11a   ; Z si en el mapa del enemigo la casilla es escalera (1)
	ret z			;b11d
	ld a,l			;b11e
	sub 008h		;b11f
	ld l,a			;b121
	call L_B12F		;b122   ; Z si en el mapa del enemigo la casilla es escalera (1)
	ret z			;b125
	scf			;b126
	ret			;b127
L_B128:
	call L_B165		;b128   ; NC si puede avanzar hacia donde mira
	ccf			;b12b
	ret c			;b12c
	jr L_B0FF		;b12d
L_B12F:
	ld e,(ix+00ch)		;b12f   ; Z si en el mapa del enemigo la casilla es escalera (1)
	ld d,(ix+00dh)		;b132
	push hl			;b135
	call 098e6h		;b136   ; A = la casilla del mapa de DE en el pixel (H, L): 0 libre, 1-3 ladrillo o cosa
	pop hl			;b139
	and a			;b13a
	dec a			;b13b
	ret			;b13c

; ----------------------------------------------------------------------
; DATOS sin identificar  0xb13d..0xb143  (6 bytes)
DATA_B13D:
	defb 0cdh,050h,0b1h,00eh,000h,0c8h	; b13d

; ======================================================================
; CODIGO 0xb143..0xb208  (197 bytes)
; ======================================================================


L_B143:
	call L_B21C		;b143   ; Z si debajo hay escalera
	ld a,010h		;b146
	add a,l			;b148
	ld l,a			;b149
	call L_B153		;b14a
	ld c,001h		;b14d
	ret			;b14f
L_B150:
	call L_B21C		;b150   ; Z si a su altura hay escalera
L_B153:
	call L_B12F		;b153   ; Z si en el mapa del enemigo la casilla es escalera (1)
	ret nz			;b156
	ld a,h			;b157
	add a,008h		;b158
	ld h,a			;b15a
	jp L_B12F		;b15b
L_B15E:
	call L_B21C		;b15e   ; NC si no tiene suelo
	ld c,001h		;b161
	jr L_B181		;b163
L_B165:
	ld c,(ix+00bh)		;b165   ; NC si puede avanzar hacia donde mira
L_B168:
	call L_B1AC		;b168   ; el sitio al que iria con su velocidad (C si se sale de la pantalla)
	ret c			;b16b
	ld e,(ix+00ch)		;b16c
	ld d,(ix+00dh)		;b16f
	push hl			;b172
	push de			;b173
	call 09933h		;b174   ; lo mismo con el mapa de DE
	pop de			;b177
	pop hl			;b178
	ret			;b179
L_B17A:
	ld c,(ix+00bh)		;b17a   ; C si puede seguir cayendo
	call L_B1AC		;b17d   ; el sitio al que iria con su velocidad (C si se sale de la pantalla)
	ret c			;b180
L_B181:
	ld e,(ix+00ch)		;b181
	ld d,(ix+00dh)		;b184
	call 0995ah		;b187   ; el primer punto de la orilla segun la direccion C (1 abajo, 2 izquierda, 3 derecha, si no arriba)
	call L_B191		;b18a   ; C si la casilla esta libre
	ret nc			;b18d
	call L_B19D		;b18e
L_B191:
	push hl			;b191   ; C si la casilla esta libre
	push de			;b192
	push bc			;b193
	call 098e6h		;b194   ; A = la casilla del mapa de DE en el pixel (H, L): 0 libre, 1-3 ladrillo o cosa
	pop bc			;b197
	pop de			;b198
	pop hl			;b199
	sub 001h		;b19a
	ret			;b19c
L_B19D:
	ld a,c			;b19d
	cp 002h		;b19e
	jr c,L_B1A7		;b1a0
	ld a,l			;b1a2
	add a,008h		;b1a3
	ld l,a			;b1a5
	ret			;b1a6
L_B1A7:
	ld a,h			;b1a7
	add a,008h		;b1a8
	ld h,a			;b1aa
	ret			;b1ab
L_B1AC:
	ld a,(ix+006h)		;b1ac   ; el sitio al que iria con su velocidad (C si se sale de la pantalla)
	and a			;b1af
	jp z,L_B21C		;b1b0
	ld a,c			;b1b3
	dec a			;b1b4
	jr z,L_B1C0		;b1b5
	dec a			;b1b7
	jr z,L_B1DC		;b1b8
	dec a			;b1ba
	jr z,L_B1DF		;b1bb
	xor a			;b1bd
	jr L_B1C2		;b1be
L_B1C0:
	ld a,001h		;b1c0
L_B1C2:
	ld l,(ix+002h)		;b1c2
	ld h,(ix+003h)		;b1c5
	ld e,(ix+007h)		;b1c8
	ld d,(ix+008h)		;b1cb
	and a			;b1ce
	call z,L_B200		;b1cf   ; DE = -DE
	add hl,de			;b1d2
	ld l,h			;b1d3
	ld h,(ix+005h)		;b1d4
	ld a,l			;b1d7
	cp 0c0h		;b1d8
	ccf			;b1da
	ret			;b1db
L_B1DC:
	xor a			;b1dc
	jr L_B1E1		;b1dd
L_B1DF:
	ld a,001h		;b1df
L_B1E1:
	ld l,(ix+004h)		;b1e1
	ld h,(ix+005h)		;b1e4
	ld e,(ix+009h)		;b1e7
	ld b,h			;b1ea
	ld d,(ix+00ah)		;b1eb
	and a			;b1ee
	call z,L_B200		;b1ef   ; DE = -DE
	add hl,de			;b1f2
	ld l,(ix+003h)		;b1f3
	ld a,h			;b1f6
	sub b			;b1f7
	jr nc,L_B1FC		;b1f8
	neg		;b1fa
L_B1FC:
	cp 080h		;b1fc
	ccf			;b1fe
	ret			;b1ff
L_B200:
	ld a,e			;b200   ; DE = -DE
	cpl			;b201
	ld e,a			;b202
	ld a,d			;b203
	cpl			;b204
	ld d,a			;b205
	inc de			;b206
	ret			;b207

; ----------------------------------------------------------------------
; DATOS sin identificar  0xb208..0xb20a  (2 bytes)
DATA_B208:
	defb 03eh,004h	; b208

; ======================================================================
; CODIGO 0xb20a..0xb2b0  (166 bytes)
; ======================================================================


L_B20A:
	inc (ix+00eh)		;b20a   ; sube la cuenta IX+0E y la compara con A
	cp (ix+00eh)		;b20d
	ret			;b210
L_B211:
	xor a			;b211   ; la cuenta IX+0E a cero
	ld (ix+00eh),a		;b212
	ret			;b215
L_B216:
	ld e,(ix+00ch)		;b216   ; DE = el mapa del enemigo
	ld d,(ix+00dh)		;b219
L_B21C:
	ld l,(ix+003h)		;b21c   ; L = la y del enemigo, H = su x
	ld h,(ix+005h)		;b21f
	ret			;b222
L_B223:
	ld a,(ix+016h)		;b223   ; C = el lado hacia el personaje (0 izquierda, 1 derecha), por columnas de la rejilla o por x
	and 007h		;b226
	ld c,a			;b228
	ld a,(0e244h)		;b229   ; lee la casilla de la rejilla de la pantalla
	and 007h		;b22c
	cp c			;b22e
	ld c,000h		;b22f
	jr z,L_B236		;b231
	ret c			;b233
	inc c			;b234
	ret			;b235
L_B236:
	ld a,(0e284h)		;b236   ; lee la x del personaje
	cp (ix+005h)		;b239
	ret c			;b23c
	inc c			;b23d
	ret			;b23e
L_B23F:
	ld a,(ix+016h)		;b23f   ; C = arriba o abajo hacia el personaje (0 igual, 1 arriba, 2 abajo)
	and 038h		;b242
	ld c,a			;b244
	ld a,(0e244h)		;b245   ; lee la casilla de la rejilla de la pantalla
	and 038h		;b248
	cp c			;b24a
	ld c,000h		;b24b
	jr z,L_B253		;b24d
	inc c			;b24f
	ret c			;b250
	inc c			;b251
	ret			;b252
L_B253:
	ld a,(0e282h)		;b253   ; lee la y del personaje
	sub (ix+003h)		;b256
	jr c,L_B261		;b259
	cp 010h		;b25b
	ret c			;b25d
	ld c,002h		;b25e
	ret			;b260
L_B261:
	add a,010h		;b261
	ret c			;b263
	inc c			;b264
	ret			;b265
L_B266:
	ld hl,0e788h		;b266   ; A = la casilla de la rejilla de la pantalla A
	ld bc,00040h		;b269
	cpir		;b26c
	ld a,c			;b26e
	sub 03fh		;b26f
	neg		;b271
	ret			;b273
L_B274:
	ld (ix+01bh),0ffh		;b274   ; sale un enemigo de tipo 3: mira hacia el personaje
	ld (ix+01dh),080h		;b278
	call L_B223		;b27c   ; C = el lado hacia el personaje (0 izquierda, 1 derecha), por columnas de la rejilla o por x
	ld a,c			;b27f
	or 002h		;b280
	ld (ix+00bh),a		;b282
	ld (ix+011h),018h		;b285
	ld (ix+018h),0ffh		;b289
	ld (ix+01ch),000h		;b28d
	ld hl,0426ch		;b291
L_B294:
	ld a,(0e243h)		;b294   ; si esta en esta pantalla, salta a HL (un sonido)
	cp (ix+010h)		;b297
	ret nz			;b29a
	jp (hl)			;b29b
L_B29C:
	ld (ix+009h),e		;b29c   ; la velocidad en x
	ld (ix+00ah),d		;b29f
	ret			;b2a2
L_B2A3:
	ld (ix+007h),e		;b2a3   ; la velocidad en y
	ld (ix+008h),d		;b2a6
	ret			;b2a9
L_B2AA:
	ld a,(ix+001h)		;b2aa   ; un cuadro de un enemigo de tipo 3, por pasos (IX+01)
	call 04099h		;b2ad   ; el despachador de Konami: la tabla va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_B2B0: 5 destinos del despachador p00:4099 (call en p03:B2AD, el
;   indice en A): B2BA, B307, B4BB, B5B7, B5FB; lo leen p03:B2AD (10 bytes)
;   0xb2b0..0xb2ba  (10 bytes)
DATA_tabla_B2B0:
	defw 0b2bah,0b307h,0b4bbh,0b5b7h,0b5fbh	; b2b0

; ======================================================================
; CODIGO 0xb2ba..0xb2f4  (58 bytes)
; ======================================================================


L_B2BA:
	ld a,(0f0f4h)		;b2ba   ; paso 0: el dibujo de salida (tablas 0xB2F4 y 0xB2FE); en MSX2 sus colores 0x0A y 0x47
	ld hl,0b2f4h		;b2bd
	ld de,0b2feh		;b2c0
	call L_B6E0		;b2c3   ; el dibujo de salida: cada 8 cuadros el siguiente de la tabla (0xFF acaba)
	jr z,L_B2E8		;b2c6
	cp 007h		;b2c8
	jr nz,L_B2E4		;b2ca
	bit 0,(ix+00bh)		;b2cc
	jr z,L_B2D3		;b2d0
	inc a			;b2d2
L_B2D3:
	ld (ix+011h),a		;b2d3
	ld a,(0f0f4h)		;b2d6   ; lee la marca de MSX2 (1 en el cartucho de MSX2, 0 en el de MSX1)
	and a			;b2d9
	ret z			;b2da
	ld (ix+01eh),00ah		;b2db
	ld (ix+01fh),047h		;b2df
	ret			;b2e3
L_B2E4:
	ld (ix+011h),a		;b2e4
	ret			;b2e7
L_B2E8:
	ld (ix+014h),008h		;b2e8   ; sale: ya mata y se le puede matar
	ld (ix+013h),003h		;b2ec
L_B2F0:
	inc (ix+001h)		;b2f0   ; el paso siguiente
	ret			;b2f3

; ----------------------------------------------------------------------
; DATOS resto_B2F4: lo apuntan con el banco puesto p03:B2BD (0xB2F4), p03:B2C0
;   (0xB2FE); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p03:B2BD, p03:B2C0 (19 bytes)
;   0xb2f4..0xb307  (19 bytes)
DATA_resto_B2F4:
	defb 018h,019h,018h,019h,018h,019h,01ah,007h,007h,0ffh,018h,019h,018h,019h,018h,019h	; b2f4  ................
	defb 007h,007h,0ffh	; b304

; ======================================================================
; CODIGO 0xb307..0xb595  (654 bytes)
; ======================================================================


L_B307:
	call L_B552		;b307   ; paso 1: anda y salta hacia el personaje
	jp z,L_B50B		;b30a
	ld c,009h		;b30d
	call L_B4AF		;b30f   ; el dibujo C (o C + 2 mirando a la derecha)
	dec (ix+014h)		;b312
	ret nz			;b315
	ld a,(ix+01dh)		;b316
	cp 002h		;b319
	jr nc,L_B329		;b31b
	ld a,(ix+018h)		;b31d
	sub (ix+005h)		;b320
	add a,00ch		;b323
	cp 019h		;b325
	jr c,L_B33C		;b327
L_B329:
	call L_B23F		;b329   ; C = arriba o abajo hacia el personaje (0 igual, 1 arriba, 2 abajo)
	dec c			;b32c
	jp z,L_B417		;b32d
	dec c			;b330
	jp z,L_B452		;b331
	ld a,(ix+01ch)		;b334
	cp 002h		;b337
	jp nc,L_B3F5		;b339
L_B33C:
	call L_B60E		;b33c   ; salta hacia su lado si puede; si no, da la vuelta; tras 16 intentos se va a otra pantalla
	call L_B385		;b33f   ; C si puede saltar (no hay techo encima)
	jr c,L_B35F		;b342
	ld a,(ix+00bh)		;b344
	xor 001h		;b347
	or 002h		;b349
	ld (ix+00bh),a		;b34b
	call L_B385		;b34e   ; C si puede saltar (no hay techo encima)
	jp nc,06608h		;b351
	ld a,(ix+01ch)		;b354
	cp 010h		;b357
	jp nc,06608h		;b359
	inc (ix+01ch)		;b35c
L_B35F:
	ld de,000f0h		;b35f   ; el salto: velocidad en x 0xF0 y el sonido 0x1F
	call L_B29C		;b362   ; la velocidad en x
	ld (ix+006h),000h		;b365
	ld (ix+014h),011h		;b369
	ld a,(ix+005h)		;b36d
	ld (ix+018h),a		;b370
	ld a,(ix+00bh)		;b373
	ld (ix+019h),a		;b376
	inc (ix+01dh)		;b379
	ld hl,04276h		;b37c
	call L_B294		;b37f   ; si esta en esta pantalla, salta a HL (un sonido)
	jp L_B2F0		;b382
L_B385:
	call L_B216		;b385   ; C si puede saltar (no hay techo encima)
	ld a,l			;b388
	sub 008h		;b389
	ld l,a			;b38b
	jr c,L_B3D0		;b38c
	call L_B3D6		;b38e   ; la casilla de delante
	jr c,L_B39A		;b391
	call L_B216		;b393   ; DE = el mapa del enemigo
	call L_B3D6		;b396   ; la casilla de delante
	ret nc			;b399
L_B39A:
	call L_B216		;b39a   ; DE = el mapa del enemigo
	ld a,l			;b39d
	sub 008h		;b39e
	ld l,a			;b3a0
	bit 0,(ix+00bh)		;b3a1
	jr z,L_B3AF		;b3a5
	ld a,h			;b3a7
	add a,008h		;b3a8
	jr c,L_B3B5		;b3aa
	ld h,a			;b3ac
	jr L_B3B5		;b3ad
L_B3AF:
	ld a,h			;b3af
	sub 008h		;b3b0
	jr c,L_B3B5		;b3b2
	ld h,a			;b3b4
L_B3B5:
	ld b,003h		;b3b5
L_B3B7:
	push bc			;b3b7
	push hl			;b3b8
	push de			;b3b9
	call 098e6h		;b3ba   ; A = la casilla del mapa de DE en el pixel (H, L): 0 libre, 1-3 ladrillo o cosa
	pop de			;b3bd
	pop hl			;b3be
	pop bc			;b3bf
	cp 002h		;b3c0
	jr nc,L_B3D0		;b3c2
	ld a,h			;b3c4
	add a,008h		;b3c5
	ld h,a			;b3c7
	djnz L_B3B7		;b3c8
	ld (ix+01ah),000h		;b3ca
	scf			;b3ce
	ret			;b3cf
L_B3D0:
	ld (ix+01ah),001h		;b3d0
	scf			;b3d4
	ret			;b3d5
L_B3D6:
	bit 0,(ix+00bh)		;b3d6   ; la casilla de delante
	jr nz,L_B3E7		;b3da
	ld a,h			;b3dc
	add a,007h		;b3dd
	sub 008h		;b3df
	jr nc,L_B3E5		;b3e1
	xor a			;b3e3
	ld h,a			;b3e4
L_B3E5:
	jr L_B3EE		;b3e5
L_B3E7:
	ld a,h			;b3e7
	add a,011h		;b3e8
	jr nc,L_B3EE		;b3ea
	ld a,0f8h		;b3ec
L_B3EE:
	ld h,a			;b3ee
	call 098e6h		;b3ef   ; A = la casilla del mapa de DE en el pixel (H, L): 0 libre, 1-3 ladrillo o cosa
	sub 002h		;b3f2
	ret			;b3f4
L_B3F5:
	bit 0,(ix+01ch)		;b3f5   ; busca escalera arriba o abajo
	jr z,L_B40B		;b3f9
	call L_B21C		;b3fb   ; L = la y del enemigo, H = su x
	ld a,l			;b3fe
	add a,010h		;b3ff
	ld l,a			;b401
	call L_B471		;b402   ; Z si hay escalera en las dos casillas (y se centra en ella)
	ld a,001h		;b405
	jr nc,L_B42F		;b407
	jr L_B417		;b409
L_B40B:
	call L_B21C		;b40b   ; L = la y del enemigo, H = su x
	call L_B471		;b40e   ; Z si hay escalera en las dos casillas (y se centra en ella)
	ld a,000h		;b411
	jr nc,L_B42F		;b413
	jr L_B452		;b415
L_B417:
	ld a,(ix+01bh)		;b417   ; sube por la escalera
	and a			;b41a
	jr z,L_B425		;b41b
	ld a,(ix+01dh)		;b41d
	cp 002h		;b420
	jp c,L_B33C		;b422
L_B425:
	call L_B21C		;b425   ; L = la y del enemigo, H = su x
	call L_B471		;b428   ; Z si hay escalera en las dos casillas (y se centra en ella)
	jp c,L_B33C		;b42b
	xor a			;b42e
L_B42F:
	ld (ix+00bh),a		;b42f   ; a la escalera: paso 3, velocidad en y 0x100
	ld (ix+01bh),a		;b432
	ld (ix+01dh),000h		;b435
	ld (ix+006h),001h		;b439
	ld (ix+01ch),000h		;b43d
	ld de,00000h		;b441
	call L_B29C		;b444   ; la velocidad en x
	ld de,00100h		;b447
	call L_B2A3		;b44a   ; la velocidad en y
	ld (ix+001h),003h		;b44d
	ret			;b451
L_B452:
	ld a,(ix+01bh)		;b452   ; baja por la escalera
	dec a			;b455
	jr z,L_B460		;b456
	ld a,(ix+01dh)		;b458
	cp 002h		;b45b
	jp c,L_B33C		;b45d
L_B460:
	call L_B21C		;b460   ; L = la y del enemigo, H = su x
	ld a,l			;b463
	add a,010h		;b464
	ld l,a			;b466
	call L_B471		;b467   ; Z si hay escalera en las dos casillas (y se centra en ella)
	jp c,L_B33C		;b46a
	ld a,001h		;b46d
	jr L_B42F		;b46f
L_B471:
	call L_B12F		;b471   ; Z si hay escalera en las dos casillas (y se centra en ella)
	ld c,000h		;b474
	jr z,L_B479		;b476
	inc c			;b478
L_B479:
	ld a,h			;b479
	add a,008h		;b47a
	ld h,a			;b47c
	push bc			;b47d
	call L_B12F		;b47e   ; Z si en el mapa del enemigo la casilla es escalera (1)
	pop bc			;b481
	jr z,L_B486		;b482
	set 1,c		;b484
L_B486:
	ld a,c			;b486
	and a			;b487
	jr z,L_B4A4		;b488
	cp 003h		;b48a
	scf			;b48c
	ret z			;b48d
	dec a			;b48e
	jr z,L_B49C		;b48f
	ld a,h			;b491
	and 007h		;b492
	cp 007h		;b494
	ccf			;b496
	ret c			;b497
	ld c,0f8h		;b498
	jr L_B4A4		;b49a
L_B49C:
	ld a,h			;b49c
	and 007h		;b49d
	cp 001h		;b49f
	ret c			;b4a1
	ld c,008h		;b4a2
L_B4A4:
	ld a,(ix+005h)		;b4a4
	add a,c			;b4a7
	and 0f8h		;b4a8
	ld (ix+005h),a		;b4aa
	xor a			;b4ad
	ret			;b4ae
L_B4AF:
	bit 0,(ix+00bh)		;b4af   ; el dibujo C (o C + 2 mirando a la derecha)
	jr z,L_B4B7		;b4b3
	inc c			;b4b5
	inc c			;b4b6
L_B4B7:
	ld (ix+011h),c		;b4b7
	ret			;b4ba
L_B4BB:
	call L_B00F		;b4bb   ; paso 2: en el aire
	dec a			;b4be
	cp (ix+00bh)		;b4bf
	ld (ix+006h),000h		;b4c2
	ret z			;b4c6
	ld (ix+006h),001h		;b4c7
	ld c,00ah		;b4cb
	call L_B4AF		;b4cd   ; el dibujo C (o C + 2 mirando a la derecha)
	ld a,(ix+014h)		;b4d0
	and a			;b4d3
	jr z,L_B50B		;b4d4
	dec (ix+014h)		;b4d6
	ld de,000f0h		;b4d9
	call L_B29C		;b4dc   ; la velocidad en x
	call L_B64E		;b4df   ; C si delante hay ladrillo
	call nc,L_B58F		;b4e2   ; sin velocidad en x
	ld a,(ix+014h)		;b4e5
	cp 008h		;b4e8
	jr nc,L_B4F1		;b4ea
	call L_B555		;b4ec   ; lo mismo, a la altura del paso del salto
	jr nz,L_B52F		;b4ef
L_B4F1:
	ld a,(ix+014h)		;b4f1   ; la altura del salto de la tabla 0xB595 o 0xB5A6 (segun haya techo)
	bit 0,(ix+01ah)		;b4f4
	ld hl,0b595h		;b4f8
	jr z,L_B500		;b4fb
	ld hl,0b5a6h		;b4fd
L_B500:
	call 0408fh		;b500   ; suma A a HL (HL = HL + A)
	ld a,(hl)			;b503
	add a,(ix+003h)		;b504
	ld (ix+003h),a		;b507
	ret			;b50a
L_B50B:
	ld (ix+014h),000h		;b50b   ; al acabar el salto: si no hay suelo, cae (paso 4)
	ld (ix+006h),001h		;b50f
	call L_B555		;b513   ; lo mismo, a la altura del paso del salto
	jr nz,L_B52F		;b516
	ld de,00500h		;b518
	call L_B2A3		;b51b   ; la velocidad en y
	ld de,00000h		;b51e
	call L_B29C		;b521   ; la velocidad en x
	ld (ix+00bh),001h		;b524
	ld (ix+001h),004h		;b528
	jp L_AF48		;b52c
L_B52F:
	call L_B58F		;b52f   ; en el suelo: se centra en la fila y vuelve a andar (paso 1)
	ld (ix+006h),000h		;b532
	ld (ix+014h),008h		;b536
	ld a,(ix+003h)		;b53a
	add a,007h		;b53d
	and 0f8h		;b53f
	ld (ix+003h),a		;b541
	ld (ix+001h),001h		;b544
L_B548:
	ld a,(0e243h)		;b548   ; el sonido 0x14 si esta en esta pantalla
	cp (ix+010h)		;b54b
	jp z,0423fh		;b54e
	ret			;b551
L_B552:
	xor a			;b552   ; Z si hay suelo debajo
	jr L_B558		;b553
L_B555:
	call L_B673		;b555   ; lo mismo, a la altura del paso del salto
L_B558:
	call L_B216		;b558   ; DE = el mapa del enemigo
	add a,l			;b55b
	add a,010h		;b55c
	cp 0b8h		;b55e
	jr c,L_B564		;b560
	ld a,0b8h		;b562
L_B564:
	ld l,a			;b564
	ld a,h			;b565
	add a,004h		;b566
	ld h,a			;b568
	call L_B571		;b569   ; Z si la casilla es suelo (ladrillo, o escalera con otra encima)
	ret nz			;b56c
	ld a,h			;b56d
	add a,008h		;b56e
	ld h,a			;b570
L_B571:
	push hl			;b571   ; Z si la casilla es suelo (ladrillo, o escalera con otra encima)
	push de			;b572
	call 098e6h		;b573   ; A = la casilla del mapa de DE en el pixel (H, L): 0 libre, 1-3 ladrillo o cosa
	pop de			;b576
	pop hl			;b577
	and a			;b578
	ret z			;b579
	dec a			;b57a
	ret nz			;b57b
	push hl			;b57c
	push de			;b57d
	ld a,l			;b57e
	sub 008h		;b57f
	ld l,a			;b581
	call 098e6h		;b582   ; A = la casilla del mapa de DE en el pixel (H, L): 0 libre, 1-3 ladrillo o cosa
	pop de			;b585
	pop hl			;b586
	dec a			;b587
	jr nz,L_B58C		;b588
	xor a			;b58a
	ret			;b58b
L_B58C:
	or 0ffh		;b58c
	ret			;b58e
L_B58F:
	ld de,00000h		;b58f   ; sin velocidad en x
	jp L_B29C		;b592

; ----------------------------------------------------------------------
; DATOS resto_B595: lo apuntan con el banco puesto p03:B4F8 (0xB595), p03:B676
;   (0xB595), p03:B4FD (0xB5A6); el tamano es lo que hay hasta lo siguiente,
;   no sale de recorrerlo; lo leen p03:B4F8, p03:B676, p03:B4FD (34 bytes)
;   0xb595..0xb5b7  (34 bytes)
DATA_resto_B595:
	defb 005h,005h,004h,003h,002h,002h,001h,001h,000h,000h,0ffh,0ffh,0feh,0feh,0fdh,0fch	; b595  ................
	defb 0fbh,005h,004h,003h,002h,002h,001h,001h,001h,000h,000h,0ffh,0ffh,0ffh,0feh,0feh	; b5a5  ................
	defb 0fdh,0fch	; b5b5

; ======================================================================
; CODIGO 0xb5b7..0xb694  (221 bytes)
; ======================================================================


L_B5B7:
	call L_B00F		;b5b7   ; paso: cae; si se puede, avanza hacia donde mira
	dec a			;b5ba
	cp (ix+00bh)		;b5bb
	ld (ix+006h),000h		;b5be
	ret z			;b5c2
	ld (ix+006h),001h		;b5c3
	ld c,00dh		;b5c7
	call L_AF1E		;b5c9
	call L_B0F9		;b5cc   ; C si al moverse en vertical choca
	jr c,L_B5DE		;b5cf
	call L_B165		;b5d1   ; NC si puede avanzar hacia donde mira
	ret c			;b5d4
	ld a,(ix+00bh)		;b5d5
	xor 001h		;b5d8
	ld (ix+00bh),a		;b5da
	ret			;b5dd
L_B5DE:
	call L_B833		;b5de   ; se centra en la casilla en la direccion en la que va
	ld de,00000h		;b5e1
	call L_B2A3		;b5e4   ; la velocidad en y
	call L_B29C		;b5e7   ; la velocidad en x
	ld (ix+006h),000h		;b5ea
	ld (ix+014h),008h		;b5ee
	ld (ix+018h),0ffh		;b5f2
	ld (ix+001h),001h		;b5f6
	ret			;b5fa
L_B5FB:
	call L_B555		;b5fb   ; en el aire: si toca suelo, aterriza
	ret z			;b5fe
	ld de,00000h		;b5ff
	call L_B2A3		;b602   ; la velocidad en y
	ld a,(ix+019h)		;b605
	ld (ix+00bh),a		;b608
	jp L_B52F		;b60b
L_B60E:
	set 1,(ix+00bh)		;b60e   ; hacia donde salta: si esta debajo del personaje, al azar (0xE203); si no, hacia el
	ld a,(ix+018h)		;b612
	cp 0ffh		;b615
	jr z,L_B62A		;b617
	cp (ix+005h)		;b619
	ret nz			;b61c
	ld a,(ix+00bh)		;b61d
	xor 001h		;b620
	or 002h		;b622
	ld (ix+00bh),a		;b624
	jp L_B211		;b627
L_B62A:
	ld a,(0e284h)		;b62a   ; lee la x del personaje
	sub (ix+005h)		;b62d
	add a,002h		;b630
	cp 004h		;b632
	jr nc,L_B644		;b634
	ld a,(0e203h)		;b636   ; lee la cuenta de cuadros
	ld c,002h		;b639
	and 080h		;b63b
	jr z,L_B640		;b63d
	inc c			;b63f
L_B640:
	ld (ix+00bh),c		;b640
	ret			;b643
L_B644:
	call L_B223		;b644   ; C = el lado hacia el personaje (0 izquierda, 1 derecha), por columnas de la rejilla o por x
	ld a,c			;b647
	or 002h		;b648
	ld (ix+00bh),a		;b64a
	ret			;b64d
L_B64E:
	ld c,(ix+00bh)		;b64e   ; C si delante hay ladrillo
	call L_B1AC		;b651   ; el sitio al que iria con su velocidad (C si se sale de la pantalla)
	ret c			;b654
	call L_B673		;b655   ; A = el paso del salto (tabla 0xB595)
	add a,l			;b658
	add a,00fh		;b659
	ld l,a			;b65b
	ld e,(ix+00ch)		;b65c
	ld d,(ix+00dh)		;b65f
	bit 0,(ix+00bh)		;b662
	jr z,L_B66D		;b666
	ld a,010h		;b668
	add a,h			;b66a
	ld h,a			;b66b
	ret c			;b66c
L_B66D:
	call 098e6h		;b66d   ; A = la casilla del mapa de DE en el pixel (H, L): 0 libre, 1-3 ladrillo o cosa
	sub 002h		;b670
	ret			;b672
L_B673:
	ld a,(ix+014h)		;b673   ; A = el paso del salto (tabla 0xB595)
	ld de,0b595h		;b676
	call 04094h		;b679   ; suma A a DE (DE = DE + A)
	ld a,(de)			;b67c
	ret			;b67d
L_B67E:
	xor a			;b67e   ; sale un enemigo de tipo 4: el sonido 0x1D
	ld (ix+014h),a		;b67f
	ld (ix+01ch),a		;b682
	ld (ix+013h),a		;b685
	ld hl,0426ch		;b688
	jp L_B294		;b68b
L_B68E:
	ld a,(ix+001h)		;b68e   ; un cuadro de un enemigo de tipo 4, por pasos (IX+01)
	call 04099h		;b691   ; el despachador de Konami: la tabla va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_B694: 6 destinos del despachador p00:4099 (call en p03:B691, el
;   indice en A): B6A0, B6F9, B754, B881, B8EC, B90E; lo leen p03:B691 (12
;   bytes)
;   0xb694..0xb6a0  (12 bytes)
DATA_tabla_B694:
	defw 0b6a0h,0b6f9h,0b754h,0b881h,0b8ech,0b90eh	; b694

; ======================================================================
; CODIGO 0xb6a0..0xb6af  (15 bytes)
; ======================================================================


L_B6A0:
	ld hl,0b6afh		;b6a0   ; paso 0: el dibujo de salida (tablas 0xB6AF y 0xB6B6)
	ld de,0b6b6h		;b6a3
	call L_B6E0		;b6a6   ; el dibujo de salida: cada 8 cuadros el siguiente de la tabla (0xFF acaba)
	jr z,$+20		;b6a9
	ld (ix+011h),a		;b6ab
	ret			;b6ae

; ----------------------------------------------------------------------
; DATOS resto_B6AF: lo apuntan con el banco puesto p03:B6A0 (0xB6AF), p03:B6A3
;   (0xB6B6); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p03:B6A0, p03:B6A3 (14 bytes)
;   0xb6af..0xb6bd  (14 bytes)
DATA_resto_B6AF:
	defb 01bh,01bh,01ch,01ch,01dh,01dh,0ffh,018h,019h,018h,019h,018h,019h,0ffh	; b6af  ..............

; ======================================================================
; CODIGO 0xb6bd..0xb7c9  (268 bytes)
; ======================================================================


L_B6BD:
	ld (ix+013h),003h		;b6bd   ; sale: mata y se le puede matar, espera 0x3C; en MSX2 sus colores; se marca en el mapa
	ld (ix+014h),03ch		;b6c1
	ld a,(0f0f4h)		;b6c5   ; lee la marca de MSX2 (1 en el cartucho de MSX2, 0 en el de MSX1)
	and a			;b6c8
	jr z,L_B6DC		;b6c9
	ld (ix+01eh),007h		;b6cb
	ld (ix+01fh),049h		;b6cf
	call L_B9A2		;b6d3
	call L_BA6E		;b6d6   ; C si al marcarse piso algo que no estaba libre
	jp c,L_BA7F		;b6d9
L_B6DC:
	inc (ix+001h)		;b6dc
	ret			;b6df
L_B6E0:
	ld a,(0f0f4h)		;b6e0   ; el dibujo de salida: cada 8 cuadros el siguiente de la tabla (0xFF acaba)
	and a			;b6e3
	jr z,L_B6E7		;b6e4
	ex de,hl			;b6e6
L_B6E7:
	inc (ix+014h)		;b6e7
	ld a,(ix+014h)		;b6ea
	rra			;b6ed
	rra			;b6ee
	rra			;b6ef
	and 01fh		;b6f0
	call 0408fh		;b6f2   ; suma A a HL (HL = HL + A)
	ld a,(hl)			;b6f5
	cp 0ffh		;b6f6
	ret			;b6f8
L_B6F9:
	ld c,001h		;b6f9   ; paso: quieto; si cae, deja de estar en el mapa
	call L_B168		;b6fb
	jr nc,L_B706		;b6fe
	call L_B9F0		;b700   ; quita del mapa sus cuatro casillas, devolviendo lo que habia
	jp L_B856		;b703
L_B706:
	call L_B956		;b706   ; parpadea mientras espera (dibujos 0x0F y 0x10)
	dec (ix+014h)		;b709
	jr z,L_B721		;b70c
	ld (ix+013h),003h		;b70e
	ld a,(ix+014h)		;b712
	and 010h		;b715
	ld c,00fh		;b717
	jr z,L_B71D		;b719
	ld c,010h		;b71b
L_B71D:
	ld (ix+011h),c		;b71d
	ret			;b720
L_B721:
	call L_B9F0		;b721   ; al acabar, tres veces: va hacia el personaje
	ld a,003h		;b724
	call L_B20A		;b726   ; sube la cuenta IX+0E y la compara con A
	jp c,06608h		;b729
	call L_B223		;b72c   ; C = el lado hacia el personaje (0 izquierda, 1 derecha), por columnas de la rejilla o por x
	ld a,c			;b72f
	or 002h		;b730
	ld (ix+00bh),a		;b732
	call L_B165		;b735   ; NC si puede avanzar hacia donde mira
	jr c,L_B748		;b738
	ld a,(ix+00bh)		;b73a
	xor 001h		;b73d
	ld (ix+00bh),a		;b73f
	call L_B165		;b742   ; NC si puede avanzar hacia donde mira
	jp nc,06608h		;b745
L_B748:
	ld de,00200h		;b748   ; se mueve a velocidad 2
	call L_B29C		;b74b   ; la velocidad en x
	ld (ix+006h),001h		;b74e
	jr L_B6DC		;b752
L_B754:
	call L_B00F		;b754   ; paso: anda; a otra pantalla si el personaje esta alli
	dec a			;b757
	cp (ix+00bh)		;b758
	jp z,L_B0A6		;b75b
	dec (ix+014h)		;b75e
	call L_B874		;b761   ; el dibujo al andar (0x11-0x14)
	ld a,(ix+005h)		;b764
	and 007h		;b767
	cp 003h		;b769
	jr nc,L_B778		;b76b
	call L_B216		;b76d   ; DE = el mapa del enemigo
	ld c,001h		;b770
	call 09933h		;b772   ; lo mismo con el mapa de DE
	jp c,L_B856		;b775
L_B778:
	call L_B165		;b778   ; choca con otro de su tipo o con pared: se para
	jr nc,L_B7B1		;b77b
	call L_B7DF		;b77d   ; C si choca con otro enemigo de tipo 4 de su pantalla
	ret nc			;b780
	ld a,(ix+00bh)		;b781
	cp 002h		;b784
	ld a,(ix+005h)		;b786
	jr nz,L_B78D		;b789
	add a,007h		;b78b
L_B78D:
	and 0f8h		;b78d
	ld (ix+005h),a		;b78f
	ld a,(iy+006h)		;b792
	and a			;b795
	jr z,L_B7AB		;b796
	ld a,(iy+00bh)		;b798
	cp 002h		;b79b
	jr c,L_B7AB		;b79d
	ld a,(iy+005h)		;b79f
	jr nz,L_B7A6		;b7a2
	add a,007h		;b7a4
L_B7A6:
	and 0f8h		;b7a6
	ld (iy+005h),a		;b7a8
L_B7AB:
	call L_B938		;b7ab   ; se marca en el mapa; si choca con algo, se va
	jp L_B7BF		;b7ae
L_B7B1:
	call L_B833		;b7b1   ; se centra en la casilla en la direccion en la que va
	ld c,001h		;b7b4
	call 09933h		;b7b6   ; lo mismo con el mapa de DE
	jp c,L_B856		;b7b9
	call L_B938		;b7bc   ; se marca en el mapa; si choca con algo, se va
L_B7BF:
	ld a,(0e243h)		;b7bf   ; el sonido 0x24 si esta en esta pantalla
	cp (ix+010h)		;b7c2
	ret nz			;b7c5
	jp 0428fh		;b7c6

; ----------------------------------------------------------------------
; DATOS sin identificar  0xb7c9..0xb7df  (22 bytes)
DATA_B7C9:
	defb 0ddh,036h,006h,000h,011h,000h,000h,0cdh,09ch,0b2h,0cdh,0a3h,0b2h,0ddh,036h,014h	; b7c9  .6............6.
	defb 03ch,0ddh,036h,001h,001h,0c9h	; b7d9

; ======================================================================
; CODIGO 0xb7df..0xb926  (327 bytes)
; ======================================================================


L_B7DF:
	ld l,(ix+003h)		;b7df   ; C si choca con otro enemigo de tipo 4 de su pantalla
	ld h,(ix+005h)		;b7e2
	call L_B1AC		;b7e5   ; el sitio al que iria con su velocidad (C si se sale de la pantalla)
	ccf			;b7e8
	ret nc			;b7e9
	ld iy,0e500h		;b7ea   ; apunta a los enemigos (8 x 32 bytes)
	ld b,008h		;b7ee
	ld de,00020h		;b7f0
L_B7F3:
	ld a,(iy+000h)		;b7f3
	cp 004h		;b7f6
	jr nz,L_B81E		;b7f8
	ld a,(ix+015h)		;b7fa
	cp (iy+015h)		;b7fd
	jr z,L_B81E		;b800
	ld a,(ix+010h)		;b802
	cp (iy+010h)		;b805
	jr nz,L_B81E		;b808
	ld a,l			;b80a
	sub (iy+003h)		;b80b
	add a,00fh		;b80e
	cp 01eh		;b810
	jr nc,L_B81E		;b812
	ld a,h			;b814
	sub (iy+005h)		;b815
	add a,00fh		;b818
	cp 01eh		;b81a
	jr c,L_B824		;b81c
L_B81E:
	add iy,de		;b81e
	djnz L_B7F3		;b820
	xor a			;b822
	ret			;b823
L_B824:
	ld a,(iy+006h)		;b824
	and a			;b827
	jr z,L_B831		;b828
	ld a,(ix+00bh)		;b82a
	cp (iy+00bh)		;b82d
	ret z			;b830
L_B831:
	scf			;b831
	ret			;b832
L_B833:
	ld a,(ix+00bh)		;b833   ; se centra en la casilla en la direccion en la que va
	cp 002h		;b836
	jr c,L_B847		;b838
	ld a,(ix+005h)		;b83a
	jr z,L_B841		;b83d
	add a,007h		;b83f
L_B841:
	and 0f8h		;b841
	ld (ix+005h),a		;b843
	ret			;b846
L_B847:
	and a			;b847
	ld b,a			;b848
	ld a,(ix+003h)		;b849
	jr z,L_B850		;b84c
	add a,007h		;b84e
L_B850:
	and 0f8h		;b850
	ld (ix+003h),a		;b852
	ret			;b855
L_B856:
	call L_B211		;b856   ; cae: paso 3, velocidad en y 5, el sonido 0x2C
	ld (ix+00bh),001h		;b859
	ld de,00500h		;b85d
	call L_B2A3		;b860   ; la velocidad en y
	ld de,00000h		;b863
	call L_B29C		;b866   ; la velocidad en x
	ld (ix+01ch),000h		;b869
	ld (ix+001h),003h		;b86d
	jp L_AF48		;b871
L_B874:
	ld a,(ix+014h)		;b874   ; el dibujo al andar (0x11-0x14)
	rra			;b877
	rra			;b878
	and 003h		;b879
	add a,011h		;b87b
	ld (ix+011h),a		;b87d
	ret			;b880
L_B881:
	inc (ix+01ch)		;b881   ; paso: anda hasta chocar
	jr nz,L_B889		;b884
	dec (ix+01ch)		;b886
L_B889:
	ld (ix+006h),001h		;b889
	call L_B874		;b88d   ; el dibujo al andar (0x11-0x14)
	call L_B165		;b890   ; NC si puede avanzar hacia donde mira
	jr nc,L_B8A8		;b893
	call L_B7DF		;b895   ; C si choca con otro enemigo de tipo 4 de su pantalla
	ret nc			;b898
	call L_B833		;b899   ; se centra en la casilla en la direccion en la que va
	call L_B938		;b89c   ; se marca en el mapa; si choca con algo, se va
	ld a,(ix+01ch)		;b89f
	cp 003h		;b8a2
	ret c			;b8a4
	jp L_B7BF		;b8a5
L_B8A8:
	call L_B833		;b8a8   ; se para: paso 5 y el sonido 0x25
	ld (ix+006h),000h		;b8ab
	ld (ix+011h),011h		;b8af
	ld (ix+014h),000h		;b8b3
	ld (ix+001h),005h		;b8b7
	ld a,(0e243h)		;b8bb   ; lee la pantalla de la fase (desde 1)
	cp (ix+010h)		;b8be
	ret nz			;b8c1
	jp 04294h		;b8c2
L_B8C5:
	ld (ix+013h),001h		;b8c5   ; el enemigo de tipo 4 se para en su casilla
	ld a,(ix+001h)		;b8c9
	dec a			;b8cc
	jr z,L_B8D6		;b8cd
	dec a			;b8cf
	ret nz			;b8d0
	call L_B8DB		;b8d1   ; se centra en la casilla
	jr $+100		;b8d4
L_B8D6:
	call L_B8DB		;b8d6   ; se centra en la casilla
	jr $+104		;b8d9
L_B8DB:
	ld a,(ix+005h)		;b8db   ; se centra en la casilla
	and 0f8h		;b8de
	ld (ix+005h),a		;b8e0
	ld a,(ix+003h)		;b8e3
	and 0f8h		;b8e6
	ld (ix+003h),a		;b8e8
	ret			;b8eb
L_B8EC:
	call L_B956		;b8ec   ; paso: espera 0x3C cuadros quieto y vuelve al paso 1
	ld c,001h		;b8ef
	call L_B168		;b8f1
	jr c,L_B908		;b8f4
	ld a,(0e203h)		;b8f6   ; lee la cuenta de cuadros
	and 003h		;b8f9
	dec (ix+014h)		;b8fb
	ret nz			;b8fe
	ld (ix+014h),03ch		;b8ff
	ld (ix+001h),001h		;b903
	ret			;b907
L_B908:
	call L_B9F0		;b908   ; quita del mapa sus cuatro casillas, devolviendo lo que habia
	jp L_B856		;b90b
L_B90E:
	ld a,(ix+014h)		;b90e   ; paso: un pequeno salto (tabla 0xB926)
	cp 012h		;b911
	jr z,$+37		;b913
	inc (ix+014h)		;b915
	ld hl,0b926h		;b918
	call 0408fh		;b91b   ; suma A a HL (HL = HL + A)
	ld a,(hl)			;b91e
	add a,(ix+003h)		;b91f
	ld (ix+003h),a		;b922
	ret			;b925

; ----------------------------------------------------------------------
; DATOS resto_B926: lo apuntan con el banco puesto p03:B918 (0xB926); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p03:B918 (18 bytes)
;   0xb926..0xb938  (18 bytes)
DATA_resto_B926:
	defb 0fdh,0feh,0ffh,0ffh,000h,000h,001h,001h,002h,003h,0feh,0ffh,000h,001h,002h,0ffh	; b926  ................
	defb 000h,001h	; b936

; ======================================================================
; CODIGO 0xb938..0xbb43  (523 bytes)
; ======================================================================


L_B938:
	call L_B9A2		;b938   ; se marca en el mapa; si choca con algo, se va
	call L_BA6E		;b93b   ; C si al marcarse piso algo que no estaba libre
	jp c,L_BA7F		;b93e
L_B941:
	ld (ix+006h),000h		;b941   ; quieto: paso 4, espera 0xB4
	ld (ix+011h),011h		;b945
	ld (ix+013h),001h		;b949
	ld (ix+014h),0b4h		;b94d
	ld (ix+001h),004h		;b951
	ret			;b955
L_B956:
	call L_B216		;b956   ; marca en el mapa sus cuatro casillas, guardando lo que habia
	call L_BA24		;b959   ; HL = el byte del mapa de DE en (H, L), C = la casilla dentro del byte (1-4)
	call L_B9C5		;b95c   ; pone su valor en una casilla y la de debajo, y devuelve lo que habia (E, D)
	ld a,e			;b95f
	and a			;b960
	jr z,L_B966		;b961
	jp pe,L_B969		;b963
L_B966:
	ld (ix+018h),e		;b966
L_B969:
	ld a,d			;b969
	and a			;b96a
	jr z,L_B970		;b96b
	jp pe,L_B973		;b96d
L_B970:
	ld (ix+019h),d		;b970
L_B973:
	call L_B216		;b973   ; DE = el mapa del enemigo
	ld a,h			;b976
	add a,008h		;b977
	ld h,a			;b979
	call L_BA24		;b97a   ; HL = el byte del mapa de DE en (H, L), C = la casilla dentro del byte (1-4)
	call L_B9C5		;b97d   ; pone su valor en una casilla y la de debajo, y devuelve lo que habia (E, D)
	ld a,e			;b980
	and a			;b981
	jr z,L_B987		;b982
	jp pe,L_B98A		;b984
L_B987:
	ld (ix+01ah),e		;b987
L_B98A:
	ld a,d			;b98a
	jr z,L_B98E		;b98b
	ret pe			;b98d
L_B98E:
	ld (ix+01bh),d		;b98e
	ret			;b991
L_B992:
	ld a,(ix+001h)		;b992   ; si esta quieto y en esta pantalla, se marca en el mapa
	cp 004h		;b995
	jr z,L_B99B		;b997
	dec a			;b999
	ret nz			;b99a
L_B99B:
	ld a,(0e243h)		;b99b   ; lee la pantalla de la fase (desde 1)
	cp (ix+010h)		;b99e
	ret nz			;b9a1
L_B9A2:
	call L_B216		;b9a2   ; DE = el mapa del enemigo
	call L_BA24		;b9a5   ; HL = el byte del mapa de DE en (H, L), C = la casilla dentro del byte (1-4)
	call L_B9C5		;b9a8   ; pone su valor en una casilla y la de debajo, y devuelve lo que habia (E, D)
	ld (ix+018h),e		;b9ab
	ld (ix+019h),d		;b9ae
	call L_B216		;b9b1   ; DE = el mapa del enemigo
	ld a,h			;b9b4
	add a,008h		;b9b5
	ld h,a			;b9b7
	call L_BA24		;b9b8   ; HL = el byte del mapa de DE en (H, L), C = la casilla dentro del byte (1-4)
	call L_B9C5		;b9bb   ; pone su valor en una casilla y la de debajo, y devuelve lo que habia (E, D)
	ld (ix+01ah),e		;b9be
	ld (ix+01bh),d		;b9c1
	ret			;b9c4
L_B9C5:
	ld b,c			;b9c5   ; pone su valor en una casilla y la de debajo, y devuelve lo que habia (E, D)
	ld a,003h		;b9c6
L_B9C8:
	rrca			;b9c8
	rrca			;b9c9
	djnz L_B9C8		;b9ca
	ld b,a			;b9cc
	ld e,(hl)			;b9cd
	or (hl)			;b9ce
	ld (hl),a			;b9cf
	ld a,e			;b9d0
	and b			;b9d1
	ld e,a			;b9d2
	ld a,008h		;b9d3
	call 0408fh		;b9d5   ; suma A a HL (HL = HL + A)
	ld a,b			;b9d8
	ld d,(hl)			;b9d9
	or (hl)			;b9da
	ld (hl),a			;b9db
	ld a,d			;b9dc
	and b			;b9dd
	ld d,a			;b9de
	ret			;b9df
L_B9E0:
	ld a,(ix+001h)		;b9e0   ; si esta quieto y en esta pantalla, se quita del mapa
	cp 004h		;b9e3
	jr z,L_B9E9		;b9e5
	dec a			;b9e7
	ret nz			;b9e8
L_B9E9:
	ld a,(0e243h)		;b9e9   ; lee la pantalla de la fase (desde 1)
	cp (ix+010h)		;b9ec
	ret nz			;b9ef
L_B9F0:
	call L_B216		;b9f0   ; quita del mapa sus cuatro casillas, devolviendo lo que habia
	ld a,h			;b9f3
	add a,008h		;b9f4
	ld h,a			;b9f6
	call L_BA24		;b9f7   ; HL = el byte del mapa de DE en (H, L), C = la casilla dentro del byte (1-4)
	ld e,(ix+01ah)		;b9fa
	ld d,(ix+01bh)		;b9fd
	call L_BA0F		;ba00
	call L_B216		;ba03   ; DE = el mapa del enemigo
	call L_BA24		;ba06   ; HL = el byte del mapa de DE en (H, L), C = la casilla dentro del byte (1-4)
	ld e,(ix+018h)		;ba09
	ld d,(ix+019h)		;ba0c
L_BA0F:
	ld a,0fch		;ba0f
	ld b,c			;ba11
L_BA12:
	rrca			;ba12
	rrca			;ba13
	djnz L_BA12		;ba14
	ld b,a			;ba16
	and (hl)			;ba17
	or e			;ba18
	ld (hl),a			;ba19
	ld a,008h		;ba1a
	call 0408fh		;ba1c   ; suma A a HL (HL = HL + A)
	ld a,b			;ba1f
	and (hl)			;ba20
	or d			;ba21
	ld (hl),a			;ba22
	ret			;ba23
L_BA24:
	ld a,h			;ba24   ; HL = el byte del mapa de DE en (H, L), C = la casilla dentro del byte (1-4)
	rra			;ba25
	rra			;ba26
	rra			;ba27
	ld b,a			;ba28
	and 003h		;ba29
	ld c,a			;ba2b
	inc c			;ba2c
	ld a,b			;ba2d
	rra			;ba2e
	rra			;ba2f
	and 007h		;ba30
	ld b,a			;ba32
	ld a,l			;ba33
	and 0f8h		;ba34
	or b			;ba36
	ld l,a			;ba37
	ld h,000h		;ba38
	add hl,de			;ba3a
	ret			;ba3b
L_BA3C:
	ld ix,0e500h		;ba3c   ; quita del mapa los enemigos de tipo 4
	ld b,008h		;ba40
L_BA42:
	push bc			;ba42
	ld a,(ix+000h)		;ba43
	cp 004h		;ba46
	call z,L_B9E0		;ba48   ; si esta quieto y en esta pantalla, se quita del mapa
	ld de,00020h		;ba4b
	add ix,de		;ba4e
	pop bc			;ba50
	djnz L_BA42		;ba51
	ret			;ba53
L_BA54:
	ld ix,0e500h		;ba54   ; los vuelve a marcar
	ld b,008h		;ba58
L_BA5A:
	push bc			;ba5a
	ld a,(ix+000h)		;ba5b
	cp 004h		;ba5e
	jr nz,L_BA65		;ba60
	call L_B992		;ba62   ; si esta quieto y en esta pantalla, se marca en el mapa
L_BA65:
	ld de,00020h		;ba65
	add ix,de		;ba68
	pop bc			;ba6a
	djnz L_BA5A		;ba6b
	ret			;ba6d
L_BA6E:
	ld a,(ix+018h)		;ba6e   ; C si al marcarse piso algo que no estaba libre
	or (ix+019h)		;ba71
	or (ix+01ah)		;ba74
	or (ix+01bh)		;ba77
	and 0aah		;ba7a
	ret z			;ba7c
	scf			;ba7d
	ret			;ba7e
L_BA7F:
	call L_B9F0		;ba7f   ; se quita del mapa y se va
	jp 06608h		;ba82
L_BA85:
	ld a,(ix+001h)		;ba85   ; un cuadro de una puerta giratoria (tipo 1 de 0xE600), por pasos (IX+01)
	cp 001h		;ba88
	jp z,L_BB0E		;ba8a
	jp nc,L_BB2B		;ba8d
	ld a,(0e243h)		;ba90   ; lee la pantalla de la fase (desde 1)
	cp (ix+004h)		;ba93
	ret nz			;ba96
	ld a,(0e280h)		;ba97   ; cerrada: si el personaje la empuja por su lado 10 cuadros seguidos...
	and a			;ba9a
	jr nz,L_BAE5		;ba9b
	ld a,(ix+008h)		;ba9d
	add a,a			;baa0
	add a,a			;baa1
	add a,a			;baa2
	ld b,a			;baa3
	ld a,(0e282h)		;baa4   ; lee la y del personaje
	add a,00fh		;baa7
	sub (ix+002h)		;baa9
	sub b			;baac
	jr nc,L_BAE5		;baad
	ld a,(ix+007h)		;baaf
	rra			;bab2
	rra			;bab3
	ld a,(0e284h)		;bab4   ; lee la x del personaje
	ld b,(ix+003h)		;bab7
	jr c,L_BAEA		;baba
	cp b			;babc
	jr nc,L_BAE5		;babd
	add a,014h		;babf
	sub b			;bac1
	jr c,L_BAE5		;bac2
	ld a,(0e208h)		;bac4   ; ...empujando a la derecha...
	and 008h		;bac7
	jr z,L_BAE5		;bac9
	dec (ix+006h)		;bacb
	ret nz			;bace
	inc (ix+005h)		;bacf   ; ...gira: el personaje pasa andando (estado 7) con el sonido 0x21
	ld a,007h		;bad2
	ld (0e280h),a		;bad4   ; guarda el estado del personaje
	call 04280h		;bad7   ; pide el sonido 0x21
L_BADA:
	xor a			;bada   ; la puerta en marcha (bit 0 de IX+07) y el paso siguiente
	ld (0e299h),a		;badb
	set 0,(ix+007h)		;bade
	inc (ix+001h)		;bae2
L_BAE5:
	ld (ix+006h),00ah		;bae5   ; si no, la cuenta vuelve a 10
	ret			;bae9
L_BAEA:
	cp b			;baea   ; por el otro lado, empujando a la izquierda (estado 6)
	jr c,L_BAE5		;baeb
	sub 014h		;baed
	sub b			;baef
	jr nc,L_BAE5		;baf0
	ld a,(0e208h)		;baf2   ; lee el mando: lo pulsado
	and 004h		;baf5
	jr z,L_BAE5		;baf7
	dec (ix+006h)		;baf9
	ret nz			;bafc
	dec (ix+005h)		;bafd
	ld a,006h		;bb00
	ld (0e280h),a		;bb02   ; guarda el estado del personaje
	call L_BADA		;bb05   ; la puerta en marcha (bit 0 de IX+07) y el paso siguiente
	inc (ix+001h)		;bb08
	jp 04280h		;bb0b
L_BB0E:
	dec (ix+006h)		;bb0e   ; paso 1: cada 10 cuadros un giro, hasta 3: se queda del otro lado
	ret nz			;bb11
	call L_BAE5		;bb12   ; si no, la cuenta vuelve a 10
	set 0,(ix+007h)		;bb15
	inc (ix+005h)		;bb19
	ld a,(ix+005h)		;bb1c
	cp 003h		;bb1f
	ret nz			;bb21
	ld (ix+001h),000h		;bb22
	set 1,(ix+007h)		;bb26
	ret			;bb2a
L_BB2B:
	dec (ix+006h)		;bb2b   ; paso 2: gira al reves hasta 0
	ret nz			;bb2e
	call L_BAE5		;bb2f   ; si no, la cuenta vuelve a 10
	set 0,(ix+007h)		;bb32
	dec (ix+005h)		;bb36
	ret nz			;bb39
	xor a			;bb3a
	ld (ix+001h),a		;bb3b
	res 1,(ix+007h)		;bb3e
	ret			;bb42

; ----------------------------------------------------------------------
; DATOS sin identificar  0xbb43..0xbb63  (32 bytes)
DATA_BB43:
	defb 03ah,043h,0e2h,0ddh,0beh,004h,0c0h,021h,074h,093h,011h,074h,093h,001h,074h,093h	; bb43  :C.....!t..t..t.
	defb 0d9h,0ddh,046h,008h,00eh,002h,0ddh,056h,003h,0ddh,05eh,002h,0cdh,0deh,056h,0d9h	; bb53  ..F....V..^...V.

; ======================================================================
; CODIGO 0xbb63..0xbc50  (237 bytes)
; ======================================================================


L_BB63:
	ld (0efc0h),hl		;bb63   ; pinta la puerta: la parte de arriba (HL), la del medio (DE) repetida y la de abajo (BC)
	ld (0efc2h),de		;bb66   ; guarda la pantalla que se lee del mapa y el byte siguiente (16 bits)
	ld (0efc4h),bc		;bb6a
	ld d,(ix+003h)		;bb6e
	ld e,(ix+002h)		;bb71
	ld hl,(0efc0h)		;bb74   ; lee un dato de paso de la rutina en curso y el byte siguiente (16 bits)
	call L_BB93		;bb77   ; dos caracteres de la parte, segun el giro (IX+05)
	ld a,(ix+008h)		;bb7a
	cp 003h		;bb7d
	jr c,L_BB90		;bb7f
	ld b,a			;bb81
	dec b			;bb82
	dec b			;bb83
L_BB84:
	ld hl,(0efc2h)		;bb84   ; lee la pantalla que se lee del mapa y el byte siguiente (16 bits)
	push hl			;bb87
	push bc			;bb88
	call L_BB93		;bb89   ; dos caracteres de la parte, segun el giro (IX+05)
	pop bc			;bb8c
	pop hl			;bb8d
	djnz L_BB84		;bb8e
L_BB90:
	ld hl,(0efc4h)		;bb90
L_BB93:
	push de			;bb93   ; dos caracteres de la parte, segun el giro (IX+05)
	ld a,(ix+005h)		;bb94
	add a,a			;bb97
	call 0408fh		;bb98   ; suma A a HL (HL = HL + A)
	ld a,(hl)			;bb9b
	push hl			;bb9c
	call 05767h		;bb9d   ; pinta el caracter A sin su color 0 (p00:5219)
	pop hl			;bba0
	ld a,d			;bba1
	add a,008h		;bba2
	ld d,a			;bba4
	inc hl			;bba5
	ld a,(hl)			;bba6
	call 05767h		;bba7   ; pinta el caracter A sin su color 0 (p00:5219)
	pop de			;bbaa
	ld a,e			;bbab
	add a,008h		;bbac
	ld e,a			;bbae
	ret			;bbaf
L_BBB0:
	ld a,(ix+001h)		;bbb0   ; un cuadro de una puerta de tipo 2
	and a			;bbb3
	jr nz,L_BC2F		;bbb4
	ld a,(0e243h)		;bbb6   ; lee la pantalla de la fase (desde 1)
	cp (ix+004h)		;bbb9
	ret nz			;bbbc
	ld a,(0e280h)		;bbbd   ; lee el estado del personaje
	and a			;bbc0
	jr nz,L_BC10		;bbc1
	ld a,(ix+008h)		;bbc3
	add a,a			;bbc6
	add a,a			;bbc7
	add a,a			;bbc8
	ld b,a			;bbc9
	ld a,(0e282h)		;bbca   ; lee la y del personaje
	add a,00fh		;bbcd
	sub (ix+002h)		;bbcf
	sub b			;bbd2
	jr nc,L_BC10		;bbd3
	ld a,(ix+007h)		;bbd5
	rra			;bbd8
	rra			;bbd9
	ld a,(0e284h)		;bbda   ; lee la x del personaje
	ld b,(ix+003h)		;bbdd
	jr c,L_BC15		;bbe0
	cp b			;bbe2
	jr nc,L_BC10		;bbe3
	add a,014h		;bbe5
	sub b			;bbe7
	jr c,L_BC10		;bbe8
	ld a,(0e208h)		;bbea   ; lee el mando: lo pulsado
	and 008h		;bbed
	jr z,L_BC10		;bbef
	dec (ix+006h)		;bbf1
	ret nz			;bbf4
	ld a,007h		;bbf5   ; gira: el personaje pasa andando
	ld (0e280h),a		;bbf7   ; guarda el estado del personaje
L_BBFA:
	xor a			;bbfa   ; la puerta en marcha y el sonido 0x22
	ld (0e299h),a		;bbfb
	set 0,(ix+007h)		;bbfe
	inc (ix+005h)		;bc02
	inc (ix+001h)		;bc05
	ld (ix+006h),008h		;bc08
	call 04285h		;bc0c   ; pide el sonido 0x22
	ret			;bc0f
L_BC10:
	ld (ix+006h),01eh		;bc10   ; si no, la cuenta vuelve a 0x1E
	ret			;bc14
L_BC15:
	cp b			;bc15   ; por el otro lado
	jr c,L_BC10		;bc16
	sub 014h		;bc18
	sub b			;bc1a
	jr nc,L_BC10		;bc1b
	ld a,(0e208h)		;bc1d   ; lee el mando: lo pulsado
	and 004h		;bc20
	jr z,L_BC10		;bc22
	dec (ix+006h)		;bc24
	ret nz			;bc27
	ld a,006h		;bc28
	ld (0e280h),a		;bc2a   ; guarda el estado del personaje
	jr L_BBFA		;bc2d
L_BC2F:
	dec (ix+006h)		;bc2f   ; gira cada 8 cuadros; a los 4 pasos vuelve a estar cerrada (sonido 0x22)
	ret nz			;bc32
	set 0,(ix+007h)		;bc33
	inc (ix+005h)		;bc37
	ld a,(ix+005h)		;bc3a
	ld (ix+006h),008h		;bc3d
	cp 004h		;bc41
	ret nz			;bc43
	call 04285h		;bc44   ; pide el sonido 0x22
	xor a			;bc47
	ld (ix+005h),a		;bc48
	ld (ix+001h),a		;bc4b
	jr L_BC10		;bc4e

; ----------------------------------------------------------------------
; DATOS sin identificar  0xbc50..0xbc74  (36 bytes)
DATA_BC50:
	defb 03ah,043h,0e2h,0ddh,0beh,004h,0c0h,0ddh,07eh,007h,01fh,01fh,021h,07ch,093h,011h	; bc50  :C......~...!|..
	defb 084h,093h,001h,08ch,093h,0d2h,053h,0bbh,021h,094h,093h,011h,09ch,093h,001h,0a4h	; bc60  ......S.!.......
	defb 093h,0c3h,053h,0bbh	; bc70

; ======================================================================
; CODIGO 0xbc74..0xbce2  (110 bytes)
; ======================================================================


L_BC74:
	ld ix,0e600h		;bc74   ; las cosas de tipo 3 de 0xE600: si el personaje pasa por su columna, empiezan a moverse
	ld b,010h		;bc78
L_BC7A:
	ld a,(ix+000h)		;bc7a
	cp 003h		;bc7d
	jr z,L_BC89		;bc7f
L_BC81:
	ld de,00010h		;bc81
	add ix,de		;bc84
	djnz L_BC7A		;bc86
	ret			;bc88
L_BC89:
	ld a,(ix+001h)		;bc89
	and a			;bc8c
	jr nz,L_BC81		;bc8d
	call L_BC9C		;bc8f   ; C si el personaje esta en su pantalla, a menos de 8 pixeles en x y dentro de su alto
	jr nc,L_BC81		;bc92
	inc (ix+001h)		;bc94
	ld (ix+006h),01eh		;bc97
	ret			;bc9b
L_BC9C:
	ld a,(0e243h)		;bc9c   ; C si el personaje esta en su pantalla, a menos de 8 pixeles en x y dentro de su alto
	cp (ix+004h)		;bc9f
	jr nz,L_BCBE		;bca2
	ld a,(0e284h)		;bca4   ; lee la x del personaje
	add a,008h		;bca7
	sub (ix+003h)		;bca9
	cp 008h		;bcac
	ret nc			;bcae
	ld a,(ix+008h)		;bcaf
	add a,a			;bcb2
	add a,a			;bcb3
	add a,a			;bcb4
	ld c,a			;bcb5
	ld a,(0e282h)		;bcb6   ; lee la y del personaje
	sub (ix+002h)		;bcb9
	cp c			;bcbc
	ret			;bcbd
L_BCBE:
	or a			;bcbe
	ret			;bcbf
L_BCC0:
	ld a,(ix+001h)		;bcc0   ; la cosa de tipo 3 en marcha: cada 0x1E cuadros un paso, hasta su alto (IX+08); luego se quita
	and a			;bcc3
	ret z			;bcc4
	dec (ix+006h)		;bcc5
	ret nz			;bcc8
	set 0,(ix+007h)		;bcc9
	ld (ix+006h),01eh		;bccd
	ld a,(ix+005h)		;bcd1
	cp (ix+008h)		;bcd4
	jr nc,L_BCDD		;bcd7
	inc (ix+005h)		;bcd9
	ret			;bcdc
L_BCDD:
	ld (ix+000h),000h		;bcdd
	ret			;bce1

; ----------------------------------------------------------------------
; DATOS sin identificar  0xbce2..0xbd21  (63 bytes)
DATA_BCE2:
	defb 0ddh,07eh,005h,03dh,087h,087h,087h,05fh,0ddh,066h,003h,0ddh,086h,002h,06fh,0ddh	; bce2  .~.=..._.f....o.
	defb 056h,004h,001h,001h,001h,03eh,002h,0d5h,0cdh,0edh,063h,0d1h,03ah,043h,0e2h,0ddh	; bcf2  V....>....c.:C..
	defb 0beh,004h,0c0h,0ddh,056h,003h,0ddh,07eh,002h,083h,05fh,0ddh,0e5h,0d5h,0cdh,0abh	; bd02  ....V..~.._.....
	defb 090h,0d1h,03eh,005h,0cdh,067h,057h,0cdh,0f7h,090h,0ddh,0e1h,0c3h,0c7h,042h	; bd12  ..>..gW.......B

; ======================================================================
; CODIGO 0xbd21..0xbdaa  (137 bytes)
; ======================================================================


L_BD21:
	ld a,(0e243h)		;bd21   ; una cosa de tipo 4 (suelo que se rompe): mira si el personaje esta encima
	cp (ix+004h)		;bd24
	ret nz			;bd27
	ld a,(ix+00ah)		;bd28
	ld (ix+00bh),a		;bd2b
	ld a,(0e282h)		;bd2e   ; lee la y del personaje
	add a,014h		;bd31
	sub (ix+002h)		;bd33
	cp 008h		;bd36
	jr nc,L_BD46		;bd38
	ld a,(0e284h)		;bd3a   ; lee la x del personaje
	add a,008h		;bd3d
	sub (ix+003h)		;bd3f
	cp 020h		;bd42
	jr c,L_BD75		;bd44
L_BD46:
	ld (ix+00ah),000h		;bd46   ; al bajarse de ella (en el suelo), cuenta; a la segunda, se rompe
	ld a,(ix+00bh)		;bd4a
	and a			;bd4d
	ret z			;bd4e
	ld a,(0e280h)		;bd4f   ; lee el estado del personaje
	and a			;bd52
	ret nz			;bd53
	inc (ix+006h)		;bd54
	ld a,(ix+006h)		;bd57
	cp 002h		;bd5a
	ret c			;bd5c
	ld (ix+000h),000h		;bd5d   ; se quita: su dibujo y sus 4 casillas del mapa a 0
	call L_BD7A		;bd61   ; el sonido 0x27 y se repinta el fondo (MSX1 de la ficha, MSX2 de la pagina 1)
	xor a			;bd64
	ld bc,00104h		;bd65
	ld h,(ix+003h)		;bd68
	ld l,(ix+002h)		;bd6b
	ld d,(ix+004h)		;bd6e
	call 063edh		;bd71   ; marca un rectangulo del mapa de la pantalla D: B filas de C casillas con el valor A
	ret			;bd74
L_BD75:
	ld (ix+00ah),001h		;bd75   ; 0xE60A = 1: el personaje esta encima
	ret			;bd79
L_BD7A:
	call 0429eh		;bd7a   ; el sonido 0x27 y se repinta el fondo (MSX1 de la ficha, MSX2 de la pagina 1)
	ld d,(ix+003h)		;bd7d
	ld e,(ix+002h)		;bd80
	push ix		;bd83
	pop hl			;bd85
	ld a,(0f0f4h)		;bd86   ; lee la marca de MSX2 (1 en el cartucho de MSX2, 0 en el de MSX1)
	and a			;bd89
	jr nz,L_BD98		;bd8a
	ld a,00ch		;bd8c
	call 0408fh		;bd8e   ; suma A a HL (HL = HL + A)
	ld bc,00104h		;bd91
	call 0573bh		;bd94   ; un rectangulo de caracteres de HL: B filas de C, sin pintar el color 0
	ret			;bd97
L_BD98:
	ld a,l			;bd98
	add a,a			;bd99
	ld h,a			;bd9a
	ld l,040h		;bd9b
	jr nc,L_BDA1		;bd9d
	ld l,050h		;bd9f
L_BDA1:
	ld bc,02008h		;bda1
	ld a,001h		;bda4
	call 05029h		;bda6   ; copia un rectangulo de la VRAM (orden HMMM): de (H, L) a (D, E), paginas de A
	ret			;bda9

; ----------------------------------------------------------------------
; DATOS sin identificar  0xbdaa..0xbdc0  (22 bytes)
DATA_BDAA:
	defb 0afh,0ddh,077h,00ah,0ddh,077h,00bh,0cdh,0deh,0bdh,03eh,003h,0cdh,065h,0bdh,03ah	; bdaa  ..w..w....>..e.:
	defb 043h,0e2h,0ddh,0beh,004h,0c0h	; bdba

; ======================================================================
; CODIGO 0xbdc0..0xbdde  (30 bytes)
; ======================================================================


L_BDC0:
	ld d,(ix+003h)		;bdc0   ; pinta una fila de 4 caracteres (0xAD en MSX2, 0x61 en MSX1)
	ld e,(ix+002h)		;bdc3
	ld b,004h		;bdc6
L_BDC8:
	push de			;bdc8
	ld a,(0f0f4h)		;bdc9   ; lee la marca de MSX2 (1 en el cartucho de MSX2, 0 en el de MSX1)
	and a			;bdcc
	ld a,061h		;bdcd
	jr z,L_BDD3		;bdcf
	ld a,0adh		;bdd1
L_BDD3:
	call 05767h		;bdd3   ; pinta el caracter A sin su color 0 (p00:5219)
	pop de			;bdd6
	ld a,d			;bdd7
	add a,008h		;bdd8
	ld d,a			;bdda
	djnz L_BDC8		;bddb
	ret			;bddd

; ----------------------------------------------------------------------
; DATOS sin identificar  0xbdde..0xbe15  (55 bytes)
DATA_BDDE:
	defb 0ddh,066h,003h,0ddh,06eh,002h,03ah,0f4h,0f0h,0a7h,020h,016h,0cdh,07bh,04dh,0ddh	; bdde  .f..n.:... ..{M.
	defb 0e5h,0d1h,03eh,00ch,0cdh,094h,040h,006h,004h,0cdh,074h,001h,012h,023h,013h,010h	; bdee  ..>...@...t..#..
	defb 0f8h,0c9h,0ddh,0e5h,0d1h,07bh,087h,057h,01eh,040h,030h,002h,01eh,050h,001h,008h	; bdfe  .....{.W.@0..P..
	defb 020h,03eh,004h,0cdh,029h,050h,0c9h	; be0e

; ======================================================================
; CODIGO 0xbe15..0xbee5  (208 bytes)
; ======================================================================


L_BE15:
	ld hl,0e7c0h		;be15   ; las columnas de 0xE7C0 de esta pantalla
	ld b,010h		;be18
L_BE1A:
	ld a,(0e243h)		;be1a   ; lee la pantalla de la fase (desde 1)
	cp (hl)			;be1d
	push bc			;be1e
	push hl			;be1f
	call z,L_BE2D		;be20   ; el personaje sobre la columna: dentro de su alto y a menos de 16 pixeles en x
	pop hl			;be23
	ld a,004h		;be24
	call 0408fh		;be26   ; suma A a HL (HL = HL + A)
	pop bc			;be29
	djnz L_BE1A		;be2a
	ret			;be2c
L_BE2D:
	inc l			;be2d   ; el personaje sobre la columna: dentro de su alto y a menos de 16 pixeles en x
	ld e,(hl)			;be2e
	inc l			;be2f
	ld d,(hl)			;be30
	inc l			;be31
	ld a,(hl)			;be32
	and 01fh		;be33
	add a,a			;be35
	add a,a			;be36
	add a,a			;be37
	add a,018h		;be38
	ld b,a			;be3a
	ld a,e			;be3b
	sub 014h		;be3c
	ld c,a			;be3e
	ld a,(0e282h)		;be3f   ; lee la y del personaje
	sub c			;be42
	cp b			;be43
	ret nc			;be44
	ld a,(0e284h)		;be45   ; lee la x del personaje
	sub d			;be48
	cp 010h		;be49
	ret nc			;be4b
	ld a,(0e2a7h)		;be4c   ; al caer sobre ella (0xE2A7) tras haber estado en ella...
	and a			;be4f
	jr z,L_BE6D		;be50
	xor a			;be52
	ld (0e2a7h),a		;be53
	ld a,(hl)			;be56
	and 020h		;be57
	ret z			;be59
	res 5,(hl)		;be5a
	ld a,(hl)			;be5c   ; ...le queda una vez menos (bits 6-7); a la ultima se hunde
	and 0c0h		;be5d
	rlca			;be5f
	rlca			;be60
	dec a			;be61
	jr z,L_BE76		;be62
	rrca			;be64
	rrca			;be65
	ld c,a			;be66
	ld a,(hl)			;be67
	and 03fh		;be68
	or c			;be6a
	ld (hl),a			;be6b
	ret			;be6c
L_BE6D:
	ld a,(0e280h)		;be6d   ; subido (estado 2): se marca (bit 5)
	cp 002h		;be70
	ret nz			;be72
	set 5,(hl)		;be73
	ret			;be75
L_BE76:
	push hl			;be76   ; se hunde: arriba queda un ladrillo y el resto se vacia, con el sonido 0x40
	push de			;be77
	push bc			;be78
	call 096ffh		;be79   ; devuelve el fondo de los bloques de esta pantalla
	call 090abh		;be7c   ; las cosas de la lista 0xEE50 (por numero): lo que habia debajo se devuelve
	pop bc			;be7f
	pop de			;be80
	pop hl			;be81
	push hl			;be82
	push de			;be83
	ld a,005h		;be84
	call L_BED0		;be86   ; pinta dos caracteres A en fila en (D, E) y baja una fila
	ld a,(hl)			;be89
	and 01fh		;be8a
	dec a			;be8c
	ld (0eff0h),a		;be8d
	ld b,a			;be90
	push bc			;be91
	call nz,056dch		;be92   ; una cosa de 2 x B caracteres de la piramide en (D, E)
	pop bc			;be95
	pop de			;be96
	pop hl			;be97
	dec hl			;be98
	dec hl			;be99
	dec hl			;be9a
	ld (hl),000h		;be9b
	ex de,hl			;be9d
	ld a,(0e243h)		;be9e   ; lee la pantalla de la fase (desde 1)
	ld d,a			;bea1
	ld c,002h		;bea2
	push hl			;bea4
	push de			;bea5
	push bc			;bea6
	ld a,002h		;bea7
	ld b,001h		;bea9
	call 063edh		;beab   ; marca un rectangulo del mapa de la pantalla D: B filas de C casillas con el valor A
	pop bc			;beae
	pop de			;beaf
	pop hl			;beb0
	ld a,l			;beb1
	add a,008h		;beb2
	ld l,a			;beb4
	ld a,(0eff0h)		;beb5
	and a			;beb8
	ld a,000h		;beb9
	call nz,063edh		;bebb   ; marca un rectangulo del mapa de la pantalla D: B filas de C casillas con el valor A
	call 096cfh		;bebe   ; pinta los bloques de esta pantalla
	call 090f7h		;bec1   ; las de la lista, al reves: guarda el fondo y pinta la cosa
	ld hl,0e282h		;bec4   ; apunta a la y del personaje
	ld a,(hl)			;bec7
	add a,003h		;bec8
	and 0f8h		;beca
	ld (hl),a			;becc
	jp 04303h		;becd
L_BED0:
	push hl			;bed0   ; pinta dos caracteres A en fila en (D, E) y baja una fila
	push de			;bed1
	push af			;bed2
	call 05767h		;bed3   ; pinta el caracter A sin su color 0 (p00:5219)
	ld a,d			;bed6
	add a,008h		;bed7
	ld d,a			;bed9
	pop af			;beda
	call 05767h		;bedb   ; pinta el caracter A sin su color 0 (p00:5219)
	pop de			;bede
	pop hl			;bedf
	ld a,e			;bee0
	add a,008h		;bee1
	ld e,a			;bee3
	ret			;bee4

; ----------------------------------------------------------------------
; DATOS relleno_ff: 283 bytes a 0xFF hasta el final del banco: relleno; lo
;   leen nadie (283 bytes)
;   0xbee5..0xc000  (283 bytes)
DATA_relleno_ff:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bee5  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bef5  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf05  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf15  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf25  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf35  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf45  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf55  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf65  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf75  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf85  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf95  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfa5  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfb5  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfc5  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfd5  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfe5  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bff5  ...........
