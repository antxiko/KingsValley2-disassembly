; ==========================================================================
; KING'S VALLEY II - Konami (1988) - MSX - MegaROM RC-760 de 128 KB (Konami SCC) - banco 01 (se ejecuta en 0x6000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x06000


; ----------------------------------------------------------------------
; Direcciones que solo aparecen como VALOR -en un `ld`, no en
; un salto-: son punteros que el codigo se pasa o numeros que
; casualmente coinciden con una direccion. No hay nada que
; trazar en ellas; el equ existe para que el listado ensamble.
; ----------------------------------------------------------------------
l624eh:	equ 0x0624e

; ----------------------------------------------------------------------
; DATOS partida_6000: los 2 ultimos bytes de la instruccion de p00:5FFF (3A 43
;   E2), que empieza en el banco 0; lo leen p00:5FFF (2 bytes)
;   0x6000..0x6002  (2 bytes)
DATA_partida_6000:
	defb 043h,0e2h	; 6000

; ======================================================================
; CODIGO 0x6002..0x60d5  (211 bytes)
; ======================================================================


L_6002:
	ld hl,0e788h		;6002
	ld c,007h		;6005
L_6007:
	ld b,008h		;6007   ; 7 filas de 8
L_6009:
	cp (hl)			;6009
	jr z,L_6013		;600a
	inc hl			;600c
	djnz L_6009		;600d
	dec c			;600f
	jr nz,L_6007		;6010
	ret			;6012
L_6013:
	ld hl,0e282h		;6013   ; su sitio: la casilla mas su y / 8 y su x / 8
	call L_610B		;6016   ; D, E = la esquina de la casilla del plano: columna (8 - B) x 32, fila (7 - C) x 24
	ld a,(hl)			;6019
	ld c,a			;601a
	inc hl			;601b
	inc hl			;601c
	rra			;601d
	rra			;601e
	rra			;601f
	and 01fh		;6020
	add a,e			;6022
	ld e,a			;6023
	ld a,(hl)			;6024
	ld b,a			;6025
	rra			;6026
	rra			;6027
	rra			;6028
	and 01fh		;6029
	add a,d			;602b
	ld d,a			;602c
	call L_611F		;602d   ; mas el margen del plano (0x20, 0x18)
	ld hl,0e804h		;6030   ; el sprite 1, en ese sitio
	dec e			;6033
	ld (hl),e			;6034
	inc hl			;6035
	ld a,d			;6036
	sub 003h		;6037
	ld (hl),a			;6039
	inc hl			;603a
	ld (hl),004h		;603b   ; de color 7
	inc hl			;603d
	ld (hl),006h		;603e
	ret			;6040
L_6041:
	ld a,(0e2f3h)		;6041   ; la otra marca del plano: la casilla de la pantalla 0xE2F3 y el sitio de 0xE2F1
	ld hl,0e788h		;6044
	ld c,007h		;6047
L_6049:
	ld b,008h		;6049
L_604B:
	cp (hl)			;604b
	jr z,L_6055		;604c
	inc hl			;604e
	djnz L_604B		;604f
	dec c			;6051
	jr nz,L_6049		;6052
	ret			;6054
L_6055:
	ld hl,0e2f1h		;6055   ; apunta a la salida de la fase: y, x y pantalla (0xE2F3)
	call L_60BE		;6058   ; DE = el sitio en el plano: la casilla mas el sitio / 8 en cuartos de casilla
	call L_611F		;605b   ; mas el margen del plano (0x20, 0x18)
	ld hl,0e800h		;605e   ; apunta a los atributos de los sprites (y, x, dibujo, color); al cargar graficos, su bufer
	ld (hl),e			;6061
	inc hl			;6062
	ld (hl),d			;6063
	inc hl			;6064
	ld (hl),000h		;6065   ; el sprite 0, de color 11
	inc hl			;6067
	ld (hl),00fh		;6068
	ret			;606a
L_606B:
	ld hl,0e700h		;606b   ; pinta en el plano las 16 cosas de 0xE700 que haya (8 bytes cada una)
	ld b,010h		;606e
L_6070:
	ld a,(hl)			;6070
	or a			;6071
	call nz,L_607C		;6072
	ld de,00008h		;6075
	add hl,de			;6078
	djnz L_6070		;6079
	ret			;607b
L_607C:
	push hl			;607c
	push bc			;607d
	call L_6084		;607e   ; una: su pantalla y su sitio
	pop bc			;6081
	pop hl			;6082
	ret			;6083
L_6084:
	inc hl			;6084   ; una: su pantalla y su sitio
	ld a,(hl)			;6085
	inc hl			;6086
	ld (0efc0h),hl		;6087   ; guarda un dato de paso de la rutina en curso y el byte siguiente (16 bits)
	ld hl,0e788h		;608a
	ld c,007h		;608d
L_608F:
	ld b,008h		;608f
L_6091:
	cp (hl)			;6091
	jr z,L_609C		;6092
	inc hl			;6094
	djnz L_6091		;6095
	dec c			;6097
	jr nz,L_608F		;6098
	pop hl			;609a
	ret			;609b
L_609C:
	ld hl,(0efc0h)		;609c   ; su dibujo, de la tabla de 0x62CC por su posicion
	call L_60BE		;609f   ; DE = el sitio en el plano: la casilla mas el sitio / 8 en cuartos de casilla
	call L_611F		;60a2   ; mas el margen del plano (0x20, 0x18)
	ld a,b			;60a5
	rlca			;60a6
	rlca			;60a7
	and 003h		;60a8
	ld b,a			;60aa
	ld a,c			;60ab
	rra			;60ac
	rra			;60ad
	rra			;60ae
	rra			;60af
	and 00ch		;60b0
	add a,b			;60b2
	ld hl,060d5h		;60b3
	call 04094h		;60b6   ; suma A a HL (HL = HL + A)
	ld a,(hl)			;60b9
	call 053efh		;60ba   ; escribe el caracter A en la posicion D, E de la tabla de nombres
	ret			;60bd
L_60BE:
	call L_610B		;60be   ; DE = el sitio en el plano: la casilla mas el sitio / 8 en cuartos de casilla
	ld a,(hl)			;60c1
	ld c,a			;60c2
	inc hl			;60c3
	rra			;60c4
	rra			;60c5
	rra			;60c6
	and 018h		;60c7
	add a,e			;60c9
	ld e,a			;60ca
	ld a,(hl)			;60cb
	ld b,a			;60cc
	rra			;60cd
	rra			;60ce
	rra			;60cf
	and 018h		;60d0
	add a,d			;60d2
	ld d,a			;60d3
	ret			;60d4

; ----------------------------------------------------------------------
; DATOS resto_60D5: lo apuntan con el banco puesto p01:60B3 (0x60D5); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p01:60B3 (12 bytes)
;   0x60d5..0x60e1  (12 bytes)
DATA_resto_60D5:
	defb 0eah,0ebh,0ebh,0ech,0edh,0eeh,0eeh,0efh,0f0h,0f1h,0f1h,0f2h	; 60d5  ............

; ======================================================================
; CODIGO 0x60e1..0x6128  (71 bytes)
; ======================================================================


L_60E1:
	ld hl,0e788h		;60e1   ; pinta la rejilla: un recuadro por cada pantalla de la fase
	ld c,007h		;60e4
L_60E6:
	ld b,008h		;60e6
L_60E8:
	ld a,(hl)			;60e8
	or a			;60e9
	call nz,L_60F4		;60ea
	inc hl			;60ed
	djnz L_60E8		;60ee
	dec c			;60f0
	jr nz,L_60E6		;60f1
	ret			;60f3
L_60F4:
	push af			;60f4
	push bc			;60f5
	push hl			;60f6
	call L_60FE		;60f7   ; el recuadro de 0x631E
	pop hl			;60fa
	pop bc			;60fb
	pop af			;60fc
	ret			;60fd
L_60FE:
	call L_610B		;60fe   ; el recuadro de 0x631E
	call L_611F		;6101   ; mas el margen del plano (0x20, 0x18)
	ld hl,06128h		;6104
	call 04f4bh		;6107   ; lo mismo con la posicion de caracter en DE
	ret			;610a
L_610B:
	ld a,008h		;610b   ; D, E = la esquina de la casilla del plano: columna (8 - B) x 32, fila (7 - C) x 24
	sub b			;610d
	add a,a			;610e
	add a,a			;610f
	add a,a			;6110
	add a,a			;6111
	add a,a			;6112
	ld d,a			;6113
	ld a,007h		;6114
	sub c			;6116
	add a,a			;6117
	add a,a			;6118
	add a,a			;6119
	ld e,a			;611a
	add a,a			;611b
	add a,e			;611c
	ld e,a			;611d
	ret			;611e
L_611F:
	ld a,d			;611f   ; mas el margen del plano (0x20, 0x18)
	add a,020h		;6120
	ld d,a			;6122
	ld a,e			;6123
	add a,018h		;6124
	ld e,a			;6126
	ret			;6127

; ----------------------------------------------------------------------
; DATOS resto_6128: lo apuntan con el banco puesto p01:6104 (0x6128); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p01:6104 (15 bytes)
;   0x6128..0x6137  (15 bytes)
DATA_resto_6128:
	defb 0e1h,0e2h,0e2h,0e3h,0feh,0e4h,0e5h,0e5h,0e6h,0feh,0e7h,0e8h,0e8h,0e9h,0ffh	; 6128  ...............

; ======================================================================
; CODIGO 0x6137..0x624f  (280 bytes)
; ======================================================================


L_6137:
	call 041c7h		;6137   ; lee las cosas de la fase (tabla 0xAAE0 del banco 13) a 0xE600
	call L_6140		;613a   ; la palabra de la fase
	jp 04192h		;613d
L_6140:
	ld a,(0e242h)		;6140   ; la palabra de la fase
	ld hl,0aae0h		;6143
	call 04d4dh		;6146   ; HL = la palabra A de la tabla de HL
	ld ix,0e600h		;6149   ; 16 fichas de 16 bytes en 0xE600
L_614D:
	ld a,(hl)			;614d   ; cada una son 4 bytes: [tipo | pantalla][x][y][alto | variante]; 0 acaba
	ld b,a			;614e
	and a			;614f
	ret z			;6150
	rrca			;6151   ; el tipo (cifra alta)
	rrca			;6152
	rrca			;6153
	rrca			;6154
	and 00fh		;6155
	ld (ix+000h),a		;6157   ; guarda el tipo de la cosa (0: libre)
	ld a,(hl)			;615a   ; la pantalla (cifra baja), en IX+04 y en IX+09
	and 00fh		;615b
	ld (ix+004h),a		;615d   ; guarda la pantalla de la cosa
	ld (ix+009h),a		;6160   ; guarda la pantalla de la cosa al empezar
	inc hl			;6163   ; la x
	ld a,(hl)			;6164
	ld (ix+002h),a		;6165   ; guarda la y de la cosa
	inc hl			;6168
	ld a,(hl)			;6169   ; la y
	ld (ix+003h),a		;616a   ; guarda la x de la cosa
	inc hl			;616d
	ld a,(hl)			;616e   ; los 5 bits altos: IX+08
	rrca			;616f
	rrca			;6170
	rrca			;6171
	and 01fh		;6172
	ld (ix+008h),a		;6174   ; guarda el alto de la cosa
	ld a,(hl)			;6177   ; los 3 bits bajos: la variante (bit 1 de IX+07 si no es 0)
	and 007h		;6178
	jr z,L_6182		;617a
	set 1,(ix+007h)		;617c   ; pone a uno el bit 1 de las marcas de la cosa (bit 0 repintar, bit 1 su lado)
	jr L_6186		;6180
L_6182:
	res 1,(ix+007h)		;6182   ; pone a cero el bit 1 de las marcas de la cosa (bit 0 repintar, bit 1 su lado)
L_6186:
	ld b,a			;6186   ; IX+05 = variante x 3, solo en el tipo 1
	add a,a			;6187
	add a,b			;6188
	ld b,a			;6189
	ld a,(ix+000h)		;618a   ; lee el tipo de la cosa (0: libre)
	cp 001h		;618d
	jr z,L_6193		;618f
	ld b,000h		;6191
L_6193:
	ld (ix+005h),b		;6193   ; guarda el giro o paso del dibujo de la cosa
	ld (ix+006h),000h		;6196   ; la cuenta de la cosa = 0x00
	inc hl			;619a
	ld de,00010h		;619b   ; la ficha siguiente
	add ix,de		;619e
	jr L_614D		;61a0
L_61A2:
	ld c,003h		;61a2   ; marca en el mapa las cosas de 0xE600 con el valor 3
	jr L_61A8		;61a4
L_61A6:
	ld c,000h		;61a6   ; las borra del mapa (valor 0)
L_61A8:
	ld b,010h		;61a8
	ld ix,0e600h		;61aa   ; apunta a las cosas de la fase (16 x 16 bytes)
L_61AE:
	push bc			;61ae   ; las 16
	ld a,(ix+000h)		;61af   ; lee el tipo de la cosa (0: libre)
	and a			;61b2
	call nz,L_61BF		;61b3   ; el tipo 3 no se marca; el 5, segun su estado
	ld bc,00010h		;61b6
	add ix,bc		;61b9
	pop bc			;61bb
	djnz L_61AE		;61bc
	ret			;61be
L_61BF:
	cp 003h		;61bf   ; el tipo 3 no se marca; el 5, segun su estado
	ret z			;61c1
	cp 005h		;61c2
	jr nz,L_61D0		;61c4
	ld a,c			;61c6
	and a			;61c7
	jp z,09311h		;61c8
	ld a,(ix+001h)		;61cb   ; lee el paso de la cosa
	and a			;61ce
	ret nz			;61cf
L_61D0:
	ld h,(ix+003h)		;61d0   ; su sitio
	ld l,(ix+002h)		;61d3   ; lee la y de la cosa
	cp 002h		;61d6   ; el tipo 2 con variante: 8 pixeles mas abajo
	jr nz,L_61E4		;61d8
	bit 1,(ix+007h)		;61da   ; mira el bit 1 de las marcas de la cosa (bit 0 repintar, bit 1 su lado)
	jr z,L_61E4		;61de
	ld a,h			;61e0
	add a,008h		;61e1
	ld h,a			;61e3
L_61E4:
	ld a,(ix+000h)		;61e4   ; el ancho sale del tipo (tabla 0x6445)
	ld de,l624eh		;61e7
	call 04099h		;61ea   ; suma A a DE (DE = DE + A)
	ld a,(de)			;61ed
	ld d,a			;61ee
	ld a,c			;61ef
	ld b,(ix+008h)		;61f0   ; lee el alto de la cosa
	ld c,d			;61f3
	ld d,(ix+004h)		;61f4   ; lee la pantalla de la cosa
L_61F7:
	ld (0efc0h),a		;61f7   ; marca un rectangulo del mapa de la pantalla D: B filas de C casillas con el valor A
	ld a,d			;61fa
	ld (0efc1h),a		;61fb
	call 04d7ch		;61fe   ; el sitio en casillas
	ld de,03800h		;6201
	or a			;6204
	sbc hl,de		;6205
L_6207:
	push hl			;6207
	push bc			;6208
	ld b,c			;6209
L_620A:
	push hl			;620a   ; cada casilla: su byte del mapa...
	ld c,l			;620b
	srl h		;620c
	rr l		;620e
	srl h		;6210
	rr l		;6212
	ld a,l			;6214
	ld hl,(0efc1h)		;6215
	dec l			;6218
	ld h,000h		;6219
	call 05b29h		;621b   ; HL = 0xE900 + HL x 0xC0: el mapa de la pantalla HL (0-5)
	call 04094h		;621e   ; suma A a HL (HL = HL + A)
	push bc			;6221
	ld a,0fch		;6222   ; ...se borran sus dos bits...
	call L_6243		;6224   ; corre A a la casilla C & 3 del byte
	and (hl)			;6227
	ld (hl),a			;6228
	ld a,(0efc0h)		;6229   ; lee un dato de paso de la rutina en curso
	and a			;622c
	jr z,L_6234		;622d
	call L_6243		;622f   ; ...y se pone el valor
	or (hl)			;6232
	ld (hl),a			;6233
L_6234:
	pop bc			;6234
	pop hl			;6235
	inc hl			;6236
	djnz L_620A		;6237
	pop bc			;6239
	pop hl			;623a
	ld a,020h		;623b   ; la fila siguiente, 32 casillas mas
	call 04094h		;623d   ; suma A a HL (HL = HL + A)
	djnz L_6207		;6240
	ret			;6242
L_6243:
	push af			;6243   ; corre A a la casilla C & 3 del byte
	ld a,c			;6244
	and 003h		;6245
	inc a			;6247
	ld b,a			;6248
	pop af			;6249
L_624A:
	rrca			;624a
	rrca			;624b
	djnz L_624A		;624c
L_624E:
	ret			;624e

; ----------------------------------------------------------------------
; DATOS sin identificar  0x624f..0x6254  (5 bytes)
DATA_624F:
	defb 002h,001h,001h,004h,002h	; 624f

; ======================================================================
; CODIGO 0x6254..0x62ae  (90 bytes)
; ======================================================================


L_6254:
	ld ix,0e600h		;6254   ; pinta las cosas de 0xE600 de esta pantalla (tabla 0x64D9 por tipo)
	ld b,010h		;6258
L_625A:
	push bc			;625a
	ld a,(ix+000h)		;625b   ; lee el tipo de la cosa (0: libre)
	and a			;625e
	call nz,L_62C6		;625f   ; pinta la cosa, si es de esta pantalla
	ld bc,00010h		;6262
	add ix,bc		;6265
	pop bc			;6267
	djnz L_625A		;6268
	ret			;626a
L_626B:
	ld ix,0e600h		;626b   ; las del tipo 5 de esta pantalla: 0x9661
	ld b,010h		;626f
L_6271:
	push bc			;6271
	ld a,(ix+000h)		;6272   ; lee el tipo de la cosa (0: libre)
	cp 005h		;6275
	jr nz,L_6284		;6277
	ld a,(0e243h)		;6279   ; lee la pantalla de la fase (desde 1)
	cp (ix+004h)		;627c   ; compara con la pantalla de la cosa
	jr nz,L_6284		;627f
	call 0937ah		;6281   ; guarda el fondo del bloque y lo pinta
L_6284:
	ld bc,00010h		;6284
	add ix,bc		;6287
	pop bc			;6289
	djnz L_6271		;628a
	ret			;628c
L_628D:
	ld ix,0e600h		;628d   ; un cuadro de las 16 cosas de 0xE600: cada tipo, su rutina (tabla 0x64A4)
	ld b,010h		;6291
L_6293:
	push bc			;6293
	call L_62A5		;6294
	call L_62B8		;6297   ; con el bit 0 de IX+07, se repinta (tabla 0x64CF)
	ld bc,00010h		;629a
	add ix,bc		;629d
	pop bc			;629f
	djnz L_6293		;62a0
	jp 0b9efh		;62a2
L_62A5:
	ld a,(ix+000h)		;62a5   ; lee el tipo de la cosa (0: libre)
	and a			;62a8
	ret z			;62a9
	dec a			;62aa
	call 0409eh		;62ab   ; el despachador de Konami: la tabla va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_62AE: 5 destinos del despachador p00:409E (call en p01:62AB, el
;   indice en A): B800, B92B, BA3B, BA9C, 910C; lo leen p01:62AB (10 bytes)
;   0x62ae..0x62b8  (10 bytes)
DATA_tabla_62AE:
	defw 0b800h,0b92bh,0ba3bh,0ba9ch,0910ch	; 62ae

; ======================================================================
; CODIGO 0x62b8..0x62d9  (33 bytes)
; ======================================================================


L_62B8:
	ld a,(ix+007h)		;62b8   ; con el bit 0 de IX+07, se repinta (tabla 0x64CF)
	rra			;62bb
	ret nc			;62bc
	res 0,(ix+007h)		;62bd   ; pone a cero el bit 0 de las marcas de la cosa (bit 0 repintar, bit 1 su lado)
	ld hl,062d9h		;62c1
	jr L_62D0		;62c4
L_62C6:
	ld hl,062e3h		;62c6   ; pinta la cosa, si es de esta pantalla
	ld a,(0e243h)		;62c9   ; lee la pantalla de la fase (desde 1)
	cp (ix+004h)		;62cc   ; compara con la pantalla de la cosa
	ret nz			;62cf
L_62D0:
	ld a,(ix+000h)		;62d0   ; la rutina de su tipo
	and a			;62d3
	ret z			;62d4
	dec a			;62d5
	jp 0409fh		;62d6

; ----------------------------------------------------------------------
; DATOS resto_62D9: lo apuntan con el banco puesto p01:62C1 (0x62D9), p01:62C6
;   (0x62E3); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p01:62C1, p01:62C6 (20 bytes)
;   0x62d9..0x62ed  (20 bytes)
DATA_resto_62D9:
	defb 0beh,0b8h,0cbh,0b9h,05dh,0bah,06ah,062h,04fh,093h,0beh,0b8h,0cbh,0b9h,06ah,062h	; 62d9  ....].jbO.....jb
	defb 025h,0bbh,06ah,062h	; 62e9

; ======================================================================
; CODIGO 0x62ed..0x6408  (283 bytes)
; ======================================================================


L_62ED:
	ld hl,0e700h		;62ed   ; lee las cosas de 2 x 2 de la fase (tabla 0xA75D del banco 13) a 0xE700
	ld b,080h		;62f0   ; 0xE700-0xE77F a cero
	xor a			;62f2
L_62F3:
	ld (hl),a			;62f3
	inc hl			;62f4
	djnz L_62F3		;62f5
	call 041c7h		;62f7   ; pone el banco 13 en 0xA000
	call L_6300		;62fa   ; la palabra de la fase
	jp 04192h		;62fd
L_6300:
	ld a,(0e242h)		;6300   ; la palabra de la fase
	ld hl,0a75dh		;6303
	call 04d4dh		;6306   ; HL = la palabra A de la tabla de HL
	ld de,0e700h		;6309   ; apunta a la tabla de colores al cargar graficos; en la partida, las cosas de 2 x 2 de la fase (16 x 8 bytes)
L_630C:
	ld a,(hl)			;630c   ; cada una son 3 bytes: [tipo | pantalla][x][y]; 0 acaba; en 0xE700 van de 8 en 8
	and a			;630d
	ret z			;630e
	rra			;630f   ; el tipo
	rra			;6310
	rra			;6311
	rra			;6312
	and 00fh		;6313
	ld (de),a			;6315
	ld a,(hl)			;6316   ; la pantalla
	and 00fh		;6317
	inc e			;6319
	ld (de),a			;631a
	inc e			;631b
	inc hl			;631c
	ldi		;631d   ; la x y la y
	ldi		;631f
	inc e			;6321
	inc e			;6322
	inc e			;6323
	inc e			;6324
	jr L_630C		;6325
L_6327:
	ld bc,01000h		;6327   ; pinta las cosas de 0xE700 de esta pantalla
	ld ix,0e700h		;632a   ; apunta a la tabla de colores al cargar graficos; en la partida, las cosas de 2 x 2 de la fase (16 x 8 bytes)
L_632E:
	push bc			;632e
	ld a,(ix+000h)		;632f
	and a			;6332
	call nz,L_6340		;6333   ; si es de esta pantalla...
	ld de,00008h		;6336
	add ix,de		;6339
	pop bc			;633b
	inc c			;633c
	djnz L_632E		;633d
	ret			;633f
L_6340:
	ld a,(0e243h)		;6340   ; si es de esta pantalla...
	cp (ix+001h)		;6343
	ret nz			;6346
L_6347:
	ld hl,0903dh		;6347   ; ...2 x 2 caracteres de 0x9324 en su sitio
	ld e,(ix+002h)		;634a
	ld d,(ix+003h)		;634d
	ld bc,00202h		;6350
	jp 053d6h		;6353
L_6356:
	ld ix,0e500h		;6356   ; un cuadro de los 8 enemigos de 0xE500 (32 bytes cada uno)
	ld b,008h		;635a
L_635C:
	push bc			;635c
	ld a,(ix+000h)		;635d   ; lee el tipo del enemigo (0: libre)
	and a			;6360
	jr z,L_636D		;6361
	call L_6400		;6363   ; su rutina
	bit 0,(ix+006h)		;6366   ; con el bit 0 de IX+06, se mueve en una pantalla que no se ve
	call nz,L_6376		;636a   ; el movimiento fuera de la vista: en x (IX+0B 2 o 3) o en y (0 o 1)
L_636D:
	ld de,00020h		;636d
	add ix,de		;6370
	pop bc			;6372
	djnz L_635C		;6373
	ret			;6375
L_6376:
	ld a,(ix+00bh)		;6376   ; el movimiento fuera de la vista: en x (IX+0B 2 o 3) o en y (0 o 1)
	cp 002h		;6379
	jr c,L_639F		;637b
	ld l,(ix+004h)		;637d   ; la x de 16 bits mas o menos su velocidad (IX+09)
	ld h,(ix+005h)		;6380   ; lee la x del enemigo
	ld e,(ix+009h)		;6383   ; lee la velocidad en x del enemigo (fina)
	ld d,(ix+00ah)		;6386   ; lee la velocidad en x del enemigo
	jr z,L_6398		;6389
	add hl,de			;638b
	ld a,h			;638c
	cp 0f1h		;638d   ; al pasar de 0xF1: sale por la derecha
	jr nc,L_63CB		;638f
L_6391:
	ld (ix+004h),l		;6391   ; guarda la x del enemigo (fina)
	ld (ix+005h),h		;6394   ; guarda la x del enemigo
	ret			;6397
L_6398:
	and a			;6398
	sbc hl,de		;6399
	jr c,L_63C1		;639b
	jr L_6391		;639d
L_639F:
	ld l,(ix+002h)		;639f   ; la y de 16 bits mas o menos su velocidad (IX+07)
	ld h,(ix+003h)		;63a2   ; lee la y del enemigo
	ld e,(ix+007h)		;63a5   ; lee la velocidad en y del enemigo (fina)
	ld d,(ix+008h)		;63a8   ; lee la velocidad en y del enemigo
	and a			;63ab
	jr nz,L_63B4		;63ac
	sbc hl,de		;63ae
	jr c,L_63D5		;63b0
	jr L_63BA		;63b2
L_63B4:
	add hl,de			;63b4
	ld a,h			;63b5
	cp 0b1h		;63b6   ; al pasar de 0xB1: sale por abajo
	jr nc,L_63DF		;63b8
L_63BA:
	ld (ix+002h),l		;63ba   ; guarda la y del enemigo (fina)
	ld (ix+003h),h		;63bd   ; guarda la y del enemigo
	ret			;63c0
