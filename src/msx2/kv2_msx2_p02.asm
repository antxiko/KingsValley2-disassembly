; ==========================================================================
; KING'S VALLEY II - Konami (1988) - MSX2 - MegaROM RC-761 de 128 KB (Konami SCC) - banco 02 (se ejecuta en 0x8000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x08000


; ----------------------------------------------------------------------
; DATOS partida_8000: los 1 ultimos bytes de la instruccion de p01:7FFE (21 F3
;   E2), que empieza en el banco 1; lo leen p01:7FFE (1 bytes)
;   0x8000..0x8001  (1 bytes)
DATA_partida_8000:
	defb 0e2h	; 8000

; ======================================================================
; CODIGO 0x8001..0x8241  (576 bytes)
; ======================================================================


L_8001:
	call 07f39h		;8001   ; C si (HL) es la pantalla que se edita y el cursor esta dentro del rectangulo de HL
	cp (hl)			;8004
	jr nz,L_8016		;8005
	dec hl			;8007
	call 07f2ah		;8008   ; D, E = el cursor en pixeles (0xE264 x 8, 0xE265 x 8)
	ld a,d			;800b
	add a,c			;800c
	sub (hl)			;800d
	cp b			;800e
	ret nc			;800f
	dec hl			;8010
	ld a,e			;8011
	sub (hl)			;8012
	cp 020h		;8013
	ret			;8015
L_8016:
	or a			;8016
	ret			;8017
L_8018:
	call L_871B		;8018   ; editor: poner al personaje (disparo) en el cursor, o quitarlo (segundo boton)
	ld a,(0e207h)		;801b   ; lee el mando: lo que se acaba de pulsar
	and 030h		;801e
	ret z			;8020
	and 010h		;8021
	ld hl,0e282h		;8023   ; apunta a la y del personaje
	jr z,L_8039		;8026
	call 07f39h		;8028   ; A = la pantalla que se edita (de la casilla 0xE262)
	ld (0e243h),a		;802b   ; su pantalla y su sitio
	call 07f2ah		;802e   ; D, E = el cursor en pixeles (0xE264 x 8, 0xE265 x 8)
	ld (hl),e			;8031
	inc hl			;8032
	inc hl			;8033
	ld (hl),d			;8034
	ld a,001h		;8035
	jr L_8043		;8037
L_8039:
	ld a,(0e243h)		;8039   ; quitarlo, si esta en esta pantalla
	ld b,a			;803c
	call 07f39h		;803d   ; A = la pantalla que se edita (de la casilla 0xE262)
	cp b			;8040
	ret nz			;8041
	xor a			;8042
L_8043:
	ld (0e26bh),a		;8043   ; 0xE26B: el personaje esta puesto
L_8046:
	ld hl,0e808h		;8046   ; los cuatro sprites del personaje en el editor (0xE808-0xE817), o fuera si no esta
	ld de,0e80ch		;8049
	exx			;804c
	ld hl,0e810h		;804d
	ld de,0e814h		;8050
	exx			;8053
	and a			;8054
	ld a,0e0h		;8055
	jr z,L_805E		;8057
	ld a,(0e282h)		;8059   ; lee la y del personaje
	sub 008h		;805c
L_805E:
	ld (hl),a			;805e
	ld (de),a			;805f
	inc hl			;8060
	inc de			;8061
	exx			;8062
	add a,010h		;8063
	ld (hl),a			;8065
	ld (de),a			;8066
	inc hl			;8067
	inc de			;8068
	exx			;8069
	ld a,(0e284h)		;806a   ; lee la x del personaje
	ld (hl),a			;806d
	ld (de),a			;806e
	inc hl			;806f
	inc de			;8070
	exx			;8071
	ld (hl),a			;8072
	ld (de),a			;8073
	inc hl			;8074
	inc de			;8075
	exx			;8076
	ld (hl),000h		;8077
	ld a,004h		;8079
	ld (de),a			;807b
	inc hl			;807c
	inc de			;807d
	exx			;807e
	ld (hl),008h		;807f
	ld a,00ch		;8081
	ld (de),a			;8083
	inc hl			;8084
	inc de			;8085
	exx			;8086
	ld a,00dh		;8087   ; sus colores: 13 y 0x4E
	ld hl,0d220h		;8089
	call 07c04h		;808c   ; 16 bytes de HL con el valor A (los colores de un sprite)
	ld a,04eh		;808f
	ld hl,0d230h		;8091
	call 07c04h		;8094   ; 16 bytes de HL con el valor A (los colores de un sprite)
	ld a,00dh		;8097
	ld hl,0d240h		;8099
	call 07c04h		;809c   ; 16 bytes de HL con el valor A (los colores de un sprite)
	ld a,04eh		;809f
	ld hl,0d250h		;80a1
	jp 07c04h		;80a4
L_80A7:
	call L_871B		;80a7   ; editor: poner (disparo) o quitar un sitio de salida de enemigos (hasta 8, 0xE266)
	ld a,(0e207h)		;80aa   ; lee el mando: lo que se acaba de pulsar
	and 030h		;80ad
	ret z			;80af
	and 010h		;80b0
	ld hl,0e266h		;80b2   ; apunta a cuantos sitios de salida de enemigos hay en el editor
	jr z,L_8102		;80b5
	ld a,(hl)			;80b7
	cp 008h		;80b8
	ret nc			;80ba
	push hl			;80bb
	call L_80E8		;80bc   ; no se pone donde ya hay uno
	pop hl			;80bf
	ret z			;80c0
	inc (hl)			;80c1
	ld hl,0e2c0h		;80c2   ; apunta a los sitios de los que salen los enemigos (8 x 5 bytes)
L_80C5:
	ld a,(hl)			;80c5   ; el primero libre de 0xE2C0
	and a			;80c6
	jr z,L_80D0		;80c7
	ld a,005h		;80c9
	call 0408fh		;80cb   ; suma A a HL (HL = HL + A)
	jr L_80C5		;80ce
L_80D0:
	ld a,(0e261h)		;80d0   ; el tipo (opcion del submenu + 1, con el bit 7), la cuenta, la pantalla y el sitio
	inc a			;80d3
	or 080h		;80d4
	ld (hl),a			;80d6
	inc hl			;80d7
	ld (hl),020h		;80d8
	inc hl			;80da
	call 07f39h		;80db   ; A = la pantalla que se edita (de la casilla 0xE262)
	ld (hl),a			;80de
	inc hl			;80df
	call 07f2ah		;80e0   ; D, E = el cursor en pixeles (0xE264 x 8, 0xE265 x 8)
	ld (hl),e			;80e3
	inc hl			;80e4
	ld (hl),d			;80e5
	jr L_811F		;80e6
L_80E8:
	ld hl,0e2c0h		;80e8   ; Z si ya hay un sitio de salida en el cursor
	ld b,008h		;80eb
L_80ED:
	ld a,(hl)			;80ed
	and a			;80ee
	jr z,L_80F7		;80ef
	push hl			;80f1
	call L_819E		;80f2   ; Z si el sitio de HL esta en el cursor
	pop hl			;80f5
	ret z			;80f6
L_80F7:
	ld a,005h		;80f7
	call 0408fh		;80f9   ; suma A a HL (HL = HL + A)
	djnz L_80ED		;80fc
	ld a,001h		;80fe
	and a			;8100
	ret			;8101
L_8102:
	ld a,(hl)			;8102   ; quitar el del cursor
	and a			;8103
	ret z			;8104
	ld hl,0e2c0h		;8105   ; apunta a los sitios de los que salen los enemigos (8 x 5 bytes)
	ld b,008h		;8108
L_810A:
	ld a,(hl)			;810a
	and a			;810b
	jr z,L_8118		;810c
	push hl			;810e
	call L_819E		;810f   ; Z si el sitio de HL esta en el cursor
	pop hl			;8112
	push hl			;8113
	call z,L_81B0		;8114   ; lo quita
	pop hl			;8117
L_8118:
	ld a,005h		;8118
	call 0408fh		;811a   ; suma A a HL (HL = HL + A)
	djnz L_810A		;811d
L_811F:
	ld hl,0e2c0h		;811f   ; los sprites de los sitios de salida de esta pantalla (desde 0xE840, dos por sitio)
	ld b,008h		;8122
	ld de,0e840h		;8124
L_8127:
	push hl			;8127
	exx			;8128
	call 07f39h		;8129   ; A = la pantalla que se edita (de la casilla 0xE262)
	exx			;812c
	inc hl			;812d
	inc hl			;812e
	cp (hl)			;812f
	pop hl			;8130
	jr nz,L_8191		;8131
	push de			;8133
	exx			;8134
	pop de			;8135
	ld a,004h		;8136
	call 04094h		;8138   ; suma A a DE (DE = DE + A)
	exx			;813b
	push bc			;813c
	push hl			;813d
	push de			;813e
	ld a,(hl)			;813f
	and 07fh		;8140
	ld c,a			;8142
	inc hl			;8143
	inc hl			;8144
	inc hl			;8145
	ld a,(hl)			;8146
	jr nz,L_814B		;8147   ; la y, o fuera si no hay
	ld a,0e0h		;8149
L_814B:
	ld (de),a			;814b   ; la y en los dos sprites
	exx			;814c
	ld (de),a			;814d
	inc de			;814e
	exx			;814f
	inc hl			;8150   ; la x
	inc de			;8151
	ld a,(hl)			;8152
	ld (de),a			;8153
	exx			;8154
	ld (de),a			;8155
	inc de			;8156
	exx			;8157
	inc hl			;8158
	inc de			;8159
	ld a,c			;815a   ; su dibujo y sus colores, de la tabla 0x86B9 (3 bytes por tipo)
	dec a			;815b
	ld c,a			;815c
	add a,a			;815d   ; el tipo x 3
	add a,c			;815e
	ld hl,086b9h		;815f
	call 0408fh		;8162   ; suma A a HL (HL = HL + A)
	ld a,(hl)			;8165   ; el dibujo del primer sprite...
	ld (de),a			;8166
	exx			;8167
	add a,004h		;8168   ; ...y el del segundo, 4 mas
	ld (de),a			;816a
	exx			;816b
	inc hl			;816c   ; B = el color del primero, C = el del segundo
	ld b,(hl)			;816d
	inc hl			;816e
	ld c,(hl)			;816f
	ld a,e			;8170   ; HL = los colores del sprite en 0xD200
	ld de,0d200h		;8171   ; apunta a los colores de los sprites (16 bytes por sprite)
	and 07ch		;8174
	ld h,000h		;8176
	ld l,a			;8178
	add hl,hl			;8179
	add hl,hl			;817a
	add hl,de			;817b
	push hl			;817c
	ld a,b			;817d
	push bc			;817e
	call 07c04h		;817f   ; 16 bytes de HL con el valor A (los colores de un sprite)
	pop bc			;8182
	ld a,c			;8183   ; y el segundo sprite, 16 bytes mas alla
	exx			;8184
	pop hl			;8185
	ld bc,00010h		;8186
	add hl,bc			;8189
	call 07c04h		;818a   ; 16 bytes de HL con el valor A (los colores de un sprite)
	exx			;818d
	pop de			;818e
	pop hl			;818f
	pop bc			;8190
L_8191:
	ld a,005h		;8191
	call 0408fh		;8193   ; suma A a HL (HL = HL + A)
	ld a,008h		;8196
	call 04094h		;8198   ; suma A a DE (DE = DE + A)
	djnz L_8127		;819b
	ret			;819d
L_819E:
	call 07f39h		;819e   ; Z si el sitio de HL esta en el cursor
	inc hl			;81a1
	inc hl			;81a2
	cp (hl)			;81a3
	ret nz			;81a4
	call 07f2ah		;81a5   ; D, E = el cursor en pixeles (0xE264 x 8, 0xE265 x 8)
	inc hl			;81a8
	ld a,(hl)			;81a9
	cp e			;81aa
	ret nz			;81ab
	inc hl			;81ac
	ld a,(hl)			;81ad
	cp d			;81ae
	ret			;81af
L_81B0:
	ld (hl),000h		;81b0   ; lo quita
	ld hl,0e266h		;81b2   ; apunta a cuantos sitios de salida de enemigos hay en el editor
	dec (hl)			;81b5
	ret			;81b6
L_81B7:
	call L_8708		;81b7   ; editor: poner (disparo) o quitar una cosa de 0xE600 (hasta 16, 0xE267); la opcion 7 son columnas
	ld a,(0e207h)		;81ba   ; lee el mando: lo que se acaba de pulsar
	and 030h		;81bd
	ret z			;81bf
	and 010h		;81c0
	ld hl,0e267h		;81c2   ; apunta a cuantas cosas de 0xE600 hay en el editor
	jp z,L_82B1		;81c5
	ld a,(0e261h)		;81c8   ; lee la opcion del submenu del editor
	cp 007h		;81cb
	jp z,L_83A5		;81cd
	ld a,(hl)			;81d0
	cp 010h		;81d1
	ret nc			;81d3
	push hl			;81d4
	call L_824B		;81d5   ; Z si ya hay una cosa en el cursor
	pop hl			;81d8
	ret z			;81d9
	inc (hl)			;81da
	ld hl,0e600h		;81db   ; la primera ficha libre de 0xE600, a cero
L_81DE:
	ld a,(hl)			;81de
	and a			;81df
	jr z,L_81E9		;81e0
	ld a,010h		;81e2
	call 0408fh		;81e4   ; suma A a HL (HL = HL + A)
	jr L_81DE		;81e7
L_81E9:
	push hl			;81e9
	pop ix		;81ea
	ld b,010h		;81ec
L_81EE:
	ld (hl),000h		;81ee   ; la ficha a cero
	inc hl			;81f0
	djnz L_81EE		;81f1
	ld a,(0e261h)		;81f3   ; el tipo sale de la opcion del submenu
	ld b,a			;81f6
	dec b			;81f7
	cp 004h		;81f8   ; opciones 0-1: tipo 1; 2-3: tipo 2; de la 4 en adelante, la opcion - 1
	jr nc,L_8203		;81fa
	cp 002h		;81fc
	ld b,001h		;81fe
	jr c,L_8203		;8200
	inc b			;8202
L_8203:
	ld a,b			;8203
	ld (ix+000h),a		;8204
	call 07f2ah		;8207   ; su sitio y su pantalla
	ld (ix+002h),e		;820a
	ld (ix+003h),d		;820d
	call 07f39h		;8210   ; A = la pantalla que se edita (de la casilla 0xE262)
	ld (ix+004h),a		;8213
	ld (ix+009h),a		;8216
	call L_830C		;8219   ; lo propio de su tipo
L_821C:
	call 07f39h		;821c   ; pinta las cosas de 0xE600 de la pantalla que se edita
	ld c,a			;821f
	ld ix,0e600h		;8220   ; apunta a las cosas de la fase (16 x 16 bytes)
	ld b,010h		;8224
L_8226:
	push bc			;8226
	ld a,(ix+004h)		;8227   ; lee la pantalla de la cosa
	cp c			;822a
	jr nz,L_8234		;822b
	ld a,(ix+000h)		;822d   ; lee el tipo de la cosa (0: libre)
	and a			;8230
	call nz,L_823D		;8231   ; cada tipo, su dibujo (tabla detras)
L_8234:
	ld bc,00010h		;8234
	add ix,bc		;8237
	pop bc			;8239
	djnz L_8226		;823a
	ret			;823c
L_823D:
	dec a			;823d   ; cada tipo, su dibujo (tabla detras)
	call 04099h		;823e   ; el despachador de Konami: la tabla va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_8241: 5 destinos del despachador p00:4099 (call en p02:823E, el
;   indice en A): 8266, 827F, 829C, BDC0, 9652; lo leen p02:823E (10 bytes)
;   0x8241..0x824b  (10 bytes)
DATA_tabla_8241:
	defw 08266h,0827fh,0829ch,0bdc0h,09652h	; 8241

; ======================================================================
; CODIGO 0x824b..0x82f3  (168 bytes)
; ======================================================================


L_824B:
	ld ix,0e600h		;824b   ; Z si ya hay una cosa en el cursor
	ld b,010h		;824f
L_8251:
	ld a,(ix+000h)		;8251   ; lee el tipo de la cosa (0: libre)
	and a			;8254
	jr z,L_825B		;8255
	call L_82F8		;8257   ; Z si la cosa de IX esta en el cursor
	ret z			;825a
L_825B:
	ld de,00010h		;825b   ; la cosa siguiente
	add ix,de		;825e
	djnz L_8251		;8260
	ld a,001h		;8262   ; no hay ninguna en el cursor: NZ
	and a			;8264
	ret			;8265
L_8266:
	ld a,(ix+007h)		;8266   ; la cosa de tipo 1: su dibujo de 0x9374 (variante 0 o 3)
	and 002h		;8269
	ld a,003h		;826b
	jr nz,L_8270		;826d
	xor a			;826f
L_8270:
	ld (ix+005h),a		;8270   ; guarda el giro o paso del dibujo de la cosa
	ld hl,09374h		;8273
	ld de,09374h		;8276
	ld bc,09374h		;8279
	jp 0bb63h		;827c
L_827F:
	ld a,(ix+007h)		;827f   ; la de tipo 2: segun la variante, los dibujos de 0x937C o de 0x9394
	rra			;8282   ; el lado (bit 1)
	rra			;8283
	ld hl,0937ch		;8284
	ld de,09384h		;8287
	ld bc,0938ch		;828a
	jp nc,0bb63h		;828d
	ld hl,09394h		;8290   ; del otro lado
	ld de,0939ch		;8293
	ld bc,093a4h		;8296
	jp 0bb63h		;8299
L_829C:
	ld e,(ix+002h)		;829c   ; la de tipo 3: una columna de B caracteres 0xFE
	ld d,(ix+003h)		;829f   ; lee la x de la cosa
	ld b,(ix+008h)		;82a2   ; lee el alto de la cosa
L_82A5:
	ld a,0feh		;82a5
	call 0576ah		;82a7   ; pinta el caracter A tal cual (p00:5207)
	ld a,e			;82aa
	add a,008h		;82ab
	ld e,a			;82ad
	djnz L_82A5		;82ae
	ret			;82b0
L_82B1:
	ld a,(0e261h)		;82b1   ; quitar la cosa del cursor
	cp 007h		;82b4
	jp z,L_8435		;82b6
	ld a,(hl)			;82b9
	and a			;82ba
	ret z			;82bb
	ld ix,0e600h		;82bc   ; apunta a las cosas de la fase (16 x 16 bytes)
	ld b,010h		;82c0
L_82C2:
	ld a,(ix+000h)		;82c2   ; lee el tipo de la cosa (0: libre)
	and a			;82c5
	jr z,L_82D0		;82c6
	push hl			;82c8
	call L_82F8		;82c9   ; Z si la cosa de IX esta en el cursor
	call z,L_82D8		;82cc   ; se borra: su tamano de la tabla 0x82F3 y el fondo de 0x86C5
	pop hl			;82cf
L_82D0:
	ld de,00010h		;82d0
	add ix,de		;82d3
	djnz L_82C2		;82d5
	ret			;82d7
L_82D8:
	ld a,(ix+000h)		;82d8   ; se borra: su tamano de la tabla 0x82F3 y el fondo de 0x86C5
	ld (ix+000h),000h		;82db
	dec (hl)			;82df
	ld hl,082f2h		;82e0
	call 0408fh		;82e3   ; suma A a HL (HL = HL + A)
	ld c,(hl)			;82e6
	ld b,(ix+008h)		;82e7
	call 07f2ah		;82ea   ; D, E = el cursor en pixeles (0xE264 x 8, 0xE265 x 8)
	ld hl,086c5h		;82ed
	jp 05737h		;82f0

; ----------------------------------------------------------------------
; DATOS sin identificar  0x82f3..0x82f8  (5 bytes)
DATA_82F3:
	defb 002h,002h,001h,004h,002h	; 82f3

; ======================================================================
; CODIGO 0x82f8..0x8312  (26 bytes)
; ======================================================================


L_82F8:
	call 07f39h		;82f8   ; Z si la cosa de IX esta en el cursor
	cp (ix+004h)		;82fb
	ret nz			;82fe
	call 07f2ah		;82ff   ; D, E = el cursor en pixeles (0xE264 x 8, 0xE265 x 8)
	ld a,(ix+002h)		;8302
	cp e			;8305
	ret nz			;8306
	ld a,(ix+003h)		;8307
	cp d			;830a
	ret			;830b
L_830C:
	ld a,(0e261h)		;830c   ; lo propio de cada opcion (tabla detras)
	call 04099h		;830f   ; el despachador de Konami: la tabla va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_8312: 7 destinos del despachador p00:4099 (call en p02:830F, el
;   indice en A): 8320, 834D, 8320, 8351, 8346, 833C, 8341; lo leen p02:830F
;   (14 bytes)
;   0x8312..0x8320  (14 bytes)
DATA_tabla_8312:
	defw 08320h,0834dh,08320h,08351h,08346h,0833ch,08341h	; 8312

; ======================================================================
; CODIGO 0x8320..0x86b9  (921 bytes)
; ======================================================================


L_8320:
	ld c,000h		;8320   ; cuanto mide hacia abajo hasta el suelo (hasta 3): si no cabe, no se pone
	xor a			;8322
	ld b,003h		;8323
L_8325:
	ld (ix+005h),c		;8325
	ld (ix+007h),a		;8328
	call L_8359		;832b   ; C = cuantas casillas libres hay debajo del cursor (hasta B)
	ld (ix+008h),c		;832e
	dec c			;8331
	ret nz			;8332
	ld (ix+000h),000h		;8333
	ld hl,0e267h		;8337   ; apunta a cuantas cosas de 0xE600 hay en el editor
	dec (hl)			;833a
	ret			;833b
L_833C:
	ld (ix+008h),001h		;833c
	ret			;8340
L_8341:
	ld (ix+008h),002h		;8341
	ret			;8345
L_8346:
	xor a			;8346   ; hasta 0x1E
	ld c,a			;8347
	ld b,01eh		;8348
	jp L_8325		;834a
L_834D:
	ld c,003h		;834d
	jr L_8353		;834f
L_8351:
	ld c,000h		;8351
L_8353:
	ld a,002h		;8353
	ld b,003h		;8355
	jr L_8325		;8357
L_8359:
	ld c,001h		;8359   ; C = cuantas casillas libres hay debajo del cursor (hasta B)
	call 07f2ah		;835b   ; D, E = el cursor en pixeles (0xE264 x 8, 0xE265 x 8)
L_835E:
	ld a,e			;835e   ; la casilla de debajo
	add a,008h		;835f
	ld e,a			;8361
	cp 0b8h		;8362   ; en el suelo de la pantalla, se acaba
	ret nc			;8364
	push bc			;8365
	push de			;8366
	call L_8371		;8367   ; NC si la casilla de D, E del mapa es de ladrillo (2 o 3)
	pop de			;836a
	pop bc			;836b
	ret nc			;836c   ; ladrillo: se acaba
	inc c			;836d   ; una casilla libre mas
	djnz L_835E		;836e
	ret			;8370
L_8371:
	push de			;8371   ; NC si la casilla de D, E del mapa es de ladrillo (2 o 3)
	call 07f39h		;8372   ; A = la pantalla que se edita (de la casilla 0xE262)
	dec a			;8375
	ld l,a			;8376
	ld h,000h		;8377
	call 05d32h		;8379   ; HL = 0xE900 + HL x 0xC0: el mapa de la pantalla HL (0-5)
	pop de			;837c
	push hl			;837d
	ex de,hl			;837e
	call 04d7bh		;837f   ; pasa la posicion de caracter de HL a direccion de la VRAM
	or a			;8382
	ld de,03800h		;8383
	sbc hl,de		;8386
	ld c,l			;8388
	srl h		;8389
	rr l		;838b
	srl h		;838d
	rr l		;838f
	ld a,l			;8391
	pop hl			;8392
	call 0408fh		;8393   ; suma A a HL (HL = HL + A)
	ld a,c			;8396
	and 003h		;8397
	inc a			;8399
	ld b,a			;839a
	ld a,(hl)			;839b
L_839C:
	rlca			;839c   ; la casilla al fondo del byte
	rlca			;839d
	djnz L_839C		;839e
	and 003h		;83a0   ; sus dos bits
	cp 002h		;83a2   ; C si es libre o escalera (0 o 1)
	ret			;83a4
L_83A5:
	ld hl,0e26ch		;83a5   ; poner una columna (hasta 16, 0xE26C): crece hacia abajo hasta el suelo
	ld a,(hl)			;83a8
	cp 010h		;83a9
	ret nc			;83ab
	push hl			;83ac
	call L_841A		;83ad   ; Z si ya hay una columna en el cursor
	pop hl			;83b0
	ret z			;83b1
	inc (hl)			;83b2
	ld hl,0e7c0h		;83b3   ; apunta a la lista de las columnas de la tabla 0x60F0 (4 bytes: pantalla, y, x, alto | 0x80)
L_83B6:
	ld a,(hl)			;83b6   ; la primera libre de 0xE7C0
	and a			;83b7
	jr z,L_83C1		;83b8
	ld a,004h		;83ba
	call 0408fh		;83bc   ; suma A a HL (HL = HL + A)
	jr L_83B6		;83bf
L_83C1:
	ld d,h			;83c1
	ld e,l			;83c2
	ld b,004h		;83c3
	xor a			;83c5
L_83C6:
	ld (de),a			;83c6
	inc de			;83c7
	djnz L_83C6		;83c8
	push hl			;83ca
	call 07f39h		;83cb   ; pantalla, x, y y alto | 0x80
	ld (hl),a			;83ce
	inc hl			;83cf
	call 07f2ah		;83d0   ; D, E = el cursor en pixeles (0xE264 x 8, 0xE265 x 8)
	ld (hl),e			;83d3
	inc hl			;83d4
	ld (hl),d			;83d5
	ld b,01eh		;83d6
	push hl			;83d8
	call L_8359		;83d9   ; C = cuantas casillas libres hay debajo del cursor (hasta B)
	pop hl			;83dc
	inc hl			;83dd
	ld a,080h		;83de
	or c			;83e0
	ld (hl),a			;83e1
	pop hl			;83e2
L_83E3:
	ld c,001h		;83e3   ; pinta las columnas de esta pantalla (C = 1) o las borra (C = 0)
	ld ix,0e7c0h		;83e5   ; apunta a la lista de las columnas de la tabla 0x60F0 (4 bytes: pantalla, y, x, alto | 0x80)
	ld b,010h		;83e9
