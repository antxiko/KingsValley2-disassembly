; ==========================================================================
; KING'S VALLEY II - Konami (1988) - MSX2 - MegaROM RC-761 de 128 KB (Konami SCC) - banco 01 (se ejecuta en 0x6000)
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
l6444h:	equ 0x06444

; ======================================================================
; CODIGO 0x6000..0x6039  (57 bytes)
; ======================================================================


L_6000:
	call 051d0h		;6000
	call 051d0h		;6003
	call 05d41h		;6006
	ld de,0e800h		;6009
	ld hl,06039h		;600c
	ld bc,00020h		;600f
	ldir		;6012
	ld hl,0d200h		;6014
	ld de,0d201h		;6017
	ld bc,00040h		;601a
	ld (hl),00dh		;601d
	ldir		;601f
	ld hl,0d240h		;6021
	ld de,0d241h		;6024
	ld bc,00040h		;6027
	ld (hl),00eh		;602a
	ldir		;602c
	call 0583bh		;602e
	ld a,001h		;6031
	ld (0e2c2h),a		;6033
	ld b,0b4h		;6036
	ret			;6038

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6039..0x6059  (32 bytes)
DATA_6039:
	defb 014h,048h,000h,000h,014h,058h,008h,000h,014h,068h,010h,000h,014h,078h,018h,000h	; 6039  .H...X...h...x..
	defb 014h,048h,004h,000h,014h,058h,00ch,000h,014h,068h,014h,000h,014h,078h,01ch,000h	; 6049  .H...X...h...x..

; ======================================================================
; CODIGO 0x6059..0x605f  (6 bytes)
; ======================================================================


L_6059:
	ld a,(0edc0h)		;6059
	call 04099h		;605c

; ----------------------------------------------------------------------
; DATOS sin identificar  0x605f..0x6067  (8 bytes)
DATA_605F:
	defb 067h,060h,09fh,060h,0c2h,060h,077h,060h	; 605f  g`.`.`w`

; ======================================================================
; CODIGO 0x6067..0x61d9  (370 bytes)
; ======================================================================


L_6067:
	ld a,(0e20ch)		;6067
	rra			;606a
	rra			;606b
	ret nc			;606c
	call 04e98h		;606d
	call L_6078		;6070
L_6073:
	ld hl,0edc0h		;6073
	inc (hl)			;6076
L_6077:
	ret			;6077
L_6078:
	call 041bfh		;6078
	ld hl,0bf36h		;607b
	ld de,00838h		;607e
	ld bc,0128bh		;6081
	call 0514ch		;6084
	ld hl,0bfc6h		;6087
	ld de,09838h		;608a
	ld bc,00607h		;608d
	call 0514ch		;6090
	ld de,0bf29h		;6093
	ld hl,0f800h		;6096
	call 04e54h		;6099
	jp 0418ah		;609c
L_609F:
	call L_62D8		;609f
	call L_60E1		;60a2
	call L_6263		;60a5
	call 05d41h		;60a8
	call L_622F		;60ab
	call L_61E3		;60ae
	call 0583bh		;60b1
	ld de,0c000h		;60b4
	ld hl,0f400h		;60b7
	ld bc,00280h		;60ba
	call 04dfbh		;60bd
	jr L_6073		;60c0
L_60C2:
	ld a,(0e20ch)		;60c2
	rra			;60c5
	rra			;60c6
	ret nc			;60c7
	call 04e98h		;60c8
	call 05bebh		;60cb
	call 05cf5h		;60ce
	call 05859h		;60d1
	call 09866h		;60d4
	call L_6645		;60d7
	xor a			;60da
	ld (0edc0h),a		;60db
	jp 057d8h		;60de
L_60E1:
	call L_60ED		;60e1
	call L_6128		;60e4
	call L_6163		;60e7
	jp L_619E		;60ea
L_60ED:
	ld de,0ed80h		;60ed
	ld b,008h		;60f0
L_60F2:
	ld a,(de)			;60f2
	inc a			;60f3
	ret z			;60f4
	dec a			;60f5
	call L_60FE		;60f6
	inc de			;60f9
	inc de			;60fa
	djnz L_60F2		;60fb
	ret			;60fd
L_60FE:
	push bc			;60fe
	push de			;60ff
	ld c,a			;6100
	and 0f8h		;6101
	rra			;6103
	rra			;6104
	rra			;6105
	ld b,a			;6106
	inc b			;6107
	ld a,0f8h		;6108
	ld e,018h		;610a
L_610C:
	add a,e			;610c
	djnz L_610C		;610d
	ld e,a			;610f
	ld a,c			;6110
	and 007h		;6111
	ld b,a			;6113
	inc b			;6114
	ld a,008h		;6115
	ld d,020h		;6117
L_6119:
	add a,d			;6119
	djnz L_6119		;611a
	ld d,a			;611c
	ld hl,061d9h		;611d
	ld c,0ffh		;6120
	call 051dah		;6122
	pop de			;6125
	pop bc			;6126
	ret			;6127
L_6128:
	ld de,0ed90h		;6128
	ld b,008h		;612b
L_612D:
	ld a,(de)			;612d
	inc a			;612e
	ret z			;612f
	dec a			;6130
	call L_6139		;6131
	inc de			;6134
	inc de			;6135
	djnz L_612D		;6136
	ret			;6138
L_6139:
	push bc			;6139
	push de			;613a
	ld c,a			;613b
	and 0f8h		;613c
	rra			;613e
	rra			;613f
	rra			;6140
	ld b,a			;6141
	inc b			;6142
	ld a,018h		;6143
	ld e,018h		;6145
L_6147:
	add a,e			;6147
	djnz L_6147		;6148
	ld e,a			;614a
	ld a,c			;614b
	and 007h		;614c
	ld b,a			;614e
	inc b			;614f
	ld a,008h		;6150
	ld d,020h		;6152
L_6154:
	add a,d			;6154
	djnz L_6154		;6155
	ld d,a			;6157
	ld hl,061dch		;6158
	ld c,0ffh		;615b
	call 051dah		;615d
	pop de			;6160
	pop bc			;6161
	ret			;6162
L_6163:
	ld de,0eda0h		;6163
	ld b,008h		;6166
L_6168:
	ld a,(de)			;6168
	inc a			;6169
	ret z			;616a
	dec a			;616b
	call L_6174		;616c
	inc de			;616f
	inc de			;6170
	djnz L_6168		;6171
	ret			;6173
L_6174:
	push bc			;6174
	push de			;6175
	ld c,a			;6176
	and 0f8h		;6177
	rra			;6179
	rra			;617a
	rra			;617b
	ld b,a			;617c
	inc b			;617d
	ld a,008h		;617e
	ld e,018h		;6180
L_6182:
	add a,e			;6182
	djnz L_6182		;6183
	ld e,a			;6185
	ld a,c			;6186
	and 007h		;6187
	ld b,a			;6189
	inc b			;618a
	ld a,0f8h		;618b
	ld d,020h		;618d
L_618F:
	add a,d			;618f
	djnz L_618F		;6190
	ld d,a			;6192
	ld hl,061dfh		;6193
	ld c,0ffh		;6196
	call 051dah		;6198
	pop de			;619b
	pop bc			;619c
	ret			;619d
L_619E:
	ld de,0edb0h		;619e
	ld b,008h		;61a1
L_61A3:
	ld a,(de)			;61a3
	inc a			;61a4
	ret z			;61a5
	dec a			;61a6
	call L_61AF		;61a7
	inc de			;61aa
	inc de			;61ab
	djnz L_61A3		;61ac
	ret			;61ae
L_61AF:
	push bc			;61af
	push de			;61b0
	ld c,a			;61b1
	and 0f8h		;61b2
	rra			;61b4
	rra			;61b5
	rra			;61b6
	ld b,a			;61b7
	inc b			;61b8
	ld a,008h		;61b9
	ld e,018h		;61bb
L_61BD:
	add a,e			;61bd
	djnz L_61BD		;61be
	ld e,a			;61c0
	ld a,c			;61c1
	and 007h		;61c2
	ld b,a			;61c4
	inc b			;61c5
	ld a,020h		;61c6
	ld d,020h		;61c8
L_61CA:
	add a,d			;61ca
	djnz L_61CA		;61cb
	ld d,a			;61cd
	ld hl,061e1h		;61ce
	ld c,0ffh		;61d1
	call 051dah		;61d3
	pop de			;61d6
	pop bc			;61d7
	ret			;61d8

; ----------------------------------------------------------------------
; DATOS sin identificar  0x61d9..0x61e3  (10 bytes)
DATA_61D9:
	defb 0f3h,0f4h,0ffh,0f5h,0f6h,0ffh,0f7h,0ffh,0f8h,0ffh	; 61d9  ..........

; ======================================================================
; CODIGO 0x61e3..0x62cc  (233 bytes)
; ======================================================================


L_61E3:
	ld a,(0e243h)		;61e3
	ld hl,0e788h		;61e6
	ld c,007h		;61e9
L_61EB:
	ld b,008h		;61eb
L_61ED:
	cp (hl)			;61ed
	jr z,L_61F7		;61ee
	inc hl			;61f0
	djnz L_61ED		;61f1
	dec c			;61f3
	jr nz,L_61EB		;61f4
	ret			;61f6
L_61F7:
	ld hl,0e282h		;61f7
	call L_6301		;61fa
	ld a,(hl)			;61fd
	ld c,a			;61fe
	inc hl			;61ff
	inc hl			;6200
	rra			;6201
	rra			;6202
	rra			;6203
	and 01fh		;6204
	add a,e			;6206
	ld e,a			;6207
	ld a,(hl)			;6208
	ld b,a			;6209
	rra			;620a
	rra			;620b
	rra			;620c
	and 01fh		;620d
	add a,d			;620f
	ld d,a			;6210
	call L_6315		;6211
	ld hl,0e804h		;6214
	dec e			;6217
	ld (hl),e			;6218
	inc hl			;6219
	ld a,d			;621a
	sub 003h		;621b
	ld (hl),a			;621d
	inc hl			;621e
	ld (hl),004h		;621f
	ld de,0d211h		;6221
	ld hl,0d210h		;6224
	ld bc,0000fh		;6227
	ld (hl),007h		;622a
	ldir		;622c
	ret			;622e
L_622F:
	ld a,(0e2f3h)		;622f
	ld hl,0e788h		;6232
	ld c,007h		;6235
L_6237:
	ld b,008h		;6237
L_6239:
	cp (hl)			;6239
	jr z,L_6243		;623a
	inc hl			;623c
	djnz L_6239		;623d
	dec c			;623f
	jr nz,L_6237		;6240
	ret			;6242
L_6243:
	ld hl,0e2f1h		;6243
	call L_62B5		;6246
	call L_6315		;6249
	ld hl,0e800h		;624c
	ld (hl),e			;624f
	inc hl			;6250
	ld (hl),d			;6251
	inc hl			;6252
	ld (hl),000h		;6253
	ld de,0d201h		;6255
	ld hl,0d200h		;6258
	ld bc,0000fh		;625b
	ld (hl),00bh		;625e
	ldir		;6260
	ret			;6262
L_6263:
	ld hl,0e700h		;6263
	ld b,010h		;6266
L_6268:
	ld a,(hl)			;6268
	or a			;6269
	call nz,L_6274		;626a
	ld de,00008h		;626d
	add hl,de			;6270
	djnz L_6268		;6271
	ret			;6273
L_6274:
	push hl			;6274
	push bc			;6275
	call L_627C		;6276
	pop bc			;6279
	pop hl			;627a
	ret			;627b
L_627C:
	inc hl			;627c
	ld a,(hl)			;627d
	inc hl			;627e
	ld (0efc0h),hl		;627f
	ld hl,0e788h		;6282
	ld c,007h		;6285
L_6287:
	ld b,008h		;6287
L_6289:
	cp (hl)			;6289
	jr z,L_6294		;628a
	inc hl			;628c
	djnz L_6289		;628d
	dec c			;628f
	jr nz,L_6287		;6290
	pop hl			;6292
	ret			;6293
L_6294:
	ld hl,(0efc0h)		;6294
	call L_62B5		;6297
	call L_6315		;629a
	ld a,b			;629d
	rlca			;629e
	rlca			;629f
	and 003h		;62a0
	ld b,a			;62a2
	ld a,c			;62a3
	rra			;62a4
	rra			;62a5
	rra			;62a6
	rra			;62a7
	and 00ch		;62a8
	add a,b			;62aa
	ld hl,062cch		;62ab
	call 0408fh		;62ae
	ld a,(hl)			;62b1
	jp 05767h		;62b2
L_62B5:
	call L_6301		;62b5
	ld a,(hl)			;62b8
	ld c,a			;62b9
	inc hl			;62ba
	rra			;62bb
	rra			;62bc
	rra			;62bd
	and 018h		;62be
	add a,e			;62c0
	ld e,a			;62c1
	ld a,(hl)			;62c2
	ld b,a			;62c3
	rra			;62c4
	rra			;62c5
	rra			;62c6
	and 018h		;62c7
	add a,d			;62c9
	ld d,a			;62ca
	ret			;62cb

; ----------------------------------------------------------------------
; DATOS sin identificar  0x62cc..0x62d8  (12 bytes)
DATA_62CC:
	defb 0eah,0ebh,0ebh,0ech,0edh,0eeh,0eeh,0efh,0f0h,0f1h,0f1h,0f2h	; 62cc  ............

; ======================================================================
; CODIGO 0x62d8..0x631e  (70 bytes)
; ======================================================================


L_62D8:
	ld hl,0e788h		;62d8
	ld c,007h		;62db
L_62DD:
	ld b,008h		;62dd
L_62DF:
	ld a,(hl)			;62df
	or a			;62e0
	call nz,L_62EB		;62e1
	inc hl			;62e4
	djnz L_62DF		;62e5
	dec c			;62e7
	jr nz,L_62DD		;62e8
	ret			;62ea
L_62EB:
	push af			;62eb
	push bc			;62ec
	push hl			;62ed
	call L_62F5		;62ee
	pop hl			;62f1
	pop bc			;62f2
	pop af			;62f3
	ret			;62f4
L_62F5:
	call L_6301		;62f5
	call L_6315		;62f8
	ld hl,0631eh		;62fb
	jp 051fah		;62fe
L_6301:
	ld a,008h		;6301
	sub b			;6303
	add a,a			;6304
	add a,a			;6305
	add a,a			;6306
	add a,a			;6307
	add a,a			;6308
	ld d,a			;6309
	ld a,007h		;630a
	sub c			;630c
	add a,a			;630d
	add a,a			;630e
	add a,a			;630f
	ld e,a			;6310
	add a,a			;6311
	add a,e			;6312
	ld e,a			;6313
	ret			;6314
L_6315:
	ld a,d			;6315
	add a,020h		;6316
	ld d,a			;6318
	ld a,e			;6319
	add a,018h		;631a
	ld e,a			;631c
	ret			;631d

; ----------------------------------------------------------------------
; DATOS sin identificar  0x631e..0x632d  (15 bytes)
DATA_631E:
	defb 0e1h,0e2h,0e2h,0e3h,0feh,0e4h,0e5h,0e5h,0e6h,0feh,0e7h,0e8h,0e8h,0e9h,0ffh	; 631e  ...............

; ======================================================================
; CODIGO 0x632d..0x6445  (280 bytes)
; ======================================================================


L_632D:
	call 041bfh		;632d
	call L_6336		;6330
	jp 0418ah		;6333
L_6336:
	ld a,(0e242h)		;6336
	ld hl,0aae0h		;6339
	call 04d4ch		;633c
	ld ix,0e600h		;633f
L_6343:
	ld a,(hl)			;6343
	ld b,a			;6344
	and a			;6345
	ret z			;6346
	rrca			;6347
	rrca			;6348
	rrca			;6349
	rrca			;634a
	and 00fh		;634b
	ld (ix+000h),a		;634d
	ld a,(hl)			;6350
	and 00fh		;6351
	ld (ix+004h),a		;6353
	ld (ix+009h),a		;6356
	inc hl			;6359
	ld a,(hl)			;635a
	ld (ix+002h),a		;635b
	inc hl			;635e
	ld a,(hl)			;635f
	ld (ix+003h),a		;6360
	inc hl			;6363
	ld a,(hl)			;6364
	rrca			;6365
	rrca			;6366
	rrca			;6367
	and 01fh		;6368
	ld (ix+008h),a		;636a
	ld a,(hl)			;636d
	and 007h		;636e
	jr z,L_6378		;6370
	set 1,(ix+007h)		;6372
	jr L_637C		;6376
L_6378:
	res 1,(ix+007h)		;6378
L_637C:
	ld b,a			;637c
	add a,a			;637d
	add a,b			;637e
	ld b,a			;637f
	ld a,(ix+000h)		;6380
	cp 001h		;6383
	jr z,L_6389		;6385
	ld b,000h		;6387
L_6389:
	ld (ix+005h),b		;6389
	ld (ix+006h),000h		;638c
	inc hl			;6390
	ld de,00010h		;6391
	add ix,de		;6394
	jr L_6343		;6396
L_6398:
	ld c,003h		;6398
	jr L_639E		;639a
L_639C:
	ld c,000h		;639c
L_639E:
	ld b,010h		;639e
	ld ix,0e600h		;63a0
L_63A4:
	push bc			;63a4
	ld a,(ix+000h)		;63a5
	and a			;63a8
	call nz,L_63B5		;63a9
	ld bc,00010h		;63ac
	add ix,bc		;63af
	pop bc			;63b1
	djnz L_63A4		;63b2
	ret			;63b4
L_63B5:
	cp 003h		;63b5
	ret z			;63b7
	cp 005h		;63b8
	jr nz,L_63C6		;63ba
	ld a,c			;63bc
	and a			;63bd
	jp z,095f8h		;63be
	ld a,(ix+001h)		;63c1
	and a			;63c4
	ret nz			;63c5
L_63C6:
	ld h,(ix+003h)		;63c6
	ld l,(ix+002h)		;63c9
	cp 002h		;63cc
	jr nz,L_63DA		;63ce
	bit 1,(ix+007h)		;63d0
	jr z,L_63DA		;63d4
	ld a,h			;63d6
	add a,008h		;63d7
	ld h,a			;63d9
L_63DA:
	ld a,(ix+000h)		;63da
	ld de,l6444h		;63dd
	call 04094h		;63e0
	ld a,(de)			;63e3
	ld d,a			;63e4
	ld a,c			;63e5
	ld b,(ix+008h)		;63e6
	ld c,d			;63e9
	ld d,(ix+004h)		;63ea