L_63C1:
	ld a,003h		;63c1   ; sale por la izquierda: aparece a la derecha (0xF0)
	call L_63E9		;63c3   ; el enemigo pasa a la pantalla de al lado (la misma busqueda que el personaje, p00:5C2F)
	ld hl,0f000h		;63c6
	jr L_6391		;63c9
L_63CB:
	ld a,004h		;63cb   ; sale por la derecha: aparece a la izquierda
	call L_63E9		;63cd   ; el enemigo pasa a la pantalla de al lado (la misma busqueda que el personaje, p00:5C2F)
	ld hl,00000h		;63d0
	jr L_6391		;63d3
L_63D5:
	ld a,001h		;63d5   ; sale por arriba: aparece abajo (0xB0)
	call L_63E9		;63d7   ; el enemigo pasa a la pantalla de al lado (la misma busqueda que el personaje, p00:5C2F)
	ld hl,0b000h		;63da
	jr L_63BA		;63dd
L_63DF:
	ld a,002h		;63df   ; sale por abajo: aparece arriba
	call L_63E9		;63e1   ; el enemigo pasa a la pantalla de al lado (la misma busqueda que el personaje, p00:5C2F)
	ld hl,00000h		;63e4
	jr L_63BA		;63e7
L_63E9:
	ld b,(ix+016h)		;63e9   ; el enemigo pasa a la pantalla de al lado (la misma busqueda que el personaje, p00:5C2F)
	call 05c2fh		;63ec
	ld (ix+016h),h		;63ef   ; IX+16 la casilla, IX+10 la pantalla
	ld (ix+010h),l		;63f2   ; guarda la pantalla del enemigo
	ld a,l			;63f5
	call 0aa90h		;63f6   ; DE = el mapa de la pantalla A
	ld (ix+00ch),e		;63f9   ; guarda el mapa de la pantalla del enemigo (bajo)
	ld (ix+00dh),d		;63fc   ; guarda el mapa de la pantalla del enemigo (alto)
	ret			;63ff
L_6400:
	ld a,(ix+000h)		;6400   ; la rutina del tipo del enemigo (tabla detras)
	dec a			;6403
	ret m			;6404
	call 0409eh		;6405   ; el despachador de Konami: la tabla va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_6408: 5 destinos del despachador p00:409E (call en p01:6405, el
;   indice en A): AAFB, AB9E, B025, B409, 6437; lo leen p01:6405 (10 bytes)
;   0x6408..0x6412  (10 bytes)
DATA_tabla_6408:
	defw 0aafbh,0ab9eh,0b025h,0b409h,06437h	; 6408

; ======================================================================
; CODIGO 0x6412..0x6447  (53 bytes)
; ======================================================================


L_6412:
	ld a,(0e243h)		;6412   ; entra en la pantalla en la que se esta: el sonido 0x2D y pasa al tipo 5
	cp (ix+010h)		;6415   ; compara con la pantalla del enemigo
	call z,042bfh		;6418   ; pide el sonido 0x2D
	ld (ix+000h),005h		;641b   ; el tipo del enemigo (0: libre) = 0x05
	xor a			;641f
	ld (ix+013h),a		;6420   ; guarda las marcas del enemigo (bit 0 mata, bit 1 se le puede matar)
	ld (ix+014h),a		;6423   ; guarda la espera del enemigo
	ld (ix+006h),a		;6426   ; guarda la marca de enemigo en movimiento
	ld a,(0f0f4h)		;6429   ; en MSX2, sus colores: 0x0A y 0x4B
	and a			;642c
	ret z			;642d
	ld (ix+01eh),00ah		;642e   ; el color del primer sprite del enemigo = 0x0A
	ld (ix+01fh),04bh		;6432   ; el color del segundo sprite del enemigo = 0x4B
	ret			;6436
L_6437:
	ld hl,06447h		;6437
	ld de,0644bh		;643a
	call 0b45bh		;643d   ; el dibujo de salida: cada 8 cuadros el siguiente de la tabla (0xFF acaba)
	jp z,L_6510		;6440
	ld (ix+011h),a		;6443   ; guarda el dibujo del enemigo (0xFF: no se ve)
	ret			;6446

; ----------------------------------------------------------------------
; DATOS resto_6447: lo apuntan con el banco puesto p01:6437 (0x6447), p01:643A
;   (0x644B); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p01:6437, p01:643A (8 bytes)
;   0x6447..0x644f  (8 bytes)
DATA_resto_6447:
	defb 015h,016h,017h,0ffh,015h,016h,016h,0ffh	; 6447  ........

; ======================================================================
; CODIGO 0x644f..0x6660  (529 bytes)
; ======================================================================


L_644F:
	call L_646E		;644f   ; los sprites de los enemigos de esta pantalla; en MSX2, sus colores a 0xD300
	ld a,(0f0f4h)		;6452   ; lee la marca de MSX2 (1 en el cartucho de MSX2, 0 en el de MSX1)
	and a			;6455
	ret z			;6456
	ld hl,0e843h		;6457
	ld de,0d300h		;645a
	ld c,010h		;645d
L_645F:
	ld a,(hl)			;645f   ; 16 colores por sprite, el color de su atributo
	ld b,010h		;6460
L_6462:
	ld (de),a			;6462
	inc de			;6463
	djnz L_6462		;6464
	inc hl			;6466
	inc hl			;6467
	inc hl			;6468
	inc hl			;6469
	dec c			;646a
	jr nz,L_645F		;646b
	ret			;646d
L_646E:
	ld ix,0e500h		;646e   ; los atributos de los sprites de los enemigos, desde 0xE840
	ld de,0e840h		;6472
	ld b,008h		;6475
	ld a,(0f0f4h)		;6477   ; en MSX1, un sprite por enemigo; en MSX2, dos
	and a			;647a
	jr z,L_64C3		;647b
L_647D:
	push bc			;647d
	ld a,(ix+000h)		;647e   ; lee el tipo del enemigo (0: libre)
	and a			;6481
	jr z,L_64B5		;6482
	ld a,(0e243h)		;6484   ; lee la pantalla de la fase (desde 1)
	cp (ix+010h)		;6487   ; compara con la pantalla del enemigo
	jr nz,L_64B5		;648a
	ld l,(ix+011h)		;648c   ; IX+11: su dibujo (0xFF: no se ve)
	ld a,l			;648f
	inc a			;6490
	jr z,L_64B5		;6491
	ld h,000h		;6493
	add hl,hl			;6495
	call 041c7h		;6496   ; pone el banco 13 en 0xA000
	ld bc,0beedh		;6499   ; de la tabla de 0xBEED (dos bytes por dibujo)
	add hl,bc			;649c
	ld c,(ix+01eh)		;649d   ; lee el color del primer sprite del enemigo
	call L_64FD		;64a0   ; un atributo: [y - 1][x][dibujo][color]
	ld c,(ix+01fh)		;64a3   ; lee el color del segundo sprite del enemigo
	call L_64FD		;64a6   ; un atributo: [y - 1][x][dibujo][color]
	call 04192h		;64a9   ; pone los bancos 1-2-3 (el juego)
L_64AC:
	ld bc,00020h		;64ac
	add ix,bc		;64af
	pop bc			;64b1
	djnz L_647D		;64b2
	ret			;64b4
L_64B5:
	ld a,0e0h		;64b5   ; fuera de la pantalla: y = 0xE0
	ld (de),a			;64b7
	inc e			;64b8
	inc e			;64b9
	inc e			;64ba
	inc e			;64bb
	ld (de),a			;64bc
	inc e			;64bd
	inc e			;64be
	inc e			;64bf
	inc e			;64c0
	jr L_64AC		;64c1
L_64C3:
	push bc			;64c3
	ld a,(ix+000h)		;64c4   ; lee el tipo del enemigo (0: libre)
	and a			;64c7
	jr z,L_64F4		;64c8
	ld a,(0e243h)		;64ca   ; lee la pantalla de la fase (desde 1)
	cp (ix+010h)		;64cd   ; compara con la pantalla del enemigo
	jr nz,L_64F4		;64d0
	ld l,(ix+011h)		;64d2   ; lee el dibujo del enemigo (0xFF: no se ve)
	ld a,l			;64d5
	inc a			;64d6
	jr z,L_64F4		;64d7
	ld h,000h		;64d9
	call 041c7h		;64db   ; pone el banco 13 en 0xA000
	ld bc,0becfh		;64de   ; en MSX1, de la tabla 0xBECF (un byte)
	add hl,bc			;64e1
	ld c,(ix+01eh)		;64e2   ; lee el color del primer sprite del enemigo
	call L_64FD		;64e5   ; un atributo: [y - 1][x][dibujo][color]
	call 04192h		;64e8   ; pone los bancos 1-2-3 (el juego)
L_64EB:
	ld bc,00020h		;64eb
	add ix,bc		;64ee
	pop bc			;64f0
	djnz L_64C3		;64f1
	ret			;64f3
L_64F4:
	ld a,0e0h		;64f4
	ld (de),a			;64f6
	inc e			;64f7
	inc e			;64f8
	inc e			;64f9
	inc e			;64fa
	jr L_64EB		;64fb
L_64FD:
	ld a,(ix+003h)		;64fd   ; un atributo: [y - 1][x][dibujo][color]
	dec a			;6500
	ld (de),a			;6501
	inc e			;6502
	ld a,(ix+005h)		;6503   ; lee la x del enemigo
	ld (de),a			;6506
	inc e			;6507
	ld a,(hl)			;6508
	ld (de),a			;6509
	inc hl			;650a
	inc e			;650b
	ld a,c			;650c
	ld (de),a			;650d
	inc e			;650e
	ret			;650f
L_6510:
	xor a			;6510   ; el enemigo se va: su sitio de salida (0xE2C0 + 5 x IX+15) se marca para que salga otro
	ld (ix+000h),a		;6511
	ld (ix+013h),a		;6514
	ld a,(ix+015h)		;6517
	ld c,a			;651a
	add a,a			;651b
	add a,a			;651c
	add a,c			;651d
	ld hl,0e2c0h		;651e   ; apunta a los sitios de los que salen los enemigos (8 x 5 bytes)
	call 04094h		;6521   ; suma A a HL (HL = HL + A)
	set 7,(hl)		;6524
	ret			;6526
L_6527:
	ld a,(0e203h)		;6527   ; cada 4 cuadros, los 8 sitios de salida de 0xE2C0
	and 003h		;652a
	ret nz			;652c
	ld hl,0e2c0h		;652d   ; apunta a los sitios de los que salen los enemigos (8 x 5 bytes)
	ld bc,00800h		;6530
L_6533:
	push bc			;6533
	push hl			;6534
	bit 7,(hl)		;6535   ; con el bit 7, su cuenta baja...
	jr z,L_654E		;6537
	inc hl			;6539
	dec (hl)			;653a
	jr nz,L_654E		;653b   ; ...y al acabar sale un enemigo nuevo (0xAC6D) y la cuenta vuelve a 0x30
	ld b,c			;653d
	dec hl			;653e
	res 7,(hl)		;653f
	ld c,(hl)			;6541
	inc hl			;6542
	ld (hl),030h		;6543
	inc hl			;6545
	ld a,(hl)			;6546
	inc hl			;6547
	ld e,(hl)			;6548
	inc hl			;6549
	ld d,(hl)			;654a
	call 0a9e8h		;654b   ; crea un enemigo del tipo C (1-4) en (E, D) de la pantalla A, si hay ficha libre en 0xE500
L_654E:
	pop hl			;654e
	pop bc			;654f
	inc hl			;6550
	inc hl			;6551
	inc hl			;6552
	inc hl			;6553
	inc hl			;6554
	inc c			;6555
	djnz L_6533		;6556
	ret			;6558
L_6559:
	call 041c7h		;6559   ; lee los sitios de salida de la fase (tabla 0xB7CD del banco 13) a 0xE2C0
	ld hl,0e2c0h		;655c   ; 0xE2C0-0xE2E7 a cero
	ld b,028h		;655f
	xor a			;6561
L_6562:
	ld (hl),a			;6562
	inc hl			;6563
	djnz L_6562		;6564
	ld hl,0b7cdh		;6566
	ld a,(0e242h)		;6569   ; lee la fase (1-60)
	call 04d4dh		;656c   ; HL = la palabra A de la tabla de HL
	ld de,0e2c0h		;656f   ; apunta a los sitios de los que salen los enemigos (8 x 5 bytes)
L_6572:
	ld a,(hl)			;6572   ; cada uno son 4 bytes: [tipo] y 3 mas; un 0 acaba
	inc hl			;6573
	and a			;6574
	jp z,04192h		;6575
	or 080h		;6578   ; el tipo con el bit 7: listo para salir
	ld (de),a			;657a
	inc e			;657b
	ld a,014h		;657c   ; su cuenta: 0x14
	ld (de),a			;657e
	inc e			;657f
	ldi		;6580
	ldi		;6582
	ldi		;6584
	jr L_6572		;6586
L_6588:
	call 04ec7h		;6588   ; el menu de grabar y cargar (estado 3): el letrero de 0xB185
	call 041bdh		;658b   ; pone el banco 12 en 0xA000
	ld hl,0b185h		;658e
	call 04f0bh		;6591   ; pinta un letrero: [D][E] y caracteres; 0xFE trae otra posicion; 0xFF acaba
	call 04192h		;6594   ; pone los bancos 1-2-3 (el juego)
	xor a			;6597   ; lo elegido: 0
	ld (0e24bh),a		;6598
	jp L_65F6		;659b
L_659E:
	call 0564ah		;659e   ; un cuadro del menu: arriba y abajo mueven la flecha, disparo elige
	ld hl,0e24bh		;65a1
	ld a,(0e207h)		;65a4   ; lee el mando: lo que se acaba de pulsar
	rra			;65a7
	jr c,L_65B8		;65a8
	rra			;65aa
	jr c,L_65C4		;65ab
	rra			;65ad
	rra			;65ae
	rra			;65af
	jr nc,L_65CF		;65b0
	ld a,001h		;65b2   ; elegido: 0xE24A = 1
	ld (0e24ah),a		;65b4   ; guarda lo elegido en el menu
	ret			;65b7
L_65B8:
	call 042d3h		;65b8   ; arriba: el sonido 0x32 y la opcion anterior (de 0 a 2)
	dec (hl)			;65bb
	ld a,(hl)			;65bc
	rla			;65bd
	jr nc,L_65CF		;65be
	ld (hl),002h		;65c0
	jr L_65CF		;65c2
L_65C4:
	call 042d3h		;65c4   ; abajo: la siguiente
	inc (hl)			;65c7
	ld a,(hl)			;65c8
	cp 003h		;65c9
	jr c,L_65CF		;65cb
	ld (hl),000h		;65cd
L_65CF:
	ld a,(hl)			;65cf   ; la flecha (sprite 0) en la fila de la opcion
	add a,a			;65d0
	add a,a			;65d1
	add a,a			;65d2
	add a,a			;65d3
	add a,050h		;65d4
	ld hl,0e800h		;65d6   ; apunta a los atributos de los sprites (y, x, dibujo, color); al cargar graficos, su bufer
	ld (hl),a			;65d9
	inc hl			;65da
	ld (hl),050h		;65db
	inc hl			;65dd
	ld (hl),014h		;65de
	inc hl			;65e0
	ld (hl),008h		;65e1
	ld a,(0f0f4h)		;65e3   ; lee la marca de MSX2 (1 en el cartucho de MSX2, 0 en el de MSX1)
	and a			;65e6
	ret z			;65e7
	ld hl,0d200h		;65e8   ; en MSX2, de color 7
	ld de,0d201h		;65eb
	ld (hl),007h		;65ee
	ld bc,0000fh		;65f0
	ldir		;65f3
	ret			;65f5
L_65F6:
	call 041bdh		;65f6   ; el dibujo de la flecha, 32 bytes de 0xB1B6 (en 0xF8A0 en MSX2, 0x18A0 en MSX1)
	ld a,(0f0f4h)		;65f9   ; lee la marca de MSX2 (1 en el cartucho de MSX2, 0 en el de MSX1)
	and a			;65fc
	ld de,018a0h		;65fd
	jr z,L_6605		;6600
	ld de,0f8a0h		;6602
L_6605:
	ld hl,0b1b6h		;6605
	ld bc,00020h		;6608
	call 04e06h		;660b   ; escribe BC bytes en la VRAM (LDIRVM) sin tocar registros
	jp 04192h		;660e
L_6611:
	call 04ec7h		;6611   ; la entrada (opcion 0 del menu, antes de empezar): graficos y paleta
	call 056d8h		;6614   ; los de la lista 0x8175
	call 05854h		;6617   ; los mismos con 0x86BC, 0x871B y 0x8778
	call 05b38h		;661a   ; los atributos de los sprites (0xE800, 0x80 bytes) a 0xE0: fuera de la pantalla
	ld a,004h		;661d
	call 05758h		;661f   ; 32 columnas de la tabla de 0x9D58 desde la 4
	xor a			;6622   ; 0xE257 = 0: el paso de la entrada
	ld (0e257h),a		;6623   ; guarda el paso de la secuencia en curso (entrada, fase o piramide acabada)
	ld (0edcch),a		;6626   ; guarda la x del personaje de las secuencias
	ld (0edc9h),a		;6629
	ld (0edceh),a		;662c
	inc a			;662f
	ld (0edd8h),a		;6630
	ld a,0e0h		;6633
	ld (0edcbh),a		;6635   ; guarda la y del personaje de las secuencias
	ret			;6638
L_6639:
	ld a,(0e257h)		;6639   ; un cuadro de la entrada; con disparo se salta
	cp 009h		;663c
	jr nc,L_6648		;663e
	ld a,(0e207h)		;6640   ; lee el mando: lo que se acaba de pulsar
	and 010h		;6643
	jp nz,L_6752		;6645
L_6648:
	call L_6656		;6648   ; el paso; en los primeros (hasta 9) tambien 0x7786
	ld a,(0e257h)		;664b   ; lee el paso de la secuencia en curso (entrada, fase o piramide acabada)
	cp 008h		;664e
	call c,L_74A1		;6650   ; el personaje de las secuencias: cuatro sprites desde 0xE810 con los dibujos de la tabla 0x74E2
	jp 0564ah		;6653
L_6656:
	ld hl,0edc9h		;6656   ; cada paso, su rutina (tabla detras)
	inc (hl)			;6659
	ld a,(0e257h)		;665a   ; lee el paso de la secuencia en curso (entrada, fase o piramide acabada)
	call 0409eh		;665d   ; el despachador de Konami: la tabla va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_6660: 11 destinos del despachador p00:409E (call en p01:665D, el
;   indice en A): 6676, 6684, 6690, 66AD, 66F7, 6710, 671F, 672D, 6740, 674D,
;   6772; lo leen p01:665D (22 bytes)
;   0x6660..0x6676  (22 bytes)
DATA_tabla_6660:
	defw 06676h,06684h,06690h,066adh,066f7h,06710h,0671fh,0672dh	; 6660
	defw 06740h,0674dh,06772h	; 6670  -> L_6740 L_674D L_6772

; ======================================================================
; CODIGO 0x6676..0x66d9  (99 bytes)
; ======================================================================


L_6676:
	call 05b38h		;6676   ; espera 0x10 cuadros
	ld a,010h		;6679
L_667B:
	ld hl,0e204h		;667b   ; apunta a la espera del paso (en cuadros)
	ld (hl),a			;667e
L_667F:
	ld hl,0e257h		;667f   ; el paso siguiente
	inc (hl)			;6682
	ret			;6683
L_6684:
	ld hl,0e204h		;6684   ; apunta a la espera del paso (en cuadros)
	dec (hl)			;6687
	ret nz			;6688
	ld a,09fh		;6689
	ld (0edcbh),a		;668b   ; guarda la y del personaje de las secuencias
	jr L_667F		;668e
L_6690:
	call L_7485		;6690   ; cada dos cuadros 0xEDCC sube hasta 0x60
	ld a,(0edc9h)		;6693
	rra			;6696
	ret c			;6697
	ld hl,0edcch		;6698   ; apunta a la x del personaje de las secuencias
	inc (hl)			;669b
	ld a,(hl)			;669c
	cp 060h		;669d
	ret c			;669f
	ld a,001h		;66a0
	ld (0edd8h),a		;66a2
	ld a,0ffh		;66a5
	ld (0edceh),a		;66a7
	jp L_667F		;66aa
L_66AD:
	ld a,(0edc9h)		;66ad   ; 0xEDCB se mueve por la tabla de 0x68DD (30 pasos)
	rra			;66b0
	ret c			;66b1
	ld hl,0edceh		;66b2
	inc (hl)			;66b5
	ld a,(hl)			;66b6
	cp 01eh		;66b7
	jr nc,L_66CD		;66b9
	ld hl,066d9h		;66bb
	call 04094h		;66be   ; suma A a HL (HL = HL + A)
	ld a,(0edcbh)		;66c1   ; lee la y del personaje de las secuencias
	add a,(hl)			;66c4
	ld (0edcbh),a		;66c5   ; guarda la y del personaje de las secuencias
	ld hl,0edcch		;66c8   ; apunta a la x del personaje de las secuencias
	inc (hl)			;66cb
	ret			;66cc
L_66CD:
	ld a,097h		;66cd
	ld (0edcbh),a		;66cf   ; guarda la y del personaje de las secuencias
	ld a,002h		;66d2
	ld (0edd8h),a		;66d4
	jr L_667F		;66d7

; ----------------------------------------------------------------------
; DATOS resto_66D9: lo apuntan con el banco puesto p01:66BB (0x66D9); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p01:66BB (30 bytes)
;   0x66d9..0x66f7  (30 bytes)
DATA_resto_66D9:
	defb 0fdh,0fdh,0fdh,0fdh,0feh,0feh,0feh,0feh,0feh,0ffh,0ffh,0ffh,0ffh,000h,000h,000h	; 66d9  ................
	defb 000h,000h,000h,001h,001h,001h,001h,002h,002h,002h,002h,002h,003h,003h	; 66e9  ..............

; ======================================================================
; CODIGO 0x66f7..0x6800  (265 bytes)
; ======================================================================


L_66F7:
	call L_7485		;66f7   ; 0xEDCC sigue hasta 0xD8
	ld a,(0edc9h)		;66fa
	rra			;66fd
	ret c			;66fe
	ld hl,0edcch		;66ff   ; apunta a la x del personaje de las secuencias
	inc (hl)			;6702
	ld a,(hl)			;6703
	cp 0d8h		;6704
	ret c			;6706
	xor a			;6707
	ld (0edd8h),a		;6708
	ld a,010h		;670b
	jp L_667B		;670d
L_6710:
	ld hl,0e204h		;6710   ; apunta a la espera del paso (en cuadros)
	dec (hl)			;6713
	ret nz			;6714
	ld a,006h		;6715
	ld (0edd8h),a		;6717
	ld a,030h		;671a
	jp L_667B		;671c
L_671F:
	ld hl,0e204h		;671f   ; apunta a la espera del paso (en cuadros)
	dec (hl)			;6722
	ret nz			;6723
	xor a			;6724
	ld (0edd8h),a		;6725
	ld a,010h		;6728
	jp L_667B		;672a
L_672D:
	ld hl,0e204h		;672d   ; apunta a la espera del paso (en cuadros)
	dec (hl)			;6730
	ret nz			;6731
	call 05b38h		;6732   ; los atributos de los sprites (0xE800, 0x80 bytes) a 0xE0: fuera de la pantalla
	ld a,001h		;6735
	call 053f9h		;6737   ; prepara un fundido: la lista 0x9422 + 5 x A
	call 0550bh		;673a   ; un cuadro del fundido de salida, por pasos
	jp L_667F		;673d
L_6740:
	call 0550bh		;6740   ; un cuadro del fundido de salida, por pasos
	ld a,(0edd4h)		;6743
	or a			;6746
	ret nz			;6747
	ld a,020h		;6748
	jp L_667B		;674a
L_674D:
	ld hl,0e204h		;674d   ; apunta a la espera del paso (en cuadros)
	dec (hl)			;6750
	ret nz			;6751
L_6752:
	call 04ec7h		;6752   ; la pantalla de la contrasena: el dibujo de 0xA358 y el letrero
	call 04eeah		;6755   ; los atributos de los sprites (0x3B00, 0x80 bytes) a 0xE0: fuera de la pantalla
	call 05b38h		;6758   ; los atributos de los sprites (0xE800, 0x80 bytes) a 0xE0: fuera de la pantalla
	ld de,05040h		;675b
	call 056edh		;675e   ; 12 x 12 caracteres de 0xA358 en (D, E)
	ld hl,0ac01h		;6761
	call L_73E5		;6764   ; pinta el letrero de HL del banco 12
	ld a,0c0h		;6767
	ld (0e204h),a		;6769   ; guarda la espera del paso (en cuadros)
	ld a,00ah		;676c
	ld (0e257h),a		;676e   ; guarda el paso de la secuencia en curso (entrada, fase o piramide acabada)
	ret			;6771
L_6772:
	ld hl,0e204h		;6772   ; espera y vuelve
	dec (hl)			;6775
	ret nz			;6776
	ld a,001h		;6777
	ld (0e24ah),a		;6779   ; guarda lo elegido en el menu
	ret			;677c
L_677D:
	call L_6795		;677d   ; la contrasena: se calcula y se pinta
	ld a,0ffh		;6780
	ld (0ede1h),a		;6782
	ld hl,06800h		;6785
	call 04f0bh		;6788   ; pinta un letrero: [D][E] y caracteres; 0xFE trae otra posicion; 0xFF acaba
	ld de,05ca0h		;678b
	ld hl,0edd9h		;678e
	call 04f15h		;6791
	ret			;6794
L_6795:
	ld de,0ede2h		;6795   ; la contrasena: la fase, las vidas y un numero al azar (el registro R)...
	ld a,(0e242h)		;6798   ; lee la fase (1-60)
	ld (de),a			;679b
	inc de			;679c
	ld h,a			;679d
	ld a,(0e240h)		;679e   ; lee las vidas (BCD)
	ld (de),a			;67a1
	inc de			;67a2
	ld l,a			;67a3
	ld a,r		;67a4   ; ...el azar dice cuantas vueltas se da a la fase y las vidas
	ld (de),a			;67a6
	ld c,a			;67a7
	and 007h		;67a8
	jr z,L_67B8		;67aa
	ld b,a			;67ac
L_67AD:
	rr h		;67ad
	rr l		;67af
	jr nc,L_67B5		;67b1
	set 7,h		;67b3
L_67B5:
	or a			;67b5
	djnz L_67AD		;67b6
