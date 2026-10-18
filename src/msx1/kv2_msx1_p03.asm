; ==========================================================================
; KING'S VALLEY II - Konami (1988) - MSX - MegaROM RC-760 de 128 KB (Konami SCC) - banco 03 (se ejecuta en 0xa000)
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
laa83h:	equ 0x0aa83

; ======================================================================
; CODIGO 0xa000..0xa216  (534 bytes)
; ======================================================================


L_A000:
	di			;a000
	ld a,(0fd9ah)		;a001
	ld (0f0e4h),a		;a004
	ld a,0c9h		;a007
	ld (0fd9ah),a		;a009
	ld (0f0e2h),sp		;a00c   ; la pila, para volver si hay error
	call L_A108		;a010   ; cambia la RAM del juego con 0xC000-0xD0FF (4352 bytes) y guarda 0xF100 en 0xD780
	ld hl,09ed0h		;a013   ; 0xF323 = 0x9ED0 mientras (la rutina de error de disco)
	ld (0f323h),hl		;a016
	call L_A221		;a019   ; la FCB para buscar: el patron de 0xA216
	call L_A098		;a01c   ; la lista de nombres 0xCE50 a cero
	xor a			;a01f
	ld (0d0e5h),a		;a020
	call L_A1AC		;a023   ; busca los ficheros (ordenes 0x11 y 0x12) y apunta sus nombres, hasta 16
	di			;a026
	ld hl,(0d0e7h)		;a027   ; y vuelve la de antes
	ld (0f323h),hl		;a02a
	call L_A14F		;a02d   ; la deja como estaba
	ld a,(0f0e4h)		;a030   ; la interrupcion vuelve
	ld (0fd9ah),a		;a033
	ei			;a036
	ret			;a037
L_A038:
	ld de,(0d0e0h)		;a038   ; abre el fichero (orden 0x0F); error 1 si falla
	ld c,00fh		;a03c
	call 0f37dh		;a03e
	ld c,001h		;a041
	inc a			;a043
	jp z,09e97h		;a044
	ret			;a047
L_A048:
	ld de,(0d0e0h)		;a048   ; crea el fichero (orden 0x16); error 3 si falla
	di			;a04c
	ld c,016h		;a04d
	call 0f37dh		;a04f
	ei			;a052
	ld c,003h		;a053
	inc a			;a055
	jp z,09e97h		;a056
	ret			;a059
L_A05A:
	ld de,(0d0e0h)		;a05a   ; cierra (orden 0x10); error 2 si falla
	ld c,010h		;a05e
	call 0f37dh		;a060
	ld c,002h		;a063
	inc a			;a065
	jp z,09e97h		;a066
	ret			;a069
L_A06A:
	ld hl,0ce00h		;a06a   ; la FCB 0xCE00 a cero
	ld de,0ce01h		;a06d
	ld (hl),000h		;a070
	ld bc,00024h		;a072
	ldir		;a075
	ret			;a077
L_A078:
	ld (0d0e0h),hl		;a078
L_A07B:
	ld hl,(0d0e0h)		;a07b   ; el tamano de registro a 1 y el registro actual a 0
	ld bc,0000ch		;a07e   ; en la FCB: el bloque actual a 0
	add hl,bc			;a081
	ld (hl),b			;a082
	inc hl			;a083
	ld (hl),b			;a084
	inc hl			;a085
	ld bc,00001h		;a086   ; el tamano del registro a 1
	ld (hl),c			;a089
	inc hl			;a08a
	ld (hl),b			;a08b
	ld bc,00011h		;a08c   ; el registro aleatorio a 0
	add hl,bc			;a08f
	ld b,005h		;a090   ; 5 bytes
	xor a			;a092
L_A093:
	ld (hl),a			;a093
	inc hl			;a094
	djnz L_A093		;a095
	ret			;a097
L_A098:
	ld hl,0ce50h		;a098   ; la lista de nombres 0xCE50 a cero
	ld de,0ce51h		;a09b
	ld (hl),000h		;a09e
	ld bc,000afh		;a0a0
	ldir		;a0a3
	ret			;a0a5
L_A0A6:
	ld (0d0e0h),de		;a0a6   ; FCB en DE con el nombre de HL
	xor a			;a0aa
	ld (de),a			;a0ab
	inc de			;a0ac
	ld bc,0000bh		;a0ad
	ldir		;a0b0
	xor a			;a0b2
	ld b,019h		;a0b3
L_A0B5:
	ld (de),a			;a0b5
	inc de			;a0b6
	djnz L_A0B5		;a0b7
	ret			;a0b9
L_A0BA:
	ld (0d0e0h),de		;a0ba   ; FCB en DE con el nombre de HL sin los espacios de delante
	xor a			;a0be   ; la unidad 0 (la de por defecto)
	ld (de),a			;a0bf
	inc de			;a0c0
	push de			;a0c1   ; el nombre en blanco (11 bytes)
	push hl			;a0c2
	ld h,d			;a0c3
	ld l,e			;a0c4
	inc de			;a0c5
	ld (hl),000h		;a0c6
	ld bc,0000bh		;a0c8
	ldir		;a0cb
	pop hl			;a0cd
	pop de			;a0ce
	ld b,00bh		;a0cf   ; se saltan los espacios de delante del nombre
L_A0D1:
	ld a,(hl)			;a0d1
	or a			;a0d2
	jr nz,L_A0D8		;a0d3
	inc hl			;a0d5
	djnz L_A0D1		;a0d6
L_A0D8:
	ld c,b			;a0d8   ; copia el resto del nombre
	ld b,000h		;a0d9
	ldir		;a0db
	ld de,0ce0ch		;a0dd   ; el resto de la FCB a cero
	xor a			;a0e0
	ld b,019h		;a0e1
	ld (de),a			;a0e3
	inc de			;a0e4
	djnz L_A0B5		;a0e5
	ret			;a0e7
L_A0E8:
	ld de,(0d0e0h)		;a0e8   ; escribe HL registros (orden 0x26); error 4 si falla
	ld c,026h		;a0ec
	call 0f37dh		;a0ee
	ld c,004h		;a0f1
	or a			;a0f3
	jp nz,09e97h		;a0f4
	ret			;a0f7
L_A0F8:
	ld de,(0d0e0h)		;a0f8   ; lee HL registros (orden 0x27); error 0 si falla
	ld c,027h		;a0fc
	call 0f37dh		;a0fe
	ld c,000h		;a101
	or a			;a103
	jp nz,09e97h		;a104
	ret			;a107
L_A108:
	ld hl,0f100h		;a108   ; cambia la RAM del juego con 0xC000-0xD0FF (4352 bytes) y guarda 0xF100 en 0xD780
	ld de,0d780h		;a10b
	ld bc,00280h		;a10e
	ldir		;a111
	ld de,0f0ffh		;a113
	ld hl,0d0ffh		;a116
	exx			;a119
	ld de,0f37fh		;a11a
	ld bc,01100h		;a11d
L_A120:
	exx			;a120   ; cambia un byte de cada zona (de atras hacia delante)
	ld b,(hl)			;a121   ; una de cada zona...
	ld a,(de)			;a122
	dec de			;a123
	ld (hl),a			;a124
	dec hl			;a125
	ld a,b			;a126
	exx			;a127
	ld (de),a			;a128   ; ...cambiadas
	dec de			;a129
	dec bc			;a12a   ; 0x1100 bytes
	ld a,b			;a12b
	or c			;a12c
	jr nz,L_A120		;a12d
	ld hl,00000h		;a12f   ; 0xF1C0 = 0 y 0xF323 = 0x9E65
	ld (0f1c0h),hl		;a132
	ld hl,09e65h		;a135   ; la rutina de error de disco, otra vez la del juego
	ld (0f323h),hl		;a138
	ld a,(0d0efh)		;a13b
	inc a			;a13e
	ret nz			;a13f
	ld (0efc0h),sp		;a140   ; guarda un dato de paso de la rutina en curso
	ld hl,(0efc0h)		;a144   ; lee un dato de paso de la rutina en curso y el byte siguiente (16 bits)
	or a			;a147
	ld de,02000h		;a148
	sbc hl,de		;a14b
	ld sp,hl			;a14d
	ret			;a14e
L_A14F:
	call L_A18C		;a14f   ; la deja como estaba
	ld de,0e000h		;a152
	ld hl,0c000h		;a155
	exx			;a158
	ld de,0e280h		;a159   ; apunta a el estado del personaje
	ld bc,01100h		;a15c
L_A15F:
	exx			;a15f   ; cambia un byte de cada zona (de delante hacia atras)
	ld a,(hl)			;a160   ; de 0xC000 a 0xE280...
	ld (de),a			;a161   ; la de 0xC000, a 0xE280
	inc de			;a162
	exx			;a163
	ld a,(de)			;a164   ; ...y de 0xE280 a 0xC000
	inc de			;a165
	exx			;a166
	ld (hl),a			;a167   ; la de 0xE280, a 0xC000
	inc hl			;a168
	exx			;a169
	dec bc			;a16a   ; 0x1100 bytes
	ld a,b			;a16b
	or c			;a16c
	jr nz,L_A15F		;a16d
	ld de,0f100h		;a16f   ; y 0xD780 vuelve a 0xF100
	ld hl,0d780h		;a172
	ld bc,00280h		;a175
	ldir		;a178
	ld a,(0f0efh)		;a17a
	inc a			;a17d
	ret nz			;a17e
	ld (0efc0h),sp		;a17f   ; guarda un dato de paso de la rutina en curso
	ld hl,(0efc0h)		;a183   ; lee un dato de paso de la rutina en curso y el byte siguiente (16 bits)
	ld de,02000h		;a186
	add hl,de			;a189
	ld sp,hl			;a18a
	ret			;a18b
L_A18C:
	ld b,000h		;a18c   ; 256 veces la rutina de 0xD0EA
L_A18E:
	push bc			;a18e
	call 0d0eah		;a18f
	pop bc			;a192
	djnz L_A18E		;a193
	ret			;a195
L_A196:
	ld b,000h		;a196   ; 256 veces la de 0xF0EA
L_A198:
	push bc			;a198
	call 0f0eah		;a199
	pop bc			;a19c
	djnz L_A198		;a19d
	ret			;a19f
L_A1A0:
	ld hl,0ce09h		;a1a0   ; la extension: ELG
	ld (hl),045h		;a1a3
	inc hl			;a1a5
	ld (hl),04ch		;a1a6
	inc hl			;a1a8
	ld (hl),047h		;a1a9
	ret			;a1ab
L_A1AC:
	ld de,0ce25h		;a1ac   ; busca los ficheros (ordenes 0x11 y 0x12) y apunta sus nombres, hasta 16
	ld c,01ah		;a1af   ; la direccion de transferencia: 0xCE25
	call 0f37dh		;a1b1
	ld hl,0c26fh		;a1b4   ; 0xC26F: ya se ha buscado el primero
	ld a,(hl)			;a1b7   ; Z: el primero
	and a			;a1b8
	ld de,0ce00h		;a1b9
	jr nz,L_A1C8		;a1bc
	inc (hl)			;a1be
	ld c,011h		;a1bf   ; orden 0x11: el primero
	call 0f37dh		;a1c1
	inc a			;a1c4   ; no hay: Z
	ret z			;a1c5
	jr L_A1D6		;a1c6
L_A1C8:
	ld c,012h		;a1c8   ; orden 0x12: el siguiente
	call 0f37dh		;a1ca
	inc a			;a1cd
	jr nz,L_A1D6		;a1ce
	xor a			;a1d0   ; no hay mas: se empieza de nuevo
	ld (0c26fh),a		;a1d1
	jr L_A1AC		;a1d4
L_A1D6:
	ld hl,0d0e5h		;a1d6   ; uno mas
	inc (hl)			;a1d9
	push hl			;a1da
	call L_A1F4		;a1db   ; el nombre encontrado a la lista
	pop hl			;a1de
	ld a,(hl)			;a1df   ; hasta 16
	cp 010h		;a1e0
	jr z,L_A1EF		;a1e2
	ld de,0ce00h		;a1e4
	ld c,012h		;a1e7   ; el siguiente
	call 0f37dh		;a1e9
	inc a			;a1ec   ; no hay mas: se acaba
	jr nz,L_A1D6		;a1ed
L_A1EF:
	ld a,(0d0e5h)		;a1ef
	or a			;a1f2
	ret			;a1f3
L_A1F4:
	ld de,0ce26h		;a1f4   ; el nombre encontrado a la lista
	ld a,(0d0e5h)		;a1f7
	dec a			;a1fa
	call L_A205		;a1fb   ; HL = 0xCE50 + 11 x A
	ex de,hl			;a1fe
	ld bc,0000bh		;a1ff
	ldir		;a202
	ret			;a204
L_A205:
	ld l,a			;a205   ; HL = 0xCE50 + 11 x A
	ld h,000h		;a206
	ld b,h			;a208   ; A x 11 (A x 3 x 4 - A)
	ld c,l			;a209
	add hl,hl			;a20a   ; x 3
	add hl,bc			;a20b
	add hl,hl			;a20c   ; x 4
	add hl,hl			;a20d
	and a			;a20e
	sbc hl,bc		;a20f   ; menos A
	ld bc,0ce50h		;a211
	add hl,bc			;a214
	ret			;a215

; ----------------------------------------------------------------------
; DATOS resto_A216: lo apuntan con el banco puesto p03:A231 (0xA216); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p03:A231 (11 bytes)
;   0xa216..0xa221  (11 bytes)
DATA_resto_A216:
	defb 03fh,03fh,03fh,03fh,03fh,03fh,03fh,03fh,045h,04ch,047h	; a216  ????????ELG

; ======================================================================
; CODIGO 0xa221..0xa260  (63 bytes)
; ======================================================================


L_A221:
	ld hl,0ce25h		;a221   ; la FCB para buscar: el patron de 0xA216
	ld de,0ce26h		;a224
	ld (hl),000h		;a227
	ld bc,00024h		;a229   ; 0x25 bytes a cero
	ldir		;a22c
	call L_A06A		;a22e   ; la FCB 0xCE00 a cero
	ld hl,0a216h		;a231   ; el patron, 11 bytes
	ld de,0ce01h		;a234
	ld bc,0000bh		;a237
	ldir		;a23a
	ret			;a23c
L_A23D:
	ld a,(0e248h)		;a23d   ; un cuadro de las 64 cosas de 0xE300: cada tipo, su rutina (tabla detras)
	or a			;a240
	ret nz			;a241
	ld ix,0e300h		;a242   ; apunta a las cosas que se cogen y se llevan (64 x 8 bytes)
	ld b,040h		;a246
L_A248:
	push bc			;a248   ; una cosa de 0xE300
	call L_A255		;a249
	pop bc			;a24c
	ld de,00008h		;a24d   ; la siguiente (8 bytes)
	add ix,de		;a250
	djnz L_A248		;a252
	ret			;a254
L_A255:
	ld a,(ix+000h)		;a255   ; lee el estado (cifra alta) y el tipo (cifra baja) de la cosa
	or a			;a258
	ret z			;a259
	dec a			;a25a
	and 00fh		;a25b
	call 0409eh		;a25d   ; el despachador de Konami: la tabla va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_A260: 6 destinos del despachador p00:409E (call en p03:A25D, el
;   indice en A): A26C, A41B, A5E6, A689, A6DD, A775; lo leen p03:A25D (12
;   bytes)
;   0xa260..0xa26c  (12 bytes)
DATA_tabla_A260:
	defw 0a26ch,0a41bh,0a5e6h,0a689h,0a6ddh,0a775h	; a260

; ======================================================================
; CODIGO 0xa26c..0xa275  (9 bytes)
; ======================================================================


L_A26C:
	call L_A7E3		;a26c   ; tipo 1, por su estado (cifra alta)
	sub 001h		;a26f
	ret c			;a271
	call 0409eh		;a272   ; el despachador de Konami: la tabla va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_A275: 5 destinos del despachador p00:409E (call en p03:A272, el
;   indice en A): A27F, A286, A297, A2C3, A2EE; lo leen p03:A272 (10 bytes)
;   0xa275..0xa27f  (10 bytes)
DATA_tabla_A275:
	defw 0a27fh,0a286h,0a297h,0a2c3h,0a2eeh	; a275

; ======================================================================
; CODIGO 0xa27f..0xa424  (421 bytes)
; ======================================================================


L_A27F:
	ld a,(0e243h)		;a27f   ; en la mano: en la pantalla del personaje
	ld (ix+003h),a		;a282   ; guarda la pantalla de la cosa
	ret			;a285
L_A286:
	ld (ix+004h),000h		;a286   ; lanzado: sale
	ld a,(0e294h)		;a28a   ; lee hacia que lado mira el personaje (0 izquierda, 1 derecha)
	ld (ix+007h),a		;a28d   ; guarda el lado de la cosa
	call L_A4A1		;a290
	call L_A31F		;a293   ; al salir de la mano, se coloca delante (sin meterse en la pared)
	ret nc			;a296
L_A297:
	call L_A3FF		;a297   ; vuela en linea recta
	call L_A307		;a29a   ; C si es la cosa que ha dado a un enemigo (0xE2E8)
	jr nc,L_A2A4		;a29d
	ld a,(ix+007h)		;a29f   ; lee el lado de la cosa
	jr L_A2A9		;a2a2
L_A2A4:
	call L_A3A6		;a2a4   ; 4 pixeles hacia su lado
	ret c			;a2a7
	ld a,c			;a2a8
L_A2A9:
	rra			;a2a9
	ld a,004h		;a2aa
	jr nc,L_A2AF		;a2ac
	xor a			;a2ae
L_A2AF:
	add a,(ix+002h)		;a2af   ; le suma la x de la cosa
	and 0f8h		;a2b2
	cp 0f1h		;a2b4
	jr c,L_A2BA		;a2b6
	ld a,0f0h		;a2b8
L_A2BA:
	ld (ix+002h),a		;a2ba   ; guarda la x de la cosa
	call L_A4A1		;a2bd
	jp L_A394		;a2c0
L_A2C3:
	call L_A307		;a2c3   ; cae al suelo y se para
	call L_A3FF		;a2c6   ; el dibujo de la cosa en vuelo, cada dos cuadros; el sonido 0x1C
	dec (ix+006h)		;a2c9   ; baja la cuenta de la cosa
	ret nz			;a2cc
	xor a			;a2cd
	ld (ix+006h),004h		;a2ce   ; la cuenta de la cosa = 0x04
	ld (ix+005h),a		;a2d2   ; guarda el paso de la velocidad de la cosa
	ld (ix+007h),a		;a2d5   ; guarda el lado de la cosa
	call L_A4A1		;a2d8
	call L_A597		;a2db
	ld a,(ix+000h)		;a2de   ; lee el estado (cifra alta) y el tipo (cifra baja) de la cosa
	and 0f0h		;a2e1
	ret nz			;a2e3
	ld a,(0e243h)		;a2e4   ; lee la pantalla de la fase (desde 1)
	cp (ix+003h)		;a2e7   ; compara con la pantalla de la cosa
	ret nz			;a2ea
	jp 042e3h		;a2eb
L_A2EE:
	call L_A307		;a2ee   ; cae
	call L_A3FF		;a2f1   ; el dibujo de la cosa en vuelo, cada dos cuadros; el sonido 0x1C
	call L_A53A		;a2f4   ; cae cada vez mas deprisa (tabla 0xA5E0) hasta el suelo
	ld a,(ix+000h)		;a2f7   ; lee el estado (cifra alta) y el tipo (cifra baja) de la cosa
	and 0f0h		;a2fa
	ret nz			;a2fc
	ld a,(0e243h)		;a2fd   ; lee la pantalla de la fase (desde 1)
	cp (ix+003h)		;a300   ; compara con la pantalla de la cosa
	ret nz			;a303
	jp 042e3h		;a304
L_A307:
	ld a,(0edcdh)		;a307   ; C si es la cosa que ha dado a un enemigo (0xE2E8)
	and a			;a30a   ; 0: no
	ret z			;a30b
	push ix		;a30c   ; IX es la cosa de 0xE2E8?
	pop de			;a30e
	ld hl,(0e2e8h)		;a30f
	and a			;a312
	sbc hl,de		;a313
	jr nz,L_A31D		;a315   ; no: NC
	xor a			;a317   ; si: se borra la marca
	ld (0edcdh),a		;a318
	scf			;a31b
	ret			;a31c
L_A31D:
	and a			;a31d   ; no: NC
	ret			;a31e
L_A31F:
	ld a,(0e243h)		;a31f   ; al salir de la mano, se coloca delante (sin meterse en la pared)
	cp (ix+003h)		;a322   ; compara con la pantalla de la cosa
	ret nz			;a325
	ld a,008h		;a326
	add a,(ix+002h)		;a328   ; le suma la x de la cosa
	cp 0eeh		;a32b
	jr c,L_A333		;a32d
	ld a,0e8h		;a32f
	jr L_A339		;a331
L_A333:
	cp 008h		;a333
	jr nc,L_A339		;a335
	ld a,008h		;a337
L_A339:
	ld h,a			;a339
	ld l,(ix+001h)		;a33a   ; lee la y de la cosa
	call 09d55h		;a33d   ; A = la casilla del mapa de la pantalla en (H, L), sin tocar HL
	sub 002h		;a340   ; ladrillo (2-3)?
	ld b,010h		;a342
	jr nc,L_A379		;a344
	ld a,l			;a346   ; y la de debajo
	add a,008h		;a347
	ld l,a			;a349
	call 09d55h		;a34a   ; A = la casilla del mapa de la pantalla en (H, L), sin tocar HL
	sub 002h		;a34d
	ld b,010h		;a34f
	jr nc,L_A379		;a351
	ld a,l			;a353   ; la fila de antes
	sub 008h		;a354
	ld l,a			;a356
	ld a,(0e294h)		;a357   ; lee hacia que lado mira el personaje (0 izquierda, 1 derecha)
	or a			;a35a
	ld a,h			;a35b
	jr nz,L_A362		;a35c
	sub 008h		;a35e   ; a la izquierda: x - 8
	jr L_A364		;a360
L_A362:
	add a,008h		;a362
L_A364:
	ld h,a			;a364
	ret c			;a365
	call 09d55h		;a366   ; ladrillo (2-3)?
	sub 002h		;a369
	jr nc,L_A377		;a36b
	ld a,l			;a36d   ; 9 mas abajo
	add a,009h		;a36e
	ld l,a			;a370
	call 09d55h		;a371   ; A = la casilla del mapa de la pantalla en (H, L), sin tocar HL
	sub 002h		;a374   ; ladrillo (2-3)?
	ret c			;a376
L_A377:
	ld b,008h		;a377
L_A379:
	ld a,(0e294h)		;a379   ; lee hacia que lado mira el personaje (0 izquierda, 1 derecha)
	or a			;a37c
	ld a,b			;a37d
	jr z,L_A384		;a37e
	sub 008h		;a380
	neg		;a382
L_A384:
	add a,(ix+002h)		;a384   ; le suma la x de la cosa
	and 0f8h		;a387
	ld (ix+002h),a		;a389   ; guarda la x de la cosa
	call L_A394		;a38c   ; IX+06 = 0x18
	call L_A4A1		;a38f
	and a			;a392
	ret			;a393
L_A394:
	ld (ix+006h),018h		;a394   ; IX+06 = 0x18
	ret			;a398
L_A399:
	ld a,b			;a399   ; se mueve B pixeles
	bit 7,a		;a39a
	ld c,003h		;a39c
	jr z,L_A3B0		;a39e
	neg		;a3a0
	ld b,a			;a3a2
	dec c			;a3a3
	jr L_A3B6		;a3a4
L_A3A6:
	ld a,(ix+007h)		;a3a6   ; 4 pixeles hacia su lado
	or a			;a3a9
	ld bc,00402h		;a3aa
	jr z,L_A3B6		;a3ad
	inc c			;a3af
L_A3B0:
	ld a,(ix+002h)		;a3b0   ; lee la x de la cosa
	add a,b			;a3b3
	jr L_A3BA		;a3b4
L_A3B6:
	ld a,(ix+002h)		;a3b6   ; lee la x de la cosa
	sub b			;a3b9
L_A3BA:
	ld (ix+002h),a		;a3ba   ; guarda la x de la cosa
	jr c,L_A3D3		;a3bd
	ld a,(0e243h)		;a3bf   ; lee la pantalla de la fase (desde 1)
	cp (ix+003h)		;a3c2   ; compara con la pantalla de la cosa
	jr nz,L_A3E6		;a3c5
	ld h,(ix+002h)		;a3c7   ; lee la x de la cosa
	ld l,(ix+001h)		;a3ca   ; lee la y de la cosa
	push bc			;a3cd
	call 09d89h		;a3ce   ; NC si hay pared en la direccion C (tres puntos de la orilla, en el mapa de la pantalla)
	pop bc			;a3d1
	ret			;a3d2