L_63ED:
	ld (0efc0h),a		;63ed
	ld a,d			;63f0
	ld (0efc1h),a		;63f1
	call 04d7bh		;63f4
	ld de,03800h		;63f7
	or a			;63fa
	sbc hl,de		;63fb
L_63FD:
	push hl			;63fd
	push bc			;63fe
	ld b,c			;63ff
L_6400:
	push hl			;6400
	ld c,l			;6401
	srl h		;6402
	rr l		;6404
	srl h		;6406
	rr l		;6408
	ld a,l			;640a
	ld hl,(0efc1h)		;640b
	dec l			;640e
	ld h,000h		;640f
	call 05d32h		;6411
	call 0408fh		;6414
	push bc			;6417
	ld a,0fch		;6418
	call L_6439		;641a
	and (hl)			;641d
	ld (hl),a			;641e
	ld a,(0efc0h)		;641f
	and a			;6422
	jr z,L_642A		;6423
	call L_6439		;6425
	or (hl)			;6428
	ld (hl),a			;6429
L_642A:
	pop bc			;642a
	pop hl			;642b
	inc hl			;642c
	djnz L_6400		;642d
	pop bc			;642f
	pop hl			;6430
	ld a,020h		;6431
	call 0408fh		;6433
	djnz L_63FD		;6436
	ret			;6438
L_6439:
	push af			;6439
	ld a,c			;643a
	and 003h		;643b
	inc a			;643d
	ld b,a			;643e
	pop af			;643f
L_6440:
	rrca			;6440
	rrca			;6441
	djnz L_6440		;6442
L_6444:
	ret			;6444

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6445..0x644a  (5 bytes)
DATA_6445:
	defb 002h,001h,001h,004h,002h	; 6445

; ======================================================================
; CODIGO 0x644a..0x64a4  (90 bytes)
; ======================================================================


L_644A:
	ld ix,0e600h		;644a
	ld b,010h		;644e
L_6450:
	push bc			;6450
	ld a,(ix+000h)		;6451
	and a			;6454
	call nz,L_64BC		;6455
	ld bc,00010h		;6458
	add ix,bc		;645b
	pop bc			;645d
	djnz L_6450		;645e
	ret			;6460
L_6461:
	ld ix,0e600h		;6461
	ld b,010h		;6465
L_6467:
	push bc			;6467
	ld a,(ix+000h)		;6468
	cp 005h		;646b
	jr nz,L_647A		;646d
	ld a,(0e243h)		;646f
	cp (ix+004h)		;6472
	jr nz,L_647A		;6475
	call 09661h		;6477
L_647A:
	ld bc,00010h		;647a
	add ix,bc		;647d
	pop bc			;647f
	djnz L_6467		;6480
	ret			;6482
L_6483:
	ld ix,0e600h		;6483
	ld b,010h		;6487
L_6489:
	push bc			;6489
	call L_649B		;648a
	call L_64AE		;648d
	ld bc,00010h		;6490
	add ix,bc		;6493
	pop bc			;6495
	djnz L_6489		;6496
	jp 0bc74h		;6498
L_649B:
	ld a,(ix+000h)		;649b
	and a			;649e
	ret z			;649f
	dec a			;64a0
	call 04099h		;64a1

; ----------------------------------------------------------------------
; DATOS sin identificar  0x64a4..0x64ae  (10 bytes)
DATA_64A4:
	defb 085h,0bah,0b0h,0bbh,0c0h,0bch,021h,0bdh,0f3h,093h	; 64a4  ......!...

; ======================================================================
; CODIGO 0x64ae..0x64cf  (33 bytes)
; ======================================================================


L_64AE:
	ld a,(ix+007h)		;64ae
	rra			;64b1
	ret nc			;64b2
	res 0,(ix+007h)		;64b3
	ld hl,064cfh		;64b7
	jr L_64C6		;64ba
L_64BC:
	ld hl,064d9h		;64bc
	ld a,(0e243h)		;64bf
	cp (ix+004h)		;64c2
	ret nz			;64c5
L_64C6:
	ld a,(ix+000h)		;64c6
	and a			;64c9
	ret z			;64ca
	dec a			;64cb
	jp 0409ah		;64cc

; ----------------------------------------------------------------------
; DATOS sin identificar  0x64cf..0x64e3  (20 bytes)
DATA_64CF:
	defb 043h,0bbh,050h,0bch,0e2h,0bch,060h,064h,036h,096h,043h,0bbh,050h,0bch,060h,064h	; 64cf  C.P...`d6.C.P.`d
	defb 0aah,0bdh,060h,064h	; 64df

; ======================================================================
; CODIGO 0x64e3..0x65fe  (283 bytes)
; ======================================================================


L_64E3:
	ld hl,0e700h		;64e3
	ld b,080h		;64e6
	xor a			;64e8
L_64E9:
	ld (hl),a			;64e9
	inc hl			;64ea
	djnz L_64E9		;64eb
	call 041bfh		;64ed
	call L_64F6		;64f0
	jp 0418ah		;64f3
L_64F6:
	ld a,(0e242h)		;64f6
	ld hl,0a75dh		;64f9
	call 04d4ch		;64fc
	ld de,0e700h		;64ff
L_6502:
	ld a,(hl)			;6502
	and a			;6503
	ret z			;6504
	rra			;6505
	rra			;6506
	rra			;6507
	rra			;6508
	and 00fh		;6509
	ld (de),a			;650b
	ld a,(hl)			;650c
	and 00fh		;650d
	inc e			;650f
	ld (de),a			;6510
	inc e			;6511
	inc hl			;6512
	ldi		;6513
	ldi		;6515
	inc e			;6517
	inc e			;6518
	inc e			;6519
	inc e			;651a
	jr L_6502		;651b
L_651D:
	ld bc,01000h		;651d
	ld ix,0e700h		;6520
L_6524:
	push bc			;6524
	ld a,(ix+000h)		;6525
	and a			;6528
	call nz,L_6536		;6529
	ld de,00008h		;652c
	add ix,de		;652f
	pop bc			;6531
	inc c			;6532
	djnz L_6524		;6533
	ret			;6535
L_6536:
	ld a,(0e243h)		;6536
	cp (ix+001h)		;6539
	ret nz			;653c
L_653D:
	ld hl,09324h		;653d
	ld e,(ix+002h)		;6540
	ld d,(ix+003h)		;6543
	ld bc,00202h		;6546
	jp 0573bh		;6549
L_654C:
	ld ix,0e500h		;654c
	ld b,008h		;6550
L_6552:
	push bc			;6552
	ld a,(ix+000h)		;6553
	and a			;6556
	jr z,L_6563		;6557
	call L_65F6		;6559
	bit 0,(ix+006h)		;655c
	call nz,L_656C		;6560
L_6563:
	ld de,00020h		;6563
	add ix,de		;6566
	pop bc			;6568
	djnz L_6552		;6569
	ret			;656b
L_656C:
	ld a,(ix+00bh)		;656c
	cp 002h		;656f
	jr c,L_6595		;6571
	ld l,(ix+004h)		;6573
	ld h,(ix+005h)		;6576
	ld e,(ix+009h)		;6579
	ld d,(ix+00ah)		;657c
	jr z,L_658E		;657f
	add hl,de			;6581
	ld a,h			;6582
	cp 0f1h		;6583
	jr nc,L_65C1		;6585
L_6587:
	ld (ix+004h),l		;6587
	ld (ix+005h),h		;658a
	ret			;658d
L_658E:
	and a			;658e
	sbc hl,de		;658f
	jr c,L_65B7		;6591
	jr L_6587		;6593
L_6595:
	ld l,(ix+002h)		;6595
	ld h,(ix+003h)		;6598
	ld e,(ix+007h)		;659b
	ld d,(ix+008h)		;659e
	and a			;65a1
	jr nz,L_65AA		;65a2
	sbc hl,de		;65a4
	jr c,L_65CB		;65a6
	jr L_65B0		;65a8
L_65AA:
	add hl,de			;65aa
	ld a,h			;65ab
	cp 0b1h		;65ac
	jr nc,L_65D5		;65ae
L_65B0:
	ld (ix+002h),l		;65b0
	ld (ix+003h),h		;65b3
	ret			;65b6
L_65B7:
	ld a,003h		;65b7
	call L_65DF		;65b9
	ld hl,0f000h		;65bc
	jr L_6587		;65bf
L_65C1:
	ld a,004h		;65c1
	call L_65DF		;65c3
	ld hl,00000h		;65c6
	jr L_6587		;65c9
L_65CB:
	ld a,001h		;65cb
	call L_65DF		;65cd
	ld hl,0b000h		;65d0
	jr L_65B0		;65d3
L_65D5:
	ld a,002h		;65d5
	call L_65DF		;65d7
	ld hl,00000h		;65da
	jr L_65B0		;65dd
L_65DF:
	ld b,(ix+016h)		;65df
	call 05e38h		;65e2
	ld (ix+016h),h		;65e5
	ld (ix+010h),l		;65e8
	ld a,l			;65eb
	call 0ad15h		;65ec
	ld (ix+00ch),e		;65ef
	ld (ix+00dh),d		;65f2
	ret			;65f5
L_65F6:
	ld a,(ix+000h)		;65f6
	dec a			;65f9
	ret m			;65fa
	call 04099h		;65fb

; ----------------------------------------------------------------------
; DATOS sin identificar  0x65fe..0x6608  (10 bytes)
DATA_65FE:
	defb 080h,0adh,023h,0aeh,0aah,0b2h,08eh,0b6h,02dh,066h	; 65fe  ..#.....-f

; ======================================================================
; CODIGO 0x6608..0x663d  (53 bytes)
; ======================================================================


L_6608:
	ld a,(0e243h)		;6608
	cp (ix+010h)		;660b
	call z,042b7h		;660e
	ld (ix+000h),005h		;6611
	xor a			;6615
	ld (ix+013h),a		;6616
	ld (ix+014h),a		;6619
	ld (ix+006h),a		;661c
	ld a,(0f0f4h)		;661f
	and a			;6622
	ret z			;6623
	ld (ix+01eh),00ah		;6624
	ld (ix+01fh),04bh		;6628
	ret			;662c
L_662D:
	ld hl,0663dh		;662d
	ld de,06641h		;6630
	call 0b6e0h		;6633
	jp z,L_6706		;6636
	ld (ix+011h),a		;6639
	ret			;663c

; ----------------------------------------------------------------------
; DATOS sin identificar  0x663d..0x6645  (8 bytes)
DATA_663D:
	defb 015h,016h,017h,0ffh,015h,016h,016h,0ffh	; 663d  ........

; ======================================================================
; CODIGO 0x6645..0x6865  (544 bytes)
; ======================================================================


L_6645:
	call L_6664		;6645
	ld a,(0f0f4h)		;6648
	and a			;664b
	ret z			;664c
	ld hl,0e843h		;664d
	ld de,0d300h		;6650
	ld c,010h		;6653
L_6655:
	ld a,(hl)			;6655
	ld b,010h		;6656
L_6658:
	ld (de),a			;6658
	inc de			;6659
	djnz L_6658		;665a
	inc hl			;665c
	inc hl			;665d
	inc hl			;665e
	inc hl			;665f
	dec c			;6660
	jr nz,L_6655		;6661
	ret			;6663
L_6664:
	ld ix,0e500h		;6664
	ld de,0e840h		;6668
	ld b,008h		;666b
	ld a,(0f0f4h)		;666d
	and a			;6670
	jr z,L_66B9		;6671
L_6673:
	push bc			;6673
	ld a,(ix+000h)		;6674
	and a			;6677
	jr z,L_66AB		;6678
	ld a,(0e243h)		;667a
	cp (ix+010h)		;667d
	jr nz,L_66AB		;6680
	ld l,(ix+011h)		;6682
	ld a,l			;6685
	inc a			;6686
	jr z,L_66AB		;6687
	ld h,000h		;6689
	add hl,hl			;668b
	call 041bfh		;668c
	ld bc,0beedh		;668f
	add hl,bc			;6692
	ld c,(ix+01eh)		;6693
	call L_66F3		;6696
	ld c,(ix+01fh)		;6699
	call L_66F3		;669c
	call 0418ah		;669f
L_66A2:
	ld bc,00020h		;66a2
	add ix,bc		;66a5
	pop bc			;66a7
	djnz L_6673		;66a8
	ret			;66aa
L_66AB:
	ld a,0e0h		;66ab
	ld (de),a			;66ad
	inc e			;66ae
	inc e			;66af
	inc e			;66b0
	inc e			;66b1
	ld (de),a			;66b2
	inc e			;66b3
	inc e			;66b4
	inc e			;66b5
	inc e			;66b6
	jr L_66A2		;66b7
L_66B9:
	push bc			;66b9
	ld a,(ix+000h)		;66ba
	and a			;66bd
	jr z,L_66EA		;66be
	ld a,(0e243h)		;66c0
	cp (ix+010h)		;66c3
	jr nz,L_66EA		;66c6
	ld l,(ix+011h)		;66c8
	ld a,l			;66cb
	inc a			;66cc
	jr z,L_66EA		;66cd
	ld h,000h		;66cf
	call 041bfh		;66d1
	ld bc,0becfh		;66d4
	add hl,bc			;66d7
	ld c,(ix+01eh)		;66d8
	call L_66F3		;66db
	call 0418ah		;66de
L_66E1:
	ld bc,00020h		;66e1
	add ix,bc		;66e4
	pop bc			;66e6
	djnz L_66B9		;66e7
	ret			;66e9
L_66EA:
	ld a,0e0h		;66ea
	ld (de),a			;66ec
	inc e			;66ed
	inc e			;66ee
	inc e			;66ef
	inc e			;66f0
	jr L_66E1		;66f1
L_66F3:
	ld a,(ix+003h)		;66f3
	dec a			;66f6
	ld (de),a			;66f7
	inc e			;66f8
	ld a,(ix+005h)		;66f9
	ld (de),a			;66fc
	inc e			;66fd
	ld a,(hl)			;66fe
	ld (de),a			;66ff
	inc hl			;6700
	inc e			;6701
	ld a,c			;6702
	ld (de),a			;6703
	inc e			;6704
	ret			;6705
L_6706:
	xor a			;6706
	ld (ix+000h),a		;6707
	ld (ix+013h),a		;670a
	ld a,(ix+015h)		;670d
	ld c,a			;6710
	add a,a			;6711
	add a,a			;6712
	add a,c			;6713
	ld hl,0e2c0h		;6714
	call 0408fh		;6717
	set 7,(hl)		;671a
	ret			;671c
L_671D:
	ld a,(0e203h)		;671d
	and 003h		;6720
	ret nz			;6722
	ld hl,0e2c0h		;6723
	ld bc,00800h		;6726
L_6729:
	push bc			;6729
	push hl			;672a
	bit 7,(hl)		;672b
	jr z,L_6744		;672d
	inc hl			;672f
	dec (hl)			;6730
	jr nz,L_6744		;6731
	ld b,c			;6733
	dec hl			;6734
	res 7,(hl)		;6735
	ld c,(hl)			;6737
	inc hl			;6738
	ld (hl),030h		;6739
	inc hl			;673b
	ld a,(hl)			;673c
	inc hl			;673d
	ld e,(hl)			;673e
	inc hl			;673f
	ld d,(hl)			;6740
	call 0ac6dh		;6741
L_6744:
	pop hl			;6744
	pop bc			;6745
	inc hl			;6746
	inc hl			;6747
	inc hl			;6748
	inc hl			;6749
	inc hl			;674a
	inc c			;674b
	djnz L_6729		;674c
	ret			;674e
L_674F:
	call 041bfh		;674f
	ld hl,0e2c0h		;6752
	ld b,028h		;6755
	xor a			;6757
L_6758:
	ld (hl),a			;6758
	inc hl			;6759
	djnz L_6758		;675a
	ld hl,0b7cdh		;675c
	ld a,(0e242h)		;675f
	call 04d4ch		;6762
	ld de,0e2c0h		;6765
L_6768:
	ld a,(hl)			;6768
	inc hl			;6769
	and a			;676a
	jp z,0418ah		;676b
	or 080h		;676e
	ld (de),a			;6770
	inc e			;6771
	ld a,014h		;6772
	ld (de),a			;6774
	inc e			;6775
	ldi		;6776
	ldi		;6778
	ldi		;677a
	jr L_6768		;677c
L_677E:
	call 04e98h		;677e
	call 041b5h		;6781
	ld hl,0b185h		;6784
	call 051d0h		;6787
	call 0418ah		;678a
	xor a			;678d
	ld (0e24bh),a		;678e
	jp L_67EC		;6791
L_6794:
	call 0583bh		;6794
	ld hl,0e24bh		;6797
	ld a,(0e207h)		;679a
	rra			;679d
	jr c,L_67AE		;679e
	rra			;67a0
	jr c,L_67BA		;67a1
	rra			;67a3
	rra			;67a4
	rra			;67a5
	jr nc,L_67C5		;67a6
	ld a,001h		;67a8
	ld (0e24ah),a		;67aa
	ret			;67ad
L_67AE:
	call 042cbh		;67ae
	dec (hl)			;67b1
	ld a,(hl)			;67b2
	rla			;67b3
	jr nc,L_67C5		;67b4
	ld (hl),002h		;67b6
	jr L_67C5		;67b8
L_67BA:
	call 042cbh		;67ba
	inc (hl)			;67bd
	ld a,(hl)			;67be
	cp 003h		;67bf
	jr c,L_67C5		;67c1
	ld (hl),000h		;67c3
L_67C5:
	ld a,(hl)			;67c5
	add a,a			;67c6
	add a,a			;67c7
	add a,a			;67c8
	add a,a			;67c9
	add a,050h		;67ca
	ld hl,0e800h		;67cc
	ld (hl),a			;67cf
	inc hl			;67d0
	ld (hl),050h		;67d1
	inc hl			;67d3
	ld (hl),014h		;67d4
	inc hl			;67d6
	ld (hl),008h		;67d7
	ld a,(0f0f4h)		;67d9
	and a			;67dc
	ret z			;67dd
	ld hl,0d200h		;67de
	ld de,0d201h		;67e1
	ld (hl),007h		;67e4
	ld bc,0000fh		;67e6
	ldir		;67e9
	ret			;67eb