L_67B8:
	ld de,0edd9h		;67b8   ; cada byte, dos letras
	ld a,h			;67bb
	ld (0ede5h),a		;67bc
	call L_67E1		;67bf   ; dos letras de A: una por cifra
	ld h,l			;67c2
	ld a,h			;67c3
	ld (0ede6h),a		;67c4
	call L_67E1		;67c7   ; dos letras de A: una por cifra
	ld h,c			;67ca
	ld a,h			;67cb
	ld (0ede7h),a		;67cc
	call L_67E1		;67cf   ; dos letras de A: una por cifra
	ld hl,0ede5h		;67d2   ; y la suma de los tres, de control
	ld a,(hl)			;67d5
	inc hl			;67d6
	add a,(hl)			;67d7
	inc hl			;67d8
	add a,(hl)			;67d9
	inc hl			;67da
	ld (hl),a			;67db
	ld h,a			;67dc
	call L_67E1		;67dd   ; dos letras de A: una por cifra
	ret			;67e0
L_67E1:
	ld a,h			;67e1   ; dos letras de A: una por cifra
	rrca			;67e2
	rrca			;67e3
	rrca			;67e4
	rrca			;67e5
	and 00fh		;67e6
	call L_67F6		;67e8   ; la letra de la cifra: 0xE1 + la cifra
	ld (de),a			;67eb
	inc de			;67ec
	ld a,h			;67ed
	and 00fh		;67ee
	call L_67F6		;67f0   ; la letra de la cifra: 0xE1 + la cifra
	ld (de),a			;67f3
	inc de			;67f4
	ret			;67f5
L_67F6:
	ld b,0e1h		;67f6   ; la letra de la cifra: 0xE1 + la cifra
	cp 019h		;67f8
	jr c,L_67FE		;67fa
	ld b,0d1h		;67fc
L_67FE:
	add a,b			;67fe
	ret			;67ff

; ----------------------------------------------------------------------
; DATOS resto_6800: lo apuntan con el banco puesto p01:6785 (0x6800); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p01:6785 (12 bytes)
;   0x6800..0x680c  (12 bytes)
DATA_resto_6800:
	defb 058h,090h,0f0h,0e1h,0f3h,0f3h,000h,0f7h,0efh,0f2h,0e4h,0ffh	; 6800  X...........

; ======================================================================
; CODIGO 0x680c..0x6958  (332 bytes)
; ======================================================================


L_680C:
	call 04ec7h		;680c   ; la pantalla de meter la contrasena: 0xEDD9-0xEDFE a cero y el letrero de 0xBE91
	call L_76FA		;680f   ; las rachas de 0xBBFC a 0x1880 (los sprites del editor)
	ld hl,0edd9h		;6812
	ld de,0eddah		;6815
	ld bc,00025h		;6818
	ld (hl),a			;681b
	ldir		;681c
	ld a,020h		;681e   ; 0xEDEE = 0x20
	ld (0edeeh),a		;6820
	xor a			;6823
	ld (0e207h),a		;6824   ; guarda el mando: lo que se acaba de pulsar
	call 041c7h		;6827   ; pone el banco 13 en 0xA000
	ld hl,0be91h		;682a
	call 04f0bh		;682d   ; pinta un letrero: [D][E] y caracteres; 0xFE trae otra posicion; 0xFF acaba
	jp 04192h		;6830
L_6833:
	call 0564ah		;6833   ; un cuadro de la contrasena; tras el letrero de bien o mal, una espera (0xEDEC) y se sale con 0xEDED
	ld hl,0edebh		;6836
	ld a,(hl)			;6839
	or a			;683a
	jr z,L_684B		;683b
	inc hl			;683d
	dec (hl)			;683e
	ret nz			;683f
	inc hl			;6840
	ld a,(hl)			;6841
	ld (0e24ah),a		;6842   ; guarda lo elegido en el menu
	ld hl,0edebh		;6845
	ld (hl),000h		;6848
	ret			;684a
L_684B:
	call L_6968		;684b   ; la flecha y las teclas
	ld hl,0edefh		;684e
	ld a,(0e207h)		;6851   ; izquierda y derecha mueven la letra en la que se escribe (0xEDEF, de 0 a 7)
	rra			;6854
	rra			;6855
	rra			;6856
	jp c,L_6980		;6857
	rra			;685a
	jp c,L_6987		;685b
	call L_6A2F		;685e   ; el teclado entero a 0xEDF0
	call L_698F		;6861   ; la letra que se ha pulsado
	ld a,(0ededh)		;6864
	or a			;6867
	jr z,L_686D		;6868
	call L_6A02		;686a   ; una letra nueva: se pinta y se pasa a la siguiente
L_686D:
	ld a,(0edf7h)		;686d   ; sin RETURN (bit 7 de 0xEDF7) no se comprueba
	rla			;6870
	ret c			;6871
	ld hl,0edd9h		;6872   ; las 8 letras a valores: las 0xE1-... dan 0-..., las 0xD0-0xD9 tambien
	ld b,008h		;6875
L_6877:
	ld a,(hl)			;6877
	ld d,0e1h		;6878
	cp d			;687a
	jr nc,L_687F		;687b
	ld d,0d0h		;687d
L_687F:
	sub d			;687f
	ld (hl),a			;6880
	inc hl			;6881
	djnz L_6877		;6882
	call L_6925		;6884   ; primero las dos contrasenas especiales
	jp z,L_68F9		;6887
	ld hl,0edd9h		;688a   ; ninguna letra puede ser 0 ni pasar de 15
	ld b,007h		;688d
	ld a,(hl)			;688f
	inc hl			;6890
L_6891:
	add a,(hl)			;6891
	inc hl			;6892
	djnz L_6891		;6893
	or a			;6895
	jp z,L_6906		;6896
	ld hl,0edd9h		;6899
	ld b,008h		;689c
L_689E:
	ld a,(hl)			;689e
	or a			;689f
	jr c,L_6906		;68a0
	cp 010h		;68a2
	jr nc,L_6906		;68a4
	inc hl			;68a6
	djnz L_689E		;68a7
	ld hl,0ede2h		;68a9   ; la cuarta pareja de letras es la suma de las tres primeras
	ld a,(hl)			;68ac
	inc hl			;68ad
	add a,(hl)			;68ae
	inc hl			;68af
	add a,(hl)			;68b0
	inc hl			;68b1
	cp (hl)			;68b2
	jr nz,L_6906		;68b3
	ld hl,0edd9h		;68b5   ; cada pareja de letras, un byte
	ld de,0ede2h		;68b8
	ld b,004h		;68bb
L_68BD:
	ld a,(hl)			;68bd
	inc hl			;68be
	rlca			;68bf
	rlca			;68c0
	rlca			;68c1
	rlca			;68c2
	and 0f0h		;68c3
	or (hl)			;68c5
	inc hl			;68c6
	ld (de),a			;68c7
	inc de			;68c8
	djnz L_68BD		;68c9
	ld hl,0ede2h		;68cb   ; D = la fase, E = las vidas, con las vueltas que diga el tercer byte
	ld d,(hl)			;68ce
	inc hl			;68cf
	ld e,(hl)			;68d0
	inc hl			;68d1
	ld a,(hl)			;68d2
	and 007h		;68d3
	ld b,a			;68d5
L_68D6:
	rl e		;68d6   ; se les quitan las vueltas que dio p01:6795
	rl d		;68d8
	jr nc,L_68DE		;68da
	set 0,e		;68dc
L_68DE:
	or a			;68de
	djnz L_68D6		;68df
	ld a,d			;68e1   ; la fase no puede pasar de 60
	cp 03dh		;68e2
	jr nc,L_6906		;68e4
	push de			;68e6
	call 04c02h		;68e7   ; partida nueva con esa fase y esas vidas
	pop de			;68ea
	ld a,d			;68eb
	or a			;68ec
	jr z,L_6906		;68ed
	ld (0e242h),a		;68ef   ; guarda la fase (1-60)
	ld a,e			;68f2
	or a			;68f3
	jr z,L_6906		;68f4
	ld (0e240h),a		;68f6   ; guarda las vidas (BCD)
L_68F9:
	ld hl,0edebh		;68f9   ; bien: el letrero de 0xBEBE y 0xEDEE = 1
	inc (hl)			;68fc
	inc hl			;68fd
	inc hl			;68fe
	ld (hl),001h		;68ff
	ld hl,0bebeh		;6901
	jr L_6911		;6904
L_6906:
	ld hl,0edebh		;6906   ; mal: el letrero de 0xBEAD y 0xEDEE = 2
	inc (hl)			;6909
	inc hl			;690a
	inc hl			;690b
	ld (hl),002h		;690c
	ld hl,0beadh		;690e
L_6911:
	call 041c7h		;6911   ; pone el banco 13 en 0xA000
	call 04f0bh		;6914   ; pinta un letrero: [D][E] y caracteres; 0xFE trae otra posicion; 0xFF acaba
	call 04192h		;6917   ; pone los bancos 1-2-3 (el juego)
	call 05b38h		;691a   ; los atributos de los sprites (0xE800, 0x80 bytes) a 0xE0: fuera de la pantalla
	ld hl,0edebh		;691d
	inc (hl)			;6920
	inc hl			;6921
	ld (hl),080h		;6922
	ret			;6924
L_6925:
	ld de,06958h		;6925   ; las contrasenas especiales: FESTIVAL (0x6B57) y TRYAGAIN (0x6B5F)
	call L_6948		;6928   ; compara las 8 letras con las de DE (en ASCII, A = 0)
	jr z,L_693E		;692b
	ld de,06960h		;692d
	call L_6948		;6930   ; compara las 8 letras con las de DE (en ASCII, A = 0)
	ret nz			;6933
	call 04c02h		;6934   ; TRYAGAIN: partida nueva y 0xE217 = 1 (se puede seguir tras el fin de la partida)
	ld a,001h		;6937
	ld (0e217h),a		;6939   ; guarda la marca de TRYAGAIN (se puede seguir tras el fin de la partida)
	xor a			;693c
	ret			;693d
L_693E:
	call 04c02h		;693e   ; FESTIVAL: partida nueva y 0xE255 = 1
	ld a,001h		;6941
	ld (0e255h),a		;6943   ; guarda la marca de FESTIVAL (invencible: p02:9AB1 no mira los enemigos)
	xor a			;6946
	ret			;6947
L_6948:
	ld hl,0edd9h		;6948   ; compara las 8 letras con las de DE (en ASCII, A = 0)
	ld b,008h		;694b
L_694D:
	ld a,(de)			;694d
	sub 041h		;694e
	cp (hl)			;6950
	ret nz			;6951
	inc hl			;6952
	inc de			;6953
	djnz L_694D		;6954
	xor a			;6956
	ret			;6957

; ----------------------------------------------------------------------
; DATOS resto_6958: lo apuntan con el banco puesto p01:6925 (0x6958), p01:692D
;   (0x6960); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p01:6925, p01:692D (16 bytes)
;   0x6958..0x6968  (16 bytes)
DATA_resto_6958:
	defb 046h,045h,053h,054h,049h,056h,041h,04ch,054h,052h,059h,041h,047h,041h,049h,04eh	; 6958  FESTIVALTRYAGAIN

; ======================================================================
; CODIGO 0x6968..0x6a27  (191 bytes)
; ======================================================================


L_6968:
	ld hl,0e800h		;6968   ; la flecha debajo de la letra 0xEDEF (x de la tabla 0x6C26)
	ld (hl),06fh		;696b
	inc hl			;696d
	ld a,(0edefh)		;696e
	ld de,06a27h		;6971
	call 04099h		;6974   ; suma A a DE (DE = DE + A)
	ld a,(de)			;6977
	ld (hl),a			;6978
	inc hl			;6979
	ld (hl),020h		;697a
	inc hl			;697c
	jp 08598h		;697d
L_6980:
	ld a,(hl)			;6980   ; izquierda: la letra anterior
	and a			;6981
	ret z			;6982
	dec (hl)			;6983
	jp 042d3h		;6984
L_6987:
	ld a,(hl)			;6987   ; derecha: la siguiente (hasta la 7)
	cp 007h		;6988
	ret nc			;698a
	inc (hl)			;698b
	jp 042d3h		;698c
L_698F:
	ld a,(0edf0h)		;698f   ; que tecla se ha pulsado: las filas 0-1 (cifras), 5-6 (letras)...
	ld bc,008d0h		;6992
L_6995:
	rra			;6995
	jr nc,L_69C3		;6996
	inc c			;6998
	djnz L_6995		;6999
	ld a,(0edf1h)		;699b
	ld b,002h		;699e
L_69A0:
	rra			;69a0
	jr nc,L_69C3		;69a1
	inc c			;69a3
	djnz L_69A0		;69a4
	ld a,(0edf9h)		;69a6
	ld b,005h		;69a9
	ld c,0d0h		;69ab
	rra			;69ad
	rra			;69ae
	rra			;69af
L_69B0:
	rra			;69b0
	jr nc,L_69C3		;69b1
	inc c			;69b3
	djnz L_69B0		;69b4
	ld a,(0edfah)		;69b6
	ld b,005h		;69b9
L_69BB:
	rra			;69bb
	jr nc,L_69C3		;69bc
	inc c			;69be
	djnz L_69BB		;69bf
	jr L_69C6		;69c1
L_69C3:
	ld a,c			;69c3
	jr L_69F5		;69c4
L_69C6:
	ld a,(0edf8h)		;69c6   ; ...o el espacio; con nada, 0xE0
	rra			;69c9
	jr c,L_69D0		;69ca
	ld a,0e0h		;69cc
	jr L_69F5		;69ce
L_69D0:
	ld a,(0edf2h)		;69d0
	ld d,0e2h		;69d3
	rla			;69d5
	jr nc,L_69F4		;69d6
	ld d,0e1h		;69d8
	rla			;69da
	jr nc,L_69F4		;69db
	ld hl,0edf3h		;69dd
	ld d,0e3h		;69e0
	ld c,003h		;69e2
L_69E4:
	ld b,008h		;69e4
	ld a,(hl)			;69e6
L_69E7:
	rra			;69e7
	jr nc,L_69F4		;69e8
	inc d			;69ea
	djnz L_69E7		;69eb
	inc hl			;69ed
	dec c			;69ee
	jr nz,L_69E4		;69ef
	xor a			;69f1
	jr L_69F5		;69f2
L_69F4:
	ld a,d			;69f4
L_69F5:
	ld hl,0edeeh		;69f5   ; solo cuenta si no estaba ya pulsada (0xEDEE)
	ld c,(hl)			;69f8
	ld (hl),a			;69f9
	cp c			;69fa
	jr nz,L_69FE		;69fb
	xor a			;69fd
L_69FE:
	ld (0ededh),a		;69fe
	ret			;6a01
L_6A02:
	ld a,(0edefh)		;6a02   ; pinta la letra 0xEDED en su sitio y la guarda en 0xEDD9 + n
	ld hl,06a27h		;6a05
	call 04094h		;6a08   ; suma A a HL (HL = HL + A)
	ld d,(hl)			;6a0b
	ld e,070h		;6a0c
	ld a,(0ededh)		;6a0e
	call 053efh		;6a11   ; escribe el caracter A en la posicion D, E de la tabla de nombres
	ld a,(0edefh)		;6a14
	ld hl,0edd9h		;6a17
	call 04094h		;6a1a   ; suma A a HL (HL = HL + A)
	ld a,(0ededh)		;6a1d
	ld (hl),a			;6a20
	ld hl,0edefh		;6a21
	jp L_6987		;6a24