L_A3D3:
	ld a,(ix+003h)		;a3d3   ; pasa a la pantalla de al lado
	push bc			;a3d6
	call 05be7h		;a3d7   ; C = la casilla de la rejilla en la que esta la pantalla A
	pop bc			;a3da
	ld b,a			;a3db
	push bc			;a3dc
	ld a,c			;a3dd
	inc a			;a3de
	call 05c2fh		;a3df
	pop bc			;a3e2
	ld (ix+003h),l		;a3e3   ; guarda la pantalla de la cosa
L_A3E6:
	ld b,(ix+003h)		;a3e6   ; C si hay pared delante en el mapa de su pantalla
	ld hl,0e840h		;a3e9
	ld de,000c0h		;a3ec
L_A3EF:
	add hl,de			;a3ef
	djnz L_A3EF		;a3f0
	ex de,hl			;a3f2
	ld h,(ix+002h)		;a3f3   ; lee la x de la cosa
	ld l,(ix+001h)		;a3f6   ; lee la y de la cosa
	push bc			;a3f9
	call 09dach		;a3fa   ; lo mismo con el mapa de DE
	pop bc			;a3fd
	ret			;a3fe
L_A3FF:
	ld a,(0e203h)		;a3ff   ; el dibujo de la cosa en vuelo, cada dos cuadros; el sonido 0x1C
	and 001h		;a402
	ret nz			;a404
	ld a,(ix+004h)		;a405   ; lee el dibujo de la cosa en vuelo
	inc a			;a408
	cp 003h		;a409
	jr c,L_A417		;a40b
	ld a,(0e243h)		;a40d   ; lee la pantalla de la fase (desde 1)
	cp (ix+003h)		;a410   ; compara con la pantalla de la cosa
	call z,0426fh		;a413   ; pide el sonido 0x1C
	xor a			;a416
L_A417:
	ld (ix+004h),a		;a417   ; guarda el dibujo de la cosa en vuelo
	ret			;a41a
L_A41B:
	call L_A7E3		;a41b   ; tipo 2: va y vuelve
	sub 001h		;a41e
	ret c			;a420
	call 0409eh		;a421   ; el despachador de Konami: la tabla va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_A424: 5 destinos del despachador p00:409E (call en p03:A421, el
;   indice en A): A27F, A42E, A447, A4F5, A514; lo leen p03:A421 (10 bytes)
;   0xa424..0xa42e  (10 bytes)
DATA_tabla_A424:
	defw 0a27fh,0a42eh,0a447h,0a4f5h,0a514h	; a424

; ======================================================================
; CODIGO 0xa42e..0xa4e1  (179 bytes)
; ======================================================================


L_A42E:
	ld (ix+004h),003h		;a42e   ; el dibujo de la cosa en vuelo = 0x03
	ld (ix+005h),000h		;a432   ; el paso de la velocidad de la cosa = 0x00
	ld (ix+006h),008h		;a436   ; la cuenta de la cosa = 0x08
	ld a,(0e294h)		;a43a   ; lee hacia que lado mira el personaje (0 izquierda, 1 derecha)
	ld (ix+007h),a		;a43d   ; guarda el lado de la cosa
	call L_A4A1		;a440
	call L_A31F		;a443   ; al salir de la mano, se coloca delante (sin meterse en la pared)
	ret nc			;a446
L_A447:
	call L_A51D		;a447   ; la velocidad sale de las tablas 0xA4E1 y 0xA4EB: frena y vuelve
	call L_A307		;a44a   ; C si es la cosa que ha dado a un enemigo (0xE2E8)
	jr nc,L_A454		;a44d
	ld a,(ix+007h)		;a44f   ; lee el lado de la cosa
	jr L_A48A		;a452
L_A454:
	dec (ix+006h)		;a454   ; baja la cuenta de la cosa
	jr nz,L_A471		;a457
	ld a,(ix+005h)		;a459   ; lee el paso de la velocidad de la cosa
	inc a			;a45c
	cp 009h		;a45d
	jr c,L_A463		;a45f
	ld a,009h		;a461
L_A463:
	ld (ix+005h),a		;a463   ; guarda el paso de la velocidad de la cosa
	ld e,a			;a466
	ld d,000h		;a467
	ld hl,0a4ebh		;a469
	add hl,de			;a46c
	ld a,(hl)			;a46d
	ld (ix+006h),a		;a46e   ; guarda la cuenta de la cosa
L_A471:
	ld e,(ix+005h)		;a471   ; lee el paso de la velocidad de la cosa
	ld d,000h		;a474
	ld hl,0a4e1h		;a476
	add hl,de			;a479
	ld a,(ix+007h)		;a47a   ; lee el lado de la cosa
	or a			;a47d
	ld a,(hl)			;a47e
	jr nz,L_A483		;a47f
	neg		;a481
L_A483:
	ld b,a			;a483
	call L_A399		;a484   ; se mueve B pixeles
	jr c,L_A4AA		;a487
	ld a,c			;a489
L_A48A:
	rra			;a48a
	ld a,004h		;a48b
	jr nc,L_A490		;a48d
	xor a			;a48f
L_A490:
	add a,(ix+002h)		;a490   ; le suma la x de la cosa
	and 0f8h		;a493
	cp 0f1h		;a495
	jr c,L_A49B		;a497
	ld a,0f0h		;a499
L_A49B:
	ld (ix+002h),a		;a49b   ; guarda la x de la cosa
	call L_A394		;a49e   ; IX+06 = 0x18
L_A4A1:
	ld a,(ix+000h)		;a4a1   ; lee el estado (cifra alta) y el tipo (cifra baja) de la cosa
	add a,010h		;a4a4
	ld (ix+000h),a		;a4a6   ; guarda el estado (cifra alta) y el tipo (cifra baja) de la cosa
	ret			;a4a9
L_A4AA:
	ld a,(0e287h)		;a4aa   ; vuelve a la mano si el personaje la toca (a menos de 13 pixeles), con el sonido 0x35
	or a			;a4ad
	ret nz			;a4ae
	ld a,(0e243h)		;a4af   ; lee la pantalla de la fase (desde 1)
	cp (ix+003h)		;a4b2   ; compara con la pantalla de la cosa
	ret nz			;a4b5
	ld a,(0e282h)		;a4b6   ; lee la y del personaje
	sub (ix+001h)		;a4b9   ; le resta la y de la cosa
	jr nc,L_A4C0		;a4bc
	neg		;a4be
L_A4C0:
	cp 00dh		;a4c0
	ret nc			;a4c2
	ld a,(0e284h)		;a4c3   ; lee la x del personaje
	sub (ix+002h)		;a4c6   ; le resta la x de la cosa
	jr nc,L_A4CD		;a4c9
	neg		;a4cb
L_A4CD:
	cp 00dh		;a4cd
	ret nc			;a4cf
	ld hl,0e2a9h		;a4d0   ; apunta a cuantas cosas lanzadas hay en el aire
	dec (hl)			;a4d3
	call 042dfh		;a4d4   ; pide el sonido 0x35
	ld (ix+000h),012h		;a4d7   ; el estado (cifra alta) y el tipo (cifra baja) de la cosa = 0x12
	ld a,002h		;a4db
	ld (0e287h),a		;a4dd   ; guarda la postura del personaje
	ret			;a4e0

; ----------------------------------------------------------------------
; DATOS resto_A4E1: lo apuntan con el banco puesto p03:A476 (0xA4E1), p03:A469
;   (0xA4EB); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p03:A476, p03:A469 (20 bytes)
;   0xa4e1..0xa4f5  (20 bytes)
DATA_resto_A4E1:
	defb 004h,003h,002h,001h,000h,0ffh,0feh,0fdh,0fch,0fbh,008h,006h,004h,003h,002h,003h	; a4e1  ................
	defb 004h,006h,008h,0ffh	; a4f1

; ======================================================================
; CODIGO 0xa4f5..0xa5e0  (235 bytes)
; ======================================================================


L_A4F5:
	call L_A307		;a4f5   ; cae y se para
	call L_A51D		;a4f8   ; su dibujo, cada dos cuadros; el sonido 0x1B
	dec (ix+006h)		;a4fb   ; baja la cuenta de la cosa
	ret nz			;a4fe
	xor a			;a4ff
	ld (ix+004h),003h		;a500   ; el dibujo de la cosa en vuelo = 0x03
	ld (ix+005h),a		;a504   ; guarda el paso de la velocidad de la cosa
	ld (ix+006h),004h		;a507   ; la cuenta de la cosa = 0x04
	ld (ix+007h),a		;a50b   ; guarda el lado de la cosa
	call L_A4A1		;a50e
	jp L_A597		;a511
L_A514:
	call L_A307		;a514   ; C si es la cosa que ha dado a un enemigo (0xE2E8)
	call L_A51D		;a517   ; su dibujo, cada dos cuadros; el sonido 0x1B
	jp L_A53A		;a51a
L_A51D:
	ld a,(0e203h)		;a51d   ; su dibujo, cada dos cuadros; el sonido 0x1B
	and 001h		;a520
	ret nz			;a522
	ld a,(ix+004h)		;a523   ; lee el dibujo de la cosa en vuelo
	inc a			;a526
	cp 006h		;a527
	jr c,L_A536		;a529
	ld a,(0e243h)		;a52b   ; lee la pantalla de la fase (desde 1)
	cp (ix+003h)		;a52e   ; compara con la pantalla de la cosa
	call z,0426ah		;a531   ; pide el sonido 0x1B
	ld a,003h		;a534
L_A536:
	ld (ix+004h),a		;a536   ; guarda el dibujo de la cosa en vuelo
	ret			;a539
L_A53A:
	dec (ix+006h)		;a53a   ; cae cada vez mas deprisa (tabla 0xA5E0) hasta el suelo
	ld a,(ix+005h)		;a53d   ; lee el paso de la velocidad de la cosa
	jr nz,L_A556		;a540
	cp 005h		;a542
	jr nc,L_A54A		;a544
	inc a			;a546
	ld (ix+005h),a		;a547   ; guarda el paso de la velocidad de la cosa
L_A54A:
	ld e,a			;a54a
	ld d,000h		;a54b
	ld hl,0a5e0h		;a54d
	add hl,de			;a550
	ld a,(hl)			;a551
	ld (ix+006h),a		;a552   ; guarda la cuenta de la cosa
	ld a,e			;a555
L_A556:
	inc a			;a556
	add a,(ix+001h)		;a557   ; le suma la y de la cosa
	ld (ix+001h),a		;a55a   ; guarda la y de la cosa
	cp 0b8h		;a55d
	jr nc,L_A583		;a55f
	ld a,(0e243h)		;a561   ; lee la pantalla de la fase (desde 1)
	cp (ix+003h)		;a564   ; compara con la pantalla de la cosa
	jr nz,L_A597		;a567
	ld a,(ix+001h)		;a569   ; lee la y de la cosa
	add a,010h		;a56c
	cp 0b8h		;a56e
	jr c,L_A574		;a570
	ld a,0b8h		;a572
L_A574:
	ld l,a			;a574
	ld a,(ix+002h)		;a575   ; lee la x de la cosa
	add a,008h		;a578
	ld h,a			;a57a
	call 09d5bh		;a57b   ; A = la casilla del mapa de la pantalla (0xE250) en el pixel (x H, y L)
	cp 002h		;a57e
	jr nc,L_A5B0		;a580
	ret			;a582
L_A583:
	ld a,008h		;a583   ; se sale por abajo: a la pantalla de abajo
	ld (ix+001h),a		;a585   ; guarda la y de la cosa
	ld a,(ix+003h)		;a588   ; lee la pantalla de la cosa
	call 05be7h		;a58b   ; C = la casilla de la rejilla en la que esta la pantalla A
	ld b,a			;a58e
	ld a,002h		;a58f
	call 05c2fh		;a591
	ld (ix+003h),l		;a594   ; guarda la pantalla de la cosa
L_A597:
	ld b,(ix+003h)		;a597   ; lee la pantalla de la cosa
	ld hl,0e840h		;a59a
	ld de,000c0h		;a59d
L_A5A0:
	add hl,de			;a5a0
	djnz L_A5A0		;a5a1
	ex de,hl			;a5a3
	ld h,(ix+002h)		;a5a4   ; lee la x de la cosa
	ld l,(ix+001h)		;a5a7   ; lee la y de la cosa
	ld c,001h		;a5aa
	call 09dach		;a5ac   ; lo mismo con el mapa de DE
	ret c			;a5af
L_A5B0:
	ld hl,0e2a9h		;a5b0   ; en el suelo: se queda, y se pinta
	dec (hl)			;a5b3   ; una menos en el aire
	ld a,(ix+001h)		;a5b4   ; lee la y de la cosa
	and 0f8h		;a5b7   ; la y, a la fila de 8
	ld (ix+001h),a		;a5b9   ; guarda la y de la cosa
	ld a,(ix+000h)		;a5bc   ; lee el estado (cifra alta) y el tipo (cifra baja) de la cosa
	and 00fh		;a5bf   ; estado 0: en el suelo
	ld (ix+000h),a		;a5c1   ; guarda el estado (cifra alta) y el tipo (cifra baja) de la cosa
	ld a,(0e243h)		;a5c4   ; lee la pantalla de la fase (desde 1)
	cp (ix+003h)		;a5c7   ; compara con la pantalla de la cosa
	ret nz			;a5ca
	call 08f51h		;a5cb   ; pasa la cosa de IX al principio de la lista
	push ix		;a5ce
	call 09418h		;a5d0   ; devuelve el fondo de los bloques de esta pantalla
	pop ix		;a5d3
	call 08e93h		;a5d5   ; una cosa de 0xE300 en el suelo: guarda su fondo y la pinta (0x9041 + 4 x (tipo - 1))
	push ix		;a5d8
	call 093e8h		;a5da   ; pinta los bloques de esta pantalla
	pop ix		;a5dd
	ret			;a5df

; ----------------------------------------------------------------------
; DATOS resto_A5E0: lo apuntan con el banco puesto p03:A54D (0xA5E0); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p03:A54D (6 bytes)
;   0xa5e0..0xa5e6  (6 bytes)
DATA_resto_A5E0:
	defb 003h,003h,003h,003h,003h,0ffh	; a5e0

; ======================================================================
; CODIGO 0xa5e6..0xa5ef  (9 bytes)
; ======================================================================


L_A5E6:
	call L_A7E3		;a5e6   ; tipo 3: cava hacia abajo una vez
	sub 001h		;a5e9
	ret c			;a5eb
	call 0409eh		;a5ec   ; el despachador de Konami: la tabla va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_A5EF: 3 destinos del despachador p00:409E (call en p03:A5EC, el
;   indice en A): A27F, A5F5, A604; lo leen p03:A5EC (6 bytes)
;   0xa5ef..0xa5f5  (6 bytes)
DATA_tabla_A5EF:
	defw 0a27fh,0a5f5h,0a604h	; a5ef  -> L_A27F L_A5F5 L_A604

; ======================================================================
; CODIGO 0xa5f5..0xa683  (142 bytes)
; ======================================================================


L_A5F5:
	ld (ix+006h),008h		;a5f5   ; la cuenta de la cosa = 0x08
	ld (ix+005h),0ffh		;a5f9   ; el paso de la velocidad de la cosa = 0xFF
	ld (ix+007h),000h		;a5fd   ; el lado de la cosa = 0x00
	jp L_A4A1		;a601
L_A604:
	call L_A629		;a604   ; cuando acaba, vuelve a la mano vacia
	ld a,(ix+007h)		;a607   ; lee el lado de la cosa
	or a			;a60a
	ret z			;a60b
L_A60C:
	ld a,(0e294h)		;a60c   ; el personaje sin nada y en el estado 0
	or a			;a60f
	ld a,003h		;a610
	jr nz,L_A615		;a612
	xor a			;a614
L_A615:
	ld (0e285h),a		;a615   ; guarda el dibujo del personaje (direccion y paso)
	xor a			;a618
	ld (ix+000h),a		;a619   ; guarda el estado (cifra alta) y el tipo (cifra baja) de la cosa
	ld (0e287h),a		;a61c   ; guarda la postura del personaje
	ld a,(0e298h)		;a61f   ; lee la marca de personaje muerto
	or a			;a622
	ret nz			;a623
	xor a			;a624
	ld (0e280h),a		;a625   ; guarda el estado del personaje
	ret			;a628
L_A629:
	dec (ix+006h)		;a629   ; cada 8 cuadros, el paso del agujero: los dos caracteres de 0xA683
	ret nz			;a62c
	ld (ix+006h),008h		;a62d   ; la cuenta de la cosa = 0x08
	ld a,(ix+005h)		;a631   ; lee el paso de la velocidad de la cosa
	inc a			;a634   ; el paso siguiente...
	cp 003h		;a635   ; ...hasta 3
	jr z,L_A667		;a637
	push af			;a639
	ld hl,(0e2a2h)		;a63a   ; lee donde se cava (y, x) y el byte siguiente (16 bits)
	ld d,h			;a63d
	ld e,l			;a63e
	ld bc,00102h		;a63f   ; 1 x 2
	call 0537dh		;a642
	pop af			;a645
	ld (ix+005h),a		;a646   ; guarda el paso de la velocidad de la cosa
	add a,a			;a649   ; el paso x 2
	ld e,a			;a64a
	ld d,000h		;a64b
	ld hl,0a683h		;a64d
	add hl,de			;a650
	ex de,hl			;a651
	ld hl,(0e2a2h)		;a652   ; lee donde se cava (y, x) y el byte siguiente (16 bits)
	ld a,(de)			;a655
	ex de,hl			;a656
	inc hl			;a657
	push hl			;a658
	push de			;a659
	call 053efh		;a65a   ; escribe el caracter A en la posicion D, E de la tabla de nombres
	pop de			;a65d
	pop hl			;a65e
	ld a,d			;a65f   ; 8 pixeles a la derecha
	add a,008h		;a660
	ld d,a			;a662
	ld a,(hl)			;a663   ; el segundo caracter
	jp 053efh		;a664
L_A667:
	ld hl,(0e2a2h)		;a667   ; al tercer paso, el agujero: las casillas a 0 en el mapa
	ld d,h			;a66a
	ld e,l			;a66b
	ld bc,00102h		;a66c
	call 0537dh		;a66f
	inc (ix+007h)		;a672   ; sube el lado de la cosa
	ld hl,(0e2a2h)		;a675   ; lee donde se cava (y, x) y el byte siguiente (16 bits)
	ld a,(0e243h)		;a678   ; lee la pantalla de la fase (desde 1)
	ld d,a			;a67b
	ld bc,00102h		;a67c
	xor a			;a67f
	jp 061f7h		;a680

; ----------------------------------------------------------------------
; DATOS resto_A683: lo apuntan con el banco puesto p03:A64D (0xA683); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p03:A64D (6 bytes)
;   0xa683..0xa689  (6 bytes)
DATA_resto_A683:
	defb 006h,007h,008h,009h,00ah,00bh	; a683

; ======================================================================
; CODIGO 0xa689..0xa692  (9 bytes)
; ======================================================================


L_A689:
	call L_A7E3		;a689   ; tipo 4: cava hacia abajo mientras haya ladrillo
	sub 001h		;a68c
	ret c			;a68e
	call 0409eh		;a68f   ; el despachador de Konami: la tabla va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_A692: 4 destinos del despachador p00:409E (call en p03:A68F, el
;   indice en A): A27F, A69A, A6A9, A6D2; lo leen p03:A68F (8 bytes)
;   0xa692..0xa69a  (8 bytes)
DATA_tabla_A692:
	defw 0a27fh,0a69ah,0a6a9h,0a6d2h	; a692  -> L_A27F L_A69A L_A6A9 L_A6D2

; ======================================================================
; CODIGO 0xa69a..0xa6e6  (76 bytes)
; ======================================================================


L_A69A:
	ld (ix+006h),008h		;a69a   ; la cuenta de la cosa = 0x08
	ld (ix+005h),0ffh		;a69e   ; el paso de la velocidad de la cosa = 0xFF
	ld (ix+007h),000h		;a6a2   ; el lado de la cosa = 0x00
	jp L_A4A1		;a6a6
L_A6A9:
	call L_A629		;a6a9   ; cada 8 cuadros, el paso del agujero: los dos caracteres de 0xA683
	ld a,(ix+007h)		;a6ac   ; lee el lado de la cosa
	or a			;a6af   ; 0: nada mas
	ret z			;a6b0
	ld hl,(0e2a2h)		;a6b1   ; la fila de debajo: si tambien es de ladrillo, sigue
	ld a,l			;a6b4
	add a,008h		;a6b5
	ld l,a			;a6b7
	ld (0e2a2h),hl		;a6b8   ; guarda donde se cava (y, x) y el byte siguiente (16 bits)
	call 09d55h		;a6bb   ; A = la casilla del mapa de la pantalla en (H, L), sin tocar HL
	cp 002h		;a6be   ; ladrillo (2)?
	jp nz,L_A60C		;a6c0
	ld a,h			;a6c3   ; y la de la derecha
	add a,008h		;a6c4
	ld h,a			;a6c6
	call 09d5bh		;a6c7   ; A = la casilla del mapa de la pantalla (0xE250) en el pixel (x H, y L)
	cp 002h		;a6ca   ; ladrillo (2)?
	jp nz,L_A60C		;a6cc
	call L_A69A		;a6cf
L_A6D2:
	call L_A629		;a6d2   ; cada 8 cuadros, el paso del agujero: los dos caracteres de 0xA683
	ld a,(ix+007h)		;a6d5   ; lee el lado de la cosa
	or a			;a6d8
	ret z			;a6d9
	jp L_A60C		;a6da
L_A6DD:
	call L_A7E3		;a6dd   ; tipo 5: cava hacia el lado una vez
	sub 001h		;a6e0
	ret c			;a6e2
	call 0409eh		;a6e3   ; el despachador de Konami: la tabla va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_A6E6: 3 destinos del despachador p00:409E (call en p03:A6E3, el
;   indice en A): A27F, A6EC, A6FB; lo leen p03:A6E3 (6 bytes)
;   0xa6e6..0xa6ec  (6 bytes)
DATA_tabla_A6E6:
	defw 0a27fh,0a6ech,0a6fbh	; a6e6  -> L_A27F L_A6EC L_A6FB

; ======================================================================
; CODIGO 0xa6ec..0xa769  (125 bytes)
; ======================================================================


L_A6EC:
	ld (ix+006h),008h		;a6ec   ; la cuenta de la cosa = 0x08
	ld (ix+005h),0ffh		;a6f0   ; el paso de la velocidad de la cosa = 0xFF
	ld (ix+007h),000h		;a6f4   ; el lado de la cosa = 0x00
	jp L_A4A1		;a6f8
L_A6FB:
	call L_A706		;a6fb   ; cada 8 cuadros, el paso del agujero (tablas 0xA769 y 0xA76F segun el lado)
	ld a,(ix+007h)		;a6fe   ; lee el lado de la cosa
	or a			;a701
	ret z			;a702
	jp L_A60C		;a703
L_A706:
	dec (ix+006h)		;a706   ; cada 8 cuadros, el paso del agujero (tablas 0xA769 y 0xA76F segun el lado)
	ret nz			;a709
	ld (ix+006h),008h		;a70a   ; la cuenta de la cosa = 0x08
	ld a,(ix+005h)		;a70e   ; lee el paso de la velocidad de la cosa
	inc a			;a711   ; el paso siguiente...
	cp 003h		;a712   ; ...hasta 3
	jr z,L_A74D		;a714
	push af			;a716
	ld hl,(0e2a2h)		;a717   ; lee donde se cava (y, x) y el byte siguiente (16 bits)
	ld d,h			;a71a
	ld e,l			;a71b
	ld bc,00201h		;a71c   ; 2 x 1
	call 0537dh		;a71f
	pop af			;a722
	ld (ix+005h),a		;a723   ; guarda el paso de la velocidad de la cosa
	add a,a			;a726   ; el paso x 2
	ld e,a			;a727
	ld d,000h		;a728
	ld hl,0a769h		;a72a
	ld a,(0e294h)		;a72d   ; lee hacia que lado mira el personaje (0 izquierda, 1 derecha)
	or a			;a730
	jr z,L_A736		;a731
	ld hl,0a76fh		;a733   ; mirando a la derecha