L_83EB:
	push bc			;83eb
	call 07f39h		;83ec   ; A = la pantalla que se edita (de la casilla 0xE262)
	cp (ix+000h)		;83ef
	call z,L_83FE		;83f2   ; una columna: B caracteres hacia abajo
	ld bc,00004h		;83f5
	add ix,bc		;83f8
	pop bc			;83fa
	djnz L_83EB		;83fb
	ret			;83fd
L_83FE:
	ld a,(ix+003h)		;83fe   ; una columna: B caracteres hacia abajo
	and 01fh		;8401
	ld b,a			;8403
	ld d,(ix+002h)		;8404
	ld e,(ix+001h)		;8407
L_840A:
	push de			;840a   ; cada casilla de la columna
	push bc			;840b
	ld a,c			;840c   ; C: pintar o borrar
	and a			;840d
	call 07fa4h		;840e
	pop bc			;8411
	pop de			;8412
	ld a,e			;8413   ; la de abajo
	add a,008h		;8414
	ld e,a			;8416
	djnz L_840A		;8417
	ret			;8419
L_841A:
	ld ix,0e7c0h		;841a   ; Z si ya hay una columna en el cursor
	ld b,010h		;841e
L_8420:
	ld a,(ix+000h)		;8420
	and a			;8423
	jr z,L_842A		;8424
	call L_8456		;8426   ; Z si la columna de IX esta en el cursor
	ret z			;8429
L_842A:
	ld de,00004h		;842a   ; la columna siguiente
	add ix,de		;842d
	djnz L_8420		;842f
	ld a,001h		;8431   ; no hay ninguna en el cursor: NZ
	and a			;8433
	ret			;8434
L_8435:
	ld a,(0e26ch)		;8435   ; quitar la columna del cursor
	and a			;8438
	ret z			;8439
	ld ix,0e7c0h		;843a   ; apunta a la lista de las columnas de la tabla 0x60F0 (4 bytes: pantalla, y, x, alto | 0x80)
	ld b,010h		;843e
L_8440:
	push bc			;8440
	ld a,(ix+000h)		;8441
	and a			;8444
	jr z,L_844D		;8445
	call L_8456		;8447   ; Z si la columna de IX esta en el cursor
	call z,L_846A		;844a   ; la quita y la borra
L_844D:
	ld bc,00004h		;844d
	add ix,bc		;8450
	pop bc			;8452
	djnz L_8440		;8453
	ret			;8455
L_8456:
	call 07f39h		;8456   ; Z si la columna de IX esta en el cursor
	cp (ix+000h)		;8459
	ret nz			;845c
	call 07f2ah		;845d   ; D, E = el cursor en pixeles (0xE264 x 8, 0xE265 x 8)
	ld a,(ix+001h)		;8460
	cp e			;8463
	ret nz			;8464
	ld a,(ix+002h)		;8465
	cp d			;8468
	ret			;8469
L_846A:
	ld hl,0e26ch		;846a   ; la quita y la borra
	dec (hl)			;846d
	ld (ix+000h),000h		;846e
	ld c,000h		;8472
	jp L_83FE		;8474
L_8477:
	call L_871B		;8477   ; editor: poner (disparo) o quitar una de las 64 cosas de 0xE300 (0xE268)
	ld a,(0e207h)		;847a   ; lee el mando: lo que se acaba de pulsar
	and 030h		;847d
	ret z			;847f
	and 010h		;8480
	ld hl,0e268h		;8482   ; apunta a cuantas cosas de 0xE300 hay en el editor
	jr z,L_84B8		;8485
	ld a,000h		;8487
	ld (0efd0h),a		;8489
	ld a,(hl)			;848c
	cp 040h		;848d
	ret nc			;848f
	push hl			;8490
	call L_8501		;8491   ; Z si ya hay una en el cursor
	pop hl			;8494
	ret z			;8495
	inc (hl)			;8496
	ld hl,0e300h		;8497   ; apunta a las cosas que se cogen y se llevan (64 x 8 bytes)
L_849A:
	ld a,(hl)			;849a   ; la primera libre (8 bytes cada una): tipo, x, y, pantalla
	and a			;849b
	jr z,L_84A5		;849c
	ld a,008h		;849e
	call 0408fh		;84a0   ; suma A a HL (HL = HL + A)
	jr L_849A		;84a3
L_84A5:
	ld a,(0e261h)		;84a5   ; lee la opcion del submenu del editor
	inc a			;84a8
	ld (hl),a			;84a9
	inc hl			;84aa
	call 07f2ah		;84ab   ; D, E = el cursor en pixeles (0xE264 x 8, 0xE265 x 8)
	ld (hl),e			;84ae
	inc hl			;84af
	ld (hl),d			;84b0
	inc hl			;84b1
	call 07f39h		;84b2   ; A = la pantalla que se edita (de la casilla 0xE262)
	ld (hl),a			;84b5
	jr L_84DD		;84b6
L_84B8:
	ld a,001h		;84b8   ; quitar la del cursor
	ld (0efd0h),a		;84ba
	ld a,(hl)			;84bd
	and a			;84be
	ret z			;84bf
	ld hl,0e300h		;84c0   ; apunta a las cosas que se cogen y se llevan (64 x 8 bytes)
	ld b,040h		;84c3
L_84C5:
	push bc			;84c5   ; cada una de las 64
	ld a,(hl)			;84c6
	and a			;84c7
	jr z,L_84D4		;84c8
	push hl			;84ca
	call L_851B		;84cb   ; si esta en el cursor...
	pop hl			;84ce
	push hl			;84cf
	call z,L_852E		;84d0   ; ...se quita
	pop hl			;84d3
L_84D4:
	ld a,008h		;84d4
	call 0408fh		;84d6   ; suma A a HL (HL = HL + A)
	pop bc			;84d9
	djnz L_84C5		;84da
	ret			;84dc
L_84DD:
	call 07f2ah		;84dd   ; pinta la cosa de 2 x 2 (dibujo de 0x9328 + 4 x tipo) o el fondo, y la marca en el mapa
	ld a,(0e261h)		;84e0   ; lee la opcion del submenu del editor
	call L_8537		;84e3   ; HL = el dibujo de la cosa A (0x9328 + 4 x A)
	ld a,(0efd0h)		;84e6
	and a			;84e9
	jr z,L_84EF		;84ea
	ld hl,086c5h		;84ec
L_84EF:
	ld bc,00202h		;84ef
	push bc			;84f2
	push de			;84f3
	call 05737h		;84f4   ; un rectangulo de caracteres, copiandolos tal cual (HMMM)
	pop hl			;84f7
	pop bc			;84f8
	call 07f39h		;84f9   ; A = la pantalla que se edita (de la casilla 0xE262)
	ld d,a			;84fc
	xor a			;84fd
	jp 063edh		;84fe
L_8501:
	ld hl,0e300h		;8501   ; Z si ya hay una en el cursor
	ld b,040h		;8504
L_8506:
	ld a,(hl)			;8506   ; las que hay...
	and a			;8507
	jr z,L_8510		;8508
	push hl			;850a
	call L_851B		;850b   ; ...si estan en el cursor, Z
	pop hl			;850e
	ret z			;850f
L_8510:
	ld a,008h		;8510
	call 0408fh		;8512   ; suma A a HL (HL = HL + A)
	djnz L_8506		;8515
	ld a,001h		;8517
	and a			;8519
	ret			;851a
L_851B:
	call 07f39h		;851b   ; A = la pantalla que se edita (de la casilla 0xE262)
	inc hl			;851e
	inc hl			;851f
	inc hl			;8520
	cp (hl)			;8521
	ret nz			;8522
	call 07f2ah		;8523   ; D, E = el cursor en pixeles (0xE264 x 8, 0xE265 x 8)
	dec hl			;8526
	ld a,(hl)			;8527
	cp d			;8528
	ret nz			;8529
	dec hl			;852a
	ld a,(hl)			;852b
	cp e			;852c
	ret			;852d
L_852E:
	ld (hl),000h		;852e
	ld hl,0e268h		;8530   ; apunta a cuantas cosas de 0xE300 hay en el editor
	dec (hl)			;8533
	jp L_84DD		;8534
L_8537:
	ld hl,09328h		;8537   ; HL = el dibujo de la cosa A (0x9328 + 4 x A)
	add a,a			;853a
	add a,a			;853b
	jp 0408fh		;853c
L_853F:
	call L_871B		;853f   ; editor: poner o quitar una cosa de 2 x 2 de 0xE700 (hasta 16, 0xE269)
	ld a,(0e207h)		;8542   ; lee el mando: lo que se acaba de pulsar
	and 030h		;8545
	ret z			;8547
	and 010h		;8548
	ld a,001h		;854a
	jr nz,L_8550		;854c
	ld a,000h		;854e
L_8550:
	ld (0efd0h),a		;8550
	ld hl,0e269h		;8553   ; apunta a cuantas cosas de 0xE700 hay en el editor
	jr z,L_857C		;8556
	ld a,(hl)			;8558
	cp 010h		;8559
	ret nc			;855b
	ld a,(hl)			;855c
	inc (hl)			;855d
	ld hl,0e700h		;855e   ; apunta a la tabla de colores al cargar graficos; en la partida, las cosas de 2 x 2 de la fase (16 x 8 bytes)
L_8561:
	ld a,(hl)			;8561
	and a			;8562
	jr z,L_856C		;8563
	ld a,008h		;8565
	call 0408fh		;8567   ; suma A a HL (HL = HL + A)
	jr L_8561		;856a
L_856C:
	ld (hl),001h		;856c   ; [1][pantalla][x][y]
	inc hl			;856e
	call 07f39h		;856f   ; A = la pantalla que se edita (de la casilla 0xE262)
	ld (hl),a			;8572
	inc hl			;8573
	call 07f2ah		;8574   ; D, E = el cursor en pixeles (0xE264 x 8, 0xE265 x 8)
	ld (hl),e			;8577
	inc hl			;8578
	ld (hl),d			;8579
	jr L_85B3		;857a
L_857C:
	ld a,(hl)			;857c
	and a			;857d
	ret z			;857e
	ld hl,0e700h		;857f   ; apunta a la tabla de colores al cargar graficos; en la partida, las cosas de 2 x 2 de la fase (16 x 8 bytes)
	ld b,010h		;8582
L_8584:
	push bc			;8584   ; cada una de las 16
	ld a,(hl)			;8585
	and a			;8586
	jr z,L_8593		;8587
	push hl			;8589
	call L_859C		;858a   ; si esta en el cursor...
	pop hl			;858d
	push hl			;858e
	call z,L_85AD		;858f   ; ...se quita
	pop hl			;8592
L_8593:
	ld a,008h		;8593
	call 0408fh		;8595   ; suma A a HL (HL = HL + A)
	pop bc			;8598
	djnz L_8584		;8599
	ret			;859b
L_859C:
	call 07f39h		;859c   ; A = la pantalla que se edita (de la casilla 0xE262)
	inc hl			;859f
	cp (hl)			;85a0
	ret nz			;85a1
	call 07f2ah		;85a2   ; D, E = el cursor en pixeles (0xE264 x 8, 0xE265 x 8)
	inc hl			;85a5
	ld a,(hl)			;85a6
	cp e			;85a7
	ret nz			;85a8
	inc hl			;85a9
	ld a,(hl)			;85aa
	cp d			;85ab
	ret			;85ac
L_85AD:
	ld (hl),000h		;85ad
	ld hl,0e269h		;85af   ; apunta a cuantas cosas de 0xE700 hay en el editor
	dec (hl)			;85b2
L_85B3:
	call 07f2ah		;85b3   ; pinta la cosa (0x9324) o el fondo (0x86C5)
	ld a,(0efd0h)		;85b6
	and a			;85b9
	ld hl,09324h		;85ba
	jr nz,L_85C2		;85bd
	ld hl,086c5h		;85bf
L_85C2:
	ld bc,00202h		;85c2
	push bc			;85c5
	push de			;85c6
	call 05737h		;85c7   ; un rectangulo de caracteres, copiandolos tal cual (HMMM)
	pop hl			;85ca
	pop bc			;85cb
	call 07f39h		;85cc   ; A = la pantalla que se edita (de la casilla 0xE262)
	ld d,a			;85cf
	xor a			;85d0
	jp 063edh		;85d1
L_85D4:
	call L_871B		;85d4   ; editor: poner (disparo) o quitar la salida (0xE2F1-0xE2F3); solo hay una (0xE26A)
	ld a,(0e207h)		;85d7   ; lee el mando: lo que se acaba de pulsar
	and 030h		;85da
	ret z			;85dc
	and 010h		;85dd
	jr z,L_8616		;85df
	ld a,(0e26ah)		;85e1   ; si ya habia una, se borra antes
	and a			;85e4
	call nz,L_8621		;85e5   ; borra la salida, si esta en esta pantalla
	call L_8633		;85e8   ; 0xE2F0-0xE2F7 a cero
	ld hl,0e2f1h		;85eb   ; apunta a la salida de la fase: y, x y pantalla (0xE2F3)
	call 07f2ah		;85ee   ; D, E = el cursor en pixeles (0xE264 x 8, 0xE265 x 8)
	ld (hl),e			;85f1
	inc hl			;85f2
	ld (hl),d			;85f3
	inc hl			;85f4
	call 07f39h		;85f5   ; A = la pantalla que se edita (de la casilla 0xE262)
	ld (hl),a			;85f8
	ld a,001h		;85f9
	ld (0e26ah),a		;85fb   ; guarda la marca de salida puesta en el editor
	call 07f2ah		;85fe   ; D, E = el cursor en pixeles (0xE264 x 8, 0xE265 x 8)
	ld hl,09340h		;8601
L_8604:
	ld bc,00404h		;8604   ; los 4 x 4 caracteres de la salida (0x9340)
	push de			;8607
	push bc			;8608
	call 05737h		;8609   ; un rectangulo de caracteres, copiandolos tal cual (HMMM)
	pop bc			;860c
	pop hl			;860d
L_860E:
	call 07f39h		;860e   ; A = la pantalla que se edita (de la casilla 0xE262)
	ld d,a			;8611
	xor a			;8612
	jp 063edh		;8613
L_8616:
	call L_8621		;8616   ; borra la salida, si esta en esta pantalla
	call L_8633		;8619   ; 0xE2F0-0xE2F7 a cero
	xor a			;861c
	ld (0e26ah),a		;861d   ; guarda la marca de salida puesta en el editor
	ret			;8620
L_8621:
	ld hl,0e2f3h		;8621   ; borra la salida, si esta en esta pantalla
	call 07f39h		;8624   ; A = la pantalla que se edita (de la casilla 0xE262)
	cp (hl)			;8627
	ret nz			;8628
	dec hl			;8629
	ld d,(hl)			;862a
	dec hl			;862b
	ld e,(hl)			;862c
	ld hl,086c5h		;862d
	jp L_8604		;8630
L_8633:
	ld hl,0e2f0h		;8633   ; 0xE2F0-0xE2F7 a cero
	ld de,0e2f1h		;8636   ; apunta a la salida de la fase: y, x y pantalla (0xE2F3)
	ld bc,00007h		;8639
	ld (hl),000h		;863c
	ldir		;863e
	ret			;8640
L_8641:
	ld hl,0e800h		;8641   ; el cursor del editor: el sprite 0 en (0xE264, 0xE265), parpadeando
	ld a,(0e264h)		;8644   ; lee la y del cursor del editor (en caracteres)
	add a,a			;8647
	add a,a			;8648
	add a,a			;8649
	ld (hl),a			;864a
	inc hl			;864b
	ld a,(0e265h)		;864c   ; lee la x del cursor del editor (en caracteres)
	add a,a			;864f
	add a,a			;8650
	add a,a			;8651
	ld (hl),a			;8652
	inc hl			;8653
	ld (hl),01ch		;8654
	inc hl			;8656
	ld a,(0e203h)		;8657   ; lee la cuenta de cuadros
	and 008h		;865a
	ld a,007h		;865c
	jr z,L_8661		;865e
	xor a			;8660
L_8661:
	ld hl,0d200h		;8661   ; apunta a los colores de los sprites (16 bytes por sprite)
	jp 07c04h		;8664
L_8667:
	ld a,(0e20ch)		;8667   ; grabar o cargar: con ESC (bit 6 de 0xE20C) se vuelve al menu
	rla			;866a
	rla			;866b
	jr c,L_8676		;866c
	call L_88AB		;866e   ; grabar o cargar del editor, por pasos (0xE25B)
	ld a,(0e25bh)		;8671   ; lee el paso dentro del menu del editor
	and a			;8674
	ret nz			;8675
L_8676:
	ld hl,00005h		;8676
	ld (0e25ah),hl		;8679   ; guarda el paso del editor y el byte siguiente (16 bits)
	ret			;867c
L_867D:
	ld a,001h		;867d   ; la rejilla con el numero de cada pantalla
	call L_886A		;867f   ; pinta el fondo del editor: el dibujo A de la tabla 0xBB38 (banco 13), un bit por caracter
	call 041bfh		;8682   ; pone el banco 13 en 0xA000
	ld hl,0bc54h		;8685
	call 051d0h		;8688   ; pinta un letrero: [D][E] y caracteres; 0xFE trae otra posicion; 0xFF acaba
	call 0418ah		;868b   ; pone los bancos 1-2-3 (el juego)
	ld de,0a090h		;868e
	ld hl,0e788h		;8691
	ld bc,00606h		;8694
L_8697:
	push de			;8697   ; 6 filas de 6 casillas
	push bc			;8698
	ld b,c			;8699
L_869A:
	ld a,(hl)			;869a
	and a			;869b
	ld c,0ffh		;869c
	jr z,L_86A3		;869e
	add a,0d0h		;86a0   ; el numero de la pantalla, o nada
	ld c,a			;86a2
L_86A3:
	ld a,c			;86a3   ; el numero
	call 05207h		;86a4   ; pinta el caracter A en (D, E): lo copia de la pagina 1 con HMMM
	ld a,d			;86a7   ; 8 pixeles a la derecha
	add a,008h		;86a8
	ld d,a			;86aa
	inc hl			;86ab
	djnz L_869A		;86ac
	pop bc			;86ae
	pop de			;86af
	ld a,e			;86b0   ; la fila siguiente
	add a,008h		;86b1
	ld e,a			;86b3
	inc hl			;86b4   ; saltando las dos casillas de la derecha de la rejilla (8 de ancho)
	inc hl			;86b5
	djnz L_8697		;86b6
	ret			;86b8

; ----------------------------------------------------------------------
; DATOS resto_86B9: lo apuntan con el banco puesto p02:815F (0x86B9), p02:82ED
;   (0x86C5), p02:84EC (0x86C5), p02:85BF (0x86C5), p02:862D (0x86C5); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p02:815F, p02:82ED, p02:84EC, p02:85BF, p02:862D (36 bytes)
;   0x86b9..0x86dd  (36 bytes)
DATA_resto_86B9:
	defb 068h,00bh,04ch,068h,00ah,047h,088h,00ah,047h,0c0h,007h,049h,0e0h,0e0h,0e0h,0e0h	; 86b9  h.Lh.G..G..I....
	defb 0e0h,0e0h,0e0h,0e0h,0e0h,0e0h,0e0h,0e0h,0e0h,0e0h,0e0h,0e0h,0e0h,0e0h,0e0h,0e0h	; 86c9  ................
	defb 0e0h,0e0h,0e0h,0e0h	; 86d9

; ======================================================================
; CODIGO 0x86dd..0x88b2  (469 bytes)
; ======================================================================


L_86DD:
	ld hl,0e21ch		;86dd   ; en el editor: si se deja pulsado un cursor, se repite (tras 0x2D cuadros, cada 5)
	ld de,0e207h		;86e0   ; apunta a el mando: lo que se acaba de pulsar
	ld bc,0e208h		;86e3   ; apunta a el mando: lo pulsado
	ld a,(hl)			;86e6
	cp 02dh		;86e7
	jr nc,L_86F6		;86e9
	ld a,(de)			;86eb
	and 00fh		;86ec
	jr nz,L_8705		;86ee
	ld a,(bc)			;86f0
	and a			;86f1
	jr z,L_8705		;86f2
	inc (hl)			;86f4
	ret			;86f5
L_86F6:
	ld a,(bc)			;86f6   ; ya repitiendo: si sigue pulsado...
	and a			;86f7
	jr z,L_8705		;86f8
	inc hl			;86fa
	inc (hl)			;86fb   ; ...cada 5 cuadros...
	ld a,(hl)			;86fc
	cp 005h		;86fd
	ret nz			;86ff
	ld (hl),000h		;8700
	ld a,(bc)			;8702   ; ...vuelve a contar como recien pulsado
	ld (de),a			;8703
	ret			;8704
L_8705:
	ld (hl),000h		;8705
	ret			;8707
L_8708:
	exx			;8708   ; mueve el cursor con el paso de la opcion
	ld a,(0e261h)		;8709   ; lee la opcion del submenu del editor
	ld bc,00201h		;870c
	cp 004h		;870f
	jr c,L_871F		;8711
	ld c,002h		;8713
	cp 006h		;8715
	jr z,L_871F		;8717
	jr L_871C		;8719
L_871B:
	exx			;871b   ; mueve el cursor del editor de 1 en 1 (limites en 0xE27C y 0xE2FB)
L_871C:
	ld bc,00101h		;871c
L_871F:
	ld a,(0e2fbh)		;871f
	ld h,a			;8722
	and 00fh		;8723
	ld d,a			;8725
	ld a,h			;8726
	rrca			;8727
	rrca			;8728
	rrca			;8729
	rrca			;872a
	and 00fh		;872b
	ld e,a			;872d
	exx			;872e
	ld hl,0e264h		;872f   ; apunta a la y del cursor del editor (en caracteres)
	ld de,0e265h		;8732   ; apunta a la x del cursor del editor (en caracteres)
	ld bc,(0e27ch)		;8735
	ld a,(0e207h)		;8739   ; lee el mando: lo que se acaba de pulsar
	rra			;873c
	jr c,L_8757		;873d
	rra			;873f   ; derecha
	jr c,L_8769		;8740
	rra			;8742
	jr c,L_8778		;8743
	rra			;8745
	ret nc			;8746
	call 042cbh		;8747   ; pide el sonido 0x32
	ex de,hl			;874a
	ld a,(hl)			;874b
	exx			;874c
	add a,b			;874d
	exx			;874e
	ld (hl),a			;874f
	cp b			;8750
	ret c			;8751
	exx			;8752
	ld a,d			;8753
	exx			;8754
	ld (hl),a			;8755
	ret			;8756
L_8757:
	call 042cbh		;8757   ; arriba
	ld a,(hl)			;875a   ; la y del cursor menos el paso
	exx			;875b
	sub c			;875c
	exx			;875d
	ld (hl),a			;875e
	rla			;875f   ; por debajo de 0, o por debajo del limite...
	jr c,L_8766		;8760
	exx			;8762
	cp e			;8763
	exx			;8764
	ret nc			;8765
L_8766:
	ld (hl),c			;8766   ; ...se queda en el limite
	dec (hl)			;8767
	ret			;8768
L_8769:
	call 042cbh		;8769   ; abajo
	ld a,(hl)			;876c   ; la y mas el paso
	exx			;876d
	add a,c			;876e
	exx			;876f
	ld (hl),a			;8770
	cp c			;8771   ; mas alla del limite, se queda en el
	ret c			;8772
	exx			;8773
	ld a,e			;8774
	exx			;8775
	ld (hl),a			;8776
	ret			;8777
L_8778:
	call 042cbh		;8778   ; izquierda
	ex de,hl			;877b
	ld a,(hl)			;877c   ; la x menos el paso
	exx			;877d
	sub b			;877e
	exx			;877f
	ld (hl),a			;8780
	rla			;8781   ; por debajo del limite, se queda en el
	jr c,L_8788		;8782
	exx			;8784
	cp d			;8785
	exx			;8786
	ret nc			;8787
L_8788:
	ld (hl),b			;8788
	dec (hl)			;8789
	ret			;878a
L_878B:
	ld hl,0e7c0h		;878b   ; marca en el mapa las 16 columnas de 0xE7C0
	ld b,010h		;878e
L_8790:
	push bc			;8790
	ld a,(hl)			;8791
	and a			;8792
	push hl			;8793
	call nz,L_87A1		;8794   ; una: B casillas de alto, 2 de ancho, con el valor 1
	pop hl			;8797
	pop bc			;8798
	ld a,004h		;8799
	call 0408fh		;879b   ; suma A a HL (HL = HL + A)
	djnz L_8790		;879e
	ret			;87a0
L_87A1:
	ld a,(hl)			;87a1   ; una: B casillas de alto, 2 de ancho, con el valor 1
	push af			;87a2   ; la pantalla
	inc hl			;87a3
	ld e,(hl)			;87a4   ; el sitio
	inc hl			;87a5
	ld d,(hl)			;87a6
	inc hl			;87a7
	ld a,(hl)			;87a8   ; el alto
	and 01fh		;87a9
	ld b,a			;87ab
	ld c,002h		;87ac
	ex de,hl			;87ae
	pop de			;87af
	ld a,001h		;87b0   ; el valor 1 en el mapa
	jp 063edh		;87b2
L_87B5:
	ld hl,0e788h		;87b5   ; prepara los saltos de la fase hecha en el editor: las listas de 0xED80-0xEDB0
	ld bc,03001h		;87b8
	xor a			;87bb
	ld (0efc0h),a		;87bc   ; guarda un dato de paso de la rutina en curso
	ld (0efc1h),a		;87bf
L_87C2:
	ld a,(hl)			;87c2   ; la casilla de la pantalla C
	cp c			;87c3
	jr nz,L_87D3		;87c4
	push hl			;87c6
	push bc			;87c7
	call L_87FA		;87c8   ; una pantalla de la fase del editor: si arriba no tiene vecina, salto de arriba/abajo; si a la izquierda tampoco, de izquierda/derecha
	pop bc			;87cb
	pop hl			;87cc
	inc c			;87cd   ; la pantalla siguiente (hasta la 6)
	ld a,c			;87ce
	cp 007h		;87cf
	jr nc,L_87D6		;87d1
L_87D3:
	inc hl			;87d3
	djnz L_87C2		;87d4