; ----------------------------------------------------------------------
; DATOS resto_6A27: lo apuntan con el banco puesto p01:6971 (0x6A27), p01:6A05
;   (0x6A27); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p01:6971, p01:6A05 (8 bytes)
;   0x6a27..0x6a2f  (8 bytes)
DATA_resto_6A27:
	defb 060h,068h,070h,078h,080h,088h,090h,098h	; 6a27  `hpx....

; ======================================================================
; CODIGO 0x6a2f..0x6a6e  (63 bytes)
; ======================================================================


L_6A2F:
	ld hl,0edfah		;6a2f   ; lee las 11 filas del teclado a 0xEDF0-0xEDFA
	ld b,00bh		;6a32
L_6A34:
	ld a,b			;6a34
	dec a			;6a35
	call 00141h		;6a36   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	ld (hl),a			;6a39
	dec hl			;6a3a
	djnz L_6A34		;6a3b
	ret			;6a3d
L_6A3E:
	ld a,(0fd9ah)		;6a3e
	ld (0f0e4h),a		;6a41
	ld a,0c9h		;6a44
	ld (0fd9ah),a		;6a46
	call L_6A86		;6a49   ; la cabecera para el Game Master 2 en 0xEE00: el nombre de 0xE270 (5 bytes)...
	call L_6AA8		;6a4c   ; graba: abre el fichero (orden 0), lo prepara (2) y escribe los seis trozos (9)
	ld a,(0f0e4h)		;6a4f
	ld (0fd9ah),a		;6a52
	ret			;6a55
L_6A56:
	ld a,(0fd9ah)		;6a56
	ld (0f0e4h),a		;6a59
	ld a,0c9h		;6a5c
	ld (0fd9ah),a		;6a5e
	call L_6A86		;6a61   ; la cabecera para el Game Master 2 en 0xEE00: el nombre de 0xE270 (5 bytes)...
	call L_6B58		;6a64   ; carga: orden 0, 2 y los seis trozos con la orden 8
	ld a,(0f0e4h)		;6a67
	ld (0fd9ah),a		;6a6a
	ret			;6a6d

; ----------------------------------------------------------------------
; DATOS resto_6A6E: lo apuntan con el banco puesto p01:6AF2 (0x6A6E), p01:6BA2
;   (0x6A6E), p12:BE5E (0x6A6E), p12:BEF1 (0x6A6E); el tamano es lo que hay
;   hasta lo siguiente, no sale de recorrerlo; lo leen p01:6AF2, p01:6BA2,
;   p12:BE5E, p12:BEF1 (24 bytes)
;   0x6a6e..0x6a86  (24 bytes)
DATA_resto_6A6E:
	defb 043h,0e2h,001h,000h,05ch,0e2h,023h,000h,082h,0e2h,003h,000h,0c0h,0e2h,040h,002h	; 6a6e  C...\.#.......@.
	defb 000h,0e6h,000h,002h,000h,0e9h,0c0h,004h	; 6a7e  ........

; ======================================================================
; CODIGO 0x6a86..0x6c29  (419 bytes)
; ======================================================================


L_6A86:
	ld hl,0e270h		;6a86   ; la cabecera para el Game Master 2 en 0xEE00: el nombre de 0xE270 (5 bytes)...
	ld de,0ee00h		;6a89   ; apunta a la cabecera para el Game Master 2
	ld (0f0e0h),de		;6a8c
	ld bc,00005h		;6a90
	ldir		;6a93
	ld de,0ee05h		;6a95   ; ...8 ceros...
	xor a			;6a98
	ld b,008h		;6a99
L_6A9B:
	ld (de),a			;6a9b
	inc de			;6a9c
	djnz L_6A9B		;6a9d
	inc de			;6a9f
	inc de			;6aa0
	inc de			;6aa1
	inc de			;6aa2
	ld a,(0f0e9h)		;6aa3   ; ...y el slot de este cartucho
	ld (de),a			;6aa6
	ret			;6aa7
L_6AA8:
	ld de,(0f0e0h)		;6aa8   ; graba: abre el fichero (orden 0), lo prepara (2) y escribe los seis trozos (9)
	ld a,(0f0f7h)		;6aac   ; el Game Master 2 en 0x8000 (ENASLT al slot de 0xF0F7)
	ld h,080h		;6aaf
	call 00024h		;6ab1   ; BIOS ENASLT - Switches to specified slot and page definitively
	ld a,004h		;6ab4
	ld (08000h),a		;6ab6   ; su banco 4 en 0x8000
	ld c,000h		;6ab9   ; orden 0 con la cabecera de 0xF0E0
	ld de,(0f0e0h)		;6abb
	call 08000h		;6abf   ; la llamada al Game Master 2
	push af			;6ac2
	ld a,(0f0e9h)		;6ac3   ; vuelve este cartucho a 0x8000
	ld h,080h		;6ac6
	call 00024h		;6ac8   ; BIOS ENASLT - Switches to specified slot and page definitively
	pop af			;6acb
	ld de,(0f0e0h)		;6acc
	ld a,(0f0f7h)		;6ad0   ; lee el slot del cartucho de la otra ranura (0xFF si no hay)
	ld h,080h		;6ad3
	call 00024h		;6ad5   ; BIOS ENASLT - Switches to specified slot and page definitively
	ld a,004h		;6ad8
	ld (08000h),a		;6ada
	ld c,002h		;6add
	ld de,(0f0e0h)		;6adf
	call 08000h		;6ae3
	push af			;6ae6
	ld a,(0f0e9h)		;6ae7   ; lee el slot de este cartucho
	ld h,080h		;6aea
	call 00024h		;6aec   ; BIOS ENASLT - Switches to specified slot and page definitively
	pop af			;6aef
	ld b,006h		;6af0   ; los seis trozos de RAM de la tabla 0x6C6D: [desde][cuantos]
	ld hl,06a6eh		;6af2
L_6AF5:
	push bc			;6af5
	ld de,0ee0dh		;6af6   ; a 0xEE0D, con la cabecera
	ld bc,00004h		;6af9
	ldir		;6afc
	push hl			;6afe
	ld de,(0f0e0h)		;6aff
	ld a,(0f0f7h)		;6b03   ; lee el slot del cartucho de la otra ranura (0xFF si no hay)
	ld h,080h		;6b06
	call 00024h		;6b08   ; BIOS ENASLT - Switches to specified slot and page definitively
	ld a,004h		;6b0b
	ld (08000h),a		;6b0d
	ld c,009h		;6b10   ; orden 9: escribe el trozo
	ld de,(0f0e0h)		;6b12
	call 08000h		;6b16
	push af			;6b19
	ld a,(0f0e9h)		;6b1a   ; lee el slot de este cartucho
	ld h,080h		;6b1d
	call 00024h		;6b1f   ; BIOS ENASLT - Switches to specified slot and page definitively
	pop af			;6b22
	pop hl			;6b23
	pop bc			;6b24
	or a			;6b25   ; si falla, se acaba con error
	jp nz,L_6C03		;6b26
	djnz L_6AF5		;6b29
	ld de,(0f0e0h)		;6b2b
	ld a,(0f0f7h)		;6b2f   ; lee el slot del cartucho de la otra ranura (0xFF si no hay)
	ld h,080h		;6b32
	call 00024h		;6b34   ; BIOS ENASLT - Switches to specified slot and page definitively
	ld a,004h		;6b37
	ld (08000h),a		;6b39
	ld c,001h		;6b3c   ; orden 1: cierra
	ld de,(0f0e0h)		;6b3e
	call 08000h		;6b42
	push af			;6b45
	ld a,(0f0e9h)		;6b46   ; lee el slot de este cartucho
	ld h,080h		;6b49
	call 00024h		;6b4b   ; BIOS ENASLT - Switches to specified slot and page definitively
	pop af			;6b4e
	or a			;6b4f
	jp nz,L_6C03		;6b50
	xor a			;6b53   ; 0xE27F = 0: bien
	ld (0e27fh),a		;6b54   ; guarda el resultado de grabar o cargar (0 bien, 2 error)
	ret			;6b57
L_6B58:
	ld de,(0f0e0h)		;6b58   ; carga: orden 0, 2 y los seis trozos con la orden 8
	ld a,(0f0f7h)		;6b5c   ; lee el slot del cartucho de la otra ranura (0xFF si no hay)
	ld h,080h		;6b5f
	call 00024h		;6b61   ; BIOS ENASLT - Switches to specified slot and page definitively
	ld a,004h		;6b64
	ld (08000h),a		;6b66
	ld c,000h		;6b69
	ld de,(0f0e0h)		;6b6b
	call 08000h		;6b6f
	push af			;6b72
	ld a,(0f0e9h)		;6b73   ; lee el slot de este cartucho
	ld h,080h		;6b76
	call 00024h		;6b78   ; BIOS ENASLT - Switches to specified slot and page definitively
	pop af			;6b7b
	ld de,(0f0e0h)		;6b7c
	ld a,(0f0f7h)		;6b80   ; lee el slot del cartucho de la otra ranura (0xFF si no hay)
	ld h,080h		;6b83
	call 00024h		;6b85   ; BIOS ENASLT - Switches to specified slot and page definitively
	ld a,004h		;6b88
	ld (08000h),a		;6b8a
	ld c,002h		;6b8d
	ld de,(0f0e0h)		;6b8f
	call 08000h		;6b93
	push af			;6b96
	ld a,(0f0e9h)		;6b97   ; lee el slot de este cartucho
	ld h,080h		;6b9a
	call 00024h		;6b9c   ; BIOS ENASLT - Switches to specified slot and page definitively
	pop af			;6b9f
	ld b,006h		;6ba0
	ld hl,06a6eh		;6ba2
L_6BA5:
	push bc			;6ba5
	ld de,0ee0dh		;6ba6
	ld bc,00004h		;6ba9
	ldir		;6bac
	push hl			;6bae
	ld de,(0f0e0h)		;6baf
	ld a,(0f0f7h)		;6bb3   ; lee el slot del cartucho de la otra ranura (0xFF si no hay)
	ld h,080h		;6bb6
	call 00024h		;6bb8   ; BIOS ENASLT - Switches to specified slot and page definitively
	ld a,004h		;6bbb
	ld (08000h),a		;6bbd
	ld c,008h		;6bc0   ; orden 8: lee el trozo
	ld de,(0f0e0h)		;6bc2
	call 08000h		;6bc6
	push af			;6bc9
	ld a,(0f0e9h)		;6bca   ; lee el slot de este cartucho
	ld h,080h		;6bcd
	call 00024h		;6bcf   ; BIOS ENASLT - Switches to specified slot and page definitively
	pop af			;6bd2
	pop hl			;6bd3
	pop bc			;6bd4
	djnz L_6BA5		;6bd5
	ld de,(0f0e0h)		;6bd7
	ld a,(0f0f7h)		;6bdb   ; lee el slot del cartucho de la otra ranura (0xFF si no hay)
	ld h,080h		;6bde
	call 00024h		;6be0   ; BIOS ENASLT - Switches to specified slot and page definitively
	ld a,004h		;6be3
	ld (08000h),a		;6be5
	ld c,001h		;6be8   ; orden 1: cierra
	ld de,(0f0e0h)		;6bea
	call 08000h		;6bee
	push af			;6bf1
	ld a,(0f0e9h)		;6bf2   ; lee el slot de este cartucho
	ld h,080h		;6bf5
	call 00024h		;6bf7   ; BIOS ENASLT - Switches to specified slot and page definitively
	pop af			;6bfa
	or a			;6bfb
	jr nz,L_6C23		;6bfc
	xor a			;6bfe
	ld (0e27fh),a		;6bff   ; guarda el resultado de grabar o cargar (0 bien, 2 error)
	ret			;6c02
L_6C03:
	ld a,(0f0f7h)		;6c03   ; error: orden 6 y 0xE27F = 2
	ld h,080h		;6c06
	call 00024h		;6c08   ; BIOS ENASLT - Switches to specified slot and page definitively
	ld a,004h		;6c0b
	ld (08000h),a		;6c0d
	ld c,006h		;6c10
	ld de,(0f0e0h)		;6c12
	call 08000h		;6c16
	push af			;6c19
	ld a,(0f0e9h)		;6c1a   ; lee el slot de este cartucho
	ld h,080h		;6c1d
	call 00024h		;6c1f   ; BIOS ENASLT - Switches to specified slot and page definitively
	pop af			;6c22
L_6C23:
	ld a,002h		;6c23
	ld (0e27fh),a		;6c25   ; guarda el resultado de grabar o cargar (0 bien, 2 error)
	ret			;6c28

; ----------------------------------------------------------------------
; DATOS resto_6C29: lo apuntan con el banco puesto p01:6C47 (0x6C29); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p01:6C47 (5 bytes)
;   0x6c29..0x6c2e  (5 bytes)
DATA_resto_6C29:
	defb 046h,049h,04ch,045h,03fh	; 6c29

; ======================================================================
; CODIGO 0x6c2e..0x6dda  (428 bytes)
; ======================================================================


L_6C2E:
	di			;6c2e   ; cuenta los ficheros del Game Master 2 que se llaman FILE (hasta 3) en 0xF0E5
	ld a,(0fd9fh)		;6c2f
	ld (0f0e4h),a		;6c32
	ld a,0c9h		;6c35
	ld (0fd9fh),a		;6c37
	ld hl,0ee50h		;6c3a   ; 0xEE50-0xEE70 a cero y la cabecera FILE? en 0xEE00
	ld de,0ee51h		;6c3d
	ld bc,00020h		;6c40
	ld (hl),000h		;6c43
	ldir		;6c45
	ld hl,06c29h		;6c47
	ld de,0ee00h		;6c4a   ; apunta a la cabecera para el Game Master 2
	ld bc,00005h		;6c4d
	ldir		;6c50
	ld hl,0ee50h		;6c52   ; apunta a la lista de las cosas de 0xE300 por orden de pintado
	ld (0ee0dh),hl		;6c55
	ld de,0ee00h		;6c58   ; apunta a la cabecera para el Game Master 2
	ld (0f0e0h),de		;6c5b
	ld a,(0f0f7h)		;6c5f   ; lee el slot del cartucho de la otra ranura (0xFF si no hay)
	ld h,080h		;6c62
	call 00024h		;6c64   ; BIOS ENASLT - Switches to specified slot and page definitively
	ld a,004h		;6c67
	ld (08000h),a		;6c69
	ld c,003h		;6c6c   ; orden 3: el primero
	ld de,(0f0e0h)		;6c6e
	call 08000h		;6c72
	push af			;6c75
	ld a,(0f0e9h)		;6c76   ; lee el slot de este cartucho
	ld h,080h		;6c79
	call 00024h		;6c7b   ; BIOS ENASLT - Switches to specified slot and page definitively
	pop af			;6c7e
	and a			;6c7f
	jr nz,L_6CAF		;6c80
L_6C82:
	ld hl,(0ee0dh)		;6c82
	ld a,008h		;6c85
	call 04094h		;6c87   ; suma A a HL (HL = HL + A)
	ld (0ee0dh),hl		;6c8a
	ld a,(0f0f7h)		;6c8d   ; lee el slot del cartucho de la otra ranura (0xFF si no hay)
	ld h,080h		;6c90
	call 00024h		;6c92   ; BIOS ENASLT - Switches to specified slot and page definitively
	ld a,004h		;6c95
	ld (08000h),a		;6c97
	ld c,004h		;6c9a   ; orden 4: el siguiente, hasta que no haya
	ld de,(0f0e0h)		;6c9c
	call 08000h		;6ca0
	push af			;6ca3
	ld a,(0f0e9h)		;6ca4   ; lee el slot de este cartucho
	ld h,080h		;6ca7
	call 00024h		;6ca9   ; BIOS ENASLT - Switches to specified slot and page definitively
	pop af			;6cac
	jr z,L_6C82		;6cad
L_6CAF:
	ld a,(0f0e4h)		;6caf
	ld (0fd9fh),a		;6cb2
	ei			;6cb5
	xor a			;6cb6
	ld (0f0e5h),a		;6cb7
	ld de,0ee50h		;6cba   ; apunta a la lista de las cosas de 0xE300 por orden de pintado
L_6CBD:
	ld a,(de)			;6cbd   ; cada nombre de la lista: si es FILE...
	or a			;6cbe
	ret z			;6cbf
	push de			;6cc0
	ld a,(de)			;6cc1
	cp 046h		;6cc2
	jr nz,L_6CD8		;6cc4
	inc de			;6cc6
	ld a,(de)			;6cc7
	cp 049h		;6cc8
	jr nz,L_6CD8		;6cca
	inc de			;6ccc
	ld a,(de)			;6ccd
	cp 04ch		;6cce
	jr nz,L_6CD8		;6cd0
	inc de			;6cd2
	ld a,(de)			;6cd3
	cp 045h		;6cd4
	jr z,L_6CE0		;6cd6
L_6CD8:
	pop de			;6cd8
L_6CD9:
	ld a,008h		;6cd9
	call 04099h		;6cdb   ; suma A a DE (DE = DE + A)
	jr L_6CBD		;6cde
L_6CE0:
	pop de			;6ce0   ; ...se cuenta
	ld hl,0f0e5h		;6ce1
	inc (hl)			;6ce4
	ld a,(hl)			;6ce5
	cp 003h		;6ce6
	ret nc			;6ce8
	jr L_6CD9		;6ce9
L_6CEB:
	ld b,000h		;6ceb   ; mira que hay para grabar: disco (H.PHYD) bit 0 y Game Master 2 bit 1, en 0xF0F9
	ld a,(0ffa7h)		;6ced
	cp 0c9h		;6cf0
	jr z,L_6CF5		;6cf2
	inc b			;6cf4
L_6CF5:
	push bc			;6cf5
	call L_6D07		;6cf6   ; busca el Game Master 2 en los cuatro slots (y sus secundarios)
	pop bc			;6cf9
	ld a,(0f0f7h)		;6cfa   ; lee el slot del cartucho de la otra ranura (0xFF si no hay)
	inc a			;6cfd
	jr z,L_6D02		;6cfe
	set 1,b		;6d00
L_6D02:
	ld a,b			;6d02
	ld (0f0f9h),a		;6d03   ; guarda lo que hay para grabar (bit 0 disco, bit 1 Game Master 2)
	ret			;6d06
L_6D07:
	ld bc,00400h		;6d07   ; busca el Game Master 2 en los cuatro slots (y sus secundarios)
	ld hl,0fcc1h		;6d0a
L_6D0D:
	push bc			;6d0d
	push hl			;6d0e
	ld a,(hl)			;6d0f
	bit 7,a		;6d10
	jr nz,L_6D1A		;6d12
	ld a,c			;6d14
	call L_6D3A		;6d15   ; el slot A lleva 'YZ' en 0x4010: es el Game Master 2 (acarreo)
	jr L_6D1D		;6d18
L_6D1A:
	call L_6D2A		;6d1a
L_6D1D:
	pop hl			;6d1d
	pop bc			;6d1e
	ret c			;6d1f
	inc hl			;6d20
	inc c			;6d21
	djnz L_6D0D		;6d22
	ld a,0ffh		;6d24   ; no hay: 0xF0F7 = 0xFF
	ld (0f0f7h),a		;6d26   ; guarda el slot del cartucho de la otra ranura (0xFF si no hay)
	ret			;6d29
L_6D2A:
	and 080h		;6d2a
	or c			;6d2c
	ld b,004h		;6d2d
L_6D2F:
	push bc			;6d2f
	call L_6D3A		;6d30   ; el slot A lleva 'YZ' en 0x4010: es el Game Master 2 (acarreo)
	pop bc			;6d33
	ret c			;6d34
	add a,004h		;6d35
	djnz L_6D2F		;6d37
	ret			;6d39
L_6D3A:
	ld (0f0f7h),a		;6d3a   ; el slot A lleva 'YZ' en 0x4010: es el Game Master 2 (acarreo)
	ld hl,04010h		;6d3d
	call 0000ch		;6d40   ; BIOS RDSLT - Reads the value of an address in another slot
	cp 059h		;6d43
	jr nz,L_6D59		;6d45
	ld hl,04011h		;6d47
	ld a,(0f0f7h)		;6d4a   ; lee el slot del cartucho de la otra ranura (0xFF si no hay)
	call 0000ch		;6d4d   ; BIOS RDSLT - Reads the value of an address in another slot
	cp 05ah		;6d50
	jr nz,L_6D59		;6d52
	ld a,(0f0f7h)		;6d54   ; lee el slot del cartucho de la otra ranura (0xFF si no hay)
	scf			;6d57
	ret			;6d58
L_6D59:
	ld a,(0f0f7h)		;6d59   ; lee el slot del cartucho de la otra ranura (0xFF si no hay)
	and a			;6d5c
	ret			;6d5d
L_6D5E:
	ld bc,00400h		;6d5e   ; busca en los cuatro slots (y sus secundarios) un cartucho con 0x30 0x31 0x13 0x35 en 0x7FFB; su slot a 0xF0EF (0xFF si no hay)
	ld hl,0fcc1h		;6d61
L_6D64:
	push bc			;6d64
	push hl			;6d65
	ld a,(hl)			;6d66
	bit 7,a		;6d67
	jr nz,L_6D71		;6d69
	ld a,c			;6d6b
	call L_6D91		;6d6c   ; C si el slot A lleva 0x30 0x31 0x13 0x35 en 0x7FFB-0x7FFE (RDSLT)
	jr L_6D74		;6d6f
L_6D71:
	call L_6D81		;6d71   ; slot expandido: sus cuatro secundarios
L_6D74:
	pop hl			;6d74
	pop bc			;6d75
	ret c			;6d76
	inc hl			;6d77
	inc c			;6d78
	djnz L_6D64		;6d79
	ld a,0ffh		;6d7b   ; no hay: 0xF0EF = 0xFF
	ld (0f0efh),a		;6d7d
	ret			;6d80
L_6D81:
	and 080h		;6d81   ; los cuatro secundarios del slot A
	or c			;6d83
	ld b,004h		;6d84
L_6D86:
	push bc			;6d86
	call L_6D91		;6d87   ; C si el slot A lleva 0x30 0x31 0x13 0x35 en 0x7FFB-0x7FFE (RDSLT)
	pop bc			;6d8a
	ret c			;6d8b
	add a,004h		;6d8c
	djnz L_6D86		;6d8e
	ret			;6d90
L_6D91:
	ld (0f0efh),a		;6d91   ; C si el slot A lleva 0x30 0x31 0x13 0x35 en 0x7FFB-0x7FFE (RDSLT)
	ld hl,07ffbh		;6d94
	call 0000ch		;6d97   ; BIOS RDSLT - Reads the value of an address in another slot
	cp 030h		;6d9a
	jr nz,L_6DC4		;6d9c
	inc hl			;6d9e
	ld a,(0f0efh)		;6d9f
	call 0000ch		;6da2   ; BIOS RDSLT - Reads the value of an address in another slot
	cp 031h		;6da5
	jr nz,L_6DC4		;6da7
	inc hl			;6da9
	ld a,(0f0efh)		;6daa
	call 0000ch		;6dad   ; BIOS RDSLT - Reads the value of an address in another slot
	cp 013h		;6db0
	jr nz,L_6DC4		;6db2
	inc hl			;6db4
	ld a,(0f0efh)		;6db5
	call 0000ch		;6db8   ; BIOS RDSLT - Reads the value of an address in another slot
	cp 035h		;6dbb
	jr nz,L_6DC4		;6dbd
	ld a,(0f0efh)		;6dbf
	scf			;6dc2
	ret			;6dc3
L_6DC4:
	ld a,(0f0efh)		;6dc4   ; NC: no lo lleva
	and a			;6dc7
	ret			;6dc8
L_6DC9:
	call L_6DCF		;6dc9   ; un cuadro de la piramide acabada (estado 10, cada 10 fases), por pasos (0xE257)
	jp 0564ah		;6dcc
L_6DCF:
	ld hl,0edc9h		;6dcf
	inc (hl)			;6dd2
	ld a,(0e257h)		;6dd3   ; lee el paso de la secuencia en curso (entrada, fase o piramide acabada)
	dec a			;6dd6
	call 0409eh		;6dd7   ; el despachador de Konami: la tabla va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_6DDA: 10 destinos del despachador p00:409E (call en p01:6DD7, el
;   indice en A): 6DEE, 6E27, 6E3F, 6E91, 6EAC, 6EC2, 6ED1, 6EDE, 6F01, 6F27;
;   lo leen p01:6DD7 (20 bytes)
;   0x6dda..0x6dee  (20 bytes)
DATA_tabla_6DDA:
	defw 06deeh,06e27h,06e3fh,06e91h,06each,06ec2h,06ed1h,06edeh	; 6dda
	defw 06f01h,06f27h	; 6dea  -> L_6F01 L_6F27

; ======================================================================
; CODIGO 0x6dee..0x6f73  (389 bytes)
; ======================================================================


L_6DEE:
	call 056c2h		;6dee   ; paso 1 de la piramide acabada (MSX1): sus graficos, la fuente y los sprites
	call 05890h		;6df1   ; las fuentes del marcador: 0xAA29, 0xAA89 y 0xAB79 a los tres tercios, con color 0xF0
	call 05b38h		;6df4   ; los atributos de los sprites (0xE800, 0x80 bytes) a 0xE0: fuera de la pantalla
	ld a,(0e241h)		;6df7   ; lee la piramide (1-6)
	dec a			;6dfa
	add a,a			;6dfb   ; el sitio del personaje: dos bytes de la tabla 0x6FC6 por piramide
	ld hl,06fc6h		;6dfc
	call 04094h		;6dff   ; suma A a HL (HL = HL + A)
	ld de,0edcbh		;6e02   ; apunta a la y del personaje de las secuencias
	ldi		;6e05
	ldi		;6e07
	xor a			;6e09
	ld (0edc8h),a		;6e0a
	call 04ec7h		;6e0d   ; borra los sprites y la tabla de nombres (0x3800, 0x300 bytes)
	call 056eah		;6e10   ; la imagen de 0xAB57 en (0x18, 0x18) y los sprites
	call 05800h		;6e13   ; rachas de 0xB851 a 0x1820 y de 0xB41D a 0x1E80 (sprites)
	call L_6FBD		;6e16   ; lo mismo con 0xBDDA
	call 04224h		;6e19   ; el sonido 0x0D y espera 0x3C cuadros
	ld a,03ch		;6e1c
L_6E1E:
	ld hl,0e204h		;6e1e   ; 0xE204 = A
	ld (hl),a			;6e21
L_6E22:
	ld hl,0e257h		;6e22   ; el paso siguiente
	inc (hl)			;6e25
	ret			;6e26
L_6E27:
	call L_6FBD		;6e27   ; paso 2: espera
	ld hl,0e204h		;6e2a   ; apunta a la espera del paso (en cuadros)
	dec (hl)			;6e2d
	ret nz			;6e2e
	xor a			;6e2f
	ld (0edd8h),a		;6e30
	inc a			;6e33
	ld (0edceh),a		;6e34
	call L_6FA1		;6e37   ; el letrero de la piramide (tabla 0xAC13 del banco 12)
	ld a,005h		;6e3a
	jp L_6E1E		;6e3c
L_6E3F:
	ld a,(0e207h)		;6e3f   ; paso 3: con disparo se acaba antes (tabla 0x6FD0)
	and 030h		;6e42
	jr z,L_6E5E		;6e44
	ld a,(0e241h)		;6e46   ; lee la piramide (1-6)
	dec a			;6e49
	add a,a			;6e4a
	ld hl,06fd0h		;6e4b
	call 04094h		;6e4e   ; suma A a HL (HL = HL + A)
	ld de,0edcbh		;6e51   ; apunta a la y del personaje de las secuencias
	ldi		;6e54
	ldi		;6e56
	call L_6E8C		;6e58
	jp L_6FB4		;6e5b
L_6E5E:
	call L_6E64		;6e5e   ; el personaje camina por el dibujo de la piramide, un paso cada 5 cuadros
	jp L_6FB4		;6e61
L_6E64:
	ld b,004h		;6e64   ; el personaje camina por el dibujo de la piramide, un paso cada 5 cuadros
	call L_6F55		;6e66   ; cada B cuadros cambia el dibujo del personaje (0xEDD8 xor 3)
	ld a,(0edceh)		;6e69
	cp 004h		;6e6c
	ld a,(0edd8h)		;6e6e
	call z,05782h		;6e71   ; 16 x 12 de 0xB184 o 0xB244
	ld hl,0e204h		;6e74   ; apunta a la espera del paso (en cuadros)
	dec (hl)			;6e77
	ret nz			;6e78
	ld a,005h		;6e79
	ld (hl),a			;6e7b
	call L_6F78		;6e7c   ; la direccion del paso (tabla 0xBA57)
	call L_6F64		;6e7f   ; hasta el numero de pasos de la piramide (tabla 0x7177)
	jr z,L_6E8C		;6e82
	call L_6F3C		;6e84   ; un paso
	ld hl,0edc8h		;6e87
	inc (hl)			;6e8a
	ret			;6e8b
L_6E8C:
	ld a,005h		;6e8c
	jp L_6E1E		;6e8e
L_6E91:
	ld b,004h		;6e91
	call L_6F55		;6e93   ; cada B cuadros cambia el dibujo del personaje (0xEDD8 xor 3)
	ld hl,0e204h		;6e96   ; apunta a la espera del paso (en cuadros)
	dec (hl)			;6e99
	jp nz,L_6FB4		;6e9a
	xor a			;6e9d
	call 05782h		;6e9e   ; 16 x 12 de 0xB184 o 0xB244
	call 0579ah		;6ea1   ; 12 x 2 de 0xB304
L_6EA4:
	ld a,005h		;6ea4
	call L_6E1E		;6ea6   ; 0xE204 = A
	jp nz,L_6FB4		;6ea9
L_6EAC:
	ld b,004h		;6eac
	call L_6F55		;6eae   ; cada B cuadros cambia el dibujo del personaje (0xEDD8 xor 3)
	ld hl,0e204h		;6eb1   ; apunta a la espera del paso (en cuadros)
	dec (hl)			;6eb4
	jp nz,L_6FB4		;6eb5
	ld a,001h		;6eb8
	call 05782h		;6eba   ; 16 x 12 de 0xB184 o 0xB244
	call 057ach		;6ebd   ; 12 x 4 de 0xB31C
	jr L_6EA4		;6ec0
L_6EC2:
	ld hl,0e204h		;6ec2   ; paso: 14 x 6 de 0xA5EE y los dibujos de 0xA642 y 0xA6B1
	dec (hl)			;6ec5
	ret nz			;6ec6
	xor a			;6ec7
	call 05782h		;6ec8   ; 16 x 12 de 0xB184 o 0xB244
	call 057beh		;6ecb   ; 14 x 6 de 0xB34C
	jp L_6E22		;6ece
L_6ED1:
	ld a,006h		;6ed1   ; paso: 0xEDC8 = 6 y la primera imagen
	ld (0edc8h),a		;6ed3
	call 057d0h		;6ed6   ; 6 x 6 de 0xB3A0 en la columna que diga A
	ld a,010h		;6ed9
	jp L_6E1E		;6edb
L_6EDE:
	ld hl,0e204h		;6ede   ; cada 0x10 cuadros otra imagen (0xEDC8 baja); en la 5 el sonido 0x3E
	dec (hl)			;6ee1
	ret nz			;6ee2
	ld (hl),010h		;6ee3
	ld hl,0edc8h		;6ee5
	dec (hl)			;6ee8
	ld a,(hl)			;6ee9
	cp 005h		;6eea
	push hl			;6eec
	call z,04303h		;6eed   ; pide el sonido 0x3E
	pop hl			;6ef0
	ld a,(hl)			;6ef1
	cp 0ffh		;6ef2
	jp nz,057d0h		;6ef4
	ld (hl),000h		;6ef7   ; acabadas: el fundido 4
	call 05b38h		;6ef9   ; los atributos de los sprites (0xE800, 0x80 bytes) a 0xE0: fuera de la pantalla
	ld a,010h		;6efc
	jp L_6E1E		;6efe
L_6F01:
	ld hl,0e204h		;6f01   ; cada 0x10 cuadros otra imagen (0xEDC8 sube); sonidos 0x3E y 0x25
	dec (hl)			;6f04
	ret nz			;6f05
	ld (hl),010h		;6f06
	ld hl,0edc8h		;6f08
	inc (hl)			;6f0b
	ld a,(hl)			;6f0c
	dec a			;6f0d
	push hl			;6f0e
	call z,04303h		;6f0f   ; pide el sonido 0x3E
	pop hl			;6f12
	ld a,(hl)			;6f13
	cp 006h		;6f14
	call z,0429ch		;6f16   ; pide el sonido 0x25
	ld a,(hl)			;6f19
	cp 007h		;6f1a
	jp nz,057d0h		;6f1c
	call 04323h		;6f1f   ; a la 7: calla la musica y espera 0xC0 cuadros
	ld a,0c0h		;6f22
	jp L_6E1E		;6f24
L_6F27:
	ld hl,0e204h		;6f27   ; se acaba: la musica, la secuencia a 0 y el marcador
	dec (hl)			;6f2a
	ret nz			;6f2b
	call 0431bh		;6f2c   ; orden 0x82 (p04:61BB), con 0xE21A a cero
	call 041e8h		;6f2f   ; pide el sonido 1
	xor a			;6f32
	ld (0e257h),a		;6f33   ; guarda el paso de la secuencia en curso (entrada, fase o piramide acabada)
	call 04ec7h		;6f36   ; borra los sprites y la tabla de nombres (0x3800, 0x300 bytes)
	jp 05a3dh		;6f39
L_6F3C:
	ld hl,0edcbh		;6f3c   ; un paso del personaje segun 0xEDCA (1 abajo, 2 izquierda, 3 derecha, si no arriba)
	ld a,(0edcah)		;6f3f
	dec a			;6f42
	jr z,L_6F4D		;6f43
	dec a			;6f45
	jr z,L_6F4F		;6f46
	dec a			;6f48
	jr z,L_6F52		;6f49
	dec (hl)			;6f4b
	ret			;6f4c
L_6F4D:
	inc (hl)			;6f4d
	ret			;6f4e
L_6F4F:
	inc hl			;6f4f
	dec (hl)			;6f50
	ret			;6f51
L_6F52:
	inc hl			;6f52
	inc (hl)			;6f53
	ret			;6f54
L_6F55:
	ld hl,0edceh		;6f55   ; cada B cuadros cambia el dibujo del personaje (0xEDD8 xor 3)
	dec (hl)			;6f58
	ret nz			;6f59
	ld (hl),b			;6f5a
	ld a,(0edd8h)		;6f5b
	xor 001h		;6f5e
	ld (0edd8h),a		;6f60
	ret			;6f63
L_6F64:
	ld a,(0e241h)		;6f64   ; Z si 0xEDC8 ha llegado al numero de pasos de la piramide (tabla 0x6F73)
	dec a			;6f67
	ld hl,06f73h		;6f68
	call 04094h		;6f6b   ; suma A a HL (HL = HL + A)
	ld a,(0edc8h)		;6f6e
	cp (hl)			;6f71
	ret			;6f72

; ----------------------------------------------------------------------
; DATOS resto_6F73: lo apuntan con el banco puesto p01:6F68 (0x6F73); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p01:6F68 (5 bytes)
;   0x6f73..0x6f78  (5 bytes)
DATA_resto_6F73:
	defb 058h,0b8h,088h,08eh,095h	; 6f73

; ======================================================================
; CODIGO 0x6f78..0x6fc6  (78 bytes)
; ======================================================================


L_6F78:
	call 041c7h		;6f78   ; la direccion del paso 0xEDC8 de la piramide (banco 13)
	call L_6F81		;6f7b   ; la lista de la piramide en la tabla 0xBA57: [paso][direccion]..., 0xFF acaba
	jp 04192h		;6f7e
L_6F81:
	ld hl,0ba57h		;6f81   ; la lista de la piramide en la tabla 0xBA57: [paso][direccion]..., 0xFF acaba
	ld a,(0e241h)		;6f84   ; lee la piramide (1-6)
	dec a			;6f87
	call 04d4dh		;6f88   ; HL = la palabra A de la tabla de HL
	ld d,h			;6f8b
	ld e,l			;6f8c
	ld a,(0edc8h)		;6f8d
	ld b,a			;6f90
L_6F91:
	ld a,(de)			;6f91
	cp 0ffh		;6f92
	ret z			;6f94
	inc de			;6f95
	cp b			;6f96
	jr z,L_6F9C		;6f97
	inc de			;6f99
	jr L_6F91		;6f9a
L_6F9C:
	ld a,(de)			;6f9c
	ld (0edcah),a		;6f9d
	ret			;6fa0
L_6FA1:
	call 041bdh		;6fa1   ; el letrero de la piramide (tabla 0xAC13 del banco 12)
	ld hl,0ac13h		;6fa4
	ld a,(0e241h)		;6fa7   ; lee la piramide (1-6)
	dec a			;6faa
	call 04d4dh		;6fab   ; HL = la palabra A de la tabla de HL
	call 04f0bh		;6fae   ; pinta un letrero: [D][E] y caracteres; 0xFE trae otra posicion; 0xFF acaba
	jp 04192h		;6fb1
L_6FB4:
	call 041bdh		;6fb4   ; el personaje de la secuencia (banco 12, 0xBDD7)
	call 0bdb2h		;6fb7
	jp 04192h		;6fba
L_6FBD:
	call 041bdh		;6fbd   ; lo mismo con 0xBDDA
	call 0bdc9h		;6fc0
	jp 04192h		;6fc3

; ----------------------------------------------------------------------
; DATOS resto_6FC6: lo apuntan con el banco puesto p01:6DFC (0x6FC6), p01:6E4B
;   (0x6FD0); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p01:6DFC, p01:6E4B (20 bytes)
;   0x6fc6..0x6fda  (20 bytes)
DATA_resto_6FC6:
	defb 02ah,04eh,03ah,02eh,062h,030h,065h,053h,052h,05eh,03bh,038h,05eh,02bh,06bh,04eh	; 6fc6  *N:.b0eSR^.8^+kN
	defb 04eh,063h,048h,046h	; 6fd6

; ======================================================================
; CODIGO 0x6fda..0x6fec  (18 bytes)
; ======================================================================


L_6FDA:
	call L_6FE0		;6fda   ; un cuadro del final (estado 13), por pasos (0xE257)
	jp 0564ah		;6fdd
L_6FE0:
	ld hl,0edc9h		;6fe0   ; cada paso, su rutina (tabla detras)
	inc (hl)			;6fe3
	ld de,0e257h		;6fe4   ; apunta a el paso de la secuencia en curso (entrada, fase o piramide acabada)
	ld a,(de)			;6fe7
	dec a			;6fe8
	call 0409eh		;6fe9   ; el despachador de Konami: la tabla va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_6FEC: 66 destinos del despachador p00:409E (call en p01:6FE9, el
;   indice en A): 7070, 708A, 7099, 70A6, 70CF, 70E5, 70F8, 710D, 7137, 7150,
;   715F, 7180, 71B3, 71C1, 71D6, 720E, 7227, 724B, 726A, 727E, 728D, 729B,
;   72C2, 72CF, 72EB, 72F3, 7312, 7323, 7332, 7358, 737C, 7391, 73A0, 73AE,
;   737C, 7391, 73A0, 73AE, 737C, 7391, 73A0, 73AE, 737C, 7391, 73A0, 73AE,
;   737C, 7391, 73A0, 73AE, 737C, 7391, 73A0, 73AE, 737C, 7391, 73A0, 73AE,
;   737C, 7391, 73A0, 73AE, 737C, 7391, 73A0, 73C1; lo leen p01:6FE9 (132
;   bytes)
;   0x6fec..0x7070  (132 bytes)
DATA_tabla_6FEC:
	defw 07070h,0708ah,07099h,070a6h,070cfh,070e5h,070f8h,0710dh	; 6fec
	defw 07137h,07150h,0715fh,07180h,071b3h,071c1h,071d6h,0720eh	; 6ffc
	defw 07227h,0724bh,0726ah,0727eh,0728dh,0729bh,072c2h,072cfh	; 700c
	defw 072ebh,072f3h,07312h,07323h,07332h,07358h,0737ch,07391h	; 701c
	defw 073a0h,073aeh,0737ch,07391h,073a0h,073aeh,0737ch,07391h	; 702c
	defw 073a0h,073aeh,0737ch,07391h,073a0h,073aeh,0737ch,07391h	; 703c
	defw 073a0h,073aeh,0737ch,07391h,073a0h,073aeh,0737ch,07391h	; 704c
	defw 073a0h,073aeh,0737ch,07391h,073a0h,073aeh,0737ch,07391h	; 705c
	defw 073a0h,073c1h	; 706c  -> L_73A0 L_73C1

; ======================================================================
; CODIGO 0x7070..0x747d  (1037 bytes)
; ======================================================================


L_7070:
	call L_7427		;7070   ; paso 1: borra, la paleta a negro, la fuente y el fundido 0x0A
	call 04ec7h		;7073   ; borra los sprites y la tabla de nombres (0x3800, 0x300 bytes)
	call 05b38h		;7076   ; los atributos de los sprites (0xE800, 0x80 bytes) a 0xE0: fuera de la pantalla
	call 05890h		;7079   ; las fuentes del marcador: 0xAA29, 0xAA89 y 0xAB79 a los tres tercios, con color 0xF0
	ld de,01000h		;707c
	call L_743B		;707f   ; empieza un fundido de los colores del texto (MSX1 no tiene paleta): 0xEDB1 = 1, 0xEDB2 = cada cuantos cuadros
	ld hl,0acc3h		;7082
	call L_73E5		;7085   ; pinta el letrero de HL del banco 12
	jr L_70CA		;7088
L_708A:
	ld de,01000h		;708a
	call L_744F		;708d   ; un cuadro del fundido: cada D cuadros el color siguiente de la tabla 0x747D (o 0x7481)
	ld a,(0edb1h)		;7090
	or a			;7093
	ret nz			;7094
	ld a,0f0h		;7095
	jr L_70F2		;7097
L_7099:
	ld hl,0e204h		;7099   ; el fundido 3
	dec (hl)			;709c
	ret nz			;709d
	ld de,01001h		;709e
	call L_743B		;70a1   ; empieza un fundido de los colores del texto (MSX1 no tiene paleta): 0xEDB1 = 1, 0xEDB2 = cada cuantos cuadros
	jr L_70CA		;70a4
L_70A6:
	ld de,01001h		;70a6
	call L_744F		;70a9   ; un cuadro del fundido: cada D cuadros el color siguiente de la tabla 0x747D (o 0x7481)
	ld a,(0edb1h)		;70ac
	or a			;70af
	ret nz			;70b0
	call 04ec7h		;70b1   ; borra los sprites y la tabla de nombres (0x3800, 0x300 bytes)
	xor a			;70b4
	call 05410h		;70b5   ; prepara un fundido de la tabla 0x9432
	call 05818h		;70b8   ; los sprites del final: rachas de 0xB5B7, 0x85A5, 0x8604, 0x8662, 0xB963 y 0xB418
	call 05b38h		;70bb   ; los atributos de los sprites (0xE800, 0x80 bytes) a 0xE0: fuera de la pantalla
	ld de,05010h		;70be
	call 056edh		;70c1   ; 12 x 12 caracteres de 0xA358 en (D, E)
	call 0541bh		;70c4   ; un cuadro del fundido de entrada, por pasos (0xEDD2)
	call 0423dh		;70c7   ; pide el sonido 0x12
L_70CA:
	ld hl,0e257h		;70ca   ; el paso siguiente
	inc (hl)			;70cd
	ret			;70ce
L_70CF:
	call 0541bh		;70cf   ; un cuadro del fundido de entrada, por pasos (0xEDD2)
	ld a,(0edd4h)		;70d2
	or a			;70d5
	ret nz			;70d6
	ld de,01000h		;70d7
	call L_743B		;70da   ; empieza un fundido de los colores del texto (MSX1 no tiene paleta): 0xEDB1 = 1, 0xEDB2 = cada cuantos cuadros
	ld hl,0ad12h		;70dd
	call L_73E5		;70e0   ; pinta el letrero de HL del banco 12
	jr L_70CA		;70e3
L_70E5:
	ld de,01000h		;70e5
	call L_744F		;70e8   ; un cuadro del fundido: cada D cuadros el color siguiente de la tabla 0x747D (o 0x7481)
	ld a,(0edb1h)		;70eb
	or a			;70ee
	ret nz			;70ef
	ld a,0f0h		;70f0
L_70F2:
	ld hl,0e204h		;70f2   ; 0xE204 = A y el paso siguiente
	ld (hl),a			;70f5
	jr L_70CA		;70f6
L_70F8:
	ld hl,0e204h		;70f8   ; apunta a la espera del paso (en cuadros)
	dec (hl)			;70fb
	ret nz			;70fc
	xor a			;70fd
	call 053f9h		;70fe   ; prepara un fundido: la lista 0x9422 + 5 x A
	ld de,01001h		;7101
	call L_743B		;7104   ; empieza un fundido de los colores del texto (MSX1 no tiene paleta): 0xEDB1 = 1, 0xEDB2 = cada cuantos cuadros
	call 0550bh		;7107   ; un cuadro del fundido de salida, por pasos
	jp L_70CA		;710a
L_710D:
	ld de,01001h		;710d
	ld a,(0edb1h)		;7110
	or a			;7113
	ld b,a			;7114
	call nz,L_744F		;7115   ; un cuadro del fundido: cada D cuadros el color siguiente de la tabla 0x747D (o 0x7481)
	ld a,(0edd4h)		;7118
	or a			;711b
	jp nz,0550bh		;711c
	or b			;711f
	ret nz			;7120
	call 04ec7h		;7121   ; borra los sprites y la tabla de nombres (0x3800, 0x300 bytes)
	call 04ec7h		;7124   ; borra los sprites y la tabla de nombres (0x3800, 0x300 bytes)
	call 041bdh		;7127   ; pone el banco 12 en 0xA000
	call 0bc54h		;712a   ; las estrellas del final: 0xE910 (32 de 16 bytes) a cero
	call 04192h		;712d   ; pone los bancos 1-2-3 (el juego)
	call L_73CC		;7130   ; el dibujo de 0xBCD2 (banco 12)
	ld a,030h		;7133
	jr L_70F2		;7135
L_7137:
	call L_73CC		;7137   ; la imagen de 0xA2C8
	ld hl,0e204h		;713a   ; apunta a la espera del paso (en cuadros)
	dec (hl)			;713d
	ret nz			;713e
	ld de,05020h		;713f
	call 056fch		;7142   ; 12 x 12 de 0xAAC7
	ld a,001h		;7145
	call 05410h		;7147   ; prepara un fundido de la tabla 0x9432
	call 0541bh		;714a   ; un cuadro del fundido de entrada, por pasos (0xEDD2)
	jp L_70CA		;714d
L_7150:
	call L_73CC		;7150   ; el dibujo de 0xBCD2 (banco 12)
	call 0541bh		;7153   ; un cuadro del fundido de entrada, por pasos (0xEDD2)
	ld a,(0edd4h)		;7156
	and a			;7159
	ret nz			;715a
	ld a,0a0h		;715b
	jr L_70F2		;715d
L_715F:
	ld hl,0e204h		;715f   ; a 0x30 del final, 0xE902 = 1
	dec (hl)			;7162
	jr z,L_7174		;7163
	ld a,(hl)			;7165
	cp 030h		;7166
	call z,L_716E		;7168
	jp L_73CC		;716b
L_716E:
	ld a,001h		;716e
	ld (0e902h),a		;7170
	ret			;7173
L_7174:
	xor a			;7174
	ld (0edceh),a		;7175
	ld a,0a0h		;7178
	call L_70F2		;717a   ; 0xE204 = A y el paso siguiente
	jp 05890h		;717d
L_7180:
	call L_73CC		;7180   ; cada 8 cuadros un caracter de la lista de 0xAF37 (banco 12) y el sonido 0x3D
	ld hl,0e204h		;7183   ; apunta a la espera del paso (en cuadros)
	dec (hl)			;7186
	jr z,L_71AE		;7187
	ld a,(hl)			;7189
	and 00fh		;718a
	ret nz			;718c
	call 041bdh		;718d   ; pone el banco 12 en 0xA000
	ld hl,0af37h		;7190
	ld a,(0edceh)		;7193
	ld b,a			;7196
	add a,a			;7197
	add a,b			;7198
	call 04094h		;7199   ; suma A a HL (HL = HL + A)
	ld d,(hl)			;719c
	inc hl			;719d
	ld e,(hl)			;719e
	inc hl			;719f
	ld a,(hl)			;71a0
	call 053efh		;71a1   ; escribe el caracter A en la posicion D, E de la tabla de nombres
	ld hl,0edceh		;71a4
	inc (hl)			;71a7
	call 04192h		;71a8   ; pone los bancos 1-2-3 (el juego)
	jp 042ffh		;71ab
L_71AE:
	ld a,050h		;71ae
	jp L_70F2		;71b0
L_71B3:
	ld hl,0e204h		;71b3   ; apunta a la espera del paso (en cuadros)
	dec (hl)			;71b6
	ret nz			;71b7
	ld de,01001h		;71b8
	call L_743B		;71bb   ; empieza un fundido de los colores del texto (MSX1 no tiene paleta): 0xEDB1 = 1, 0xEDB2 = cada cuantos cuadros
	jp L_70CA		;71be
L_71C1:
	ld de,01001h		;71c1
	call L_744F		;71c4   ; un cuadro del fundido: cada D cuadros el color siguiente de la tabla 0x747D (o 0x7481)
	ld a,(0edb1h)		;71c7
	or a			;71ca
	ret nz			;71cb
	xor a			;71cc
	call 053f9h		;71cd   ; prepara un fundido: la lista 0x9422 + 5 x A
	call 0550bh		;71d0   ; un cuadro del fundido de salida, por pasos
	jp L_70CA		;71d3
L_71D6:
	call 0550bh		;71d6   ; un cuadro del fundido de salida, por pasos
	ld a,(0edd4h)		;71d9
	or a			;71dc
	ret nz			;71dd
	call 04ec7h		;71de   ; borra los sprites y la tabla de nombres (0x3800, 0x300 bytes)
	call 04ec7h		;71e1   ; borra los sprites y la tabla de nombres (0x3800, 0x300 bytes)
	call 056e1h		;71e4   ; los de la lista 0x815F
	call 05b38h		;71e7   ; los atributos de los sprites (0xE800, 0x80 bytes) a 0xE0: fuera de la pantalla
	ld a,080h		;71ea
	call L_746F		;71ec   ; el color A a los caracteres 0x68-0x97 (0x0680, 0x180 bytes) de los tres tercios
	call 04eeah		;71ef   ; los atributos de los sprites (0x3B00, 0x80 bytes) a 0xE0: fuera de la pantalla
	ld de,05020h		;71f2
	call 0570eh		;71f5   ; 12 x 12 de 0xB0DC
	xor a			;71f8
	call 05740h		;71f9   ; 2 x 3 de 0xB178 o 0xB17E
	xor a			;71fc
	call 05728h		;71fd   ; 2 x 3 de 0xB16C o 0xB172 (segun A)
	ld hl,0ad69h		;7200
	call L_73E5		;7203   ; pinta el letrero de HL del banco 12
	ld a,080h		;7206
	call L_70F2		;7208   ; 0xE204 = A y el paso siguiente
	jp 042e7h		;720b
L_720E:
	call L_7409		;720e   ; los colores 10 y 12 parpadean; luego el letrero de 0xAD58
	call L_7419		;7211   ; el letrero de 0xAD69 aparece y desaparece cada 16 cuadros
	ld hl,0e204h		;7214   ; apunta a la espera del paso (en cuadros)
	dec (hl)			;7217
	ret nz			;7218
	ld a,0f0h		;7219
	call L_746F		;721b   ; el color A a los caracteres 0x68-0x97 (0x0680, 0x180 bytes) de los tres tercios
	ld hl,0ad58h		;721e
	call L_73E5		;7221   ; pinta el letrero de HL del banco 12
	jp L_70CA		;7224
L_7227:
	call L_7409		;7227   ; con disparo: los colores cambian, se copia la imagen y el sonido 0x39
	ld a,(0e208h)		;722a   ; lee el mando: lo pulsado
	and 030h		;722d
	ret z			;722f
	xor a			;7230
	call L_746F		;7231   ; el color A a los caracteres 0x68-0x97 (0x0680, 0x180 bytes) de los tres tercios
	ld a,001h		;7234
	call 05740h		;7236   ; 2 x 3 de 0xB178 o 0xB17E
	xor a			;7239
	call 05728h		;723a   ; 2 x 3 de 0xB16C o 0xB172 (segun A)
	call 05716h		;723d   ; 7 x 3 de 0xB0C7
	call 05b38h		;7240   ; los atributos de los sprites (0xE800, 0x80 bytes) a 0xE0: fuera de la pantalla
	ld a,000h		;7243
	call L_70F2		;7245   ; 0xE204 = A y el paso siguiente
	jp 042efh		;7248
L_724B:
	ld hl,0e204h		;724b   ; parpadea el borde y, a 0x80, el sonido 0x3A
	dec (hl)			;724e
	ld a,(hl)			;724f
	or a			;7250
	jr z,L_725C		;7251
	cp 080h		;7253
	jp c,L_73D5		;7255
	jp z,042f3h		;7258
	ret			;725b
L_725C:
	ld bc,00007h		;725c   ; R#7 = 0x00
	call 00047h		;725f   ; BIOS WRTVDP - Writes data in the VDP-register
	call 04ec7h		;7262   ; borra los sprites y la tabla de nombres (0x3800, 0x300 bytes)
	ld a,078h		;7265
	jp L_70F2		;7267
L_726A:
	ld hl,0e204h		;726a   ; el letrero de 0xAEDD y el fundido 0x0A
	dec (hl)			;726d
	ret nz			;726e
	ld hl,0aeddh		;726f
	call L_73E5		;7272   ; pinta el letrero de HL del banco 12
	ld de,01000h		;7275
	call L_743B		;7278   ; empieza un fundido de los colores del texto (MSX1 no tiene paleta): 0xEDB1 = 1, 0xEDB2 = cada cuantos cuadros
	jp L_70CA		;727b
L_727E:
	ld de,01000h		;727e
	call L_744F		;7281   ; un cuadro del fundido: cada D cuadros el color siguiente de la tabla 0x747D (o 0x7481)
	ld a,(0edb1h)		;7284
	or a			;7287
	ret nz			;7288
	xor a			;7289
	jp L_70F2		;728a
L_728D:
	ld hl,0e204h		;728d   ; apunta a la espera del paso (en cuadros)
	dec (hl)			;7290
	ret nz			;7291
	ld de,01001h		;7292
	call L_743B		;7295   ; empieza un fundido de los colores del texto (MSX1 no tiene paleta): 0xEDB1 = 1, 0xEDB2 = cada cuantos cuadros
	jp L_70CA		;7298
L_729B:
	ld de,01001h		;729b
	call L_744F		;729e   ; un cuadro del fundido: cada D cuadros el color siguiente de la tabla 0x747D (o 0x7481)
	ld a,(0edb1h)		;72a1
	or a			;72a4
	ret nz			;72a5
	call 04ec7h		;72a6   ; borra los sprites y la tabla de nombres (0x3800, 0x300 bytes)
	call 05b38h		;72a9   ; los atributos de los sprites (0xE800, 0x80 bytes) a 0xE0: fuera de la pantalla
	call L_7427		;72ac   ; borra las tablas de patrones y de colores (0x0000 y 0x2000, 0x1800 bytes cada una)
	ld a,00fh		;72af
	call 05758h		;72b1   ; 32 columnas de 23 caracteres de la tabla 0xABE7, desde la entrada A
	call 04229h		;72b4   ; pide el sonido 0x0E
	ld a,002h		;72b7
	call 05410h		;72b9   ; prepara un fundido de la tabla 0x9432
	call 0541bh		;72bc   ; un cuadro del fundido de entrada, por pasos (0xEDD2)
	jp L_70CA		;72bf
L_72C2:
	call 0541bh		;72c2   ; un cuadro del fundido de entrada, por pasos (0xEDD2)
	ld a,(0edd4h)		;72c5
	or a			;72c8
	ret nz			;72c9
	ld a,020h		;72ca
	jp L_70F2		;72cc
L_72CF:
	ld hl,0e204h		;72cf   ; el personaje en (0x9F, 0x80), el fundido 6
	dec (hl)			;72d2
	ret nz			;72d3
	ld a,097h		;72d4
	ld (0edcbh),a		;72d6   ; guarda la y del personaje de las secuencias
	ld a,080h		;72d9
	ld (0edcch),a		;72db   ; guarda la x del personaje de las secuencias
	xor a			;72de
	ld (0edd8h),a		;72df
	ld (0edceh),a		;72e2
	call L_74A1		;72e5   ; el personaje de las secuencias: cuatro sprites desde 0xE810 con los dibujos de la tabla 0x74E2
	jp L_70CA		;72e8
L_72EB:
	call L_74A1		;72eb   ; el personaje de las secuencias: cuatro sprites desde 0xE810 con los dibujos de la tabla 0x74E2
	ld a,030h		;72ee
	jp L_70F2		;72f0
L_72F3:
	call L_74A1		;72f3   ; el letrero de 0xAF21 y el fundido 0x0B
	ld hl,0e204h		;72f6   ; apunta a la espera del paso (en cuadros)
	dec (hl)			;72f9
	ret nz			;72fa
	ld a,004h		;72fb
	ld (0edd8h),a		;72fd
	call 05890h		;7300   ; las fuentes del marcador: 0xAA29, 0xAA89 y 0xAB79 a los tres tercios, con color 0xF0
	ld hl,0af21h		;7303
	call L_73E5		;7306   ; pinta el letrero de HL del banco 12
	ld de,01000h		;7309
	call L_743B		;730c   ; empieza un fundido de los colores del texto (MSX1 no tiene paleta): 0xEDB1 = 1, 0xEDB2 = cada cuantos cuadros
	jp L_70CA		;730f
L_7312:
	ld de,01000h		;7312
	call L_744F		;7315   ; un cuadro del fundido: cada D cuadros el color siguiente de la tabla 0x747D (o 0x7481)
	ld a,(0edb1h)		;7318
	or a			;731b
	jp nz,L_74A1		;731c
	xor a			;731f
	jp L_70F2		;7320
L_7323:
	ld hl,0e204h		;7323   ; apunta a la espera del paso (en cuadros)
	dec (hl)			;7326
	ret nz			;7327
	xor a			;7328
	ld (0edd8h),a		;7329
	call L_74A1		;732c   ; el personaje de las secuencias: cuatro sprites desde 0xE810 con los dibujos de la tabla 0x74E2
	jp L_70CA		;732f
L_7332:
	call L_7485		;7332   ; cada 16 cuadros, el dibujo siguiente del personaje (tabla 0x749D)
	ld hl,0edc9h		;7335
	ld a,(hl)			;7338
	and 003h		;7339
	jp nz,L_74A1		;733b
	ld hl,0edcch		;733e   ; apunta a la x del personaje de las secuencias
	dec (hl)			;7341
	ld a,(hl)			;7342
	or a			;7343
	jp nz,L_74A1		;7344
	call 05b38h		;7347   ; los atributos de los sprites (0xE800, 0x80 bytes) a 0xE0: fuera de la pantalla
	ld a,001h		;734a
	call 053f9h		;734c   ; prepara un fundido: la lista 0x9422 + 5 x A
	ld de,00101h		;734f
	call L_743B		;7352   ; empieza un fundido de los colores del texto (MSX1 no tiene paleta): 0xEDB1 = 1, 0xEDB2 = cada cuantos cuadros
	jp L_70CA		;7355
L_7358:
	ld de,00101h		;7358
	call L_744F		;735b   ; un cuadro del fundido: cada D cuadros el color siguiente de la tabla 0x747D (o 0x7481)
	call 0550bh		;735e   ; un cuadro del fundido de salida, por pasos
	ld a,(0edd4h)		;7361
	or a			;7364
	ld b,a			;7365
	ret nz			;7366
	ld a,(0edb1h)		;7367
	or b			;736a
	ret nz			;736b
	call 04ec7h		;736c   ; borra los sprites y la tabla de nombres (0x3800, 0x300 bytes)
	call 05890h		;736f   ; las fuentes del marcador: 0xAA29, 0xAA89 y 0xAB79 a los tres tercios, con color 0xF0
	ld hl,0edcfh		;7372
	ld (hl),0ffh		;7375
	ld a,060h		;7377
	jp L_70F2		;7379
L_737C:
	ld hl,0e204h		;737c   ; los letreros de la tabla 0xAD76, uno por paso (0xEDCF)
	dec (hl)			;737f
	ret nz			;7380
	ld hl,0edcfh		;7381
	inc (hl)			;7384
	ld de,00c00h		;7385
	call L_743B		;7388   ; empieza un fundido de los colores del texto (MSX1 no tiene paleta): 0xEDB1 = 1, 0xEDB2 = cada cuantos cuadros
	call L_73F7		;738b   ; el letrero 0xEDCF de la tabla 0xAD76 (banco 12)
	jp L_70CA		;738e
L_7391:
	ld de,00c00h		;7391
	call L_744F		;7394   ; un cuadro del fundido: cada D cuadros el color siguiente de la tabla 0x747D (o 0x7481)
	ld a,(0edb1h)		;7397
	or a			;739a
	ret nz			;739b
	xor a			;739c
	jp L_70F2		;739d
L_73A0:
	ld hl,0e204h		;73a0   ; hasta el 9, el fundido 3 entre ellos
	dec (hl)			;73a3
	ret nz			;73a4
	ld de,00c01h		;73a5
	call L_743B		;73a8   ; empieza un fundido de los colores del texto (MSX1 no tiene paleta): 0xEDB1 = 1, 0xEDB2 = cada cuantos cuadros
	jp L_70CA		;73ab
L_73AE:
	ld de,00c01h		;73ae
	call L_744F		;73b1   ; un cuadro del fundido: cada D cuadros el color siguiente de la tabla 0x747D (o 0x7481)
	ld a,(0edb1h)		;73b4
	or a			;73b7
	ret nz			;73b8
	call 04ec7h		;73b9   ; borra los sprites y la tabla de nombres (0x3800, 0x300 bytes)
	ld a,020h		;73bc
	jp L_70F2		;73be
L_73C1:
	ld a,(0e208h)		;73c1   ; al final, con disparo se vuelve a empezar
	and 030h		;73c4
	ret z			;73c6
	sub a			;73c7
	ld (0e257h),a		;73c8   ; guarda el paso de la secuencia en curso (entrada, fase o piramide acabada)
	ret			;73cb
L_73CC:
	call 041bdh		;73cc   ; el dibujo de 0xBCD2 (banco 12)
	call 0bcb8h		;73cf   ; un cuadro de las estrellas
	jp 04192h		;73d2
L_73D5:
	ld a,(0edc9h)		;73d5   ; el borde parpadea: color 0 o 11 cada 4 cuadros
	rra			;73d8
	rra			;73d9
	ld bc,00007h		;73da
	jp c,00047h		;73dd   ; BIOS WRTVDP - Writes data in the VDP-register
	ld b,00fh		;73e0
	jp 00047h		;73e2   ; BIOS WRTVDP - Writes data in the VDP-register
L_73E5:
	call 041bdh		;73e5   ; pinta el letrero de HL del banco 12
	call 04f0bh		;73e8   ; pinta un letrero: [D][E] y caracteres; 0xFE trae otra posicion; 0xFF acaba
	jp 04192h		;73eb
L_73EE:
	call 041bdh		;73ee   ; lo borra
	call 04f0fh		;73f1   ; lo mismo, borrando (caracter 0)
	jp 04192h		;73f4
L_73F7:
	call 041bdh		;73f7   ; el letrero 0xEDCF de la tabla 0xAD76 (banco 12)
	ld a,(0edcfh)		;73fa
	ld hl,0ad76h		;73fd
	call 04d4dh		;7400   ; HL = la palabra A de la tabla de HL
	call 04f0bh		;7403   ; pinta un letrero: [D][E] y caracteres; 0xFE trae otra posicion; 0xFF acaba
	jp 04192h		;7406
L_7409:
	ld a,(0edc9h)		;7409   ; el dibujo de 0xB16C o 0xB172 cada 16 cuadros (lo que en MSX2 es un color que parpadea)
	rra			;740c
	rra			;740d
	rra			;740e
	rra			;740f
	ld a,000h		;7410
	jp nc,05728h		;7412
	inc a			;7415
	jp 05728h		;7416
L_7419:
	ld hl,0ad69h		;7419   ; el letrero de 0xAD69 aparece y desaparece cada 16 cuadros
	ld a,(0e204h)		;741c   ; lee la espera del paso (en cuadros)
	rra			;741f
	rra			;7420
	rra			;7421
	rra			;7422
	jr c,L_73E5		;7423
	jr L_73EE		;7425
L_7427:
	ld hl,02000h		;7427   ; borra las tablas de patrones y de colores (0x0000 y 0x2000, 0x1800 bytes cada una)
	ld bc,01800h		;742a
	xor a			;742d
	call 04e10h		;742e   ; llena BC bytes de la VRAM con A (BIGFIL)
	ld hl,00000h		;7431
	ld bc,01800h		;7434
	xor a			;7437
	jp 04e10h		;7438
L_743B:
	ld hl,0edb1h		;743b   ; empieza un fundido de los colores del texto (MSX1 no tiene paleta): 0xEDB1 = 1, 0xEDB2 = cada cuantos cuadros
	ld (hl),001h		;743e
	inc hl			;7440
	ld (hl),d			;7441
	inc hl			;7442
	ld (hl),000h		;7443
	ld a,010h		;7445   ; el primer color: 0x10 o 0xF0 segun el bit 0 de E
	rr e		;7447
	jr nc,L_746F		;7449
	ld a,0f0h		;744b
	jr L_746F		;744d
L_744F:
	ld hl,0edb2h		;744f   ; un cuadro del fundido: cada D cuadros el color siguiente de la tabla 0x747D (o 0x7481)
	dec (hl)			;7452
	ret nz			;7453
	ld (hl),d			;7454
	ld a,(0edb3h)		;7455
	inc a			;7458
	cp 004h		;7459   ; cuatro pasos y se acaba (0xEDB1 = 0)
	jr nc,L_7478		;745b
	ld (0edb3h),a		;745d
	rr e		;7460
	ld e,a			;7462
	ld d,000h		;7463
	ld hl,0747dh		;7465
	jr nc,L_746D		;7468
	ld hl,07481h		;746a
L_746D:
	add hl,de			;746d
	ld a,(hl)			;746e
L_746F:
	ld hl,00680h		;746f   ; el color A a los caracteres 0x68-0x97 (0x0680, 0x180 bytes) de los tres tercios
	ld bc,00180h		;7472
	jp 04ea8h		;7475
L_7478:
	xor a			;7478
	ld (0edb1h),a		;7479
	ret			;747c

; ----------------------------------------------------------------------
; DATOS resto_747D: lo apuntan con el banco puesto p01:7465 (0x747D), p01:746A
;   (0x7481); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p01:7465, p01:746A (8 bytes)
;   0x747d..0x7485  (8 bytes)
DATA_resto_747D:
	defb 010h,040h,070h,0f0h,0f0h,070h,040h,010h	; 747d  .@p..p@.

; ======================================================================
; CODIGO 0x7485..0x749d  (24 bytes)
; ======================================================================


L_7485:
	ld a,(0edc9h)		;7485   ; cada 16 cuadros, el dibujo siguiente del personaje (tabla 0x749D)
	and 00fh		;7488
	ret nz			;748a
	ld hl,0edceh		;748b
	inc (hl)			;748e
	ld a,(hl)			;748f
	and 003h		;7490
	ld hl,0749dh		;7492
	call 04094h		;7495   ; suma A a HL (HL = HL + A)
	ld a,(hl)			;7498
	ld (0edd8h),a		;7499
	ret			;749c

; ----------------------------------------------------------------------
; DATOS resto_749D: lo apuntan con el banco puesto p01:7492 (0x749D); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p01:7492 (4 bytes)
;   0x749d..0x74a1  (4 bytes)
DATA_resto_749D:
	defb 001h,002h,003h,002h	; 749d

; ======================================================================
; CODIGO 0x74a1..0x74e2  (65 bytes)
; ======================================================================


L_74A1:
	ld hl,0e810h		;74a1   ; el personaje de las secuencias: cuatro sprites desde 0xE810 con los dibujos de la tabla 0x74E2
	ld de,074e2h		;74a4
	ld a,(0edd8h)		;74a7
	add a,a			;74aa
	add a,a			;74ab
	add a,a			;74ac
	call 04099h		;74ad   ; suma A a DE (DE = DE + A)
	exx			;74b0
	ld b,007h		;74b1
	exx			;74b3
	call L_74C9		;74b4   ; un sprite: y + su desplazamiento, x, dibujo y color (B')
	exx			;74b7
	ld b,00ah		;74b8
	exx			;74ba
	call L_74C9		;74bb   ; un sprite: y + su desplazamiento, x, dibujo y color (B')
	exx			;74be
	ld b,001h		;74bf
	exx			;74c1
	call L_74C9		;74c2   ; un sprite: y + su desplazamiento, x, dibujo y color (B')
	exx			;74c5
	ld b,001h		;74c6
	exx			;74c8
L_74C9:
	ld a,(0edcch)		;74c9   ; un sprite: y + su desplazamiento, x, dibujo y color (B')
	ld b,a			;74cc
	ld a,(0edcbh)		;74cd   ; lee la y del personaje de las secuencias
	ld c,a			;74d0
	ld a,(de)			;74d1
	add a,c			;74d2
	ld (hl),a			;74d3
	inc hl			;74d4
	ld (hl),b			;74d5
	inc de			;74d6
	inc hl			;74d7
	ld a,(de)			;74d8
	ld (hl),a			;74d9
	inc hl			;74da
	exx			;74db
	ld a,b			;74dc
	exx			;74dd
	ld (hl),a			;74de
	inc hl			;74df
	inc de			;74e0
	ret			;74e1

; ----------------------------------------------------------------------
; DATOS resto_74E2: lo apuntan con el banco puesto p01:74A4 (0x74E2); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p01:74A4 (56 bytes)
;   0x74e2..0x751a  (56 bytes)
DATA_resto_74E2:
	defb 0ffh,000h,0fch,004h,0f8h,008h,008h,00ch,0ffh,010h,0fch,014h,0f8h,018h,008h,01ch	; 74e2  ................
	defb 0ffh,020h,0fch,024h,0f8h,028h,008h,02ch,0ffh,030h,0fch,034h,0f8h,038h,008h,03ch	; 74f2  . .$.(.,.0.4.8.<
	defb 0feh,060h,0fch,064h,0f8h,068h,008h,06ch,0feh,040h,0fch,044h,0f8h,048h,008h,04ch	; 7502  .`.d.h.l.@.D.H.L
	defb 0feh,050h,0fch,054h,0f8h,058h,008h,05ch	; 7512  .P.T.X.\