L_67EC:
	call 041b5h		;67ec
	ld a,(0f0f4h)		;67ef
	and a			;67f2
	ld de,018a0h		;67f3
	jr z,L_67FB		;67f6
	ld de,0f8a0h		;67f8
L_67FB:
	ld hl,0b1b6h		;67fb
	ld bc,00020h		;67fe
	call 04e05h		;6801
	jp 0418ah		;6804
L_6807:
	call 04e98h		;6807
	ld bc,0a201h		;680a
	call 00047h		;680d   ; BIOS WRTVDP - Writes data in the VDP-register
	call 05970h		;6810
	call 05b52h		;6813
	call 05ad8h		;6816
	call 05d41h		;6819
	ld a,004h		;681c
	call 059dch		;681e
	ld bc,0e201h		;6821
	call 00047h		;6824   ; BIOS WRTVDP - Writes data in the VDP-register
	xor a			;6827
	ld (0e257h),a		;6828
	ld (0edcch),a		;682b
	ld (0edc9h),a		;682e
	ld (0edceh),a		;6831
	inc a			;6834
	ld (0edd8h),a		;6835
	ld a,0e0h		;6838
	ld (0edcbh),a		;683a
	ret			;683d
L_683E:
	ld a,(0e257h)		;683e
	cp 009h		;6841
	jr nc,L_684D		;6843
	ld a,(0e207h)		;6845
	and 010h		;6848
	jp nz,L_6945		;684a
L_684D:
	call L_685B		;684d
	ld a,(0e257h)		;6850
	cp 009h		;6853
	call c,L_7786		;6855
	jp 0583bh		;6858