L_87D6:
	ld a,(0efc0h)		;87d6   ; lee un dato de paso de la rutina en curso
	ld hl,0ed80h		;87d9   ; apunta a los saltos entre pantallas al salir por arriba
	ld de,0ed90h		;87dc   ; apunta a los saltos al salir por abajo
	call L_87EB		;87df
	ld a,(0efc1h)		;87e2
	ld hl,0eda0h		;87e5   ; apunta a los saltos al salir por la izquierda
	ld de,0edb0h		;87e8   ; apunta a los saltos al salir por la derecha
L_87EB:
	add a,a			;87eb
	ld b,a			;87ec
	call 0408fh		;87ed   ; suma A a HL (HL = HL + A)
	ld (hl),0ffh		;87f0
	ld a,b			;87f2
	call 04094h		;87f3   ; suma A a DE (DE = DE + A)
	ld a,0ffh		;87f6
	ld (de),a			;87f8
	ret			;87f9
L_87FA:
	push hl			;87fa   ; una pantalla de la fase del editor: si arriba no tiene vecina, salto de arriba/abajo; si a la izquierda tampoco, de izquierda/derecha
	dec hl			;87fb
	ld b,(hl)			;87fc
	ld de,00007h		;87fd
	or a			;8800
	sbc hl,de		;8801
	ld a,(hl)			;8803
	pop hl			;8804
	and a			;8805
	jr nz,L_8819		;8806
	push hl			;8808
	push bc			;8809
	ld bc,0ed80h		;880a   ; apunta a los saltos entre pantallas al salir por arriba
	ld de,0ed91h		;880d
	call L_882A		;8810   ; la entrada de la lista: 2 x 0xEFC0
	ld hl,0efc0h		;8813   ; apunta a un dato de paso de la rutina en curso
	inc (hl)			;8816
	pop bc			;8817
	pop hl			;8818
L_8819:
	ld a,b			;8819
	and a			;881a
	ret nz			;881b
	ld bc,0eda0h		;881c   ; apunta a los saltos al salir por la izquierda
	ld de,0edb1h		;881f
	call L_884D		;8822   ; la entrada de la lista: 2 x 0xEFC1
	ld hl,0efc1h		;8825
	inc (hl)			;8828
	ret			;8829
L_882A:
	ld a,(0efc0h)		;882a   ; la entrada de la lista: 2 x 0xEFC0
	add a,a			;882d
	push af			;882e
	add a,c			;882f
	ld c,a			;8830
	pop af			;8831
	add a,e			;8832
	ld e,a			;8833
	ld a,l			;8834   ; la casilla de la rejilla (0xE788 + n)
	sub 088h		;8835
	ld (bc),a			;8837
	ld (de),a			;8838
L_8839:
	ld a,l			;8839   ; baja por la columna hasta la ultima pantalla
	add a,008h		;883a
	ld l,a			;883c
	ld a,(hl)			;883d
	and a			;883e
	jr nz,L_8839		;883f
	ld a,l			;8841   ; la ultima con pantalla
	sub 008h		;8842
	ld l,a			;8844
	ld a,l			;8845
	sub 088h		;8846
	inc bc			;8848   ; la pareja al reves en la otra lista
	ld (bc),a			;8849
	dec de			;884a
	ld (de),a			;884b
	ret			;884c
L_884D:
	ld a,(0efc1h)		;884d   ; la entrada de la lista: 2 x 0xEFC1
	add a,a			;8850
	push af			;8851
	add a,c			;8852
	ld c,a			;8853
	pop af			;8854
	add a,e			;8855
	ld e,a			;8856
	ld a,l			;8857   ; la casilla
	sub 088h		;8858
	ld (bc),a			;885a
	ld (de),a			;885b
L_885C:
	inc hl			;885c   ; va hacia la derecha hasta la ultima pantalla de la fila
	ld a,(hl)			;885d
	and a			;885e
	jr nz,L_885C		;885f
	dec hl			;8861
	ld a,l			;8862   ; la ultima
	sub 088h		;8863
	inc bc			;8865
	ld (bc),a			;8866   ; la pareja al reves
	dec de			;8867
	ld (de),a			;8868
	ret			;8869