L_A736:
	add hl,de			;a736
	ex de,hl			;a737
	ld hl,(0e2a2h)		;a738   ; donde se cava
	ld a,(de)			;a73b
	ex de,hl			;a73c
	inc hl			;a73d   ; el segundo caracter
	push hl			;a73e
	push de			;a73f
	call 053efh		;a740   ; escribe el caracter A en la posicion D, E de la tabla de nombres
	pop de			;a743
	pop hl			;a744
	ld a,e			;a745   ; 8 mas abajo
	add a,008h		;a746
	ld e,a			;a748
	ld a,(hl)			;a749
	jp 053efh		;a74a
L_A74D:
	ld hl,(0e2a2h)		;a74d   ; al tercer paso, las casillas a 0
	ld d,h			;a750
	ld e,l			;a751
	ld bc,00201h		;a752
	call 0537dh		;a755
	inc (ix+007h)		;a758   ; sube el lado de la cosa
	ld hl,(0e2a2h)		;a75b   ; lee donde se cava (y, x) y el byte siguiente (16 bits)
	ld a,(0e243h)		;a75e   ; lee la pantalla de la fase (desde 1)
	ld d,a			;a761
	ld bc,00201h		;a762
	xor a			;a765
	jp 061f7h		;a766

; ----------------------------------------------------------------------
; DATOS resto_A769: lo apuntan con el banco puesto p03:A72A (0xA769), p03:A733
;   (0xA76F); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p03:A72A, p03:A733 (12 bytes)
;   0xa769..0xa775  (12 bytes)
DATA_resto_A769:
	defb 00ch,00dh,00eh,00fh,010h,011h,012h,013h,014h,015h,016h,017h	; a769  ............

; ======================================================================
; CODIGO 0xa775..0xa77e  (9 bytes)
; ======================================================================


L_A775:
	call L_A7E3		;a775   ; tipo 6: cava hacia el lado mientras haya ladrillo, y el personaje avanza
	sub 001h		;a778
	ret c			;a77a
	call 0409eh		;a77b   ; el despachador de Konami: la tabla va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_A77E: 4 destinos del despachador p00:409E (call en p03:A77B, el
;   indice en A): A27F, A786, A795, A7D8; lo leen p03:A77B (8 bytes)
;   0xa77e..0xa786  (8 bytes)
DATA_tabla_A77E:
	defw 0a27fh,0a786h,0a795h,0a7d8h	; a77e  -> L_A27F L_A786 L_A795 L_A7D8

; ======================================================================
; CODIGO 0xa786..0xa8ba  (308 bytes)
; ======================================================================


L_A786:
	ld (ix+006h),008h		;a786   ; la cuenta de la cosa = 0x08
	ld (ix+005h),0ffh		;a78a   ; el paso de la velocidad de la cosa = 0xFF
	ld (ix+007h),000h		;a78e   ; el lado de la cosa = 0x00
	jp L_A4A1		;a792
L_A795:
	call L_A706		;a795   ; cada 8 cuadros, el paso del agujero (tablas 0xA769 y 0xA76F segun el lado)
	ld a,(ix+007h)		;a798   ; lee el lado de la cosa
	or a			;a79b
	ret z			;a79c
	ld hl,(0e2a2h)		;a79d   ; lee donde se cava (y, x) y el byte siguiente (16 bits)
	ld b,0f8h		;a7a0
	ld a,(0e294h)		;a7a2   ; lee hacia que lado mira el personaje (0 izquierda, 1 derecha)
	or a			;a7a5
	jr z,L_A7AA		;a7a6
	ld b,008h		;a7a8
L_A7AA:
	ld a,h			;a7aa
	add a,b			;a7ab   ; la x + B
	ld h,a			;a7ac
	ld (0e2a2h),hl		;a7ad   ; guarda donde se cava (y, x) y el byte siguiente (16 bits)
	call 09d55h		;a7b0   ; A = la casilla del mapa de la pantalla en (H, L), sin tocar HL
	cp 002h		;a7b3   ; ladrillo (2)?
	jp nz,L_A60C		;a7b5
	ld a,l			;a7b8   ; y la de debajo
	add a,008h		;a7b9
	ld l,a			;a7bb
	call 09d5bh		;a7bc   ; A = la casilla del mapa de la pantalla (0xE250) en el pixel (x H, y L)
	cp 002h		;a7bf   ; ladrillo (2)?
	jp nz,L_A60C		;a7c1
	ld a,(0e294h)		;a7c4   ; lee hacia que lado mira el personaje (0 izquierda, 1 derecha)
	or a			;a7c7
	ld b,008h		;a7c8   ; a la derecha: 8
	jr nz,L_A7CE		;a7ca
	ld b,0f8h		;a7cc   ; a la izquierda: -8
L_A7CE:
	ld a,(0e284h)		;a7ce   ; lee la x del personaje
	add a,b			;a7d1
	ld (0e284h),a		;a7d2   ; guarda la x del personaje
	jp L_A786		;a7d5
L_A7D8:
	call L_A706		;a7d8   ; cada 8 cuadros, el paso del agujero (tablas 0xA769 y 0xA76F segun el lado)
	ld a,(ix+007h)		;a7db   ; lee el lado de la cosa
	or a			;a7de
	ret z			;a7df
	jp L_A60C		;a7e0
L_A7E3:
	ld a,(ix+000h)		;a7e3   ; A = el estado de la cosa (cifra alta)
	rra			;a7e6
	rra			;a7e7
	rra			;a7e8
	rra			;a7e9
	and 00fh		;a7ea
	ret			;a7ec
L_A7ED:
	call L_A85B		;a7ed   ; coger las cosas de 2 x 2 de esta pantalla que esten a menos de 12 pixeles del personaje
	ld a,(0e243h)		;a7f0   ; lee la pantalla de la fase (desde 1)
	ld c,a			;a7f3
	ld b,010h		;a7f4
	ld hl,0e700h		;a7f6   ; apunta a la tabla de colores al cargar graficos; en la partida, las cosas de 2 x 2 de la fase (16 x 8 bytes)
L_A7F9:
	ld a,(hl)			;a7f9   ; una cosa de 2 x 2 de 0xE700
	and a			;a7fa   ; 0: libre
	jr z,L_A814		;a7fb
	inc l			;a7fd   ; en esta pantalla?
	ld a,(hl)			;a7fe
	cp c			;a7ff
	jr nz,L_A814		;a800
	inc l			;a802   ; a menos de 12 pixeles en y...
	ld a,(hl)			;a803
	sub e			;a804
	add a,00ch		;a805
	cp 018h		;a807
	jr nc,L_A814		;a809
	inc l			;a80b   ; ...y en x
	ld a,(hl)			;a80c
	sub d			;a80d
	add a,00ch		;a80e
	cp 018h		;a810
	jr c,L_A81D		;a812
L_A814:
	ld a,008h		;a814   ; la siguiente (8 bytes)
	add a,l			;a816
	and 0f8h		;a817
	ld l,a			;a819
	djnz L_A7F9		;a81a
	ret			;a81c
L_A81D:
	push hl			;a81d   ; cogida: se borra de la pantalla
	call 09418h		;a81e   ; devuelve el fondo de los bloques de esta pantalla
	call 08e2dh		;a821   ; las cosas de la lista 0xEE50 (por numero): lo que habia debajo se devuelve
	pop hl			;a824
	ld d,(hl)			;a825   ; la x
	dec l			;a826
	ld e,(hl)			;a827   ; la y
	dec l			;a828
	dec l			;a829
	ld (hl),000h		;a82a   ; el tipo a 0: cogida
	ld bc,00202h		;a82c   ; 2 x 2
	call 0537dh		;a82f
	ld hl,0e2f5h		;a832   ; una menos; con la ultima, el sonido 0x0B y el borde parpadea (la salida se abre)
	dec (hl)			;a835
	jr nz,L_A848		;a836
	call 0421ah		;a838   ; pide el sonido 0x0B
	xor a			;a83b   ; sin musica...
	ld (0e216h),a		;a83c
	dec a			;a83f   ; ...y 0xE215 = 0xFF
	ld (0e215h),a		;a840   ; guarda la cuenta para volver a poner la musica
	ld a,010h		;a843
	ld (0e21bh),a		;a845   ; guarda la cuenta del borde que parpadea
L_A848:
	call 04265h		;a848   ; el sonido 0x1A, la salida y 500 puntos
	call 08c14h		;a84b   ; pinta la salida si es de esta pantalla: 4 x 4 caracteres de 0x9059 + 16 x 0xE2F6
	call 08e74h		;a84e   ; las de la lista, al reves: guarda el fondo y pinta la cosa
	call 093e8h		;a851   ; pinta los bloques de esta pantalla
	ld de,00500h		;a854
	call 04c21h		;a857   ; suma DE (BCD) a los puntos 0xE226-0xE228, si el bit 6 de 0xE202 lo deja
	ret			;a85a
L_A85B:
	ld a,(0e282h)		;a85b   ; E = la y del personaje, D = su x
	ld e,a			;a85e
	ld a,(0e284h)		;a85f   ; lee la x del personaje
	ld d,a			;a862
	ret			;a863
L_A864:
	ld a,(0e248h)		;a864   ; coger una cosa de 0xE300 del suelo (si no lleva otra y no esta saliendo)
	or a			;a867
	ret nz			;a868
	ld a,(0e287h)		;a869   ; lee la postura del personaje
	or a			;a86c
	ret nz			;a86d
	ld hl,0ee50h		;a86e   ; apunta a la lista de las cosas de 0xE300 por orden de pintado
L_A871:
	ld a,(hl)			;a871
	or a			;a872   ; 0 acaba
	ret z			;a873
	call 08f97h		;a874   ; IX = la cosa A de 0xE300 (desde 1)
	ld a,(0e243h)		;a877   ; lee la pantalla de la fase (desde 1)
	cp (ix+003h)		;a87a
	jr nz,L_A892		;a87d
	ld a,(ix+000h)		;a87f   ; 0: libre
	and a			;a882
	jr z,L_A892		;a883
	and 0f0h		;a885   ; con estado (cifra alta): no
	jr nz,L_A892		;a887
	push hl			;a889
	push bc			;a88a
	call L_A896		;a88b   ; C si la cosa esta al alcance (en y y en x segun hacia donde mira)
	pop bc			;a88e
	pop hl			;a88f
	jr c,$+83		;a890
L_A892:
	inc hl			;a892
	djnz L_A871		;a893
	ret			;a895
L_A896:
	ld a,(0e282h)		;a896   ; C si la cosa esta al alcance (en y y en x segun hacia donde mira)
	sub (ix+001h)		;a899
	jr nc,L_A8A3		;a89c
	neg		;a89e
	cp 008h		;a8a0
	ret nc			;a8a2
L_A8A3:
	cp 00dh		;a8a3
	ret nc			;a8a5
	ld b,000h		;a8a6
	ld a,(0e284h)		;a8a8   ; el bit 7 de la x del personaje...
	rla			;a8ab
	rl b		;a8ac
	sla b		;a8ae   ; ...x 2
	ld a,(ix+002h)		;a8b0   ; mas el bit 7 de la x de la cosa: 0-3
	rlca			;a8b3
	and 001h		;a8b4
	add a,b			;a8b6
	call 0409eh		;a8b7   ; el despachador de Konami: la tabla va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_A8BA: 4 destinos del despachador p00:409E (call en p03:A8B7, el
;   indice en A): A8C2, A8CF, A8DA, A8C2; lo leen p03:A8B7 (8 bytes)
;   0xa8ba..0xa8c2  (8 bytes)
DATA_tabla_A8BA:
	defw 0a8c2h,0a8cfh,0a8dah,0a8c2h	; a8ba  -> L_A8C2 L_A8CF L_A8DA L_A8C2

; ======================================================================
; CODIGO 0xa8c2..0xaa57  (405 bytes)
; ======================================================================


L_A8C2:
	ld a,(0e284h)		;a8c2   ; lee la x del personaje
	sub (ix+002h)		;a8c5
	jr nc,L_A8CC		;a8c8
	neg		;a8ca
L_A8CC:
	cp 00eh		;a8cc
	ret			;a8ce
L_A8CF:
	ld a,(0e284h)		;a8cf   ; lee la x del personaje
	ld b,a			;a8d2
	ld a,(ix+002h)		;a8d3
	sub b			;a8d6
	cp 00eh		;a8d7
	ret			;a8d9
L_A8DA:
	ld a,(0e284h)		;a8da   ; lee la x del personaje
	sub (ix+002h)		;a8dd
	cp 00eh		;a8e0
	ret			;a8e2
L_A8E3:
	push ix		;a8e3   ; la coge: su tipo a la postura del personaje (0xE287), se marca llevada y el sonido 0x19
	call 09418h		;a8e5   ; devuelve el fondo de los bloques de esta pantalla
	pop ix		;a8e8
	ld a,(ix+000h)		;a8ea
	and 00fh		;a8ed
	ld (0e287h),a		;a8ef   ; guarda la postura del personaje
	or 0f0h		;a8f2
	ld (ix+000h),a		;a8f4
	call 04260h		;a8f7   ; pide el sonido 0x19
	call 08e21h		;a8fa   ; repinta lo que se lleva y lo que se suelta en la pantalla
	call 093e8h		;a8fd   ; pinta los bloques de esta pantalla
	ret			;a900
L_A901:
	ld a,(0e255h)		;a901   ; un enemigo de esta pantalla toca al personaje: muere (salvo con FESTIVAL o ya muerto)
	and a			;a904
	ret nz			;a905
	ld a,(0e298h)		;a906   ; lee la marca de personaje muerto
	or a			;a909
	ret nz			;a90a
	ld ix,0e500h		;a90b   ; apunta a los enemigos (8 x 32 bytes)
	ld b,008h		;a90f
L_A911:
	ld a,(0e243h)		;a911   ; lee la pantalla de la fase (desde 1)
	cp (ix+010h)		;a914   ; compara con la pantalla del enemigo
	jr nz,L_A93B		;a917
	bit 0,(ix+013h)		;a919   ; solo los que matan (bit 0 de IX+13)
	jr z,L_A93B		;a91d
	ld a,(0e282h)		;a91f   ; cerca en y...
	add a,008h		;a922   ; y + 8 - la del enemigo...
	sub (ix+003h)		;a924   ; le resta la y del enemigo
	cp 010h		;a927   ; ...menos de 16
	jr nc,L_A93B		;a929
	ld a,(0e284h)		;a92b   ; ...y en x
	add a,00ah		;a92e   ; x + 0x0A - la del enemigo...
	jr c,L_A93B		;a930
	sub (ix+005h)		;a932   ; le resta la x del enemigo
	jr c,L_A93B		;a935
	cp 014h		;a937   ; ...menos de 0x14: le toca
	jr c,L_A943		;a939
L_A93B:
	ld de,00020h		;a93b
	add ix,de		;a93e
	djnz L_A911		;a940
	ret			;a942
L_A943:
	ld a,005h		;a943   ; el personaje muere (estado 5) con el sonido 0x28
	ld (0e280h),a		;a945   ; guarda el estado del personaje
	call 09018h		;a948   ; el personaje muere (0xE298 = 1)
	jp 042abh		;a94b
L_A94E:
	ld ix,0e300h		;a94e   ; las cosas lanzadas (tipo 1-3 de 0xE300 en vuelo) que dan a un enemigo
	ld b,040h		;a952
L_A954:
	exx			;a954
	ld a,(ix+000h)		;a955   ; lee el estado (cifra alta) y el tipo (cifra baja) de la cosa
	ld c,a			;a958
	and 00fh		;a959   ; los tipos 1-3...
	dec a			;a95b
	cp 003h		;a95c
	jr nc,L_A9AB		;a95e
	ld a,c			;a960   ; ...con estado 2 o mas
	rrca			;a961
	rrca			;a962
	rrca			;a963
	rrca			;a964
	and 00fh		;a965
	cp 002h		;a967
	jr c,L_A9AB		;a969
	ld l,(ix+001h)		;a96b   ; lee la y de la cosa
	ld h,(ix+002h)		;a96e   ; lee la x de la cosa
	ld c,(ix+003h)		;a971   ; lee la pantalla de la cosa
	ld iy,0e500h		;a974   ; apunta a los enemigos (8 x 32 bytes)
	ld b,008h		;a978   ; los 8
L_A97A:
	ld a,(iy+000h)		;a97a   ; cada enemigo que se puede matar (bit 1 de IX+13) en la misma pantalla
	and a			;a97d   ; si existe...
	jr z,L_A9A4		;a97e
	bit 1,(iy+013h)		;a980   ; ...y se le puede matar...
	jr z,L_A9A4		;a984
	ld a,c			;a986   ; ...y esta en la pantalla de la cosa...
	cp (iy+010h)		;a987
	jr nz,L_A9A4		;a98a
	ld a,l			;a98c   ; ...a menos de 12 pixeles en y...
	add a,00ch		;a98d
	sub (iy+003h)		;a98f
	cp 018h		;a992
	jr nc,L_A9A4		;a994
	ld a,(iy+005h)		;a996   ; ...y en x
	sub h			;a999   ; la distancia en x...
	jr nc,L_A99E		;a99a
	neg		;a99c   ; ...sin signo
L_A99E:
	cp 00ch		;a99e
	jr c,L_A9B4		;a9a0
	jr L_A9A4		;a9a2
L_A9A4:
	ld de,00020h		;a9a4
	add iy,de		;a9a7
	djnz L_A97A		;a9a9
L_A9AB:
	exx			;a9ab
	ld de,00008h		;a9ac
	add ix,de		;a9af
	djnz L_A954		;a9b1
	ret			;a9b3
L_A9B4:
	push ix		;a9b4   ; le da: 0xE2E8 = la cosa, el enemigo muere, 100 puntos y el sonido 0x26
	pop hl			;a9b6
	ld (0e2e8h),hl		;a9b7
	push iy		;a9ba
	pop ix		;a9bc
	ld a,001h		;a9be
	ld (0edcdh),a		;a9c0
	call L_A9D0		;a9c3   ; el enemigo herido segun su tipo
	ld de,00100h		;a9c6
	call 04c21h		;a9c9   ; suma DE (BCD) a los puntos 0xE226-0xE228, si el bit 6 de 0xE202 lo deja
	call 042a1h		;a9cc   ; pide el sonido 0x26
	ret			;a9cf
L_A9D0:
	ld a,(ix+000h)		;a9d0   ; el enemigo herido segun su tipo
	cp 004h		;a9d3   ; el de tipo 4 (p03:B640)
	jp z,L_B640		;a9d5
	ld hl,0641bh		;a9d8   ; al acabar, se va (p01:641B)
	push hl			;a9db
	cp 003h		;a9dc   ; el 3 y el 4 no se paran
	ret nc			;a9de
	ld a,(ix+001h)		;a9df   ; el 1 y el 2 solo en sus pasos 0 y 1: vuelve a su sitio (p03:ABEA)
	cp 002h		;a9e2
	ret nc			;a9e4
	jp L_ABEA		;a9e5
L_A9E8:
	ld (0e252h),a		;a9e8   ; crea un enemigo del tipo C (1-4) en (E, D) de la pantalla A, si hay ficha libre en 0xE500
	ld a,c			;a9eb
	cp 005h		;a9ec
	ret nc			;a9ee
	exx			;a9ef
	ld hl,0e500h		;a9f0   ; apunta a los enemigos (8 x 32 bytes)
	ld b,008h		;a9f3
	ld de,00020h		;a9f5
	xor a			;a9f8
L_A9F9:
	cp (hl)			;a9f9   ; una ficha libre (tipo 0)
	jr z,L_AA01		;a9fa
	add hl,de			;a9fc   ; la siguiente (32 bytes)
	djnz L_A9F9		;a9fd
	scf			;a9ff   ; no hay: C
	ret			;aa00
L_AA01:
	push hl			;aa01
	push hl			;aa02
	pop ix		;aa03
	exx			;aa05
	pop hl			;aa06
	call L_AA0C		;aa07   ; la ficha: tipo, y, x, el mapa de su pantalla, la pantalla...
	xor a			;aa0a
	ret			;aa0b
L_AA0C:
	ld (hl),c			;aa0c   ; la ficha: tipo, y, x, el mapa de su pantalla, la pantalla...
	inc l			;aa0d
	ld (hl),000h		;aa0e   ; el paso a 0
	inc l			;aa10
	ld (hl),000h		;aa11   ; la y fina a 0
	inc l			;aa13
	ld (hl),e			;aa14   ; la y
	inc l			;aa15
	ld (hl),000h		;aa16   ; la x fina a 0
	inc l			;aa18
	ld (hl),d			;aa19   ; la x
	inc l			;aa1a
	ld (hl),000h		;aa1b   ; IX+06 a 0
	ld de,00006h		;aa1d   ; a IX+0C
	add hl,de			;aa20
	push hl			;aa21
	ld a,(0e252h)		;aa22
	call L_AA90		;aa25   ; DE = el mapa de la pantalla A
	pop hl			;aa28
	ld (hl),e			;aa29   ; el mapa de su pantalla (IX+0C, IX+0D)
	inc l			;aa2a
	ld (hl),d			;aa2b
	inc l			;aa2c
	ld (hl),000h		;aa2d   ; IX+0E y IX+0F a 0
	inc l			;aa2f
	ld (hl),000h		;aa30
	inc l			;aa32
	ld a,(0e252h)		;aa33
	ld (hl),a			;aa36   ; la pantalla (IX+10)
	inc l			;aa37
	inc l			;aa38
	ld (hl),001h		;aa39   ; IX+12 = 1
	inc l			;aa3b
	ld (hl),000h		;aa3c   ; las marcas (IX+13) a 0
	inc l			;aa3e
	inc l			;aa3f
	ld (hl),b			;aa40   ; el sitio de salida (IX+15)
	inc l			;aa41
	push hl			;aa42
	call L_AA5F		;aa43   ; sus colores y su dibujo
	ld a,(0e252h)		;aa46
	call L_AFE1		;aa49   ; A = la casilla de la rejilla de la pantalla A
	pop hl			;aa4c
	ld (hl),a			;aa4d   ; la casilla de la rejilla (IX+16)
	ld de,0ffeah		;aa4e   ; al principio de la ficha
	add hl,de			;aa51
	ld a,(hl)			;aa52   ; el tipo - 1: su rutina
	dec a			;aa53
	call 0409eh		;aa54   ; el despachador de Konami: la tabla va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_AA57: 4 destinos del despachador p00:409E (call en p03:AA54, el
;   indice en A): AAA7, AAA7, AFEF, B3F9; lo leen p03:AA54 (8 bytes)
;   0xaa57..0xaa5f  (8 bytes)
DATA_tabla_AA57:
	defw 0aaa7h,0aaa7h,0afefh,0b3f9h	; aa57  -> L_AAA7 L_AAA7 L_AFEF L_B3F9

; ======================================================================
; CODIGO 0xaa5f..0xaa84  (37 bytes)
; ======================================================================


L_AA5F:
	ld a,(0f0f4h)		;aa5f   ; sus colores: en MSX2 dos (tabla 0xAA86), en MSX1 uno (0xAA83)
	and a			;aa62   ; MSX1: aparte
	ld a,(ix+000h)		;aa63
	jr z,L_AA79		;aa66
	add a,a			;aa68   ; el tipo x 2
	ld de,0aa86h		;aa69
	call 04099h		;aa6c   ; suma A a DE (DE = DE + A)
	ld a,(de)			;aa6f
	ld (ix+01eh),a		;aa70   ; el color del primer sprite
	inc de			;aa73
	ld a,(de)			;aa74
	ld (ix+01fh),a		;aa75   ; el del segundo
	ret			;aa78
L_AA79:
	ld de,laa83h		;aa79
	call 04099h		;aa7c   ; suma A a DE (DE = DE + A)
	ld a,(de)			;aa7f
	ld (ix+01eh),a		;aa80
L_AA83:
	ret			;aa83

; ----------------------------------------------------------------------
; DATOS resto_AA84: lo apuntan con el banco puesto p03:AA69 (0xAA86); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p03:AA69 (12 bytes)
;   0xaa84..0xaa90  (12 bytes)
DATA_resto_AA84:
	defb 00fh,00ah,00ah,009h,00bh,04ch,00ah,047h,00bh,04ch,00bh,04ch	; aa84  .....L.G.L.L

; ======================================================================
; CODIGO 0xaa90..0xab01  (113 bytes)
; ======================================================================