L_685B:
	ld hl,0edc9h		;685b
	inc (hl)			;685e
	ld a,(0e257h)		;685f
	call 04099h		;6862

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6865..0x687b  (22 bytes)
DATA_6865:
	defb 07bh,068h,089h,068h,095h,068h,0b1h,068h,0fbh,068h,014h,069h,023h,069h,026h,069h	; 6865  {h.h.h.h.h.i#i&i
	defb 033h,069h,040h,069h,071h,069h	; 6875

; ======================================================================
; CODIGO 0x687b..0x68dd  (98 bytes)
; ======================================================================


L_687B:
	call 05d41h		;687b
	ld a,010h		;687e
L_6880:
	ld hl,0e204h		;6880
	ld (hl),a			;6883
L_6884:
	ld hl,0e257h		;6884
	inc (hl)			;6887
	ret			;6888
L_6889:
	ld hl,0e204h		;6889
	dec (hl)			;688c
	ret nz			;688d
	ld a,0a8h		;688e
	ld (0edcbh),a		;6890
	jr L_6884		;6893
L_6895:
	call L_776A		;6895
	ld a,(0edc9h)		;6898
	rra			;689b
	ret c			;689c
	ld hl,0edcch		;689d
	inc (hl)			;68a0
	ld a,(hl)			;68a1
	cp 060h		;68a2
	ret c			;68a4
	ld a,001h		;68a5
	ld (0edd8h),a		;68a7
	ld a,0ffh		;68aa
	ld (0edceh),a		;68ac
	jr L_6884		;68af
L_68B1:
	ld a,(0edc9h)		;68b1
	rra			;68b4
	ret c			;68b5
	ld hl,0edceh		;68b6
	inc (hl)			;68b9
	ld a,(hl)			;68ba
	cp 01eh		;68bb
	jr nc,L_68D1		;68bd
	ld hl,068ddh		;68bf
	call 0408fh		;68c2
	ld a,(0edcbh)		;68c5
	add a,(hl)			;68c8
	ld (0edcbh),a		;68c9
	ld hl,0edcch		;68cc
	inc (hl)			;68cf
	ret			;68d0
L_68D1:
	ld a,0a0h		;68d1
	ld (0edcbh),a		;68d3
	ld a,002h		;68d6
	ld (0edd8h),a		;68d8
	jr L_6884		;68db

; ----------------------------------------------------------------------
; DATOS sin identificar  0x68dd..0x68fb  (30 bytes)
DATA_68DD:
	defb 0fdh,0fdh,0fdh,0fdh,0feh,0feh,0feh,0feh,0feh,0ffh,0ffh,0ffh,0ffh,000h,000h,000h	; 68dd  ................
	defb 000h,000h,000h,001h,001h,001h,001h,002h,002h,002h,002h,002h,003h,003h	; 68ed  ..............

; ======================================================================
; CODIGO 0x68fb..0x69ff  (260 bytes)
; ======================================================================


L_68FB:
	call L_776A		;68fb
	ld a,(0edc9h)		;68fe
	rra			;6901
	ret c			;6902
	ld hl,0edcch		;6903
	inc (hl)			;6906
	ld a,(hl)			;6907
	cp 0d8h		;6908
	ret c			;690a
	xor a			;690b
	ld (0edd8h),a		;690c
	ld a,010h		;690f
	jp L_6880		;6911
L_6914:
	ld a,006h		;6914
L_6916:
	ld hl,0e204h		;6916
	dec (hl)			;6919
	ret nz			;691a
	ld (0edd8h),a		;691b
	ld a,010h		;691e
	jp L_6880		;6920
L_6923:
	xor a			;6923
	jr L_6916		;6924
L_6926:
	ld hl,0e204h		;6926
	dec (hl)			;6929
	ret nz			;692a
	ld a,008h		;692b
	call L_77D7		;692d
	jp L_6884		;6930
L_6933:
	call L_781C		;6933
	ld a,(0e880h)		;6936
	or a			;6939
	ret nz			;693a
	ld a,020h		;693b
	jp L_6880		;693d
L_6940:
	ld hl,0e204h		;6940
	dec (hl)			;6943
	ret nz			;6944
L_6945:
	call 04e98h		;6945
	call 04ecbh		;6948
	call 05d41h		;694b
	ld bc,0a201h		;694e
	call 00047h		;6951   ; BIOS WRTVDP - Writes data in the VDP-register
	ld de,05040h		;6954
	call 059afh		;6957
	ld bc,0e201h		;695a
	call 00047h		;695d   ; BIOS WRTVDP - Writes data in the VDP-register
	ld hl,0ac01h		;6960
	call L_771C		;6963
	ld a,080h		;6966
	ld (0e204h),a		;6968
	ld a,00ah		;696b
	ld (0e257h),a		;696d
	ret			;6970
L_6971:
	ld hl,0e204h		;6971
	dec (hl)			;6974
	ret nz			;6975
	ld a,001h		;6976
	ld (0e24ah),a		;6978
	ret			;697b
L_697C:
	call L_6994		;697c
	ld a,0ffh		;697f
	ld (0ede1h),a		;6981
	ld hl,069ffh		;6984
	call 051d0h		;6987
	ld de,05ca0h		;698a
	ld hl,0edd9h		;698d
	call 051dah		;6990
	ret			;6993
L_6994:
	ld de,0ede2h		;6994
	ld a,(0e242h)		;6997
	ld (de),a			;699a
	inc de			;699b
	ld h,a			;699c
	ld a,(0e240h)		;699d
	ld (de),a			;69a0
	inc de			;69a1
	ld l,a			;69a2
	ld a,r		;69a3
	ld (de),a			;69a5
	ld c,a			;69a6
	and 007h		;69a7
	jr z,L_69B7		;69a9
	ld b,a			;69ab
L_69AC:
	rr h		;69ac
	rr l		;69ae
	jr nc,L_69B4		;69b0
	set 7,h		;69b2
L_69B4:
	or a			;69b4
	djnz L_69AC		;69b5
L_69B7:
	ld de,0edd9h		;69b7
	ld a,h			;69ba
	ld (0ede5h),a		;69bb
	call L_69E0		;69be
	ld h,l			;69c1
	ld a,h			;69c2
	ld (0ede6h),a		;69c3
	call L_69E0		;69c6
	ld h,c			;69c9
	ld a,h			;69ca
	ld (0ede7h),a		;69cb
	call L_69E0		;69ce
	ld hl,0ede5h		;69d1
	ld a,(hl)			;69d4
	inc hl			;69d5
	add a,(hl)			;69d6
	inc hl			;69d7
	add a,(hl)			;69d8
	inc hl			;69d9
	ld (hl),a			;69da
	ld h,a			;69db
	call L_69E0		;69dc
	ret			;69df
L_69E0:
	ld a,h			;69e0
	rrca			;69e1
	rrca			;69e2
	rrca			;69e3
	rrca			;69e4
	and 00fh		;69e5
	call L_69F5		;69e7
	ld (de),a			;69ea
	inc de			;69eb
	ld a,h			;69ec
	and 00fh		;69ed
	call L_69F5		;69ef
	ld (de),a			;69f2
	inc de			;69f3
	ret			;69f4
L_69F5:
	ld b,0e1h		;69f5
	cp 019h		;69f7
	jr c,L_69FD		;69f9
	ld b,0d1h		;69fb
L_69FD:
	add a,b			;69fd
	ret			;69fe

; ----------------------------------------------------------------------
; DATOS sin identificar  0x69ff..0x6a0b  (12 bytes)
DATA_69FF:
	defb 058h,090h,0f0h,0e1h,0f3h,0f3h,000h,0f7h,0efh,0f2h,0e4h,0ffh	; 69ff  X...........

; ======================================================================
; CODIGO 0x6a0b..0x6b57  (332 bytes)
; ======================================================================


L_6A0B:
	call 04e98h		;6a0b
	call L_7AA6		;6a0e
	ld hl,0edd9h		;6a11
	ld de,0eddah		;6a14
	ld bc,00025h		;6a17
	ld (hl),a			;6a1a
	ldir		;6a1b
	ld a,020h		;6a1d
	ld (0edeeh),a		;6a1f
	xor a			;6a22
	ld (0e207h),a		;6a23
	call 041bfh		;6a26
	ld hl,0be91h		;6a29
	call 051d0h		;6a2c
	jp 0418ah		;6a2f
L_6A32:
	call 0583bh		;6a32
	ld hl,0edebh		;6a35
	ld a,(hl)			;6a38
	or a			;6a39
	jr z,L_6A4A		;6a3a
	inc hl			;6a3c
	dec (hl)			;6a3d
	ret nz			;6a3e
	inc hl			;6a3f
	ld a,(hl)			;6a40
	ld (0e24ah),a		;6a41
	ld hl,0edebh		;6a44
	ld (hl),000h		;6a47
	ret			;6a49
L_6A4A:
	call L_6B67		;6a4a
	ld hl,0edefh		;6a4d
	ld a,(0e207h)		;6a50
	rra			;6a53
	rra			;6a54
	rra			;6a55
	jp c,L_6B7F		;6a56
	rra			;6a59
	jp c,L_6B86		;6a5a
	call L_6C2E		;6a5d
	call L_6B8E		;6a60
	ld a,(0ededh)		;6a63
	or a			;6a66
	jr z,L_6A6C		;6a67
	call L_6C01		;6a69
L_6A6C:
	ld a,(0edf7h)		;6a6c
	rla			;6a6f
	ret c			;6a70
	ld hl,0edd9h		;6a71
	ld b,008h		;6a74
L_6A76:
	ld a,(hl)			;6a76
	ld d,0e1h		;6a77
	cp d			;6a79
	jr nc,L_6A7E		;6a7a
	ld d,0d0h		;6a7c
L_6A7E:
	sub d			;6a7e
	ld (hl),a			;6a7f
	inc hl			;6a80
	djnz L_6A76		;6a81
	call L_6B24		;6a83
	jp z,L_6AF8		;6a86
	ld hl,0edd9h		;6a89
	ld b,007h		;6a8c
	ld a,(hl)			;6a8e
	inc hl			;6a8f
L_6A90:
	add a,(hl)			;6a90
	inc hl			;6a91
	djnz L_6A90		;6a92
	or a			;6a94
	jp z,L_6B05		;6a95
	ld hl,0edd9h		;6a98
	ld b,008h		;6a9b
L_6A9D:
	ld a,(hl)			;6a9d
	or a			;6a9e
	jr c,L_6B05		;6a9f
	cp 010h		;6aa1
	jr nc,L_6B05		;6aa3
	inc hl			;6aa5
	djnz L_6A9D		;6aa6
	ld hl,0ede2h		;6aa8
	ld a,(hl)			;6aab
	inc hl			;6aac
	add a,(hl)			;6aad
	inc hl			;6aae
	add a,(hl)			;6aaf
	inc hl			;6ab0
	cp (hl)			;6ab1
	jr nz,L_6B05		;6ab2
	ld hl,0edd9h		;6ab4
	ld de,0ede2h		;6ab7
	ld b,004h		;6aba
L_6ABC:
	ld a,(hl)			;6abc
	inc hl			;6abd
	rlca			;6abe
	rlca			;6abf
	rlca			;6ac0
	rlca			;6ac1
	and 0f0h		;6ac2
	or (hl)			;6ac4
	inc hl			;6ac5
	ld (de),a			;6ac6
	inc de			;6ac7
	djnz L_6ABC		;6ac8
	ld hl,0ede2h		;6aca
	ld d,(hl)			;6acd
	inc hl			;6ace
	ld e,(hl)			;6acf
	inc hl			;6ad0
	ld a,(hl)			;6ad1
	and 007h		;6ad2
	ld b,a			;6ad4
L_6AD5:
	rl e		;6ad5
	rl d		;6ad7
	jr nc,L_6ADD		;6ad9
	set 0,e		;6adb
L_6ADD:
	or a			;6add
	djnz L_6AD5		;6ade
	ld a,d			;6ae0
	cp 03dh		;6ae1
	jr nc,L_6B05		;6ae3
	push de			;6ae5
	call 04c01h		;6ae6
	pop de			;6ae9
	ld a,d			;6aea
	or a			;6aeb
	jr z,L_6B05		;6aec
	ld (0e242h),a		;6aee
	ld a,e			;6af1
	or a			;6af2
	jr z,L_6B05		;6af3
	ld (0e240h),a		;6af5
L_6AF8:
	ld hl,0edebh		;6af8
	inc (hl)			;6afb
	inc hl			;6afc
	inc hl			;6afd
	ld (hl),001h		;6afe
	ld hl,0bebeh		;6b00
	jr L_6B10		;6b03
L_6B05:
	ld hl,0edebh		;6b05
	inc (hl)			;6b08
	inc hl			;6b09
	inc hl			;6b0a
	ld (hl),002h		;6b0b
	ld hl,0beadh		;6b0d
L_6B10:
	call 041bfh		;6b10
	call 051d0h		;6b13
	call 0418ah		;6b16
	call 05d41h		;6b19
	ld hl,0edebh		;6b1c
	inc (hl)			;6b1f
	inc hl			;6b20
	ld (hl),080h		;6b21
	ret			;6b23
L_6B24:
	ld de,06b57h		;6b24
	call L_6B47		;6b27
	jr z,L_6B3D		;6b2a
	ld de,06b5fh		;6b2c
	call L_6B47		;6b2f
	ret nz			;6b32
	call 04c01h		;6b33
	ld a,001h		;6b36
	ld (0e217h),a		;6b38
	xor a			;6b3b
	ret			;6b3c
L_6B3D:
	call 04c01h		;6b3d
	ld a,001h		;6b40
	ld (0e255h),a		;6b42
	xor a			;6b45
	ret			;6b46
L_6B47:
	ld hl,0edd9h		;6b47
	ld b,008h		;6b4a
L_6B4C:
	ld a,(de)			;6b4c
	sub 041h		;6b4d
	cp (hl)			;6b4f
	ret nz			;6b50
	inc hl			;6b51
	inc de			;6b52
	djnz L_6B4C		;6b53
	xor a			;6b55
	ret			;6b56

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6b57..0x6b67  (16 bytes)
DATA_6B57:
	defb 046h,045h,053h,054h,049h,056h,041h,04ch,054h,052h,059h,041h,047h,041h,049h,04eh	; 6b57  FESTIVALTRYAGAIN

; ======================================================================
; CODIGO 0x6b67..0x6c26  (191 bytes)
; ======================================================================


L_6B67:
	ld hl,0e800h		;6b67
	ld (hl),06fh		;6b6a
	inc hl			;6b6c
	ld a,(0edefh)		;6b6d
	ld de,06c26h		;6b70
	call 04094h		;6b73
	ld a,(de)			;6b76
	ld (hl),a			;6b77
	inc hl			;6b78
	ld (hl),020h		;6b79
	inc hl			;6b7b
	jp 0898eh		;6b7c
L_6B7F:
	ld a,(hl)			;6b7f
	and a			;6b80
	ret z			;6b81
	dec (hl)			;6b82
	jp 042cbh		;6b83
L_6B86:
	ld a,(hl)			;6b86
	cp 007h		;6b87
	ret nc			;6b89
	inc (hl)			;6b8a
	jp 042cbh		;6b8b
L_6B8E:
	ld a,(0edf0h)		;6b8e
	ld bc,008d0h		;6b91
L_6B94:
	rra			;6b94
	jr nc,L_6BC2		;6b95
	inc c			;6b97
	djnz L_6B94		;6b98
	ld a,(0edf1h)		;6b9a
	ld b,002h		;6b9d
L_6B9F:
	rra			;6b9f
	jr nc,L_6BC2		;6ba0
	inc c			;6ba2
	djnz L_6B9F		;6ba3
	ld a,(0edf9h)		;6ba5
	ld b,005h		;6ba8
	ld c,0d0h		;6baa
	rra			;6bac
	rra			;6bad
	rra			;6bae
L_6BAF:
	rra			;6baf
	jr nc,L_6BC2		;6bb0
	inc c			;6bb2
	djnz L_6BAF		;6bb3
	ld a,(0edfah)		;6bb5
	ld b,005h		;6bb8
L_6BBA:
	rra			;6bba
	jr nc,L_6BC2		;6bbb
	inc c			;6bbd
	djnz L_6BBA		;6bbe
	jr L_6BC5		;6bc0
L_6BC2:
	ld a,c			;6bc2
	jr L_6BF4		;6bc3
L_6BC5:
	ld a,(0edf8h)		;6bc5
	rra			;6bc8
	jr c,L_6BCF		;6bc9
	ld a,0e0h		;6bcb
	jr L_6BF4		;6bcd
L_6BCF:
	ld a,(0edf2h)		;6bcf
	ld d,0e2h		;6bd2
	rla			;6bd4
	jr nc,L_6BF3		;6bd5
	ld d,0e1h		;6bd7
	rla			;6bd9
	jr nc,L_6BF3		;6bda
	ld hl,0edf3h		;6bdc
	ld d,0e3h		;6bdf
	ld c,003h		;6be1
L_6BE3:
	ld b,008h		;6be3
	ld a,(hl)			;6be5
L_6BE6:
	rra			;6be6
	jr nc,L_6BF3		;6be7
	inc d			;6be9
	djnz L_6BE6		;6bea
	inc hl			;6bec
	dec c			;6bed
	jr nz,L_6BE3		;6bee
	xor a			;6bf0
	jr L_6BF4		;6bf1
L_6BF3:
	ld a,d			;6bf3
L_6BF4:
	ld hl,0edeeh		;6bf4
	ld c,(hl)			;6bf7
	ld (hl),a			;6bf8
	cp c			;6bf9
	jr nz,L_6BFD		;6bfa
	xor a			;6bfc
L_6BFD:
	ld (0ededh),a		;6bfd
	ret			;6c00
L_6C01:
	ld a,(0edefh)		;6c01
	ld hl,06c26h		;6c04
	call 0408fh		;6c07
	ld d,(hl)			;6c0a
	ld e,070h		;6c0b
	ld a,(0ededh)		;6c0d
	call 0576ah		;6c10
	ld a,(0edefh)		;6c13
	ld hl,0edd9h		;6c16
	call 0408fh		;6c19
	ld a,(0ededh)		;6c1c
	ld (hl),a			;6c1f
	ld hl,0edefh		;6c20
	jp L_6B86		;6c23

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6c26..0x6c2e  (8 bytes)
DATA_6C26:
	defb 060h,068h,070h,078h,080h,088h,090h,098h	; 6c26  `hpx....

; ======================================================================
; CODIGO 0x6c2e..0x6c6d  (63 bytes)
; ======================================================================


L_6C2E:
	ld hl,0edfah		;6c2e
	ld b,00bh		;6c31
L_6C33:
	ld a,b			;6c33
	dec a			;6c34
	call 00141h		;6c35   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	ld (hl),a			;6c38
	dec hl			;6c39
	djnz L_6C33		;6c3a
	ret			;6c3c
L_6C3D:
	ld a,(0fd9fh)		;6c3d
	ld (0f0e4h),a		;6c40
	ld a,0c9h		;6c43
	ld (0fd9fh),a		;6c45
	call L_6C85		;6c48
	call L_6CA7		;6c4b
	ld a,(0f0e4h)		;6c4e
	ld (0fd9fh),a		;6c51
	ret			;6c54
L_6C55:
	ld a,(0fd9fh)		;6c55
	ld (0f0e4h),a		;6c58
	ld a,0c9h		;6c5b
	ld (0fd9fh),a		;6c5d
	call L_6C85		;6c60
	call L_6D57		;6c63
	ld a,(0f0e4h)		;6c66
	ld (0fd9fh),a		;6c69
	ret			;6c6c

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6c6d..0x6c85  (24 bytes)
DATA_6C6D:
	defb 043h,0e2h,001h,000h,05ch,0e2h,023h,000h,082h,0e2h,003h,000h,0c0h,0e2h,040h,002h	; 6c6d  C...\.#.......@.
	defb 000h,0e6h,000h,002h,000h,0e9h,0c0h,004h	; 6c7d  ........

; ======================================================================
; CODIGO 0x6c85..0x6e28  (419 bytes)
; ======================================================================


L_6C85:
	ld hl,0e270h		;6c85
	ld de,0ee00h		;6c88
	ld (0f0e0h),de		;6c8b
	ld bc,00005h		;6c8f
	ldir		;6c92
	ld de,0ee05h		;6c94
	xor a			;6c97
	ld b,008h		;6c98
L_6C9A:
	ld (de),a			;6c9a
	inc de			;6c9b
	djnz L_6C9A		;6c9c
	inc de			;6c9e
	inc de			;6c9f
	inc de			;6ca0
	inc de			;6ca1
	ld a,(0f0e9h)		;6ca2
	ld (de),a			;6ca5
	ret			;6ca6
L_6CA7:
	ld de,(0f0e0h)		;6ca7
	ld a,(0f0f7h)		;6cab
	ld h,080h		;6cae
	call 00024h		;6cb0   ; BIOS ENASLT - Switches to specified slot and page definitively
	ld a,004h		;6cb3
	ld (08000h),a		;6cb5
	ld c,000h		;6cb8
	ld de,(0f0e0h)		;6cba
	call 08000h		;6cbe
	push af			;6cc1
	ld a,(0f0e9h)		;6cc2
	ld h,080h		;6cc5
	call 00024h		;6cc7   ; BIOS ENASLT - Switches to specified slot and page definitively
	pop af			;6cca
	ld de,(0f0e0h)		;6ccb
	ld a,(0f0f7h)		;6ccf
	ld h,080h		;6cd2
	call 00024h		;6cd4   ; BIOS ENASLT - Switches to specified slot and page definitively
	ld a,004h		;6cd7
	ld (08000h),a		;6cd9
	ld c,002h		;6cdc
	ld de,(0f0e0h)		;6cde
	call 08000h		;6ce2
	push af			;6ce5
	ld a,(0f0e9h)		;6ce6
	ld h,080h		;6ce9
	call 00024h		;6ceb   ; BIOS ENASLT - Switches to specified slot and page definitively
	pop af			;6cee
	ld b,006h		;6cef
	ld hl,06c6dh		;6cf1
L_6CF4:
	push bc			;6cf4
	ld de,0ee0dh		;6cf5
	ld bc,00004h		;6cf8
	ldir		;6cfb
	push hl			;6cfd
	ld de,(0f0e0h)		;6cfe
	ld a,(0f0f7h)		;6d02
	ld h,080h		;6d05
	call 00024h		;6d07   ; BIOS ENASLT - Switches to specified slot and page definitively
	ld a,004h		;6d0a
	ld (08000h),a		;6d0c
	ld c,009h		;6d0f
	ld de,(0f0e0h)		;6d11
	call 08000h		;6d15
	push af			;6d18
	ld a,(0f0e9h)		;6d19
	ld h,080h		;6d1c
	call 00024h		;6d1e   ; BIOS ENASLT - Switches to specified slot and page definitively
	pop af			;6d21
	pop hl			;6d22
	pop bc			;6d23
	or a			;6d24
	jp nz,L_6E02		;6d25
	djnz L_6CF4		;6d28
	ld de,(0f0e0h)		;6d2a
	ld a,(0f0f7h)		;6d2e
	ld h,080h		;6d31
	call 00024h		;6d33   ; BIOS ENASLT - Switches to specified slot and page definitively
	ld a,004h		;6d36
	ld (08000h),a		;6d38
	ld c,001h		;6d3b
	ld de,(0f0e0h)		;6d3d
	call 08000h		;6d41
	push af			;6d44
	ld a,(0f0e9h)		;6d45
	ld h,080h		;6d48
	call 00024h		;6d4a   ; BIOS ENASLT - Switches to specified slot and page definitively
	pop af			;6d4d
	or a			;6d4e
	jp nz,L_6E02		;6d4f
	xor a			;6d52
	ld (0e27fh),a		;6d53
	ret			;6d56
L_6D57:
	ld de,(0f0e0h)		;6d57
	ld a,(0f0f7h)		;6d5b
	ld h,080h		;6d5e
	call 00024h		;6d60   ; BIOS ENASLT - Switches to specified slot and page definitively
	ld a,004h		;6d63
	ld (08000h),a		;6d65
	ld c,000h		;6d68
	ld de,(0f0e0h)		;6d6a
	call 08000h		;6d6e
	push af			;6d71
	ld a,(0f0e9h)		;6d72
	ld h,080h		;6d75
	call 00024h		;6d77   ; BIOS ENASLT - Switches to specified slot and page definitively
	pop af			;6d7a
	ld de,(0f0e0h)		;6d7b
	ld a,(0f0f7h)		;6d7f
	ld h,080h		;6d82
	call 00024h		;6d84   ; BIOS ENASLT - Switches to specified slot and page definitively
	ld a,004h		;6d87
	ld (08000h),a		;6d89
	ld c,002h		;6d8c
	ld de,(0f0e0h)		;6d8e
	call 08000h		;6d92
	push af			;6d95
	ld a,(0f0e9h)		;6d96
	ld h,080h		;6d99
	call 00024h		;6d9b   ; BIOS ENASLT - Switches to specified slot and page definitively
	pop af			;6d9e
	ld b,006h		;6d9f
	ld hl,06c6dh		;6da1
L_6DA4:
	push bc			;6da4
	ld de,0ee0dh		;6da5
	ld bc,00004h		;6da8
	ldir		;6dab
	push hl			;6dad
	ld de,(0f0e0h)		;6dae
	ld a,(0f0f7h)		;6db2
	ld h,080h		;6db5
	call 00024h		;6db7   ; BIOS ENASLT - Switches to specified slot and page definitively
	ld a,004h		;6dba
	ld (08000h),a		;6dbc
	ld c,008h		;6dbf
	ld de,(0f0e0h)		;6dc1
	call 08000h		;6dc5
	push af			;6dc8
	ld a,(0f0e9h)		;6dc9
	ld h,080h		;6dcc
	call 00024h		;6dce   ; BIOS ENASLT - Switches to specified slot and page definitively
	pop af			;6dd1
	pop hl			;6dd2
	pop bc			;6dd3
	djnz L_6DA4		;6dd4
	ld de,(0f0e0h)		;6dd6
	ld a,(0f0f7h)		;6dda
	ld h,080h		;6ddd
	call 00024h		;6ddf   ; BIOS ENASLT - Switches to specified slot and page definitively
	ld a,004h		;6de2
	ld (08000h),a		;6de4
	ld c,001h		;6de7
	ld de,(0f0e0h)		;6de9
	call 08000h		;6ded
	push af			;6df0
	ld a,(0f0e9h)		;6df1
	ld h,080h		;6df4
	call 00024h		;6df6   ; BIOS ENASLT - Switches to specified slot and page definitively
	pop af			;6df9
	or a			;6dfa
	jr nz,L_6E22		;6dfb
	xor a			;6dfd
	ld (0e27fh),a		;6dfe
	ret			;6e01
L_6E02:
	ld a,(0f0f7h)		;6e02
	ld h,080h		;6e05
	call 00024h		;6e07   ; BIOS ENASLT - Switches to specified slot and page definitively
	ld a,004h		;6e0a
	ld (08000h),a		;6e0c
	ld c,006h		;6e0f
	ld de,(0f0e0h)		;6e11
	call 08000h		;6e15
	push af			;6e18
	ld a,(0f0e9h)		;6e19
	ld h,080h		;6e1c
	call 00024h		;6e1e   ; BIOS ENASLT - Switches to specified slot and page definitively
	pop af			;6e21
L_6E22:
	ld a,002h		;6e22
	ld (0e27fh),a		;6e24
	ret			;6e27

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6e28..0x6e2d  (5 bytes)
DATA_6E28:
	defb 046h,049h,04ch,045h,03fh	; 6e28

; ======================================================================
; CODIGO 0x6e2d..0x6f6e  (321 bytes)
; ======================================================================


L_6E2D:
	di			;6e2d
	ld a,(0fd9fh)		;6e2e
	ld (0f0e4h),a		;6e31
	ld a,0c9h		;6e34
	ld (0fd9fh),a		;6e36
	ld hl,0ee50h		;6e39
	ld de,0ee51h		;6e3c
	ld bc,00020h		;6e3f
	ld (hl),000h		;6e42
	ldir		;6e44
	ld hl,06e28h		;6e46
	ld de,0ee00h		;6e49
	ld bc,00005h		;6e4c
	ldir		;6e4f
	ld hl,0ee50h		;6e51
	ld (0ee0dh),hl		;6e54
	ld de,0ee00h		;6e57
	ld (0f0e0h),de		;6e5a
	ld a,(0f0f7h)		;6e5e
	ld h,080h		;6e61
	call 00024h		;6e63   ; BIOS ENASLT - Switches to specified slot and page definitively
	ld a,004h		;6e66
	ld (08000h),a		;6e68
	ld c,003h		;6e6b
	ld de,(0f0e0h)		;6e6d
	call 08000h		;6e71
	push af			;6e74
	ld a,(0f0e9h)		;6e75
	ld h,080h		;6e78
	call 00024h		;6e7a   ; BIOS ENASLT - Switches to specified slot and page definitively
	pop af			;6e7d
	and a			;6e7e
	jr nz,L_6EAE		;6e7f
L_6E81:
	ld hl,(0ee0dh)		;6e81
	ld a,008h		;6e84
	call 0408fh		;6e86
	ld (0ee0dh),hl		;6e89
	ld a,(0f0f7h)		;6e8c
	ld h,080h		;6e8f
	call 00024h		;6e91   ; BIOS ENASLT - Switches to specified slot and page definitively
	ld a,004h		;6e94
	ld (08000h),a		;6e96
	ld c,004h		;6e99
	ld de,(0f0e0h)		;6e9b
	call 08000h		;6e9f
	push af			;6ea2
	ld a,(0f0e9h)		;6ea3
	ld h,080h		;6ea6
	call 00024h		;6ea8   ; BIOS ENASLT - Switches to specified slot and page definitively
	pop af			;6eab
	jr z,L_6E81		;6eac
L_6EAE:
	ld a,(0f0e4h)		;6eae
	ld (0fd9fh),a		;6eb1
	ei			;6eb4
	xor a			;6eb5
	ld (0f0e5h),a		;6eb6
	ld de,0ee50h		;6eb9
L_6EBC:
	ld a,(de)			;6ebc
	or a			;6ebd
	ret z			;6ebe
	push de			;6ebf
	ld a,(de)			;6ec0
	cp 046h		;6ec1
	jr nz,L_6ED7		;6ec3
	inc de			;6ec5
	ld a,(de)			;6ec6
	cp 049h		;6ec7
	jr nz,L_6ED7		;6ec9
	inc de			;6ecb
	ld a,(de)			;6ecc
	cp 04ch		;6ecd
	jr nz,L_6ED7		;6ecf
	inc de			;6ed1
	ld a,(de)			;6ed2
	cp 045h		;6ed3
	jr z,L_6EDF		;6ed5
L_6ED7:
	pop de			;6ed7
L_6ED8:
	ld a,008h		;6ed8
	call 04094h		;6eda
	jr L_6EBC		;6edd
L_6EDF:
	pop de			;6edf
	ld hl,0f0e5h		;6ee0
	inc (hl)			;6ee3
	ld a,(hl)			;6ee4
	cp 003h		;6ee5
	ret nc			;6ee7
	jr L_6ED8		;6ee8
L_6EEA:
	ld b,000h		;6eea
	ld a,(0ffa7h)		;6eec
	cp 0c9h		;6eef
	jr z,L_6EF4		;6ef1
	inc b			;6ef3
L_6EF4:
	push bc			;6ef4
	call L_6F06		;6ef5
	pop bc			;6ef8
	ld a,(0f0f7h)		;6ef9
	inc a			;6efc
	jr z,L_6F01		;6efd
	set 1,b		;6eff
L_6F01:
	ld a,b			;6f01
	ld (0f0f9h),a		;6f02
	ret			;6f05
L_6F06:
	ld bc,00400h		;6f06
	ld hl,0fcc1h		;6f09
L_6F0C:
	push bc			;6f0c
	push hl			;6f0d
	ld a,(hl)			;6f0e
	bit 7,a		;6f0f
	jr nz,L_6F19		;6f11
	ld a,c			;6f13
	call L_6F39		;6f14
	jr L_6F1C		;6f17
L_6F19:
	call L_6F29		;6f19
L_6F1C:
	pop hl			;6f1c
	pop bc			;6f1d
	ret c			;6f1e
	inc hl			;6f1f
	inc c			;6f20
	djnz L_6F0C		;6f21
	ld a,0ffh		;6f23
	ld (0f0f7h),a		;6f25
	ret			;6f28
L_6F29:
	and 080h		;6f29
	or c			;6f2b
	ld b,004h		;6f2c
L_6F2E:
	push bc			;6f2e
	call L_6F39		;6f2f
	pop bc			;6f32
	ret c			;6f33
	add a,004h		;6f34
	djnz L_6F2E		;6f36
	ret			;6f38
L_6F39:
	ld (0f0f7h),a		;6f39
	ld hl,04010h		;6f3c
	call 0000ch		;6f3f   ; BIOS RDSLT - Reads the value of an address in another slot
	cp 059h		;6f42
	jr nz,L_6F58		;6f44
	ld hl,04011h		;6f46
	ld a,(0f0f7h)		;6f49
	call 0000ch		;6f4c   ; BIOS RDSLT - Reads the value of an address in another slot
	cp 05ah		;6f4f
	jr nz,L_6F58		;6f51
	ld a,(0f0f7h)		;6f53
	scf			;6f56
	ret			;6f57
L_6F58:
	ld a,(0f0f7h)		;6f58
	and a			;6f5b
	ret			;6f5c
L_6F5D:
	call L_6F63		;6f5d
	jp 0583bh		;6f60
L_6F63:
	ld hl,0edc9h		;6f63
	inc (hl)			;6f66
	ld a,(0e257h)		;6f67
	dec a			;6f6a
	call 04099h		;6f6b

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6f6e..0x6f84  (22 bytes)
DATA_6F6E:
	defb 084h,06fh,0e5h,06fh,0fdh,06fh,047h,070h,062h,070h,078h,070h,08dh,070h,09ah,070h	; 6f6e  .o.o.oGpbpxp.p.p
	defb 0bdh,070h,0cdh,070h,0f3h,070h	; 6f7e

; ======================================================================
; CODIGO 0x6f84..0x7177  (499 bytes)
; ======================================================================


L_6F84:
	call 05fa6h		;6f84
	ld bc,00007h		;6f87
	call 04e19h		;6f8a
	call 041cch		;6f8d
	ld hl,0a870h		;6f90
	call 04f1ch		;6f93
	call 0418ah		;6f96
	call 05961h		;6f99
	call 05b16h		;6f9c
	call 05d41h		;6f9f
	call 05a5ch		;6fa2
	ld hl,071cah		;6fa5
	call L_6FD5		;6fa8
	xor a			;6fab
	ld (0edc8h),a		;6fac
	call 04e98h		;6faf
	ld bc,0a201h		;6fb2
	call 00047h		;6fb5   ; BIOS WRTVDP - Writes data in the VDP-register
	call 059ach		;6fb8
	call 05a8ch		;6fbb
	call L_71C1		;6fbe
	ld bc,0e201h		;6fc1
	call 00047h		;6fc4   ; BIOS WRTVDP - Writes data in the VDP-register
	call 0421ch		;6fc7
	ld a,03ch		;6fca
L_6FCC:
	ld hl,0e204h		;6fcc
	ld (hl),a			;6fcf
L_6FD0:
	ld hl,0e257h		;6fd0
	inc (hl)			;6fd3
	ret			;6fd4
L_6FD5:
	ld a,(0e241h)		;6fd5
	dec a			;6fd8
	add a,a			;6fd9
	call 0408fh		;6fda
	ld de,0edcbh		;6fdd
	ldi		;6fe0
	ldi		;6fe2
	ret			;6fe4
L_6FE5:
	call L_71C1		;6fe5
	ld hl,0e204h		;6fe8
	dec (hl)			;6feb
	ret nz			;6fec
	xor a			;6fed
	ld (0edd8h),a		;6fee
	inc a			;6ff1
	ld (0edceh),a		;6ff2
	call L_71A5		;6ff5
	ld a,008h		;6ff8
	jp L_6FCC		;6ffa
L_6FFD:
	ld a,(0e207h)		;6ffd
	and 030h		;7000
	jr z,L_7015		;7002
	ld hl,0e204h		;7004
	dec (hl)			;7007
	ret nz			;7008
	ld hl,071d4h		;7009
	call L_6FD5		;700c
	call L_7042		;700f
	jp L_71B8		;7012
L_7015:
	call L_701B		;7015
	jp L_71B8		;7018
L_701B:
	ld b,007h		;701b
	call L_7159		;701d
	ld a,(0edceh)		;7020
	cp 007h		;7023
	ld a,(0edd8h)		;7025
	call z,L_7108		;7028
	ld hl,0e204h		;702b
	dec (hl)			;702e
	ret nz			;702f
	ld (hl),008h		;7030
	call L_717C		;7032
	call L_7168		;7035
	jr z,L_7042		;7038
	call L_7140		;703a
	ld hl,0edc8h		;703d
	inc (hl)			;7040
	ret			;7041
L_7042:
	ld a,008h		;7042
	jp L_6FCC		;7044
L_7047:
	ld b,007h		;7047
	call L_7159		;7049
	ld hl,0e204h		;704c
	dec (hl)			;704f
	jp nz,L_71B8		;7050
	xor a			;7053
	call L_7108		;7054
	call 05a17h		;7057
L_705A:
	ld a,008h		;705a
	call L_6FCC		;705c
	jp L_71B8		;705f
L_7062:
	ld b,007h		;7062
	call L_7159		;7064
	ld hl,0e204h		;7067
	dec (hl)			;706a
	jp nz,L_71B8		;706b
	ld a,001h		;706e
	call L_7108		;7070
	call 05a29h		;7073
	jr L_705A		;7076
L_7078:
	ld hl,0e204h		;7078
	dec (hl)			;707b
	ret nz			;707c
	xor a			;707d
	call L_7108		;707e
	call 05a3bh		;7081
	call 05fa6h		;7084
	call 05a74h		;7087
	jp L_6FD0		;708a
L_708D:
	ld a,006h		;708d
	ld (0edc8h),a		;708f
	call L_711B		;7092
	ld a,010h		;7095
	jp L_6FCC		;7097
L_709A:
	ld hl,0e204h		;709a
	dec (hl)			;709d
	ret nz			;709e
	ld (hl),010h		;709f
	ld hl,0edc8h		;70a1
	dec (hl)			;70a4
	ld a,(hl)			;70a5
	cp 005h		;70a6
	push hl			;70a8
	call z,042fbh		;70a9
	pop hl			;70ac
	ld a,(hl)			;70ad
	cp 0ffh		;70ae
	jp nz,L_711B		;70b0
	ld (hl),000h		;70b3
	ld a,004h		;70b5
	call L_77D7		;70b7
	jp L_6FD0		;70ba
L_70BD:
	call L_781C		;70bd
	ld a,(0e880h)		;70c0
	or a			;70c3
	ret nz			;70c4
	call 05d41h		;70c5
	ld a,010h		;70c8
	jp L_6FCC		;70ca
L_70CD:
	ld hl,0e204h		;70cd
	dec (hl)			;70d0
	ret nz			;70d1
	ld (hl),010h		;70d2
	ld hl,0edc8h		;70d4
	inc (hl)			;70d7
	ld a,(hl)			;70d8
	dec a			;70d9
	push hl			;70da
	call z,042fbh		;70db
	pop hl			;70de
	ld a,(hl)			;70df
	cp 006h		;70e0
	call z,04294h		;70e2
	ld a,(hl)			;70e5
	cp 007h		;70e6
	jp nz,L_711B		;70e8
	call 0431bh		;70eb
	ld a,0c0h		;70ee
	jp L_6FCC		;70f0
L_70F3:
	ld hl,0e204h		;70f3
	dec (hl)			;70f6
	ret nz			;70f7
	call 04313h		;70f8
	call 041e0h		;70fb
	xor a			;70fe
	ld (0e257h),a		;70ff
	call 04e98h		;7102
	jp 05bebh		;7105
L_7108:
	ld hl,00040h		;7108
	or a			;710b
	jr z,L_7110		;710c
	ld h,060h		;710e
L_7110:
	ld de,08828h		;7110
	ld bc,06080h		;7113
	ld a,001h		;7116
	jp 05029h		;7118
L_711B:
	push af			;711b
	ld hl,06040h		;711c
	ld de,0a030h		;711f
	ld bc,03070h		;7122
	ld a,001h		;7125
	call 05029h		;7127
	pop af			;712a
	ld hl,09040h		;712b
	rla			;712e
	rla			;712f
	rla			;7130
	and 0f8h		;7131
	add a,040h		;7133
	ld e,a			;7135
	ld d,0a0h		;7136
	ld bc,03030h		;7138
	ld a,001h		;713b
	jp 05029h		;713d
L_7140:
	ld hl,0edcbh		;7140
	ld a,(0edcah)		;7143
	dec a			;7146
	jr z,L_7151		;7147
	dec a			;7149
	jr z,L_7153		;714a
	dec a			;714c
	jr z,L_7156		;714d
	dec (hl)			;714f
	ret			;7150
L_7151:
	inc (hl)			;7151
	ret			;7152
L_7153:
	inc hl			;7153
	dec (hl)			;7154
	ret			;7155
L_7156:
	inc hl			;7156
	inc (hl)			;7157
	ret			;7158
L_7159:
	ld hl,0edceh		;7159
	dec (hl)			;715c
	ret nz			;715d
	ld (hl),b			;715e
	ld a,(0edd8h)		;715f
	xor 003h		;7162
	ld (0edd8h),a		;7164
	ret			;7167
L_7168:
	ld a,(0e241h)		;7168
	dec a			;716b
	ld hl,07177h		;716c
	call 0408fh		;716f
	ld a,(0edc8h)		;7172
	cp (hl)			;7175
	ret			;7176

; ----------------------------------------------------------------------
; DATOS sin identificar  0x7177..0x717c  (5 bytes)
DATA_7177:
	defb 058h,0b8h,088h,08eh,095h	; 7177

; ======================================================================
; CODIGO 0x717c..0x71ca  (78 bytes)
; ======================================================================


L_717C:
	call 041bfh		;717c
	call L_7185		;717f
	jp 0418ah		;7182
L_7185:
	ld hl,0ba57h		;7185
	ld a,(0e241h)		;7188
	dec a			;718b
	call 04d4ch		;718c
	ld d,h			;718f
	ld e,l			;7190
	ld a,(0edc8h)		;7191
	ld b,a			;7194
L_7195:
	ld a,(de)			;7195
	cp 0ffh		;7196
	ret z			;7198
	inc de			;7199
	cp b			;719a
	jr z,L_71A0		;719b
	inc de			;719d
	jr L_7195		;719e
L_71A0:
	ld a,(de)			;71a0
	ld (0edcah),a		;71a1
	ret			;71a4
L_71A5:
	call 041b5h		;71a5
	ld hl,0ac13h		;71a8
	ld a,(0e241h)		;71ab
	dec a			;71ae
	call 04d4ch		;71af
	call 051d0h		;71b2
	jp 0418ah		;71b5
L_71B8:
	call 041b5h		;71b8
	call 0bdd7h		;71bb
	jp 0418ah		;71be
L_71C1:
	call 041b5h		;71c1
	call 0bddah		;71c4
	jp 0418ah		;71c7

; ----------------------------------------------------------------------
; DATOS sin identificar  0x71ca..0x71de  (20 bytes)
DATA_71CA:
	defb 02bh,04eh,03bh,02eh,063h,030h,066h,053h,053h,05eh,03bh,038h,05eh,02bh,06bh,04eh	; 71ca  +N..c0fSS^.8^+kN
	defb 04eh,063h,048h,046h	; 71da

; ======================================================================
; CODIGO 0x71de..0x71e6  (8 bytes)
; ======================================================================


L_71DE:
	ld de,0e257h		;71de
	ld a,(de)			;71e1
	dec a			;71e2
	call 04099h		;71e3

; ----------------------------------------------------------------------
; DATOS sin identificar  0x71e6..0x71f6  (16 bytes)
DATA_71E6:
	defb 0f6h,071h,01fh,072h,096h,072h,0e1h,072h,013h,073h,031h,073h,03bh,073h,042h,073h	; 71e6  .q.r.r.r.s1s.sBs

; ======================================================================
; CODIGO 0x71f6..0x7280  (138 bytes)
; ======================================================================


L_71F6:
	ld a,(0e2f0h)		;71f6
	cp 001h		;71f9
	jr z,L_71FF		;71fb
	jr nc,L_720F		;71fd
L_71FF:
	ld hl,0e2f7h		;71ff
	dec (hl)			;7202
	ret nz			;7203
	ld (hl),01eh		;7204
	dec hl			;7206
	inc (hl)			;7207
	ld hl,0e2f0h		;7208
	inc (hl)			;720b
	jp 09010h		;720c
L_720F:
	ld hl,0e2f7h		;720f
	dec (hl)			;7212
	ret nz			;7213
	ld hl,0e257h		;7214
	inc (hl)			;7217
	inc hl			;7218
	ld (hl),000h		;7219
	inc hl			;721b
	ld (hl),020h		;721c
	ret			;721e
L_721F:
	ld hl,0e259h		;721f
	dec (hl)			;7222
	jr nz,L_7230		;7223
	ld (hl),020h		;7225
	dec hl			;7227
	inc (hl)			;7228
	ld a,(hl)			;7229
	cp 004h		;722a
	jp nc,L_7288		;722c
	inc hl			;722f
L_7230:
	ld a,(hl)			;7230
	and 00fh		;7231
	jr nz,L_723C		;7233
	ld de,0e282h		;7235
	ld a,(de)			;7238
	sub 002h		;7239
	ld (de),a			;723b
L_723C:
	ld a,(hl)			;723c
L_723D:
	rra			;723d
	rra			;723e
	rra			;723f
	rra			;7240
	and 001h		;7241
	ld c,a			;7243
	ld a,(0e258h)		;7244
	add a,a			;7247
	add a,c			;7248
	add a,a			;7249
	add a,a			;724a
	add a,a			;724b
	add a,a			;724c
	ld c,a			;724d
	ld hl,07280h		;724e
	ld de,0e800h		;7251
	ld b,004h		;7254
	exx			;7256
	ld hl,0d200h		;7257
	exx			;725a
L_725B:
	ld a,(0e282h)		;725b
	add a,(hl)			;725e
	ld (de),a			;725f
	inc hl			;7260
	inc de			;7261
	ld a,(0e284h)		;7262
	ld (de),a			;7265
	inc de			;7266
	ld a,c			;7267
	ld (de),a			;7268
	ld a,c			;7269
	add a,004h		;726a
	ld c,a			;726c
	inc de			;726d
	inc de			;726e
	ld a,(hl)			;726f
	inc hl			;7270
	exx			;7271
	ld d,h			;7272
	ld e,l			;7273
	inc de			;7274
	ld bc,0000fh		;7275
	ld (hl),a			;7278
	ldir		;7279
	inc hl			;727b
	exx			;727c
	djnz L_725B		;727d
	ret			;727f

; ----------------------------------------------------------------------
; DATOS sin identificar  0x7280..0x7288  (8 bytes)
DATA_7280:
	defb 0f8h,00dh,0f8h,04eh,008h,00dh,008h,04eh	; 7280  ...N...N

; ======================================================================
; CODIGO 0x7288..0x7362  (218 bytes)
; ======================================================================


L_7288:
	call 05d41h		;7288
	ld hl,0e257h		;728b
	inc (hl)			;728e
	inc hl			;728f
	ld (hl),000h		;7290
	inc hl			;7292
	ld (hl),004h		;7293
	ret			;7295
L_7296:
	ld hl,0e259h		;7296
	dec (hl)			;7299
	ret nz			;729a
	ld a,(0e258h)		;729b
	ld c,a			;729e
	add a,a			;729f
	add a,a			;72a0
	add a,a			;72a1
	ld e,a			;72a2
	push bc			;72a3
	call L_72D2		;72a4
	pop bc			;72a7
	ld a,017h		;72a8
	sub c			;72aa
	add a,a			;72ab
	add a,a			;72ac
	add a,a			;72ad
	ld e,a			;72ae
	call L_72D2		;72af
	ld hl,0e258h		;72b2
	inc (hl)			;72b5
	ld a,(hl)			;72b6
	inc hl			;72b7
	ld (hl),004h		;72b8
	cp 00ch		;72ba
	ret c			;72bc
	ld hl,0e800h		;72bd
	ld b,002h		;72c0
L_72C2:
	ld a,(hl)			;72c2
	sub 010h		;72c3
	ld (hl),a			;72c5
	ld a,004h		;72c6
	call 0408fh		;72c8
	djnz L_72C2		;72cb
	ld hl,0e257h		;72cd
	inc (hl)			;72d0
	ret			;72d1
L_72D2:
	ld b,020h		;72d2
	ld d,000h		;72d4
L_72D6:
	xor a			;72d6
	call 0576ah		;72d7
	ld a,d			;72da
	add a,008h		;72db
	ld d,a			;72dd
	djnz L_72D6		;72de
	ret			;72e0
L_72E1:
	ld hl,0e242h		;72e1
	inc (hl)			;72e4
	xor a			;72e5
	ld (0e249h),a		;72e6
	call 04e98h		;72e9
	call 041b5h		;72ec
	ld hl,0b256h		;72ef
	call 051d0h		;72f2
	call 0418ah		;72f5
	ld c,0ffh		;72f8
	ld hl,05f0eh		;72fa
	ld de,06068h		;72fd
	call 051dah		;7300
	ld de,08868h		;7303
	call 04d1fh		;7306
	ld a,03ch		;7309
L_730B:
	ld (0e204h),a		;730b
	ld hl,0e257h		;730e
	inc (hl)			;7311
	ret			;7312
L_7313:
	ld hl,0e204h		;7313
	dec (hl)			;7316
	ret nz			;7317
	ld hl,0e240h		;7318
	ld a,(hl)			;731b
	cp 099h		;731c
	jr nc,L_7324		;731e
	add a,001h		;7320
	daa			;7322
	ld (hl),a			;7323
L_7324:
	ld de,08868h		;7324
	push hl			;7327
	call 04d1fh		;7328
	pop hl			;732b
	inc (hl)			;732c
	ld a,078h		;732d
	jr L_730B		;732f
L_7331:
	ld hl,0e204h		;7331
	dec (hl)			;7334
	ret nz			;7335
	call L_697C		;7336
	jr L_730B		;7339
L_733B:
	ld a,(0e207h)		;733b
	and a			;733e
	ret z			;733f
	jr L_730B		;7340
L_7342:
	ld hl,0e204h		;7342
	dec (hl)			;7345
	ret nz			;7346
	ld hl,0e257h		;7347
	ld (hl),000h		;734a
	ret			;734c
L_734D:
	call L_7353		;734d
	jp 0583bh		;7350
L_7353:
	ld hl,0edc9h		;7353
	inc (hl)			;7356
	call L_781C		;7357
	ld de,0e257h		;735a
	ld a,(de)			;735d
	dec a			;735e
	call 04099h		;735f

; ----------------------------------------------------------------------
; DATOS sin identificar  0x7362..0x73e4  (130 bytes)
DATA_7362:
	defb 0e4h,073h,0fdh,073h,006h,074h,012h,074h,045h,074h,057h,074h,062h,074h,06fh,074h	; 7362  .s.s.t.tEtWtbtot
	defb 096h,074h,0b7h,074h,0c3h,074h,0e1h,074h,014h,075h,021h,075h,05bh,075h,06fh,075h	; 7372  .t.t.t.t.u!u[uou
	defb 0a7h,075h,0c9h,075h,0dch,075h,0e4h,075h,0f1h,075h,009h,076h,013h,076h,034h,076h	; 7382  .u.u.u.u.u.v.v4v
	defb 041h,076h,05ch,076h,069h,076h,079h,076h,097h,076h,0bdh,076h,0d1h,076h,0d9h,076h	; 7392  Av\vivyv.v.v.v.v
	defb 0ebh,076h,0bdh,076h,0d1h,076h,0d9h,076h,0ebh,076h,0bdh,076h,0d1h,076h,0d9h,076h	; 73a2  .v.v.v.v.v.v.v.v
	defb 0ebh,076h,0bdh,076h,0d1h,076h,0d9h,076h,0ebh,076h,0bdh,076h,0d1h,076h,0d9h,076h	; 73b2  .v.v.v.v.v.v.v.v
	defb 0ebh,076h,0bdh,076h,0d1h,076h,0d9h,076h,0ebh,076h,0bdh,076h,0d1h,076h,0d9h,076h	; 73c2  .v.v.v.v.v.v.v.v
	defb 0ebh,076h,0bdh,076h,0d1h,076h,0d9h,076h,0ebh,076h,0bdh,076h,0d1h,076h,0d9h,076h	; 73d2  .v.v.v.v.v.v.v.v
	defb 0f8h,076h	; 73e2

; ======================================================================
; CODIGO 0x73e4..0x7782  (926 bytes)
; ======================================================================


L_73E4:
	call 04e98h		;73e4
	call L_775D		;73e7
	call 05d41h		;73ea
	call 05b16h		;73ed
	ld a,00ah		;73f0
	call L_77D7		;73f2
	ld hl,0acc3h		;73f5
	call L_771C		;73f8
	jr L_7440		;73fb
L_73FD:
	ld a,(0e880h)		;73fd
	or a			;7400
	ret nz			;7401
	ld a,0f0h		;7402
	jr L_745C		;7404
L_7406:
	ld hl,0e204h		;7406
	dec (hl)			;7409
	ret nz			;740a
	ld a,003h		;740b
	call L_77D7		;740d
	jr L_7440		;7410
L_7412:
	ld a,(0e880h)		;7412
	or a			;7415
	ret nz			;7416
	call 04e98h		;7417
	call L_775D		;741a
	call 05970h		;741d
	call 05aa5h		;7420
	call 05d41h		;7423
	ld bc,0a201h		;7426
	call 00047h		;7429   ; BIOS WRTVDP - Writes data in the VDP-register
	ld de,05010h		;742c
	call 059afh		;742f
	ld a,009h		;7432
	call L_77D7		;7434
	ld bc,0e201h		;7437
	call 00047h		;743a   ; BIOS WRTVDP - Writes data in the VDP-register
	call 04235h		;743d
L_7440:
	ld hl,0e257h		;7440
	inc (hl)			;7443
	ret			;7444
L_7445:
	ld a,(0e880h)		;7445
	or a			;7448
	ret nz			;7449
	ld hl,0ad12h		;744a
	call L_771C		;744d
	ld a,00ah		;7450
	call L_77D7		;7452
	jr L_7440		;7455
L_7457:
	ld a,(0e880h)		;7457
	and a			;745a
	ret nz			;745b
L_745C:
	ld hl,0e204h		;745c
	ld (hl),a			;745f
	jr L_7440		;7460
L_7462:
	ld hl,0e204h		;7462
	dec (hl)			;7465
	ret nz			;7466
	ld a,003h		;7467
	call L_77D7		;7469
	jp L_7440		;746c
L_746F:
	ld a,(0e880h)		;746f
	or a			;7472
	ret nz			;7473
	call 04e98h		;7474
	call 04e98h		;7477
	call 0597fh		;747a
	ld de,07707h		;747d
	ld a,005h		;7480
	call 04ef2h		;7482
	call 041b5h		;7485
	call 0bc6eh		;7488
	call 0418ah		;748b
	call L_7703		;748e
	ld a,060h		;7491
	jp L_745C		;7493
L_7496:
	call L_7703		;7496
	ld hl,0e204h		;7499
	dec (hl)			;749c
	ret nz			;749d
	xor a			;749e
	call L_77D7		;749f
	ld bc,0a201h		;74a2
	call 00047h		;74a5   ; BIOS WRTVDP - Writes data in the VDP-register
	ld de,05020h		;74a8
	call 059beh		;74ab
	ld bc,0e201h		;74ae
	call 00047h		;74b1   ; BIOS WRTVDP - Writes data in the VDP-register
	jp L_7440		;74b4
L_74B7:
	call L_7703		;74b7
	ld a,(0e880h)		;74ba
	or a			;74bd
	ret nz			;74be
	ld a,0a0h		;74bf
	jr L_745C		;74c1
L_74C3:
	ld hl,0e204h		;74c3
	dec (hl)			;74c6
	jr z,L_74D8		;74c7
	ld a,(hl)			;74c9
	cp 030h		;74ca
	call z,L_74D2		;74cc
	jp L_7703		;74cf
L_74D2:
	ld a,001h		;74d2
	ld (0e902h),a		;74d4
	ret			;74d7
L_74D8:
	xor a			;74d8
	ld (0edceh),a		;74d9
	ld a,050h		;74dc
	jp L_745C		;74de
L_74E1:
	call L_7703		;74e1
	ld hl,0e204h		;74e4
	dec (hl)			;74e7
	jr z,L_750F		;74e8
	ld a,(hl)			;74ea
	and 007h		;74eb
	ret nz			;74ed
	call 041b5h		;74ee
	ld hl,0af37h		;74f1
	ld a,(0edceh)		;74f4
	ld b,a			;74f7
	add a,a			;74f8
	add a,b			;74f9
	call 0408fh		;74fa
	ld d,(hl)			;74fd
	inc hl			;74fe
	ld e,(hl)			;74ff
	inc hl			;7500
	ld a,(hl)			;7501
	call 05767h		;7502
	ld hl,0edceh		;7505
	inc (hl)			;7508
	call 0418ah		;7509
	jp 042f7h		;750c
L_750F:
	ld a,090h		;750f
	jp L_745C		;7511
L_7514:
	ld hl,0e204h		;7514
	dec (hl)			;7517
	ret nz			;7518
	ld a,001h		;7519
	call L_77D7		;751b
	jp L_7440		;751e
L_7521:
	ld a,(0e880h)		;7521
	or a			;7524
	ret nz			;7525
	call 04e98h		;7526
	call 04e98h		;7529
	call 04ecbh		;752c
	call 05b5eh		;752f
	call 0598eh		;7532
	call 05d41h		;7535
	ld bc,0a201h		;7538
	call 00047h		;753b   ; BIOS WRTVDP - Writes data in the VDP-register
	ld de,05020h		;753e
	call 059cdh		;7541
	call 05a4dh		;7544
	ld bc,0e201h		;7547
	call 00047h		;754a   ; BIOS WRTVDP - Writes data in the VDP-register
	ld hl,0ad69h		;754d
	call L_771C		;7550
	ld a,080h		;7553
	call L_745C		;7555
	jp 042dfh		;7558
L_755B:
	call L_7737		;755b
	call L_774B		;755e
	ld hl,0e204h		;7561
	dec (hl)			;7564
	ret nz			;7565
	ld hl,0ad58h		;7566
	call L_771C		;7569
	jp L_7440		;756c
L_756F:
	call L_7737		;756f
	ld a,(0e208h)		;7572
	and 030h		;7575
	ret z			;7577
	ld de,03000h		;7578
	ld a,00ah		;757b
	call 04ef2h		;757d
	ld de,00406h		;7580
	ld a,006h		;7583
	call 04ef2h		;7585
	ld hl,08848h		;7588
	ld de,08838h		;758b
	ld bc,01838h		;758e
	ld a,001h		;7591
	call 05029h		;7593
	ld hl,048b0h		;7596
	ld de,008a0h		;7599
	xor a			;759c
	call 050beh		;759d
	xor a			;75a0
	call L_745C		;75a1
	jp 042e7h		;75a4
L_75A7:
	ld hl,0e204h		;75a7
	dec (hl)			;75aa
	ld a,(hl)			;75ab
	or a			;75ac
	jr z,L_75B8		;75ad
	cp 080h		;75af
	jp c,L_770C		;75b1
	jp z,042ebh		;75b4
	ret			;75b7
L_75B8:
	ld bc,00007h		;75b8
	call 00047h		;75bb   ; BIOS WRTVDP - Writes data in the VDP-register
	call 04e98h		;75be
	call L_775D		;75c1
	ld a,078h		;75c4
	jp L_745C		;75c6
L_75C9:
	ld hl,0e204h		;75c9
	dec (hl)			;75cc
	ret nz			;75cd
	ld hl,0aeddh		;75ce
	call L_771C		;75d1
	ld a,00ah		;75d4
	call L_77D7		;75d6
	jp L_7440		;75d9
L_75DC:
	ld a,(0e880h)		;75dc
	or a			;75df
	ret nz			;75e0
	jp L_745C		;75e1
L_75E4:
	ld hl,0e204h		;75e4
	dec (hl)			;75e7
	ret nz			;75e8
	ld a,003h		;75e9
	call L_77D7		;75eb
	jp L_7440		;75ee
L_75F1:
	ld a,(0e880h)		;75f1
	or a			;75f4
	ret nz			;75f5
	call 04e98h		;75f6
	ld a,002h		;75f9
	call L_77D7		;75fb
	ld a,00fh		;75fe
	call 059dch		;7600
	call 04221h		;7603
	jp L_7440		;7606
L_7609:
	ld a,(0e880h)		;7609
	or a			;760c
	ret nz			;760d
	ld a,020h		;760e
	jp L_745C		;7610
L_7613:
	ld hl,0e204h		;7613
	dec (hl)			;7616
	ret nz			;7617
	ld a,09fh		;7618
	ld (0edcbh),a		;761a
	ld a,080h		;761d
	ld (0edcch),a		;761f
	xor a			;7622
	ld (0edd8h),a		;7623
	ld (0edceh),a		;7626
	call L_7786		;7629
	ld a,006h		;762c
	call L_77D7		;762e
	jp L_7440		;7631
L_7634:
	call L_7786		;7634
	ld a,(0e880h)		;7637
	or a			;763a
	ret nz			;763b
	ld a,030h		;763c
	jp L_745C		;763e
L_7641:
	call L_7786		;7641
	ld hl,0e204h		;7644
	dec (hl)			;7647
	ret nz			;7648
	ld a,004h		;7649
	ld (0edd8h),a		;764b
	ld hl,0af21h		;764e
	call L_771C		;7651
	ld a,00bh		;7654
	call L_77D7		;7656
	jp L_7440		;7659
L_765C:
	call L_7786		;765c
	ld a,(0e880h)		;765f
	or a			;7662
	ret nz			;7663
	ld a,0b4h		;7664
	jp L_745C		;7666
L_7669:
	call L_7786		;7669
	ld hl,0e204h		;766c
	dec (hl)			;766f
	ret nz			;7670
	ld a,002h		;7671
	ld (0edd8h),a		;7673
	jp L_7440		;7676
L_7679:
	call L_776A		;7679
	ld hl,0edc9h		;767c
	ld a,(hl)			;767f
	and 003h		;7680
	jp nz,L_7786		;7682
	ld hl,0edcch		;7685
	dec (hl)			;7688
	ld a,(hl)			;7689
	cp 030h		;768a
	jp nc,L_7786		;768c
	ld a,007h		;768f
	call L_77D7		;7691
	jp L_7440		;7694
L_7697:
	call L_776A		;7697
	ld hl,0edc9h		;769a
	ld a,(hl)			;769d
	and 003h		;769e
	jp nz,L_76A7		;76a0
	ld hl,0edcch		;76a3
	dec (hl)			;76a6
L_76A7:
	ld a,(0e880h)		;76a7
	or a			;76aa
	jp nz,L_7786		;76ab
	call 04e98h		;76ae
	call 05d41h		;76b1
	xor a			;76b4
	ld (0edcfh),a		;76b5
	ld a,008h		;76b8
	jp L_745C		;76ba
L_76BD:
	ld hl,0e204h		;76bd
	dec (hl)			;76c0
	ret nz			;76c1
	call L_7725		;76c2
	ld hl,0edcfh		;76c5
	inc (hl)			;76c8
	ld a,00ah		;76c9
	call L_77D7		;76cb
	jp L_7440		;76ce
L_76D1:
	ld a,(0e880h)		;76d1
	or a			;76d4
	ret nz			;76d5
	jp L_745C		;76d6
L_76D9:
	ld hl,0e204h		;76d9
	dec (hl)			;76dc
	ret nz			;76dd
	ld a,(0edcfh)		;76de
	cp 009h		;76e1
	ld a,003h		;76e3
	call c,L_77D7		;76e5
	jp L_7440		;76e8
L_76EB:
	ld a,(0e880h)		;76eb
	or a			;76ee
	ret nz			;76ef
	call 04e98h		;76f0
	ld a,020h		;76f3
	jp L_745C		;76f5
L_76F8:
	ld a,(0e208h)		;76f8
	and 030h		;76fb
	ret z			;76fd
	sub a			;76fe
	ld (0e257h),a		;76ff
	ret			;7702
L_7703:
	call 041b5h		;7703
	call 0bcd2h		;7706
	jp 0418ah		;7709
L_770C:
	ld a,(0edc9h)		;770c
	rra			;770f
	rra			;7710
	ld bc,00007h		;7711
	jp c,00047h		;7714   ; BIOS WRTVDP - Writes data in the VDP-register
	ld b,00bh		;7717
	jp 00047h		;7719   ; BIOS WRTVDP - Writes data in the VDP-register
L_771C:
	call 041b5h		;771c
	call 051d0h		;771f
	jp 0418ah		;7722
L_7725:
	call 041b5h		;7725
	ld a,(0edcfh)		;7728
	ld hl,0ad76h		;772b
	call 04d4ch		;772e
	call 051d0h		;7731
	jp 0418ah		;7734
L_7737:
	ld a,(0edc9h)		;7737
	rra			;773a
	rra			;773b
	rra			;773c
	rra			;773d
	ld de,03000h		;773e
	jr c,L_7746		;7741
	ld de,07101h		;7743
L_7746:
	ld a,00ah		;7746
	jp 04ef2h		;7748
L_774B:
	ld a,(0e204h)		;774b
	rra			;774e
	rra			;774f
	ld de,07000h		;7750
	jr c,L_7758		;7753
	ld de,00007h		;7755
L_7758:
	ld a,00ch		;7758
	jp 04ef2h		;775a
L_775D:
	ld b,010h		;775d
L_775F:
	ld a,b			;775f
	inc a			;7760
	ld de,00000h		;7761
	call 04ef2h		;7764
	djnz L_775F		;7767
	ret			;7769
L_776A:
	ld a,(0edc9h)		;776a
	and 00fh		;776d
	ret nz			;776f
	ld hl,0edceh		;7770
	inc (hl)			;7773
	ld a,(hl)			;7774
	and 003h		;7775
	ld hl,07782h		;7777
	call 0408fh		;777a
	ld a,(hl)			;777d
	ld (0edd8h),a		;777e
	ret			;7781

; ----------------------------------------------------------------------
; DATOS sin identificar  0x7782..0x7786  (4 bytes)
DATA_7782:
	defb 001h,002h,003h,002h	; 7782

; ======================================================================
; CODIGO 0x7786..0x77bb  (53 bytes)
; ======================================================================


L_7786:
	ld hl,0e800h		;7786
	exx			;7789
	ld de,077bbh		;778a
	ld a,(0edd8h)		;778d
	add a,a			;7790
	add a,a			;7791
	call 04094h		;7792
	exx			;7795
	ld a,(0edcbh)		;7796
	ld e,a			;7799
	ld a,(0edcch)		;779a
	ld d,a			;779d
	call L_77AB		;779e
	ld a,e			;77a1
	add a,010h		;77a2
	ld e,a			;77a4
	call L_77AB		;77a5
	jp 098b9h		;77a8
L_77AB:
	ld b,002h		;77ab
L_77AD:
	ld (hl),e			;77ad
	inc hl			;77ae
	ld (hl),d			;77af
	inc hl			;77b0
	exx			;77b1
	ld a,(de)			;77b2
	inc de			;77b3
	exx			;77b4
	ld (hl),a			;77b5
	inc hl			;77b6
	inc hl			;77b7
	djnz L_77AD		;77b8
	ret			;77ba

; ----------------------------------------------------------------------
; DATOS sin identificar  0x77bb..0x77d7  (28 bytes)
DATA_77BB:
	defb 000h,004h,008h,00ch,010h,014h,028h,02ch,018h,01ch,030h,034h,020h,024h,038h,03ch	; 77bb  ......(,..04 $8<
	defb 060h,064h,068h,06ch,040h,044h,048h,04ch,050h,054h,058h,05ch	; 77cb  `dhl@DHLPTX\

; ======================================================================
; CODIGO 0x77d7..0x7838  (97 bytes)
; ======================================================================


L_77D7:
	call 041cch		;77d7
	ld hl,0e880h		;77da
	ld de,0e881h		;77dd
	ld (hl),000h		;77e0
	ld bc,00027h		;77e2
	ldir		;77e5
	ld l,a			;77e7
	ld h,000h		;77e8
	ld e,a			;77ea
	ld d,h			;77eb
	add hl,hl			;77ec
	add hl,hl			;77ed
	add hl,de			;77ee
	ld de,0a792h		;77ef
	add hl,de			;77f2
	push hl			;77f3
	ld a,(hl)			;77f4
	inc hl			;77f5
	ld h,(hl)			;77f6
	ld l,a			;77f7
	ld de,0e887h		;77f8
	ld bc,00020h		;77fb
	ldir		;77fe
	pop hl			;7800
	inc hl			;7801
	inc hl			;7802
	push hl			;7803
	ld a,(hl)			;7804
	inc hl			;7805
	ld h,(hl)			;7806
	ld l,a			;7807
	ld (0e884h),hl		;7808
	pop hl			;780b
	inc hl			;780c
	inc hl			;780d
	ld a,(hl)			;780e
	ld (0e883h),a		;780f
	ld (0e882h),a		;7812
	ld hl,0e880h		;7815
	inc (hl)			;7818
	jp 0418ah		;7819
L_781C:
	call 041cch		;781c
	call L_7825		;781f
	jp 0418ah		;7822
L_7825:
	ld a,(0e880h)		;7825
	or a			;7828
	ret z			;7829
	call L_7903		;782a
	ld a,(0e880h)		;782d
	or a			;7830
	ret z			;7831
	ld a,(0e881h)		;7832
	call 04099h		;7835

; ----------------------------------------------------------------------
; DATOS sin identificar  0x7838..0x783e  (6 bytes)
DATA_7838:
	defb 03eh,078h,063h,078h,085h,078h	; 7838

; ======================================================================
; CODIGO 0x783e..0x7927  (233 bytes)
; ======================================================================


L_783E:
	ld hl,0e882h		;783e
	dec (hl)			;7841
	ret nz			;7842
	ld a,(0e883h)		;7843
	ld (hl),a			;7846
	call L_7918		;7847
	ld b,010h		;784a
L_784C:
	push bc			;784c
	push hl			;784d
	push de			;784e
	call L_78AD		;784f
	pop de			;7852
	pop hl			;7853
	pop bc			;7854
	inc hl			;7855
	inc hl			;7856
	inc de			;7857
	inc de			;7858
	djnz L_784C		;7859
	call L_78EE		;785b
L_785E:
	ld hl,0e881h		;785e
	inc (hl)			;7861
	ret			;7862
L_7863:
	ld hl,0e882h		;7863
	dec (hl)			;7866
	ret nz			;7867
	ld a,(0e883h)		;7868
	ld (hl),a			;786b
	call L_7918		;786c
	ld b,010h		;786f
L_7871:
	push bc			;7871
	push hl			;7872
	push de			;7873
	call L_78C8		;7874
	pop de			;7877
	pop hl			;7878
	pop bc			;7879
	inc hl			;787a
	inc hl			;787b
	inc de			;787c
	inc de			;787d
	djnz L_7871		;787e
	call L_78EE		;7880
	jr L_785E		;7883
L_7885:
	ld hl,0e882h		;7885
	dec (hl)			;7888
	ret nz			;7889
	ld a,(0e883h)		;788a
	ld (hl),a			;788d
	call L_7918		;788e
	inc hl			;7891
	inc de			;7892
	ld b,010h		;7893
L_7895:
	push bc			;7895
	push hl			;7896
	push de			;7897
	call L_78DB		;7898
	pop de			;789b
	pop hl			;789c
	pop bc			;789d
	inc hl			;789e
	inc hl			;789f
	inc de			;78a0
	inc de			;78a1
	djnz L_7895		;78a2
	call L_78EE		;78a4
	ld hl,0e881h		;78a7
	ld (hl),000h		;78aa
	ret			;78ac
L_78AD:
	ld a,(hl)			;78ad
	rra			;78ae
	rra			;78af
	rra			;78b0
	rra			;78b1
	and 00fh		;78b2
	ld c,a			;78b4
	ld a,(de)			;78b5
	rra			;78b6
	rra			;78b7
	rra			;78b8
	rra			;78b9
	and 00fh		;78ba
	cp c			;78bc
	ret z			;78bd
	ld c,010h		;78be
	jr nc,L_78C4		;78c0
	ld c,0f0h		;78c2
L_78C4:
	ld a,(hl)			;78c4
	add a,c			;78c5
	ld (hl),a			;78c6
	ret			;78c7
L_78C8:
	ld a,(hl)			;78c8
	and 00fh		;78c9
	ld c,a			;78cb
	ld a,(de)			;78cc
	and 00fh		;78cd
	cp c			;78cf
	ret z			;78d0
	ld c,001h		;78d1
	jr nc,L_78D7		;78d3
	ld c,0ffh		;78d5
L_78D7:
	ld a,(hl)			;78d7
	add a,c			;78d8
	ld (hl),a			;78d9
	ret			;78da
L_78DB:
	ld a,(hl)			;78db
	and 00fh		;78dc
	ld c,a			;78de
	ld a,(de)			;78df
	and 00fh		;78e0
	cp c			;78e2
	ret z			;78e3
	ld c,001h		;78e4
	jr nc,L_78EA		;78e6
	ld c,0ffh		;78e8
L_78EA:
	ld a,(hl)			;78ea
	add a,c			;78eb
	ld (hl),a			;78ec
	ret			;78ed
L_78EE:
	ld hl,0e887h		;78ee
	xor a			;78f1
L_78F2:
	ld d,(hl)			;78f2
	inc hl			;78f3
	ld e,(hl)			;78f4
	push af			;78f5
	push hl			;78f6
	call 04ef2h		;78f7
	pop hl			;78fa
	pop af			;78fb
	inc hl			;78fc
	inc a			;78fd
	cp 010h		;78fe
	ret z			;7900
	jr L_78F2		;7901
L_7903:
	ld b,020h		;7903
	ld de,0e887h		;7905
	ld hl,(0e884h)		;7908
L_790B:
	ld a,(de)			;790b
	cp (hl)			;790c
	ret nz			;790d
	inc hl			;790e
	inc de			;790f
	djnz L_790B		;7910
	ld hl,0e880h		;7912
	ld (hl),000h		;7915
	ret			;7917
L_7918:
	ld hl,(0e884h)		;7918
	ld de,0e887h		;791b
	ex de,hl			;791e
	ret			;791f
L_7920:
	ld a,(0e25ah)		;7920
	dec a			;7923
	call 04099h		;7924

; ----------------------------------------------------------------------
; DATOS sin identificar  0x7927..0x7933  (12 bytes)
DATA_7927:
	defb 033h,079h,077h,079h,096h,079h,0a4h,079h,008h,07bh,067h,086h	; 7927  3ywy.y.y.{g.

; ======================================================================
; CODIGO 0x7933..0x7b0e  (475 bytes)
; ======================================================================


L_7933:
	call 04e98h		;7933
	ld a,001h		;7936
	ld (0e241h),a		;7938
	call 05634h		;793b
	call 0565eh		;793e
	call L_7A96		;7941
	call L_799C		;7944
	ld a,001h		;7947
	ld (0e25bh),a		;7949
	ld hl,0e2c0h		;794c
	ld de,0e2c1h		;794f
	ld bc,00d3fh		;7952
	ld (hl),000h		;7955
	ldir		;7957
	call 05d41h		;7959
	ld hl,0e25ch		;795c
	ld de,0e25dh		;795f
	ld bc,00013h		;7962
	ld (hl),000h		;7965
	ldir		;7967
L_7969:
	ld hl,0e270h		;7969
	ld de,0e271h		;796c
	ld bc,0000bh		;796f
	ld (hl),020h		;7972
	ldir		;7974
	ret			;7976
L_7977:
	call 08b95h		;7977
	ld a,(0e25bh)		;797a
	and a			;797d
	ret nz			;797e
	call L_799C		;797f
	ld a,(0e27eh)		;7982
	and a			;7985
	ret z			;7986
	dec a			;7987
	jr nz,L_7990		;7988
	call L_799C		;798a
	jp L_7A5C		;798d
L_7990:
	ld a,001h		;7990
	ld (0e25ah),a		;7992
	ret			;7995
L_7996:
	call 04e98h		;7996
	call L_7AE1		;7999
L_799C:
	ld hl,0e25ah		;799c
	inc (hl)			;799f
	inc hl			;79a0
	ld (hl),000h		;79a1
	ret			;79a3
L_79A4:
	call L_79AA		;79a4
	jp L_7A69		;79a7
L_79AA:
	ld a,(0e20ch)		;79aa
	rla			;79ad
	jp c,L_7A40		;79ae
	ld a,(0e207h)		;79b1
	rra			;79b4
	ld hl,0e25ch		;79b5
	jp c,L_7A39		;79b8
	rra			;79bb
	jp c,L_7A31		;79bc
	rra			;79bf
	ld hl,0e25dh		;79c0
	jp c,L_7A39		;79c3
	rra			;79c6
	jp c,L_7A31		;79c7
	rra			;79ca
	ld hl,0e25eh		;79cb
	jr c,L_79E1		;79ce
	rra			;79d0
	ret nc			;79d1
	ld a,(hl)			;79d2
	and a			;79d3
	ret z			;79d4
	push hl			;79d5
	call L_7ADB		;79d6
	pop hl			;79d9
	ret z			;79da
	dec (hl)			;79db
	ld b,000h		;79dc
	jp L_79F2		;79de
L_79E1:
	ld a,(hl)			;79e1
	and a			;79e2
	jr z,L_79EB		;79e3
	push hl			;79e5
	call L_7AB5		;79e6
	pop hl			;79e9
	ret z			;79ea
L_79EB:
	ld a,(hl)			;79eb
	cp 006h		;79ec
	ret nc			;79ee
	inc (hl)			;79ef
	ld b,001h		;79f0
L_79F2:
	call L_7A23		;79f2
	ld (hl),b			;79f5
	ld hl,(0e25ch)		;79f6
	ld a,l			;79f9
	add a,a			;79fa
	add a,a			;79fb
	add a,a			;79fc
	ld l,a			;79fd
	add a,a			;79fe
	add a,l			;79ff
	add a,023h		;7a00
	ld l,a			;7a02
	ld a,h			;7a03
	add a,a			;7a04
	add a,a			;7a05
	add a,a			;7a06
	add a,a			;7a07
	add a,a			;7a08
	add a,020h		;7a09
	ld h,a			;7a0b
	ld a,b			;7a0c
	and a			;7a0d
	ld a,0cch		;7a0e
	jr nz,L_7A13		;7a10
	xor a			;7a12
L_7A13:
	ld bc,02017h		;7a13
	ld d,000h		;7a16
	push hl			;7a18
	call 04fedh		;7a19
	pop hl			;7a1c
	ld bc,0170bh		;7a1d
	jp 04f8ah		;7a20
L_7A23:
	ld hl,(0e25ch)		;7a23
	ld a,l			;7a26
	add a,a			;7a27
	add a,a			;7a28
	add a,a			;7a29
	add a,h			;7a2a
	ld hl,0e788h		;7a2b
	jp 0408fh		;7a2e
L_7A31:
	ld a,(hl)			;7a31
	cp 005h		;7a32
	ret nc			;7a34
	inc (hl)			;7a35
	jp 042cbh		;7a36
L_7A39:
	ld a,(hl)			;7a39
	and a			;7a3a
	ret z			;7a3b
	dec (hl)			;7a3c
	jp 042cbh		;7a3d
L_7A40:
	ld hl,0e788h		;7a40
	ld bc,03001h		;7a43
L_7A46:
	ld a,(hl)			;7a46
	and a			;7a47
	jr z,L_7A4C		;7a48
	ld (hl),c			;7a4a
	inc c			;7a4b
L_7A4C:
	ld a,c			;7a4c
	cp 007h		;7a4d
	jr nc,L_7A56		;7a4f
	inc hl			;7a51
	djnz L_7A46		;7a52
	dec c			;7a54
	ret z			;7a55
L_7A56:
	call 087b5h		;7a56
	call L_7CFF		;7a59
L_7A5C:
	xor a			;7a5c
	ld hl,0e260h		;7a5d
	ld (hl),a			;7a60
	inc hl			;7a61
	ld (hl),a			;7a62
	call L_7B33		;7a63
	jp L_799C		;7a66
L_7A69:
	ld hl,0e800h		;7a69
	ld a,(0e25ch)		;7a6c
	add a,a			;7a6f
	add a,a			;7a70
	add a,a			;7a71
	ld b,a			;7a72
	add a,a			;7a73
	add a,b			;7a74
	add a,026h		;7a75
	ld (hl),a			;7a77
	inc hl			;7a78
	ld a,(0e25dh)		;7a79
	add a,a			;7a7c
	add a,a			;7a7d
	add a,a			;7a7e
	add a,a			;7a7f
	add a,a			;7a80
	add a,028h		;7a81
	ld (hl),a			;7a83
	inc hl			;7a84
	ld (hl),010h		;7a85
	inc hl			;7a87
	ld hl,0d200h		;7a88
	ld de,0d201h		;7a8b
	ld (hl),007h		;7a8e
	ld bc,0000fh		;7a90
	ldir		;7a93
	ret			;7a95
L_7A96:
	call 05696h		;7a96
	xor a			;7a99
	ld (0e285h),a		;7a9a
	ld (0e298h),a		;7a9d
	ld (0e287h),a		;7aa0
	call 05859h		;7aa3
L_7AA6:
	call 041bfh		;7aa6
	ld de,0bbfch		;7aa9
	ld hl,0f880h		;7aac
	call 04e54h		;7aaf
	jp 0418ah		;7ab2
L_7AB5:
	call L_7A23		;7ab5
	ld a,(hl)			;7ab8
	and a			;7ab9
	jr nz,L_7AD9		;7aba
	ld d,h			;7abc
	ld e,l			;7abd
	dec hl			;7abe
	ld a,(hl)			;7abf
	and a			;7ac0
	ret nz			;7ac1
	inc hl			;7ac2
	inc hl			;7ac3
	ld a,(hl)			;7ac4
	and a			;7ac5
	ret nz			;7ac6
	ld a,007h		;7ac7
	call 0408fh		;7ac9
	ld a,(hl)			;7acc
	and a			;7acd
	ret nz			;7ace
	ex de,hl			;7acf
	ld de,00008h		;7ad0
	or a			;7ad3
	sbc hl,de		;7ad4
	ld a,(hl)			;7ad6
	and a			;7ad7
	ret nz			;7ad8
L_7AD9:
	xor a			;7ad9
	ret			;7ada
L_7ADB:
	call L_7A23		;7adb
	ld a,(hl)			;7ade
	and a			;7adf
	ret			;7ae0
L_7AE1:
	ld hl,02022h		;7ae1
	ld d,h			;7ae4
	ld e,l			;7ae5
	ld b,007h		;7ae6
L_7AE8:
	push bc			;7ae8
	ld bc,0900bh		;7ae9
	push hl			;7aec
	push de			;7aed
	call 04f8ah		;7aee
	pop de			;7af1
	ex de,hl			;7af2
	ld bc,0c00bh		;7af3
	push hl			;7af6
	call 04f54h		;7af7
	pop de			;7afa
	pop hl			;7afb
	ld a,h			;7afc
	add a,020h		;7afd
	ld h,a			;7aff
	ld a,e			;7b00
	add a,018h		;7b01
	ld e,a			;7b03
	pop bc			;7b04
	djnz L_7AE8		;7b05
	ret			;7b07
L_7B08:
	ld a,(0e25bh)		;7b08
	call 04099h		;7b0b

; ----------------------------------------------------------------------
; DATOS sin identificar  0x7b0e..0x7b1a  (12 bytes)
DATA_7B0E:
	defb 01ah,07bh,045h,07bh,03ah,07ch,082h,07ch,05bh,07eh,049h,07eh	; 7b0e  .{E{:|.|[~I~

; ======================================================================
; CODIGO 0x7b1a..0x7ce4  (458 bytes)
; ======================================================================


L_7B1A:
	call 04e98h		;7b1a
	call 05d41h		;7b1d
	call 0867dh		;7b20
	call L_7D43		;7b23
	ld a,007h		;7b26
	ld hl,0d220h		;7b28
	call L_7C04		;7b2b
L_7B2E:
	ld hl,0e25bh		;7b2e
	inc (hl)			;7b31
	ret			;7b32
L_7B33:
	call 041bfh		;7b33
	ld hl,0bc44h		;7b36
	ld de,0f038h		;7b39
	ld bc,0020dh		;7b3c
	call 0514ch		;7b3f
	jp 0418ah		;7b42
L_7B45:
	ld a,(0e20ch)		;7b45
	rla			;7b48
	jr nc,L_7B6A		;7b49
	ld a,(0e260h)		;7b4b
	sub 009h		;7b4e
	jp z,L_7D6D		;7b50
	dec a			;7b53
	jr z,L_7BAA		;7b54
	sub 004h		;7b56
	cp 003h		;7b58
	jp nc,L_7CB3		;7b5a
	call L_7C27		;7b5d
	ld a,007h		;7b60
	ld hl,0d200h		;7b62
	call L_7C04		;7b65
	jr L_7B9A		;7b68
L_7B6A:
	call L_7BDA		;7b6a
	ld hl,0e260h		;7b6d
	ld a,(0e207h)		;7b70
	rra			;7b73
	jr c,L_7BC5		;7b74
	rra			;7b76
	jr c,L_7BCF		;7b77
	rra			;7b79
	rra			;7b7a
	rra			;7b7b
	ret nc			;7b7c
	push hl			;7b7d
	call L_7C27		;7b7e
	ld a,007h		;7b81
	ld hl,0d200h		;7b83
	call L_7C04		;7b86
	pop hl			;7b89
	ld a,(hl)			;7b8a
	cp 009h		;7b8b
	jp z,L_7D6D		;7b8d
	cp 00ah		;7b90
	jr z,L_7BAA		;7b92
	sub 004h		;7b94
	cp 003h		;7b96
	jr nc,L_7BA4		;7b98
L_7B9A:
	xor a			;7b9a
	ld (0e261h),a		;7b9b
	call L_7C0E		;7b9e
	jp L_7B2E		;7ba1
L_7BA4:
	ld hl,0e25bh		;7ba4
	inc (hl)			;7ba7
	inc (hl)			;7ba8
	ret			;7ba9
L_7BAA:
	ld a,005h		;7baa
	ld (0e25bh),a		;7bac
	call 05d41h		;7baf
	call 04e98h		;7bb2
	xor a			;7bb5
	call 0886ah		;7bb6
	call 041bfh		;7bb9
	ld hl,0be77h		;7bbc
	call 051d0h		;7bbf
	jp 0418ah		;7bc2
L_7BC5:
	call 042cbh		;7bc5
	dec (hl)			;7bc8
	ld a,(hl)			;7bc9
	rla			;7bca
	ret nc			;7bcb
	ld (hl),00ah		;7bcc
	ret			;7bce
L_7BCF:
	call 042cbh		;7bcf
	inc (hl)			;7bd2
	ld a,(hl)			;7bd3
	cp 00bh		;7bd4
	ret c			;7bd6
	ld (hl),000h		;7bd7
	ret			;7bd9
L_7BDA:
	ld b,010h		;7bda
	ld a,(0e260h)		;7bdc
	ld hl,0e800h		;7bdf
L_7BE2:
	add a,a			;7be2
	add a,a			;7be3
	add a,a			;7be4
	add a,a			;7be5
	add a,010h		;7be6
	ld (hl),a			;7be8
	inc hl			;7be9
	ld (hl),b			;7bea
	inc hl			;7beb
	ld (hl),014h		;7bec
	ld de,0d200h		;7bee
	ld a,l			;7bf1
	and 07ch		;7bf2
	ld h,000h		;7bf4
	ld l,a			;7bf6
	add hl,hl			;7bf7
	add hl,hl			;7bf8
	add hl,de			;7bf9
	ld a,(0e203h)		;7bfa
	and 008h		;7bfd
	ld a,007h		;7bff
	jr z,L_7C04		;7c01
	xor a			;7c03
L_7C04:
	ld d,h			;7c04
	ld e,l			;7c05
	inc de			;7c06
	ld (hl),a			;7c07
	ld bc,0000fh		;7c08
	ldir		;7c0b
	ret			;7c0d
L_7C0E:
	call 041bfh		;7c0e
	ld a,(0e260h)		;7c11
	sub 004h		;7c14
	ld hl,0bcbbh		;7c16
	call 04d4ch		;7c19
	ld a,(hl)			;7c1c
	ld (0e263h),a		;7c1d
	inc hl			;7c20
	call 051d0h		;7c21
	jp 0418ah		;7c24
L_7C27:
	ld hl,0a010h		;7c27
	ld bc,05078h		;7c2a
	ld a,0ffh		;7c2d
	ld d,000h		;7c2f
	call 04fedh		;7c31
	ld a,0e0h		;7c34
	ld (0e804h),a		;7c36
	ret			;7c39
L_7C3A:
	ld a,(0e20ch)		;7c3a
	rla			;7c3d
	jp c,L_7CB3		;7c3e
	call L_7C77		;7c41
	ld hl,0e261h		;7c44
	ld a,(0e207h)		;7c47
	rra			;7c4a
	jr c,L_7C5F		;7c4b
	rra			;7c4d
	jr c,L_7C6B		;7c4e
	rra			;7c50
	rra			;7c51
	rra			;7c52
	ret nc			;7c53
	ld a,007h		;7c54
	ld hl,0d210h		;7c56
	call L_7C04		;7c59
	jp L_7B2E		;7c5c
L_7C5F:
	call 042cbh		;7c5f
	dec (hl)			;7c62
	ld a,(hl)			;7c63
	rla			;7c64
	ret nc			;7c65
	ld a,(0e263h)		;7c66
	ld (hl),a			;7c69
	ret			;7c6a
L_7C6B:
	call 042cbh		;7c6b
	inc (hl)			;7c6e
	ld a,(0e263h)		;7c6f
	cp (hl)			;7c72
	ret nc			;7c73
	ld (hl),000h		;7c74
	ret			;7c76
L_7C77:
	ld b,088h		;7c77
	ld a,(0e261h)		;7c79
	ld hl,0e804h		;7c7c
	jp L_7BE2		;7c7f
L_7C82:
	ld a,(0e20ch)		;7c82
	rla			;7c85
	jp c,L_7CB3		;7c86
	call L_7D43		;7c89
	ld hl,0e262h		;7c8c
	ld de,0e788h		;7c8f
	ld a,(0e207h)		;7c92
	rra			;7c95
	jr c,$+123		;7c96
	rra			;7c98
	jr c,$+129		;7c99
	rra			;7c9b
	jp c,L_7D31		;7c9c
	rra			;7c9f
	jp c,L_7D39		;7ca0
	rra			;7ca3
	ret nc			;7ca4
	ld a,007h		;7ca5
	ld hl,0d220h		;7ca7
	call L_7C04		;7caa
	ld a,001h		;7cad
	ld (0e25bh),a		;7caf
	ret			;7cb2
L_7CB3:
	call 04e98h		;7cb3
	ld hl,0e264h		;7cb6
	ld (hl),00bh		;7cb9
	inc hl			;7cbb
	ld (hl),00fh		;7cbc
	call 05d41h		;7cbe
	call L_7DA0		;7cc1
	ld a,004h		;7cc4
	ld (0e25bh),a		;7cc6
	ld a,(0e260h)		;7cc9
	ld b,a			;7ccc
	add a,a			;7ccd
	add a,b			;7cce
	ld hl,07ce4h		;7ccf
	call 0408fh		;7cd2
	ld a,(hl)			;7cd5
	ld (0e27ch),a		;7cd6
	inc hl			;7cd9
	ld a,(hl)			;7cda
	ld (0e27dh),a		;7cdb
	inc hl			;7cde
	ld a,(hl)			;7cdf
	ld (0e2fbh),a		;7ce0
	ret			;7ce3

; ----------------------------------------------------------------------
; DATOS sin identificar  0x7ce4..0x7cff  (27 bytes)
DATA_7CE4:
	defb 018h,020h,000h,018h,020h,000h,018h,01eh,001h,016h,01eh,011h,016h,01eh,011h,016h	; 7ce4  . .. ...........
	defb 01eh,011h,016h,01eh,011h,016h,01eh,011h,014h,01ch,011h	; 7cf4  ...........

; ======================================================================
; CODIGO 0x7cff..0x7e6f  (368 bytes)
; ======================================================================


L_7CFF:
	ld hl,0e788h		;7cff
	ld c,000h		;7d02
L_7D04:
	ld a,(hl)			;7d04
	dec a			;7d05
	jr z,L_7D0C		;7d06
	inc hl			;7d08
	inc c			;7d09
	jr L_7D04		;7d0a
L_7D0C:
	ld a,c			;7d0c
	ld (0e262h),a		;7d0d
	ret			;7d10
L_7D11:
	ld a,(hl)			;7d11
	and 038h		;7d12
	ret z			;7d14
	ld a,(hl)			;7d15
	sub 008h		;7d16
	jr L_7D26		;7d18
L_7D1A:
	ld a,(hl)			;7d1a
	and 038h		;7d1b
	rrca			;7d1d
	rrca			;7d1e
	rrca			;7d1f
	cp 005h		;7d20
	ret nc			;7d22
	ld a,(hl)			;7d23
	add a,008h		;7d24
L_7D26:
	ld b,a			;7d26
	call 04094h		;7d27
	ld a,(de)			;7d2a
	and a			;7d2b
	ret z			;7d2c
	ld (hl),b			;7d2d
	jp 042cbh		;7d2e
L_7D31:
	ld a,(hl)			;7d31
	and 007h		;7d32
	ret z			;7d34
	ld a,(hl)			;7d35
	dec a			;7d36
	jr L_7D26		;7d37
L_7D39:
	ld a,(hl)			;7d39
	and 007h		;7d3a
	cp 005h		;7d3c
	ret nc			;7d3e
	ld a,(hl)			;7d3f
	inc a			;7d40
	jr L_7D26		;7d41
L_7D43:
	ld a,(0e262h)		;7d43
	ld b,a			;7d46
	and 038h		;7d47
	add a,08fh		;7d49
	ld hl,0e808h		;7d4b
	ld (hl),a			;7d4e
	inc hl			;7d4f
	ld a,b			;7d50
	and 007h		;7d51
	add a,a			;7d53
	add a,a			;7d54
	add a,a			;7d55
	add a,0a0h		;7d56
	ld (hl),a			;7d58
	inc hl			;7d59
	ld (hl),018h		;7d5a
	inc hl			;7d5c
	ld a,(0e203h)		;7d5d
	and 008h		;7d60
	ld a,007h		;7d62
	jr z,L_7D67		;7d64
	xor a			;7d66
L_7D67:
	ld hl,0d220h		;7d67
	jp L_7C04		;7d6a
L_7D6D:
	ld hl,0e26ah		;7d6d
	ld a,(hl)			;7d70
	inc hl			;7d71
	and (hl)			;7d72
	ret z			;7d73
	call L_7D86		;7d74
	call 04e98h		;7d77
	call 05d41h		;7d7a
	call L_799C		;7d7d
	ld a,001h		;7d80
	ld (0e25bh),a		;7d82
	ret			;7d85
L_7D86:
	ld hl,0e700h		;7d86
	ld bc,01000h		;7d89
L_7D8C:
	ld a,(hl)			;7d8c
	and a			;7d8d
	jr z,L_7D91		;7d8e
	inc c			;7d90
L_7D91:
	ld a,008h		;7d91
	call 0408fh		;7d93
	djnz L_7D8C		;7d96
	ld a,c			;7d98
	ld (0e2f4h),a		;7d99
	ld (0e2f5h),a		;7d9c
	ret			;7d9f
L_7DA0:
	call L_7E35		;7da0
	ld a,(0e26ch)		;7da3
	and a			;7da6
	call nz,083e3h		;7da7
	call L_7F39		;7daa
	ld c,a			;7dad
	ld ix,0e700h		;7dae
	ld b,010h		;7db2
L_7DB4:
	push bc			;7db4
	ld a,(ix+000h)		;7db5
	and a			;7db8
	jr z,L_7DC4		;7db9
	ld a,(ix+001h)		;7dbb
	cp c			;7dbe
	jr nz,L_7DC4		;7dbf
	call L_653D		;7dc1
L_7DC4:
	ld bc,00008h		;7dc4
	add ix,bc		;7dc7
	pop bc			;7dc9
	djnz L_7DB4		;7dca
	call L_7F39		;7dcc
	ld hl,0e2f3h		;7dcf
	cp (hl)			;7dd2
	jr nz,L_7DE9		;7dd3
	dec hl			;7dd5
	ld d,(hl)			;7dd6
	dec hl			;7dd7
	ld e,(hl)			;7dd8
	ld hl,09340h		;7dd9
	ld bc,00404h		;7ddc
	push bc			;7ddf
	push de			;7de0
	call 05737h		;7de1
	pop hl			;7de4
	pop bc			;7de5
	call 0860eh		;7de6
L_7DE9:
	call L_7F39		;7de9
	ld c,a			;7dec
	ld hl,0e300h		;7ded
	ld b,040h		;7df0
L_7DF2:
	push bc			;7df2
	ld a,(hl)			;7df3
	and a			;7df4
	push hl			;7df5
	jr z,L_7E0D		;7df6
	inc hl			;7df8
	ld e,(hl)			;7df9
	inc hl			;7dfa
	ld d,(hl)			;7dfb
	dec a			;7dfc
	ld b,a			;7dfd
	inc hl			;7dfe
	ld a,(hl)			;7dff
	cp c			;7e00
	jr nz,L_7E0D		;7e01
	ld a,b			;7e03
	call 08537h		;7e04
	ld bc,00202h		;7e07
	call 05737h		;7e0a
L_7E0D:
	pop hl			;7e0d
	ld a,008h		;7e0e
	call 0408fh		;7e10
	pop bc			;7e13
	djnz L_7DF2		;7e14
	ld a,(0e267h)		;7e16
	and a			;7e19
	call nz,0821ch		;7e1a
	ld a,(0e266h)		;7e1d
	and a			;7e20
	call nz,0811fh		;7e21
	ld a,(0e26bh)		;7e24
	and a			;7e27
	ret z			;7e28
	ld a,(0e243h)		;7e29
	ld b,a			;7e2c
	call L_7F39		;7e2d
	cp b			;7e30
	call z,08046h		;7e31
	ret			;7e34
L_7E35:
	call L_7F39		;7e35
	dec a			;7e38
	ld h,000h		;7e39
	ld l,a			;7e3b
	call 05d32h		;7e3c
	push hl			;7e3f
	pop ix		;7e40
	xor a			;7e42
	ld (0efc0h),a		;7e43
	jp 04553h		;7e46
L_7E49:
	call 08a38h		;7e49
	and a			;7e4c
	ret z			;7e4d
	dec a			;7e4e
	jr z,L_7E56		;7e4f
	xor a			;7e51
	ld (0e25bh),a		;7e52
	ret			;7e55
L_7E56:
	xor a			;7e56
	ld (0e25ah),a		;7e57
	ret			;7e5a
L_7E5B:
	ld a,(0e20ch)		;7e5b
	rla			;7e5e
	jr nc,L_7E66		;7e5f
	xor a			;7e61
	ld (0e25bh),a		;7e62
	ret			;7e65
L_7E66:
	call 08641h		;7e66
	ld a,(0e260h)		;7e69
	call 04099h		;7e6c

; ----------------------------------------------------------------------
; DATOS sin identificar  0x7e6f..0x7e81  (18 bytes)
DATA_7E6F:
	defb 081h,07eh,044h,07fh,04ah,07fh,018h,080h,0a7h,080h,0b7h,081h,077h,084h,03fh,085h	; 7e6f  .~D.J.......w.?.
	defb 0d4h,085h	; 7e7f

; ======================================================================
; CODIGO 0x7e81..0x7ffe  (381 bytes)
; ======================================================================


L_7E81:
	ld hl,00502h		;7e81
L_7E84:
	ld (0efd0h),hl		;7e84
	call 0871bh		;7e87
	call L_7FF0		;7e8a
	ret c			;7e8d
	ld a,(0e207h)		;7e8e
	and 030h		;7e91
	ret z			;7e93
	and 010h		;7e94
	jr nz,L_7E9C		;7e96
	xor a			;7e98
	ld (0efd0h),a		;7e99
L_7E9C:
	ld a,(0efd0h)		;7e9c
	ld b,a			;7e9f
	call L_7F39		;7ea0
	ld h,a			;7ea3
	call L_7F2A		;7ea4
	ex de,hl			;7ea7
	push hl			;7ea8
	ld a,d			;7ea9
	exx			;7eaa
	call 09571h		;7eab
	pop hl			;7eae
	call 098e6h		;7eaf
	exx			;7eb2
	ld c,a			;7eb3
	ld a,b			;7eb4
	and a			;7eb5
	jr nz,L_7EBE		;7eb6
	ld a,c			;7eb8
	cp 002h		;7eb9
	jr nc,L_7EC1		;7ebb
	ret			;7ebd
L_7EBE:
	ld a,c			;7ebe
	dec a			;7ebf
	ret z			;7ec0
L_7EC1:
	ld a,b			;7ec1
	push hl			;7ec2
	push hl			;7ec3
	push af			;7ec4
	ld bc,00101h		;7ec5
	call L_63ED		;7ec8
	pop af			;7ecb
	pop de			;7ecc
	and a			;7ecd
	jr nz,L_7ED5		;7ece
	ld a,0e0h		;7ed0
	ld (0efd1h),a		;7ed2
L_7ED5:
	ld a,(0efd1h)		;7ed5
	call 0576ah		;7ed8
	pop de			;7edb
	push de			;7edc
	call L_7F10		;7edd
	pop hl			;7ee0
	and a			;7ee1
	ret z			;7ee2
	ld d,a			;7ee3
	dec c			;7ee4
	dec c			;7ee5
	dec c			;7ee6
	jr nz,L_7EF0		;7ee7
	push hl			;7ee9
	ld h,0f8h		;7eea
	call L_7EF4		;7eec
	pop hl			;7eef
L_7EF0:
	dec c			;7ef0
	ret nz			;7ef1
	ld h,000h		;7ef2
L_7EF4:
	push bc			;7ef4
	push de			;7ef5
	ld bc,00101h		;7ef6
	ld a,(0efd0h)		;7ef9
	push hl			;7efc
	push de			;7efd
	call L_63ED		;7efe
	call L_7F39		;7f01
	pop bc			;7f04
	pop de			;7f05
	cp b			;7f06
	ld a,(0efd1h)		;7f07
	call z,0576ah		;7f0a
	pop de			;7f0d
	pop bc			;7f0e
	ret			;7f0f
L_7F10:
	ld c,003h		;7f10
	ld a,d			;7f12
	and a			;7f13
	jr z,L_7F1E		;7f14
	inc c			;7f16
	cp 0f8h		;7f17
	jr z,L_7F1E		;7f19
	xor a			;7f1b
	ld c,a			;7f1c
	ret			;7f1d
L_7F1E:
	ld a,(0e262h)		;7f1e
	ld b,a			;7f21
	ld a,c			;7f22
	push bc			;7f23
	call 05e38h		;7f24
	pop bc			;7f27
	ld a,l			;7f28
	ret			;7f29
L_7F2A:
	ld a,(0e264h)		;7f2a
	add a,a			;7f2d
	add a,a			;7f2e
	add a,a			;7f2f
	ld e,a			;7f30
	ld a,(0e265h)		;7f31
	add a,a			;7f34
	add a,a			;7f35
	add a,a			;7f36
	ld d,a			;7f37
	ret			;7f38
L_7F39:
	ld de,0e788h		;7f39
	ld a,(0e262h)		;7f3c
	call 04094h		;7f3f
	ld a,(de)			;7f42
	ret			;7f43
L_7F44:
	ld hl,05e03h		;7f44
	jp L_7E84		;7f47
L_7F4A:
	call 0871bh		;7f4a
	call L_7FF5		;7f4d
	ret c			;7f50
	ld a,(0e207h)		;7f51
	and 030h		;7f54
	ret z			;7f56
	and 010h		;7f57
	ld a,001h		;7f59
	jr nz,L_7F5E		;7f5b
	xor a			;7f5d
L_7F5E:
	ld (0efd0h),a		;7f5e
	ld b,a			;7f61
	call L_7F39		;7f62
	ld h,a			;7f65
	exx			;7f66
	call 09571h		;7f67
	ld (0e250h),de		;7f6a
	exx			;7f6e
	call L_7F2A		;7f6f
	ex de,hl			;7f72
	ld a,b			;7f73
	and a			;7f74
	jr nz,L_7F8F		;7f75
	push hl			;7f77
	exx			;7f78
	pop hl			;7f79
	ld de,(0e250h)		;7f7a
	push hl			;7f7e
	call 098e6h		;7f7f
	pop hl			;7f82
	dec a			;7f83
	ret nz			;7f84
	call 0a60fh		;7f85
	exx			;7f88
	jr nc,L_7F8F		;7f89
	ld a,h			;7f8b
	sub 008h		;7f8c
	ld h,a			;7f8e
L_7F8F:
	ld a,b			;7f8f
	push hl			;7f90
	push af			;7f91
	ld bc,00102h		;7f92
	push hl			;7f95
	call L_63ED		;7f96
	pop de			;7f99
	call L_7FB5		;7f9a
	pop af			;7f9d
	pop de			;7f9e
	and a			;7f9f
	jr z,L_7FA4		;7fa0
	ld a,003h		;7fa2
L_7FA4:
	push af			;7fa4
	push de			;7fa5
	call 0576ah		;7fa6
	pop de			;7fa9
	ld a,d			;7faa
	add a,008h		;7fab
	ld d,a			;7fad
	pop af			;7fae
	jr z,L_7FB2		;7faf
	inc a			;7fb1
L_7FB2:
	jp 0576ah		;7fb2
L_7FB5:
	push de			;7fb5
	call L_7FE1		;7fb6
	pop hl			;7fb9
	and a			;7fba
	ret z			;7fbb
	ld d,a			;7fbc
	dec c			;7fbd
	ld l,0b8h		;7fbe
	jr z,L_7FC4		;7fc0
	ld l,000h		;7fc2
L_7FC4:
	ld bc,00102h		;7fc4
	ld a,(0efd0h)		;7fc7
	push hl			;7fca
	push de			;7fcb
	call L_63ED		;7fcc
	call L_7F39		;7fcf
	pop bc			;7fd2
	pop de			;7fd3
	cp b			;7fd4
	ret nz			;7fd5
	ld a,(0efd0h)		;7fd6
	and a			;7fd9
	jr z,L_7FDE		;7fda
	ld a,003h		;7fdc
L_7FDE:
	jp L_7FA4		;7fde
L_7FE1:
	ld c,001h		;7fe1
	ld a,e			;7fe3
	and a			;7fe4
	jp z,L_7F1E		;7fe5
	inc c			;7fe8
	cp 0b8h		;7fe9
	jp z,L_7F1E		;7feb
	xor a			;7fee
	ret			;7fef
L_7FF0:
	ld bc,02000h		;7ff0
	jr L_7FF8		;7ff3
L_7FF5:
	ld bc,02808h		;7ff5
L_7FF8:
	ld a,(0e26ah)		;7ff8
	and a			;7ffb
	jr z,$+26		;7ffc

; ----------------------------------------------------------------------
; DATOS sin identificar  0x7ffe..0x8000  (2 bytes)
DATA_7FFE:
	defb 021h,0f3h	; 7ffe