; ======================================================================
; CODIGO 0x751a..0x7521  (7 bytes)
; ======================================================================


L_751A:
	ld a,(0e25ah)		;751a   ; el editor (estado 11), por pasos (0xE25A)
	dec a			;751d
	call 0409eh		;751e   ; el despachador de Konami: la tabla va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_7521: 6 destinos del despachador p00:409E (call en p01:751E, el
;   indice en A): 752D, 756E, 758D, 759E, 7743, 8245; lo leen p01:751E (12
;   bytes)
;   0x7521..0x752d  (12 bytes)
DATA_tabla_7521:
	defw 0752dh,0756eh,0758dh,0759eh,07743h,08245h	; 7521

; ======================================================================
; CODIGO 0x752d..0x7749  (540 bytes)
; ======================================================================


L_752D:
	call 04ec7h		;752d   ; paso 1: los graficos de la piramide 1, su paleta, el personaje y la rejilla
	ld a,001h		;7530
	ld (0e241h),a		;7532   ; guarda la piramide (1-6)
	call 052fdh		;7535   ; los graficos de la piramide: su lista y la comun
	call L_76EA		;7538   ; los sprites, el personaje mirando a la derecha sin nada en la mano y sus dibujos
	call L_7596		;753b   ; el paso siguiente del editor (0xE25A + 1, 0xE25B = 0)
	ld a,001h		;753e
	ld (0e25bh),a		;7540   ; guarda el paso dentro del menu del editor
	ld hl,0e2c0h		;7543   ; 0xE2C0-0xEFFF a cero
	ld de,0e2c1h		;7546
	ld bc,00d3fh		;7549
	ld (hl),000h		;754c
	ldir		;754e
	call 05b38h		;7550   ; los atributos de los sprites (0xE800, 0x80 bytes) a 0xE0: fuera de la pantalla
	ld hl,0e25ch		;7553   ; 0xE25C-0xE26F a cero
	ld de,0e25dh		;7556
	ld bc,00013h		;7559
	ld (hl),000h		;755c
	ldir		;755e