L_AA90:
	dec a			;aa90   ; DE = el mapa de la pantalla A
	ld h,a			;aa91   ; (A - 1) x 256...
	ld l,000h		;aa92
	ld e,l			;aa94   ; ...menos (A - 1) x 64...
	ld d,h			;aa95
	srl d		;aa96
	rr e		;aa98
	srl d		;aa9a
	rr e		;aa9c
	and a			;aa9e
	sbc hl,de		;aa9f   ; ...= (A - 1) x 0xC0
	ld de,0e900h		;aaa1   ; apunta a el mapa de la fase: 0xC0 bytes por pantalla, 4 casillas por byte
	add hl,de			;aaa4
	ex de,hl			;aaa5
	ret			;aaa6
L_AAA7:
	ld (ix+018h),000h		;aaa7   ; el enemigo sale de su sitio: el dibujo de salida (0x90CB) y espera 0x20
	ld (ix+011h),0ffh		;aaab   ; el dibujo del enemigo (0xFF: no se ve) = 0xFF
	ld hl,090cbh		;aaaf
	call L_AACE		;aab2   ; pinta 3 x 2 caracteres en el sitio del enemigo
	call L_AF9E		;aab5   ; C = el lado hacia el personaje (0 izquierda, 1 derecha), por columnas de la rejilla o por x
	inc c			;aab8
	inc c			;aab9
	ld (ix+00bh),c		;aaba   ; guarda la direccion del enemigo
	ld a,(ix+000h)		;aabd   ; lee el tipo del enemigo (0: libre)
	dec a			;aac0
	call z,L_AB95		;aac1   ; da la vuelta (IX+0B xor 1)
	ld (ix+014h),020h		;aac4   ; la espera del enemigo = 0x20
	ld hl,04279h		;aac8
	jp L_B00F		;aacb
L_AACE:
	ld a,(0e243h)		;aace   ; pinta 3 x 2 caracteres en el sitio del enemigo
	cp (ix+010h)		;aad1   ; compara con la pantalla del enemigo
	ret nz			;aad4
	push ix		;aad5
	push hl			;aad7
	call 09418h		;aad8   ; devuelve el fondo de los bloques de esta pantalla
	call 08e2dh		;aadb   ; las cosas de la lista 0xEE50 (por numero): lo que habia debajo se devuelve
	pop hl			;aade
	pop ix		;aadf
	ld a,(ix+003h)		;aae1
	sub 008h		;aae4
	ld e,a			;aae6
	ld d,(ix+005h)		;aae7
	ld bc,00302h		;aaea
	call 053d6h		;aaed   ; un rectangulo de caracteres de HL: B filas de C, en la tabla de nombres
	push ix		;aaf0
	call 08e74h		;aaf2   ; las de la lista, al reves: guarda el fondo y pinta la cosa
	call 093e8h		;aaf5   ; pinta los bloques de esta pantalla
	pop ix		;aaf8
	ret			;aafa
L_AAFB:
	ld a,(ix+001h)		;aafb   ; un cuadro de un enemigo de tipo 1, por pasos (IX+01)
	call 0409eh		;aafe   ; el despachador de Konami: la tabla va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_AB01: 5 destinos del despachador p00:409E (call en p03:AAFE, el
;   indice en A): ABB0, ABD0, AB0B, AB36, AB75; lo leen p03:AAFE (10 bytes)
;   0xab01..0xab0b  (10 bytes)
DATA_tabla_AB01:
	defw 0abb0h,0abd0h,0ab0bh,0ab36h,0ab75h	; ab01

; ======================================================================
; CODIGO 0xab0b..0xaba4  (153 bytes)
; ======================================================================


L_AB0B:
	call L_AED9		;ab0b   ; paso 2: espera y empieza a andar
	ld a,004h		;ab0e
	jp c,L_ACA7		;ab10
	ld (ix+011h),000h		;ab13   ; el dibujo del enemigo (0xFF: no se ve) = 0x00
	dec (ix+014h)		;ab17   ; baja la espera del enemigo
	ret nz			;ab1a
	ld de,00180h		;ab1b
	call L_B017		;ab1e   ; la velocidad en x
	call L_AB95		;ab21   ; da la vuelta (IX+0B xor 1)
	call L_AEE0		;ab24   ; NC si puede avanzar hacia donde mira
	jp c,L_ABCC		;ab27
	call L_AB95		;ab2a   ; da la vuelta (IX+0B xor 1)
	call L_AEE0		;ab2d   ; NC si puede avanzar hacia donde mira
	jp nc,06412h		;ab30
	jp L_ABCC		;ab33
L_AB36:
	ld (ix+006h),001h		;ab36   ; paso 3: anda
	call L_AC8F		;ab3a   ; el dibujo al andar: segun el lado y cada 4 cuadros
	call L_AED9		;ab3d   ; NC si no tiene suelo
	jr nc,L_AB4A		;ab40
	call L_B5AE		;ab42   ; se centra en la casilla en la direccion en la que va
	ld a,004h		;ab45
	jp L_ACA7		;ab47
L_AB4A:
	call L_AEE0		;ab4a   ; NC si puede avanzar hacia donde mira
	jr nc,L_AB5A		;ab4d
	call L_AD8A		;ab4f   ; A = el borde por el que el enemigo saldria hacia la pantalla del personaje (0 si esta en ella)
	dec a			;ab52
	cp (ix+00bh)		;ab53   ; compara con la direccion del enemigo
	ret nz			;ab56
	jp L_AE21		;ab57
L_AB5A:
	inc (ix+018h)		;ab5a   ; sube los intentos del enemigo
	ld a,(ix+018h)		;ab5d   ; lee los intentos del enemigo
	cp 010h		;ab60
	jp nc,06412h		;ab62
L_AB65:
	call L_B5AE		;ab65   ; se centra en la casilla en la direccion en la que va
	ld (ix+014h),010h		;ab68   ; la espera del enemigo = 0x10
	ld (ix+006h),000h		;ab6c   ; la marca de enemigo en movimiento = 0x00
	ld (ix+001h),002h		;ab70   ; el paso del enemigo = 0x02
	ret			;ab74
L_AB75:
	ld (ix+006h),001h		;ab75   ; paso 4: cae; al llegar al suelo vuelve a andar hacia el otro lado
	call L_AEF5		;ab79   ; C si puede seguir cayendo
	ret c			;ab7c
	call L_B5AE		;ab7d   ; se centra en la casilla en la direccion en la que va
	call L_B2C3		;ab80   ; el sonido 0x14 si esta en esta pantalla
	call L_AB65		;ab83
	ld (ix+006h),000h		;ab86   ; la marca de enemigo en movimiento = 0x00
	ld a,(ix+019h)		;ab8a   ; lee la direccion guardada del enemigo
	xor 001h		;ab8d
	or 002h		;ab8f
	ld (ix+00bh),a		;ab91   ; guarda la direccion del enemigo
	ret			;ab94
L_AB95:
	ld a,(ix+00bh)		;ab95   ; da la vuelta (IX+0B xor 1)
	xor 001h		;ab98
	ld (ix+00bh),a		;ab9a   ; guarda la direccion del enemigo
	ret			;ab9d
L_AB9E:
	ld a,(ix+001h)		;ab9e   ; un cuadro de un enemigo de tipo 2, por pasos (IX+01)
	call 0409eh		;aba1   ; el despachador de Konami: la tabla va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_ABA4: 6 destinos del despachador p00:409E (call en p03:ABA1, el
;   indice en A): ABB0, ABD0, AC06, AC30, ACC9, AD05; lo leen p03:ABA1 (12
;   bytes)
;   0xaba4..0xabb0  (12 bytes)
DATA_tabla_ABA4:
	defw 0abb0h,0abd0h,0ac06h,0ac30h,0acc9h,0ad05h	; aba4

; ======================================================================
; CODIGO 0xabb0..0xae6c  (700 bytes)
; ======================================================================


L_ABB0:
	dec (ix+014h)		;abb0   ; paso 0: espera, pinta su salida (0x90D1), el sonido 0x41 y ya mata (IX+13 = 2)
	ret nz			;abb3
	ld hl,090d1h		;abb4
	call L_AACE		;abb7   ; pinta 3 x 2 caracteres en el sitio del enemigo
	ld hl,0430fh		;abba
	call L_B00F		;abbd   ; si esta en esta pantalla, salta a HL (un sonido)
	ld (ix+013h),002h		;abc0   ; las marcas del enemigo (bit 0 mata, bit 1 se le puede matar) = 0x02
	ld (ix+011h),000h		;abc4   ; el dibujo del enemigo (0xFF: no se ve) = 0x00
	ld (ix+014h),020h		;abc8   ; la espera del enemigo = 0x20
L_ABCC:
	inc (ix+001h)		;abcc   ; el paso siguiente
	ret			;abcf
L_ABD0:
	dec (ix+014h)		;abd0   ; paso 1: espera, borra la salida, ya mata y se le puede matar (IX+13 = 3), el sonido 0x25
	ret nz			;abd3
	call L_ABEA		;abd4   ; borra los 3 x 2 caracteres de la salida y pinta el sitio (0x90C5)
	ld (ix+013h),003h		;abd7   ; las marcas del enemigo (bit 0 mata, bit 1 se le puede matar) = 0x03
	ld (ix+014h),020h		;abdb   ; la espera del enemigo = 0x20
	ld a,(0e243h)		;abdf   ; lee la pantalla de la fase (desde 1)
	cp (ix+010h)		;abe2   ; compara con la pantalla del enemigo
	call z,0429ch		;abe5   ; pide el sonido 0x25
	jr L_ABCC		;abe8
L_ABEA:
	ld a,(0e243h)		;abea   ; borra los 3 x 2 caracteres de la salida y pinta el sitio (0x90C5)
	cp (ix+010h)		;abed   ; compara con la pantalla del enemigo
	ret nz			;abf0
	ld d,(ix+005h)		;abf1   ; lee la x del enemigo
	ld a,(ix+003h)		;abf4   ; lee la y del enemigo
	sub 008h		;abf7
	ld e,a			;abf9
	ld bc,00302h		;abfa
	call 0537dh		;abfd
	ld hl,090c5h		;ac00
	jp L_AACE		;ac03
L_AC06:
	call L_AED9		;ac06   ; paso 2: espera y sale hacia el personaje
	jp c,L_ACA5		;ac09
	ld (ix+011h),000h		;ac0c   ; el dibujo del enemigo (0xFF: no se ve) = 0x00
	dec (ix+014h)		;ac10   ; baja la espera del enemigo
	ret nz			;ac13
	call L_AF8C		;ac14   ; la cuenta IX+0E a cero
	call L_AD25		;ac17   ; mira hacia el personaje
	ld de,00180h		;ac1a
	call L_B017		;ac1d   ; la velocidad en x
	call L_AEE0		;ac20   ; NC si puede avanzar hacia donde mira
	jr c,L_ABCC		;ac23
	call L_AB95		;ac25   ; da la vuelta (IX+0B xor 1)
	call L_AEE0		;ac28   ; NC si puede avanzar hacia donde mira
	jp nc,06412h		;ac2b
	jr L_ABCC		;ac2e
L_AC30:
	ld (ix+006h),001h		;ac30   ; paso 3: anda; si el personaje esta en otra pantalla, va hacia ella
	call L_AC8F		;ac34   ; el dibujo al andar: segun el lado y cada 4 cuadros
	call L_AED9		;ac37   ; NC si no tiene suelo
	jr nc,L_AC41		;ac3a
	call L_B5AE		;ac3c   ; se centra en la casilla en la direccion en la que va
	jr L_ACA5		;ac3f
L_AC41:
	call L_AD8A		;ac41   ; A = el borde por el que el enemigo saldria hacia la pantalla del personaje (0 si esta en ella)
	dec a			;ac44
	cp (ix+00bh)		;ac45   ; compara con la direccion del enemigo
	jp z,L_AE21		;ac48
	call L_AEE0		;ac4b   ; NC si puede avanzar hacia donde mira
	jr c,L_AC61		;ac4e
	call L_B5AE		;ac50   ; se centra en la casilla en la direccion en la que va
	inc (ix+018h)		;ac53   ; sube los intentos del enemigo
	ld a,(ix+018h)		;ac56   ; lee los intentos del enemigo
	cp 010h		;ac59
	jp nc,06412h		;ac5b
	jp L_ACF8		;ac5e
L_AC61:
	call L_AFBA		;ac61   ; en la misma columna de la rejilla: sube o baja segun el personaje
	dec c			;ac64
	ret m			;ac65
	jr z,L_AC70		;ac66
	call L_AEBE		;ac68   ; Z si debajo hay escalera
	ret nz			;ac6b
	ld a,001h		;ac6c
	jr L_AC75		;ac6e
L_AC70:
	call L_AECB		;ac70   ; Z si a su altura hay escalera
	ret nz			;ac73
	xor a			;ac74
L_AC75:
	ld (ix+00bh),a		;ac75   ; guarda la direccion del enemigo
	ld de,00280h		;ac78
	call L_B01E		;ac7b   ; la velocidad en y
	ld de,00000h		;ac7e
	call L_B017		;ac81   ; la velocidad en x
	ld a,(ix+005h)		;ac84   ; lee la x del enemigo
	and 0f8h		;ac87
	ld (ix+005h),a		;ac89   ; guarda la x del enemigo
	jp L_ABCC		;ac8c
L_AC8F:
	ld c,001h		;ac8f   ; el dibujo al andar: segun el lado y cada 4 cuadros
	bit 0,(ix+00bh)		;ac91   ; mira el bit 0 de la direccion del enemigo
	jr z,L_AC99		;ac95
	ld c,003h		;ac97
L_AC99:
	ld a,(0e203h)		;ac99   ; lee la cuenta de cuadros
	and 004h		;ac9c
	jr z,L_ACA1		;ac9e
	inc c			;aca0
L_ACA1:
	ld (ix+011h),c		;aca1   ; guarda el dibujo del enemigo (0xFF: no se ve)
	ret			;aca4
L_ACA5:
	ld a,005h		;aca5   ; cae (paso 5)
L_ACA7:
	ld (ix+001h),a		;aca7   ; pasa al paso A: cae con velocidad 5 en y
	xor a			;acaa
	ld (ix+009h),a		;acab   ; guarda la velocidad en x del enemigo (fina)
	ld (ix+00ah),a		;acae   ; guarda la velocidad en x del enemigo
	ld a,(ix+00bh)		;acb1   ; lee la direccion del enemigo
	ld (ix+019h),a		;acb4   ; guarda la direccion guardada del enemigo
	ld (ix+00bh),001h		;acb7   ; la direccion del enemigo = 0x01
	ld (ix+007h),000h		;acbb   ; la velocidad en y del enemigo (fina) = 0x00
	ld (ix+008h),005h		;acbf   ; la velocidad en y del enemigo = 0x05
L_ACC3:
	ld hl,042bbh		;acc3   ; el sonido 0x2C si esta en esta pantalla
	jp L_B00F		;acc6
L_ACC9:
	ld (ix+006h),001h		;acc9   ; paso: cae hasta el suelo
	ld c,005h		;accd
	call L_AC99		;accf
	call L_AE74		;acd2   ; C si al moverse en vertical choca
	jp c,L_ACEE		;acd5
	call L_AD8A		;acd8   ; A = el borde por el que el enemigo saldria hacia la pantalla del personaje (0 si esta en ella)
	dec a			;acdb
	cp (ix+00bh)		;acdc   ; compara con la direccion del enemigo
	jr z,L_ACE5		;acdf
	call L_AEE0		;ace1   ; NC si puede avanzar hacia donde mira
	ret c			;ace4
L_ACE5:
	ld a,(ix+00bh)		;ace5   ; lee la direccion del enemigo
	xor 001h		;ace8
	ld (ix+00bh),a		;acea   ; guarda la direccion del enemigo
	ret			;aced
L_ACEE:
	call L_B5AE		;acee   ; se centra en la casilla en la direccion en la que va
	xor a			;acf1
	ld (ix+002h),a		;acf2   ; guarda la y del enemigo (fina)
	ld (ix+018h),a		;acf5   ; guarda los intentos del enemigo
L_ACF8:
	ld (ix+014h),010h		;acf8   ; la espera del enemigo = 0x10
	ld (ix+006h),000h		;acfc   ; la marca de enemigo en movimiento = 0x00
	ld (ix+001h),002h		;ad00   ; el paso del enemigo = 0x02
	ret			;ad04
L_AD05:
	ld (ix+006h),001h		;ad05   ; paso: cae; al llegar al suelo, vuelve a andar
	call L_AEF5		;ad09   ; C si puede seguir cayendo
	ret c			;ad0c
	call L_B5AE		;ad0d   ; se centra en la casilla en la direccion en la que va
	call L_B2C3		;ad10   ; el sonido 0x14 si esta en esta pantalla
	call L_ACF8		;ad13
	ld a,(ix+019h)		;ad16   ; lee la direccion guardada del enemigo
	xor 001h		;ad19
	or 003h		;ad1b
	ld (ix+00bh),a		;ad1d   ; guarda la direccion del enemigo
	ld (ix+006h),000h		;ad20   ; la marca de enemigo en movimiento = 0x00
	ret			;ad24
L_AD25:
	call L_AF9E		;ad25   ; mira hacia el personaje
	ld a,c			;ad28
	or 002h		;ad29
	ld (ix+00bh),a		;ad2b   ; guarda la direccion del enemigo
	ret			;ad2e
L_AD2F:
	ld ix,0e500h		;ad2f   ; al entrar en una pantalla, se quitan los enemigos que esten a menos de 24 pixeles del personaje
	call L_A85B		;ad33   ; E = la y del personaje, D = su x
	ld b,008h		;ad36
L_AD38:
	ld a,(ix+000h)		;ad38   ; lee el tipo del enemigo (0: libre)
	and a			;ad3b
	jr z,L_AD67		;ad3c   ; libre: no
	bit 0,(ix+013h)		;ad3e   ; mira el bit 0 de las marcas del enemigo (bit 0 mata, bit 1 se le puede matar)
	jr z,L_AD67		;ad42
	ld a,(0e243h)		;ad44   ; lee la pantalla de la fase (desde 1)
	cp (ix+010h)		;ad47   ; compara con la pantalla del enemigo
	jr nz,L_AD67		;ad4a
	ld a,(ix+003h)		;ad4c   ; a menos de 0x18 en y...
	sub e			;ad4f
	add a,018h		;ad50
	cp 030h		;ad52
	jr nc,L_AD67		;ad54
	ld a,(ix+005h)		;ad56   ; ...y en x
	sub d			;ad59
	add a,018h		;ad5a
	cp 030h		;ad5c
	jr nc,L_AD67		;ad5e
	push de			;ad60
	push bc			;ad61
	call L_AD71		;ad62   ; el enemigo de tipo 4 en los pasos 1 o 4 deja algo (0xB76B); todos se van
	pop bc			;ad65
	pop de			;ad66
L_AD67:
	ex de,hl			;ad67   ; el enemigo siguiente (32 bytes)
	ld de,00020h		;ad68
	add ix,de		;ad6b
	ex de,hl			;ad6d
	djnz L_AD38		;ad6e
	ret			;ad70
L_AD71:
	ld a,(ix+000h)		;ad71   ; el enemigo de tipo 4 en los pasos 1 o 4 deja algo (0xB76B); todos se van
	cp 004h		;ad74
	jp nz,06510h		;ad76
	ld a,(ix+001h)		;ad79   ; lee el paso del enemigo
	cp 004h		;ad7c
	jr z,L_AD84		;ad7e
	dec a			;ad80
	jp nz,06510h		;ad81
L_AD84:
	call L_B76B		;ad84   ; quita del mapa sus cuatro casillas, devolviendo lo que habia
	jp 06510h		;ad87
L_AD8A:
	ld a,(0e243h)		;ad8a   ; A = el borde por el que el enemigo saldria hacia la pantalla del personaje (0 si esta en ella)
	cp (ix+010h)		;ad8d   ; compara con la pantalla del enemigo
	jp z,L_AE1F		;ad90
	call L_A85B		;ad93   ; E = la y del personaje, D = su x
	ld l,(ix+003h)		;ad96   ; lee la y del enemigo
	ld h,(ix+005h)		;ad99   ; lee la x del enemigo
	ld a,(ix+00bh)		;ad9c   ; lee la direccion del enemigo
	ret z			;ad9f
	dec a			;ada0   ; 1: abajo
	jr z,L_ADC3		;ada1
	dec a			;ada3   ; 2: izquierda
	jr z,L_ADDD		;ada4
	dec a			;ada6   ; 3: derecha
	jr z,L_ADF7		;ada7
	ld a,l			;ada9   ; arriba: si el enemigo esta en lo alto (y < 0x18)...
	cp 018h		;adaa
	jr nc,L_AE1F		;adac
	ld a,e			;adae   ; ...y el personaje abajo (y >= 0x98)...
	cp 098h		;adaf
	jr c,L_AE1F		;adb1
	ld a,h			;adb3   ; ...y a menos de 0x18 en x
	sub d			;adb4
	add a,018h		;adb5
	cp 030h		;adb7
	jr nc,L_AE1F		;adb9
	ld a,001h		;adbb   ; el borde 1
	call L_AE11		;adbd   ; Z si la pantalla de ese lado es la del personaje
	jr nz,L_AE1F		;adc0
	ret			;adc2
L_ADC3:
	ld a,l			;adc3   ; por abajo
	cp 098h		;adc4
	jr c,L_AE1F		;adc6
	ld a,e			;adc8
	cp 010h		;adc9
	jr nc,L_AE1F		;adcb
	ld a,h			;adcd
	sub d			;adce
	add a,018h		;adcf
	cp 030h		;add1
	jr nc,L_AE1F		;add3
	ld a,002h		;add5
	call L_AE11		;add7   ; Z si la pantalla de ese lado es la del personaje
	jr nz,L_AE1F		;adda
	ret			;addc
L_ADDD:
	ld a,h			;addd   ; por la izquierda
	cp 018h		;adde
	jr nc,L_AE1F		;ade0
	ld a,d			;ade2
	cp 0d8h		;ade3
	jr c,L_AE1F		;ade5
	ld a,l			;ade7
	sub e			;ade8
	add a,018h		;ade9
	cp 030h		;adeb
	jr nc,L_AE1F		;aded
	ld a,003h		;adef
	call L_AE11		;adf1   ; Z si la pantalla de ese lado es la del personaje
	jr nz,L_AE1F		;adf4
	ret			;adf6
L_ADF7:
	ld a,h			;adf7   ; por la derecha
	cp 0d8h		;adf8
	jr c,L_AE1F		;adfa
	ld a,d			;adfc
	cp 018h		;adfd
	jr nc,L_AE1F		;adff
	ld a,l			;ae01
	sub e			;ae02
	add a,018h		;ae03
	cp 030h		;ae05
	jr nc,L_AE1F		;ae07
	ld a,004h		;ae09
	call L_AE11		;ae0b   ; Z si la pantalla de ese lado es la del personaje
	jr nz,L_AE1F		;ae0e
	ret			;ae10
L_AE11:
	push af			;ae11   ; Z si la pantalla de ese lado es la del personaje
	ld b,(ix+016h)		;ae12   ; lee la casilla de la rejilla del enemigo
	call 05c2fh		;ae15
	ld a,(0e244h)		;ae18   ; lee la casilla de la rejilla de la pantalla
	cp h			;ae1b
	pop bc			;ae1c
	ld a,b			;ae1d
	ret			;ae1e
L_AE1F:
	xor a			;ae1f
	ret			;ae20
L_AE21:
	ld a,(ix+00bh)		;ae21   ; pasa por el borde: su sitio en la pantalla nueva, si alli esta libre
	add a,a			;ae24   ; la direccion x 2: su entrada en la tabla 0xAE6C
	ld hl,0ae6ch		;ae25
	call 04094h		;ae28   ; suma A a HL (HL = HL + A)
	ld c,(hl)			;ae2b   ; C = lo que se suma a la y, B = a la x
	inc hl			;ae2c
	ld b,(hl)			;ae2d
	call L_AF91		;ae2e   ; DE = el mapa del enemigo
	ld a,c			;ae31
	add a,l			;ae32   ; la y nueva
	ld l,a			;ae33
	ld a,b			;ae34
	add a,h			;ae35   ; la x nueva
	ld h,a			;ae36
	call L_AE60		;ae37   ; C si la casilla esta libre
	ret nc			;ae3a
	ld a,008h		;ae3b   ; 8 a la derecha
	add a,h			;ae3d
	ld h,a			;ae3e
	call L_AE60		;ae3f   ; C si la casilla esta libre
	ret nc			;ae42
	ld a,008h		;ae43   ; 8 mas abajo
	add a,l			;ae45
	ld l,a			;ae46
	call L_AE60		;ae47   ; C si la casilla esta libre
	ld a,0f8h		;ae4a   ; 8 a la izquierda
	add a,h			;ae4c
	ld h,a			;ae4d
	call L_AE60		;ae4e   ; C si la casilla esta libre
	ret nc			;ae51
	call L_AF97		;ae52   ; L = la y del enemigo, H = su x
	ld a,c			;ae55
	add a,l			;ae56
	ld (ix+003h),a		;ae57   ; guarda la y del enemigo
	ld a,b			;ae5a
	add a,h			;ae5b
	ld (ix+005h),a		;ae5c   ; guarda la x del enemigo
	ret			;ae5f