L_886A:
	push af			;886a   ; pinta el fondo del editor: el dibujo A de la tabla 0xBB38 (banco 13), un bit por caracter
	call 04ebeh		;886b   ; apaga la pantalla (bit 6 de R#1 a cero)
	pop af			;886e
	call 041bfh		;886f   ; pone el banco 13 en 0xA000
	ld hl,0bb38h		;8872
	call 04d4ch		;8875   ; HL = la palabra A de la tabla de HL
	ld de,00000h		;8878
	ld b,060h		;887b
	ld a,(0f0f4h)		;887d   ; el caracter: 0x5E en MSX2, 0x62 en MSX1
	and a			;8880
	ld c,062h		;8881
	jr z,L_8887		;8883
	ld c,05eh		;8885
L_8887:
	push bc			;8887
	push hl			;8888
	ld a,(hl)			;8889
	ld b,008h		;888a
L_888C:
	rla			;888c   ; cada bit a 1, el caracter
	push af			;888d
	ld a,c			;888e
	call c,05767h		;888f   ; pinta el caracter A sin su color 0 (p00:5219)
	ld a,d			;8892
	add a,008h		;8893
	ld d,a			;8895
	jr nc,L_889C		;8896
	ld a,e			;8898
	add a,008h		;8899
	ld e,a			;889b
L_889C:
	pop af			;889c
	djnz L_888C		;889d
	pop hl			;889f
	inc hl			;88a0
	pop bc			;88a1
	djnz L_8887		;88a2
	call 0418ah		;88a4   ; pone los bancos 1-2-3 (el juego)
	call 04eb1h		;88a7   ; enciende la pantalla (bit 6 de R#1)
	ret			;88aa
L_88AB:
	ld a,(0e25bh)		;88ab   ; grabar o cargar del editor, por pasos (0xE25B)
	dec a			;88ae
	call 04099h		;88af   ; el despachador de Konami: la tabla va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_88B2: 6 destinos del despachador p00:4099 (call en p02:88AF, el
;   indice en A): 88BE, 8917, 89E9, 8A54, 8B43, 8B88; lo leen p02:88AF (12
;   bytes)
;   0x88b2..0x88be  (12 bytes)
DATA_tabla_88B2:
	defw 088beh,08917h,089e9h,08a54h,08b43h,08b88h	; 88b2

; ======================================================================
; CODIGO 0x88be..0x8aef  (561 bytes)
; ======================================================================


L_88BE:
	call L_8908		;88be   ; paso 1: el nombre en blanco, el marcador y el letrero de 0xBE14
	call 05bebh		;88c1   ; el marcador: la fuente con color 0x0B y los letreros de 0xAA89
	xor a			;88c4
	call L_886A		;88c5   ; pinta el fondo del editor: el dibujo A de la tabla 0xBB38 (banco 13), un bit por caracter
	call 041bfh		;88c8   ; pone el banco 13 en 0xA000
	ld hl,0be14h		;88cb
	call 051d0h		;88ce   ; pinta un letrero: [D][E] y caracteres; 0xFE trae otra posicion; 0xFF acaba
	ld a,(0f0f9h)		;88d1   ; con disco (bit 0 de 0xF0F9), su letrero
	rra			;88d4
	ld de,06060h		;88d5
	push af			;88d8
	jr nc,L_88E9		;88d9
	ld hl,0be30h		;88db
	ld c,0ffh		;88de
	push de			;88e0
	call 051dah		;88e1
	pop de			;88e4
	ld a,e			;88e5
	add a,010h		;88e6
	ld e,a			;88e8
L_88E9:
	pop af			;88e9   ; con Game Master 2 (bit 1), el suyo
	rra			;88ea
	ld hl,0be3ah		;88eb
	ld c,0ffh		;88ee
	call c,051dah		;88f0
	call 0418ah		;88f3   ; pone los bancos 1-2-3 (el juego)
	xor a			;88f6
	ld (0e26dh),a		;88f7
	ld (0e26eh),a		;88fa
	ld (0e27fh),a		;88fd   ; guarda el resultado de grabar o cargar (0 bien, 2 error)
	ld (0e21eh),a		;8900
L_8903:
	ld hl,0e25bh		;8903   ; apunta a el paso dentro del menu del editor
	inc (hl)			;8906
	ret			;8907
L_8908:
	ld hl,0e270h		;8908   ; los ceros del nombre (0xE270, 11 bytes) a espacios
	ld b,00bh		;890b
L_890D:
	ld a,(hl)			;890d
	and a			;890e
	jr nz,L_8913		;890f
	ld (hl),020h		;8911
L_8913:
	inc hl			;8913
	djnz L_890D		;8914
	ret			;8916
L_8917:
	call L_897A		;8917   ; elegir donde (0xE26D) con arriba y abajo; disparo sigue
	ld hl,0e26dh		;891a
	ld a,(0e207h)		;891d   ; lee el mando: lo que se acaba de pulsar
	rra			;8920
	jr c,L_8973		;8921
	rra			;8923
	jr c,L_8960		;8924
	rra			;8926
	rra			;8927
	rra			;8928
	ret nc			;8929
	call 05d41h		;892a   ; los atributos de los sprites (0xE800, 0x80 bytes) a 0xE0: fuera de la pantalla
	call L_8903		;892d
	call L_89CD		;8930   ; 0xF0F8 = donde se graba: la opcion, o 2 si no hay disco
	call 04e98h		;8933   ; pantalla en negro: quita sprites, borra la pagina y apaga la pantalla
	xor a			;8936
	call L_886A		;8937   ; pinta el fondo del editor: el dibujo A de la tabla 0xBB38 (banco 13), un bit por caracter
	call 041bfh		;893a   ; pone el banco 13 en 0xA000
	ld a,(0f0f8h)		;893d   ; el letrero de lo elegido (0xF0F8: 0 cinta, 1 disco, 2 Game Master 2)
	ld hl,0be26h		;8940
	and a			;8943
	jr z,L_894F		;8944
	ld hl,0be30h		;8946
	dec a			;8949
	jr z,L_894F		;894a
	ld hl,0be3ah		;894c
L_894F:
	ld de,05848h		;894f
	ld c,0ffh		;8952
	call 051dah		;8954
	ld hl,0be82h		;8957
	call 051d0h		;895a   ; pinta un letrero: [D][E] y caracteres; 0xFE trae otra posicion; 0xFF acaba
	jp 0418ah		;895d
L_8960:
	ld a,(0f0f9h)		;8960   ; abajo: hasta lo que haya (con los dos, hasta 2)
	and a			;8963
	ret z			;8964
	cp 003h		;8965
	ld b,002h		;8967
	jr z,L_896C		;8969
	dec b			;896b
L_896C:
	ld a,(hl)			;896c
	cp b			;896d
	ret nc			;896e
	inc (hl)			;896f
	jp 042cbh		;8970
L_8973:
	ld a,(hl)			;8973   ; arriba
	and a			;8974
	ret z			;8975
	dec (hl)			;8976
	jp 042cbh		;8977
L_897A:
	ld hl,0e800h		;897a   ; la flecha (sprite 0) en la opcion 0xE26D
	ld a,(0e26dh)		;897d   ; la fila de la opcion (16 pixeles cada una)
	add a,a			;8980
	add a,a			;8981
	add a,a			;8982
	add a,a			;8983
	add a,050h		;8984
	ld (hl),a			;8986
	inc hl			;8987
	ld (hl),048h		;8988   ; x = 0x48
	inc hl			;898a
	ld (hl),014h		;898b   ; el dibujo de la flecha
	inc hl			;898d
L_898E:
	ld (hl),008h		;898e   ; su color 7 en MSX2
	ld a,(0f0f4h)		;8990   ; lee la marca de MSX2 (1 en el cartucho de MSX2, 0 en el de MSX1)
	and a			;8993
	ret z			;8994
	ld hl,0d200h		;8995   ; apunta a los colores de los sprites (16 bytes por sprite)
	ld de,0d201h		;8998
	ld bc,00010h		;899b
	ld (hl),007h		;899e
	ldir		;89a0
	ret			;89a2
L_89A3:
	xor a			;89a3   ; con Game Master 2: los tres ficheros FILE que caben
	call L_886A		;89a4   ; pinta el fondo del editor: el dibujo A de la tabla 0xBB38 (banco 13), un bit por caracter
	call 041bfh		;89a7   ; pone el banco 13 en 0xA000
	ld hl,0be5ch		;89aa
	call 051d0h		;89ad   ; pinta un letrero: [D][E] y caracteres; 0xFE trae otra posicion; 0xFF acaba
	ld hl,0be44h		;89b0
	call 051d0h		;89b3   ; pinta un letrero: [D][E] y caracteres; 0xFE trae otra posicion; 0xFF acaba
	ld hl,0be4ch		;89b6
	call 051d0h		;89b9   ; pinta un letrero: [D][E] y caracteres; 0xFE trae otra posicion; 0xFF acaba
	ld hl,0be54h		;89bc
	call 051d0h		;89bf   ; pinta un letrero: [D][E] y caracteres; 0xFE trae otra posicion; 0xFF acaba
	call 0418ah		;89c2   ; pone los bancos 1-2-3 (el juego)
	ld a,003h		;89c5
	ld (0f0e5h),a		;89c7
	jp L_8903		;89ca
L_89CD:
	ld a,(0e26dh)		;89cd   ; 0xF0F8 = donde se graba: la opcion, o 2 si no hay disco
	ld b,a			;89d0
	ld a,(0f0f9h)		;89d1   ; lee lo que hay para grabar (bit 0 disco, bit 1 Game Master 2)
	and a			;89d4
	jr z,L_89E4		;89d5
	cp 003h		;89d7
	jr z,L_89E4		;89d9
	dec a			;89db
	jr z,L_89E4		;89dc
	ld a,b			;89de
	and a			;89df
	jr z,L_89E4		;89e0
	ld b,002h		;89e2
L_89E4:
	ld a,b			;89e4
	ld (0f0f8h),a		;89e5   ; guarda donde se graba la fase del editor (0 cinta, 1 disco, 2 Game Master 2)
	ret			;89e8
L_89E9:
	call L_8A38		;89e9   ; la pregunta: Y graba, N vuelve
	and a			;89ec
	ret z			;89ed
	dec a			;89ee
	jp nz,L_8B50		;89ef
	ld a,0e0h		;89f2
	ld a,(0edeeh)		;89f4
	call 04e98h		;89f7   ; pantalla en negro: quita sprites, borra la pagina y apaga la pantalla
	ld a,(0f0f8h)		;89fa   ; lee donde se graba la fase del editor (0 cinta, 1 disco, 2 Game Master 2)
	cp 002h		;89fd
	jr z,L_89A3		;89ff
	xor a			;8a01
	call L_886A		;8a02   ; pinta el fondo del editor: el dibujo A de la tabla 0xBB38 (banco 13), un bit por caracter
	call L_8903		;8a05
	call 041bfh		;8a08   ; pone el banco 13 en 0xA000
	ld hl,0bde9h		;8a0b
	call 051d0h		;8a0e   ; pinta un letrero: [D][E] y caracteres; 0xFE trae otra posicion; 0xFF acaba
	call 0418ah		;8a11   ; pone los bancos 1-2-3 (el juego)
L_8A14:
	ld de,06058h		;8a14   ; pinta el nombre de 0xE270 (8 letras) en (0x60, 0x58)
L_8A17:
	ld hl,0e270h		;8a17   ; apunta a el nombre de la fase del editor (11 letras)
L_8A1A:
	ld b,008h		;8a1a
L_8A1C:
	push bc			;8a1c   ; cada letra, su caracter (o nada si es espacio)
	ld a,(hl)			;8a1d
	cp 020h		;8a1e
	ld b,000h		;8a20
	jr z,L_8A27		;8a22
	add a,0a0h		;8a24
	ld b,a			;8a26
L_8A27:
	ld a,b			;8a27   ; el caracter
	push hl			;8a28
	push de			;8a29
	call 0576ah		;8a2a   ; pinta el caracter A tal cual (p00:5207)
	pop de			;8a2d
	pop hl			;8a2e
	ld a,d			;8a2f   ; 8 pixeles a la derecha
	add a,008h		;8a30
	ld d,a			;8a32
	inc hl			;8a33
	pop bc			;8a34
	djnz L_8A1C		;8a35
	ret			;8a37
L_8A38:
	ld a,004h		;8a38   ; la respuesta: la tecla Y (fila 5 bit 6) da 1, la N (fila 4 bit 3) da 2; nada, 0
	call 00141h		;8a3a   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;8a3d
	and 008h		;8a3e
	jr nz,L_8A4E		;8a40
	ld a,005h		;8a42
	call 00141h		;8a44   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;8a47
	and 040h		;8a48
	jr nz,L_8A51		;8a4a
	xor a			;8a4c
	ret			;8a4d
L_8A4E:
	ld a,002h		;8a4e
	ret			;8a50
L_8A51:
	ld a,001h		;8a51
	ret			;8a53
L_8A54:
	ld a,(0f0f8h)		;8a54   ; escribir el nombre (en cinta y disco) o elegir fichero (Game Master 2)
	cp 002h		;8a57
	jp z,L_8AD1		;8a59
L_8A5C:
	call L_8ABB		;8a5c   ; la flecha bajo la letra 0xE26E
	call 06c2eh		;8a5f   ; lee las 11 filas del teclado a 0xEDF0-0xEDFA
	call 06b8eh		;8a62   ; la tecla pulsada, a la letra que toca (0xE26E) del nombre
	ld a,(0ededh)		;8a65
	and a			;8a68
	jr z,L_8A8D		;8a69
	cp 0e0h		;8a6b
	ld b,0a0h		;8a6d
	jr nz,L_8A73		;8a6f
	ld b,0c0h		;8a71
L_8A73:
	sub b			;8a73
	ld b,a			;8a74
	ld hl,0e26eh		;8a75
	ld a,(hl)			;8a78
	cp 007h		;8a79
	jr nc,L_8A83		;8a7b
	push af			;8a7d
	call 042cbh		;8a7e   ; pide el sonido 0x32
	pop af			;8a81
	inc (hl)			;8a82
L_8A83:
	ld hl,0e270h		;8a83   ; apunta a el nombre de la fase del editor (11 letras)
	call 0408fh		;8a86   ; suma A a HL (HL = HL + A)
	ld (hl),b			;8a89
	call L_8A14		;8a8a   ; pinta el nombre de 0xE270 (8 letras) en (0x60, 0x58)
L_8A8D:
	ld a,(0e207h)		;8a8d   ; izquierda y derecha mueven, RETURN acaba
	rra			;8a90
	rra			;8a91
	rra			;8a92
	jr c,L_8AB1		;8a93
	rra			;8a95
	jr c,L_8AA6		;8a96
	ld a,(0e20ch)		;8a98   ; lee las teclas: lo que se acaba de pulsar (bit 0 pausa, 1 recuadro, 3 musica, 4 disparo)
	rla			;8a9b
	ret nc			;8a9c
	call 05d41h		;8a9d   ; los atributos de los sprites (0xE800, 0x80 bytes) a 0xE0: fuera de la pantalla
	call 041e0h		;8aa0   ; pide el sonido 1
	jp L_8903		;8aa3
L_8AA6:
	ld hl,0e26eh		;8aa6   ; la letra siguiente (hasta la 7)
	ld a,(hl)			;8aa9
	cp 007h		;8aaa
	ret nc			;8aac
	inc (hl)			;8aad
	jp 042cbh		;8aae
L_8AB1:
	ld hl,0e26eh		;8ab1   ; la anterior (hasta la 0)
	ld a,(hl)			;8ab4
	and a			;8ab5
	ret z			;8ab6
	dec (hl)			;8ab7
	jp 042cbh		;8ab8
L_8ABB:
	ld hl,0e800h		;8abb   ; la flecha bajo la letra 0xE26E
	ld (hl),057h		;8abe
	inc hl			;8ac0
	ld a,(0e26eh)		;8ac1   ; debajo de la letra (8 pixeles cada una)
	add a,a			;8ac4
	add a,a			;8ac5
	add a,a			;8ac6
	add a,060h		;8ac7
	ld (hl),a			;8ac9
	inc hl			;8aca
	ld (hl),020h		;8acb
	inc hl			;8acd
	jp L_898E		;8ace
L_8AD1:
	call L_8B07		;8ad1   ; Game Master 2: el nombre del fichero de la tabla 0x8AEF (FILE1-FILE3)
	ret nc			;8ad4
	ld a,(0e26eh)		;8ad5
	add a,a			;8ad8
	add a,a			;8ad9
	add a,a			;8ada
	ld hl,08aefh		;8adb
	call 0408fh		;8ade   ; suma A a HL (HL = HL + A)
	ld de,0e270h		;8ae1   ; apunta a el nombre de la fase del editor (11 letras)
	ld bc,00008h		;8ae4
	ldir		;8ae7
	call 041e0h		;8ae9   ; pide el sonido 1
	jp L_8903		;8aec

; ----------------------------------------------------------------------
; DATOS resto_8AEF: lo apuntan con el banco puesto p02:8ADB (0x8AEF); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p02:8ADB (24 bytes)
;   0x8aef..0x8b07  (24 bytes)
DATA_resto_8AEF:
	defb 046h,049h,04ch,045h,031h,020h,020h,020h,046h,049h,04ch,045h,032h,020h,020h,020h	; 8aef  FILE1   FILE2
	defb 046h,049h,04ch,045h,033h,020h,020h,020h	; 8aff  FILE3

; ======================================================================
; CODIGO 0x8b07..0x8b9c  (149 bytes)
; ======================================================================


L_8B07:
	call L_8B2C		;8b07   ; elegir con arriba y abajo; NC si no se ha elegido
	ld hl,0e26eh		;8b0a
	ld a,(0e207h)		;8b0d   ; lee el mando: lo que se acaba de pulsar
	rra			;8b10
	jr c,L_8B1F		;8b11
	rra			;8b13
	jr c,L_8B24		;8b14
	rra			;8b16
	rra			;8b17
	rra			;8b18
	ret c			;8b19
	ld a,(0e20ch)		;8b1a   ; lee las teclas: lo que se acaba de pulsar (bit 0 pausa, 1 recuadro, 3 musica, 4 disparo)
	rla			;8b1d
	ret			;8b1e
L_8B1F:
	ld a,(hl)			;8b1f
	and a			;8b20
	ret z			;8b21
	dec (hl)			;8b22
	ret			;8b23
L_8B24:
	ld a,(0f0e5h)		;8b24   ; el fichero siguiente, si hay
	dec a			;8b27
	cp (hl)			;8b28
	ret z			;8b29
	inc (hl)			;8b2a
	ret			;8b2b
L_8B2C:
	ld hl,0e800h		;8b2c   ; apunta a los atributos de los sprites (y, x, dibujo, color); al cargar graficos, su bufer
	ld a,(0e26eh)		;8b2f   ; la fila del fichero (16 pixeles)
	add a,a			;8b32
	add a,a			;8b33
	add a,a			;8b34
	add a,a			;8b35
	add a,050h		;8b36
	ld (hl),a			;8b38
	inc hl			;8b39
	ld (hl),058h		;8b3a   ; x = 0x58
	inc hl			;8b3c
	ld (hl),014h		;8b3d
	inc hl			;8b3f
	jp L_898E		;8b40
L_8B43:
	call L_8B72		;8b43   ; grabar: el sonido 0x11 y, si falla (0xE27F = 2), el letrero de error
	call 04230h		;8b46   ; pide el sonido 0x11
	ld a,(0e27fh)		;8b49   ; lee el resultado de grabar o cargar (0 bien, 2 error)
	cp 002h		;8b4c
	jr z,L_8B57		;8b4e
L_8B50:
	xor a			;8b50
	ld (0e25bh),a		;8b51   ; guarda el paso dentro del menu del editor
	jp 04e98h		;8b54
L_8B57:
	ld a,(0f0f8h)		;8b57   ; lee donde se graba la fase del editor (0 cinta, 1 disco, 2 Game Master 2)
	dec a			;8b5a
	jr z,L_8B6F		;8b5b
	call 05d41h		;8b5d   ; los atributos de los sprites (0xE800, 0x80 bytes) a 0xE0: fuera de la pantalla
	call 04e98h		;8b60   ; pantalla en negro: quita sprites, borra la pagina y apaga la pantalla
	call 041bfh		;8b63   ; pone el banco 13 en 0xA000
	ld hl,0be6ah		;8b66
	call 051d0h		;8b69   ; pinta un letrero: [D][E] y caracteres; 0xFE trae otra posicion; 0xFF acaba
	call 0418ah		;8b6c   ; pone los bancos 1-2-3 (el juego)
L_8B6F:
	jp L_8903		;8b6f
L_8B72:
	ld a,(0f0f8h)		;8b72   ; graba la fase del editor donde diga 0xF0F8: cinta (0xBF2B), disco (p02:9C20) o Game Master 2 (p01:6C3D)
	or a			;8b75
	jr z,L_8B7F		;8b76
	dec a			;8b78
	jp z,L_9C20		;8b79
	jp 06c3dh		;8b7c
L_8B7F:
	call 041b5h		;8b7f   ; pone el banco 12 en 0xA000
	call 0bf2bh		;8b82   ; graba en cinta: TAPOON con la cabecera larga
	jp 0418ah		;8b85
L_8B88:
	ld a,(0e207h)		;8b88   ; espera una tecla y vuelve al menu
	and a			;8b8b
	ret z			;8b8c
	ld a,001h		;8b8d
	ld (0e25bh),a		;8b8f   ; guarda el paso dentro del menu del editor
	jp 04e98h		;8b92
L_8B95:
	ld a,(0e25bh)		;8b95   ; cargar del editor, por pasos (0xE25B)
	dec a			;8b98
	call 04099h		;8b99   ; el despachador de Konami: la tabla va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_8B9C: 8 destinos del despachador p00:4099 (call en p02:8B99, el
;   indice en A): 8BAC, 8BCA, 8C52, 8C95, 8D87, 8E88, 8EB9, 8DF8; lo leen
;   p02:8B99 (16 bytes)
;   0x8b9c..0x8bac  (16 bytes)
DATA_tabla_8B9C:
	defw 08bach,08bcah,08c52h,08c95h,08d87h,08e88h,08eb9h,08df8h	; 8b9c

; ======================================================================
; CODIGO 0x8bac..0x8ee1  (821 bytes)
; ======================================================================


L_8BAC:
	call 04e98h		;8bac   ; paso 1: el letrero de 0xBD6D y todo a cero
	xor a			;8baf
	call L_886A		;8bb0   ; pinta el fondo del editor: el dibujo A de la tabla 0xBB38 (banco 13), un bit por caracter
	call 041bfh		;8bb3   ; pone el banco 13 en 0xA000
	ld hl,0bd6dh		;8bb6
	call 051d0h		;8bb9   ; pinta un letrero: [D][E] y caracteres; 0xFE trae otra posicion; 0xFF acaba
	call 0418ah		;8bbc   ; pone los bancos 1-2-3 (el juego)
	call L_8F0C		;8bbf   ; borra los puntos y 0xE280-0xEFFF
	call 07969h		;8bc2   ; el nombre (0xE270, 12 bytes) en blanco
L_8BC5:
	ld hl,0e25bh		;8bc5   ; apunta a el paso dentro del menu del editor
	inc (hl)			;8bc8
	ret			;8bc9
L_8BCA:
	call L_8C33		;8bca   ; elegir entre dos (0xE26D) con izquierda y derecha; disparo sigue
	ld hl,0e26dh		;8bcd
	ld a,(0e207h)		;8bd0   ; lee el mando: lo que se acaba de pulsar
	ld b,a			;8bd3
	and 003h		;8bd4
	jr z,L_8BDF		;8bd6
	ld a,(hl)			;8bd8
	xor 001h		;8bd9
	ld (hl),a			;8bdb
	jp 042cbh		;8bdc
L_8BDF:
	ld a,b			;8bdf   ; el disparo...
	and 010h		;8be0
	ret z			;8be2
	ld a,(hl)			;8be3   ; ...en la opcion 0: cargar; en la 1, se deja
	and a			;8be4
	jr nz,L_8C2E		;8be5
L_8BE7:
	call 04e98h		;8be7   ; el letrero de donde cargar, con disco y Game Master 2 si los hay
	xor a			;8bea
	call L_886A		;8beb   ; pinta el fondo del editor: el dibujo A de la tabla 0xBB38 (banco 13), un bit por caracter
	call 041bfh		;8bee   ; pone el banco 13 en 0xA000
	ld hl,0bdb9h		;8bf1
	call 051d0h		;8bf4   ; pinta un letrero: [D][E] y caracteres; 0xFE trae otra posicion; 0xFF acaba
	call 0418ah		;8bf7   ; pone los bancos 1-2-3 (el juego)
	ld a,(0f0f9h)		;8bfa   ; lee lo que hay para grabar (bit 0 disco, bit 1 Game Master 2)
	rra			;8bfd
	ld de,06060h		;8bfe
	push af			;8c01
	jr nc,L_8C18		;8c02
	call 041bfh		;8c04   ; pone el banco 13 en 0xA000
	ld hl,0bdd5h		;8c07
	ld c,0ffh		;8c0a
	push de			;8c0c
	call 051dah		;8c0d
	pop de			;8c10
	ld a,e			;8c11
	add a,010h		;8c12
	ld e,a			;8c14
	call 0418ah		;8c15   ; pone los bancos 1-2-3 (el juego)
L_8C18:
	pop af			;8c18
	rra			;8c19
	call 041bfh		;8c1a   ; pone el banco 13 en 0xA000
	ld hl,0bddfh		;8c1d
	ld c,0ffh		;8c20
	call c,051dah		;8c22
	call 0418ah		;8c25   ; pone los bancos 1-2-3 (el juego)
	xor a			;8c28
	ld (0e26dh),a		;8c29
	jr L_8BC5		;8c2c
L_8C2E:
	xor a			;8c2e
	ld (0e25bh),a		;8c2f   ; guarda el paso dentro del menu del editor
	ret			;8c32
L_8C33:
	ld hl,0e800h		;8c33   ; la flecha
	ld a,(0e26dh)		;8c36
	and a			;8c39
	ld a,058h		;8c3a
	jr z,L_8C40		;8c3c
	ld a,068h		;8c3e
L_8C40:
	ld (hl),a			;8c40
	inc hl			;8c41
	ld (hl),068h		;8c42
	inc hl			;8c44
	ld (hl),014h		;8c45
	inc hl			;8c47
	call L_898E		;8c48   ; su color 7 en MSX2
	ret			;8c4b
L_8C4C:
	ld a,001h		;8c4c
	ld (0e25bh),a		;8c4e   ; guarda el paso dentro del menu del editor
	ret			;8c51
L_8C52:
	ld a,(0e20ch)		;8c52   ; elegir donde; ESC vuelve
	rla			;8c55
	rla			;8c56
	jr c,L_8C4C		;8c57
	call L_897A		;8c59   ; la flecha (sprite 0) en la opcion 0xE26D
	ld hl,0e26dh		;8c5c
	ld a,(0e207h)		;8c5f   ; lee el mando: lo que se acaba de pulsar
	rra			;8c62
	jr c,L_8C8E		;8c63
	rra			;8c65
	jr c,L_8C7B		;8c66
	rra			;8c68
	rra			;8c69
	rra			;8c6a
	ret nc			;8c6b
	call L_89CD		;8c6c   ; 0xF0F8 = donde se graba: la opcion, o 2 si no hay disco
	call 05d41h		;8c6f   ; los atributos de los sprites (0xE800, 0x80 bytes) a 0xE0: fuera de la pantalla
	call 04e98h		;8c72   ; pantalla en negro: quita sprites, borra la pagina y apaga la pantalla
	call L_8BC5		;8c75
	jp 041e0h		;8c78
L_8C7B:
	ld a,(0f0f9h)		;8c7b   ; lee lo que hay para grabar (bit 0 disco, bit 1 Game Master 2)
	and a			;8c7e
	ret z			;8c7f
	cp 003h		;8c80
	ld b,002h		;8c82
	jr z,L_8C87		;8c84
	dec b			;8c86
L_8C87:
	ld a,(hl)			;8c87
	cp b			;8c88
	ret nc			;8c89
	inc (hl)			;8c8a
	jp 042cbh		;8c8b
L_8C8E:
	ld a,(hl)			;8c8e
	and a			;8c8f
	ret z			;8c90
	dec (hl)			;8c91
	jp 042cbh		;8c92
L_8C95:
	ld a,(0f0f8h)		;8c95   ; cinta: el letrero; disco: la lista; Game Master 2: sus ficheros
	dec a			;8c98
	jp z,L_8D31		;8c99
	dec a			;8c9c
	jr z,L_8CB5		;8c9d
	xor a			;8c9f
	call L_886A		;8ca0   ; pinta el fondo del editor: el dibujo A de la tabla 0xBB38 (banco 13), un bit por caracter
	call 041bfh		;8ca3   ; pone el banco 13 en 0xA000
	ld hl,0bde9h		;8ca6
	call 051d0h		;8ca9   ; pinta un letrero: [D][E] y caracteres; 0xFE trae otra posicion; 0xFF acaba
	call 0418ah		;8cac   ; pone los bancos 1-2-3 (el juego)
	call 04230h		;8caf   ; pide el sonido 0x11
	jp L_8BC5		;8cb2
L_8CB5:
	call 06e2dh		;8cb5   ; los ficheros FILE del Game Master 2
	ld a,(0f0e5h)		;8cb8
	and a			;8cbb
	jr z,L_8D1A		;8cbc
	xor a			;8cbe
	call L_886A		;8cbf   ; pinta el fondo del editor: el dibujo A de la tabla 0xBB38 (banco 13), un bit por caracter
	call 041bfh		;8cc2   ; pone el banco 13 en 0xA000
	ld hl,0be5ch		;8cc5
	call 051d0h		;8cc8   ; pinta un letrero: [D][E] y caracteres; 0xFE trae otra posicion; 0xFF acaba
	call 0418ah		;8ccb   ; pone los bancos 1-2-3 (el juego)
	ld hl,0ee54h		;8cce
	ld de,07050h		;8cd1
	ld b,003h		;8cd4
L_8CD6:
	ld a,(hl)			;8cd6
	and a			;8cd7
	jr z,L_8CED		;8cd8
	push hl			;8cda
	push de			;8cdb
	push bc			;8cdc
	call 041bfh		;8cdd   ; pone el banco 13 en 0xA000
	call L_8CFA		;8ce0   ; el nombre del fichero (FILE1, FILE2 o FILE3)
	call 0418ah		;8ce3   ; pone los bancos 1-2-3 (el juego)
	pop bc			;8ce6
	pop de			;8ce7
	pop hl			;8ce8
	ld a,e			;8ce9
	add a,010h		;8cea
	ld e,a			;8cec
L_8CED:
	ld a,008h		;8ced
	call 0408fh		;8cef   ; suma A a HL (HL = HL + A)
	djnz L_8CD6		;8cf2
	call L_8BC5		;8cf4
	jp 04230h		;8cf7
L_8CFA:
	sub 031h		;8cfa   ; el nombre del fichero (FILE1, FILE2 o FILE3)
	and a			;8cfc
	jr z,L_8D0A		;8cfd
	dec a			;8cff
	jr z,L_8D12		;8d00
	ld hl,0be56h		;8d02
	ld c,0ffh		;8d05
	jp 051dah		;8d07
L_8D0A:
	ld hl,0be46h		;8d0a
	ld c,0ffh		;8d0d
	jp 051dah		;8d0f
L_8D12:
	ld hl,0be4eh		;8d12
	ld c,0ffh		;8d15
	jp 051dah		;8d17
L_8D1A:
	call 04e98h		;8d1a   ; no hay ficheros: el letrero de 0xAF7D
	call 041b5h		;8d1d   ; pone el banco 12 en 0xA000
	ld hl,0af7dh		;8d20
	call 051d0h		;8d23   ; pinta un letrero: [D][E] y caracteres; 0xFE trae otra posicion; 0xFF acaba
	call 0418ah		;8d26   ; pone los bancos 1-2-3 (el juego)
	ld a,007h		;8d29
	ld (0e25bh),a		;8d2b   ; guarda el paso dentro del menu del editor
	jp 04230h		;8d2e
L_8D31:
	call L_9CAB		;8d31   ; la lista de ficheros del disco (p02:9CAB)
	ld a,(0f0e5h)		;8d34
	and a			;8d37
	jr z,L_8D1A		;8d38
	call L_8BC5		;8d3a
	call 04230h		;8d3d   ; pide el sonido 0x11
L_8D40:
	call 04e98h		;8d40   ; pinta la lista: hasta 16 nombres de 11 letras en dos columnas
	ld a,001h		;8d43
	call L_886A		;8d45   ; pinta el fondo del editor: el dibujo A de la tabla 0xBB38 (banco 13), un bit por caracter
	call 041bfh		;8d48   ; pone el banco 13 en 0xA000
	ld hl,0bd86h		;8d4b
	call 051d0h		;8d4e   ; pinta un letrero: [D][E] y caracteres; 0xFE trae otra posicion; 0xFF acaba
	call 0418ah		;8d51   ; pone los bancos 1-2-3 (el juego)
	ld hl,0ee50h		;8d54   ; apunta a la lista de las cosas de 0xE300 por orden de pintado
	ld de,03020h		;8d57
	ld b,008h		;8d5a
L_8D5C:
	push bc			;8d5c   ; un nombre en la columna de la izquierda
	push hl			;8d5d
	push de			;8d5e
	call L_8A1A		;8d5f
	pop de			;8d62
	pop hl			;8d63
	pop bc			;8d64
	ld a,00bh		;8d65   ; el siguiente (11 bytes)
	call 0408fh		;8d67   ; suma A a HL (HL = HL + A)
	ld a,(hl)			;8d6a
	and a			;8d6b   ; sin mas, se acaba
	ret z			;8d6c
	push bc			;8d6d
	push hl			;8d6e
	push de			;8d6f
	ld d,0a0h		;8d70   ; y otro en la de la derecha (x = 0xA0)
	call L_8A1A		;8d72
	pop de			;8d75
	pop hl			;8d76
	pop bc			;8d77
	ld a,00bh		;8d78
	call 0408fh		;8d7a   ; suma A a HL (HL = HL + A)
	ld a,(hl)			;8d7d
	and a			;8d7e
	ret z			;8d7f
	ld a,e			;8d80   ; la fila siguiente
	add a,010h		;8d81
	ld e,a			;8d83
	djnz L_8D5C		;8d84
	ret			;8d86
L_8D87:
	ld a,(0e20ch)		;8d87   ; elegir fichero con los cursores (de dos en dos arriba y abajo); RETURN carga
	rla			;8d8a
	rla			;8d8b
	jp c,L_8C4C		;8d8c
	ld a,(0f0f8h)		;8d8f   ; lee donde se graba la fase del editor (0 cinta, 1 disco, 2 Game Master 2)
	and a			;8d92
	jp z,L_8A5C		;8d93
	dec a			;8d96
	jp nz,L_8E5A		;8d97
	ld a,(0e207h)		;8d9a   ; lee el mando: lo que se acaba de pulsar
	and 020h		;8d9d
	jr nz,L_8DEF		;8d9f
	call L_8E39		;8da1   ; la flecha en el fichero 0xE26E (dos columnas)
	ld a,(0f0e5h)		;8da4
	ld b,a			;8da7
	ld hl,0e26eh		;8da8
	ld a,(0e207h)		;8dab   ; lee el mando: lo que se acaba de pulsar
	rra			;8dae
	jr c,L_8E11		;8daf
	rra			;8db1
	jr c,L_8E1A		;8db2
	rra			;8db4
	jr c,L_8E24		;8db5
	rra			;8db7
	jr c,L_8E2E		;8db8
	ld a,(0e20ch)		;8dba   ; lee las teclas: lo que se acaba de pulsar (bit 0 pausa, 1 recuadro, 3 musica, 4 disparo)
	rla			;8dbd
	ret nc			;8dbe
	ld a,(hl)			;8dbf
	and a			;8dc0
	jr z,L_8DC9		;8dc1
	ld b,a			;8dc3
	xor a			;8dc4
L_8DC5:
	add a,00bh		;8dc5
	djnz L_8DC5		;8dc7
L_8DC9:
	ld hl,0ee50h		;8dc9   ; el nombre elegido a 0xE270
	call 0408fh		;8dcc   ; suma A a HL (HL = HL + A)
	ld de,0e270h		;8dcf   ; apunta a el nombre de la fase del editor (11 letras)
	ld bc,0000bh		;8dd2
	ldir		;8dd5
	call 04e98h		;8dd7   ; pantalla en negro: quita sprites, borra la pagina y apaga la pantalla
	call 05d41h		;8dda   ; los atributos de los sprites (0xE800, 0x80 bytes) a 0xE0: fuera de la pantalla
	call 041bfh		;8ddd   ; pone el banco 13 en 0xA000
	ld hl,0be06h		;8de0
	call 051d0h		;8de3   ; pinta un letrero: [D][E] y caracteres; 0xFE trae otra posicion; 0xFF acaba
	call 0418ah		;8de6   ; pone los bancos 1-2-3 (el juego)
	call 041e0h		;8de9   ; pide el sonido 1
	jp L_8BC5		;8dec
L_8DEF:
	call 041e0h		;8def   ; el segundo boton: se deja
	ld a,008h		;8df2
L_8DF4:
	ld (0e25bh),a		;8df4   ; guarda el paso dentro del menu del editor
	ret			;8df7
L_8DF8:
	call L_9CAB		;8df8   ; vuelve a la lista
	call L_8D40		;8dfb   ; pinta la lista: hasta 16 nombres de 11 letras en dos columnas
	xor a			;8dfe
	ld (0e26eh),a		;8dff
	call 04230h		;8e02   ; pide el sonido 0x11
	ld a,(0e200h)		;8e05   ; lee el estado del juego (0 presentacion, 1 titulo, 3 menu, 4 empieza la fase, 5 juego, 6 se acaba la vida, 7 fin, 9 fase acabada, 0x0B editor, 0x0D final)
	cp 00bh		;8e08
	ld a,005h		;8e0a
	jr z,L_8DF4		;8e0c
	dec a			;8e0e
	jr L_8DF4		;8e0f
L_8E11:
	ld a,(hl)			;8e11   ; arriba: dos menos
	cp 002h		;8e12
	ret c			;8e14
	dec (hl)			;8e15
	dec (hl)			;8e16
	jp 042cbh		;8e17
L_8E1A:
	ld a,(hl)			;8e1a   ; abajo: dos mas
	inc a			;8e1b
	inc a			;8e1c
	cp b			;8e1d
	ret nc			;8e1e
	inc (hl)			;8e1f
	inc (hl)			;8e20
	jp 042cbh		;8e21
L_8E24:
	ld a,(hl)			;8e24   ; izquierda
	rra			;8e25
	ret nc			;8e26
	ld a,(hl)			;8e27
	and a			;8e28
	ret z			;8e29
	dec (hl)			;8e2a
	jp 042cbh		;8e2b
L_8E2E:
	ld a,(hl)			;8e2e   ; derecha
	rra			;8e2f
	ret c			;8e30
	ld a,(hl)			;8e31
	inc a			;8e32
	cp b			;8e33
	ret nc			;8e34
	inc (hl)			;8e35
	jp 042cbh		;8e36
L_8E39:
	ld de,0e26eh		;8e39   ; la flecha en el fichero 0xE26E (dos columnas)
	ld hl,0e800h		;8e3c   ; apunta a los atributos de los sprites (y, x, dibujo, color); al cargar graficos, su bufer
	ld a,(de)			;8e3f
	and 0feh		;8e40
	add a,a			;8e42
	add a,a			;8e43
	add a,a			;8e44
	add a,020h		;8e45
	ld (hl),a			;8e47
	inc hl			;8e48
	ld a,(de)			;8e49
	rra			;8e4a
	ld a,018h		;8e4b
	jr nc,L_8E51		;8e4d
	ld a,088h		;8e4f
L_8E51:
	ld (hl),a			;8e51
	inc hl			;8e52
	ld (hl),014h		;8e53
	inc hl			;8e55
	call L_898E		;8e56   ; su color 7 en MSX2
	ret			;8e59
L_8E5A:
	call L_8B07		;8e5a   ; Game Master 2: el nombre de la lista 0xEE50
	ret nc			;8e5d
	ld hl,0e270h		;8e5e   ; apunta a el nombre de la fase del editor (11 letras)
	ld de,0e271h		;8e61
	ld bc,00007h		;8e64
	ld (hl),020h		;8e67
	ldir		;8e69
	ld a,(0e26eh)		;8e6b
	add a,a			;8e6e
	add a,a			;8e6f
	add a,a			;8e70
	ld hl,0ee50h		;8e71   ; apunta a la lista de las cosas de 0xE300 por orden de pintado
	call 0408fh		;8e74   ; suma A a HL (HL = HL + A)
	ld de,0e270h		;8e77   ; apunta a el nombre de la fase del editor (11 letras)
	ld bc,00005h		;8e7a
	ldir		;8e7d
	call 05d41h		;8e7f   ; los atributos de los sprites (0xE800, 0x80 bytes) a 0xE0: fuera de la pantalla
	call 041e0h		;8e82   ; pide el sonido 1
	jp L_8BC5		;8e85
L_8E88:
	call L_8EA3		;8e88   ; carga y 0xE27E = 1; si falla, el letrero
	ld a,001h		;8e8b
	ld (0e27eh),a		;8e8d
	call 04230h		;8e90   ; pide el sonido 0x11
	ld a,(0e27fh)		;8e93   ; lee el resultado de grabar o cargar (0 bien, 2 error)
	cp 002h		;8e96
	jp z,L_8BC5		;8e98
	call 04e98h		;8e9b   ; pantalla en negro: quita sprites, borra la pagina y apaga la pantalla
	xor a			;8e9e
	ld (0e25bh),a		;8e9f   ; guarda el paso dentro del menu del editor
	ret			;8ea2
L_8EA3:
	ld a,(0f0f8h)		;8ea3   ; carga de donde diga 0xF0F8: cinta (0xBE7E), disco (p02:9B98) o Game Master 2 (p01:6C55)
	or a			;8ea6
	jr z,L_8EB0		;8ea7
	dec a			;8ea9
	jp z,L_9B98		;8eaa
	jp 06c55h		;8ead
L_8EB0:
	call 041b5h		;8eb0   ; pone el banco 12 en 0xA000
	call 0be7eh		;8eb3   ; TAPION: la cabecera de la cinta
	jp 0418ah		;8eb6
L_8EB9:
	ld a,(0e207h)		;8eb9   ; tras el error, una tecla vuelve
	and a			;8ebc
	ret z			;8ebd
	ld a,002h		;8ebe
	ld (0e27eh),a		;8ec0
	call 04e98h		;8ec3   ; pantalla en negro: quita sprites, borra la pagina y apaga la pantalla
	xor a			;8ec6
	ld (0e25bh),a		;8ec7   ; guarda el paso dentro del menu del editor
	ret			;8eca
L_8ECB:
	call 067ech		;8ecb   ; la opcion 2 del menu de empezar: cargar una fase hecha con el editor
	call 05d41h		;8ece   ; los atributos de los sprites (0xE800, 0x80 bytes) a 0xE0: fuera de la pantalla
	xor a			;8ed1
	ld (0e24ah),a		;8ed2   ; guarda lo elegido en el menu
	inc a			;8ed5
	ld (0e25bh),a		;8ed6   ; guarda el paso dentro del menu del editor
	ret			;8ed9
L_8EDA:
	ld a,(0e25bh)		;8eda   ; un cuadro de cargar la fase del editor, por pasos (0xE25B)
	dec a			;8edd
	call 04099h		;8ede   ; el despachador de Konami: la tabla va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_8EE1: 8 destinos del despachador p00:4099 (call en p02:8EDE, el
;   indice en A): 8EF1, 8C52, 8C95, 8D87, 8F37, 8F3D, 8F64, 8DF8; lo leen
;   p02:8EDE (16 bytes)
;   0x8ee1..0x8ef1  (16 bytes)
DATA_tabla_8EE1:
	defw 08ef1h,08c52h,08c95h,08d87h,08f37h,08f3dh,08f64h,08df8h	; 8ee1

; ======================================================================
; CODIGO 0x8ef1..0x9292  (929 bytes)
; ======================================================================


L_8EF1:
	ld a,001h		;8ef1   ; los graficos de la piramide 1 y su paleta (en MSX2)
	ld (0e241h),a		;8ef3   ; guarda la piramide (1-6)
	call 05634h		;8ef6   ; carga los graficos de la piramide (bancos 7-8-9)
	ld a,(0f0f4h)		;8ef9   ; lee la marca de MSX2 (1 en el cartucho de MSX2, 0 en el de MSX1)
	and a			;8efc
	call nz,0565eh		;8efd   ; la paleta de la piramide: dos por piramide segun la fase (tablas 0xB97A y 0xB9F8)
	call 07aa6h		;8f00   ; las rachas de 0xBBFC a 0xF880 (banco 13)
	call L_8F0C		;8f03   ; borra los puntos y 0xE280-0xEFFF
	call 07969h		;8f06   ; el nombre (0xE270, 12 bytes) en blanco
	jp L_8BE7		;8f09
L_8F0C:
	xor a			;8f0c   ; borra los puntos y 0xE280-0xEFFF
	ld hl,0e226h		;8f0d   ; apunta a los puntos (3 bytes BCD)
	ld de,0e227h		;8f10
	ld bc,00032h		;8f13
	ld (hl),a			;8f16
	ldir		;8f17
	ld hl,0e280h		;8f19   ; apunta a el estado del personaje
	ld de,0e281h		;8f1c   ; apunta a la y del personaje (16 bits: 0xE281 la parte fina)
	ld bc,00d7fh		;8f1f
	ld (hl),a			;8f22
	ldir		;8f23
	ld (0e26dh),a		;8f25
	ld (0e26eh),a		;8f28
	ld (0e27fh),a		;8f2b   ; guarda el resultado de grabar o cargar (0 bien, 2 error)
	ld (0e26fh),a		;8f2e
	ld (0e27eh),a		;8f31
	jp 05d41h		;8f34
L_8F37:
	call L_8F72		;8f37   ; prepara la partida y el paso siguiente
	jp L_8BC5		;8f3a
L_8F3D:
	call L_8EA3		;8f3d   ; carga; si ha ido bien, prepara la fase y a jugar (0xE254 = 1)
	ld a,(0e27fh)		;8f40   ; lee el resultado de grabar o cargar (0 bien, 2 error)
	and a			;8f43
	jp nz,L_8BC5		;8f44
	call 05de6h		;8f47   ; 0xE244 = la casilla de la pantalla 0xE243
	call L_92CA		;8f4a   ; el personaje a punto: 8 bytes de 0x92F7 a 0xE28A, mirando a la derecha
	call L_921A		;8f4d   ; la lista 0xEE50: el numero (desde 1) de cada cosa de 0xE300 que hay, y un 0
	call L_878B		;8f50   ; marca en el mapa las 16 columnas de 0xE7C0
	ld a,001h		;8f53
	ld (0e24ah),a		;8f55   ; guarda lo elegido en el menu
	ld (0e254h),a		;8f58   ; guarda la marca de partida del editor
	ld a,(0e282h)		;8f5b   ; sin y del personaje, 0xE294 = 0
	or a			;8f5e
	ret nz			;8f5f
	ld (0e294h),a		;8f60   ; guarda hacia que lado mira el personaje (0 izquierda, 1 derecha)
	ret			;8f63
L_8F64:
	ld a,(0e207h)		;8f64   ; tras el error, una tecla vuelve
	and a			;8f67
	ret z			;8f68
	call 04e98h		;8f69   ; pantalla en negro: quita sprites, borra la pagina y apaga la pantalla
	ld a,002h		;8f6c
	ld (0e24ah),a		;8f6e   ; guarda lo elegido en el menu
	ret			;8f71
L_8F72:
	call 05696h		;8f72   ; los sprites, el personaje y la RAM de la fase a cero, en la piramide 1
	call 0594fh		;8f75   ; las rachas de 0x97A1 a 0xF880
	call 058d2h		;8f78   ; los dibujos de los sprites del personaje, con los bancos 14-15
	xor a			;8f7b
	ld hl,0e2c0h		;8f7c   ; apunta a los sitios de los que salen los enemigos (8 x 5 bytes)
	ld de,0e2c1h		;8f7f
	ld bc,00d3fh		;8f82
	ld (hl),a			;8f85
	ldir		;8f86
	ld (0e287h),a		;8f88   ; guarda la postura del personaje
	ld (0edcdh),a		;8f8b
	inc a			;8f8e
	ld (0e241h),a		;8f8f   ; guarda la piramide (1-6)
	call 05d41h		;8f92   ; los atributos de los sprites (0xE800, 0x80 bytes) a 0xE0: fuera de la pantalla
	ret			;8f95
L_8F96:
	call 041bfh		;8f96   ; la salida de la fase: 3 bytes de la tabla 0xB8F8 (banco 13) a 0xE2F1-0xE2F3
	ld a,(0e242h)		;8f99   ; lee la fase (1-60)
	ld b,a			;8f9c
	add a,a			;8f9d
	add a,b			;8f9e
	ld hl,0b8f8h		;8f9f
	call 0408fh		;8fa2   ; suma A a HL (HL = HL + A)
	ld de,0e2f1h		;8fa5   ; la y y la x...
	ldi		;8fa8
	ldi		;8faa
	ld a,(hl)			;8fac   ; ...y la pantalla en los 3 bits altos
	rlca			;8fad
	rlca			;8fae
	rlca			;8faf
	and 007h		;8fb0
	ld (de),a			;8fb2
	inc de			;8fb3
	inc de			;8fb4
	inc de			;8fb5
	xor a			;8fb6
	ld (de),a			;8fb7
	call 0418ah		;8fb8   ; pone los bancos 1-2-3 (el juego)
	jp 07d86h		;8fbb   ; y lo que hay que coger
L_8FBE:
	ld hl,0e2f3h		;8fbe   ; el personaje en la salida: si esta en su pantalla y no queda nada por coger (0xE2F5)...
	ld a,(0e243h)		;8fc1   ; lee la pantalla de la fase (desde 1)
	cp (hl)			;8fc4
	ret nz			;8fc5
	ld a,(0e2f5h)		;8fc6   ; lee cuantas cosas de 2 x 2 quedan por coger (con 0 se abre la salida)
	and a			;8fc9
	ret nz			;8fca
	ld a,(0e282h)		;8fcb   ; ...y esta a menos de 4 pixeles en y y en x
	ld b,a			;8fce
	ld a,(0e284h)		;8fcf   ; lee la x del personaje
	ld c,a			;8fd2
	ld a,(0e2f1h)		;8fd3   ; lee la salida de la fase: y, x y pantalla (0xE2F3)
	add a,012h		;8fd6
	sub b			;8fd8
	cp 004h		;8fd9
	ret nc			;8fdb
	ld a,(0e2f2h)		;8fdc
	add a,00ah		;8fdf
	sub c			;8fe1
	cp 004h		;8fe2
	ret nc			;8fe4
	call L_907F		;8fe5   ; se acaba la fase
	xor a			;8fe8
	ld (0e2f0h),a		;8fe9
	ld hl,0e257h		;8fec   ; apunta a el paso de la secuencia en curso (entrada, fase o piramide acabada)
	ld (hl),a			;8fef
	inc hl			;8ff0
	ld (hl),a			;8ff1
	inc hl			;8ff2
	ld (hl),a			;8ff3
	inc a			;8ff4
	ld (0e249h),a		;8ff5   ; guarda la marca de salida de la fase
	ld hl,0e2f7h		;8ff8
	ld (hl),01eh		;8ffb
	call 0428ah		;8ffd   ; el sonido 0x23
	call 05687h		;9000   ; los dibujos de los sprites, el borde sin parpadeo y el personaje de la secuencia
	xor a			;9003
	ld (0e21bh),a		;9004   ; guarda la cuenta del borde que parpadea
	call 0723dh		;9007   ; sus cuatro sprites con el dibujo que toca
	ld bc,00007h		;900a
	jp 00047h		;900d   ; BIOS WRTVDP - Writes data in the VDP-register
L_9010:
	ld a,(0e2f3h)		;9010   ; pinta la salida si es de esta pantalla: 4 x 4 caracteres de 0x9340 + 16 x 0xE2F6
	ld b,a			;9013
	ld a,(0e243h)		;9014   ; lee la pantalla de la fase (desde 1)
	cp b			;9017
	ret nz			;9018
	ld hl,09340h		;9019
	ld a,(0e2f6h)		;901c
	add a,a			;901f
	add a,a			;9020
	add a,a			;9021
	add a,a			;9022
	call 0408fh		;9023   ; suma A a HL (HL = HL + A)
	ld bc,00404h		;9026
	ld de,(0e2f1h)		;9029   ; lee la salida de la fase: y, x y pantalla (0xE2F3) y el byte siguiente (16 bits)
L_902D:
	push bc			;902d   ; cuatro filas de cuatro
	push de			;902e
	ld b,c			;902f
L_9030:
	ld a,(hl)			;9030
	push hl			;9031
	call 05767h		;9032   ; pinta el caracter A sin su color 0 (p00:5219)
	pop hl			;9035
	inc hl			;9036
	ld a,d			;9037
	add a,008h		;9038
	ld d,a			;903a
	djnz L_9030		;903b
	pop de			;903d
	pop bc			;903e
	ld a,e			;903f
	add a,008h		;9040
	ld e,a			;9042
	djnz L_902D		;9043
	ld de,(0e2f4h)		;9045   ; 0xE2F5: lo que queda por coger; 0xE2F4 cuantas habia
	ld a,d			;9049
	and a			;904a
	ret z			;904b
	call 041bfh		;904c   ; las marcas de lo que falta (tabla 0xB9AD del banco 13)
	ld a,e			;904f
	ld hl,0b9adh		;9050
	call 04d4ch		;9053   ; HL = la palabra A de la tabla de HL
	ld b,d			;9056
L_9057:
	ld de,(0e2f1h)		;9057   ; cada una: su sitio dentro de la salida (2 bits de x, 2 de y)
	ld a,(hl)			;905b
	and 003h		;905c
	add a,a			;905e
	add a,a			;905f
	add a,a			;9060
	add a,d			;9061
	ld d,a			;9062
	ld a,(hl)			;9063
	and 00ch		;9064
	add a,a			;9066
	add a,e			;9067
	ld e,a			;9068
	ld a,(0f0f4h)		;9069   ; el caracter: 0xAE en MSX2, 0x60 en MSX1
	and a			;906c
	ld a,060h		;906d
	jr z,L_9073		;906f
	ld a,0aeh		;9071
L_9073:
	push hl			;9073
	call 05767h		;9074   ; pinta el caracter A sin su color 0 (p00:5219)
	pop hl			;9077
	inc hl			;9078
	djnz L_9057		;9079
	call 0418ah		;907b   ; pone los bancos 1-2-3 (el juego)
	ret			;907e
L_907F:
	ld hl,0e500h		;907f   ; al salir de la fase: los enemigos y las cosas de 0xE300 a cero, sin sprites
	ld de,0e501h		;9082
	ld bc,000ffh		;9085
	ld (hl),000h		;9088
	ldir		;908a
	ld hl,0e300h		;908c   ; apunta a las cosas que se cogen y se llevan (64 x 8 bytes)
	ld de,0e301h		;908f
	ld bc,001ffh		;9092
	ld (hl),000h		;9095
	ldir		;9097
	call 05d41h		;9099   ; los atributos de los sprites (0xE800, 0x80 bytes) a 0xE0: fuera de la pantalla
	jp 04ecbh		;909c
L_909F:
	push ix		;909f   ; repinta lo que se lleva y lo que se suelta en la pantalla
	call L_90AB		;90a1   ; las cosas de la lista 0xEE50 (por numero): lo que habia debajo se devuelve
	pop ix		;90a4
	call L_924A		;90a6   ; pasa la cosa de IX al final de la lista
	jr L_90F7		;90a9
L_90AB:
	ld hl,0ee50h		;90ab   ; las cosas de la lista 0xEE50 (por numero): lo que habia debajo se devuelve
	ld b,040h		;90ae
L_90B0:
	ld a,(hl)			;90b0
	or a			;90b1
	ret z			;90b2
	call L_927D		;90b3   ; IX = la cosa A de 0xE300 (desde 1)
	ld a,(ix+000h)		;90b6
	or a			;90b9
	jr z,L_90D6		;90ba
	and 0f0h		;90bc
	jr z,L_90C7		;90be
	cp 0f0h		;90c0
	jr nz,L_90D6		;90c2
	call L_90DA		;90c4   ; quita la marca de llevarla (cifra alta 0xF)
L_90C7:
	ld a,(0e243h)		;90c7   ; lee la pantalla de la fase (desde 1)
	cp (ix+003h)		;90ca
	jr nz,L_90D6		;90cd
	push hl			;90cf
	push bc			;90d0
	call L_90E3		;90d1   ; copia de la pagina 1 el fondo guardado de la cosa (16 x 16)
	pop bc			;90d4
	pop hl			;90d5
L_90D6:
	inc hl			;90d6
	djnz L_90B0		;90d7
	ret			;90d9
L_90DA:
	ld a,(ix+000h)		;90da   ; quita la marca de llevarla (cifra alta 0xF)
	and 01fh		;90dd
	ld (ix+000h),a		;90df
	ret			;90e2
L_90E3:
	ld l,(ix+004h)		;90e3   ; copia de la pagina 1 el fondo guardado de la cosa (16 x 16)
	ld h,(ix+005h)		;90e6
	ld e,(ix+001h)		;90e9
	ld d,(ix+002h)		;90ec
	ld bc,01010h		;90ef
	ld a,001h		;90f2
	jp 05029h		;90f4
L_90F7:
	ld hl,0ee8fh		;90f7   ; las de la lista, al reves: guarda el fondo y pinta la cosa
	ld b,040h		;90fa
L_90FC:
	ld a,(hl)			;90fc
	or a			;90fd
	jr z,L_9112		;90fe
	call L_927D		;9100   ; IX = la cosa A de 0xE300 (desde 1)
	ld a,(0e243h)		;9103   ; lee la pantalla de la fase (desde 1)
	cp (ix+003h)		;9106
	jr nz,L_9112		;9109
	push bc			;910b
	push hl			;910c
	call L_9116		;910d   ; una cosa de 0xE300 en el suelo: guarda su fondo y la pinta (0x9328 + 4 x (tipo - 1))
	pop hl			;9110
	pop bc			;9111
L_9112:
	dec hl			;9112
	djnz L_90FC		;9113
	ret			;9115
L_9116:
	ld a,(ix+000h)		;9116   ; una cosa de 0xE300 en el suelo: guarda su fondo y la pinta (0x9328 + 4 x (tipo - 1))
	or a			;9119
	ret z			;911a
	and 0f0h		;911b
	ret nz			;911d
	call L_913A		;911e   ; guarda en la pagina 1 los 16 x 16 pixeles de debajo de la cosa
	ld hl,09328h		;9121
	ld a,(ix+000h)		;9124   ; lee el estado (cifra alta) y el tipo (cifra baja) de la cosa
	dec a			;9127
	add a,a			;9128
	add a,a			;9129
	ld e,a			;912a
	ld d,000h		;912b
	add hl,de			;912d
	ld e,(ix+001h)		;912e   ; lee la y de la cosa
	ld d,(ix+002h)		;9131   ; lee la x de la cosa
	ld bc,00202h		;9134
	jp 0573bh		;9137
L_913A:
	call L_9151		;913a   ; guarda en la pagina 1 los 16 x 16 pixeles de debajo de la cosa
	ld (ix+004h),e		;913d   ; guarda el dibujo de la cosa en vuelo
	ld (ix+005h),d		;9140   ; guarda el paso de la velocidad de la cosa
	ld l,(ix+001h)		;9143   ; lee la y de la cosa
	ld h,(ix+002h)		;9146   ; lee la x de la cosa
	ld bc,01010h		;9149
	ld a,004h		;914c
	jp 05029h		;914e
L_9151:
	push ix		;9151   ; D, E = donde se guarda el fondo de la cosa de IX en la pagina 1
	pop hl			;9153
	ld de,0e300h		;9154   ; la ficha de la cosa en 0xE300
	and a			;9157
	sbc hl,de		;9158
	ld a,l			;915a   ; la columna: (numero / 32) x 16 + 0x60
	rla			;915b
	ld a,h			;915c
	rla			;915d
	rla			;915e
	rla			;915f
	rla			;9160
	rla			;9161
	and 030h		;9162
	add a,060h		;9164
	ld e,a			;9166
	ld a,l			;9167   ; y la fila: (numero x 8) & 0xF8
	rla			;9168
	and 0f8h		;9169
	ld d,a			;916b
	ret			;916c
L_916D:
	call L_9196		;916d   ; los sprites de las cosas de 0xE300 que brillan (tipo 2 o mas, estado < 3)
	ld hl,0e300h		;9170   ; apunta a las cosas que se cogen y se llevan (64 x 8 bytes)
	ld de,0e810h		;9173
	ld b,040h		;9176
L_9178:
	push bc			;9178   ; cada cosa de 0xE300
	push hl			;9179
	ld a,(hl)			;917a
	and 00fh		;917b
	cp 003h		;917d   ; si no esta en el suelo (estado 3 o mas), no
	jr nc,L_918D		;917f
	ld a,(hl)			;9181
	rra			;9182
	rra			;9183
	rra			;9184
	rra			;9185
	and 00fh		;9186   ; tipo 2 o mas: brilla
	cp 002h		;9188
	call nc,L_91A4		;918a   ; uno, y el siguiente sprite
L_918D:
	pop hl			;918d   ; la siguiente (8 bytes)
	ld bc,00008h		;918e
	add hl,bc			;9191
	pop bc			;9192
	djnz L_9178		;9193
	ret			;9195
L_9196:
	ld b,00ch		;9196   ; 12 sprites fuera de la pantalla
	ld hl,0e810h		;9198
L_919B:
	ld (hl),0e0h		;919b
	ld de,00004h		;919d
	add hl,de			;91a0
	djnz L_919B		;91a1
	ret			;91a3
L_91A4:
	push de			;91a4   ; uno, y el siguiente sprite
	call L_91B2		;91a5   ; el sprite de la cosa: su sitio y su dibujo (tabla 0x9296), si es de esta pantalla
	pop de			;91a8
	inc e			;91a9
	inc e			;91aa
	inc e			;91ab
	inc e			;91ac
	inc e			;91ad
	inc e			;91ae
	inc e			;91af
	inc e			;91b0
	ret			;91b1
L_91B2:
	ld a,(hl)			;91b2   ; el sprite de la cosa: su sitio y su dibujo (tabla 0x9296), si es de esta pantalla
	ex af,af'			;91b3
	ld a,(0e243h)		;91b4   ; lee la pantalla de la fase (desde 1)
	inc l			;91b7
	ldi		;91b8
	ldi		;91ba
	cp (hl)			;91bc
	jr nz,L_9214		;91bd
	inc l			;91bf
	ld a,(hl)			;91c0
	ld hl,09296h		;91c1
	call 0408fh		;91c4   ; suma A a HL (HL = HL + A)
	ldi		;91c7
	push de			;91c9
	dec e			;91ca
	ld a,(de)			;91cb
	ld c,a			;91cc
	dec e			;91cd
	ld a,(de)			;91ce
	ld b,a			;91cf
	dec e			;91d0
	ld a,(de)			;91d1
	pop hl			;91d2
	push de			;91d3
	inc l			;91d4
	ld (hl),a			;91d5
	inc l			;91d6
	ld (hl),b			;91d7
	inc l			;91d8
	ld a,c			;91d9
	add a,004h		;91da
	ld (hl),a			;91dc
	ex af,af'			;91dd   ; su color, de la tabla 0x9292 por el tipo
	and 00fh		;91de
	dec a			;91e0
	add a,a			;91e1
	ld hl,09292h		;91e2
	call 0408fh		;91e5   ; suma A a HL (HL = HL + A)
	ld a,(hl)			;91e8
	inc hl			;91e9
	ld d,(hl)			;91ea
	exx			;91eb
	pop hl			;91ec
	push af			;91ed
	ld de,01800h		;91ee
	add hl,de			;91f1
	ld a,l			;91f2
	rla			;91f3
	rla			;91f4
	and 0f0h		;91f5
	ld hl,0d200h		;91f7   ; apunta a los colores de los sprites (16 bytes por sprite)
	call 0408fh		;91fa   ; suma A a HL (HL = HL + A)
	pop af			;91fd
	ld d,h			;91fe
	ld e,l			;91ff
	inc de			;9200
	ld bc,0000fh		;9201
	ld (hl),a			;9204
	ldir		;9205
	exx			;9207
	ld a,d			;9208
	exx			;9209
	inc hl			;920a
	inc de			;920b
	ld bc,0000fh		;920c
	ld (hl),a			;920f
	ldir		;9210
	exx			;9212
	ret			;9213
L_9214:
	dec de			;9214   ; de otra pantalla: fuera
	dec de			;9215
	ld a,0e0h		;9216
	ld (de),a			;9218
	ret			;9219
L_921A:
	ld ix,0e300h		;921a   ; la lista 0xEE50: el numero (desde 1) de cada cosa de 0xE300 que hay, y un 0
	ld hl,0ee50h		;921e   ; apunta a la lista de las cosas de 0xE300 por orden de pintado
	ld bc,04001h		;9221
	ld de,00008h		;9224
L_9227:
	ld a,(ix+000h)		;9227   ; lee el estado (cifra alta) y el tipo (cifra baja) de la cosa
	or a			;922a
	jr z,L_922F		;922b
	ld (hl),c			;922d
	inc hl			;922e
L_922F:
	inc c			;922f
	add ix,de		;9230
	djnz L_9227		;9232
	ld (hl),000h		;9234
	ret			;9236
L_9237:
	call L_925E		;9237   ; pasa la cosa de IX al principio de la lista
	ld a,c			;923a
	or a			;923b
	ret z			;923c
	ld b,000h		;923d
	ld d,h			;923f
	ld e,l			;9240
	ld a,(hl)			;9241
	dec hl			;9242
	lddr		;9243
	ld hl,0ee50h		;9245   ; apunta a la lista de las cosas de 0xE300 por orden de pintado
	ld (hl),a			;9248
	ret			;9249
L_924A:
	call L_925E		;924a   ; pasa la cosa de IX al final de la lista
	ld d,h			;924d
	ld e,l			;924e
	ld b,(hl)			;924f
	inc hl			;9250
	ld a,(hl)			;9251
	or a			;9252
	ret z			;9253
	push bc			;9254
L_9255:
	ldi		;9255   ; corre la lista una entrada
	ld a,(hl)			;9257
	or a			;9258
	jr nz,L_9255		;9259
	pop af			;925b   ; y la cosa al final
	ld (de),a			;925c
	ret			;925d
L_925E:
	push ix		;925e   ; HL = la entrada de la cosa de IX en la lista 0xEE50, C = su sitio
	pop hl			;9260
	ld de,0e300h		;9261   ; apunta a las cosas que se cogen y se llevan (64 x 8 bytes)
	and a			;9264
	sbc hl,de		;9265
	ld a,l			;9267
	rr h		;9268
	rra			;926a
	rr h		;926b
	rra			;926d
	rr h		;926e
	rra			;9270
	inc a			;9271
	ld c,000h		;9272
	ld hl,0ee50h		;9274   ; apunta a la lista de las cosas de 0xE300 por orden de pintado
L_9277:
	cp (hl)			;9277
	ret z			;9278
	inc hl			;9279
	inc c			;927a
	jr L_9277		;927b
L_927D:
	push hl			;927d   ; IX = la cosa A de 0xE300 (desde 1)
	call L_9283		;927e   ; su numero - 1...
	pop hl			;9281
	ret			;9282
L_9283:
	dec a			;9283   ; su numero - 1...
	ld l,a			;9284
	ld h,000h		;9285
	add hl,hl			;9287   ; ...x 8
	add hl,hl			;9288
	add hl,hl			;9289
	ld de,0e300h		;928a   ; apunta a las cosas que se cogen y se llevan (64 x 8 bytes)
	add hl,de			;928d
	push hl			;928e
	pop ix		;928f
	ret			;9291

; ----------------------------------------------------------------------
; DATOS resto_9292: lo apuntan con el banco puesto p02:91E2 (0x9292), p02:91C1
;   (0x9296); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p02:91E2, p02:91C1 (11 bytes)
;   0x9292..0x929d  (11 bytes)
DATA_resto_9292:
	defb 00bh,047h,007h,04ah,010h,018h,020h,028h,030h,038h,040h	; 9292  .G.J.. (08@

; ======================================================================
; CODIGO 0x929d..0x92f7  (90 bytes)
; ======================================================================


L_929D:
	ld hl,0e280h		;929d   ; el personaje al empezar la fase: la tabla 0xB844 (banco 13), 3 bytes por fase
	ld de,0e281h		;92a0   ; 0xE280-0xE2C0 a cero
	ld (hl),000h		;92a3
	ld bc,00040h		;92a5
	ldir		;92a8
	call 041bfh		;92aa   ; pone el banco 13 en 0xA000
	ld a,(0e242h)		;92ad   ; lee la fase (1-60)
	ld b,a			;92b0
	add a,a			;92b1
	add a,b			;92b2
	ld hl,0b844h		;92b3
	call 0408fh		;92b6   ; suma A a HL (HL = HL + A)
	ld a,(hl)			;92b9   ; la y, la x y la pantalla
	ld (0e282h),a		;92ba   ; guarda la y del personaje
	inc hl			;92bd
	ld a,(hl)			;92be
	ld (0e284h),a		;92bf   ; guarda la x del personaje
	inc hl			;92c2
	ld a,(hl)			;92c3
	ld (0e243h),a		;92c4   ; guarda la pantalla de la fase (desde 1)
	call 0418ah		;92c7   ; pone los bancos 1-2-3 (el juego)
L_92CA:
	ld hl,092f7h		;92ca   ; el personaje a punto: 8 bytes de 0x92F7 a 0xE28A, mirando a la derecha
	ld de,0e28ah		;92cd   ; apunta a la velocidad al subir la escalera (16 bits)
	ld bc,00008h		;92d0
	ldir		;92d3
	ld a,004h		;92d5
	ld (0e296h),a		;92d7   ; guarda la cuenta de cuadros del paso de la animacion
	ld a,001h		;92da
	ld (0e285h),a		;92dc   ; guarda el dibujo del personaje (direccion y paso)
	ld a,(0e202h)		;92df   ; si no se pueden sumar puntos (bit 6 de 0xE202), estado 0x0E; si no, 0
	and 040h		;92e2
	ld a,00eh		;92e4
	jr nz,L_92E9		;92e6
	xor a			;92e8
L_92E9:
	ld (0e280h),a		;92e9   ; guarda el estado del personaje
	ld a,020h		;92ec   ; 0xE2A8 = 0x20, 0xE2A4 = 6
	ld (0e2a8h),a		;92ee   ; guarda la cuenta del parpadeo al aparecer
	ld a,006h		;92f1
	ld (0e2a4h),a		;92f3   ; guarda los cuadros desde que aparece (los 6 primeros sin teclas)
	ret			;92f6

; ----------------------------------------------------------------------
; DATOS resto_92F7: lo apuntan con el banco puesto p02:92CA (0x92F7); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p02:92CA (8 bytes)
;   0x92f7..0x92ff  (8 bytes)
DATA_resto_92F7:
	defb 000h,0feh,000h,002h,000h,0feh,000h,002h	; 92f7  ........

; ======================================================================
; CODIGO 0x92ff..0x9324  (37 bytes)
; ======================================================================


L_92FF:
	xor a			;92ff   ; el personaje muere (0xE298 = 1)
	ld (0e295h),a		;9300   ; guarda el paso de la animacion del personaje
	ld (0e285h),a		;9303   ; guarda el dibujo del personaje (direccion y paso)
	ld a,(0e280h)		;9306   ; con el estado 4, mira hacia 4
	cp 004h		;9309
	jr nz,L_9312		;930b
	ld a,004h		;930d
	ld (0e285h),a		;930f   ; guarda el dibujo del personaje (direccion y paso)
L_9312:
	ld a,001h		;9312
	ld (0e298h),a		;9314   ; guarda la marca de personaje muerto
	ld hl,0e215h		;9317   ; sin cuenta de la musica
	ld (hl),000h		;931a
	ld a,003h		;931c   ; 0xE296 = 3 y los dibujos de muerto
	ld (0e296h),a		;931e   ; guarda la cuenta de cuadros del paso de la animacion
	jp 05928h		;9321

; ----------------------------------------------------------------------
; DATOS resto_9324: lo apuntan con el banco puesto p01:653D (0x9324), p02:85BA
;   (0x9324), p02:8537 (0x9328), p02:9121 (0x9328), p01:7DD9 (0x9340),
;   p02:8601 (0x9340); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p01:653D, p02:85BA, p02:8537, p02:9121, p01:7DD9,
;   p02:8601 (154 bytes)
;   0x9324..0x93be  (154 bytes)
DATA_resto_9324:
	defb 0afh,0b0h,0b1h,080h,081h,082h,0bch,0bdh,000h,000h,089h,08ah,086h,087h,0b8h,088h	; 9324  ................
	defb 0b9h,0bbh,0bah,083h,0b4h,0b5h,0b6h,084h,0b2h,0b3h,0b7h,085h,063h,064h,065h,066h	; 9334  ............cdef
	defb 067h,068h,069h,06ah,06bh,06ch,06dh,06eh,06fh,070h,071h,072h,064h,058h,059h,065h	; 9344  ghijklmnopqrdXYe
	defb 068h,05ah,05bh,069h,06ch,05ch,05dh,06dh,070h,078h,078h,071h,073h,058h,059h,074h	; 9354  hZ[il\]mpxxqsXYt
	defb 075h,05ah,05bh,076h,075h,05ch,05dh,076h,077h,078h,078h,079h,05fh,060h,061h,062h	; 9364  uZ[vu\]vwxxy_`ab
	defb 08bh,08ch,08dh,08eh,092h,091h,090h,08fh,0beh,000h,095h,0c1h,07ah,07bh,095h,0c1h	; 9374  ............z{..
	defb 0bfh,000h,096h,0c1h,07ch,07dh,096h,0c1h,0c0h,000h,097h,0c3h,07eh,07fh,097h,0c3h	; 9384  ....|}......~...
	defb 000h,0c4h,0c7h,098h,07ah,07bh,0c7h,098h,000h,0c5h,0c8h,099h,07ch,07dh,0c8h,099h	; 9394  ....z{......|}..
	defb 000h,0c6h,0c9h,09ah,07eh,07fh,0c9h,09ah,09bh,09ch,09dh,09eh,09fh,0a0h,0a1h,0a2h	; 93a4  ....~...........
	defb 0a3h,0a4h,0a5h,0a6h,0a7h,0a8h,0a9h,0aah,0abh,0ach	; 93b4  ..........

; ======================================================================
; CODIGO 0x93be..0x93f9  (59 bytes)
; ======================================================================


L_93BE:
	ld a,(0e2f9h)		;93be   ; al entrar en la pantalla por un lado: los bloques del borde se apartan
	cp 003h		;93c1
	ret c			;93c3
	ld ix,0e600h		;93c4   ; apunta a las cosas de la fase (16 x 16 bytes)
	ld b,010h		;93c8
L_93CA:
	push bc			;93ca
	ld a,(ix+000h)		;93cb   ; lee el tipo de la cosa (0: libre)
	cp 005h		;93ce
	call z,L_93DC		;93d0   ; un bloque pegado al borde se corre a 0x10 o a 0xE0
	ld bc,00010h		;93d3
	add ix,bc		;93d6
	pop bc			;93d8
	djnz L_93CA		;93d9
	ret			;93db
L_93DC:
	ld a,(ix+003h)		;93dc   ; un bloque pegado al borde se corre a 0x10 o a 0xE0
	cp 010h		;93df
	jr nc,L_93E9		;93e1
	ld (ix+003h),010h		;93e3   ; la x de la cosa = 0x10
	jr L_93F0		;93e7
L_93E9:
	cp 0e8h		;93e9
	ret c			;93eb
	ld (ix+003h),0e0h		;93ec   ; la x de la cosa = 0xE0
L_93F0:
	jp L_95A1		;93f0
L_93F3:
	ld a,(ix+001h)		;93f3   ; un cuadro de un bloque que se empuja (tipo 5 de 0xE600), por pasos (IX+01)
	call 04099h		;93f6   ; el despachador de Konami: la tabla va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_93F9: 3 destinos del despachador p00:4099 (call en p02:93F6, el
;   indice en A): 93FF, 9469, 94FF; lo leen p02:93F6 (6 bytes)
;   0x93f9..0x93ff  (6 bytes)
DATA_tabla_93F9:
	defw 093ffh,09469h,094ffh	; 93f9  -> L_93FF L_9469 L_94FF

; ======================================================================
; CODIGO 0x93ff..0x9585  (390 bytes)
; ======================================================================


L_93FF:
	call L_9549		;93ff   ; paso 0: si no tiene suelo, cae (paso 2)
	jr nc,L_940E		;9402
	ld a,002h		;9404
	ld (ix+001h),a		;9406   ; guarda el paso de la cosa
	dec a			;9409
	ld (ix+006h),a		;940a   ; guarda la cuenta de la cosa
	ret			;940d
L_940E:
	ld a,(0e243h)		;940e   ; si el personaje esta a su altura y pegado...
	cp (ix+004h)		;9411   ; compara con la pantalla de la cosa
	ret nz			;9414
	ld a,(0e280h)		;9415   ; lee el estado del personaje
	and a			;9418
	ret nz			;9419
	ld a,(0e282h)		;941a   ; lee la y del personaje
	add a,00fh		;941d
	sub (ix+002h)		;941f   ; le resta la y de la cosa
	cp 010h		;9422
	jr nc,L_9464		;9424
	ld a,(0e294h)		;9426   ; lee hacia que lado mira el personaje (0 izquierda, 1 derecha)
	and a			;9429
	ld a,(0e284h)		;942a   ; ...por la izquierda empujando a la derecha...
	ld b,(ix+003h)		;942d   ; lee la x de la cosa
	jr z,L_944C		;9430
	add a,014h		;9432
	sub b			;9434
	cp 008h		;9435
	jr nc,L_9464		;9437
	ld a,(0e208h)		;9439   ; lee el mando: lo pulsado
	and 008h		;943c
	jr z,L_9464		;943e
	dec (ix+006h)		;9440   ; baja la cuenta de la cosa
	ret nz			;9443
	res 1,(ix+007h)		;9444   ; pone a cero el bit 1 de las marcas de la cosa (bit 0 repintar, bit 1 su lado)
L_9448:
	inc (ix+001h)		;9448   ; sube el paso de la cosa
	ret			;944b
L_944C:
	sub 00ch		;944c   ; ...o por la derecha empujando a la izquierda
	sub b			;944e
	cp 008h		;944f
	jr nc,L_9464		;9451
	ld a,(0e208h)		;9453   ; lee el mando: lo pulsado
	and 004h		;9456
	jr z,L_9464		;9458
	dec (ix+006h)		;945a   ; baja la cuenta de la cosa
	ret nz			;945d
	set 1,(ix+007h)		;945e   ; pone a uno el bit 1 de las marcas de la cosa (bit 0 repintar, bit 1 su lado)
	jr L_9448		;9462
L_9464:
	ld (ix+006h),00ah		;9464   ; si no, la cuenta vuelve a 10
	ret			;9468
L_9469:
	bit 1,(ix+007h)		;9469   ; paso 1: se mueve 8 pixeles si cabe, con el sonido 0x24
	ld bc,00002h		;946d
	jr nz,L_9475		;9470
	ld bc,0f003h		;9472
L_9475:
	ld a,(ix+003h)		;9475   ; lee la x de la cosa
	cp b			;9478
	jr z,L_94B3		;9479
	call L_9543		;947b   ; NC si la casilla de al lado del bloque esta libre
	jr nc,L_94AD		;947e
	bit 1,(ix+007h)		;9480   ; mira el bit 1 de las marcas de la cosa (bit 0 repintar, bit 1 su lado)
	ld a,(ix+003h)		;9484   ; lee la x de la cosa
	ld (ix+00bh),a		;9487
	jr nz,L_9490		;948a
	add a,008h		;948c
	jr L_9492		;948e
L_9490:
	sub 008h		;9490
L_9492:
	ld (ix+003h),a		;9492   ; guarda la x de la cosa
	set 0,(ix+007h)		;9495   ; pone a uno el bit 0 de las marcas de la cosa (bit 0 repintar, bit 1 su lado)
	call 0428fh		;9499   ; pide el sonido 0x24
	ld l,(ix+002h)		;949c   ; lee la y de la cosa
	ld (ix+00ah),l		;949f   ; guarda la marca de personaje encima
	call L_9549		;94a2   ; sin suelo debajo: cae
	jr nc,L_94AD		;94a5
	ld (ix+006h),001h		;94a7   ; la cuenta de la cosa = 0x01
	jr L_9448		;94ab
L_94AD:
	xor a			;94ad
	ld (ix+001h),a		;94ae   ; guarda el paso de la cosa
	jr L_9464		;94b1
L_94B3:
	set 0,(ix+007h)		;94b3   ; en el borde: pasa a la pantalla de al lado
	bit 1,(ix+007h)		;94b7   ; mira el bit 1 de las marcas de la cosa (bit 0 repintar, bit 1 su lado)
	ld bc,01004h		;94bb
	jr z,L_94C3		;94be
	ld bc,0e003h		;94c0
L_94C3:
	push bc			;94c3
	ld h,(ix+003h)		;94c4   ; lee la x de la cosa
	ld l,(ix+002h)		;94c7   ; lee la y de la cosa
	ld (ix+003h),b		;94ca   ; guarda la x de la cosa
	call L_95DA		;94cd   ; 0xE2FC = el mapa de la pantalla del bloque, 0xE2FE = donde guardar sus casillas
	call L_9601		;94d0
	pop bc			;94d3
	call L_94DA		;94d4   ; el bloque cambia de pantalla
	jp L_94AD		;94d7
L_94DA:
	push bc			;94da   ; el bloque cambia de pantalla
	call L_969A		;94db   ; devuelve el fondo del bloque donde estaba
	call L_94EB		;94de   ; C = la casilla de la rejilla de la pantalla del bloque
	pop bc			;94e1
	ld b,a			;94e2
	ld a,c			;94e3
	call 05e38h		;94e4
	ld (ix+004h),l		;94e7   ; guarda la pantalla de la cosa
	ret			;94ea
L_94EB:
	ld a,(ix+004h)		;94eb   ; C = la casilla de la rejilla de la pantalla del bloque
	ld hl,0e788h		;94ee
	ld bc,03000h		;94f1
L_94F4:
	cp (hl)			;94f4   ; busca la pantalla en la rejilla
	jr z,L_94FD		;94f5
	inc c			;94f7
	inc hl			;94f8
	djnz L_94F4		;94f9
	ld c,000h		;94fb   ; no esta: 0
L_94FD:
	ld a,c			;94fd
	ret			;94fe
L_94FF:
	dec (ix+006h)		;94ff   ; paso 2: cae 8 pixeles cada dos cuadros
	ret nz			;9502
	ld (ix+006h),002h		;9503   ; la cuenta de la cosa = 0x02
	set 0,(ix+007h)		;9507   ; pone a uno el bit 0 de las marcas de la cosa (bit 0 repintar, bit 1 su lado)
	ld a,(ix+002h)		;950b   ; lee la y de la cosa
	ld (ix+00ah),a		;950e   ; guarda la marca de personaje encima
	add a,008h		;9511
	ld (ix+002h),a		;9513   ; guarda la y de la cosa
	ld e,a			;9516
	ld h,(ix+003h)		;9517   ; lee la x de la cosa
	ld (ix+00bh),h		;951a
	cp 0b8h		;951d
	jr nc,L_952E		;951f
	cp 0b0h		;9521
	ret nc			;9523
	call L_9549		;9524   ; al dar con el suelo, el sonido 0x25
	ret c			;9527
	call 04294h		;9528   ; pide el sonido 0x25
	jp L_94AD		;952b
L_952E:
	ld h,(ix+00bh)		;952e   ; se sale por abajo: a la pantalla de abajo
	ld l,(ix+00ah)		;9531   ; lee la marca de personaje encima
	ld (ix+002h),000h		;9534   ; la y de la cosa = 0x00
	call L_95DA		;9538   ; 0xE2FC = el mapa de la pantalla del bloque, 0xE2FE = donde guardar sus casillas
	call L_9601		;953b
	ld c,002h		;953e
	jp L_94DA		;9540
L_9543:
	call L_9564		;9543   ; NC si la casilla de al lado del bloque esta libre
	jp L_9933		;9546
L_9549:
	call L_9564		;9549   ; C si debajo del bloque hay suelo (las dos casillas de abajo)
	ld bc,00410h		;954c
	add hl,bc			;954f
	push hl			;9550
	push de			;9551
	call L_98E6		;9552   ; A = la casilla del mapa de DE en el pixel (H, L): 0 libre, 1 escalera, 2-3 ladrillo
	pop de			;9555
	pop hl			;9556
	cp 001h		;9557
	ret nc			;9559
	ld a,h			;955a
	add a,008h		;955b
	ld h,a			;955d
	call L_98E6		;955e   ; A = la casilla del mapa de DE en el pixel (H, L): 0 libre, 1 escalera, 2-3 ladrillo
	cp 001h		;9561
	ret			;9563
L_9564:
	ld a,(ix+004h)		;9564   ; DE = el mapa de la pantalla del bloque, H, L = su sitio
	call L_9571		;9567   ; DE = 0xE900 + (A - 1) x 0xC0: el mapa de la pantalla A
	ld h,(ix+003h)		;956a   ; lee la x de la cosa
	ld l,(ix+002h)		;956d   ; lee la y de la cosa
	ret			;9570
L_9571:
	ld l,a			;9571   ; DE = 0xE900 + (A - 1) x 0xC0: el mapa de la pantalla A
	dec l			;9572
	ld h,000h		;9573
	add hl,hl			;9575
	add hl,hl			;9576
	add hl,hl			;9577
	add hl,hl			;9578
	add hl,hl			;9579
	add hl,hl			;957a
	ld d,h			;957b
	ld e,l			;957c
	add hl,hl			;957d
	add hl,de			;957e
	ld de,0e900h		;957f   ; apunta a el mapa de la fase: 0xC0 bytes por pantalla, 4 casillas por byte
	add hl,de			;9582
	ex de,hl			;9583
	ret			;9584

; ----------------------------------------------------------------------
; DATOS sin identificar  0x9585..0x95a1  (28 bytes)
DATA_9585:
	defb 0cdh,0dah,095h,0d5h,0cdh,001h,096h,0e1h,0cdh,0aah,095h,03eh,003h,0ddh,066h,003h	; 9585  ...........>..f.
	defb 0ddh,06eh,002h,0ddh,056h,004h,001h,002h,002h,0c3h,0edh,063h	; 9595  .n..V......c

; ======================================================================
; CODIGO 0x95a1..0x9636  (149 bytes)
; ======================================================================


L_95A1:
	ld h,(ix+003h)		;95a1   ; guarda las casillas que tapa el bloque (en 0xEF40)
	ld l,(ix+002h)		;95a4   ; lee la y de la cosa
	call L_95DA		;95a7   ; 0xE2FC = el mapa de la pantalla del bloque, 0xE2FE = donde guardar sus casillas
	ld a,(ix+004h)		;95aa   ; lee la pantalla de la cosa
	ld (ix+009h),a		;95ad   ; guarda la pantalla de la cosa al empezar
	ld bc,(0e2feh)		;95b0
	ld de,(0e2fch)		;95b4
	push hl			;95b8
	call L_95C1		;95b9
	pop hl			;95bc
	ld a,l			;95bd
	add a,008h		;95be
	ld l,a			;95c0
L_95C1:
	push hl			;95c1
	push de			;95c2
	push bc			;95c3
	call L_98E6		;95c4   ; A = la casilla del mapa de DE en el pixel (H, L): 0 libre, 1 escalera, 2-3 ladrillo
	pop bc			;95c7
	pop de			;95c8
	pop hl			;95c9
	ld (bc),a			;95ca
	inc bc			;95cb
	ld a,h			;95cc
	add a,008h		;95cd
	ld h,a			;95cf
	push de			;95d0
	push bc			;95d1
	call L_98E6		;95d2   ; A = la casilla del mapa de DE en el pixel (H, L): 0 libre, 1 escalera, 2-3 ladrillo
	pop bc			;95d5
	pop de			;95d6
	ld (bc),a			;95d7
	inc bc			;95d8
	ret			;95d9
L_95DA:
	exx			;95da   ; 0xE2FC = el mapa de la pantalla del bloque, 0xE2FE = donde guardar sus casillas
	ld a,(ix+004h)		;95db   ; lee la pantalla de la cosa
	call L_9571		;95de   ; DE = 0xE900 + (A - 1) x 0xC0: el mapa de la pantalla A
	ld (0e2fch),de		;95e1
	push ix		;95e5
	pop hl			;95e7
	ld a,l			;95e8
	and 0f0h		;95e9
	rrca			;95eb
	rrca			;95ec
	ld hl,0ef40h		;95ed
	call 0408fh		;95f0   ; suma A a HL (HL = HL + A)
	ld (0e2feh),hl		;95f3
	exx			;95f6
	ret			;95f7
L_95F8:
	ld h,(ix+003h)		;95f8   ; devuelve al mapa las casillas que tapaba el bloque
	ld l,(ix+002h)		;95fb   ; lee la y de la cosa
	call L_95DA		;95fe   ; 0xE2FC = el mapa de la pantalla del bloque, 0xE2FE = donde guardar sus casillas
L_9601:
	ld a,(ix+004h)		;9601   ; lee la pantalla de la cosa
	cp (ix+009h)		;9604   ; compara con la pantalla de la cosa al empezar
	ret nz			;9607
	ld de,(0e2feh)		;9608
	push hl			;960c
	call L_9615		;960d   ; dos casillas
	pop hl			;9610
	ld a,l			;9611
	add a,008h		;9612
	ld l,a			;9614
L_9615:
	push hl			;9615   ; dos casillas
	push de			;9616
	ld a,(de)			;9617
	ld d,(ix+004h)		;9618   ; lee la pantalla de la cosa
	ld bc,00101h		;961b
	call 063edh		;961e   ; marca un rectangulo del mapa de la pantalla D: B filas de C casillas con el valor A
	pop de			;9621
	pop hl			;9622
	inc de			;9623
	ld a,h			;9624
	add a,008h		;9625
	ld h,a			;9627
	ld a,(de)			;9628
	push de			;9629
	ld d,(ix+004h)		;962a   ; lee la pantalla de la cosa
	ld bc,00101h		;962d
	call 063edh		;9630   ; marca un rectangulo del mapa de la pantalla D: B filas de C casillas con el valor A
	pop de			;9633
	inc de			;9634
	ret			;9635

; ----------------------------------------------------------------------
; DATOS sin identificar  0x9636..0x9652  (28 bytes)
DATA_9636:
	defb 0cdh,09ah,096h,0ddh,066h,00bh,0ddh,06eh,00ah,0ddh,056h,003h,0ddh,05eh,002h,0cdh	; 9636  ....f..n..V..^..
	defb 085h,095h,03ah,043h,0e2h,0ddh,0beh,009h,0c0h,0cdh,066h,096h	; 9646  ..:C......f.

; ======================================================================
; CODIGO 0x9652..0x972c  (218 bytes)
; ======================================================================


L_9652:
	ld hl,09370h		;9652   ; pinta el bloque: 2 x 2 de 0x9370
	ld d,(ix+003h)		;9655
	ld e,(ix+002h)		;9658
	ld bc,00202h		;965b
	jp 0573bh		;965e
L_9661:
	call L_9666		;9661   ; guarda el fondo del bloque y lo pinta
	jr L_9652		;9664
L_9666:
	ld h,(ix+003h)		;9666   ; guarda el fondo: en MSX1 cuatro bytes de la VRAM, en MSX2 un trozo en la pagina 1
	ld l,(ix+002h)		;9669
	ld (ix+00bh),h		;966c
	ld (ix+00ah),l		;966f
	ld a,(0f0f4h)		;9672   ; lee la marca de MSX2 (1 en el cartucho de MSX2, 0 en el de MSX1)
	and a			;9675
	jr nz,L_9686		;9676
	call 04d7bh		;9678   ; pasa la posicion de caracter de HL a direccion de la VRAM
	push ix		;967b
	pop de			;967d
	ld a,00ch		;967e
	call 04094h		;9680   ; suma A a DE (DE = DE + A)
	jp 05722h		;9683
L_9686:
	push ix		;9686   ; MSX2: el fondo guardado en la pagina 1 (columna 2 x la ficha, fila 0x40 o 0x50)
	pop de			;9688
	ld a,e			;9689
	add a,a			;968a
	ld d,a			;968b
	ld e,040h		;968c
	jr nc,L_9692		;968e
	ld e,050h		;9690
L_9692:
	ld bc,01010h		;9692   ; 16 x 16 pixeles a la pagina 1
	ld a,004h		;9695
	jp 05029h		;9697
L_969A:
	ld d,(ix+00bh)		;969a   ; devuelve el fondo del bloque donde estaba
	ld e,(ix+00ah)		;969d
L_96A0:
	ld a,(0e243h)		;96a0   ; lee la pantalla de la fase (desde 1)
	cp (ix+009h)		;96a3
	ret nz			;96a6
	push ix		;96a7
	pop hl			;96a9
	ld a,(0f0f4h)		;96aa   ; lee la marca de MSX2 (1 en el cartucho de MSX2, 0 en el de MSX1)
	and a			;96ad
	jr nz,L_96BB		;96ae
	ld a,00ch		;96b0
	call 0408fh		;96b2   ; suma A a HL (HL = HL + A)
	ld bc,00202h		;96b5
	jp 0573bh		;96b8
L_96BB:
	push ix		;96bb   ; MSX2: el fondo guardado en la pagina 1
	pop hl			;96bd
	ld a,l			;96be
	add a,a			;96bf
	ld h,a			;96c0
	ld l,040h		;96c1
	jr nc,L_96C7		;96c3
	ld l,050h		;96c5
L_96C7:
	ld bc,01010h		;96c7   ; de vuelta a la pagina 0
	ld a,001h		;96ca
	jp 05029h		;96cc
L_96CF:
	ld ix,0e600h		;96cf   ; pinta los bloques de esta pantalla
	ld b,010h		;96d3
L_96D5:
	push bc			;96d5
	ld a,(ix+000h)		;96d6   ; lee el tipo de la cosa (0: libre)
	cp 005h		;96d9
	call z,L_96E7		;96db
	ld bc,00010h		;96de
	add ix,bc		;96e1
	pop bc			;96e3
	djnz L_96D5		;96e4
	ret			;96e6
L_96E7:
	ld a,(0e243h)		;96e7   ; lee la pantalla de la fase (desde 1)
	cp (ix+004h)		;96ea
	ret nz			;96ed
	call L_95DA		;96ee   ; 0xE2FC = el mapa de la pantalla del bloque, 0xE2FE = donde guardar sus casillas
	ld h,(ix+003h)		;96f1
	ld l,(ix+002h)		;96f4
	push hl			;96f7
	pop hl			;96f8
	call L_9666		;96f9   ; guarda el fondo: en MSX1 cuatro bytes de la VRAM, en MSX2 un trozo en la pagina 1
	jp L_9652		;96fc
L_96FF:
	ld ix,0e600h		;96ff   ; devuelve el fondo de los bloques de esta pantalla
	ld b,010h		;9703
L_9705:
	push bc			;9705
	ld a,(ix+000h)		;9706   ; lee el tipo de la cosa (0: libre)
	cp 005h		;9709
	call z,L_9717		;970b
	ld bc,00010h		;970e
	add ix,bc		;9711
	pop bc			;9713
	djnz L_9705		;9714
	ret			;9716
L_9717:
	ld a,(0e243h)		;9717   ; lee la pantalla de la fase (desde 1)
	cp (ix+004h)		;971a
	ret nz			;971d
	call L_95DA		;971e   ; 0xE2FC = el mapa de la pantalla del bloque, 0xE2FE = donde guardar sus casillas
	ld h,(ix+003h)		;9721
	ld l,(ix+002h)		;9724
	push hl			;9727
	pop de			;9728
	jp L_96A0		;9729

; ----------------------------------------------------------------------
; DATOS resto_972C: lo apuntan con el banco puesto p00:4162 (0x972C), p02:9DE0
;   (0x972C); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p00:4162, p02:9DE0 (50 bytes)
;   0x972c..0x975e  (50 bytes)
DATA_resto_972C:
	defb 02eh,097h,0c5h,0cdh,0e7h,09dh,03eh,001h,032h,0e6h,0f0h,03ah,0e9h,0f0h,026h,040h	; 972c  ......>.2..:..&@
	defb 0cdh,024h,000h,0c1h,079h,0e6h,00eh,00fh,0feh,002h,038h,006h,0feh,006h,038h,00bh	; 973c  .$..y.....8...8.
	defb 018h,005h,00eh,004h,00fh,030h,006h,00eh,003h,018h,002h,00eh,000h,0c3h,063h,097h	; 974c  .....0........c.
	defb 00eh,006h	; 975c

; ======================================================================
; CODIGO 0x975e..0x9797  (57 bytes)
; ======================================================================


L_975E:
	push bc			;975e   ; error de disco: el letrero del error C (tabla 0xAF52) y se vuelve con la pila de 0xF0E2
	call L_9DE7		;975f   ; la deja como estaba
	pop bc			;9762
	ld b,000h		;9763
	ld a,c			;9765
	add a,a			;9766
	ld c,a			;9767
	call 041b5h		;9768   ; pone el banco 12 en 0xA000
	ld hl,0af52h		;976b
	add hl,bc			;976e
	ld a,(hl)			;976f
	inc hl			;9770
	ld h,(hl)			;9771
	ld l,a			;9772
	push hl			;9773
	call 04e98h		;9774   ; pantalla en negro: quita sprites, borra la pagina y apaga la pantalla
	pop hl			;9777
	call 051d0h		;9778   ; pinta un letrero: [D][E] y caracteres; 0xFE trae otra posicion; 0xFF acaba
	ld hl,0af60h		;977b
	call 051d0h		;977e   ; pinta un letrero: [D][E] y caracteres; 0xFE trae otra posicion; 0xFF acaba
	call 0418ah		;9781   ; pone los bancos 1-2-3 (el juego)
	call L_9E1D		;9784   ; 256 veces la de 0xF0EA
	ld a,(0f0e4h)		;9787
	ld (0fd9fh),a		;978a
	ld a,002h		;978d
	ld (0e27fh),a		;978f   ; guarda el resultado de grabar o cargar (0 bien, 2 error)
	ld sp,(0f0e2h)		;9792
	ret			;9796

; ----------------------------------------------------------------------
; DATOS resto_9797: lo apuntan con el banco puesto p02:9CBE (0x9797); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p02:9CBE (27 bytes)
;   0x9797..0x97b2  (27 bytes)
DATA_resto_9797:
	defb 099h,097h,0cdh,0e7h,09dh,03ah,0e9h,0f0h,026h,040h,0cdh,024h,000h,0cdh,01dh,09eh	; 9797  .....:..&@.$....
	defb 03ah,0e4h,0f0h,032h,09fh,0fdh,0edh,07bh,0e2h,0f0h,0c9h	; 97a7  :..2...{...

; ======================================================================
; CODIGO 0x97b2..0x9807  (85 bytes)
; ======================================================================


L_97B2:
	call 041bfh		;97b2   ; las cosas que se cogen de la fase (tabla 0xAFB1 del banco 13) a 0xE300
	call L_97BB		;97b5   ; la palabra (fase - 1)
	jp 0418ah		;97b8
L_97BB:
	ld ix,0e300h		;97bb   ; la palabra (fase - 1)
	ld hl,0afb1h		;97bf
	ld a,(0e242h)		;97c2   ; lee la fase (1-60)
	dec a			;97c5
	call 04d4ch		;97c6   ; HL = la palabra A de la tabla de HL
L_97C9:
	call L_97D4		;97c9   ; cada una a una ficha de 8 bytes, hasta 0xFF
	ret z			;97cc
	ld de,00008h		;97cd
	add ix,de		;97d0
	jr L_97C9		;97d2
L_97D4:
	ld a,(hl)			;97d4   ; una: [pantalla | tipo][x][y]
	cp 0ffh		;97d5
	ret z			;97d7
	and 00fh		;97d8
	ld (ix+000h),a		;97da   ; guarda el estado (cifra alta) y el tipo (cifra baja) de la cosa
	ld a,(hl)			;97dd
	rra			;97de
	rra			;97df
	rra			;97e0
	rra			;97e1
	and 00fh		;97e2
	ld (ix+003h),a		;97e4   ; guarda la pantalla de la cosa
	inc hl			;97e7
	ld a,(hl)			;97e8
	ld (ix+001h),a		;97e9   ; guarda la y de la cosa
	inc hl			;97ec
	ld a,(hl)			;97ed
	ld (ix+002h),a		;97ee   ; guarda la x de la cosa
	inc hl			;97f1
	xor a			;97f2
	ld (ix+004h),a		;97f3   ; guarda el dibujo de la cosa en vuelo
	ld (ix+005h),a		;97f6   ; guarda el paso de la velocidad de la cosa
	ld (ix+006h),a		;97f9   ; guarda la cuenta de la cosa
	ld (ix+007h),a		;97fc   ; guarda el lado de la cosa
	inc a			;97ff
	ret			;9800
L_9801:
	ld a,(0e2b0h)		;9801   ; la pausa: el personaje, por pasos (0xE2B0)
	call 04099h		;9804   ; el despachador de Konami: la tabla va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_9807: 4 destinos del despachador p00:4099 (call en p02:9804, el
;   indice en A): 980F, 981C, 9831, 9846; lo leen p02:9804 (8 bytes)
;   0x9807..0x980f  (8 bytes)
DATA_tabla_9807:
	defw 0980fh,0981ch,09831h,09846h	; 9807  -> L_980F L_981C L_9831 L_9846

; ======================================================================
; CODIGO 0x980f..0x982d  (30 bytes)
; ======================================================================


L_980F:
	ld hl,0e2b0h		;980f   ; paso 0: 0xE2B0 = 1, 0xE2B1 = 0x20
	ld (hl),001h		;9812
	inc hl			;9814
	ld (hl),020h		;9815
	inc hl			;9817
	inc hl			;9818
	ld (hl),000h		;9819
	ret			;981b
L_981C:
	ld hl,0e2b1h		;981c   ; paso 1: espera y copia 4 bytes de 0x982D
	dec (hl)			;981f
	ret nz			;9820
	ld hl,0982dh		;9821
	ld de,0e2b0h		;9824
	ld bc,00004h		;9827
	ldir		;982a
	ret			;982c

; ----------------------------------------------------------------------
; DATOS resto_982D: lo apuntan con el banco puesto p02:9821 (0x982D); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p02:9821 (4 bytes)
;   0x982d..0x9831  (4 bytes)
DATA_resto_982D:
	defb 002h,030h,030h,001h	; 982d

; ======================================================================
; CODIGO 0x9831..0x9a6a  (569 bytes)
; ======================================================================


L_9831:
	ld c,003h		;9831   ; parpadea hasta que la cuenta llega a 0x10: dibujo 3
	call L_984B		;9833   ; cada 0xE2B2 cuadros cambia el dibujo (xor C) y la espera se acorta hasta 5
	ld a,(0e2b2h)		;9836
	cp 010h		;9839
	ret nz			;983b
	ld a,003h		;983c
	ld (0e2b3h),a		;983e   ; guarda el dibujo del personaje en pausa
	ld hl,0e2b0h		;9841
	inc (hl)			;9844
	ret			;9845
L_9846:
	ld c,007h		;9846
	jp L_984B		;9848
L_984B:
	ld hl,0e2b1h		;984b   ; cada 0xE2B2 cuadros cambia el dibujo (xor C) y la espera se acorta hasta 5
	dec (hl)			;984e
	ret nz			;984f
	ld a,(0e2b2h)		;9850   ; la espera vuelve a empezar
	ld (hl),a			;9853
	inc hl			;9854
	inc hl			;9855
	ld a,(hl)			;9856   ; el dibujo cambia
	xor c			;9857
	ld (hl),a			;9858
	rra			;9859   ; en el dibujo sin el bit 0...
	ret c			;985a
	ld a,(0e2b2h)		;985b   ; ...la espera se acorta (hasta 5)
	cp 005h		;985e
	ret c			;9860
	dec a			;9861
	ld (0e2b2h),a		;9862
	ret			;9865
L_9866:
	ld a,(0e280h)		;9866   ; los sprites del personaje; en el estado 0x0E, uno de cada dos cuadros no se ve (parpadea)
	cp 00eh		;9869
	jr nz,L_9881		;986b
	ld a,(0e2a8h)		;986d   ; lee la cuenta del parpadeo al aparecer
	rra			;9870
	jr c,L_9881		;9871
	ld hl,0e800h		;9873   ; apunta a los atributos de los sprites (y, x, dibujo, color); al cargar graficos, su bufer
	ld de,0e801h		;9876
	ld (hl),0e0h		;9879
	ld bc,0000fh		;987b
	ldir		;987e
	ret			;9880
L_9881:
	ld b,000h		;9881   ; cuatro sprites: dos arriba y dos abajo, 16 pixeles mas
	ld hl,0e800h		;9883   ; apunta a los atributos de los sprites (y, x, dibujo, color); al cargar graficos, su bufer
	ld a,(0e282h)		;9886   ; lee la y del personaje
	sub 009h		;9889
	ld d,a			;988b
	ld a,(0e284h)		;988c   ; lee la x del personaje
	ld e,a			;988f
	ld a,(0e280h)		;9890   ; lee el estado del personaje
	cp 002h		;9893
	jr z,L_989F		;9895
	ld a,(0e294h)		;9897   ; mirando a la izquierda, 2 pixeles a la derecha
	or a			;989a
	jr z,L_989F		;989b
	inc e			;989d
	inc e			;989e
L_989F:
	ld (hl),d			;989f   ; un sprite: y, x y dibujo
	inc hl			;98a0
	ld (hl),e			;98a1
	inc hl			;98a2
	ld (hl),b			;98a3
	inc hl			;98a4
	inc hl			;98a5
	ld a,b			;98a6   ; el dibujo siguiente (4 mas)
	add a,004h		;98a7
	ld b,a			;98a9
	ld a,b			;98aa
	cp 010h		;98ab   ; cuatro sprites
	jr z,L_98B9		;98ad
	cp 008h		;98af   ; los dos de abajo...
	jr nz,L_989F		;98b1
	ld a,d			;98b3   ; ...16 pixeles mas abajo
	add a,010h		;98b4
	ld d,a			;98b6
	jr L_989F		;98b7
L_98B9:
	ld hl,0d200h		;98b9   ; sus colores: 13, 0x4E, 13 y 0x4E
	ld de,0d201h		;98bc
	ld bc,0000fh		;98bf
	ld (hl),00dh		;98c2   ; el primero de color 13
	ldir		;98c4
	call L_98D2		;98c6   ; el segundo 0x4E
	inc hl			;98c9
	inc de			;98ca
	ld bc,0000fh		;98cb
	ld (hl),00dh		;98ce   ; el tercero 13
	ldir		;98d0
L_98D2:
	inc hl			;98d2   ; y el cuarto 0x4E
	inc de			;98d3
	ld bc,0000fh		;98d4
	ld (hl),04eh		;98d7
	ldir		;98d9
	ret			;98db
L_98DC:
	push hl			;98dc   ; A = la casilla del mapa de la pantalla en (H, L), sin tocar HL
	call L_98E2		;98dd   ; A = la casilla del mapa de la pantalla (0xE250) en el pixel (x H, y L)
	pop hl			;98e0
	ret			;98e1
L_98E2:
	ld de,(0e250h)		;98e2   ; A = la casilla del mapa de la pantalla (0xE250) en el pixel (x H, y L)
L_98E6:
	ld a,l			;98e6   ; A = la casilla del mapa de DE en el pixel (H, L): 0 libre, 1 escalera, 2-3 ladrillo
	and 0f8h		;98e7
	ld l,a			;98e9
	ld a,h			;98ea
	and 0f8h		;98eb
	ld h,000h		;98ed
	add hl,de			;98ef   ; la fila de la casilla, 8 bytes
	rra			;98f0
	rra			;98f1
	rra			;98f2
	and 01fh		;98f3
	ld b,a			;98f5
	rra			;98f6
	rra			;98f7
	and 007h		;98f8
	ld d,000h		;98fa
	ld e,a			;98fc
	add hl,de			;98fd
	ld a,b			;98fe   ; las dos cifras de la casilla dentro del byte
	and 003h		;98ff
	xor 003h		;9901
	ld b,a			;9903
	push bc			;9904
	ld a,(hl)			;9905
	jr z,L_990C		;9906
L_9908:
	rra			;9908
	rra			;9909
	djnz L_9908		;990a
L_990C:
	pop bc			;990c
	and 003h		;990d
	ret			;990f
L_9910:
	push bc			;9910   ; NC si hay pared en la direccion C (tres puntos de la orilla, en el mapa de la pantalla)
	call L_995A		;9911   ; el primer punto de la orilla segun la direccion C (1 abajo, 2 izquierda, 3 derecha, si no arriba)
	push hl			;9914
	call L_98E2		;9915   ; A = la casilla del mapa de la pantalla (0xE250) en el pixel (x H, y L)
	pop hl			;9918
	pop bc			;9919
	sub 002h		;991a
	ret nc			;991c
	push bc			;991d
	call L_998E		;991e   ; el siguiente punto, 6 pixeles mas alla
	push hl			;9921
	call L_98E2		;9922   ; A = la casilla del mapa de la pantalla (0xE250) en el pixel (x H, y L)
	pop hl			;9925
	pop bc			;9926
	sub 002h		;9927
	ret nc			;9929
	call L_998E		;992a   ; el siguiente punto, 6 pixeles mas alla
	call L_98E2		;992d   ; A = la casilla del mapa de la pantalla (0xE250) en el pixel (x H, y L)
	sub 002h		;9930
	ret			;9932
L_9933:
	push bc			;9933   ; lo mismo con el mapa de DE
	call L_995A		;9934   ; el primer punto de la orilla segun la direccion C (1 abajo, 2 izquierda, 3 derecha, si no arriba)
	push hl			;9937
	push de			;9938
	call L_98E6		;9939   ; A = la casilla del mapa de DE en el pixel (H, L): 0 libre, 1 escalera, 2-3 ladrillo
	pop de			;993c
	pop hl			;993d
	pop bc			;993e
	sub 002h		;993f
	ret nc			;9941
	push bc			;9942
	call L_998E		;9943   ; el siguiente punto, 6 pixeles mas alla
	push hl			;9946
	push de			;9947
	call L_98E6		;9948   ; A = la casilla del mapa de DE en el pixel (H, L): 0 libre, 1 escalera, 2-3 ladrillo
	pop de			;994b
	pop hl			;994c
	pop bc			;994d
	sub 002h		;994e
	ret nc			;9950
	call L_998E		;9951   ; el siguiente punto, 6 pixeles mas alla
	call L_98E6		;9954   ; A = la casilla del mapa de DE en el pixel (H, L): 0 libre, 1 escalera, 2-3 ladrillo
	sub 002h		;9957
	ret			;9959
L_995A:
	ld a,c			;995a   ; el primer punto de la orilla segun la direccion C (1 abajo, 2 izquierda, 3 derecha, si no arriba)
	dec a			;995b   ; segun la direccion
	jr z,L_9970		;995c
	dec a			;995e
	jr z,L_997E		;995f
	dec a			;9961
	jr z,L_9986		;9962
	ld a,h			;9964   ; arriba: x + 2, y - 1 (sin pasar de 0)
	add a,002h		;9965
	ld h,a			;9967
	ld a,l			;9968
	sub 001h		;9969
	ld l,a			;996b
	ret nc			;996c
	ld l,000h		;996d
	ret			;996f
L_9970:
	ld a,h			;9970   ; abajo: x + 2, y + 16 (sin pasar de 0xB8)
	add a,002h		;9971
	ld h,a			;9973
	ld a,l			;9974
	add a,010h		;9975
	ld l,a			;9977
	cp 0b8h		;9978
	ret c			;997a
	ld l,0b8h		;997b
	ret			;997d
L_997E:
	ld a,h			;997e   ; izquierda: x - 1 (sin pasar de 0)
	sub 001h		;997f
	ld h,a			;9981
	ret nc			;9982
	ld h,000h		;9983
	ret			;9985
L_9986:
	ld a,h			;9986   ; derecha: x + 16 (sin pasar de 0xF8)
	add a,010h		;9987
	ld h,a			;9989
	ret nc			;998a
	ld h,0f8h		;998b
	ret			;998d
L_998E:
	ld a,c			;998e   ; el siguiente punto, 6 pixeles mas alla
	cp 002h		;998f
	jr nc,L_9998		;9991
	ld a,h			;9993
	add a,006h		;9994
	ld h,a			;9996
	ret			;9997
L_9998:
	ld a,l			;9998
	add a,006h		;9999
	ld l,a			;999b
	ret			;999c
L_999D:
	call L_9A0B		;999d   ; coger las cosas de 2 x 2 de esta pantalla que esten a menos de 12 pixeles del personaje
	ld a,(0e243h)		;99a0   ; lee la pantalla de la fase (desde 1)
	ld c,a			;99a3
	ld b,010h		;99a4
	ld hl,0e700h		;99a6   ; apunta a la tabla de colores al cargar graficos; en la partida, las cosas de 2 x 2 de la fase (16 x 8 bytes)
L_99A9:
	ld a,(hl)			;99a9   ; una cosa de 2 x 2 de 0xE700
	and a			;99aa
	jr z,L_99C4		;99ab
	inc l			;99ad   ; en esta pantalla?
	ld a,(hl)			;99ae
	cp c			;99af
	jr nz,L_99C4		;99b0
	inc l			;99b2   ; a menos de 12 pixeles en y...
	ld a,(hl)			;99b3
	sub e			;99b4
	add a,00ch		;99b5
	cp 018h		;99b7
	jr nc,L_99C4		;99b9
	inc l			;99bb   ; ...y en x
	ld a,(hl)			;99bc
	sub d			;99bd
	add a,00ch		;99be
	cp 018h		;99c0
	jr c,L_99CD		;99c2
L_99C4:
	ld a,008h		;99c4   ; la siguiente (8 bytes)
	add a,l			;99c6
	and 0f8h		;99c7
	ld l,a			;99c9
	djnz L_99A9		;99ca
	ret			;99cc
L_99CD:
	push hl			;99cd   ; cogida: se borra de la pantalla
	call L_96FF		;99ce   ; devuelve el fondo de los bloques de esta pantalla
	call L_90AB		;99d1   ; las cosas de la lista 0xEE50 (por numero): lo que habia debajo se devuelve
	pop hl			;99d4
	ld d,(hl)			;99d5
	dec l			;99d6
	ld e,(hl)			;99d7
	dec l			;99d8
	dec l			;99d9
	ld (hl),000h		;99da
	ld bc,00202h		;99dc
	call 056deh		;99df
	ld hl,0e2f5h		;99e2   ; una menos; con la ultima, el sonido 0x0B y el borde parpadea (la salida se abre)
	dec (hl)			;99e5
	jr nz,L_99F8		;99e6
	call 04212h		;99e8   ; pide el sonido 0x0B
	xor a			;99eb
	ld (0e216h),a		;99ec
	dec a			;99ef
	ld (0e215h),a		;99f0   ; guarda la cuenta para volver a poner la musica
	ld a,010h		;99f3
	ld (0e21bh),a		;99f5   ; guarda la cuenta del borde que parpadea
L_99F8:
	call 0425dh		;99f8   ; el sonido 0x1A, la salida y 500 puntos
	call L_9010		;99fb   ; pinta la salida si es de esta pantalla: 4 x 4 caracteres de 0x9340 + 16 x 0xE2F6
	call L_90F7		;99fe   ; las de la lista, al reves: guarda el fondo y pinta la cosa
	call L_96CF		;9a01   ; pinta los bloques de esta pantalla
	ld de,00500h		;9a04
	call 04c20h		;9a07   ; suma DE (BCD) a los puntos 0xE226-0xE228, si el bit 6 de 0xE202 lo deja
	ret			;9a0a
L_9A0B:
	ld a,(0e282h)		;9a0b   ; E = la y del personaje, D = su x
	ld e,a			;9a0e
	ld a,(0e284h)		;9a0f   ; lee la x del personaje
	ld d,a			;9a12
	ret			;9a13
L_9A14:
	ld a,(0e248h)		;9a14   ; coger una cosa de 0xE300 del suelo (si no lleva otra y no esta saliendo)
	or a			;9a17
	ret nz			;9a18
	ld a,(0e287h)		;9a19   ; lee la postura del personaje
	or a			;9a1c
	ret nz			;9a1d
	ld hl,0ee50h		;9a1e   ; apunta a la lista de las cosas de 0xE300 por orden de pintado
L_9A21:
	ld a,(hl)			;9a21
	or a			;9a22
	ret z			;9a23
	call L_927D		;9a24   ; IX = la cosa A de 0xE300 (desde 1)
	ld a,(0e243h)		;9a27   ; lee la pantalla de la fase (desde 1)
	cp (ix+003h)		;9a2a
	jr nz,L_9A42		;9a2d
	ld a,(ix+000h)		;9a2f
	and a			;9a32
	jr z,L_9A42		;9a33
	and 0f0h		;9a35
	jr nz,L_9A42		;9a37
	push hl			;9a39
	push bc			;9a3a
	call L_9A46		;9a3b   ; C si la cosa esta al alcance (en y y en x segun hacia donde mira)
	pop bc			;9a3e
	pop hl			;9a3f
	jr c,$+83		;9a40
L_9A42:
	inc hl			;9a42
	djnz L_9A21		;9a43
	ret			;9a45
L_9A46:
	ld a,(0e282h)		;9a46   ; C si la cosa esta al alcance (en y y en x segun hacia donde mira)
	sub (ix+001h)		;9a49   ; le resta la y de la cosa
	jr nc,L_9A53		;9a4c
	neg		;9a4e
	cp 008h		;9a50
	ret nc			;9a52
L_9A53:
	cp 00dh		;9a53
	ret nc			;9a55
	ld b,000h		;9a56
	ld a,(0e284h)		;9a58   ; lee la x del personaje
	rla			;9a5b
	rl b		;9a5c
	sla b		;9a5e
	ld a,(ix+002h)		;9a60   ; lee la x de la cosa
	rlca			;9a63
	and 001h		;9a64
	add a,b			;9a66
	call 04099h		;9a67   ; el despachador de Konami: la tabla va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_9A6A: 4 destinos del despachador p00:4099 (call en p02:9A67, el
;   indice en A): 9A72, 9A7F, 9A8A, 9A72; lo leen p02:9A67 (8 bytes)
;   0x9a6a..0x9a72  (8 bytes)
DATA_tabla_9A6A:
	defw 09a72h,09a7fh,09a8ah,09a72h	; 9a6a  -> L_9A72 L_9A7F L_9A8A L_9A72

; ======================================================================
; CODIGO 0x9a72..0x9d23  (689 bytes)
; ======================================================================


L_9A72:
	ld a,(0e284h)		;9a72   ; lee la x del personaje
	sub (ix+002h)		;9a75   ; le resta la x de la cosa
	jr nc,L_9A7C		;9a78
	neg		;9a7a
L_9A7C:
	cp 00eh		;9a7c
	ret			;9a7e
L_9A7F:
	ld a,(0e284h)		;9a7f   ; lee la x del personaje
	ld b,a			;9a82
	ld a,(ix+002h)		;9a83   ; lee la x de la cosa
	sub b			;9a86
	cp 00eh		;9a87
	ret			;9a89
L_9A8A:
	ld a,(0e284h)		;9a8a   ; lee la x del personaje
	sub (ix+002h)		;9a8d   ; le resta la x de la cosa
	cp 00eh		;9a90
	ret			;9a92
L_9A93:
	push ix		;9a93   ; la coge: su tipo a la postura del personaje (0xE287), se marca llevada y el sonido 0x19
	call L_96FF		;9a95   ; devuelve el fondo de los bloques de esta pantalla
	pop ix		;9a98
	ld a,(ix+000h)		;9a9a
	and 00fh		;9a9d
	ld (0e287h),a		;9a9f   ; guarda la postura del personaje
	or 0f0h		;9aa2
	ld (ix+000h),a		;9aa4
	call 04258h		;9aa7   ; pide el sonido 0x19
	call L_909F		;9aaa   ; repinta lo que se lleva y lo que se suelta en la pantalla
	call L_96CF		;9aad   ; pinta los bloques de esta pantalla
	ret			;9ab0
L_9AB1:
	ld a,(0e255h)		;9ab1   ; un enemigo de esta pantalla toca al personaje: muere (salvo con FESTIVAL o ya muerto)
	and a			;9ab4
	ret nz			;9ab5
	ld a,(0e298h)		;9ab6   ; lee la marca de personaje muerto
	or a			;9ab9
	ret nz			;9aba
	ld ix,0e500h		;9abb   ; apunta a los enemigos (8 x 32 bytes)
	ld b,008h		;9abf
L_9AC1:
	ld a,(0e243h)		;9ac1   ; lee la pantalla de la fase (desde 1)
	cp (ix+010h)		;9ac4   ; compara con la pantalla del enemigo
	jr nz,L_9AEB		;9ac7
	bit 0,(ix+013h)		;9ac9   ; solo los que matan (bit 0 de IX+13)
	jr z,L_9AEB		;9acd
	ld a,(0e282h)		;9acf   ; cerca en y...
	add a,008h		;9ad2
	sub (ix+003h)		;9ad4   ; le resta la y del enemigo
	cp 010h		;9ad7
	jr nc,L_9AEB		;9ad9
	ld a,(0e284h)		;9adb   ; ...y en x
	add a,00ah		;9ade
	jr c,L_9AEB		;9ae0
	sub (ix+005h)		;9ae2   ; le resta la x del enemigo
	jr c,L_9AEB		;9ae5
	cp 014h		;9ae7
	jr c,L_9AF3		;9ae9
L_9AEB:
	ld de,00020h		;9aeb
	add ix,de		;9aee
	djnz L_9AC1		;9af0
	ret			;9af2
L_9AF3:
	ld a,005h		;9af3   ; el personaje muere (estado 5) con el sonido 0x28
	ld (0e280h),a		;9af5   ; guarda el estado del personaje
	call L_92FF		;9af8   ; el personaje muere (0xE298 = 1)
	jp 042a3h		;9afb
L_9AFE:
	ld ix,0e300h		;9afe   ; las cosas lanzadas (tipo 1-3 de 0xE300 en vuelo) que dan a un enemigo
	ld b,040h		;9b02
L_9B04:
	exx			;9b04
	ld a,(ix+000h)		;9b05   ; lee el estado (cifra alta) y el tipo (cifra baja) de la cosa
	ld c,a			;9b08
	and 00fh		;9b09
	dec a			;9b0b
	cp 003h		;9b0c
	jr nc,L_9B5B		;9b0e
	ld a,c			;9b10
	rrca			;9b11
	rrca			;9b12
	rrca			;9b13
	rrca			;9b14
	and 00fh		;9b15
	cp 002h		;9b17
	jr c,L_9B5B		;9b19
	ld l,(ix+001h)		;9b1b   ; lee la y de la cosa
	ld h,(ix+002h)		;9b1e   ; lee la x de la cosa
	ld c,(ix+003h)		;9b21   ; lee la pantalla de la cosa
	ld iy,0e500h		;9b24   ; apunta a los enemigos (8 x 32 bytes)
	ld b,008h		;9b28
L_9B2A:
	ld a,(iy+000h)		;9b2a   ; cada enemigo que se puede matar (bit 1 de IX+13) en la misma pantalla
	and a			;9b2d   ; si existe...
	jr z,L_9B54		;9b2e
	bit 1,(iy+013h)		;9b30   ; ...y se le puede matar...
	jr z,L_9B54		;9b34
	ld a,c			;9b36   ; ...y esta en la pantalla de la cosa...
	cp (iy+010h)		;9b37
	jr nz,L_9B54		;9b3a
	ld a,l			;9b3c   ; ...a menos de 12 pixeles en y...
	add a,00ch		;9b3d
	sub (iy+003h)		;9b3f
	cp 018h		;9b42
	jr nc,L_9B54		;9b44
	ld a,(iy+005h)		;9b46   ; ...y en x
	sub h			;9b49
	jr nc,L_9B4E		;9b4a
	neg		;9b4c
L_9B4E:
	cp 00ch		;9b4e
	jr c,L_9B64		;9b50
	jr L_9B54		;9b52
L_9B54:
	ld de,00020h		;9b54
	add iy,de		;9b57
	djnz L_9B2A		;9b59
L_9B5B:
	exx			;9b5b
	ld de,00008h		;9b5c
	add ix,de		;9b5f
	djnz L_9B04		;9b61
	ret			;9b63
L_9B64:
	push ix		;9b64   ; le da: 0xE2E8 = la cosa, el enemigo muere, 100 puntos y el sonido 0x26
	pop hl			;9b66
	ld (0e2e8h),hl		;9b67
	push iy		;9b6a
	pop ix		;9b6c
	ld a,001h		;9b6e
	ld (0edcdh),a		;9b70
	call L_9B80		;9b73   ; el enemigo herido segun su tipo
	ld de,00100h		;9b76
	call 04c20h		;9b79   ; suma DE (BCD) a los puntos 0xE226-0xE228, si el bit 6 de 0xE202 lo deja
	call 04299h		;9b7c   ; pide el sonido 0x26
	ret			;9b7f
L_9B80:
	ld a,(ix+000h)		;9b80   ; el enemigo herido segun su tipo
	cp 004h		;9b83   ; el de tipo 4 (p03:B8C5)
	jp z,0b8c5h		;9b85
	ld hl,06611h		;9b88   ; al acabar, se va (p01:6611)
	push hl			;9b8b
	cp 003h		;9b8c   ; el 3 y el 4 no se paran
	ret nc			;9b8e
	ld a,(ix+001h)		;9b8f   ; el 1 y el 2 solo en sus pasos 0 y 1: vuelve a su sitio (p03:AE6F)
	cp 002h		;9b92
	ret nc			;9b94
	jp 0ae6fh		;9b95
L_9B98:
	di			;9b98   ; carga la fase del editor del disco (BDOS), sin la interrupcion
	ld a,(0fd9fh)		;9b99
	ld (0f0e4h),a		;9b9c
	ld a,0c9h		;9b9f
	ld (0fd9fh),a		;9ba1
	ld (0f0e2h),sp		;9ba4
	call L_9DB3		;9ba8   ; deja sitio a la BDOS: la RAM del juego se cambia a 0xC000
	ld hl,0c270h		;9bab
	ld de,0ce00h		;9bae
	call L_9D51		;9bb1   ; la cabecera del fichero (FCB) en 0xCE00 con el nombre de 0xC270
	call L_9CE3		;9bb4   ; abre
	call L_9D26		;9bb7   ; el tamano de registro a 1 y el registro actual a 0
	call L_9BCC		;9bba   ; lee los seis trozos
	call L_9D05		;9bbd   ; cierra
	di			;9bc0
	call L_9DE7		;9bc1   ; y la RAM vuelve a su sitio
	ld a,(0f0e4h)		;9bc4
	ld (0fd9fh),a		;9bc7
	ei			;9bca
	ret			;9bcb
L_9BCC:
	ld de,0c243h		;9bcc   ; lee los seis trozos (los mismos que el Game Master 2), cada uno con su sitio de lectura (orden 0x1A)
	ld c,01ah		;9bcf
	call 0f37dh		;9bd1
	ld hl,00001h		;9bd4
	call L_9DA3		;9bd7   ; lee HL registros (orden 0x27); error 0 si falla
	ld de,0c25ch		;9bda
	ld c,01ah		;9bdd
	call 0f37dh		;9bdf
	ld hl,00023h		;9be2
	call L_9DA3		;9be5   ; lee HL registros (orden 0x27); error 0 si falla
	ld de,0c282h		;9be8
	ld c,01ah		;9beb
	call 0f37dh		;9bed
	ld hl,00003h		;9bf0
	call L_9DA3		;9bf3   ; lee HL registros (orden 0x27); error 0 si falla
	ld de,0c2c0h		;9bf6
	ld c,01ah		;9bf9
	call 0f37dh		;9bfb
	ld hl,00240h		;9bfe
	call L_9DA3		;9c01   ; lee HL registros (orden 0x27); error 0 si falla
	ld de,0c600h		;9c04
	ld c,01ah		;9c07
	call 0f37dh		;9c09
	ld hl,00200h		;9c0c
	call L_9DA3		;9c0f   ; lee HL registros (orden 0x27); error 0 si falla
	ld de,0c900h		;9c12
	ld c,01ah		;9c15
	call 0f37dh		;9c17
	ld hl,004c0h		;9c1a
	jp L_9DA3		;9c1d
L_9C20:
	di			;9c20   ; graba la fase del editor en el disco (BDOS)
	ld a,(0fd9fh)		;9c21
	ld (0f0e4h),a		;9c24
	ld a,0c9h		;9c27
	ld (0fd9fh),a		;9c29
	ld (0f0e2h),sp		;9c2c
	call L_9DB3		;9c30   ; cambia la RAM del juego con 0xC000-0xD0FF (4352 bytes) y guarda 0xF100 en 0xD780
	ld hl,0c270h		;9c33
	ld de,0ce00h		;9c36
	call L_9D65		;9c39   ; FCB en DE con el nombre de HL sin los espacios de delante
	call L_9E27		;9c3c   ; la extension ELG
	call L_9CF3		;9c3f   ; crea el fichero
	call L_9D26		;9c42   ; el tamano de registro a 1 y el registro actual a 0
	call L_9C57		;9c45   ; escribe los seis trozos
	call L_9D05		;9c48   ; cierra (orden 0x10); error 2 si falla
	di			;9c4b
	call L_9DE7		;9c4c   ; la deja como estaba
	ld a,(0f0e4h)		;9c4f
	ld (0fd9fh),a		;9c52
	ei			;9c55
	ret			;9c56
L_9C57:
	ld de,0c243h		;9c57   ; escribe los seis trozos (orden 0x26)
	ld c,01ah		;9c5a
	call 0f37dh		;9c5c
	ld hl,00001h		;9c5f
	call L_9D93		;9c62   ; escribe HL registros (orden 0x26); error 4 si falla
	ld de,0c25ch		;9c65
	ld c,01ah		;9c68
	call 0f37dh		;9c6a
	ld hl,00023h		;9c6d
	call L_9D93		;9c70   ; escribe HL registros (orden 0x26); error 4 si falla
	ld de,0c282h		;9c73
	ld c,01ah		;9c76
	call 0f37dh		;9c78
	ld hl,00003h		;9c7b
	call L_9D93		;9c7e   ; escribe HL registros (orden 0x26); error 4 si falla
	ld de,0c2c0h		;9c81
	ld c,01ah		;9c84
	call 0f37dh		;9c86
	ld hl,00240h		;9c89
	call L_9D93		;9c8c   ; escribe HL registros (orden 0x26); error 4 si falla
	ld de,0c600h		;9c8f
	ld c,01ah		;9c92
	call 0f37dh		;9c94
	ld hl,00200h		;9c97
	call L_9D93		;9c9a   ; escribe HL registros (orden 0x26); error 4 si falla
	ld de,0c900h		;9c9d
	ld c,01ah		;9ca0
	call 0f37dh		;9ca2
	ld hl,004c0h		;9ca5
	jp L_9D93		;9ca8
L_9CAB:
	di			;9cab   ; la lista de ficheros ELG del disco
	ld a,(0fd9fh)		;9cac
	ld (0f0e4h),a		;9caf
	ld a,0c9h		;9cb2
	ld (0fd9fh),a		;9cb4
	ld (0f0e2h),sp		;9cb7
	call L_9DB3		;9cbb   ; cambia la RAM del juego con 0xC000-0xD0FF (4352 bytes) y guarda 0xF100 en 0xD780
	ld hl,09797h		;9cbe
	ld (0f323h),hl		;9cc1
	call L_9EA8		;9cc4   ; la FCB para buscar: el patron de 0x9E9D
	call L_9D43		;9cc7   ; la lista de nombres 0xCE50 a cero
	xor a			;9cca
	ld (0d0e5h),a		;9ccb
	call L_9E33		;9cce   ; busca los ficheros (ordenes 0x11 y 0x12) y apunta sus nombres, hasta 16
	di			;9cd1
	ld hl,(0d0e7h)		;9cd2
	ld (0f323h),hl		;9cd5
	call L_9DE7		;9cd8   ; la deja como estaba
	ld a,(0f0e4h)		;9cdb
	ld (0fd9fh),a		;9cde
	ei			;9ce1
	ret			;9ce2
L_9CE3:
	ld de,(0d0e0h)		;9ce3   ; abre el fichero (orden 0x0F); error 1 si falla
	ld c,00fh		;9ce7
	call 0f37dh		;9ce9
	ld c,001h		;9cec
	inc a			;9cee
	jp z,L_975E		;9cef
	ret			;9cf2
L_9CF3:
	ld de,(0d0e0h)		;9cf3   ; crea el fichero (orden 0x16); error 3 si falla
	di			;9cf7
	ld c,016h		;9cf8
	call 0f37dh		;9cfa
	ei			;9cfd
	ld c,003h		;9cfe
	inc a			;9d00
	jp z,L_975E		;9d01
	ret			;9d04
L_9D05:
	ld de,(0d0e0h)		;9d05   ; cierra (orden 0x10); error 2 si falla
	ld c,010h		;9d09
	call 0f37dh		;9d0b
	ld c,002h		;9d0e
	inc a			;9d10
	jp z,L_975E		;9d11
	ret			;9d14
L_9D15:
	ld hl,0ce00h		;9d15   ; la FCB 0xCE00 a cero
	ld de,0ce01h		;9d18
	ld (hl),000h		;9d1b
	ld bc,00024h		;9d1d
	ldir		;9d20
	ret			;9d22

; ----------------------------------------------------------------------
; DATOS sin identificar  0x9d23..0x9d26  (3 bytes)
DATA_9D23:
	defb 022h,0e0h,0d0h	; 9d23

; ======================================================================
; CODIGO 0x9d26..0x9e9d  (375 bytes)
; ======================================================================


L_9D26:
	ld hl,(0d0e0h)		;9d26   ; el tamano de registro a 1 y el registro actual a 0
	ld bc,0000ch		;9d29   ; en la FCB: el bloque actual a 0
	add hl,bc			;9d2c
	ld (hl),b			;9d2d
	inc hl			;9d2e
	ld (hl),b			;9d2f
	inc hl			;9d30
	ld bc,00001h		;9d31   ; el tamano del registro a 1
	ld (hl),c			;9d34
	inc hl			;9d35
	ld (hl),b			;9d36
	ld bc,00011h		;9d37   ; el registro aleatorio a 0
	add hl,bc			;9d3a
	ld b,005h		;9d3b
	xor a			;9d3d
L_9D3E:
	ld (hl),a			;9d3e
	inc hl			;9d3f
	djnz L_9D3E		;9d40
	ret			;9d42
L_9D43:
	ld hl,0ce50h		;9d43   ; la lista de nombres 0xCE50 a cero
	ld de,0ce51h		;9d46
	ld (hl),000h		;9d49
	ld bc,000afh		;9d4b
	ldir		;9d4e
	ret			;9d50
L_9D51:
	ld (0d0e0h),de		;9d51   ; FCB en DE con el nombre de HL
	xor a			;9d55
	ld (de),a			;9d56
	inc de			;9d57
	ld bc,0000bh		;9d58
	ldir		;9d5b
	xor a			;9d5d
	ld b,019h		;9d5e
L_9D60:
	ld (de),a			;9d60
	inc de			;9d61
	djnz L_9D60		;9d62
	ret			;9d64
L_9D65:
	ld (0d0e0h),de		;9d65   ; FCB en DE con el nombre de HL sin los espacios de delante
	xor a			;9d69   ; la unidad 0 (la de por defecto)
	ld (de),a			;9d6a
	inc de			;9d6b
	push de			;9d6c   ; el nombre en blanco (11 bytes)
	push hl			;9d6d
	ld h,d			;9d6e
	ld l,e			;9d6f
	inc de			;9d70
	ld (hl),000h		;9d71
	ld bc,0000bh		;9d73
	ldir		;9d76
	pop hl			;9d78
	pop de			;9d79
	ld b,00bh		;9d7a   ; se saltan los espacios de delante del nombre
L_9D7C:
	ld a,(hl)			;9d7c
	or a			;9d7d
	jr nz,L_9D83		;9d7e
	inc hl			;9d80
	djnz L_9D7C		;9d81
L_9D83:
	ld c,b			;9d83   ; copia el resto del nombre
	ld b,000h		;9d84
	ldir		;9d86
	ld de,0ce0ch		;9d88   ; el resto de la FCB a cero
	xor a			;9d8b
	ld b,019h		;9d8c
	ld (de),a			;9d8e
	inc de			;9d8f
	djnz L_9D60		;9d90
	ret			;9d92
L_9D93:
	ld de,(0d0e0h)		;9d93   ; escribe HL registros (orden 0x26); error 4 si falla
	ld c,026h		;9d97
	call 0f37dh		;9d99
	ld c,004h		;9d9c
	or a			;9d9e
	jp nz,L_975E		;9d9f
	ret			;9da2
L_9DA3:
	ld de,(0d0e0h)		;9da3   ; lee HL registros (orden 0x27); error 0 si falla
	ld c,027h		;9da7
	call 0f37dh		;9da9
	ld c,000h		;9dac
	or a			;9dae
	jp nz,L_975E		;9daf
	ret			;9db2
L_9DB3:
	ld hl,0f100h		;9db3   ; cambia la RAM del juego con 0xC000-0xD0FF (4352 bytes) y guarda 0xF100 en 0xD780
	ld de,0d780h		;9db6
	ld bc,00280h		;9db9
	ldir		;9dbc
	ld de,0f0ffh		;9dbe
	ld hl,0d0ffh		;9dc1
	exx			;9dc4
	ld de,0f37fh		;9dc5
	ld bc,01100h		;9dc8
L_9DCB:
	exx			;9dcb   ; cambia un byte de cada zona (de atras hacia delante)
	ld b,(hl)			;9dcc
	ld a,(de)			;9dcd
	dec de			;9dce
	ld (hl),a			;9dcf
	dec hl			;9dd0
	ld a,b			;9dd1
	exx			;9dd2
	ld (de),a			;9dd3
	dec de			;9dd4
	dec bc			;9dd5   ; 0x1100 bytes
	ld a,b			;9dd6
	or c			;9dd7
	jr nz,L_9DCB		;9dd8
	ld hl,00000h		;9dda   ; 0xF1C0 = 0 y 0xF323 = 0x972C
	ld (0f1c0h),hl		;9ddd
	ld hl,0972ch		;9de0
	ld (0f323h),hl		;9de3
	ret			;9de6
L_9DE7:
	call L_9E13		;9de7   ; la deja como estaba
	ld de,0e000h		;9dea
	ld hl,0c000h		;9ded
	exx			;9df0
	ld de,0e280h		;9df1   ; apunta a el estado del personaje
	ld bc,01100h		;9df4
L_9DF7:
	exx			;9df7   ; cambia un byte de cada zona (de delante hacia atras)
	ld a,(hl)			;9df8
	ld (de),a			;9df9
	inc de			;9dfa
	exx			;9dfb
	ld a,(de)			;9dfc
	inc de			;9dfd
	exx			;9dfe
	ld (hl),a			;9dff
	inc hl			;9e00
	exx			;9e01
	dec bc			;9e02
	ld a,b			;9e03
	or c			;9e04
	jr nz,L_9DF7		;9e05
	ld de,0f100h		;9e07   ; y 0xD780 vuelve a 0xF100
	ld hl,0d780h		;9e0a
	ld bc,00280h		;9e0d
	ldir		;9e10
	ret			;9e12
L_9E13:
	ld b,000h		;9e13   ; 256 veces la rutina de 0xD0EA
L_9E15:
	push bc			;9e15
	call 0d0eah		;9e16
	pop bc			;9e19
	djnz L_9E15		;9e1a
	ret			;9e1c
L_9E1D:
	ld b,000h		;9e1d   ; 256 veces la de 0xF0EA
L_9E1F:
	push bc			;9e1f
	call 0f0eah		;9e20
	pop bc			;9e23
	djnz L_9E1F		;9e24
	ret			;9e26
L_9E27:
	ld hl,0ce09h		;9e27   ; la extension: ELG
	ld (hl),045h		;9e2a
	inc hl			;9e2c
	ld (hl),04ch		;9e2d
	inc hl			;9e2f
	ld (hl),047h		;9e30
	ret			;9e32
L_9E33:
	ld de,0ce25h		;9e33   ; busca los ficheros (ordenes 0x11 y 0x12) y apunta sus nombres, hasta 16
	ld c,01ah		;9e36   ; la direccion de transferencia: 0xCE25
	call 0f37dh		;9e38
	ld hl,0c26fh		;9e3b   ; 0xC26F: ya se ha buscado el primero
	ld a,(hl)			;9e3e
	and a			;9e3f
	ld de,0ce00h		;9e40
	jr nz,L_9E4F		;9e43
	inc (hl)			;9e45
	ld c,011h		;9e46   ; orden 0x11: el primero
	call 0f37dh		;9e48
	inc a			;9e4b   ; no hay: Z
	ret z			;9e4c
	jr L_9E5D		;9e4d
L_9E4F:
	ld c,012h		;9e4f   ; orden 0x12: el siguiente
	call 0f37dh		;9e51
	inc a			;9e54
	jr nz,L_9E5D		;9e55
	xor a			;9e57   ; no hay mas: se empieza de nuevo
	ld (0c26fh),a		;9e58
	jr L_9E33		;9e5b
L_9E5D:
	ld hl,0d0e5h		;9e5d   ; uno mas
	inc (hl)			;9e60
	push hl			;9e61
	call L_9E7B		;9e62   ; el nombre encontrado a la lista
	pop hl			;9e65
	ld a,(hl)			;9e66   ; hasta 16
	cp 010h		;9e67
	jr z,L_9E76		;9e69
	ld de,0ce00h		;9e6b
	ld c,012h		;9e6e   ; el siguiente
	call 0f37dh		;9e70
	inc a			;9e73
	jr nz,L_9E5D		;9e74
L_9E76:
	ld a,(0d0e5h)		;9e76
	or a			;9e79
	ret			;9e7a
L_9E7B:
	ld de,0ce26h		;9e7b   ; el nombre encontrado a la lista
	ld a,(0d0e5h)		;9e7e
	dec a			;9e81
	call L_9E8C		;9e82   ; HL = 0xCE50 + 11 x A
	ex de,hl			;9e85
	ld bc,0000bh		;9e86
	ldir		;9e89
	ret			;9e8b
L_9E8C:
	ld l,a			;9e8c   ; HL = 0xCE50 + 11 x A
	ld h,000h		;9e8d
	ld b,h			;9e8f   ; A x 11 (A x 3 x 4 - A)
	ld c,l			;9e90
	add hl,hl			;9e91
	add hl,bc			;9e92
	add hl,hl			;9e93
	add hl,hl			;9e94
	and a			;9e95
	sbc hl,bc		;9e96
	ld bc,0ce50h		;9e98
	add hl,bc			;9e9b
	ret			;9e9c

; ----------------------------------------------------------------------
; DATOS resto_9E9D: lo apuntan con el banco puesto p02:9EB8 (0x9E9D); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p02:9EB8 (11 bytes)
;   0x9e9d..0x9ea8  (11 bytes)
DATA_resto_9E9D:
	defb 03fh,03fh,03fh,03fh,03fh,03fh,03fh,03fh,045h,04ch,047h	; 9e9d  ????????ELG

; ======================================================================
; CODIGO 0x9ea8..0x9ed0  (40 bytes)
; ======================================================================


L_9EA8:
	ld hl,0ce25h		;9ea8   ; la FCB para buscar: el patron de 0x9E9D
	ld de,0ce26h		;9eab
	ld (hl),000h		;9eae
	ld bc,00024h		;9eb0
	ldir		;9eb3
	call L_9D15		;9eb5   ; la FCB 0xCE00 a cero
	ld hl,09e9dh		;9eb8
	ld de,0ce01h		;9ebb
	ld bc,0000bh		;9ebe
	ldir		;9ec1
	ret			;9ec3
L_9EC4:
	call L_9ECA		;9ec4   ; un cuadro del personaje: lo de su estado y sus dibujos
	jp 0a67ch		;9ec7
L_9ECA:
	ld a,(0e280h)		;9eca   ; cada estado del personaje (0xE280), su rutina (tabla detras)
	call 04099h		;9ecd   ; el despachador de Konami: la tabla va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_9ED0: 15 destinos del despachador p00:4099 (call en p02:9ECD, el
;   indice en A): 9EEE, A190, A20F, A2F0, A315, A31C, A350, A36C, A384, A384,
;   A405, A40F, A419, A423, A43C; lo leen p02:9ECD (30 bytes)
;   0x9ed0..0x9eee  (30 bytes)
DATA_tabla_9ED0:
	defw 09eeeh,0a190h,0a20fh,0a2f0h,0a315h,0a31ch,0a350h,0a36ch	; 9ed0
	defw 0a384h,0a384h,0a405h,0a40fh,0a419h,0a423h,0a43ch	; 9ee0

; ======================================================================
; CODIGO 0x9eee..0x9f45  (87 bytes)
; ======================================================================


L_9EEE:
	call 0a624h		;9eee   ; estado 0: andar
	call 0a4efh		;9ef1   ; hacia donde mira (0xE294) segun izquierda y derecha
	call L_9F4D		;9ef4   ; con 0xE2A6: si debajo hay ladrillo, la y se ajusta a la fila y 0xE2A6 = 0
	call 0a512h		;9ef7   ; Z si debajo de los pies no hay nada (tres puntos)
	jr nz,L_9F02		;9efa
	call 0a45eh		;9efc   ; Z si toca escalera a la altura de los pies
	jp nz,L_9FD4		;9eff
L_9F02:
	call 0a045h		;9f02   ; usar lo que lleva (disparo con algo en la mano)
	ld a,(0e280h)		;9f05   ; lee el estado del personaje
	or a			;9f08
	ret nz			;9f09
	call L_9F77		;9f0a   ; las teclas: el disparo (0xA008), arriba (0xA5A2) y abajo (0xA591)
	ld a,(0e280h)		;9f0d   ; lee el estado del personaje
	or a			;9f10
	ret nz			;9f11
	ld a,(0e288h)		;9f12   ; lee las direcciones pulsadas (1 arriba, 2 abajo, 4 izquierda, 8 derecha: la ultima de cada pareja)
	and 00ch		;9f15
	jr z,L_9F3F		;9f17
L_9F19:
	ld hl,0e296h		;9f19   ; al andar, el paso cada 4 cuadros
	dec (hl)			;9f1c
	ret nz			;9f1d
	ld (hl),004h		;9f1e
L_9F20:
	ld a,(0e295h)		;9f20   ; el dibujo del paso (tablas 0x9F45 y 0x9F49 segun hacia donde mira)
	inc a			;9f23
	and 003h		;9f24
	ld b,a			;9f26
	ld (0e295h),a		;9f27   ; guarda el paso de la animacion del personaje
	ld a,(0e294h)		;9f2a   ; lee hacia que lado mira el personaje (0 izquierda, 1 derecha)
	or a			;9f2d
	ld hl,09f45h		;9f2e
	jr z,L_9F36		;9f31
	ld hl,09f49h		;9f33
L_9F36:
	ld a,b			;9f36
	call 0408fh		;9f37   ; suma A a HL (HL = HL + A)
	ld a,(hl)			;9f3a
	ld (0e285h),a		;9f3b   ; guarda el dibujo del personaje (direccion y paso)
	ret			;9f3e
L_9F3F:
	ld a,001h		;9f3f
	ld (0e296h),a		;9f41   ; guarda la cuenta de cuadros del paso de la animacion
	ret			;9f44

; ----------------------------------------------------------------------
; DATOS resto_9F45: lo apuntan con el banco puesto p02:9F2E (0x9F45), p02:9F33
;   (0x9F49); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p02:9F2E, p02:9F33 (8 bytes)
;   0x9f45..0x9f4d  (8 bytes)
DATA_resto_9F45:
	defb 000h,001h,002h,001h,003h,004h,005h,004h	; 9f45  ........

; ======================================================================
; CODIGO 0x9f4d..0xa000  (179 bytes)
; ======================================================================


L_9F4D:
	ld a,(0e2a6h)		;9f4d   ; con 0xE2A6: si debajo hay ladrillo, la y se ajusta a la fila y 0xE2A6 = 0
	or a			;9f50
	ret z			;9f51
	ld a,(0e282h)		;9f52   ; lee la y del personaje
	add a,010h		;9f55
	ld l,a			;9f57
	ld a,(0e294h)		;9f58   ; lee hacia que lado mira el personaje (0 izquierda, 1 derecha)
	or a			;9f5b
	ld a,(0e284h)		;9f5c   ; lee la x del personaje
	jr z,L_9F63		;9f5f
	add a,00fh		;9f61
L_9F63:
	ld h,a			;9f63
	call L_98E2		;9f64   ; A = la casilla del mapa de la pantalla (0xE250) en el pixel (x H, y L)
	sub 002h		;9f67
	ret c			;9f69
	ld a,(0e282h)		;9f6a   ; lee la y del personaje
	and 0f8h		;9f6d
	ld (0e282h),a		;9f6f   ; guarda la y del personaje
	xor a			;9f72
	ld (0e2a6h),a		;9f73   ; guarda la marca de en el aire
	ret			;9f76
L_9F77:
	call 0a452h		;9f77   ; las teclas: el disparo (0xA008), arriba (0xA5A2) y abajo (0xA591)
	jr c,L_9F95		;9f7a
	ld a,(0e207h)		;9f7c   ; lee el mando: lo que se acaba de pulsar
	bit 4,a		;9f7f
	jp nz,0a008h		;9f81
	ld a,(0e208h)		;9f84   ; lee el mando: lo pulsado
	rra			;9f87
	jr nc,L_9F8F		;9f88
	call 0a5a2h		;9f8a   ; subir a una escalera
	jr L_9F95		;9f8d
L_9F8F:
	rra			;9f8f
	jr nc,L_9F9A		;9f90
	call 0a591h		;9f92   ; bajar a una escalera
L_9F95:
	ld a,(0e280h)		;9f95   ; lee el estado del personaje
	or a			;9f98
	ret nz			;9f99
L_9F9A:
	ld a,(0e288h)		;9f9a   ; izquierda o derecha: un paso si no hay pared
	ld de,(0e28eh)		;9f9d   ; lee la velocidad al andar a la izquierda (16 bits)
	ld c,002h		;9fa1
	bit 2,a		;9fa3
	jr nz,L_9FB0		;9fa5
	ld de,(0e290h)		;9fa7   ; lee la velocidad al andar a la derecha (16 bits)
	ld c,003h		;9fab
	bit 3,a		;9fad
	ret z			;9faf
L_9FB0:
	push bc			;9fb0
	ld hl,(0e283h)		;9fb1   ; lee la x del personaje (16 bits: 0xE283 la parte fina)
	add hl,de			;9fb4
	push hl			;9fb5
	ld a,(0e282h)		;9fb6   ; lee la y del personaje
	ld l,a			;9fb9
	call L_9910		;9fba   ; NC si hay pared en la direccion C (tres puntos de la orilla, en el mapa de la pantalla)
	pop hl			;9fbd
	pop bc			;9fbe
	jr c,L_9FD0		;9fbf
L_9FC1:
	ld a,(0e294h)		;9fc1   ; con pared, pegado a ella
	or a			;9fc4
	ld a,007h		;9fc5
	jr z,L_9FCA		;9fc7
	xor a			;9fc9
L_9FCA:
	ld l,000h		;9fca
	add a,h			;9fcc
	and 0f8h		;9fcd
	ld h,a			;9fcf
L_9FD0:
	ld (0e283h),hl		;9fd0   ; guarda la x del personaje (16 bits: 0xE283 la parte fina)
	ret			;9fd3
L_9FD4:
	ld a,001h		;9fd4   ; 0xE2A7 = 1 (o 0 si anda en el suelo) y el paso vuelve al principio
	ld (0e2a7h),a		;9fd6   ; guarda la marca de acabar de caer
	ld a,(0e280h)		;9fd9   ; lee el estado del personaje
	or a			;9fdc
	jr nz,L_9FE9		;9fdd
	ld a,(0e2a6h)		;9fdf   ; lee la marca de en el aire
	or a			;9fe2
	jr nz,L_9FE9		;9fe3
	xor a			;9fe5
	ld (0e2a7h),a		;9fe6   ; guarda la marca de acabar de caer
L_9FE9:
	xor a			;9fe9
	ld (0e295h),a		;9fea   ; guarda el paso de la animacion del personaje
	ld a,007h		;9fed
	ld (0e296h),a		;9fef   ; guarda la cuenta de cuadros del paso de la animacion
	ld b,001h		;9ff2
	ld a,(0e294h)		;9ff4   ; lee hacia que lado mira el personaje (0 izquierda, 1 derecha)
	or a			;9ff7
	jr z,L_9FFC		;9ff8
	ld b,004h		;9ffa
L_9FFC:
	ld a,b			;9ffc
	ld (0e285h),a		;9ffd   ; guarda el dibujo del personaje (direccion y paso)