L_7560:
	ld hl,0e270h		;7560   ; el nombre (0xE270, 12 bytes) en blanco
	ld de,0e271h		;7563
	ld bc,0000bh		;7566
	ld (hl),020h		;7569
	ldir		;756b
	ret			;756d
L_756E:
	call 0879fh		;756e   ; paso 2: el menu del editor (0x8B95); al acabar, segun 0xE27E
	ld a,(0e25bh)		;7571   ; lee el paso dentro del menu del editor
	and a			;7574
	ret nz			;7575
	call L_7596		;7576   ; el paso siguiente del editor (0xE25A + 1, 0xE25B = 0)
	ld a,(0e27eh)		;7579
	and a			;757c
	ret z			;757d
	dec a			;757e
	jr nz,L_7587		;757f
	call L_7596		;7581   ; el paso siguiente del editor (0xE25A + 1, 0xE25B = 0)
	jp L_7656		;7584
L_7587:
	ld a,001h		;7587
	ld (0e25ah),a		;7589   ; guarda el paso del editor
	ret			;758c
L_758D:
	call 04ec7h		;758d   ; la rejilla de pantallas en blanco
	call L_7682		;7590   ; los caracteres de la rejilla: rachas de 0x82CD y 0x82E2 a los tres tercios
	call L_7694		;7593   ; la rejilla con caracteres: la fila de arriba...
L_7596:
	ld hl,0e25ah		;7596   ; el paso siguiente del editor (0xE25A + 1, 0xE25B = 0)
	inc (hl)			;7599
	inc hl			;759a
	ld (hl),000h		;759b
	ret			;759d
L_759E:
	call L_7660		;759e   ; paso: la rejilla de pantallas, con su cursor
	ld a,(0e20ch)		;75a1   ; RETURN acaba; los cursores mueven (0xE25C fila, 0xE25D columna); el disparo pone y el segundo boton quita
	rla			;75a4
	jp c,L_763A		;75a5
	ld a,(0e207h)		;75a8   ; lee el mando: lo que se acaba de pulsar
	rra			;75ab
	ld hl,0e25ch		;75ac
	jp c,L_7633		;75af
	rra			;75b2
	jp c,L_762B		;75b3
	rra			;75b6
	ld hl,0e25dh		;75b7
	jp c,L_7633		;75ba
	rra			;75bd
	jp c,L_762B		;75be
	rra			;75c1
	ld hl,0e25eh		;75c2
	jr c,L_75D8		;75c5
	rra			;75c7
	ret nc			;75c8
	ld a,(hl)			;75c9
	and a			;75ca
	ret z			;75cb
	push hl			;75cc
	call L_773D		;75cd   ; NZ si en la casilla del cursor hay pantalla
	pop hl			;75d0
	ret z			;75d1
	dec (hl)			;75d2
	ld b,000h		;75d3
	jp L_75E9		;75d5
L_75D8:
	ld a,(hl)			;75d8   ; poner una pantalla: si la casilla esta libre, tiene que tocar a otra
	and a			;75d9
	jr z,L_75E2		;75da
	push hl			;75dc
	call L_7717		;75dd   ; se puede poner si toca a una pantalla puesta (arriba, abajo, izquierda o derecha); NZ si se puede
	pop hl			;75e0
	ret z			;75e1
L_75E2:
	ld a,(hl)			;75e2   ; hasta 6 pantallas (0xE25E)
	cp 006h		;75e3
	ret nc			;75e5
	inc (hl)			;75e6
	ld b,001h		;75e7
L_75E9:
	call L_7709		;75e9   ; la casilla de la rejilla: puesta (1) o quitada (0), y su recuadro de caracteres
	ld (hl),b			;75ec
	ld hl,(0e25ch)		;75ed
	ld a,h			;75f0
	ld h,000h		;75f1
	add hl,hl			;75f3
	add hl,hl			;75f4
	add hl,hl			;75f5
	add hl,hl			;75f6
	add hl,hl			;75f7
	ld d,h			;75f8
	ld e,l			;75f9
	add hl,hl			;75fa
	add hl,de			;75fb
	add a,a			;75fc
	add a,a			;75fd
	call 04094h		;75fe   ; suma A a HL (HL = HL + A)
	ld de,03864h		;7601   ; el recuadro en la tabla de nombres: 0x3864 + fila x 0x60 + columna x 4
	add hl,de			;7604
	ex de,hl			;7605
	ld a,b			;7606   ; relleno (0x82A1) o vacio (0x8295)
	and a			;7607
	ld hl,08295h		;7608
	jr z,L_7610		;760b
	ld hl,082a1h		;760d
L_7610:
	ld bc,00304h		;7610   ; 3 filas de 4 caracteres
L_7613:
	push hl			;7613
	push de			;7614
	push bc			;7615
	ld b,000h		;7616
	call 04e06h		;7618   ; escribe BC bytes en la VRAM (LDIRVM) sin tocar registros
	pop bc			;761b
	pop de			;761c
	pop hl			;761d
	ld a,004h		;761e
	call 04094h		;7620   ; suma A a HL (HL = HL + A)
	ld a,020h		;7623
	call 04099h		;7625   ; suma A a DE (DE = DE + A)
	djnz L_7613		;7628
	ret			;762a
L_762B:
	ld a,(hl)			;762b   ; una mas (hasta 5) con el sonido 0x32
	cp 005h		;762c
	ret nc			;762e
	inc (hl)			;762f
	jp 042d3h		;7630
L_7633:
	ld a,(hl)			;7633   ; una menos (hasta 0) con el sonido 0x32
	and a			;7634
	ret z			;7635
	dec (hl)			;7636
	jp 042d3h		;7637
L_763A:
	ld hl,0e788h		;763a   ; RETURN: numera las pantallas por orden (hasta 6) y sigue
	ld bc,03001h		;763d
L_7640:
	ld a,(hl)			;7640
	and a			;7641
	jr z,L_7646		;7642
	ld (hl),c			;7644
	inc c			;7645
L_7646:
	ld a,c			;7646
	cp 007h		;7647
	jr nc,L_7650		;7649
	inc hl			;764b
	djnz L_7640		;764c
	dec c			;764e
	ret z			;764f
L_7650:
	call 083bfh		;7650   ; prepara los saltos de la fase hecha en el editor: las listas de 0xED80-0xEDB0
	call L_792E		;7653   ; 0xE262 = la casilla de la pantalla 1
L_7656:
	xor a			;7656   ; 0xE260 y 0xE261 a cero, la fuente del menu y el paso siguiente
	ld hl,0e260h		;7657   ; apunta a la opcion del menu del editor (0-10)
	ld (hl),a			;765a
	inc hl			;765b
	ld (hl),a			;765c
	jp L_7596		;765d
L_7660:
	ld hl,0e800h		;7660   ; el cursor de la rejilla: el sprite 0 en la casilla
	ld a,(0e25ch)		;7663
	add a,a			;7666
	add a,a			;7667
	add a,a			;7668
	ld b,a			;7669
	add a,a			;766a
	add a,b			;766b
	add a,01ch		;766c
	ld (hl),a			;766e
	inc hl			;766f
	ld a,(0e25dh)		;7670
	add a,a			;7673
	add a,a			;7674
	add a,a			;7675
	add a,a			;7676
	add a,a			;7677
	add a,028h		;7678
	ld (hl),a			;767a
	inc hl			;767b
	ld (hl),010h		;767c
	inc hl			;767e
	ld (hl),008h		;767f
	ret			;7681
L_7682:
	ld hl,026b8h		;7682   ; los caracteres de la rejilla: rachas de 0x82CD y 0x82E2 a los tres tercios
	ld de,082cdh		;7685
	call 04eb7h		;7688   ; rachas de DE a la VRAM de HL en los tres tercios (las mismas tres veces)
	ld hl,006b8h		;768b
	ld de,082e2h		;768e
	jp 04eb7h		;7691
L_7694:
	ld hl,03843h		;7694   ; la rejilla con caracteres: la fila de arriba...
	ld a,0d8h		;7697
	call 0004dh		;7699   ; BIOS WRTVRM - Writes data in VRAM
	ld hl,03844h		;769c
	ld bc,00018h		;769f
	ld a,0d9h		;76a2
	call 04e10h		;76a4   ; llena BC bytes de la VRAM con A (BIGFIL)
	ld hl,03863h		;76a7   ; ...las rayas verticales...
	ld bc,00712h		;76aa
L_76AD:
	push hl			;76ad
	push bc			;76ae
	ld b,c			;76af
L_76B0:
	ld a,0dah		;76b0
	push hl			;76b2
	call 0004dh		;76b3   ; BIOS WRTVRM - Writes data in VRAM
	pop hl			;76b6
	ld a,020h		;76b7
	call 04094h		;76b9   ; suma A a HL (HL = HL + A)
	djnz L_76B0		;76bc
	pop bc			;76be
	pop hl			;76bf
	ld a,004h		;76c0
	call 04094h		;76c2   ; suma A a HL (HL = HL + A)
	djnz L_76AD		;76c5
	ld hl,038a4h		;76c7   ; ...y las horizontales
	ld bc,00618h		;76ca
L_76CD:
	push hl			;76cd
	push bc			;76ce
	ld b,c			;76cf
L_76D0:
	ld a,b			;76d0
	and 003h		;76d1
	dec a			;76d3
	ld a,0dbh		;76d4
	jr z,L_76DA		;76d6
	ld a,0d9h		;76d8
L_76DA:
	call 0004dh		;76da   ; BIOS WRTVRM - Writes data in VRAM
	inc hl			;76dd
	djnz L_76D0		;76de
	pop bc			;76e0
	pop hl			;76e1
	ld a,060h		;76e2
	call 04094h		;76e4   ; suma A a HL (HL = HL + A)
	djnz L_76CD		;76e7
	ret			;76e9
L_76EA:
	call 0532eh		;76ea   ; los sprites, el personaje mirando a la derecha sin nada en la mano y sus dibujos
	xor a			;76ed
	ld (0e285h),a		;76ee   ; guarda el dibujo del personaje (direccion y paso)
	ld (0e298h),a		;76f1   ; guarda la marca de personaje muerto
	ld (0e287h),a		;76f4   ; guarda la postura del personaje
	call 0565fh		;76f7   ; los dibujos del personaje (bancos 14-15)
L_76FA:
	call 041c7h		;76fa   ; las rachas de 0xBBFC a 0x1880 (los sprites del editor)
	ld de,0bbfch		;76fd
	ld hl,01880h		;7700
	call 04e55h		;7703   ; lo mismo con el destino en HL
	jp 04192h		;7706
L_7709:
	ld hl,(0e25ch)		;7709   ; HL = la casilla del cursor en la rejilla (0xE788 + fila x 8 + columna)
	ld a,l			;770c
	add a,a			;770d
	add a,a			;770e
	add a,a			;770f
	add a,h			;7710
	ld hl,0e788h		;7711
	jp 04094h		;7714
L_7717:
	call L_7709		;7717   ; se puede poner si toca a una pantalla puesta (arriba, abajo, izquierda o derecha); NZ si se puede
	ld a,(hl)			;771a
	and a			;771b
	jr nz,L_773B		;771c
	ld d,h			;771e
	ld e,l			;771f
	dec hl			;7720
	ld a,(hl)			;7721
	and a			;7722
	ret nz			;7723
	inc hl			;7724
	inc hl			;7725
	ld a,(hl)			;7726
	and a			;7727
	ret nz			;7728
	ld a,007h		;7729
	call 04094h		;772b   ; suma A a HL (HL = HL + A)
	ld a,(hl)			;772e
	and a			;772f
	ret nz			;7730
	ex de,hl			;7731
	ld de,00008h		;7732
	or a			;7735
	sbc hl,de		;7736
	ld a,(hl)			;7738
	and a			;7739
	ret nz			;773a
L_773B:
	xor a			;773b
	ret			;773c
L_773D:
	call L_7709		;773d   ; NZ si en la casilla del cursor hay pantalla
	ld a,(hl)			;7740
	and a			;7741
	ret			;7742
L_7743:
	ld a,(0e25bh)		;7743   ; el menu del editor por pasos (0xE25B)
	call 0409eh		;7746   ; el despachador de Konami: la tabla va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_7749: 6 destinos del despachador p00:409E (call en p01:7746, el
;   indice en A): 7755, 778B, 786F, 78B4, 7A86, 7A74; lo leen p01:7746 (12
;   bytes)
;   0x7749..0x7755  (12 bytes)
DATA_tabla_7749:
	defw 07755h,0778bh,0786fh,078b4h,07a86h,07a74h	; 7749

; ======================================================================
; CODIGO 0x7755..0x7913  (446 bytes)
; ======================================================================


L_7755:
	call 04ec7h		;7755   ; paso 0: la pantalla de editar y su cursor
	call 05b38h		;7758   ; los atributos de los sprites (0xE800, 0x80 bytes) a 0xE0: fuera de la pantalla
	call L_776E		;775b   ; 13 x 2 caracteres de la fuente de 0xBC44 en 0xF038
	call 0825bh		;775e   ; la rejilla con el numero de cada pantalla
	call L_7972		;7761   ; el cursor de la rejilla (sprite 2) en la casilla 0xE262, parpadeando
	ld a,008h		;7764
	ld (0e80bh),a		;7766
L_7769:
	ld hl,0e25bh		;7769   ; el paso siguiente del menu (0xE25B + 1)
	inc (hl)			;776c
	ret			;776d
L_776E:
	call 041c7h		;776e   ; 13 x 2 caracteres de la fuente de 0xBC44 en 0xF038
	ld hl,0bc44h		;7771
	ld de,027f0h		;7774
	ld bc,00010h		;7777
	call 04e99h		;777a   ; escribe BC bytes de HL en la VRAM de DE en los tres tercios (DE, DE + 0x800, DE + 0x1000)
	call 04192h		;777d   ; pone los bancos 1-2-3 (el juego)
	ld hl,007f0h		;7780
	ld bc,00010h		;7783
	ld a,050h		;7786
	jp 04ea8h		;7788
L_778B:
	ld a,(0e20ch)		;778b   ; RETURN: segun la opcion 0xE260 (9 probar, 10 grabar o cargar, 4-6 editar)
	rla			;778e
	jr nc,L_77AD		;778f
	ld a,(0e260h)		;7791   ; lee la opcion del menu del editor (0-10)
	sub 009h		;7794
	jp z,L_7998		;7796
	dec a			;7799
	jr z,L_77EB		;779a
	sub 004h		;779c
	cp 003h		;779e
	jp nc,L_78E2		;77a0
	call L_7855		;77a3
	ld a,008h		;77a6
	ld (0e803h),a		;77a8
	jr L_77DB		;77ab
L_77AD:
	call L_781B		;77ad   ; elegir una de las 11 opciones (0xE260) con arriba y abajo; disparo elige
	ld hl,0e260h		;77b0   ; apunta a la opcion del menu del editor (0-10)
	ld a,(0e207h)		;77b3   ; lee el mando: lo que se acaba de pulsar
	rra			;77b6
	jr c,L_7806		;77b7
	rra			;77b9
	jr c,L_7810		;77ba
	rra			;77bc
	rra			;77bd
	rra			;77be
	ret nc			;77bf
	push hl			;77c0
	call L_7855		;77c1
	ld a,008h		;77c4
	ld (0e803h),a		;77c6
	pop hl			;77c9
	ld a,(hl)			;77ca
	cp 009h		;77cb
	jp z,L_7998		;77cd
	cp 00ah		;77d0
	jp z,L_77EB		;77d2
	sub 004h		;77d5
	cp 003h		;77d7
	jr nc,L_77E5		;77d9
L_77DB:
	xor a			;77db
	ld (0e261h),a		;77dc   ; guarda la opcion del submenu del editor
	call L_783C		;77df   ; el submenu de la opcion (tabla 0xBCBB): cuantas tiene (0xE263) y su letrero
	jp L_7769		;77e2
L_77E5:
	ld hl,0e25bh		;77e5   ; las opciones 0-3 y 7-8: al paso de editar
	inc (hl)			;77e8
	inc (hl)			;77e9
	ret			;77ea
L_77EB:
	ld a,005h		;77eb   ; la opcion 10: grabar o cargar (paso 5)
	ld (0e25bh),a		;77ed   ; guarda el paso dentro del menu del editor
	call 05b38h		;77f0   ; los atributos de los sprites (0xE800, 0x80 bytes) a 0xE0: fuera de la pantalla
	call 04ec7h		;77f3   ; borra los sprites y la tabla de nombres (0x3800, 0x300 bytes)
	xor a			;77f6
	call 08474h		;77f7   ; pinta el fondo del editor: el dibujo A de la tabla 0xBB38 (banco 13), un bit por caracter
	call 041c7h		;77fa   ; pone el banco 13 en 0xA000
	ld hl,0be77h		;77fd
	call 04f0bh		;7800   ; pinta un letrero: [D][E] y caracteres; 0xFE trae otra posicion; 0xFF acaba
	jp 04192h		;7803
L_7806:
	call 042d3h		;7806   ; la opcion anterior (de 0 se pasa a la 10)
	dec (hl)			;7809
	ld a,(hl)			;780a
	rla			;780b
	ret nc			;780c
	ld (hl),00ah		;780d
	ret			;780f
L_7810:
	call 042d3h		;7810   ; la siguiente (de 10 a 0)
	inc (hl)			;7813
	ld a,(hl)			;7814
	cp 00bh		;7815
	ret c			;7817
	ld (hl),000h		;7818
	ret			;781a
L_781B:
	ld b,010h		;781b   ; la flecha en la opcion, parpadeando cada 8 cuadros
	ld a,(0e260h)		;781d   ; lee la opcion del menu del editor (0-10)
	ld hl,0e800h		;7820   ; apunta a los atributos de los sprites (y, x, dibujo, color); al cargar graficos, su bufer