L_AE60:
	push de			;ae60   ; C si la casilla esta libre
	push hl			;ae61
	push bc			;ae62
	call 09d5fh		;ae63   ; A = la casilla del mapa de DE en el pixel (H, L): 0 libre, 1 escalera, 2-3 ladrillo
	pop bc			;ae66
	pop hl			;ae67
	pop de			;ae68
	sub 001h		;ae69
	ret			;ae6b

; ----------------------------------------------------------------------
; DATOS resto_AE6C: lo apuntan con el banco puesto p03:AE25 (0xAE6C); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p03:AE25 (8 bytes)
;   0xae6c..0xae74  (8 bytes)
DATA_resto_AE6C:
	defb 010h,000h,0f0h,000h,000h,010h,000h,0f0h	; ae6c  ........

; ======================================================================
; CODIGO 0xae74..0xb02b  (439 bytes)
; ======================================================================


L_AE74:
	ld a,(ix+00bh)		;ae74   ; C si al moverse en vertical choca
	dec a			;ae77
	jr z,L_AEA3		;ae78
L_AE7A:
	call L_AF27		;ae7a   ; el sitio al que iria con su velocidad (C si se sale de la pantalla)
	ccf			;ae7d   ; se sale: NC
	ret nc			;ae7e
	ld a,l			;ae7f   ; la y + 7, a la casilla
	add a,007h		;ae80
	and 0f8h		;ae82
	ld l,a			;ae84
	call L_AEAA		;ae85   ; Z si en el mapa del enemigo la casilla es escalera (1)
	ret z			;ae88
	ld a,008h		;ae89   ; la de debajo
	add a,l			;ae8b
	ld l,a			;ae8c
	call L_AEAA		;ae8d   ; Z si en el mapa del enemigo la casilla es escalera (1)
	ret z			;ae90
	ld a,008h		;ae91   ; la de la derecha
	add a,h			;ae93
	ld h,a			;ae94
	call L_AEAA		;ae95   ; Z si en el mapa del enemigo la casilla es escalera (1)
	ret z			;ae98
	ld a,l			;ae99   ; la de arriba
	sub 008h		;ae9a
	ld l,a			;ae9c
	call L_AEAA		;ae9d   ; Z si en el mapa del enemigo la casilla es escalera (1)
	ret z			;aea0
	scf			;aea1   ; ninguna: C
	ret			;aea2
L_AEA3:
	call L_AEE0		;aea3   ; NC si puede avanzar hacia donde mira
	ccf			;aea6
	ret c			;aea7
	jr L_AE7A		;aea8
L_AEAA:
	ld e,(ix+00ch)		;aeaa   ; Z si en el mapa del enemigo la casilla es escalera (1)
	ld d,(ix+00dh)		;aead   ; lee el mapa de la pantalla del enemigo (alto)
	push hl			;aeb0
	call 09d5fh		;aeb1   ; A = la casilla del mapa de DE en el pixel (H, L): 0 libre, 1 escalera, 2-3 ladrillo
	pop hl			;aeb4
	and a			;aeb5
	dec a			;aeb6
	ret			;aeb7
L_AEB8:
	call L_AECB		;aeb8   ; Z si a su altura hay escalera
	ld c,000h		;aebb
	ret z			;aebd
L_AEBE:
	call L_AF97		;aebe   ; Z si debajo hay escalera
	ld a,010h		;aec1
	add a,l			;aec3
	ld l,a			;aec4
	call L_AECE		;aec5
	ld c,001h		;aec8
	ret			;aeca
L_AECB:
	call L_AF97		;aecb   ; Z si a su altura hay escalera
L_AECE:
	call L_AEAA		;aece   ; Z si en el mapa del enemigo la casilla es escalera (1)
	ret nz			;aed1
	ld a,h			;aed2
	add a,008h		;aed3
	ld h,a			;aed5
	jp L_AEAA		;aed6
L_AED9:
	call L_AF97		;aed9   ; NC si no tiene suelo
	ld c,001h		;aedc
	jr L_AEFC		;aede
L_AEE0:
	ld c,(ix+00bh)		;aee0   ; NC si puede avanzar hacia donde mira
L_AEE3:
	call L_AF27		;aee3   ; el sitio al que iria con su velocidad (C si se sale de la pantalla)
	ret c			;aee6
	ld e,(ix+00ch)		;aee7   ; lee el mapa de la pantalla del enemigo (bajo)
	ld d,(ix+00dh)		;aeea   ; lee el mapa de la pantalla del enemigo (alto)
	push hl			;aeed
	push de			;aeee
	call 09dach		;aeef   ; lo mismo con el mapa de DE
	pop de			;aef2
	pop hl			;aef3
	ret			;aef4
L_AEF5:
	ld c,(ix+00bh)		;aef5   ; C si puede seguir cayendo
	call L_AF27		;aef8   ; el sitio al que iria con su velocidad (C si se sale de la pantalla)
	ret c			;aefb
L_AEFC:
	ld e,(ix+00ch)		;aefc   ; lee el mapa de la pantalla del enemigo (bajo)
	ld d,(ix+00dh)		;aeff   ; lee el mapa de la pantalla del enemigo (alto)
	call 09dd3h		;af02   ; el primer punto de la orilla segun la direccion C (1 abajo, 2 izquierda, 3 derecha, si no arriba)
	call L_AF0C		;af05   ; C si la casilla esta libre
	ret nc			;af08
	call L_AF18		;af09   ; la orilla siguiente: en vertical 8 pixeles a la derecha...
L_AF0C:
	push hl			;af0c   ; C si la casilla esta libre
	push de			;af0d
	push bc			;af0e
	call 09d5fh		;af0f   ; A = la casilla del mapa de DE en el pixel (H, L): 0 libre, 1 escalera, 2-3 ladrillo
	pop bc			;af12
	pop de			;af13
	pop hl			;af14
	sub 001h		;af15
	ret			;af17
L_AF18:
	ld a,c			;af18   ; la orilla siguiente: en vertical 8 pixeles a la derecha...
	cp 002h		;af19
	jr c,L_AF22		;af1b
	ld a,l			;af1d   ; ...en horizontal 8 mas abajo
	add a,008h		;af1e
	ld l,a			;af20
	ret			;af21
L_AF22:
	ld a,h			;af22
	add a,008h		;af23
	ld h,a			;af25
	ret			;af26
L_AF27:
	ld a,(ix+006h)		;af27   ; el sitio al que iria con su velocidad (C si se sale de la pantalla)
	and a			;af2a   ; quieto: su sitio tal cual
	jp z,L_AF97		;af2b
	ld a,c			;af2e   ; segun la direccion C: 1 abajo...
	dec a			;af2f
	jr z,L_AF3B		;af30
	dec a			;af32   ; ...2 izquierda, 3 derecha...
	jr z,L_AF57		;af33
	dec a			;af35
	jr z,L_AF5A		;af36
	xor a			;af38   ; ...si no, arriba
	jr L_AF3D		;af39
L_AF3B:
	ld a,001h		;af3b
L_AF3D:
	ld l,(ix+002h)		;af3d   ; lee la y del enemigo (fina)
	ld h,(ix+003h)		;af40   ; lee la y del enemigo
	ld e,(ix+007h)		;af43   ; lee la velocidad en y del enemigo (fina)
	ld d,(ix+008h)		;af46   ; lee la velocidad en y del enemigo
	and a			;af49
	call z,L_AF7B		;af4a   ; DE = -DE
	add hl,de			;af4d
	ld l,h			;af4e
	ld h,(ix+005h)		;af4f   ; lee la x del enemigo
	ld a,l			;af52
	cp 0c0h		;af53
	ccf			;af55
	ret			;af56
L_AF57:
	xor a			;af57
	jr L_AF5C		;af58
L_AF5A:
	ld a,001h		;af5a
L_AF5C:
	ld l,(ix+004h)		;af5c   ; lee la x del enemigo (fina)
	ld h,(ix+005h)		;af5f   ; lee la x del enemigo
	ld e,(ix+009h)		;af62   ; lee la velocidad en x del enemigo (fina)
	ld b,h			;af65
	ld d,(ix+00ah)		;af66   ; lee la velocidad en x del enemigo
	and a			;af69
	call z,L_AF7B		;af6a   ; DE = -DE
	add hl,de			;af6d
	ld l,(ix+003h)		;af6e   ; lee la y del enemigo
	ld a,h			;af71
	sub b			;af72
	jr nc,L_AF77		;af73
	neg		;af75
L_AF77:
	cp 080h		;af77
	ccf			;af79
	ret			;af7a
L_AF7B:
	ld a,e			;af7b   ; DE = -DE
	cpl			;af7c
	ld e,a			;af7d
	ld a,d			;af7e
	cpl			;af7f
	ld d,a			;af80
	inc de			;af81
	ret			;af82
L_AF83:
	ld a,004h		;af83
L_AF85:
	inc (ix+00eh)		;af85   ; sube la cuenta IX+0E y la compara con A
	cp (ix+00eh)		;af88   ; compara con una cuenta del enemigo
	ret			;af8b
L_AF8C:
	xor a			;af8c   ; la cuenta IX+0E a cero
	ld (ix+00eh),a		;af8d   ; guarda una cuenta del enemigo
	ret			;af90
L_AF91:
	ld e,(ix+00ch)		;af91   ; DE = el mapa del enemigo
	ld d,(ix+00dh)		;af94   ; lee el mapa de la pantalla del enemigo (alto)
L_AF97:
	ld l,(ix+003h)		;af97   ; L = la y del enemigo, H = su x
	ld h,(ix+005h)		;af9a   ; lee la x del enemigo
	ret			;af9d
L_AF9E:
	ld a,(ix+016h)		;af9e   ; C = el lado hacia el personaje (0 izquierda, 1 derecha), por columnas de la rejilla o por x
	and 007h		;afa1   ; la columna de la rejilla del enemigo...
	ld c,a			;afa3
	ld a,(0e244h)		;afa4   ; lee la casilla de la rejilla de la pantalla
	and 007h		;afa7   ; ...y la del personaje
	cp c			;afa9
	ld c,000h		;afaa   ; iguales: por la x
	jr z,L_AFB1		;afac
	ret c			;afae   ; menor: 0, izquierda (C)
	inc c			;afaf   ; mayor: 1, derecha
	ret			;afb0
L_AFB1:
	ld a,(0e284h)		;afb1   ; lee la x del personaje
	cp (ix+005h)		;afb4   ; compara con la x del enemigo
	ret c			;afb7
	inc c			;afb8
	ret			;afb9
L_AFBA:
	ld a,(ix+016h)		;afba   ; C = arriba o abajo hacia el personaje (0 igual, 1 arriba, 2 abajo)
	and 038h		;afbd   ; la fila de la rejilla del enemigo...
	ld c,a			;afbf
	ld a,(0e244h)		;afc0   ; lee la casilla de la rejilla de la pantalla
	and 038h		;afc3   ; ...y la del personaje
	cp c			;afc5
	ld c,000h		;afc6   ; iguales: 0
	jr z,L_AFCE		;afc8
	inc c			;afca   ; menor: 1 (arriba)
	ret c			;afcb
	inc c			;afcc   ; mayor: 2 (abajo)
	ret			;afcd
L_AFCE:
	ld a,(0e282h)		;afce   ; lee la y del personaje
	sub (ix+003h)		;afd1   ; le resta la y del enemigo
	jr c,L_AFDC		;afd4
	cp 010h		;afd6
	ret c			;afd8
	ld c,002h		;afd9
	ret			;afdb
L_AFDC:
	add a,010h		;afdc
	ret c			;afde
	inc c			;afdf
	ret			;afe0
L_AFE1:
	ld hl,0e788h		;afe1   ; A = la casilla de la rejilla de la pantalla A
	ld bc,00040h		;afe4
	cpir		;afe7
	ld a,c			;afe9
	sub 03fh		;afea
	neg		;afec
	ret			;afee
L_AFEF:
	ld (ix+01bh),0ffh		;afef   ; sale un enemigo de tipo 3: mira hacia el personaje
	ld (ix+01dh),080h		;aff3
	call L_AF9E		;aff7   ; C = el lado hacia el personaje (0 izquierda, 1 derecha), por columnas de la rejilla o por x
	ld a,c			;affa
	or 002h		;affb
	ld (ix+00bh),a		;affd   ; guarda la direccion del enemigo
	ld (ix+011h),018h		;b000   ; el dibujo del enemigo (0xFF: no se ve) = 0x18
	ld (ix+018h),0ffh		;b004   ; los intentos del enemigo = 0xFF
	ld (ix+01ch),000h		;b008
	ld hl,04274h		;b00c
L_B00F:
	ld a,(0e243h)		;b00f   ; si esta en esta pantalla, salta a HL (un sonido)
	cp (ix+010h)		;b012   ; compara con la pantalla del enemigo
	ret nz			;b015
	jp (hl)			;b016
L_B017:
	ld (ix+009h),e		;b017   ; la velocidad en x
	ld (ix+00ah),d		;b01a   ; guarda la velocidad en x del enemigo
	ret			;b01d
L_B01E:
	ld (ix+007h),e		;b01e   ; la velocidad en y
	ld (ix+008h),d		;b021   ; guarda la velocidad en y del enemigo
	ret			;b024
L_B025:
	ld a,(ix+001h)		;b025   ; un cuadro de un enemigo de tipo 3, por pasos (IX+01)
	call 0409eh		;b028   ; el despachador de Konami: la tabla va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_B02B: 5 destinos del despachador p00:409E (call en p03:B028, el
;   indice en A): B035, B082, B236, B332, B376; lo leen p03:B028 (10 bytes)
;   0xb02b..0xb035  (10 bytes)
DATA_tabla_B02B:
	defw 0b035h,0b082h,0b236h,0b332h,0b376h	; b02b

; ======================================================================
; CODIGO 0xb035..0xb06f  (58 bytes)
; ======================================================================


L_B035:
	ld a,(0f0f4h)		;b035   ; paso 0: el dibujo de salida (tablas 0xB06F y 0xB079); en MSX2 sus colores 0x0A y 0x47
	ld hl,0b06fh		;b038
	ld de,0b079h		;b03b
	call L_B45B		;b03e   ; el dibujo de salida: cada 8 cuadros el siguiente de la tabla (0xFF acaba)
	jr z,L_B063		;b041
	cp 007h		;b043
	jr nz,L_B05F		;b045
	bit 0,(ix+00bh)		;b047   ; mira el bit 0 de la direccion del enemigo
	jr z,L_B04E		;b04b
	inc a			;b04d
L_B04E:
	ld (ix+011h),a		;b04e   ; guarda el dibujo del enemigo (0xFF: no se ve)
	ld a,(0f0f4h)		;b051   ; lee la marca de MSX2 (1 en el cartucho de MSX2, 0 en el de MSX1)
	and a			;b054
	ret z			;b055
	ld (ix+01eh),00ah		;b056   ; el color del primer sprite del enemigo = 0x0A
	ld (ix+01fh),047h		;b05a   ; el color del segundo sprite del enemigo = 0x47
	ret			;b05e
L_B05F:
	ld (ix+011h),a		;b05f   ; guarda el dibujo del enemigo (0xFF: no se ve)
	ret			;b062
L_B063:
	ld (ix+014h),008h		;b063   ; sale: ya mata y se le puede matar
	ld (ix+013h),003h		;b067   ; las marcas del enemigo (bit 0 mata, bit 1 se le puede matar) = 0x03
L_B06B:
	inc (ix+001h)		;b06b   ; el paso siguiente
	ret			;b06e

; ----------------------------------------------------------------------
; DATOS resto_B06F: lo apuntan con el banco puesto p03:B038 (0xB06F), p03:B03B
;   (0xB079); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p03:B038, p03:B03B (19 bytes)
;   0xb06f..0xb082  (19 bytes)
DATA_resto_B06F:
	defb 018h,019h,018h,019h,018h,019h,01ah,007h,007h,0ffh,018h,019h,018h,019h,018h,019h	; b06f  ................
	defb 007h,007h,0ffh	; b07f

; ======================================================================
; CODIGO 0xb082..0xb310  (654 bytes)
; ======================================================================


L_B082:
	call L_B2CD		;b082   ; paso 1: anda y salta hacia el personaje
	jp z,L_B286		;b085
	ld c,009h		;b088   ; el dibujo 9
	call L_B22A		;b08a   ; el dibujo C (o C + 2 mirando a la derecha)
	dec (ix+014h)		;b08d   ; baja la espera del enemigo
	ret nz			;b090
	ld a,(ix+01dh)		;b091
	cp 002h		;b094
	jr nc,L_B0A4		;b096
	ld a,(ix+018h)		;b098   ; lee los intentos del enemigo
	sub (ix+005h)		;b09b   ; le resta la x del enemigo
	add a,00ch		;b09e
	cp 019h		;b0a0
	jr c,L_B0B7		;b0a2
L_B0A4:
	call L_AFBA		;b0a4   ; C = arriba o abajo hacia el personaje (0 igual, 1 arriba, 2 abajo)
	dec c			;b0a7
	jp z,L_B192		;b0a8
	dec c			;b0ab
	jp z,L_B1CD		;b0ac
	ld a,(ix+01ch)		;b0af
	cp 002h		;b0b2
	jp nc,L_B170		;b0b4
L_B0B7:
	call L_B389		;b0b7   ; salta hacia su lado si puede; si no, da la vuelta; tras 16 intentos se va a otra pantalla
	call L_B100		;b0ba   ; C si puede saltar (no hay techo encima)
	jr c,L_B0DA		;b0bd
	ld a,(ix+00bh)		;b0bf   ; lee la direccion del enemigo
	xor 001h		;b0c2
	or 002h		;b0c4
	ld (ix+00bh),a		;b0c6   ; guarda la direccion del enemigo
	call L_B100		;b0c9   ; C si puede saltar (no hay techo encima)
	jp nc,06412h		;b0cc
	ld a,(ix+01ch)		;b0cf
	cp 010h		;b0d2
	jp nc,06412h		;b0d4
	inc (ix+01ch)		;b0d7
L_B0DA:
	ld de,000f0h		;b0da   ; el salto: velocidad en x 0xF0 y el sonido 0x1F
	call L_B017		;b0dd   ; la velocidad en x
	ld (ix+006h),000h		;b0e0   ; la marca de enemigo en movimiento = 0x00
	ld (ix+014h),011h		;b0e4   ; la espera del enemigo = 0x11
	ld a,(ix+005h)		;b0e8   ; lee la x del enemigo
	ld (ix+018h),a		;b0eb   ; guarda los intentos del enemigo
	ld a,(ix+00bh)		;b0ee   ; lee la direccion del enemigo
	ld (ix+019h),a		;b0f1   ; guarda la direccion guardada del enemigo
	inc (ix+01dh)		;b0f4
	ld hl,0427eh		;b0f7
	call L_B00F		;b0fa   ; si esta en esta pantalla, salta a HL (un sonido)
	jp L_B06B		;b0fd
L_B100:
	call L_AF91		;b100   ; C si puede saltar (no hay techo encima)
	ld a,l			;b103
	sub 008h		;b104
	ld l,a			;b106
	jr c,L_B14B		;b107
	call L_B151		;b109   ; la casilla de delante
	jr c,L_B115		;b10c
	call L_AF91		;b10e   ; DE = el mapa del enemigo
	call L_B151		;b111   ; la casilla de delante
	ret nc			;b114
L_B115:
	call L_AF91		;b115   ; DE = el mapa del enemigo
	ld a,l			;b118   ; 8 mas arriba
	sub 008h		;b119
	ld l,a			;b11b
	bit 0,(ix+00bh)		;b11c   ; mira el bit 0 de la direccion del enemigo
	jr z,L_B12A		;b120
	ld a,h			;b122   ; mirando a la derecha: 8 mas a la derecha
	add a,008h		;b123
	jr c,L_B130		;b125
	ld h,a			;b127
	jr L_B130		;b128
L_B12A:
	ld a,h			;b12a
	sub 008h		;b12b
	jr c,L_B130		;b12d
	ld h,a			;b12f
L_B130:
	ld b,003h		;b130
L_B132:
	push bc			;b132   ; tres casillas de la fila de arriba
	push hl			;b133
	push de			;b134
	call 09d5fh		;b135   ; A = la casilla del mapa de DE en el pixel (H, L): 0 libre, 1 escalera, 2-3 ladrillo
	pop de			;b138
	pop hl			;b139
	pop bc			;b13a
	cp 002h		;b13b   ; una de ladrillo (2 o 3): hay techo
	jr nc,L_B14B		;b13d
	ld a,h			;b13f   ; 8 pixeles a la derecha
	add a,008h		;b140
	ld h,a			;b142
	djnz L_B132		;b143   ; las tres
	ld (ix+01ah),000h		;b145   ; sin techo: IX+1A = 0
	scf			;b149
	ret			;b14a
L_B14B:
	ld (ix+01ah),001h		;b14b
	scf			;b14f
	ret			;b150
L_B151:
	bit 0,(ix+00bh)		;b151   ; la casilla de delante
	jr nz,L_B162		;b155
	ld a,h			;b157
	add a,007h		;b158
	sub 008h		;b15a
	jr nc,L_B160		;b15c
	xor a			;b15e
	ld h,a			;b15f
L_B160:
	jr L_B169		;b160
L_B162:
	ld a,h			;b162
	add a,011h		;b163
	jr nc,L_B169		;b165
	ld a,0f8h		;b167
L_B169:
	ld h,a			;b169
	call 09d5fh		;b16a   ; A = la casilla del mapa de DE en el pixel (H, L): 0 libre, 1 escalera, 2-3 ladrillo
	sub 002h		;b16d
	ret			;b16f
L_B170:
	bit 0,(ix+01ch)		;b170   ; busca escalera arriba o abajo
	jr z,L_B186		;b174
	call L_AF97		;b176   ; L = la y del enemigo, H = su x
	ld a,l			;b179
	add a,010h		;b17a
	ld l,a			;b17c
	call L_B1EC		;b17d   ; Z si hay escalera en las dos casillas (y se centra en ella)
	ld a,001h		;b180
	jr nc,L_B1AA		;b182
	jr L_B192		;b184
L_B186:
	call L_AF97		;b186   ; L = la y del enemigo, H = su x
	call L_B1EC		;b189   ; Z si hay escalera en las dos casillas (y se centra en ella)
	ld a,000h		;b18c
	jr nc,L_B1AA		;b18e
	jr L_B1CD		;b190
L_B192:
	ld a,(ix+01bh)		;b192   ; sube por la escalera
	and a			;b195
	jr z,L_B1A0		;b196
	ld a,(ix+01dh)		;b198
	cp 002h		;b19b
	jp c,L_B0B7		;b19d
L_B1A0:
	call L_AF97		;b1a0   ; L = la y del enemigo, H = su x
	call L_B1EC		;b1a3   ; Z si hay escalera en las dos casillas (y se centra en ella)
	jp c,L_B0B7		;b1a6
	xor a			;b1a9
L_B1AA:
	ld (ix+00bh),a		;b1aa   ; a la escalera: paso 3, velocidad en y 0x100
	ld (ix+01bh),a		;b1ad
	ld (ix+01dh),000h		;b1b0
	ld (ix+006h),001h		;b1b4   ; la marca de enemigo en movimiento = 0x01
	ld (ix+01ch),000h		;b1b8
	ld de,00000h		;b1bc
	call L_B017		;b1bf   ; la velocidad en x
	ld de,00100h		;b1c2
	call L_B01E		;b1c5   ; la velocidad en y
	ld (ix+001h),003h		;b1c8   ; el paso del enemigo = 0x03
	ret			;b1cc
L_B1CD:
	ld a,(ix+01bh)		;b1cd   ; baja por la escalera
	dec a			;b1d0
	jr z,L_B1DB		;b1d1
	ld a,(ix+01dh)		;b1d3
	cp 002h		;b1d6
	jp c,L_B0B7		;b1d8
L_B1DB:
	call L_AF97		;b1db   ; L = la y del enemigo, H = su x
	ld a,l			;b1de
	add a,010h		;b1df
	ld l,a			;b1e1
	call L_B1EC		;b1e2   ; Z si hay escalera en las dos casillas (y se centra en ella)
	jp c,L_B0B7		;b1e5
	ld a,001h		;b1e8
	jr L_B1AA		;b1ea
L_B1EC:
	call L_AEAA		;b1ec   ; Z si hay escalera en las dos casillas (y se centra en ella)
	ld c,000h		;b1ef
	jr z,L_B1F4		;b1f1
	inc c			;b1f3
L_B1F4:
	ld a,h			;b1f4
	add a,008h		;b1f5
	ld h,a			;b1f7
	push bc			;b1f8
	call L_AEAA		;b1f9   ; Z si en el mapa del enemigo la casilla es escalera (1)
	pop bc			;b1fc
	jr z,L_B201		;b1fd
	set 1,c		;b1ff
L_B201:
	ld a,c			;b201   ; C: las dos casillas son escalera (bit 0 la de la izquierda, bit 1 la de la derecha)
	and a			;b202
	jr z,L_B21F		;b203   ; ninguna: se queda donde esta
	cp 003h		;b205   ; las dos: C
	scf			;b207
	ret z			;b208
	dec a			;b209   ; solo la izquierda: se corre 8 a la izquierda si esta casi en la casilla
	jr z,L_B217		;b20a
	ld a,h			;b20c   ; la x en la casilla: 7?
	and 007h		;b20d
	cp 007h		;b20f
	ccf			;b211
	ret c			;b212
	ld c,0f8h		;b213   ; si no: 8 a la izquierda
	jr L_B21F		;b215
L_B217:
	ld a,h			;b217   ; solo la derecha: 8 a la derecha
	and 007h		;b218
	cp 001h		;b21a
	ret c			;b21c
	ld c,008h		;b21d
L_B21F:
	ld a,(ix+005h)		;b21f   ; la x se mueve C y se centra en la casilla
	add a,c			;b222
	and 0f8h		;b223
	ld (ix+005h),a		;b225   ; guarda la x del enemigo
	xor a			;b228
	ret			;b229
L_B22A:
	bit 0,(ix+00bh)		;b22a   ; el dibujo C (o C + 2 mirando a la derecha)
	jr z,L_B232		;b22e
	inc c			;b230
	inc c			;b231
L_B232:
	ld (ix+011h),c		;b232   ; guarda el dibujo del enemigo (0xFF: no se ve)
	ret			;b235
L_B236:
	call L_AD8A		;b236   ; paso 2: en el aire
	dec a			;b239   ; el borde - 1, contra la direccion
	cp (ix+00bh)		;b23a   ; compara con la direccion del enemigo
	ld (ix+006h),000h		;b23d   ; la marca de enemigo en movimiento = 0x00
	ret z			;b241
	ld (ix+006h),001h		;b242   ; la marca de enemigo en movimiento = 0x01
	ld c,00ah		;b246   ; el dibujo 0x0A
	call L_B22A		;b248   ; el dibujo C (o C + 2 mirando a la derecha)
	ld a,(ix+014h)		;b24b   ; lee la espera del enemigo
	and a			;b24e
	jr z,L_B286		;b24f   ; se acaba la espera: aparte
	dec (ix+014h)		;b251   ; baja la espera del enemigo
	ld de,000f0h		;b254   ; 0xF0
	call L_B017		;b257   ; la velocidad en x
	call L_B3C9		;b25a   ; C si delante hay ladrillo
	call nc,L_B30A		;b25d   ; sin velocidad en x
	ld a,(ix+014h)		;b260   ; lee la espera del enemigo
	cp 008h		;b263   ; por debajo de 8
	jr nc,L_B26C		;b265
	call L_B2D0		;b267   ; lo mismo, a la altura del paso del salto
	jr nz,L_B2AA		;b26a
L_B26C:
	ld a,(ix+014h)		;b26c   ; la altura del salto de la tabla 0xB310 o 0xB321 (segun haya techo)
	bit 0,(ix+01ah)		;b26f
	ld hl,0b310h		;b273
	jr z,L_B27B		;b276
	ld hl,0b321h		;b278
L_B27B:
	call 04094h		;b27b   ; suma A a HL (HL = HL + A)
	ld a,(hl)			;b27e
	add a,(ix+003h)		;b27f   ; le suma la y del enemigo
	ld (ix+003h),a		;b282   ; guarda la y del enemigo
	ret			;b285
L_B286:
	ld (ix+014h),000h		;b286   ; al acabar el salto: si no hay suelo, cae (paso 4)
	ld (ix+006h),001h		;b28a   ; la marca de enemigo en movimiento = 0x01
	call L_B2D0		;b28e   ; lo mismo, a la altura del paso del salto
	jr nz,L_B2AA		;b291
	ld de,00500h		;b293
	call L_B01E		;b296   ; la velocidad en y
	ld de,00000h		;b299
	call L_B017		;b29c   ; la velocidad en x
	ld (ix+00bh),001h		;b29f   ; la direccion del enemigo = 0x01
	ld (ix+001h),004h		;b2a3   ; el paso del enemigo = 0x04
	jp L_ACC3		;b2a7
L_B2AA:
	call L_B30A		;b2aa   ; en el suelo: se centra en la fila y vuelve a andar (paso 1)
	ld (ix+006h),000h		;b2ad   ; la marca de enemigo en movimiento = 0x00
	ld (ix+014h),008h		;b2b1   ; la espera del enemigo = 0x08
	ld a,(ix+003h)		;b2b5   ; lee la y del enemigo
	add a,007h		;b2b8
	and 0f8h		;b2ba
	ld (ix+003h),a		;b2bc   ; guarda la y del enemigo
	ld (ix+001h),001h		;b2bf   ; el paso del enemigo = 0x01
L_B2C3:
	ld a,(0e243h)		;b2c3   ; el sonido 0x14 si esta en esta pantalla
	cp (ix+010h)		;b2c6   ; compara con la pantalla del enemigo
	jp z,04247h		;b2c9
	ret			;b2cc
L_B2CD:
	xor a			;b2cd   ; Z si hay suelo debajo
	jr L_B2D3		;b2ce
L_B2D0:
	call L_B3EE		;b2d0   ; lo mismo, a la altura del paso del salto
L_B2D3:
	call L_AF91		;b2d3   ; DE = el mapa del enemigo
	add a,l			;b2d6
	add a,010h		;b2d7
	cp 0b8h		;b2d9
	jr c,L_B2DF		;b2db
	ld a,0b8h		;b2dd
L_B2DF:
	ld l,a			;b2df
	ld a,h			;b2e0
	add a,004h		;b2e1
	ld h,a			;b2e3
	call L_B2EC		;b2e4   ; Z si la casilla no es suelo: libre, o escalera con otra encima
	ret nz			;b2e7
	ld a,h			;b2e8
	add a,008h		;b2e9
	ld h,a			;b2eb
L_B2EC:
	push hl			;b2ec   ; Z si la casilla no es suelo: libre, o escalera con otra encima
	push de			;b2ed
	call 09d5fh		;b2ee   ; A = la casilla del mapa de DE en el pixel (H, L): 0 libre, 1 escalera, 2-3 ladrillo
	pop de			;b2f1
	pop hl			;b2f2
	and a			;b2f3   ; libre: Z
	ret z			;b2f4
	dec a			;b2f5   ; ladrillo: NZ
	ret nz			;b2f6
	push hl			;b2f7
	push de			;b2f8
	ld a,l			;b2f9   ; escalera: la de arriba
	sub 008h		;b2fa
	ld l,a			;b2fc
	call 09d5fh		;b2fd   ; A = la casilla del mapa de DE en el pixel (H, L): 0 libre, 1 escalera, 2-3 ladrillo
	pop de			;b300
	pop hl			;b301
	dec a			;b302   ; encima otra escalera: Z
	jr nz,L_B307		;b303
	xor a			;b305
	ret			;b306
L_B307:
	or 0ffh		;b307
	ret			;b309
L_B30A:
	ld de,00000h		;b30a   ; sin velocidad en x
	jp L_B017		;b30d

; ----------------------------------------------------------------------
; DATOS resto_B310: lo apuntan con el banco puesto p03:B273 (0xB310), p03:B3F1
;   (0xB310), p03:B278 (0xB321); el tamano es lo que hay hasta lo siguiente,
;   no sale de recorrerlo; lo leen p03:B273, p03:B3F1, p03:B278 (34 bytes)
;   0xb310..0xb332  (34 bytes)
DATA_resto_B310:
	defb 005h,005h,004h,003h,002h,002h,001h,001h,000h,000h,0ffh,0ffh,0feh,0feh,0fdh,0fch	; b310  ................
	defb 0fbh,005h,004h,003h,002h,002h,001h,001h,001h,000h,000h,0ffh,0ffh,0ffh,0feh,0feh	; b320  ................
	defb 0fdh,0fch	; b330

; ======================================================================
; CODIGO 0xb332..0xb40f  (221 bytes)
; ======================================================================


L_B332:
	call L_AD8A		;b332   ; paso: cae; si se puede, avanza hacia donde mira
	dec a			;b335
	cp (ix+00bh)		;b336   ; compara con la direccion del enemigo
	ld (ix+006h),000h		;b339   ; la marca de enemigo en movimiento = 0x00
	ret z			;b33d
	ld (ix+006h),001h		;b33e   ; la marca de enemigo en movimiento = 0x01
	ld c,00dh		;b342
	call L_AC99		;b344
	call L_AE74		;b347   ; C si al moverse en vertical choca
	jr c,L_B359		;b34a
	call L_AEE0		;b34c   ; NC si puede avanzar hacia donde mira
	ret c			;b34f
	ld a,(ix+00bh)		;b350   ; lee la direccion del enemigo
	xor 001h		;b353
	ld (ix+00bh),a		;b355   ; guarda la direccion del enemigo
	ret			;b358
L_B359:
	call L_B5AE		;b359   ; se centra en la casilla en la direccion en la que va
	ld de,00000h		;b35c
	call L_B01E		;b35f   ; la velocidad en y
	call L_B017		;b362   ; la velocidad en x
	ld (ix+006h),000h		;b365   ; la marca de enemigo en movimiento = 0x00
	ld (ix+014h),008h		;b369   ; la espera del enemigo = 0x08
	ld (ix+018h),0ffh		;b36d   ; los intentos del enemigo = 0xFF
	ld (ix+001h),001h		;b371   ; el paso del enemigo = 0x01
	ret			;b375
L_B376:
	call L_B2D0		;b376   ; en el aire: si toca suelo, aterriza
	ret z			;b379
	ld de,00000h		;b37a
	call L_B01E		;b37d   ; la velocidad en y
	ld a,(ix+019h)		;b380   ; lee la direccion guardada del enemigo
	ld (ix+00bh),a		;b383   ; guarda la direccion del enemigo
	jp L_B2AA		;b386
L_B389:
	set 1,(ix+00bh)		;b389   ; hacia donde salta: si esta debajo del personaje, al azar (0xE203); si no, hacia el
	ld a,(ix+018h)		;b38d   ; lee los intentos del enemigo
	cp 0ffh		;b390
	jr z,L_B3A5		;b392
	cp (ix+005h)		;b394   ; compara con la x del enemigo
	ret nz			;b397
	ld a,(ix+00bh)		;b398   ; lee la direccion del enemigo
	xor 001h		;b39b
	or 002h		;b39d
	ld (ix+00bh),a		;b39f   ; guarda la direccion del enemigo
	jp L_AF8C		;b3a2
L_B3A5:
	ld a,(0e284h)		;b3a5   ; lee la x del personaje
	sub (ix+005h)		;b3a8   ; le resta la x del enemigo
	add a,002h		;b3ab
	cp 004h		;b3ad
	jr nc,L_B3BF		;b3af
	ld a,(0e203h)		;b3b1   ; lee la cuenta de cuadros
	ld c,002h		;b3b4
	and 080h		;b3b6
	jr z,L_B3BB		;b3b8
	inc c			;b3ba
L_B3BB:
	ld (ix+00bh),c		;b3bb   ; guarda la direccion del enemigo
	ret			;b3be
L_B3BF:
	call L_AF9E		;b3bf   ; C = el lado hacia el personaje (0 izquierda, 1 derecha), por columnas de la rejilla o por x
	ld a,c			;b3c2
	or 002h		;b3c3
	ld (ix+00bh),a		;b3c5   ; guarda la direccion del enemigo
	ret			;b3c8
L_B3C9:
	ld c,(ix+00bh)		;b3c9   ; C si delante hay ladrillo
	call L_AF27		;b3cc   ; el sitio al que iria con su velocidad (C si se sale de la pantalla)
	ret c			;b3cf
	call L_B3EE		;b3d0   ; A = el paso del salto (tabla 0xB310)
	add a,l			;b3d3   ; la y + el paso del salto + 0x0F
	add a,00fh		;b3d4
	ld l,a			;b3d6
	ld e,(ix+00ch)		;b3d7   ; lee el mapa de la pantalla del enemigo (bajo)
	ld d,(ix+00dh)		;b3da   ; lee el mapa de la pantalla del enemigo (alto)
	bit 0,(ix+00bh)		;b3dd   ; mira el bit 0 de la direccion del enemigo
	jr z,L_B3E8		;b3e1
	ld a,010h		;b3e3   ; mirando a la derecha: x + 16
	add a,h			;b3e5
	ld h,a			;b3e6
	ret c			;b3e7
L_B3E8:
	call 09d5fh		;b3e8   ; A = la casilla del mapa de DE en el pixel (H, L): 0 libre, 1 escalera, 2-3 ladrillo
	sub 002h		;b3eb
	ret			;b3ed
L_B3EE:
	ld a,(ix+014h)		;b3ee   ; A = el paso del salto (tabla 0xB310)
	ld de,0b310h		;b3f1
	call 04099h		;b3f4   ; suma A a DE (DE = DE + A)
	ld a,(de)			;b3f7
	ret			;b3f8
L_B3F9:
	xor a			;b3f9   ; sale un enemigo de tipo 4: el sonido 0x1D
	ld (ix+014h),a		;b3fa   ; guarda la espera del enemigo
	ld (ix+01ch),a		;b3fd
	ld (ix+013h),a		;b400   ; guarda las marcas del enemigo (bit 0 mata, bit 1 se le puede matar)
	ld hl,04274h		;b403
	jp L_B00F		;b406
L_B409:
	ld a,(ix+001h)		;b409   ; un cuadro de un enemigo de tipo 4, por pasos (IX+01)
	call 0409eh		;b40c   ; el despachador de Konami: la tabla va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_B40F: 6 destinos del despachador p00:409E (call en p03:B40C, el
;   indice en A): B41B, B474, B4CF, B5FC, B667, B689; lo leen p03:B40C (12
;   bytes)
;   0xb40f..0xb41b  (12 bytes)
DATA_tabla_B40F:
	defw 0b41bh,0b474h,0b4cfh,0b5fch,0b667h,0b689h	; b40f

; ======================================================================
; CODIGO 0xb41b..0xb42a  (15 bytes)
; ======================================================================


L_B41B:
	ld hl,0b42ah		;b41b   ; paso 0: el dibujo de salida (tablas 0xB42A y 0xB431)
	ld de,0b431h		;b41e
	call L_B45B		;b421   ; el dibujo de salida: cada 8 cuadros el siguiente de la tabla (0xFF acaba)
	jr z,$+20		;b424
	ld (ix+011h),a		;b426   ; guarda el dibujo del enemigo (0xFF: no se ve)
	ret			;b429

; ----------------------------------------------------------------------
; DATOS resto_B42A: lo apuntan con el banco puesto p03:B41B (0xB42A), p03:B41E
;   (0xB431); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p03:B41B, p03:B41E (14 bytes)
;   0xb42a..0xb438  (14 bytes)
DATA_resto_B42A:
	defb 01bh,01bh,01ch,01ch,01dh,01dh,0ffh,018h,019h,018h,019h,018h,019h,0ffh	; b42a  ..............

; ======================================================================
; CODIGO 0xb438..0xb6a1  (617 bytes)
; ======================================================================


L_B438:
	ld (ix+013h),003h		;b438   ; sale: mata y se le puede matar, espera 0x3C; en MSX2 sus colores; se marca en el mapa
	ld (ix+014h),03ch		;b43c   ; la espera del enemigo = 0x3C
	ld a,(0f0f4h)		;b440   ; lee la marca de MSX2 (1 en el cartucho de MSX2, 0 en el de MSX1)
	and a			;b443
	jr z,L_B457		;b444
	ld (ix+01eh),007h		;b446   ; el color del primer sprite del enemigo = 0x07
	ld (ix+01fh),049h		;b44a   ; el color del segundo sprite del enemigo = 0x49
	call L_B71D		;b44e
	call L_B7E9		;b451   ; C si al marcarse piso algo que no estaba libre
	jp c,L_B7FA		;b454
L_B457:
	inc (ix+001h)		;b457   ; sube el paso del enemigo
	ret			;b45a
L_B45B:
	ld a,(0f0f4h)		;b45b   ; el dibujo de salida: cada 8 cuadros el siguiente de la tabla (0xFF acaba)
	and a			;b45e
	jr z,L_B462		;b45f
	ex de,hl			;b461
L_B462:
	inc (ix+014h)		;b462   ; sube la espera del enemigo
	ld a,(ix+014h)		;b465   ; lee la espera del enemigo
	rra			;b468
	rra			;b469
	rra			;b46a
	and 01fh		;b46b
	call 04094h		;b46d   ; suma A a HL (HL = HL + A)
	ld a,(hl)			;b470
	cp 0ffh		;b471
	ret			;b473
L_B474:
	ld c,001h		;b474   ; paso: quieto; si cae, deja de estar en el mapa
	call L_AEE3		;b476
	jr nc,L_B481		;b479
	call L_B76B		;b47b   ; quita del mapa sus cuatro casillas, devolviendo lo que habia
	jp L_B5D1		;b47e
L_B481:
	call L_B6D1		;b481   ; parpadea mientras espera (dibujos 0x0F y 0x10)
	dec (ix+014h)		;b484   ; baja la espera del enemigo
	jr z,L_B49C		;b487
	ld (ix+013h),003h		;b489   ; las marcas del enemigo (bit 0 mata, bit 1 se le puede matar) = 0x03
	ld a,(ix+014h)		;b48d   ; lee la espera del enemigo
	and 010h		;b490
	ld c,00fh		;b492
	jr z,L_B498		;b494
	ld c,010h		;b496
L_B498:
	ld (ix+011h),c		;b498   ; guarda el dibujo del enemigo (0xFF: no se ve)
	ret			;b49b
L_B49C:
	call L_B76B		;b49c   ; al acabar, tres veces: va hacia el personaje
	ld a,003h		;b49f
	call L_AF85		;b4a1   ; sube la cuenta IX+0E y la compara con A
	jp c,06412h		;b4a4
	call L_AF9E		;b4a7   ; C = el lado hacia el personaje (0 izquierda, 1 derecha), por columnas de la rejilla o por x
	ld a,c			;b4aa
	or 002h		;b4ab
	ld (ix+00bh),a		;b4ad   ; guarda la direccion del enemigo
	call L_AEE0		;b4b0   ; NC si puede avanzar hacia donde mira
	jr c,L_B4C3		;b4b3
	ld a,(ix+00bh)		;b4b5   ; lee la direccion del enemigo
	xor 001h		;b4b8
	ld (ix+00bh),a		;b4ba   ; guarda la direccion del enemigo
	call L_AEE0		;b4bd   ; NC si puede avanzar hacia donde mira
	jp nc,06412h		;b4c0
L_B4C3:
	ld de,00200h		;b4c3   ; se mueve a velocidad 2
	call L_B017		;b4c6   ; la velocidad en x
	ld (ix+006h),001h		;b4c9   ; la marca de enemigo en movimiento = 0x01
	jr L_B457		;b4cd
L_B4CF:
	call L_AD8A		;b4cf   ; paso: anda; a otra pantalla si el personaje esta alli
	dec a			;b4d2
	cp (ix+00bh)		;b4d3   ; compara con la direccion del enemigo
	jp z,L_AE21		;b4d6
	dec (ix+014h)		;b4d9   ; baja la espera del enemigo
	call L_B5EF		;b4dc   ; el dibujo al andar (0x11-0x14)
	ld a,(ix+005h)		;b4df   ; lee la x del enemigo
	and 007h		;b4e2
	cp 003h		;b4e4
	jr nc,L_B4F3		;b4e6
	call L_AF91		;b4e8   ; DE = el mapa del enemigo
	ld c,001h		;b4eb
	call 09dach		;b4ed   ; lo mismo con el mapa de DE
	jp c,L_B5D1		;b4f0
L_B4F3:
	call L_AEE0		;b4f3   ; choca con otro de su tipo o con pared: se para
	jr nc,L_B52C		;b4f6
	call L_B55A		;b4f8   ; C si choca con otro enemigo de tipo 4 de su pantalla
	ret nc			;b4fb
	ld a,(ix+00bh)		;b4fc   ; lee la direccion del enemigo
	cp 002h		;b4ff
	ld a,(ix+005h)		;b501   ; lee la x del enemigo
	jr nz,L_B508		;b504
	add a,007h		;b506
L_B508:
	and 0f8h		;b508
	ld (ix+005h),a		;b50a   ; guarda la x del enemigo
	ld a,(iy+006h)		;b50d   ; el otro enemigo (IY) tambien se centra si se mueve
	and a			;b510
	jr z,L_B526		;b511
	ld a,(iy+00bh)		;b513   ; hacia el lado
	cp 002h		;b516
	jr c,L_B526		;b518
	ld a,(iy+005h)		;b51a
	jr nz,L_B521		;b51d
	add a,007h		;b51f
L_B521:
	and 0f8h		;b521
	ld (iy+005h),a		;b523
L_B526:
	call L_B6B3		;b526   ; se marca en el mapa; si choca con algo, se va
	jp L_B53A		;b529
L_B52C:
	call L_B5AE		;b52c   ; se centra en la casilla en la direccion en la que va
	ld c,001h		;b52f
	call 09dach		;b531   ; lo mismo con el mapa de DE
	jp c,L_B5D1		;b534
	call L_B6B3		;b537   ; se marca en el mapa; si choca con algo, se va
L_B53A:
	ld a,(0e243h)		;b53a   ; el sonido 0x24 si esta en esta pantalla
	cp (ix+010h)		;b53d   ; compara con la pantalla del enemigo
	ret nz			;b540
	jp 04297h		;b541
L_B544:
	ld (ix+006h),000h		;b544   ; no la llama nadie: el enemigo quieto (IX+06 = 0, velocidad 0), espera 0x3C y paso 1
	ld de,00000h		;b548
	call L_B017		;b54b   ; la velocidad en x
	call L_B01E		;b54e   ; la velocidad en y
	ld (ix+014h),03ch		;b551   ; la espera del enemigo = 0x3C
	ld (ix+001h),001h		;b555   ; el paso del enemigo = 0x01
	ret			;b559
L_B55A:
	ld l,(ix+003h)		;b55a   ; C si choca con otro enemigo de tipo 4 de su pantalla
	ld h,(ix+005h)		;b55d   ; lee la x del enemigo
	call L_AF27		;b560   ; el sitio al que iria con su velocidad (C si se sale de la pantalla)
	ccf			;b563
	ret nc			;b564
	ld iy,0e500h		;b565   ; apunta a los enemigos (8 x 32 bytes)
	ld b,008h		;b569
	ld de,00020h		;b56b
L_B56E:
	ld a,(iy+000h)		;b56e
	cp 004h		;b571   ; solo los de tipo 4
	jr nz,L_B599		;b573
	ld a,(ix+015h)		;b575   ; lee el sitio de salida del enemigo (0-7)
	cp (iy+015h)		;b578   ; de otro sitio de salida...
	jr z,L_B599		;b57b
	ld a,(ix+010h)		;b57d   ; lee la pantalla del enemigo
	cp (iy+010h)		;b580   ; ...en la misma pantalla...
	jr nz,L_B599		;b583
	ld a,l			;b585   ; ...a menos de 0x0F en y...
	sub (iy+003h)		;b586
	add a,00fh		;b589
	cp 01eh		;b58b
	jr nc,L_B599		;b58d
	ld a,h			;b58f   ; ...y en x
	sub (iy+005h)		;b590
	add a,00fh		;b593
	cp 01eh		;b595
	jr c,L_B59F		;b597