L_7823:
	add a,a			;7823
	add a,a			;7824
	add a,a			;7825
	add a,a			;7826
	add a,010h		;7827
	ld (hl),a			;7829
	inc hl			;782a
	ld (hl),b			;782b
	inc hl			;782c
	ld (hl),014h		;782d
	inc hl			;782f
	ld a,(0e203h)		;7830   ; lee la cuenta de cuadros
	and 008h		;7833
	ld a,008h		;7835
	jr z,L_783A		;7837
	xor a			;7839
L_783A:
	ld (hl),a			;783a
	ret			;783b
L_783C:
	call 041c7h		;783c   ; el submenu de la opcion (tabla 0xBCBB): cuantas tiene (0xE263) y su letrero
	ld a,(0e260h)		;783f   ; lee la opcion del menu del editor (0-10)
	sub 004h		;7842
	ld hl,0bcbbh		;7844
	call 04d4dh		;7847   ; HL = la palabra A de la tabla de HL
	ld a,(hl)			;784a
	ld (0e263h),a		;784b
	inc hl			;784e
	call 04f0bh		;784f   ; pinta un letrero: [D][E] y caracteres; 0xFE trae otra posicion; 0xFF acaba
	jp 04192h		;7852
L_7855:
	ld hl,03854h		;7855
	ld d,010h		;7858
L_785A:
	ld bc,0000ah		;785a
	xor a			;785d
	call 04e10h		;785e   ; llena BC bytes de la VRAM con A (BIGFIL)
	ld a,020h		;7861
	call 04094h		;7863   ; suma A a HL (HL = HL + A)
	dec d			;7866
	jr nz,L_785A		;7867
	ld a,0e0h		;7869
	ld (0e804h),a		;786b
	ret			;786e
L_786F:
	ld a,(0e20ch)		;786f   ; elige en el submenu (0xE261) con arriba y abajo; disparo sigue
	rla			;7872
	jp c,L_78E2		;7873
	call L_78A9		;7876
	ld hl,0e261h		;7879   ; apunta a la opcion del submenu del editor
	ld a,(0e207h)		;787c   ; lee el mando: lo que se acaba de pulsar
	rra			;787f
	jr c,L_7891		;7880
	rra			;7882
	jr c,L_789D		;7883
	rra			;7885
	rra			;7886
	rra			;7887
	ret nc			;7888
	ld a,008h		;7889
	ld (0e807h),a		;788b
	jp L_7769		;788e
L_7891:
	call 042d3h		;7891   ; pide el sonido 0x32
	dec (hl)			;7894
	ld a,(hl)			;7895
	rla			;7896
	ret nc			;7897
	ld a,(0e263h)		;7898
	ld (hl),a			;789b
	ret			;789c
L_789D:
	call 042d3h		;789d   ; pide el sonido 0x32
	inc (hl)			;78a0
	ld a,(0e263h)		;78a1
	cp (hl)			;78a4
	ret nc			;78a5
	ld (hl),000h		;78a6
	ret			;78a8
L_78A9:
	ld b,088h		;78a9
	ld a,(0e261h)		;78ab   ; lee la opcion del submenu del editor
	ld hl,0e804h		;78ae
	jp L_7823		;78b1
L_78B4:
	ld a,(0e20ch)		;78b4   ; elige la pantalla a editar en la rejilla (0xE262) con los cursores
	rla			;78b7
	jp c,L_78E2		;78b8
	call L_7972		;78bb   ; el cursor de la rejilla (sprite 2) en la casilla 0xE262, parpadeando
	ld hl,0e262h		;78be   ; apunta a la casilla de la pantalla que se edita
	ld de,0e788h		;78c1
	ld a,(0e207h)		;78c4   ; lee el mando: lo que se acaba de pulsar
	rra			;78c7
	jr c,$+120		;78c8
	rra			;78ca
	jr c,$+126		;78cb
	rra			;78cd
	jp c,L_7960		;78ce
	rra			;78d1
	jp c,L_7968		;78d2
	rra			;78d5
	ret nc			;78d6
	ld a,008h		;78d7
	ld (0e80bh),a		;78d9
	ld a,001h		;78dc
	ld (0e25bh),a		;78de   ; guarda el paso dentro del menu del editor
	ret			;78e1
L_78E2:
	call 04ec7h		;78e2   ; a editar la pantalla: el cursor en (0x0B, 0x0F) y lo que se pone (tabla 0x7CE4, 3 bytes por opcion)
	ld hl,0e264h		;78e5   ; apunta a la y del cursor del editor (en caracteres)
	ld (hl),00bh		;78e8
	inc hl			;78ea
	ld (hl),00fh		;78eb
	call 05b38h		;78ed   ; los atributos de los sprites (0xE800, 0x80 bytes) a 0xE0: fuera de la pantalla
	call L_79CB		;78f0   ; pinta la pantalla que se edita: ladrillos, cosas, salida y lo de 0xE300
	ld a,004h		;78f3
	ld (0e25bh),a		;78f5   ; guarda el paso dentro del menu del editor
	ld a,(0e260h)		;78f8   ; lee la opcion del menu del editor (0-10)
	ld b,a			;78fb
	add a,a			;78fc
	add a,b			;78fd
	ld hl,07913h		;78fe
	call 04094h		;7901   ; suma A a HL (HL = HL + A)
	ld a,(hl)			;7904
	ld (0e27ch),a		;7905
	inc hl			;7908
	ld a,(hl)			;7909
	ld (0e27dh),a		;790a
	inc hl			;790d
	ld a,(hl)			;790e
	ld (0e2fbh),a		;790f
	ret			;7912

; ----------------------------------------------------------------------
; DATOS resto_7913: lo apuntan con el banco puesto p01:78FE (0x7913); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p01:78FE (27 bytes)
;   0x7913..0x792e  (27 bytes)
DATA_resto_7913:
	defb 018h,020h,000h,018h,020h,000h,018h,01eh,001h,016h,01eh,011h,016h,01eh,011h,016h	; 7913  . .. ...........
	defb 01eh,011h,016h,01eh,011h,016h,01eh,011h,014h,01ch,011h	; 7923  ...........

; ======================================================================
; CODIGO 0x792e..0x7a9a  (364 bytes)
; ======================================================================


L_792E:
	ld hl,0e788h		;792e   ; 0xE262 = la casilla de la pantalla 1
	ld c,000h		;7931
L_7933:
	ld a,(hl)			;7933
	dec a			;7934
	jr z,L_793B		;7935
	inc hl			;7937
	inc c			;7938
	jr L_7933		;7939
L_793B:
	ld a,c			;793b
	ld (0e262h),a		;793c   ; guarda la casilla de la pantalla que se edita
	ret			;793f
L_7940:
	ld a,(hl)			;7940   ; a la casilla de arriba si hay pantalla
	and 038h		;7941
	ret z			;7943
	ld a,(hl)			;7944
	sub 008h		;7945
	jr L_7955		;7947
L_7949:
	ld a,(hl)			;7949   ; a la de abajo
	and 038h		;794a
	rrca			;794c
	rrca			;794d
	rrca			;794e
	cp 005h		;794f
	ret nc			;7951
	ld a,(hl)			;7952
	add a,008h		;7953
L_7955:
	ld b,a			;7955
	call 04099h		;7956   ; suma A a DE (DE = DE + A)
	ld a,(de)			;7959
	and a			;795a
	ret z			;795b
	ld (hl),b			;795c
	jp 042d3h		;795d
L_7960:
	ld a,(hl)			;7960   ; a la de la izquierda
	and 007h		;7961
	ret z			;7963
	ld a,(hl)			;7964
	dec a			;7965
	jr L_7955		;7966
L_7968:
	ld a,(hl)			;7968   ; a la de la derecha
	and 007h		;7969
	cp 005h		;796b
	ret nc			;796d
	ld a,(hl)			;796e
	inc a			;796f
	jr L_7955		;7970
L_7972:
	ld a,(0e262h)		;7972   ; el cursor de la rejilla (sprite 2) en la casilla 0xE262, parpadeando
	ld b,a			;7975
	and 038h		;7976
	add a,08fh		;7978
	ld hl,0e808h		;797a
	ld (hl),a			;797d
	inc hl			;797e
	ld a,b			;797f
	and 007h		;7980
	add a,a			;7982
	add a,a			;7983
	add a,a			;7984
	add a,0a0h		;7985
	ld (hl),a			;7987
	inc hl			;7988
	ld (hl),018h		;7989
	inc hl			;798b
	ld a,(0e203h)		;798c   ; lee la cuenta de cuadros
	and 008h		;798f
	ld a,008h		;7991
	jr z,L_7996		;7993
	xor a			;7995
L_7996:
	ld (hl),a			;7996
	ret			;7997
L_7998:
	ld hl,0e26ah		;7998   ; probar la fase (opcion 9): solo con 0xE26A y 0xE26B puestos
	ld a,(hl)			;799b
	inc hl			;799c
	and (hl)			;799d
	ret z			;799e
	call L_79B1		;799f   ; cuenta las cosas de 2 x 2 puestas (0xE700) a 0xE2F4 y 0xE2F5
	call 04ec7h		;79a2   ; borra los sprites y la tabla de nombres (0x3800, 0x300 bytes)
	call 05b38h		;79a5   ; los atributos de los sprites (0xE800, 0x80 bytes) a 0xE0: fuera de la pantalla
	call L_7596		;79a8   ; el paso siguiente del editor (0xE25A + 1, 0xE25B = 0)
	ld a,001h		;79ab
	ld (0e25bh),a		;79ad   ; guarda el paso dentro del menu del editor
	ret			;79b0
L_79B1:
	ld hl,0e700h		;79b1   ; cuenta las cosas de 2 x 2 puestas (0xE700) a 0xE2F4 y 0xE2F5
	ld bc,01000h		;79b4
L_79B7:
	ld a,(hl)			;79b7
	and a			;79b8
	jr z,L_79BC		;79b9
	inc c			;79bb
L_79BC:
	ld a,008h		;79bc
	call 04094h		;79be   ; suma A a HL (HL = HL + A)
	djnz L_79B7		;79c1
	ld a,c			;79c3
	ld (0e2f4h),a		;79c4   ; guarda cuantas cosas de 2 x 2 hay que coger
	ld (0e2f5h),a		;79c7   ; guarda cuantas cosas de 2 x 2 quedan por coger (con 0 se abre la salida)
	ret			;79ca
L_79CB:
	call L_7A60		;79cb   ; pinta la pantalla que se edita: ladrillos, cosas, salida y lo de 0xE300
	ld a,(0e26ch)		;79ce   ; lee cuantas columnas hay en el editor
	and a			;79d1
	call nz,L_7FC5		;79d2   ; pinta las columnas de esta pantalla (C = 1) o las borra (C = 0)
	call L_7B64		;79d5   ; A = la pantalla que se edita (de la casilla 0xE262)
	ld c,a			;79d8
	ld ix,0e700h		;79d9   ; las cosas de 2 x 2 de esta pantalla
	ld b,010h		;79dd
L_79DF:
	push bc			;79df
	ld a,(ix+000h)		;79e0
	and a			;79e3
	jr z,L_79EF		;79e4
	ld a,(ix+001h)		;79e6
	cp c			;79e9
	jr nz,L_79EF		;79ea
	call L_6347		;79ec   ; ...2 x 2 caracteres de 0x9324 en su sitio
L_79EF:
	ld bc,00008h		;79ef
	add ix,bc		;79f2
	pop bc			;79f4
	djnz L_79DF		;79f5
	call L_7B64		;79f7   ; la salida (0xE2F1-0xE2F3), 4 x 4 de 0x9340
	ld hl,0e2f3h		;79fa
	cp (hl)			;79fd
	jr nz,L_7A14		;79fe
	dec hl			;7a00
	ld d,(hl)			;7a01
	dec hl			;7a02
	ld e,(hl)			;7a03
	ld hl,09059h		;7a04
	ld bc,00404h		;7a07
	push bc			;7a0a
	push de			;7a0b
	call 053d6h		;7a0c   ; un rectangulo de caracteres de HL: B filas de C, en la tabla de nombres
	pop hl			;7a0f
	pop bc			;7a10
	call 081f0h		;7a11
L_7A14:
	call L_7B64		;7a14   ; las 64 cosas de 0xE300 (8 bytes cada una) de esta pantalla
	ld c,a			;7a17
	ld hl,0e300h		;7a18   ; apunta a las cosas que se cogen y se llevan (64 x 8 bytes)
	ld b,040h		;7a1b
L_7A1D:
	push bc			;7a1d
	ld a,(hl)			;7a1e
	and a			;7a1f
	push hl			;7a20
	jr z,L_7A38		;7a21
	inc hl			;7a23
	ld e,(hl)			;7a24
	inc hl			;7a25
	ld d,(hl)			;7a26
	dec a			;7a27
	ld b,a			;7a28
	inc hl			;7a29
	ld a,(hl)			;7a2a
	cp c			;7a2b
	jr nz,L_7A38		;7a2c
	ld a,b			;7a2e
	call 08119h		;7a2f   ; HL = el dibujo de la cosa A (0x9328 + 4 x A)
	ld bc,00202h		;7a32
	call 053d6h		;7a35   ; un rectangulo de caracteres de HL: B filas de C, en la tabla de nombres
L_7A38:
	pop hl			;7a38
	ld a,008h		;7a39
	call 04094h		;7a3b   ; suma A a HL (HL = HL + A)
	pop bc			;7a3e
	djnz L_7A1D		;7a3f
	ld a,(0e267h)		;7a41   ; lee cuantas cosas de 0xE600 hay en el editor
	and a			;7a44
	call nz,L_7E00		;7a45   ; pinta las cosas de 0xE600 de la pantalla que se edita
	ld a,(0e266h)		;7a48   ; lee cuantos sitios de salida de enemigos hay en el editor
	and a			;7a4b
	call nz,L_7D3E		;7a4c   ; los sprites de los sitios de salida de esta pantalla (desde 0xE840, dos por sitio)
	ld a,(0e26bh)		;7a4f   ; lee la marca de personaje puesto en el editor
	and a			;7a52
	ret z			;7a53
	ld a,(0e243h)		;7a54   ; lee la pantalla de la fase (desde 1)
	ld b,a			;7a57
	call L_7B64		;7a58   ; A = la pantalla que se edita (de la casilla 0xE262)
	cp b			;7a5b
	call z,L_7C71		;7a5c   ; los cuatro sprites del personaje en el editor (0xE808-0xE817), o fuera si no esta
	ret			;7a5f
L_7A60:
	call L_7B64		;7a60   ; los ladrillos de la pantalla que se edita
	dec a			;7a63
	ld h,000h		;7a64
	ld l,a			;7a66
	call 05b29h		;7a67   ; HL = 0xE900 + HL x 0xC0: el mapa de la pantalla HL (0-5)
	push hl			;7a6a
	pop ix		;7a6b
	xor a			;7a6d
	ld (0efc0h),a		;7a6e   ; guarda un dato de paso de la rutina en curso
	jp 0455bh		;7a71
L_7A74:
	call 08642h		;7a74   ; el menu de grabar y cargar (0x8A38)
	and a			;7a77
	ret z			;7a78
	dec a			;7a79
	jr z,L_7A81		;7a7a
	xor a			;7a7c
	ld (0e25bh),a		;7a7d   ; guarda el paso dentro del menu del editor
	ret			;7a80
L_7A81:
	xor a			;7a81
	ld (0e25ah),a		;7a82   ; guarda el paso del editor
	ret			;7a85
L_7A86:
	ld a,(0e20ch)		;7a86   ; en la pantalla: RETURN vuelve al menu; si no, lo de la opcion (tabla detras)
	rla			;7a89
	jr nc,L_7A91		;7a8a
	xor a			;7a8c
	ld (0e25bh),a		;7a8d   ; guarda el paso dentro del menu del editor
	ret			;7a90
L_7A91:
	call 08223h		;7a91   ; el cursor del editor: el sprite 0 en (0xE264, 0xE265), parpadeando
	ld a,(0e260h)		;7a94   ; lee la opcion del menu del editor (0-10)
	call 0409eh		;7a97   ; el despachador de Konami: la tabla va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_7A9A: 9 destinos del despachador p00:409E (call en p01:7A97, el
;   indice en A): 7AAC, 7B6F, 7B75, 7C43, 7CC4, 7D9B, 8059, 8121, 81B6; lo
;   leen p01:7A97 (18 bytes)
;   0x7a9a..0x7aac  (18 bytes)
DATA_tabla_7A9A:
	defw 07aach,07b6fh,07b75h,07c43h,07cc4h,07d9bh,08059h,08121h	; 7a9a
	defw 081b6h	; 7aaa

; ======================================================================
; CODIGO 0x7aac..0x7e25  (889 bytes)
; ======================================================================


L_7AAC:
	ld hl,00502h		;7aac   ; poner o quitar ladrillos: 0xEFD0 = el valor (disparo pone, segundo boton quita)
L_7AAF:
	ld (0efd0h),hl		;7aaf
	call 08325h		;7ab2   ; mueve el cursor del editor de 1 en 1 (limites en 0xE27C y 0xE2FB)
	call L_7C1B		;7ab5   ; limites del cursor: 0x20 x 0x00
	ret c			;7ab8
	ld a,(0e207h)		;7ab9   ; lee el mando: lo que se acaba de pulsar
	and 030h		;7abc
	ret z			;7abe
	and 010h		;7abf
	jr nz,L_7AC7		;7ac1
	xor a			;7ac3
	ld (0efd0h),a		;7ac4
L_7AC7:
	ld a,(0efd0h)		;7ac7   ; el valor en la casilla del cursor
	ld b,a			;7aca
	call L_7B64		;7acb   ; A = la pantalla que se edita (de la casilla 0xE262)
	ld h,a			;7ace
	call L_7B55		;7acf   ; D, E = el cursor en pixeles (0xE264 x 8, 0xE265 x 8)
	ex de,hl			;7ad2
	push hl			;7ad3
	ld a,d			;7ad4
	exx			;7ad5
	call 0928ah		;7ad6   ; DE = 0xE900 + (A - 1) x 0xC0: el mapa de la pantalla A
	pop hl			;7ad9
	call 09d5fh		;7ada   ; A = la casilla del mapa de DE en el pixel (H, L): 0 libre, 1-3 ladrillo o cosa
	exx			;7add
	ld c,a			;7ade
	ld a,b			;7adf
	and a			;7ae0
	jr nz,L_7AE9		;7ae1
	ld a,c			;7ae3
	cp 002h		;7ae4
	jr nc,L_7AEC		;7ae6
	ret			;7ae8
L_7AE9:
	ld a,c			;7ae9
	dec a			;7aea
	ret z			;7aeb
L_7AEC:
	ld a,b			;7aec   ; se marca en el mapa y se pinta
	push hl			;7aed
	push hl			;7aee
	push af			;7aef
	ld bc,00101h		;7af0
	call L_61F7		;7af3   ; marca un rectangulo del mapa de la pantalla D: B filas de C casillas con el valor A
	pop af			;7af6
	pop de			;7af7
	and a			;7af8
	jr nz,L_7B00		;7af9
	ld a,0e0h		;7afb
	ld (0efd1h),a		;7afd
L_7B00:
	ld a,(0efd1h)		;7b00
	call 053efh		;7b03   ; escribe el caracter A en la posicion D, E de la tabla de nombres
	pop de			;7b06
	push de			;7b07
	call L_7B3B		;7b08   ; en el borde izquierdo o derecho (x 0 o 0xF8): la pantalla de al lado
	pop hl			;7b0b
	and a			;7b0c
	ret z			;7b0d
	ld d,a			;7b0e
	dec c			;7b0f
	dec c			;7b10
	dec c			;7b11
	jr nz,L_7B1B		;7b12
	push hl			;7b14
	ld h,0f8h		;7b15
	call L_7B1F		;7b17   ; lo mismo en la pantalla de al lado si el cursor esta en el borde
	pop hl			;7b1a
L_7B1B:
	dec c			;7b1b
	ret nz			;7b1c
	ld h,000h		;7b1d
L_7B1F:
	push bc			;7b1f   ; lo mismo en la pantalla de al lado si el cursor esta en el borde
	push de			;7b20
	ld bc,00101h		;7b21
	ld a,(0efd0h)		;7b24
	push hl			;7b27
	push de			;7b28
	call L_61F7		;7b29   ; marca un rectangulo del mapa de la pantalla D: B filas de C casillas con el valor A
	call L_7B64		;7b2c   ; A = la pantalla que se edita (de la casilla 0xE262)
	pop bc			;7b2f
	pop de			;7b30
	cp b			;7b31
	ld a,(0efd1h)		;7b32
	call z,053efh		;7b35   ; escribe el caracter A en la posicion D, E de la tabla de nombres
	pop de			;7b38
	pop bc			;7b39
	ret			;7b3a
L_7B3B:
	ld c,003h		;7b3b   ; en el borde izquierdo o derecho (x 0 o 0xF8): la pantalla de al lado
	ld a,d			;7b3d
	and a			;7b3e
	jr z,L_7B49		;7b3f
	inc c			;7b41
	cp 0f8h		;7b42
	jr z,L_7B49		;7b44
	xor a			;7b46
	ld c,a			;7b47
	ret			;7b48
L_7B49:
	ld a,(0e262h)		;7b49   ; lee la casilla de la pantalla que se edita
	ld b,a			;7b4c
	ld a,c			;7b4d
	push bc			;7b4e
	call 05c2fh		;7b4f
	pop bc			;7b52
	ld a,l			;7b53
	ret			;7b54
L_7B55:
	ld a,(0e264h)		;7b55   ; D, E = el cursor en pixeles (0xE264 x 8, 0xE265 x 8)
	add a,a			;7b58
	add a,a			;7b59
	add a,a			;7b5a
	ld e,a			;7b5b
	ld a,(0e265h)		;7b5c   ; lee la x del cursor del editor (en caracteres)
	add a,a			;7b5f
	add a,a			;7b60
	add a,a			;7b61
	ld d,a			;7b62
	ret			;7b63
L_7B64:
	ld de,0e788h		;7b64   ; A = la pantalla que se edita (de la casilla 0xE262)
	ld a,(0e262h)		;7b67   ; lee la casilla de la pantalla que se edita
	call 04099h		;7b6a   ; suma A a DE (DE = DE + A)
	ld a,(de)			;7b6d
	ret			;7b6e
L_7B6F:
	ld hl,06203h		;7b6f   ; lo mismo con otro tamano (0x5E03)
	jp L_7AAF		;7b72
L_7B75:
	call 08325h		;7b75   ; poner o quitar una cosa de 1 x 2
	call L_7C20		;7b78   ; limites del cursor: 0x28 x 0x08
	ret c			;7b7b
	ld a,(0e207h)		;7b7c   ; lee el mando: lo que se acaba de pulsar
	and 030h		;7b7f
	ret z			;7b81
	and 010h		;7b82
	ld a,001h		;7b84
	jr nz,L_7B89		;7b86
	xor a			;7b88
L_7B89:
	ld (0efd0h),a		;7b89
	ld b,a			;7b8c
	call L_7B64		;7b8d   ; A = la pantalla que se edita (de la casilla 0xE262)
	ld h,a			;7b90
	exx			;7b91
	call 0928ah		;7b92   ; DE = 0xE900 + (A - 1) x 0xC0: el mapa de la pantalla A
	ld (0e250h),de		;7b95   ; guarda el mapa de la pantalla en la que se esta (16 bits)
	exx			;7b99
	call L_7B55		;7b9a   ; D, E = el cursor en pixeles (0xE264 x 8, 0xE265 x 8)
	ex de,hl			;7b9d
	ld a,b			;7b9e
	and a			;7b9f
	jr nz,L_7BBA		;7ba0
	push hl			;7ba2
	exx			;7ba3
	pop hl			;7ba4
	ld de,(0e250h)		;7ba5   ; lee el mapa de la pantalla en la que se esta (16 bits)
	push hl			;7ba9
	call 09d5fh		;7baa   ; A = la casilla del mapa de DE en el pixel (H, L): 0 libre, 1-3 ladrillo o cosa
	pop hl			;7bad
	dec a			;7bae
	ret nz			;7baf
	call 09b90h		;7bb0
	exx			;7bb3
	jr nc,L_7BBA		;7bb4
	ld a,h			;7bb6
	sub 008h		;7bb7
	ld h,a			;7bb9
L_7BBA:
	ld a,b			;7bba
	push hl			;7bbb
	push af			;7bbc
	ld bc,00102h		;7bbd
	push hl			;7bc0
	call L_61F7		;7bc1   ; marca un rectangulo del mapa de la pantalla D: B filas de C casillas con el valor A
	pop de			;7bc4
	call L_7BE0		;7bc5   ; en el borde de arriba o de abajo (y 0 o 0xB8): la pantalla de al lado
	pop af			;7bc8
	pop de			;7bc9
	and a			;7bca
	jr z,L_7BCF		;7bcb
	ld a,003h		;7bcd
L_7BCF:
	push af			;7bcf
	push de			;7bd0
	call 053efh		;7bd1   ; escribe el caracter A en la posicion D, E de la tabla de nombres
	pop de			;7bd4
	ld a,d			;7bd5
	add a,008h		;7bd6
	ld d,a			;7bd8
	pop af			;7bd9
	jr z,L_7BDD		;7bda
	inc a			;7bdc
L_7BDD:
	jp 053efh		;7bdd
L_7BE0:
	push de			;7be0   ; en el borde de arriba o de abajo (y 0 o 0xB8): la pantalla de al lado
	call L_7C0C		;7be1   ; en el borde de arriba o abajo
	pop hl			;7be4
	and a			;7be5
	ret z			;7be6
	ld d,a			;7be7
	dec c			;7be8
	ld l,0b8h		;7be9
	jr z,L_7BEF		;7beb
	ld l,000h		;7bed
L_7BEF:
	ld bc,00102h		;7bef
	ld a,(0efd0h)		;7bf2
	push hl			;7bf5
	push de			;7bf6
	call L_61F7		;7bf7   ; marca un rectangulo del mapa de la pantalla D: B filas de C casillas con el valor A
	call L_7B64		;7bfa   ; A = la pantalla que se edita (de la casilla 0xE262)
	pop bc			;7bfd
	pop de			;7bfe
	cp b			;7bff
	ret nz			;7c00
	ld a,(0efd0h)		;7c01
	and a			;7c04
	jr z,L_7C09		;7c05
	ld a,003h		;7c07
L_7C09:
	jp L_7BCF		;7c09
L_7C0C:
	ld c,001h		;7c0c   ; en el borde de arriba o abajo
	ld a,e			;7c0e
	and a			;7c0f
	jp z,L_7B49		;7c10
	inc c			;7c13
	cp 0b8h		;7c14
	jp z,L_7B49		;7c16
	xor a			;7c19
	ret			;7c1a