L_B599:
	add iy,de		;b599
	djnz L_B56E		;b59b
	xor a			;b59d
	ret			;b59e
L_B59F:
	ld a,(iy+006h)		;b59f
	and a			;b5a2
	jr z,L_B5AC		;b5a3
	ld a,(ix+00bh)		;b5a5   ; lee la direccion del enemigo
	cp (iy+00bh)		;b5a8
	ret z			;b5ab
L_B5AC:
	scf			;b5ac
	ret			;b5ad
L_B5AE:
	ld a,(ix+00bh)		;b5ae   ; se centra en la casilla en la direccion en la que va
	cp 002h		;b5b1
	jr c,L_B5C2		;b5b3
	ld a,(ix+005h)		;b5b5   ; lee la x del enemigo
	jr z,L_B5BC		;b5b8
	add a,007h		;b5ba
L_B5BC:
	and 0f8h		;b5bc
	ld (ix+005h),a		;b5be   ; guarda la x del enemigo
	ret			;b5c1
L_B5C2:
	and a			;b5c2
	ld b,a			;b5c3
	ld a,(ix+003h)		;b5c4   ; lee la y del enemigo
	jr z,L_B5CB		;b5c7
	add a,007h		;b5c9
L_B5CB:
	and 0f8h		;b5cb
	ld (ix+003h),a		;b5cd   ; guarda la y del enemigo
	ret			;b5d0
L_B5D1:
	call L_AF8C		;b5d1   ; cae: paso 3, velocidad en y 5, el sonido 0x2C
	ld (ix+00bh),001h		;b5d4   ; la direccion del enemigo = 0x01
	ld de,00500h		;b5d8
	call L_B01E		;b5db   ; la velocidad en y
	ld de,00000h		;b5de
	call L_B017		;b5e1   ; la velocidad en x
	ld (ix+01ch),000h		;b5e4
	ld (ix+001h),003h		;b5e8   ; el paso del enemigo = 0x03
	jp L_ACC3		;b5ec
L_B5EF:
	ld a,(ix+014h)		;b5ef   ; el dibujo al andar (0x11-0x14)
	rra			;b5f2
	rra			;b5f3
	and 003h		;b5f4
	add a,011h		;b5f6
	ld (ix+011h),a		;b5f8   ; guarda el dibujo del enemigo (0xFF: no se ve)
	ret			;b5fb
L_B5FC:
	inc (ix+01ch)		;b5fc   ; paso: anda hasta chocar
	jr nz,L_B604		;b5ff
	dec (ix+01ch)		;b601
L_B604:
	ld (ix+006h),001h		;b604   ; la marca de enemigo en movimiento = 0x01
	call L_B5EF		;b608   ; el dibujo al andar (0x11-0x14)
	call L_AEE0		;b60b   ; NC si puede avanzar hacia donde mira
	jr nc,L_B623		;b60e
	call L_B55A		;b610   ; C si choca con otro enemigo de tipo 4 de su pantalla
	ret nc			;b613
	call L_B5AE		;b614   ; se centra en la casilla en la direccion en la que va
	call L_B6B3		;b617   ; se marca en el mapa; si choca con algo, se va
	ld a,(ix+01ch)		;b61a
	cp 003h		;b61d
	ret c			;b61f
	jp L_B53A		;b620
L_B623:
	call L_B5AE		;b623   ; se para: paso 5 y el sonido 0x25
	ld (ix+006h),000h		;b626   ; la marca de enemigo en movimiento = 0x00
	ld (ix+011h),011h		;b62a   ; el dibujo del enemigo (0xFF: no se ve) = 0x11
	ld (ix+014h),000h		;b62e   ; la espera del enemigo = 0x00
	ld (ix+001h),005h		;b632   ; el paso del enemigo = 0x05
	ld a,(0e243h)		;b636   ; lee la pantalla de la fase (desde 1)
	cp (ix+010h)		;b639   ; compara con la pantalla del enemigo
	ret nz			;b63c
	jp 0429ch		;b63d
L_B640:
	ld (ix+013h),001h		;b640   ; el enemigo de tipo 4 se para en su casilla
	ld a,(ix+001h)		;b644   ; lee el paso del enemigo
	dec a			;b647
	jr z,L_B651		;b648
	dec a			;b64a
	ret nz			;b64b
	call L_B656		;b64c   ; se centra en la casilla
	jr $+100		;b64f
L_B651:
	call L_B656		;b651   ; se centra en la casilla
	jr $+104		;b654
L_B656:
	ld a,(ix+005h)		;b656   ; se centra en la casilla
	and 0f8h		;b659
	ld (ix+005h),a		;b65b   ; guarda la x del enemigo
	ld a,(ix+003h)		;b65e   ; lee la y del enemigo
	and 0f8h		;b661
	ld (ix+003h),a		;b663   ; guarda la y del enemigo
	ret			;b666
L_B667:
	call L_B6D1		;b667   ; paso: espera 0x3C cuadros quieto y vuelve al paso 1
	ld c,001h		;b66a
	call L_AEE3		;b66c
	jr c,L_B683		;b66f
	ld a,(0e203h)		;b671   ; lee la cuenta de cuadros
	and 003h		;b674
	dec (ix+014h)		;b676   ; baja la espera del enemigo
	ret nz			;b679
	ld (ix+014h),03ch		;b67a   ; la espera del enemigo = 0x3C
	ld (ix+001h),001h		;b67e   ; el paso del enemigo = 0x01
	ret			;b682
L_B683:
	call L_B76B		;b683   ; quita del mapa sus cuatro casillas, devolviendo lo que habia
	jp L_B5D1		;b686
L_B689:
	ld a,(ix+014h)		;b689   ; paso: un pequeno salto (tabla 0xB6A1)
	cp 012h		;b68c
	jr z,$+37		;b68e
	inc (ix+014h)		;b690   ; sube la espera del enemigo
	ld hl,0b6a1h		;b693
	call 04094h		;b696   ; suma A a HL (HL = HL + A)
	ld a,(hl)			;b699
	add a,(ix+003h)		;b69a   ; le suma la y del enemigo
	ld (ix+003h),a		;b69d   ; guarda la y del enemigo
	ret			;b6a0

; ----------------------------------------------------------------------
; DATOS resto_B6A1: lo apuntan con el banco puesto p03:B693 (0xB6A1); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p03:B693 (18 bytes)
;   0xb6a1..0xb6b3  (18 bytes)
DATA_resto_B6A1:
	defb 0fdh,0feh,0ffh,0ffh,000h,000h,001h,001h,002h,003h,0feh,0ffh,000h,001h,002h,0ffh	; b6a1  ................
	defb 000h,001h	; b6b1

; ======================================================================
; CODIGO 0xb6b3..0xbc60  (1453 bytes)
; ======================================================================


L_B6B3:
	call L_B71D		;b6b3   ; se marca en el mapa; si choca con algo, se va
	call L_B7E9		;b6b6   ; C si al marcarse piso algo que no estaba libre
	jp c,L_B7FA		;b6b9
L_B6BC:
	ld (ix+006h),000h		;b6bc   ; quieto: paso 4, espera 0xB4
	ld (ix+011h),011h		;b6c0   ; el dibujo del enemigo (0xFF: no se ve) = 0x11
	ld (ix+013h),001h		;b6c4   ; las marcas del enemigo (bit 0 mata, bit 1 se le puede matar) = 0x01
	ld (ix+014h),0b4h		;b6c8   ; la espera del enemigo = 0xB4
	ld (ix+001h),004h		;b6cc   ; el paso del enemigo = 0x04
	ret			;b6d0
L_B6D1:
	call L_AF91		;b6d1   ; marca en el mapa sus cuatro casillas, guardando lo que habia
	call L_B79F		;b6d4   ; x / 8: la columna
	call L_B740		;b6d7   ; pone su valor en una casilla y la de debajo, y devuelve lo que habia (E, D)
	ld a,e			;b6da
	and a			;b6db
	jr z,L_B6E1		;b6dc
	jp pe,L_B6E4		;b6de
L_B6E1:
	ld (ix+018h),e		;b6e1   ; guarda los intentos del enemigo
L_B6E4:
	ld a,d			;b6e4
	and a			;b6e5
	jr z,L_B6EB		;b6e6
	jp pe,L_B6EE		;b6e8
L_B6EB:
	ld (ix+019h),d		;b6eb   ; guarda la direccion guardada del enemigo
L_B6EE:
	call L_AF91		;b6ee   ; DE = el mapa del enemigo
	ld a,h			;b6f1
	add a,008h		;b6f2
	ld h,a			;b6f4
	call L_B79F		;b6f5   ; x / 8: la columna
	call L_B740		;b6f8   ; pone su valor en una casilla y la de debajo, y devuelve lo que habia (E, D)
	ld a,e			;b6fb
	and a			;b6fc
	jr z,L_B702		;b6fd
	jp pe,L_B705		;b6ff
L_B702:
	ld (ix+01ah),e		;b702
L_B705:
	ld a,d			;b705
	jr z,L_B709		;b706
	ret pe			;b708
L_B709:
	ld (ix+01bh),d		;b709
	ret			;b70c
L_B70D:
	ld a,(ix+001h)		;b70d   ; si esta quieto y en esta pantalla, se marca en el mapa
	cp 004h		;b710
	jr z,L_B716		;b712
	dec a			;b714
	ret nz			;b715
L_B716:
	ld a,(0e243h)		;b716   ; lee la pantalla de la fase (desde 1)
	cp (ix+010h)		;b719   ; compara con la pantalla del enemigo
	ret nz			;b71c
L_B71D:
	call L_AF91		;b71d   ; DE = el mapa del enemigo
	call L_B79F		;b720   ; x / 8: la columna
	call L_B740		;b723   ; pone su valor en una casilla y la de debajo, y devuelve lo que habia (E, D)
	ld (ix+018h),e		;b726   ; guarda los intentos del enemigo
	ld (ix+019h),d		;b729   ; guarda la direccion guardada del enemigo
	call L_AF91		;b72c   ; DE = el mapa del enemigo
	ld a,h			;b72f
	add a,008h		;b730
	ld h,a			;b732
	call L_B79F		;b733   ; x / 8: la columna
	call L_B740		;b736   ; pone su valor en una casilla y la de debajo, y devuelve lo que habia (E, D)
	ld (ix+01ah),e		;b739
	ld (ix+01bh),d		;b73c
	ret			;b73f
L_B740:
	ld b,c			;b740   ; pone su valor en una casilla y la de debajo, y devuelve lo que habia (E, D)
	ld a,003h		;b741
L_B743:
	rrca			;b743   ; corre la mascara a la casilla C
	rrca			;b744
	djnz L_B743		;b745
	ld b,a			;b747
	ld e,(hl)			;b748   ; lo que habia...
	or (hl)			;b749   ; ...y se marca
	ld (hl),a			;b74a
	ld a,e			;b74b   ; E = lo que habia en la casilla
	and b			;b74c
	ld e,a			;b74d
	ld a,008h		;b74e   ; la fila de abajo (8 bytes)
	call 04094h		;b750   ; suma A a HL (HL = HL + A)
	ld a,b			;b753
	ld d,(hl)			;b754   ; D = lo que habia en la de abajo
	or (hl)			;b755
	ld (hl),a			;b756
	ld a,d			;b757
	and b			;b758
	ld d,a			;b759
	ret			;b75a
L_B75B:
	ld a,(ix+001h)		;b75b   ; si esta quieto y en esta pantalla, se quita del mapa
	cp 004h		;b75e
	jr z,L_B764		;b760
	dec a			;b762
	ret nz			;b763
L_B764:
	ld a,(0e243h)		;b764   ; lee la pantalla de la fase (desde 1)
	cp (ix+010h)		;b767   ; compara con la pantalla del enemigo
	ret nz			;b76a
L_B76B:
	call L_AF91		;b76b   ; quita del mapa sus cuatro casillas, devolviendo lo que habia
	ld a,h			;b76e
	add a,008h		;b76f
	ld h,a			;b771
	call L_B79F		;b772   ; x / 8: la columna
	ld e,(ix+01ah)		;b775
	ld d,(ix+01bh)		;b778
	call L_B78A		;b77b
	call L_AF91		;b77e   ; DE = el mapa del enemigo
	call L_B79F		;b781   ; x / 8: la columna
	ld e,(ix+018h)		;b784   ; lee los intentos del enemigo
	ld d,(ix+019h)		;b787   ; lee la direccion guardada del enemigo
L_B78A:
	ld a,0fch		;b78a
	ld b,c			;b78c
L_B78D:
	rrca			;b78d   ; corre la mascara a la casilla C
	rrca			;b78e
	djnz L_B78D		;b78f
	ld b,a			;b791
	and (hl)			;b792   ; borra la casilla...
	or e			;b793   ; ...y pone lo que habia (E)
	ld (hl),a			;b794
	ld a,008h		;b795   ; la fila de abajo
	call 04094h		;b797   ; suma A a HL (HL = HL + A)
	ld a,b			;b79a
	and (hl)			;b79b
	or d			;b79c   ; lo que habia (D)
	ld (hl),a			;b79d
	ret			;b79e
L_B79F:
	ld a,h			;b79f   ; x / 8: la columna
	rra			;b7a0
	rra			;b7a1
	rra			;b7a2
	ld b,a			;b7a3
	and 003h		;b7a4   ; la casilla dentro del byte (x / 8 & 3) + 1
	ld c,a			;b7a6
	inc c			;b7a7   ; + 1
	ld a,b			;b7a8   ; el byte de la fila: x / 32
	rra			;b7a9
	rra			;b7aa
	and 007h		;b7ab
	ld b,a			;b7ad
	ld a,l			;b7ae   ; la fila: y & 0xF8 (8 bytes por fila)
	and 0f8h		;b7af
	or b			;b7b1   ; mas el byte de la fila
	ld l,a			;b7b2
	ld h,000h		;b7b3
	add hl,de			;b7b5   ; mas el mapa
	ret			;b7b6
L_B7B7:
	ld ix,0e500h		;b7b7   ; quita del mapa los enemigos de tipo 4
	ld b,008h		;b7bb
L_B7BD:
	push bc			;b7bd
	ld a,(ix+000h)		;b7be   ; lee el tipo del enemigo (0: libre)
	cp 004h		;b7c1
	call z,L_B75B		;b7c3   ; si esta quieto y en esta pantalla, se quita del mapa
	ld de,00020h		;b7c6
	add ix,de		;b7c9
	pop bc			;b7cb
	djnz L_B7BD		;b7cc
	ret			;b7ce
L_B7CF:
	ld ix,0e500h		;b7cf   ; los vuelve a marcar
	ld b,008h		;b7d3
L_B7D5:
	push bc			;b7d5
	ld a,(ix+000h)		;b7d6   ; lee el tipo del enemigo (0: libre)
	cp 004h		;b7d9
	jr nz,L_B7E0		;b7db
	call L_B70D		;b7dd   ; si esta quieto y en esta pantalla, se marca en el mapa
L_B7E0:
	ld de,00020h		;b7e0
	add ix,de		;b7e3
	pop bc			;b7e5
	djnz L_B7D5		;b7e6
	ret			;b7e8
L_B7E9:
	ld a,(ix+018h)		;b7e9   ; C si al marcarse piso algo que no estaba libre
	or (ix+019h)		;b7ec   ; OR con la direccion guardada del enemigo
	or (ix+01ah)		;b7ef
	or (ix+01bh)		;b7f2
	and 0aah		;b7f5
	ret z			;b7f7
	scf			;b7f8
	ret			;b7f9
L_B7FA:
	call L_B76B		;b7fa   ; se quita del mapa y se va
	jp 06412h		;b7fd
L_B800:
	ld a,(ix+001h)		;b800   ; un cuadro de una puerta giratoria (tipo 1 de 0xE600), por pasos (IX+01)
	cp 001h		;b803   ; 1: girando
	jp z,L_B889		;b805
	jp nc,L_B8A6		;b808   ; 2 o mas: aparte
	ld a,(0e243h)		;b80b   ; lee la pantalla de la fase (desde 1)
	cp (ix+004h)		;b80e   ; compara con la pantalla de la cosa
	ret nz			;b811
	ld a,(0e280h)		;b812   ; cerrada: si el personaje la empuja por su lado 10 cuadros seguidos...
	and a			;b815   ; parado (estado 0)?
	jr nz,L_B860		;b816
	ld a,(ix+008h)		;b818   ; lee el alto de la cosa
	add a,a			;b81b   ; el alto x 8
	add a,a			;b81c
	add a,a			;b81d
	ld b,a			;b81e
	ld a,(0e282h)		;b81f   ; lee la y del personaje
	add a,00fh		;b822
	sub (ix+002h)		;b824   ; le resta la y de la cosa
	sub b			;b827   ; dentro del alto?
	jr nc,L_B860		;b828
	ld a,(ix+007h)		;b82a   ; lee las marcas de la cosa (bit 0 repintar, bit 1 su lado)
	rra			;b82d   ; el bit 1: su lado
	rra			;b82e
	ld a,(0e284h)		;b82f   ; lee la x del personaje
	ld b,(ix+003h)		;b832   ; lee la x de la cosa
	jr c,L_B865		;b835
	cp b			;b837   ; por la izquierda de la puerta...
	jr nc,L_B860		;b838
	add a,014h		;b83a   ; ...a menos de 0x14
	sub b			;b83c
	jr c,L_B860		;b83d
	ld a,(0e208h)		;b83f   ; ...empujando a la derecha...
	and 008h		;b842
	jr z,L_B860		;b844
	dec (ix+006h)		;b846   ; baja la cuenta de la cosa
	ret nz			;b849
	inc (ix+005h)		;b84a   ; ...gira: el personaje pasa andando (estado 7) con el sonido 0x21
	ld a,007h		;b84d   ; estado 7: pasa andando
	ld (0e280h),a		;b84f   ; guarda el estado del personaje
	call 04288h		;b852   ; pide el sonido 0x21
L_B855:
	xor a			;b855   ; la puerta en marcha (bit 0 de IX+07) y el paso siguiente
	ld (0e299h),a		;b856   ; guarda la cuenta de pasos al entrar por una puerta
	set 0,(ix+007h)		;b859   ; pone a uno el bit 0 de las marcas de la cosa (bit 0 repintar, bit 1 su lado)
	inc (ix+001h)		;b85d   ; sube el paso de la cosa
L_B860:
	ld (ix+006h),00ah		;b860   ; si no, la cuenta vuelve a 10
	ret			;b864
L_B865:
	cp b			;b865   ; por el otro lado, empujando a la izquierda (estado 6)
	jr c,L_B860		;b866   ; por la derecha de la puerta...
	sub 014h		;b868   ; ...a menos de 0x14
	sub b			;b86a
	jr nc,L_B860		;b86b
	ld a,(0e208h)		;b86d   ; lee el mando: lo pulsado
	and 004h		;b870   ; empujando a la izquierda (bit 2)
	jr z,L_B860		;b872
	dec (ix+006h)		;b874   ; baja la cuenta de la cosa
	ret nz			;b877
	dec (ix+005h)		;b878   ; baja el giro o paso del dibujo de la cosa
	ld a,006h		;b87b   ; estado 6: pasa andando
	ld (0e280h),a		;b87d   ; guarda el estado del personaje
	call L_B855		;b880   ; la puerta en marcha (bit 0 de IX+07) y el paso siguiente
	inc (ix+001h)		;b883   ; sube el paso de la cosa
	jp 04288h		;b886
L_B889:
	dec (ix+006h)		;b889   ; paso 1: cada 10 cuadros un giro, hasta 3: se queda del otro lado
	ret nz			;b88c
	call L_B860		;b88d   ; si no, la cuenta vuelve a 10
	set 0,(ix+007h)		;b890   ; pone a uno el bit 0 de las marcas de la cosa (bit 0 repintar, bit 1 su lado)
	inc (ix+005h)		;b894   ; sube el giro o paso del dibujo de la cosa
	ld a,(ix+005h)		;b897   ; lee el giro o paso del dibujo de la cosa
	cp 003h		;b89a
	ret nz			;b89c
	ld (ix+001h),000h		;b89d   ; el paso de la cosa = 0x00
	set 1,(ix+007h)		;b8a1   ; pone a uno el bit 1 de las marcas de la cosa (bit 0 repintar, bit 1 su lado)
	ret			;b8a5
L_B8A6:
	dec (ix+006h)		;b8a6   ; paso 2: gira al reves hasta 0
	ret nz			;b8a9
	call L_B860		;b8aa   ; si no, la cuenta vuelve a 10
	set 0,(ix+007h)		;b8ad   ; pone a uno el bit 0 de las marcas de la cosa (bit 0 repintar, bit 1 su lado)
	dec (ix+005h)		;b8b1   ; baja el giro o paso del dibujo de la cosa
	ret nz			;b8b4
	xor a			;b8b5
	ld (ix+001h),a		;b8b6   ; guarda el paso de la cosa
	res 1,(ix+007h)		;b8b9   ; pone a cero el bit 1 de las marcas de la cosa (bit 0 repintar, bit 1 su lado)
	ret			;b8bd
L_B8BE:
	ld a,(0e243h)		;b8be   ; lee la pantalla de la fase (desde 1)
	cp (ix+004h)		;b8c1   ; compara con la pantalla de la cosa
	ret nz			;b8c4
	ld hl,0908dh		;b8c5   ; los tres dibujos, el mismo (0x908D)
	ld de,0908dh		;b8c8
	ld bc,0908dh		;b8cb
L_B8CE:
	exx			;b8ce
	ld b,(ix+008h)		;b8cf   ; B = el alto
	ld c,002h		;b8d2   ; 2 de ancho
	ld d,(ix+003h)		;b8d4   ; D = la x, E = la y
	ld e,(ix+002h)		;b8d7   ; lee la y de la cosa
	call 0537dh		;b8da
	exx			;b8dd
L_B8DE:
	ld (0efc0h),hl		;b8de   ; pinta la puerta: la parte de arriba (HL), la del medio (DE) repetida y la de abajo (BC)
	ld (0efc2h),de		;b8e1   ; guarda la pantalla que se lee del mapa y el byte siguiente (16 bits)
	ld (0efc4h),bc		;b8e5
	ld d,(ix+003h)		;b8e9   ; lee la x de la cosa
	ld e,(ix+002h)		;b8ec   ; lee la y de la cosa
	ld hl,(0efc0h)		;b8ef   ; lee un dato de paso de la rutina en curso y el byte siguiente (16 bits)
	call L_B90E		;b8f2   ; dos caracteres de la parte, segun el giro (IX+05)
	ld a,(ix+008h)		;b8f5   ; lee el alto de la cosa
	cp 003h		;b8f8
	jr c,L_B90B		;b8fa
	ld b,a			;b8fc
	dec b			;b8fd
	dec b			;b8fe
L_B8FF:
	ld hl,(0efc2h)		;b8ff   ; lee la pantalla que se lee del mapa y el byte siguiente (16 bits)
	push hl			;b902
	push bc			;b903
	call L_B90E		;b904   ; dos caracteres de la parte, segun el giro (IX+05)
	pop bc			;b907
	pop hl			;b908
	djnz L_B8FF		;b909
L_B90B:
	ld hl,(0efc4h)		;b90b
L_B90E:
	push de			;b90e   ; dos caracteres de la parte, segun el giro (IX+05)
	ld a,(ix+005h)		;b90f   ; lee el giro o paso del dibujo de la cosa
	add a,a			;b912   ; el giro x 2
	call 04094h		;b913   ; suma A a HL (HL = HL + A)
	ld a,(hl)			;b916
	push hl			;b917
	call 053efh		;b918   ; escribe el caracter A en la posicion D, E de la tabla de nombres
	pop hl			;b91b
	ld a,d			;b91c   ; 8 pixeles a la derecha
	add a,008h		;b91d
	ld d,a			;b91f
	inc hl			;b920   ; el segundo caracter
	ld a,(hl)			;b921
	call 053efh		;b922   ; escribe el caracter A en la posicion D, E de la tabla de nombres
	pop de			;b925
	ld a,e			;b926   ; la fila siguiente, 8 mas abajo
	add a,008h		;b927
	ld e,a			;b929
	ret			;b92a