L_7C1B:
	ld bc,02000h		;7c1b   ; limites del cursor: 0x20 x 0x00
	jr L_7C23		;7c1e
L_7C20:
	ld bc,02808h		;7c20   ; limites del cursor: 0x28 x 0x08
L_7C23:
	ld a,(0e26ah)		;7c23   ; lee la marca de salida puesta en el editor
	and a			;7c26
	jr z,L_7C41		;7c27
	ld hl,0e2f3h		;7c29
	call L_7B64		;7c2c   ; C si (HL) es la pantalla que se edita y el cursor esta dentro del rectangulo de HL
	cp (hl)			;7c2f
	jr nz,L_7C41		;7c30
	dec hl			;7c32
	call L_7B55		;7c33   ; D, E = el cursor en pixeles (0xE264 x 8, 0xE265 x 8)
	ld a,d			;7c36
	add a,c			;7c37
	sub (hl)			;7c38
	cp b			;7c39
	ret nc			;7c3a
	dec hl			;7c3b
	ld a,e			;7c3c
	sub (hl)			;7c3d
	cp 020h		;7c3e
	ret			;7c40
L_7C41:
	or a			;7c41
	ret			;7c42
L_7C43:
	call 08325h		;7c43   ; editor: poner al personaje (disparo) en el cursor, o quitarlo (segundo boton)
	ld a,(0e207h)		;7c46   ; lee el mando: lo que se acaba de pulsar
	and 030h		;7c49
	ret z			;7c4b
	and 010h		;7c4c
	ld hl,0e282h		;7c4e   ; apunta a la y del personaje
	jr z,L_7C64		;7c51
	call L_7B64		;7c53   ; A = la pantalla que se edita (de la casilla 0xE262)
	ld (0e243h),a		;7c56   ; su pantalla y su sitio
	call L_7B55		;7c59   ; D, E = el cursor en pixeles (0xE264 x 8, 0xE265 x 8)
	ld (hl),e			;7c5c
	inc hl			;7c5d
	inc hl			;7c5e
	ld (hl),d			;7c5f
	ld a,001h		;7c60
	jr L_7C6E		;7c62
L_7C64:
	ld a,(0e243h)		;7c64   ; quitarlo, si esta en esta pantalla
	ld b,a			;7c67
	call L_7B64		;7c68   ; A = la pantalla que se edita (de la casilla 0xE262)
	cp b			;7c6b
	ret nz			;7c6c
	xor a			;7c6d
L_7C6E:
	ld (0e26bh),a		;7c6e   ; 0xE26B: el personaje esta puesto
L_7C71:
	ld hl,0e808h		;7c71   ; los cuatro sprites del personaje en el editor (0xE808-0xE817), o fuera si no esta
	ld de,0e80ch		;7c74
	exx			;7c77
	ld hl,0e810h		;7c78
	ld de,0e814h		;7c7b
	exx			;7c7e
	and a			;7c7f
	ld a,0e0h		;7c80
	jr z,L_7C87		;7c82
	ld a,(0e282h)		;7c84   ; lee la y del personaje
L_7C87:
	dec a			;7c87
	ld (hl),a			;7c88
	dec a			;7c89
	dec a			;7c8a
	dec a			;7c8b
	ld (de),a			;7c8c
	inc hl			;7c8d
	inc de			;7c8e
	exx			;7c8f
	dec a			;7c90
	dec a			;7c91
	dec a			;7c92
	dec a			;7c93
	ld (hl),a			;7c94
	add a,010h		;7c95
	ld (de),a			;7c97
	inc hl			;7c98
	inc de			;7c99
	exx			;7c9a
	ld a,(0e284h)		;7c9b   ; lee la x del personaje
	ld (hl),a			;7c9e
	ld (de),a			;7c9f
	inc hl			;7ca0
	inc de			;7ca1
	exx			;7ca2
	ld (hl),a			;7ca3
	ld (de),a			;7ca4
	inc hl			;7ca5
	inc de			;7ca6
	exx			;7ca7
	ld (hl),000h		;7ca8
	ld a,004h		;7caa
	ld (de),a			;7cac
	inc hl			;7cad
	inc de			;7cae
	exx			;7caf
	ld (hl),008h		;7cb0
	ld a,00ch		;7cb2
	ld (de),a			;7cb4
	inc hl			;7cb5
	inc de			;7cb6
	exx			;7cb7
	ld (hl),007h		;7cb8
	ld a,00ah		;7cba
	ld (de),a			;7cbc
	exx			;7cbd
	ld a,001h		;7cbe
	ld (hl),a			;7cc0
	ld (de),a			;7cc1
	exx			;7cc2
	ret			;7cc3
L_7CC4:
	call 08325h		;7cc4   ; editor: poner (disparo) o quitar un sitio de salida de enemigos (hasta 8, 0xE266)
	ld a,(0e207h)		;7cc7   ; lee el mando: lo que se acaba de pulsar
	and 030h		;7cca
	ret z			;7ccc
	and 010h		;7ccd
	ld hl,0e266h		;7ccf   ; apunta a cuantos sitios de salida de enemigos hay en el editor
	jr z,L_7D21		;7cd2
	ld a,(hl)			;7cd4
	cp 008h		;7cd5
	ret nc			;7cd7
	push hl			;7cd8
	call L_7D07		;7cd9   ; no se pone donde ya hay uno
	pop hl			;7cdc
	ret z			;7cdd
	inc (hl)			;7cde
	ld b,008h		;7cdf
	ld hl,0e2c0h		;7ce1   ; apunta a los sitios de los que salen los enemigos (8 x 5 bytes)
L_7CE4:
	ld a,(hl)			;7ce4   ; el primero libre de 0xE2C0
	and a			;7ce5
	jr z,L_7CEF		;7ce6
	ld a,005h		;7ce8
	call 04094h		;7cea   ; suma A a HL (HL = HL + A)
	jr L_7CE4		;7ced
L_7CEF:
	ld a,(0e261h)		;7cef   ; el tipo (opcion del submenu + 1, con el bit 7), la cuenta, la pantalla y el sitio
	inc a			;7cf2
	or 080h		;7cf3
	ld (hl),a			;7cf5
	inc hl			;7cf6
	ld (hl),020h		;7cf7
	inc hl			;7cf9
	call L_7B64		;7cfa   ; A = la pantalla que se edita (de la casilla 0xE262)
	ld (hl),a			;7cfd
	inc hl			;7cfe
	call L_7B55		;7cff   ; D, E = el cursor en pixeles (0xE264 x 8, 0xE265 x 8)
	ld (hl),e			;7d02
	inc hl			;7d03
	ld (hl),d			;7d04
	jr L_7D3E		;7d05
L_7D07:
	ld hl,0e2c0h		;7d07   ; Z si ya hay un sitio de salida en el cursor
	ld b,008h		;7d0a
L_7D0C:
	ld a,(hl)			;7d0c
	and a			;7d0d
	jr z,L_7D16		;7d0e
	push hl			;7d10
	call L_7D82		;7d11   ; Z si el sitio de HL esta en el cursor
	pop hl			;7d14
	ret z			;7d15
L_7D16:
	ld a,005h		;7d16
	call 04094h		;7d18   ; suma A a HL (HL = HL + A)
	djnz L_7D0C		;7d1b
	ld a,001h		;7d1d
	and a			;7d1f
	ret			;7d20
L_7D21:
	ld a,(hl)			;7d21   ; quitar el del cursor
	and a			;7d22
	ret z			;7d23
	ld hl,0e2c0h		;7d24   ; apunta a los sitios de los que salen los enemigos (8 x 5 bytes)
	ld b,008h		;7d27
L_7D29:
	ld a,(hl)			;7d29
	and a			;7d2a
	jr z,L_7D37		;7d2b
	push hl			;7d2d
	call L_7D82		;7d2e   ; Z si el sitio de HL esta en el cursor
	pop hl			;7d31
	push hl			;7d32
	call z,L_7D94		;7d33   ; lo quita
	pop hl			;7d36
L_7D37:
	ld a,005h		;7d37
	call 04094h		;7d39   ; suma A a HL (HL = HL + A)
	djnz L_7D29		;7d3c
L_7D3E:
	ld hl,0e2c0h		;7d3e   ; los sprites de los sitios de salida de esta pantalla (desde 0xE840, dos por sitio)
	ld b,008h		;7d41
	ld de,0e840h		;7d43
L_7D46:
	push hl			;7d46
	exx			;7d47
	call L_7B64		;7d48   ; A = la pantalla que se edita (de la casilla 0xE262)
	exx			;7d4b
	inc hl			;7d4c
	inc hl			;7d4d
	cp (hl)			;7d4e
	pop hl			;7d4f
	jr nz,L_7D75		;7d50
	push bc			;7d52
	push hl			;7d53
	push de			;7d54
	ld a,(hl)			;7d55
	and 07fh		;7d56
	ld c,a			;7d58
	inc hl			;7d59
	inc hl			;7d5a
	inc hl			;7d5b
	ld a,(hl)			;7d5c
	jr nz,L_7D61		;7d5d   ; la y, o fuera si no hay
	ld a,0e0h		;7d5f
L_7D61:
	ld (de),a			;7d61
	inc hl			;7d62
	inc de			;7d63
	ldi		;7d64
	ld a,c			;7d66
	ld hl,082adh		;7d67
	call 04d4dh		;7d6a   ; HL = la palabra A de la tabla de HL
	ld a,l			;7d6d
	ld (de),a			;7d6e
	inc de			;7d6f
	ld a,h			;7d70
	ld (de),a			;7d71
	pop de			;7d72
	pop hl			;7d73
	pop bc			;7d74
L_7D75:
	ld a,005h		;7d75
	call 04094h		;7d77   ; suma A a HL (HL = HL + A)
	ld a,004h		;7d7a
	call 04099h		;7d7c   ; suma A a DE (DE = DE + A)
	djnz L_7D46		;7d7f
	ret			;7d81
L_7D82:
	call L_7B64		;7d82   ; Z si el sitio de HL esta en el cursor
	inc hl			;7d85
	inc hl			;7d86
	cp (hl)			;7d87
	ret nz			;7d88
	call L_7B55		;7d89   ; D, E = el cursor en pixeles (0xE264 x 8, 0xE265 x 8)
	inc hl			;7d8c
	ld a,(hl)			;7d8d
	cp e			;7d8e
	ret nz			;7d8f
	inc hl			;7d90
	ld a,(hl)			;7d91
	cp d			;7d92
	ret			;7d93
L_7D94:
	ld (hl),000h		;7d94   ; lo quita
	ld hl,0e266h		;7d96   ; apunta a cuantos sitios de salida de enemigos hay en el editor
	dec (hl)			;7d99
	ret			;7d9a
L_7D9B:
	call 08312h		;7d9b   ; editor: poner (disparo) o quitar una cosa de 0xE600 (hasta 16, 0xE267); la opcion 7 son columnas
	ld a,(0e207h)		;7d9e   ; lee el mando: lo que se acaba de pulsar
	and 030h		;7da1
	ret z			;7da3
	and 010h		;7da4
	ld hl,0e267h		;7da6   ; apunta a cuantas cosas de 0xE600 hay en el editor
	jp z,L_7E92		;7da9
	ld a,(0e261h)		;7dac   ; lee la opcion del submenu del editor
	cp 007h		;7daf
	jp z,L_7F87		;7db1
	ld a,(hl)			;7db4
	cp 010h		;7db5
	ret nc			;7db7
	push hl			;7db8
	call L_7E2F		;7db9   ; Z si ya hay una cosa en el cursor
	pop hl			;7dbc
	ret z			;7dbd
	inc (hl)			;7dbe
	ld hl,0e600h		;7dbf   ; la primera ficha libre de 0xE600, a cero
L_7DC2:
	ld a,(hl)			;7dc2
	and a			;7dc3
	jr z,L_7DCD		;7dc4
	ld a,010h		;7dc6
	call 04094h		;7dc8   ; suma A a HL (HL = HL + A)
	jr L_7DC2		;7dcb
L_7DCD:
	push hl			;7dcd
	pop ix		;7dce
	ld b,010h		;7dd0
L_7DD2:
	ld (hl),000h		;7dd2
	inc hl			;7dd4
	djnz L_7DD2		;7dd5
	ld a,(0e261h)		;7dd7   ; el tipo sale de la opcion del submenu
	ld b,a			;7dda
	dec b			;7ddb
	cp 004h		;7ddc
	jr nc,L_7DE7		;7dde
	cp 002h		;7de0
	ld b,001h		;7de2
	jr c,L_7DE7		;7de4
	inc b			;7de6
L_7DE7:
	ld a,b			;7de7
	ld (ix+000h),a		;7de8
	call L_7B55		;7deb   ; su sitio y su pantalla
	ld (ix+002h),e		;7dee
	ld (ix+003h),d		;7df1
	call L_7B64		;7df4   ; A = la pantalla que se edita (de la casilla 0xE262)
	ld (ix+004h),a		;7df7
	ld (ix+009h),a		;7dfa
	call L_7EED		;7dfd   ; lo propio de su tipo
L_7E00:
	call L_7B64		;7e00   ; pinta las cosas de 0xE600 de la pantalla que se edita
	ld c,a			;7e03
	ld ix,0e600h		;7e04   ; apunta a las cosas de la fase (16 x 16 bytes)
	ld b,010h		;7e08
L_7E0A:
	push bc			;7e0a
	ld a,(ix+004h)		;7e0b   ; lee la pantalla de la cosa
	cp c			;7e0e
	jr nz,L_7E18		;7e0f
	ld a,(ix+000h)		;7e11   ; lee el tipo de la cosa (0: libre)
	and a			;7e14
	call nz,L_7E21		;7e15   ; cada tipo, su dibujo (tabla detras)
L_7E18:
	ld bc,00010h		;7e18
	add ix,bc		;7e1b
	pop bc			;7e1d
	djnz L_7E0A		;7e1e
	ret			;7e20
L_7E21:
	dec a			;7e21   ; cada tipo, su dibujo (tabla detras)
	call 0409eh		;7e22   ; el despachador de Konami: la tabla va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_7E25: 5 destinos del despachador p00:409E (call en p01:7E22, el
;   indice en A): 7E4A, 7E60, 7E7D, BB3B, 936B; lo leen p01:7E22 (10 bytes)
;   0x7e25..0x7e2f  (10 bytes)
DATA_tabla_7E25:
	defw 07e4ah,07e60h,07e7dh,0bb3bh,0936bh	; 7e25

; ======================================================================
; CODIGO 0x7e2f..0x7ed4  (165 bytes)
; ======================================================================


L_7E2F:
	ld ix,0e600h		;7e2f   ; Z si ya hay una cosa en el cursor
	ld b,010h		;7e33
L_7E35:
	ld a,(ix+000h)		;7e35   ; lee el tipo de la cosa (0: libre)
	and a			;7e38
	jr z,L_7E3F		;7e39
	call L_7ED9		;7e3b   ; Z si la cosa de IX esta en el cursor
	ret z			;7e3e
L_7E3F:
	ld de,00010h		;7e3f
	add ix,de		;7e42
	djnz L_7E35		;7e44
	ld a,001h		;7e46
	and a			;7e48
	ret			;7e49
L_7E4A:
	ld a,(ix+007h)		;7e4a   ; la cosa de tipo 1: su dibujo de 0x9374 (variante 0 o 3)
	and 002h		;7e4d
	ld a,003h		;7e4f
	jr nz,L_7E54		;7e51
	xor a			;7e53
L_7E54:
	ld hl,0908dh		;7e54
	ld de,0908dh		;7e57
	ld bc,0908dh		;7e5a
	jp 0b8deh		;7e5d
L_7E60:
	ld a,(ix+007h)		;7e60   ; la de tipo 2: segun la variante, los dibujos de 0x937C o de 0x9394
	rra			;7e63
	rra			;7e64
	ld hl,09095h		;7e65
	ld de,0909dh		;7e68
	ld bc,090a5h		;7e6b
	jp nc,0b8deh		;7e6e
	ld hl,090adh		;7e71
	ld de,090b5h		;7e74
	ld bc,090bdh		;7e77
	jp 0b8deh		;7e7a
L_7E7D:
	ld e,(ix+002h)		;7e7d   ; la de tipo 3: una columna de B caracteres 0xFE
	ld d,(ix+003h)		;7e80
	ld b,(ix+008h)		;7e83
L_7E86:
	ld a,0feh		;7e86
	call 053efh		;7e88   ; escribe el caracter A en la posicion D, E de la tabla de nombres
	ld a,e			;7e8b
	add a,008h		;7e8c
	ld e,a			;7e8e
	djnz L_7E86		;7e8f
	ret			;7e91
L_7E92:
	ld a,(0e261h)		;7e92   ; quitar la cosa del cursor
	cp 007h		;7e95
	jp z,08017h		;7e97
	ld a,(hl)			;7e9a
	and a			;7e9b
	ret z			;7e9c
	ld ix,0e600h		;7e9d   ; apunta a las cosas de la fase (16 x 16 bytes)
	ld b,010h		;7ea1
L_7EA3:
	ld a,(ix+000h)		;7ea3   ; lee el tipo de la cosa (0: libre)
	and a			;7ea6
	jr z,L_7EB1		;7ea7
	push hl			;7ea9
	call L_7ED9		;7eaa   ; Z si la cosa de IX esta en el cursor
	call z,L_7EB9		;7ead   ; se borra: su tamano de la tabla 0x82F3 y el fondo de 0x86C5
	pop hl			;7eb0
L_7EB1:
	ld de,00010h		;7eb1
	add ix,de		;7eb4
	djnz L_7EA3		;7eb6
	ret			;7eb8
L_7EB9:
	ld a,(ix+000h)		;7eb9   ; se borra: su tamano de la tabla 0x82F3 y el fondo de 0x86C5
	ld (ix+000h),000h		;7ebc
	dec (hl)			;7ec0
	ld hl,07ed3h		;7ec1
	call 04094h		;7ec4   ; suma A a HL (HL = HL + A)
	ld c,(hl)			;7ec7
	ld b,(ix+008h)		;7ec8
	call L_7B55		;7ecb   ; D, E = el cursor en pixeles (0xE264 x 8, 0xE265 x 8)
	ld hl,082b5h		;7ece
	jp 053d6h		;7ed1

; ----------------------------------------------------------------------
; DATOS sin identificar  0x7ed4..0x7ed9  (5 bytes)
DATA_7ED4:
	defb 002h,002h,001h,004h,002h	; 7ed4

; ======================================================================
; CODIGO 0x7ed9..0x7ef3  (26 bytes)
; ======================================================================


L_7ED9:
	call L_7B64		;7ed9   ; Z si la cosa de IX esta en el cursor
	cp (ix+004h)		;7edc
	ret nz			;7edf
	call L_7B55		;7ee0   ; D, E = el cursor en pixeles (0xE264 x 8, 0xE265 x 8)
	ld a,(ix+002h)		;7ee3
	cp e			;7ee6
	ret nz			;7ee7
	ld a,(ix+003h)		;7ee8
	cp d			;7eeb
	ret			;7eec
L_7EED:
	ld a,(0e261h)		;7eed   ; lo propio de cada opcion (tabla detras)
	call 0409eh		;7ef0   ; el despachador de Konami: la tabla va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_7EF3: 7 destinos del despachador p00:409E (call en p01:7EF0, el
;   indice en A): 7F01, 7F2F, 7F01, 7F33, 7F27, 7F1D, 7F22; lo leen p01:7EF0
;   (14 bytes)
;   0x7ef3..0x7f01  (14 bytes)
DATA_tabla_7EF3:
	defw 07f01h,07f2fh,07f01h,07f33h,07f27h,07f1dh,07f22h	; 7ef3

; ======================================================================
; CODIGO 0x7f01..0x8000  (255 bytes)
; ======================================================================


L_7F01:
	ld c,000h		;7f01   ; cuanto mide hacia abajo hasta el suelo (hasta 3): si no cabe, no se pone
	xor a			;7f03
	ld b,003h		;7f04
L_7F06:
	ld (ix+005h),c		;7f06
	ld (ix+007h),a		;7f09
	call L_7F3B		;7f0c   ; C = cuantas casillas libres hay debajo del cursor (hasta B)
	ld (ix+008h),c		;7f0f
	dec c			;7f12
	ret nz			;7f13
	ld (ix+000h),000h		;7f14
	ld hl,0e267h		;7f18   ; apunta a cuantas cosas de 0xE600 hay en el editor
	dec (hl)			;7f1b
	ret			;7f1c
L_7F1D:
	ld (ix+008h),001h		;7f1d
	ret			;7f21
L_7F22:
	ld (ix+008h),002h		;7f22
	ret			;7f26
L_7F27:
	xor a			;7f27   ; hasta 0x1E
	ld c,000h		;7f28
	ld b,01eh		;7f2a
	jp L_7F06		;7f2c
L_7F2F:
	ld c,003h		;7f2f
	jr L_7F35		;7f31
L_7F33:
	ld c,000h		;7f33
L_7F35:
	ld a,002h		;7f35
	ld b,003h		;7f37
	jr L_7F06		;7f39
L_7F3B:
	ld c,001h		;7f3b   ; C = cuantas casillas libres hay debajo del cursor (hasta B)
	call L_7B55		;7f3d   ; D, E = el cursor en pixeles (0xE264 x 8, 0xE265 x 8)
L_7F40:
	ld a,e			;7f40
	add a,008h		;7f41
	ld e,a			;7f43
	cp 0b8h		;7f44
	ret nc			;7f46
	push bc			;7f47
	push de			;7f48
	call L_7F53		;7f49   ; NC si la casilla de D, E del mapa es de ladrillo (2 o 3)
	pop de			;7f4c
	pop bc			;7f4d
	ret nc			;7f4e
	inc c			;7f4f
	djnz L_7F40		;7f50
	ret			;7f52
L_7F53:
	push de			;7f53   ; NC si la casilla de D, E del mapa es de ladrillo (2 o 3)
	call L_7B64		;7f54   ; A = la pantalla que se edita (de la casilla 0xE262)
	dec a			;7f57
	ld l,a			;7f58
	ld h,000h		;7f59
	call 05b29h		;7f5b   ; HL = 0xE900 + HL x 0xC0: el mapa de la pantalla HL (0-5)
	pop de			;7f5e
	push hl			;7f5f
	ex de,hl			;7f60
	call 04d7ch		;7f61   ; pasa la posicion de caracter de HL a direccion de la VRAM
	or a			;7f64
	ld de,03800h		;7f65
	sbc hl,de		;7f68
	ld c,l			;7f6a
	srl h		;7f6b
	rr l		;7f6d
	srl h		;7f6f
	rr l		;7f71
	ld a,l			;7f73
	pop hl			;7f74
	call 04094h		;7f75   ; suma A a HL (HL = HL + A)
	ld a,c			;7f78
	and 003h		;7f79
	inc a			;7f7b
	ld b,a			;7f7c
	ld a,(hl)			;7f7d
L_7F7E:
	rlca			;7f7e
	rlca			;7f7f
	djnz L_7F7E		;7f80
	and 003h		;7f82
	cp 002h		;7f84
	ret			;7f86
L_7F87:
	ld hl,0e26ch		;7f87   ; poner una columna (hasta 16, 0xE26C): crece hacia abajo hasta el suelo
	ld a,(hl)			;7f8a
	cp 010h		;7f8b
	ret nc			;7f8d
	push hl			;7f8e
	call L_7FFC		;7f8f   ; Z si ya hay una columna en el cursor
	pop hl			;7f92
	ret z			;7f93
	inc (hl)			;7f94
	ld hl,0e7c0h		;7f95   ; apunta a la lista de las columnas de la tabla 0x60F0 (4 bytes: pantalla, y, x, alto | 0x80)
L_7F98:
	ld a,(hl)			;7f98   ; la primera libre de 0xE7C0
	and a			;7f99
	jr z,L_7FA3		;7f9a
	ld a,004h		;7f9c
	call 04094h		;7f9e   ; suma A a HL (HL = HL + A)
	jr L_7F98		;7fa1
L_7FA3:
	ld d,h			;7fa3
	ld e,l			;7fa4
	ld b,004h		;7fa5
	xor a			;7fa7
L_7FA8:
	ld (de),a			;7fa8
	inc de			;7fa9
	djnz L_7FA8		;7faa
	push hl			;7fac
	call L_7B64		;7fad   ; pantalla, x, y y alto | 0x80
	ld (hl),a			;7fb0
	inc hl			;7fb1
	call L_7B55		;7fb2   ; D, E = el cursor en pixeles (0xE264 x 8, 0xE265 x 8)
	ld (hl),e			;7fb5
	inc hl			;7fb6
	ld (hl),d			;7fb7
	ld b,01eh		;7fb8
	push hl			;7fba
	call L_7F3B		;7fbb   ; C = cuantas casillas libres hay debajo del cursor (hasta B)
	pop hl			;7fbe
	inc hl			;7fbf
	ld a,080h		;7fc0
	or c			;7fc2
	ld (hl),a			;7fc3
	pop hl			;7fc4
L_7FC5:
	ld c,001h		;7fc5   ; pinta las columnas de esta pantalla (C = 1) o las borra (C = 0)
	ld ix,0e7c0h		;7fc7   ; apunta a la lista de las columnas de la tabla 0x60F0 (4 bytes: pantalla, y, x, alto | 0x80)
	ld b,010h		;7fcb
L_7FCD:
	push bc			;7fcd
	call L_7B64		;7fce   ; A = la pantalla que se edita (de la casilla 0xE262)
	cp (ix+000h)		;7fd1
	call z,L_7FE0		;7fd4   ; una columna: B caracteres hacia abajo
	ld bc,00004h		;7fd7
	add ix,bc		;7fda
	pop bc			;7fdc
	djnz L_7FCD		;7fdd
	ret			;7fdf
L_7FE0:
	ld a,(ix+003h)		;7fe0   ; una columna: B caracteres hacia abajo
	and 01fh		;7fe3
	ld b,a			;7fe5
	ld d,(ix+002h)		;7fe6
	ld e,(ix+001h)		;7fe9
L_7FEC:
	push de			;7fec
	push bc			;7fed
	ld a,c			;7fee
	and a			;7fef
	call L_7BCF		;7ff0
	pop bc			;7ff3
	pop de			;7ff4
	ld a,e			;7ff5
	add a,008h		;7ff6
	ld e,a			;7ff8
	djnz L_7FEC		;7ff9
	ret			;7ffb
L_7FFC:
	ld ix,0e7c0h		;7ffc   ; Z si ya hay una columna en el cursor