L_B92B:
	ld a,(ix+001h)		;b92b   ; un cuadro de una puerta de tipo 2
	and a			;b92e   ; 0: cerrada
	jr nz,L_B9AA		;b92f
	ld a,(0e243h)		;b931   ; lee la pantalla de la fase (desde 1)
	cp (ix+004h)		;b934   ; compara con la pantalla de la cosa
	ret nz			;b937
	ld a,(0e280h)		;b938   ; lee el estado del personaje
	and a			;b93b   ; parado (estado 0)?
	jr nz,L_B98B		;b93c
	ld a,(ix+008h)		;b93e   ; lee el alto de la cosa
	add a,a			;b941   ; el alto x 8
	add a,a			;b942
	add a,a			;b943
	ld b,a			;b944
	ld a,(0e282h)		;b945   ; lee la y del personaje
	add a,00fh		;b948
	sub (ix+002h)		;b94a   ; le resta la y de la cosa
	sub b			;b94d   ; dentro del alto?
	jr nc,L_B98B		;b94e
	ld a,(ix+007h)		;b950   ; lee las marcas de la cosa (bit 0 repintar, bit 1 su lado)
	rra			;b953   ; el bit 1: su lado
	rra			;b954
	ld a,(0e284h)		;b955   ; lee la x del personaje
	ld b,(ix+003h)		;b958   ; lee la x de la cosa
	jr c,L_B990		;b95b
	cp b			;b95d   ; por la izquierda de la puerta...
	jr nc,L_B98B		;b95e
	add a,014h		;b960   ; ...a menos de 0x14
	sub b			;b962
	jr c,L_B98B		;b963
	ld a,(0e208h)		;b965   ; lee el mando: lo pulsado
	and 008h		;b968   ; empujando a la derecha
	jr z,L_B98B		;b96a
	dec (ix+006h)		;b96c   ; baja la cuenta de la cosa
	ret nz			;b96f
	ld a,007h		;b970   ; gira: el personaje pasa andando
	ld (0e280h),a		;b972   ; guarda el estado del personaje
L_B975:
	xor a			;b975   ; la puerta en marcha y el sonido 0x22
	ld (0e299h),a		;b976   ; guarda la cuenta de pasos al entrar por una puerta
	set 0,(ix+007h)		;b979   ; pone a uno el bit 0 de las marcas de la cosa (bit 0 repintar, bit 1 su lado)
	inc (ix+005h)		;b97d   ; sube el giro o paso del dibujo de la cosa
	inc (ix+001h)		;b980   ; sube el paso de la cosa
	ld (ix+006h),008h		;b983   ; la cuenta de la cosa = 0x08
	call 0428dh		;b987   ; pide el sonido 0x22
	ret			;b98a
L_B98B:
	ld (ix+006h),01eh		;b98b   ; si no, la cuenta vuelve a 0x1E
	ret			;b98f
L_B990:
	cp b			;b990   ; por el otro lado
	jr c,L_B98B		;b991   ; por la derecha de la puerta...
	sub 014h		;b993   ; ...a menos de 0x14
	sub b			;b995
	jr nc,L_B98B		;b996
	ld a,(0e208h)		;b998   ; lee el mando: lo pulsado
	and 004h		;b99b   ; empujando a la izquierda (bit 2)
	jr z,L_B98B		;b99d
	dec (ix+006h)		;b99f   ; baja la cuenta de la cosa
	ret nz			;b9a2
	ld a,006h		;b9a3   ; estado 6: pasa andando
	ld (0e280h),a		;b9a5   ; guarda el estado del personaje
	jr L_B975		;b9a8
L_B9AA:
	dec (ix+006h)		;b9aa   ; gira cada 8 cuadros; a los 4 pasos vuelve a estar cerrada (sonido 0x22)
	ret nz			;b9ad
	set 0,(ix+007h)		;b9ae   ; pone a uno el bit 0 de las marcas de la cosa (bit 0 repintar, bit 1 su lado)
	inc (ix+005h)		;b9b2   ; sube el giro o paso del dibujo de la cosa
	ld a,(ix+005h)		;b9b5   ; lee el giro o paso del dibujo de la cosa
	ld (ix+006h),008h		;b9b8   ; la cuenta de la cosa = 0x08
	cp 004h		;b9bc
	ret nz			;b9be
	call 0428dh		;b9bf   ; pide el sonido 0x22
	xor a			;b9c2
	ld (ix+005h),a		;b9c3   ; guarda el giro o paso del dibujo de la cosa
	ld (ix+001h),a		;b9c6   ; guarda el paso de la cosa
	jr L_B98B		;b9c9
L_B9CB:
	ld a,(0e243h)		;b9cb   ; lee la pantalla de la fase (desde 1)
	cp (ix+004h)		;b9ce   ; compara con la pantalla de la cosa
	ret nz			;b9d1
	ld a,(ix+007h)		;b9d2   ; lee las marcas de la cosa (bit 0 repintar, bit 1 su lado)
	rra			;b9d5   ; el bit 1: su lado
	rra			;b9d6
	ld hl,09095h		;b9d7   ; de un lado: 0x9095, 0x909D y 0x90A5...
	ld de,0909dh		;b9da
	ld bc,090a5h		;b9dd
	jp nc,L_B8CE		;b9e0
	ld hl,090adh		;b9e3   ; ...del otro: 0x90AD, 0x90B5 y 0x90BD
	ld de,090b5h		;b9e6
	ld bc,090bdh		;b9e9
	jp L_B8CE		;b9ec
L_B9EF:
	ld ix,0e600h		;b9ef   ; las cosas de tipo 3 de 0xE600: si el personaje pasa por su columna, empiezan a moverse
	ld b,010h		;b9f3
L_B9F5:
	ld a,(ix+000h)		;b9f5   ; lee el tipo de la cosa (0: libre)
	cp 003h		;b9f8
	jr z,L_BA04		;b9fa
L_B9FC:
	ld de,00010h		;b9fc
	add ix,de		;b9ff
	djnz L_B9F5		;ba01
	ret			;ba03
L_BA04:
	ld a,(ix+001h)		;ba04   ; lee el paso de la cosa
	and a			;ba07
	jr nz,L_B9FC		;ba08
	call L_BA17		;ba0a   ; C si el personaje esta en su pantalla, a menos de 8 pixeles en x y dentro de su alto
	jr nc,L_B9FC		;ba0d
	inc (ix+001h)		;ba0f   ; sube el paso de la cosa
	ld (ix+006h),01eh		;ba12   ; la cuenta de la cosa = 0x1E
	ret			;ba16
L_BA17:
	ld a,(0e243h)		;ba17   ; C si el personaje esta en su pantalla, a menos de 8 pixeles en x y dentro de su alto
	cp (ix+004h)		;ba1a   ; compara con la pantalla de la cosa
	jr nz,L_BA39		;ba1d
	ld a,(0e284h)		;ba1f   ; lee la x del personaje
	add a,008h		;ba22   ; x + 8 - la de la cosa...
	sub (ix+003h)		;ba24   ; le resta la x de la cosa
	cp 008h		;ba27   ; ...menos de 8
	ret nc			;ba29
	ld a,(ix+008h)		;ba2a   ; lee el alto de la cosa
	add a,a			;ba2d   ; el alto x 8
	add a,a			;ba2e
	add a,a			;ba2f
	ld c,a			;ba30
	ld a,(0e282h)		;ba31   ; lee la y del personaje
	sub (ix+002h)		;ba34   ; la y - la de la cosa, menos que el alto: C
	cp c			;ba37
	ret			;ba38
L_BA39:
	or a			;ba39
	ret			;ba3a
L_BA3B:
	ld a,(ix+001h)		;ba3b   ; la cosa de tipo 3 en marcha: cada 0x1E cuadros un paso, hasta su alto (IX+08); luego se quita
	and a			;ba3e
	ret z			;ba3f
	dec (ix+006h)		;ba40   ; baja la cuenta de la cosa
	ret nz			;ba43
	set 0,(ix+007h)		;ba44   ; pone a uno el bit 0 de las marcas de la cosa (bit 0 repintar, bit 1 su lado)
	ld (ix+006h),01eh		;ba48   ; la cuenta de la cosa = 0x1E
	ld a,(ix+005h)		;ba4c   ; lee el giro o paso del dibujo de la cosa
	cp (ix+008h)		;ba4f   ; compara con el alto de la cosa
	jr nc,L_BA58		;ba52
	inc (ix+005h)		;ba54   ; sube el giro o paso del dibujo de la cosa
	ret			;ba57
L_BA58:
	ld (ix+000h),000h		;ba58   ; el tipo de la cosa (0: libre) = 0x00
	ret			;ba5c
L_BA5D:
	ld a,(ix+005h)		;ba5d   ; lee el giro o paso del dibujo de la cosa
	dec a			;ba60
	add a,a			;ba61
	add a,a			;ba62
	add a,a			;ba63
	ld e,a			;ba64
	ld h,(ix+003h)		;ba65   ; H = la x
	add a,(ix+002h)		;ba68   ; L = la y + (IX+05 - 1) x 8
	ld l,a			;ba6b
	ld d,(ix+004h)		;ba6c   ; lee la pantalla de la cosa
	ld bc,00101h		;ba6f   ; 1 x 1, con el valor 2
	ld a,002h		;ba72
	push de			;ba74
	call 061f7h		;ba75   ; marca un rectangulo del mapa de la pantalla D: B filas de C casillas con el valor A
	pop de			;ba78
	ld a,(0e243h)		;ba79   ; lee la pantalla de la fase (desde 1)
	cp (ix+004h)		;ba7c   ; compara con la pantalla de la cosa
	ret nz			;ba7f
	ld d,(ix+003h)		;ba80   ; D = la x
	ld a,(ix+002h)		;ba83   ; E = la y + lo mismo
	add a,e			;ba86
	ld e,a			;ba87
	push ix		;ba88
	push de			;ba8a
	call 08e2dh		;ba8b   ; las cosas de la lista 0xEE50 (por numero): lo que habia debajo se devuelve
	pop de			;ba8e
	ld a,005h		;ba8f   ; el caracter 5
	call 053efh		;ba91   ; escribe el caracter A en la posicion D, E de la tabla de nombres
	call 08e74h		;ba94   ; las de la lista, al reves: guarda el fondo y pinta la cosa
	pop ix		;ba97
	jp 042cfh		;ba99
L_BA9C:
	ld a,(0e243h)		;ba9c   ; una cosa de tipo 4 (suelo que se rompe): mira si el personaje esta encima
	cp (ix+004h)		;ba9f   ; compara con la pantalla de la cosa
	ret nz			;baa2
	ld a,(ix+00ah)		;baa3   ; lee la marca de personaje encima (suelo que se rompe) o la y del fondo guardado (bloque)
	ld (ix+00bh),a		;baa6   ; guarda la x del fondo guardado (bloque) o la marca anterior de personaje encima (suelo que se rompe)
	ld a,(0e282h)		;baa9   ; lee la y del personaje
	add a,014h		;baac
	sub (ix+002h)		;baae   ; le resta la y de la cosa
	cp 008h		;bab1
	jr nc,L_BAC1		;bab3
	ld a,(0e284h)		;bab5   ; lee la x del personaje
	add a,008h		;bab8
	sub (ix+003h)		;baba   ; le resta la x de la cosa
	cp 020h		;babd
	jr c,L_BAF0		;babf
L_BAC1:
	ld (ix+00ah),000h		;bac1   ; al bajarse de ella (en el suelo), cuenta; a la segunda, se rompe
	ld a,(ix+00bh)		;bac5   ; lee la x del fondo guardado (bloque) o la marca anterior de personaje encima (suelo que se rompe)
	and a			;bac8   ; sin estar antes encima: nada
	ret z			;bac9
	ld a,(0e280h)		;baca   ; lee el estado del personaje
	and a			;bacd
	ret nz			;bace   ; parado (estado 0)?
	inc (ix+006h)		;bacf   ; sube la cuenta de la cosa
	ld a,(ix+006h)		;bad2   ; lee la cuenta de la cosa
	cp 002h		;bad5   ; a la segunda...
	ret c			;bad7
	ld (ix+000h),000h		;bad8   ; se quita: su dibujo y sus 4 casillas del mapa a 0
	call L_BAF5		;badc   ; el sonido 0x27 y se repinta el fondo (MSX1 de la ficha, MSX2 de la pagina 1)
	xor a			;badf   ; el valor 0...
L_BAE0:
	ld bc,00104h		;bae0   ; ...1 fila de 4 casillas
	ld h,(ix+003h)		;bae3   ; lee la x de la cosa
	ld l,(ix+002h)		;bae6   ; lee la y de la cosa
	ld d,(ix+004h)		;bae9   ; lee la pantalla de la cosa
	call 061f7h		;baec   ; marca un rectangulo del mapa de la pantalla D: B filas de C casillas con el valor A
	ret			;baef
L_BAF0:
	ld (ix+00ah),001h		;baf0   ; 0xE60A = 1: el personaje esta encima
	ret			;baf4
L_BAF5:
	call 042a6h		;baf5   ; el sonido 0x27 y se repinta el fondo (MSX1 de la ficha, MSX2 de la pagina 1)
	ld d,(ix+003h)		;baf8   ; lee la x de la cosa
	ld e,(ix+002h)		;bafb   ; lee la y de la cosa
	push ix		;bafe
	pop hl			;bb00
	ld a,(0f0f4h)		;bb01   ; lee la marca de MSX2 (1 en el cartucho de MSX2, 0 en el de MSX1)
	and a			;bb04
	jr nz,L_BB13		;bb05
	ld a,00ch		;bb07
	call 04094h		;bb09   ; suma A a HL (HL = HL + A)
	ld bc,00104h		;bb0c
	call 053d6h		;bb0f   ; un rectangulo de caracteres de HL: B filas de C, en la tabla de nombres
	ret			;bb12
L_BB13:
	ld a,l			;bb13   ; en MSX2: el fondo guardado en la pagina 1 (x = 2 x el numero de la ficha, y 0x40 o 0x50)
	add a,a			;bb14
	ld h,a			;bb15
	ld l,040h		;bb16
	jr nc,L_BB1C		;bb18
	ld l,050h		;bb1a
L_BB1C:
	ld bc,02008h		;bb1c
	ld a,001h		;bb1f
	call 04f66h		;bb21   ; en este cartucho no hace nada: aqui iria el pintor de caracteres de MSX2
	ret			;bb24
L_BB25:
	xor a			;bb25
	ld (ix+00ah),a		;bb26   ; guarda la marca de personaje encima (suelo que se rompe) o la y del fondo guardado (bloque)
	ld (ix+00bh),a		;bb29   ; guarda la x del fondo guardado (bloque) o la marca anterior de personaje encima (suelo que se rompe)
	call L_BB59		;bb2c   ; guarda el fondo del suelo de IX: en MSX1, 4 bytes de la tabla de nombres en IX+0C; en MSX2, un trozo de la pagina 1
	ld a,003h		;bb2f   ; A = 3
	call L_BAE0		;bb31   ; ...1 fila de 4 casillas
	ld a,(0e243h)		;bb34   ; lee la pantalla de la fase (desde 1)
	cp (ix+004h)		;bb37   ; compara con la pantalla de la cosa
	ret nz			;bb3a
L_BB3B:
	ld d,(ix+003h)		;bb3b   ; pinta una fila de 4 caracteres (0xAD en MSX2, 0x61 en MSX1)
	ld e,(ix+002h)		;bb3e   ; lee la y de la cosa
	ld b,004h		;bb41   ; 4 caracteres
L_BB43:
	push de			;bb43
	ld a,(0f0f4h)		;bb44   ; 0x61 en MSX1, 0xAD en MSX2
	and a			;bb47
	ld a,061h		;bb48
	jr z,L_BB4E		;bb4a
	ld a,0adh		;bb4c
L_BB4E:
	call 053efh		;bb4e   ; escribe el caracter A en la posicion D, E de la tabla de nombres
	pop de			;bb51
	ld a,d			;bb52   ; 8 pixeles a la derecha
	add a,008h		;bb53
	ld d,a			;bb55
	djnz L_BB43		;bb56
	ret			;bb58
L_BB59:
	ld h,(ix+003h)		;bb59   ; guarda el fondo del suelo de IX: en MSX1, 4 bytes de la tabla de nombres en IX+0C; en MSX2, un trozo de la pagina 1
	ld l,(ix+002h)		;bb5c   ; lee la y de la cosa
	ld a,(0f0f4h)		;bb5f   ; lee la marca de MSX2 (1 en el cartucho de MSX2, 0 en el de MSX1)
	and a			;bb62
	jr nz,L_BB7B		;bb63
	call 04d7ch		;bb65   ; MSX1: su direccion en la VRAM
	push ix		;bb68   ; a IX+0C
	pop de			;bb6a
	ld a,00ch		;bb6b
	call 04099h		;bb6d   ; suma A a DE (DE = DE + A)
	ld b,004h		;bb70   ; 4 bytes
L_BB72:
	call 0004ah		;bb72   ; BIOS RDVRM - Reads the content of VRAM
	ld (de),a			;bb75
	inc hl			;bb76
	inc de			;bb77
	djnz L_BB72		;bb78
	ret			;bb7a
L_BB7B:
	push ix		;bb7b   ; MSX2: (IX & 0xFF) x 2, en la columna...
	pop de			;bb7d
	ld a,e			;bb7e
	add a,a			;bb7f
	ld d,a			;bb80
	ld e,040h		;bb81   ; ...y la fila 0x40 o 0x50
	jr nc,L_BB87		;bb83
	ld e,050h		;bb85
L_BB87:
	ld bc,02008h		;bb87   ; 0x20 x 8, de la pagina 0 a la 1
	ld a,004h		;bb8a
	call 04f66h		;bb8c   ; en este cartucho no hace nada: aqui iria el pintor de caracteres de MSX2
	ret			;bb8f
L_BB90:
	ld hl,0e7c0h		;bb90   ; las columnas de 0xE7C0 de esta pantalla
	ld b,010h		;bb93
L_BB95:
	ld a,(0e243h)		;bb95   ; lee la pantalla de la fase (desde 1)
	cp (hl)			;bb98
	push bc			;bb99
	push hl			;bb9a
	call z,L_BBA8		;bb9b   ; el personaje sobre la columna: dentro de su alto y a menos de 16 pixeles en x
	pop hl			;bb9e
	ld a,004h		;bb9f
	call 04094h		;bba1   ; suma A a HL (HL = HL + A)
	pop bc			;bba4
	djnz L_BB95		;bba5
	ret			;bba7
L_BBA8:
	inc l			;bba8   ; el personaje sobre la columna: dentro de su alto y a menos de 16 pixeles en x
	ld e,(hl)			;bba9   ; la y
	inc l			;bbaa
	ld d,(hl)			;bbab   ; la x
	inc l			;bbac
	ld a,(hl)			;bbad   ; el alto x 8 + 0x18
	and 01fh		;bbae
	add a,a			;bbb0
	add a,a			;bbb1
	add a,a			;bbb2
	add a,018h		;bbb3
	ld b,a			;bbb5
	ld a,e			;bbb6   ; la y - 0x14
	sub 014h		;bbb7
	ld c,a			;bbb9
	ld a,(0e282h)		;bbba   ; lee la y del personaje
	sub c			;bbbd   ; dentro del alto?
	cp b			;bbbe
	ret nc			;bbbf
	ld a,(0e284h)		;bbc0   ; lee la x del personaje
	sub d			;bbc3   ; a menos de 16 en x?
	cp 010h		;bbc4
	ret nc			;bbc6
	ld a,(0e2a7h)		;bbc7   ; al caer sobre ella (0xE2A7) tras haber estado en ella...
	and a			;bbca
	jr z,L_BBE8		;bbcb
	xor a			;bbcd
	ld (0e2a7h),a		;bbce   ; guarda la marca de acabar de caer
	ld a,(hl)			;bbd1
	and 020h		;bbd2   ; el bit 5: ha estado en ella
	ret z			;bbd4
	res 5,(hl)		;bbd5   ; se borra
	ld a,(hl)			;bbd7   ; ...le queda una vez menos (bits 6-7); a la ultima se hunde
	and 0c0h		;bbd8
	rlca			;bbda
	rlca			;bbdb
	dec a			;bbdc
	jr z,L_BBF1		;bbdd
	rrca			;bbdf   ; a los bits 6-7 otra vez
	rrca			;bbe0
	ld c,a			;bbe1
	ld a,(hl)			;bbe2
	and 03fh		;bbe3   ; guardado
	or c			;bbe5
	ld (hl),a			;bbe6
	ret			;bbe7
L_BBE8:
	ld a,(0e280h)		;bbe8   ; subido (estado 2): se marca (bit 5)
	cp 002h		;bbeb
	ret nz			;bbed
	set 5,(hl)		;bbee
	ret			;bbf0
L_BBF1:
	push hl			;bbf1   ; se hunde: arriba queda un ladrillo y el resto se vacia, con el sonido 0x40
	push de			;bbf2
	push bc			;bbf3
	call 09418h		;bbf4   ; devuelve el fondo de los bloques de esta pantalla
	call 08e2dh		;bbf7   ; las cosas de la lista 0xEE50 (por numero): lo que habia debajo se devuelve
	pop bc			;bbfa
	pop de			;bbfb
	pop hl			;bbfc
	push hl			;bbfd
	push de			;bbfe
	ld a,005h		;bbff   ; arriba, dos ladrillos (el caracter 5)
	call L_BC4B		;bc01   ; pinta dos caracteres A en fila en (D, E) y baja una fila
	ld a,(hl)			;bc04   ; el alto - 1
	and 01fh		;bc05
	dec a			;bc07
	ld (0eff0h),a		;bc08
	ld b,a			;bc0b
	push bc			;bc0c
	call nz,0537bh		;bc0d   ; una cosa de 2 x B caracteres de la piramide en (D, E)
	pop bc			;bc10
	pop de			;bc11
	pop hl			;bc12
	dec hl			;bc13   ; el tipo a 0: la columna se acaba
	dec hl			;bc14
	dec hl			;bc15
	ld (hl),000h		;bc16
	ex de,hl			;bc18
	ld a,(0e243h)		;bc19   ; lee la pantalla de la fase (desde 1)
	ld d,a			;bc1c
	ld c,002h		;bc1d   ; 2 de ancho
	push hl			;bc1f
	push de			;bc20
	push bc			;bc21
	ld a,002h		;bc22   ; la fila de arriba: ladrillo (2)
	ld b,001h		;bc24
	call 061f7h		;bc26   ; marca un rectangulo del mapa de la pantalla D: B filas de C casillas con el valor A
	pop bc			;bc29
	pop de			;bc2a
	pop hl			;bc2b
	ld a,l			;bc2c   ; las de debajo...
	add a,008h		;bc2d
	ld l,a			;bc2f
	ld a,(0eff0h)		;bc30
	and a			;bc33
	ld a,000h		;bc34   ; ...libres (0)
	call nz,061f7h		;bc36   ; marca un rectangulo del mapa de la pantalla D: B filas de C casillas con el valor A
	call 093e8h		;bc39   ; pinta los bloques de esta pantalla
	call 08e74h		;bc3c   ; las de la lista, al reves: guarda el fondo y pinta la cosa
	ld hl,0e282h		;bc3f   ; apunta a la y del personaje
	ld a,(hl)			;bc42   ; el personaje: y + 3, a la fila de 8
	add a,003h		;bc43
	and 0f8h		;bc45
	ld (hl),a			;bc47
	jp 0430bh		;bc48
L_BC4B:
	push hl			;bc4b   ; pinta dos caracteres A en fila en (D, E) y baja una fila
	push de			;bc4c
	push af			;bc4d
	call 053efh		;bc4e   ; escribe el caracter A en la posicion D, E de la tabla de nombres
	ld a,d			;bc51
	add a,008h		;bc52
	ld d,a			;bc54
	pop af			;bc55
	call 053efh		;bc56   ; escribe el caracter A en la posicion D, E de la tabla de nombres
	pop de			;bc59
	pop hl			;bc5a
	ld a,e			;bc5b
	add a,008h		;bc5c
	ld e,a			;bc5e
	ret			;bc5f

; ----------------------------------------------------------------------
; DATOS relleno_ff: 928 bytes a 0xFF hasta el final del banco: relleno; lo
;   leen nadie (928 bytes)
;   0xbc60..0xc000  (928 bytes)
DATA_relleno_ff:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bc60  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bc70  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bc80  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bc90  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bca0  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bcb0  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bcc0  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bcd0  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bce0  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bcf0  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bd00  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bd10  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bd20  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bd30  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bd40  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bd50  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bd60  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bd70  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bd80  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bd90  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bda0  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bdb0  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bdc0  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bdd0  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bde0  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bdf0  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; be00  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; be10  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; be20  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; be30  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; be40  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; be50  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; be60  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; be70  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; be80  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; be90  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bea0  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; beb0  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bec0  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bed0  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bee0  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bef0  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf00  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf10  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf20  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf30  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bf40  ................
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
