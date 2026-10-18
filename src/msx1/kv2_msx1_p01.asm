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
; DATOS sin identificar  0x6000..0x6002  (2 bytes)
DATA_6000:
	defb 043h,0e2h	; 6000

; ======================================================================
; CODIGO 0x6002..0x60d5  (211 bytes)
; ======================================================================


L_6002:
	ld hl,0e788h		;6002
	ld c,007h		;6005
L_6007:
	ld b,008h		;6007
L_6009:
	cp (hl)			;6009
	jr z,L_6013		;600a
	inc hl			;600c
	djnz L_6009		;600d
	dec c			;600f
	jr nz,L_6007		;6010
	ret			;6012
L_6013:
	ld hl,0e282h		;6013
	call L_610B		;6016
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
	call L_611F		;602d
	ld hl,0e804h		;6030
	dec e			;6033
	ld (hl),e			;6034
	inc hl			;6035
	ld a,d			;6036
	sub 003h		;6037
	ld (hl),a			;6039
	inc hl			;603a
	ld (hl),004h		;603b
	inc hl			;603d
	ld (hl),006h		;603e
	ret			;6040
L_6041:
	ld a,(0e2f3h)		;6041
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
	ld hl,0e2f1h		;6055
	call L_60BE		;6058
	call L_611F		;605b
	ld hl,0e800h		;605e
	ld (hl),e			;6061
	inc hl			;6062
	ld (hl),d			;6063
	inc hl			;6064
	ld (hl),000h		;6065
	inc hl			;6067
	ld (hl),00fh		;6068
	ret			;606a
L_606B:
	ld hl,0e700h		;606b
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
	call L_6084		;607e
	pop bc			;6081
	pop hl			;6082
	ret			;6083
L_6084:
	inc hl			;6084
	ld a,(hl)			;6085
	inc hl			;6086
	ld (0efc0h),hl		;6087
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
	ld hl,(0efc0h)		;609c
	call L_60BE		;609f
	call L_611F		;60a2
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
	call 04094h		;60b6
	ld a,(hl)			;60b9
	call 053efh		;60ba
	ret			;60bd
L_60BE:
	call L_610B		;60be
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
; DATOS sin identificar  0x60d5..0x60e1  (12 bytes)
DATA_60D5:
	defb 0eah,0ebh,0ebh,0ech,0edh,0eeh,0eeh,0efh,0f0h,0f1h,0f1h,0f2h	; 60d5  ............

; ======================================================================
; CODIGO 0x60e1..0x6128  (71 bytes)
; ======================================================================


L_60E1:
	ld hl,0e788h		;60e1
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
	call L_60FE		;60f7
	pop hl			;60fa
	pop bc			;60fb
	pop af			;60fc
	ret			;60fd
L_60FE:
	call L_610B		;60fe
	call L_611F		;6101
	ld hl,06128h		;6104
	call 04f4bh		;6107
	ret			;610a
L_610B:
	ld a,008h		;610b
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
	ld a,d			;611f
	add a,020h		;6120
	ld d,a			;6122
	ld a,e			;6123
	add a,018h		;6124
	ld e,a			;6126
	ret			;6127

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6128..0x6137  (15 bytes)
DATA_6128:
	defb 0e1h,0e2h,0e2h,0e3h,0feh,0e4h,0e5h,0e5h,0e6h,0feh,0e7h,0e8h,0e8h,0e9h,0ffh	; 6128  ...............

; ======================================================================
; CODIGO 0x6137..0x624f  (280 bytes)
; ======================================================================


L_6137:
	call 041c7h		;6137
	call L_6140		;613a
	jp 04192h		;613d
L_6140:
	ld a,(0e242h)		;6140
	ld hl,0aae0h		;6143
	call 04d4dh		;6146
	ld ix,0e600h		;6149
L_614D:
	ld a,(hl)			;614d
	ld b,a			;614e
	and a			;614f
	ret z			;6150
	rrca			;6151
	rrca			;6152
	rrca			;6153
	rrca			;6154
	and 00fh		;6155
	ld (ix+000h),a		;6157
	ld a,(hl)			;615a
	and 00fh		;615b
	ld (ix+004h),a		;615d
	ld (ix+009h),a		;6160
	inc hl			;6163
	ld a,(hl)			;6164
	ld (ix+002h),a		;6165
	inc hl			;6168
	ld a,(hl)			;6169
	ld (ix+003h),a		;616a
	inc hl			;616d
	ld a,(hl)			;616e
	rrca			;616f
	rrca			;6170
	rrca			;6171
	and 01fh		;6172
	ld (ix+008h),a		;6174
	ld a,(hl)			;6177
	and 007h		;6178
	jr z,L_6182		;617a
	set 1,(ix+007h)		;617c
	jr L_6186		;6180
L_6182:
	res 1,(ix+007h)		;6182
L_6186:
	ld b,a			;6186
	add a,a			;6187
	add a,b			;6188
	ld b,a			;6189
	ld a,(ix+000h)		;618a
	cp 001h		;618d
	jr z,L_6193		;618f
	ld b,000h		;6191
L_6193:
	ld (ix+005h),b		;6193
	ld (ix+006h),000h		;6196
	inc hl			;619a
	ld de,00010h		;619b
	add ix,de		;619e
	jr L_614D		;61a0
L_61A2:
	ld c,003h		;61a2
	jr L_61A8		;61a4
L_61A6:
	ld c,000h		;61a6
L_61A8:
	ld b,010h		;61a8
	ld ix,0e600h		;61aa
L_61AE:
	push bc			;61ae
	ld a,(ix+000h)		;61af
	and a			;61b2
	call nz,L_61BF		;61b3
	ld bc,00010h		;61b6
	add ix,bc		;61b9
	pop bc			;61bb
	djnz L_61AE		;61bc
	ret			;61be
L_61BF:
	cp 003h		;61bf
	ret z			;61c1
	cp 005h		;61c2
	jr nz,L_61D0		;61c4
	ld a,c			;61c6
	and a			;61c7
	jp z,09311h		;61c8
	ld a,(ix+001h)		;61cb
	and a			;61ce
	ret nz			;61cf
L_61D0:
	ld h,(ix+003h)		;61d0
	ld l,(ix+002h)		;61d3
	cp 002h		;61d6
	jr nz,L_61E4		;61d8
	bit 1,(ix+007h)		;61da
	jr z,L_61E4		;61de
	ld a,h			;61e0
	add a,008h		;61e1
	ld h,a			;61e3
L_61E4:
	ld a,(ix+000h)		;61e4
	ld de,l624eh		;61e7
	call 04099h		;61ea
	ld a,(de)			;61ed
	ld d,a			;61ee
	ld a,c			;61ef
	ld b,(ix+008h)		;61f0
	ld c,d			;61f3
	ld d,(ix+004h)		;61f4
L_61F7:
	ld (0efc0h),a		;61f7
	ld a,d			;61fa
	ld (0efc1h),a		;61fb
	call 04d7ch		;61fe
	ld de,03800h		;6201
	or a			;6204
	sbc hl,de		;6205
L_6207:
	push hl			;6207
	push bc			;6208
	ld b,c			;6209
L_620A:
	push hl			;620a
	ld c,l			;620b
	srl h		;620c
	rr l		;620e
	srl h		;6210
	rr l		;6212
	ld a,l			;6214
	ld hl,(0efc1h)		;6215
	dec l			;6218
	ld h,000h		;6219
	call 05b29h		;621b
	call 04094h		;621e
	push bc			;6221
	ld a,0fch		;6222
	call L_6243		;6224
	and (hl)			;6227
	ld (hl),a			;6228
	ld a,(0efc0h)		;6229
	and a			;622c
	jr z,L_6234		;622d
	call L_6243		;622f
	or (hl)			;6232
	ld (hl),a			;6233
L_6234:
	pop bc			;6234
	pop hl			;6235
	inc hl			;6236
	djnz L_620A		;6237
	pop bc			;6239
	pop hl			;623a
	ld a,020h		;623b
	call 04094h		;623d
	djnz L_6207		;6240
	ret			;6242
L_6243:
	push af			;6243
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
	ld ix,0e600h		;6254
	ld b,010h		;6258
L_625A:
	push bc			;625a
	ld a,(ix+000h)		;625b
	and a			;625e
	call nz,L_62C6		;625f
	ld bc,00010h		;6262
	add ix,bc		;6265
	pop bc			;6267
	djnz L_625A		;6268
	ret			;626a
L_626B:
	ld ix,0e600h		;626b
	ld b,010h		;626f
L_6271:
	push bc			;6271
	ld a,(ix+000h)		;6272
	cp 005h		;6275
	jr nz,L_6284		;6277
	ld a,(0e243h)		;6279
	cp (ix+004h)		;627c
	jr nz,L_6284		;627f
	call 0937ah		;6281
L_6284:
	ld bc,00010h		;6284
	add ix,bc		;6287
	pop bc			;6289
	djnz L_6271		;628a
	ret			;628c
L_628D:
	ld ix,0e600h		;628d
	ld b,010h		;6291
L_6293:
	push bc			;6293
	call L_62A5		;6294
	call L_62B8		;6297
	ld bc,00010h		;629a
	add ix,bc		;629d
	pop bc			;629f
	djnz L_6293		;62a0
	jp 0b9efh		;62a2
L_62A5:
	ld a,(ix+000h)		;62a5
	and a			;62a8
	ret z			;62a9
	dec a			;62aa
	call 0409eh		;62ab

; ----------------------------------------------------------------------
; DATOS sin identificar  0x62ae..0x62b8  (10 bytes)
DATA_62AE:
	defb 000h,0b8h,02bh,0b9h,03bh,0bah,09ch,0bah,00ch,091h	; 62ae  ..+.......

; ======================================================================
; CODIGO 0x62b8..0x62d9  (33 bytes)
; ======================================================================


L_62B8:
	ld a,(ix+007h)		;62b8
	rra			;62bb
	ret nc			;62bc
	res 0,(ix+007h)		;62bd
	ld hl,062d9h		;62c1
	jr L_62D0		;62c4
L_62C6:
	ld hl,062e3h		;62c6
	ld a,(0e243h)		;62c9
	cp (ix+004h)		;62cc
	ret nz			;62cf
L_62D0:
	ld a,(ix+000h)		;62d0
	and a			;62d3
	ret z			;62d4
	dec a			;62d5
	jp 0409fh		;62d6

; ----------------------------------------------------------------------
; DATOS sin identificar  0x62d9..0x62ed  (20 bytes)
DATA_62D9:
	defb 0beh,0b8h,0cbh,0b9h,05dh,0bah,06ah,062h,04fh,093h,0beh,0b8h,0cbh,0b9h,06ah,062h	; 62d9  ....].jbO.....jb
	defb 025h,0bbh,06ah,062h	; 62e9

; ======================================================================
; CODIGO 0x62ed..0x6408  (283 bytes)
; ======================================================================


L_62ED:
	ld hl,0e700h		;62ed
	ld b,080h		;62f0
	xor a			;62f2
L_62F3:
	ld (hl),a			;62f3
	inc hl			;62f4
	djnz L_62F3		;62f5
	call 041c7h		;62f7
	call L_6300		;62fa
	jp 04192h		;62fd
L_6300:
	ld a,(0e242h)		;6300
	ld hl,0a75dh		;6303
	call 04d4dh		;6306
	ld de,0e700h		;6309
L_630C:
	ld a,(hl)			;630c
	and a			;630d
	ret z			;630e
	rra			;630f
	rra			;6310
	rra			;6311
	rra			;6312
	and 00fh		;6313
	ld (de),a			;6315
	ld a,(hl)			;6316
	and 00fh		;6317
	inc e			;6319
	ld (de),a			;631a
	inc e			;631b
	inc hl			;631c
	ldi		;631d
	ldi		;631f
	inc e			;6321
	inc e			;6322
	inc e			;6323
	inc e			;6324
	jr L_630C		;6325
L_6327:
	ld bc,01000h		;6327
	ld ix,0e700h		;632a
L_632E:
	push bc			;632e
	ld a,(ix+000h)		;632f
	and a			;6332
	call nz,L_6340		;6333
	ld de,00008h		;6336
	add ix,de		;6339
	pop bc			;633b
	inc c			;633c
	djnz L_632E		;633d
	ret			;633f
L_6340:
	ld a,(0e243h)		;6340
	cp (ix+001h)		;6343
	ret nz			;6346
L_6347:
	ld hl,0903dh		;6347
	ld e,(ix+002h)		;634a
	ld d,(ix+003h)		;634d
	ld bc,00202h		;6350
	jp 053d6h		;6353
L_6356:
	ld ix,0e500h		;6356
	ld b,008h		;635a
L_635C:
	push bc			;635c
	ld a,(ix+000h)		;635d
	and a			;6360
	jr z,L_636D		;6361
	call L_6400		;6363
	bit 0,(ix+006h)		;6366
	call nz,L_6376		;636a
L_636D:
	ld de,00020h		;636d
	add ix,de		;6370
	pop bc			;6372
	djnz L_635C		;6373
	ret			;6375
L_6376:
	ld a,(ix+00bh)		;6376
	cp 002h		;6379
	jr c,L_639F		;637b
	ld l,(ix+004h)		;637d
	ld h,(ix+005h)		;6380
	ld e,(ix+009h)		;6383
	ld d,(ix+00ah)		;6386
	jr z,L_6398		;6389
	add hl,de			;638b
	ld a,h			;638c
	cp 0f1h		;638d
	jr nc,L_63CB		;638f
L_6391:
	ld (ix+004h),l		;6391
	ld (ix+005h),h		;6394
	ret			;6397
L_6398:
	and a			;6398
	sbc hl,de		;6399
	jr c,L_63C1		;639b
	jr L_6391		;639d
L_639F:
	ld l,(ix+002h)		;639f
	ld h,(ix+003h)		;63a2
	ld e,(ix+007h)		;63a5
	ld d,(ix+008h)		;63a8
	and a			;63ab
	jr nz,L_63B4		;63ac
	sbc hl,de		;63ae
	jr c,L_63D5		;63b0
	jr L_63BA		;63b2
L_63B4:
	add hl,de			;63b4
	ld a,h			;63b5
	cp 0b1h		;63b6
	jr nc,L_63DF		;63b8
L_63BA:
	ld (ix+002h),l		;63ba
	ld (ix+003h),h		;63bd
	ret			;63c0
L_63C1:
	ld a,003h		;63c1
	call L_63E9		;63c3
	ld hl,0f000h		;63c6
	jr L_6391		;63c9
L_63CB:
	ld a,004h		;63cb
	call L_63E9		;63cd
	ld hl,00000h		;63d0
	jr L_6391		;63d3
L_63D5:
	ld a,001h		;63d5
	call L_63E9		;63d7
	ld hl,0b000h		;63da
	jr L_63BA		;63dd
L_63DF:
	ld a,002h		;63df
	call L_63E9		;63e1
	ld hl,00000h		;63e4
	jr L_63BA		;63e7
L_63E9:
	ld b,(ix+016h)		;63e9
	call 05c2fh		;63ec
	ld (ix+016h),h		;63ef
	ld (ix+010h),l		;63f2
	ld a,l			;63f5
	call 0aa90h		;63f6
	ld (ix+00ch),e		;63f9
	ld (ix+00dh),d		;63fc
	ret			;63ff
L_6400:
	ld a,(ix+000h)		;6400
	dec a			;6403
	ret m			;6404
	call 0409eh		;6405

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6408..0x6412  (10 bytes)
DATA_6408:
	defb 0fbh,0aah,09eh,0abh,025h,0b0h,009h,0b4h,037h,064h	; 6408  ....%...7d

; ======================================================================
; CODIGO 0x6412..0x6447  (53 bytes)
; ======================================================================


L_6412:
	ld a,(0e243h)		;6412
	cp (ix+010h)		;6415
	call z,042bfh		;6418
	ld (ix+000h),005h		;641b
	xor a			;641f
	ld (ix+013h),a		;6420
	ld (ix+014h),a		;6423
	ld (ix+006h),a		;6426
	ld a,(0f0f4h)		;6429
	and a			;642c
	ret z			;642d
	ld (ix+01eh),00ah		;642e
	ld (ix+01fh),04bh		;6432
	ret			;6436
L_6437:
	ld hl,06447h		;6437
	ld de,0644bh		;643a
	call 0b45bh		;643d
	jp z,L_6510		;6440
	ld (ix+011h),a		;6443
	ret			;6446

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6447..0x644f  (8 bytes)
DATA_6447:
	defb 015h,016h,017h,0ffh,015h,016h,016h,0ffh	; 6447  ........

; ======================================================================
; CODIGO 0x644f..0x6660  (529 bytes)
; ======================================================================


L_644F:
	call L_646E		;644f
	ld a,(0f0f4h)		;6452
	and a			;6455
	ret z			;6456
	ld hl,0e843h		;6457
	ld de,0d300h		;645a
	ld c,010h		;645d
L_645F:
	ld a,(hl)			;645f
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
	ld ix,0e500h		;646e
	ld de,0e840h		;6472
	ld b,008h		;6475
	ld a,(0f0f4h)		;6477
	and a			;647a
	jr z,L_64C3		;647b
L_647D:
	push bc			;647d
	ld a,(ix+000h)		;647e
	and a			;6481
	jr z,L_64B5		;6482
	ld a,(0e243h)		;6484
	cp (ix+010h)		;6487
	jr nz,L_64B5		;648a
	ld l,(ix+011h)		;648c
	ld a,l			;648f
	inc a			;6490
	jr z,L_64B5		;6491
	ld h,000h		;6493
	add hl,hl			;6495
	call 041c7h		;6496
	ld bc,0beedh		;6499
	add hl,bc			;649c
	ld c,(ix+01eh)		;649d
	call L_64FD		;64a0
	ld c,(ix+01fh)		;64a3
	call L_64FD		;64a6
	call 04192h		;64a9
L_64AC:
	ld bc,00020h		;64ac
	add ix,bc		;64af
	pop bc			;64b1
	djnz L_647D		;64b2
	ret			;64b4
L_64B5:
	ld a,0e0h		;64b5
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
	ld a,(ix+000h)		;64c4
	and a			;64c7
	jr z,L_64F4		;64c8
	ld a,(0e243h)		;64ca
	cp (ix+010h)		;64cd
	jr nz,L_64F4		;64d0
	ld l,(ix+011h)		;64d2
	ld a,l			;64d5
	inc a			;64d6
	jr z,L_64F4		;64d7
	ld h,000h		;64d9
	call 041c7h		;64db
	ld bc,0becfh		;64de
	add hl,bc			;64e1
	ld c,(ix+01eh)		;64e2
	call L_64FD		;64e5
	call 04192h		;64e8
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
	ld a,(ix+003h)		;64fd
	dec a			;6500
	ld (de),a			;6501
	inc e			;6502
	ld a,(ix+005h)		;6503
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
	xor a			;6510
	ld (ix+000h),a		;6511
	ld (ix+013h),a		;6514
	ld a,(ix+015h)		;6517
	ld c,a			;651a
	add a,a			;651b
	add a,a			;651c
	add a,c			;651d
	ld hl,0e2c0h		;651e
	call 04094h		;6521
	set 7,(hl)		;6524
	ret			;6526
L_6527:
	ld a,(0e203h)		;6527
	and 003h		;652a
	ret nz			;652c
	ld hl,0e2c0h		;652d
	ld bc,00800h		;6530
L_6533:
	push bc			;6533
	push hl			;6534
	bit 7,(hl)		;6535
	jr z,L_654E		;6537
	inc hl			;6539
	dec (hl)			;653a
	jr nz,L_654E		;653b
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
	call 0a9e8h		;654b
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
	call 041c7h		;6559
	ld hl,0e2c0h		;655c
	ld b,028h		;655f
	xor a			;6561
L_6562:
	ld (hl),a			;6562
	inc hl			;6563
	djnz L_6562		;6564
	ld hl,0b7cdh		;6566
	ld a,(0e242h)		;6569
	call 04d4dh		;656c
	ld de,0e2c0h		;656f
L_6572:
	ld a,(hl)			;6572
	inc hl			;6573
	and a			;6574
	jp z,04192h		;6575
	or 080h		;6578
	ld (de),a			;657a
	inc e			;657b
	ld a,014h		;657c
	ld (de),a			;657e
	inc e			;657f
	ldi		;6580
	ldi		;6582
	ldi		;6584
	jr L_6572		;6586
L_6588:
	call 04ec7h		;6588
	call 041bdh		;658b
	ld hl,0b185h		;658e
	call 04f0bh		;6591
	call 04192h		;6594
	xor a			;6597
	ld (0e24bh),a		;6598
	jp L_65F6		;659b
L_659E:
	call 0564ah		;659e
	ld hl,0e24bh		;65a1
	ld a,(0e207h)		;65a4
	rra			;65a7
	jr c,L_65B8		;65a8
	rra			;65aa
	jr c,L_65C4		;65ab
	rra			;65ad
	rra			;65ae
	rra			;65af
	jr nc,L_65CF		;65b0
	ld a,001h		;65b2
	ld (0e24ah),a		;65b4
	ret			;65b7
L_65B8:
	call 042d3h		;65b8
	dec (hl)			;65bb
	ld a,(hl)			;65bc
	rla			;65bd
	jr nc,L_65CF		;65be
	ld (hl),002h		;65c0
	jr L_65CF		;65c2
L_65C4:
	call 042d3h		;65c4
	inc (hl)			;65c7
	ld a,(hl)			;65c8
	cp 003h		;65c9
	jr c,L_65CF		;65cb
	ld (hl),000h		;65cd
L_65CF:
	ld a,(hl)			;65cf
	add a,a			;65d0
	add a,a			;65d1
	add a,a			;65d2
	add a,a			;65d3
	add a,050h		;65d4
	ld hl,0e800h		;65d6
	ld (hl),a			;65d9
	inc hl			;65da
	ld (hl),050h		;65db
	inc hl			;65dd
	ld (hl),014h		;65de
	inc hl			;65e0
	ld (hl),008h		;65e1
	ld a,(0f0f4h)		;65e3
	and a			;65e6
	ret z			;65e7
	ld hl,0d200h		;65e8
	ld de,0d201h		;65eb
	ld (hl),007h		;65ee
	ld bc,0000fh		;65f0
	ldir		;65f3
	ret			;65f5
L_65F6:
	call 041bdh		;65f6
	ld a,(0f0f4h)		;65f9
	and a			;65fc
	ld de,018a0h		;65fd
	jr z,L_6605		;6600
	ld de,0f8a0h		;6602
L_6605:
	ld hl,0b1b6h		;6605
	ld bc,00020h		;6608
	call 04e06h		;660b
	jp 04192h		;660e
L_6611:
	call 04ec7h		;6611
	call 056d8h		;6614
	call 05854h		;6617
	call 05b38h		;661a
	ld a,004h		;661d
	call 05758h		;661f
	xor a			;6622
	ld (0e257h),a		;6623
	ld (0edcch),a		;6626
	ld (0edc9h),a		;6629
	ld (0edceh),a		;662c
	inc a			;662f
	ld (0edd8h),a		;6630
	ld a,0e0h		;6633
	ld (0edcbh),a		;6635
	ret			;6638
L_6639:
	ld a,(0e257h)		;6639
	cp 009h		;663c
	jr nc,L_6648		;663e
	ld a,(0e207h)		;6640
	and 010h		;6643
	jp nz,L_6752		;6645
L_6648:
	call L_6656		;6648
	ld a,(0e257h)		;664b
	cp 008h		;664e
	call c,L_74A1		;6650
	jp 0564ah		;6653
L_6656:
	ld hl,0edc9h		;6656
	inc (hl)			;6659
	ld a,(0e257h)		;665a
	call 0409eh		;665d

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6660..0x6676  (22 bytes)
DATA_6660:
	defb 076h,066h,084h,066h,090h,066h,0adh,066h,0f7h,066h,010h,067h,01fh,067h,02dh,067h	; 6660  vf.f.f.f.f.g.g-g
	defb 040h,067h,04dh,067h,072h,067h	; 6670

; ======================================================================
; CODIGO 0x6676..0x66d9  (99 bytes)
; ======================================================================


L_6676:
	call 05b38h		;6676
	ld a,010h		;6679
L_667B:
	ld hl,0e204h		;667b
	ld (hl),a			;667e
L_667F:
	ld hl,0e257h		;667f
	inc (hl)			;6682
	ret			;6683
L_6684:
	ld hl,0e204h		;6684
	dec (hl)			;6687
	ret nz			;6688
	ld a,09fh		;6689
	ld (0edcbh),a		;668b
	jr L_667F		;668e
L_6690:
	call L_7485		;6690
	ld a,(0edc9h)		;6693
	rra			;6696
	ret c			;6697
	ld hl,0edcch		;6698
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
	ld a,(0edc9h)		;66ad
	rra			;66b0
	ret c			;66b1
	ld hl,0edceh		;66b2
	inc (hl)			;66b5
	ld a,(hl)			;66b6
	cp 01eh		;66b7
	jr nc,L_66CD		;66b9
	ld hl,066d9h		;66bb
	call 04094h		;66be
	ld a,(0edcbh)		;66c1
	add a,(hl)			;66c4
	ld (0edcbh),a		;66c5
	ld hl,0edcch		;66c8
	inc (hl)			;66cb
	ret			;66cc
L_66CD:
	ld a,097h		;66cd
	ld (0edcbh),a		;66cf
	ld a,002h		;66d2
	ld (0edd8h),a		;66d4
	jr L_667F		;66d7

; ----------------------------------------------------------------------
; DATOS sin identificar  0x66d9..0x66f7  (30 bytes)
DATA_66D9:
	defb 0fdh,0fdh,0fdh,0fdh,0feh,0feh,0feh,0feh,0feh,0ffh,0ffh,0ffh,0ffh,000h,000h,000h	; 66d9  ................
	defb 000h,000h,000h,001h,001h,001h,001h,002h,002h,002h,002h,002h,003h,003h	; 66e9  ..............

; ======================================================================
; CODIGO 0x66f7..0x6800  (265 bytes)
; ======================================================================


L_66F7:
	call L_7485		;66f7
	ld a,(0edc9h)		;66fa
	rra			;66fd
	ret c			;66fe
	ld hl,0edcch		;66ff
	inc (hl)			;6702
	ld a,(hl)			;6703
	cp 0d8h		;6704
	ret c			;6706
	xor a			;6707
	ld (0edd8h),a		;6708
	ld a,010h		;670b
	jp L_667B		;670d
L_6710:
	ld hl,0e204h		;6710
	dec (hl)			;6713
	ret nz			;6714
	ld a,006h		;6715
	ld (0edd8h),a		;6717
	ld a,030h		;671a
	jp L_667B		;671c
L_671F:
	ld hl,0e204h		;671f
	dec (hl)			;6722
	ret nz			;6723
	xor a			;6724
	ld (0edd8h),a		;6725
	ld a,010h		;6728
	jp L_667B		;672a
L_672D:
	ld hl,0e204h		;672d
	dec (hl)			;6730
	ret nz			;6731
	call 05b38h		;6732
	ld a,001h		;6735
	call 053f9h		;6737
	call 0550bh		;673a
	jp L_667F		;673d
L_6740:
	call 0550bh		;6740
	ld a,(0edd4h)		;6743
	or a			;6746
	ret nz			;6747
	ld a,020h		;6748
	jp L_667B		;674a
L_674D:
	ld hl,0e204h		;674d
	dec (hl)			;6750
	ret nz			;6751
L_6752:
	call 04ec7h		;6752
	call 04eeah		;6755
	call 05b38h		;6758
	ld de,05040h		;675b
	call 056edh		;675e
	ld hl,0ac01h		;6761
	call L_73E5		;6764
	ld a,0c0h		;6767
	ld (0e204h),a		;6769
	ld a,00ah		;676c
	ld (0e257h),a		;676e
	ret			;6771
L_6772:
	ld hl,0e204h		;6772
	dec (hl)			;6775
	ret nz			;6776
	ld a,001h		;6777
	ld (0e24ah),a		;6779
	ret			;677c
L_677D:
	call L_6795		;677d
	ld a,0ffh		;6780
	ld (0ede1h),a		;6782
	ld hl,06800h		;6785
	call 04f0bh		;6788
	ld de,05ca0h		;678b
	ld hl,0edd9h		;678e
	call 04f15h		;6791
	ret			;6794
L_6795:
	ld de,0ede2h		;6795
	ld a,(0e242h)		;6798
	ld (de),a			;679b
	inc de			;679c
	ld h,a			;679d
	ld a,(0e240h)		;679e
	ld (de),a			;67a1
	inc de			;67a2
	ld l,a			;67a3
	ld a,r		;67a4
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
	ld de,0edd9h		;67b8
	ld a,h			;67bb
	ld (0ede5h),a		;67bc
	call L_67E1		;67bf
	ld h,l			;67c2
	ld a,h			;67c3
	ld (0ede6h),a		;67c4
	call L_67E1		;67c7
	ld h,c			;67ca
	ld a,h			;67cb
	ld (0ede7h),a		;67cc
	call L_67E1		;67cf
	ld hl,0ede5h		;67d2
	ld a,(hl)			;67d5
	inc hl			;67d6
	add a,(hl)			;67d7
	inc hl			;67d8
	add a,(hl)			;67d9
	inc hl			;67da
	ld (hl),a			;67db
	ld h,a			;67dc
	call L_67E1		;67dd
	ret			;67e0
L_67E1:
	ld a,h			;67e1
	rrca			;67e2
	rrca			;67e3
	rrca			;67e4
	rrca			;67e5
	and 00fh		;67e6
	call L_67F6		;67e8
	ld (de),a			;67eb
	inc de			;67ec
	ld a,h			;67ed
	and 00fh		;67ee
	call L_67F6		;67f0
	ld (de),a			;67f3
	inc de			;67f4
	ret			;67f5
L_67F6:
	ld b,0e1h		;67f6
	cp 019h		;67f8
	jr c,L_67FE		;67fa
	ld b,0d1h		;67fc
L_67FE:
	add a,b			;67fe
	ret			;67ff

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6800..0x680c  (12 bytes)
DATA_6800:
	defb 058h,090h,0f0h,0e1h,0f3h,0f3h,000h,0f7h,0efh,0f2h,0e4h,0ffh	; 6800  X...........

; ======================================================================
; CODIGO 0x680c..0x6958  (332 bytes)
; ======================================================================


L_680C:
	call 04ec7h		;680c
	call L_76FA		;680f
	ld hl,0edd9h		;6812
	ld de,0eddah		;6815
	ld bc,00025h		;6818
	ld (hl),a			;681b
	ldir		;681c
	ld a,020h		;681e
	ld (0edeeh),a		;6820
	xor a			;6823
	ld (0e207h),a		;6824
	call 041c7h		;6827
	ld hl,0be91h		;682a
	call 04f0bh		;682d
	jp 04192h		;6830
L_6833:
	call 0564ah		;6833
	ld hl,0edebh		;6836
	ld a,(hl)			;6839
	or a			;683a
	jr z,L_684B		;683b
	inc hl			;683d
	dec (hl)			;683e
	ret nz			;683f
	inc hl			;6840
	ld a,(hl)			;6841
	ld (0e24ah),a		;6842
	ld hl,0edebh		;6845
	ld (hl),000h		;6848
	ret			;684a
L_684B:
	call L_6968		;684b
	ld hl,0edefh		;684e
	ld a,(0e207h)		;6851
	rra			;6854
	rra			;6855
	rra			;6856
	jp c,L_6980		;6857
	rra			;685a
	jp c,L_6987		;685b
	call L_6A2F		;685e
	call L_698F		;6861
	ld a,(0ededh)		;6864
	or a			;6867
	jr z,L_686D		;6868
	call L_6A02		;686a
L_686D:
	ld a,(0edf7h)		;686d
	rla			;6870
	ret c			;6871
	ld hl,0edd9h		;6872
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
	call L_6925		;6884
	jp z,L_68F9		;6887
	ld hl,0edd9h		;688a
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
	ld hl,0ede2h		;68a9
	ld a,(hl)			;68ac
	inc hl			;68ad
	add a,(hl)			;68ae
	inc hl			;68af
	add a,(hl)			;68b0
	inc hl			;68b1
	cp (hl)			;68b2
	jr nz,L_6906		;68b3
	ld hl,0edd9h		;68b5
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
	ld hl,0ede2h		;68cb
	ld d,(hl)			;68ce
	inc hl			;68cf
	ld e,(hl)			;68d0
	inc hl			;68d1
	ld a,(hl)			;68d2
	and 007h		;68d3
	ld b,a			;68d5
L_68D6:
	rl e		;68d6
	rl d		;68d8
	jr nc,L_68DE		;68da
	set 0,e		;68dc
L_68DE:
	or a			;68de
	djnz L_68D6		;68df
	ld a,d			;68e1
	cp 03dh		;68e2
	jr nc,L_6906		;68e4
	push de			;68e6
	call 04c02h		;68e7
	pop de			;68ea
	ld a,d			;68eb
	or a			;68ec
	jr z,L_6906		;68ed
	ld (0e242h),a		;68ef
	ld a,e			;68f2
	or a			;68f3
	jr z,L_6906		;68f4
	ld (0e240h),a		;68f6
L_68F9:
	ld hl,0edebh		;68f9
	inc (hl)			;68fc
	inc hl			;68fd
	inc hl			;68fe
	ld (hl),001h		;68ff
	ld hl,0bebeh		;6901
	jr L_6911		;6904
L_6906:
	ld hl,0edebh		;6906
	inc (hl)			;6909
	inc hl			;690a
	inc hl			;690b
	ld (hl),002h		;690c
	ld hl,0beadh		;690e
L_6911:
	call 041c7h		;6911
	call 04f0bh		;6914
	call 04192h		;6917
	call 05b38h		;691a
	ld hl,0edebh		;691d
	inc (hl)			;6920
	inc hl			;6921
	ld (hl),080h		;6922
	ret			;6924
L_6925:
	ld de,06958h		;6925
	call L_6948		;6928
	jr z,L_693E		;692b
	ld de,06960h		;692d
	call L_6948		;6930
	ret nz			;6933
	call 04c02h		;6934
	ld a,001h		;6937
	ld (0e217h),a		;6939
	xor a			;693c
	ret			;693d
L_693E:
	call 04c02h		;693e
	ld a,001h		;6941
	ld (0e255h),a		;6943
	xor a			;6946
	ret			;6947
L_6948:
	ld hl,0edd9h		;6948
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
; DATOS sin identificar  0x6958..0x6968  (16 bytes)
DATA_6958:
	defb 046h,045h,053h,054h,049h,056h,041h,04ch,054h,052h,059h,041h,047h,041h,049h,04eh	; 6958  FESTIVALTRYAGAIN

; ======================================================================
; CODIGO 0x6968..0x6a27  (191 bytes)
; ======================================================================


L_6968:
	ld hl,0e800h		;6968
	ld (hl),06fh		;696b
	inc hl			;696d
	ld a,(0edefh)		;696e
	ld de,06a27h		;6971
	call 04099h		;6974
	ld a,(de)			;6977
	ld (hl),a			;6978
	inc hl			;6979
	ld (hl),020h		;697a
	inc hl			;697c
	jp 08598h		;697d
L_6980:
	ld a,(hl)			;6980
	and a			;6981
	ret z			;6982
	dec (hl)			;6983
	jp 042d3h		;6984
L_6987:
	ld a,(hl)			;6987
	cp 007h		;6988
	ret nc			;698a
	inc (hl)			;698b
	jp 042d3h		;698c
L_698F:
	ld a,(0edf0h)		;698f
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
	ld a,(0edf8h)		;69c6
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
	ld hl,0edeeh		;69f5
	ld c,(hl)			;69f8
	ld (hl),a			;69f9
	cp c			;69fa
	jr nz,L_69FE		;69fb
	xor a			;69fd
L_69FE:
	ld (0ededh),a		;69fe
	ret			;6a01
L_6A02:
	ld a,(0edefh)		;6a02
	ld hl,06a27h		;6a05
	call 04094h		;6a08
	ld d,(hl)			;6a0b
	ld e,070h		;6a0c
	ld a,(0ededh)		;6a0e
	call 053efh		;6a11
	ld a,(0edefh)		;6a14
	ld hl,0edd9h		;6a17
	call 04094h		;6a1a
	ld a,(0ededh)		;6a1d
	ld (hl),a			;6a20
	ld hl,0edefh		;6a21
	jp L_6987		;6a24

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6a27..0x6a2f  (8 bytes)
DATA_6A27:
	defb 060h,068h,070h,078h,080h,088h,090h,098h	; 6a27  `hpx....

; ======================================================================
; CODIGO 0x6a2f..0x6a6e  (63 bytes)
; ======================================================================


L_6A2F:
	ld hl,0edfah		;6a2f
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
	call L_6A86		;6a49
	call L_6AA8		;6a4c
	ld a,(0f0e4h)		;6a4f
	ld (0fd9ah),a		;6a52
	ret			;6a55
L_6A56:
	ld a,(0fd9ah)		;6a56
	ld (0f0e4h),a		;6a59
	ld a,0c9h		;6a5c
	ld (0fd9ah),a		;6a5e
	call L_6A86		;6a61
	call L_6B58		;6a64
	ld a,(0f0e4h)		;6a67
	ld (0fd9ah),a		;6a6a
	ret			;6a6d

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6a6e..0x6a86  (24 bytes)
DATA_6A6E:
	defb 043h,0e2h,001h,000h,05ch,0e2h,023h,000h,082h,0e2h,003h,000h,0c0h,0e2h,040h,002h	; 6a6e  C...\.#.......@.
	defb 000h,0e6h,000h,002h,000h,0e9h,0c0h,004h	; 6a7e  ........

; ======================================================================
; CODIGO 0x6a86..0x6c29  (419 bytes)
; ======================================================================


L_6A86:
	ld hl,0e270h		;6a86
	ld de,0ee00h		;6a89
	ld (0f0e0h),de		;6a8c
	ld bc,00005h		;6a90
	ldir		;6a93
	ld de,0ee05h		;6a95
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
	ld a,(0f0e9h)		;6aa3
	ld (de),a			;6aa6
	ret			;6aa7
L_6AA8:
	ld de,(0f0e0h)		;6aa8
	ld a,(0f0f7h)		;6aac
	ld h,080h		;6aaf
	call 00024h		;6ab1   ; BIOS ENASLT - Switches to specified slot and page definitively
	ld a,004h		;6ab4
	ld (08000h),a		;6ab6
	ld c,000h		;6ab9
	ld de,(0f0e0h)		;6abb
	call 08000h		;6abf
	push af			;6ac2
	ld a,(0f0e9h)		;6ac3
	ld h,080h		;6ac6
	call 00024h		;6ac8   ; BIOS ENASLT - Switches to specified slot and page definitively
	pop af			;6acb
	ld de,(0f0e0h)		;6acc
	ld a,(0f0f7h)		;6ad0
	ld h,080h		;6ad3
	call 00024h		;6ad5   ; BIOS ENASLT - Switches to specified slot and page definitively
	ld a,004h		;6ad8
	ld (08000h),a		;6ada
	ld c,002h		;6add
	ld de,(0f0e0h)		;6adf
	call 08000h		;6ae3
	push af			;6ae6
	ld a,(0f0e9h)		;6ae7
	ld h,080h		;6aea
	call 00024h		;6aec   ; BIOS ENASLT - Switches to specified slot and page definitively
	pop af			;6aef
	ld b,006h		;6af0
	ld hl,06a6eh		;6af2
L_6AF5:
	push bc			;6af5
	ld de,0ee0dh		;6af6
	ld bc,00004h		;6af9
	ldir		;6afc
	push hl			;6afe
	ld de,(0f0e0h)		;6aff
	ld a,(0f0f7h)		;6b03
	ld h,080h		;6b06
	call 00024h		;6b08   ; BIOS ENASLT - Switches to specified slot and page definitively
	ld a,004h		;6b0b
	ld (08000h),a		;6b0d
	ld c,009h		;6b10
	ld de,(0f0e0h)		;6b12
	call 08000h		;6b16
	push af			;6b19
	ld a,(0f0e9h)		;6b1a
	ld h,080h		;6b1d
	call 00024h		;6b1f   ; BIOS ENASLT - Switches to specified slot and page definitively
	pop af			;6b22
	pop hl			;6b23
	pop bc			;6b24
	or a			;6b25
	jp nz,L_6C03		;6b26
	djnz L_6AF5		;6b29
	ld de,(0f0e0h)		;6b2b
	ld a,(0f0f7h)		;6b2f
	ld h,080h		;6b32
	call 00024h		;6b34   ; BIOS ENASLT - Switches to specified slot and page definitively
	ld a,004h		;6b37
	ld (08000h),a		;6b39
	ld c,001h		;6b3c
	ld de,(0f0e0h)		;6b3e
	call 08000h		;6b42
	push af			;6b45
	ld a,(0f0e9h)		;6b46
	ld h,080h		;6b49
	call 00024h		;6b4b   ; BIOS ENASLT - Switches to specified slot and page definitively
	pop af			;6b4e
	or a			;6b4f
	jp nz,L_6C03		;6b50
	xor a			;6b53
	ld (0e27fh),a		;6b54
	ret			;6b57
L_6B58:
	ld de,(0f0e0h)		;6b58
	ld a,(0f0f7h)		;6b5c
	ld h,080h		;6b5f
	call 00024h		;6b61   ; BIOS ENASLT - Switches to specified slot and page definitively
	ld a,004h		;6b64
	ld (08000h),a		;6b66
	ld c,000h		;6b69
	ld de,(0f0e0h)		;6b6b
	call 08000h		;6b6f
	push af			;6b72
	ld a,(0f0e9h)		;6b73
	ld h,080h		;6b76
	call 00024h		;6b78   ; BIOS ENASLT - Switches to specified slot and page definitively
	pop af			;6b7b
	ld de,(0f0e0h)		;6b7c
	ld a,(0f0f7h)		;6b80
	ld h,080h		;6b83
	call 00024h		;6b85   ; BIOS ENASLT - Switches to specified slot and page definitively
	ld a,004h		;6b88
	ld (08000h),a		;6b8a
	ld c,002h		;6b8d
	ld de,(0f0e0h)		;6b8f
	call 08000h		;6b93
	push af			;6b96
	ld a,(0f0e9h)		;6b97
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
	ld a,(0f0f7h)		;6bb3
	ld h,080h		;6bb6
	call 00024h		;6bb8   ; BIOS ENASLT - Switches to specified slot and page definitively
	ld a,004h		;6bbb
	ld (08000h),a		;6bbd
	ld c,008h		;6bc0
	ld de,(0f0e0h)		;6bc2
	call 08000h		;6bc6
	push af			;6bc9
	ld a,(0f0e9h)		;6bca
	ld h,080h		;6bcd
	call 00024h		;6bcf   ; BIOS ENASLT - Switches to specified slot and page definitively
	pop af			;6bd2
	pop hl			;6bd3
	pop bc			;6bd4
	djnz L_6BA5		;6bd5
	ld de,(0f0e0h)		;6bd7
	ld a,(0f0f7h)		;6bdb
	ld h,080h		;6bde
	call 00024h		;6be0   ; BIOS ENASLT - Switches to specified slot and page definitively
	ld a,004h		;6be3
	ld (08000h),a		;6be5
	ld c,001h		;6be8
	ld de,(0f0e0h)		;6bea
	call 08000h		;6bee
	push af			;6bf1
	ld a,(0f0e9h)		;6bf2
	ld h,080h		;6bf5
	call 00024h		;6bf7   ; BIOS ENASLT - Switches to specified slot and page definitively
	pop af			;6bfa
	or a			;6bfb
	jr nz,L_6C23		;6bfc
	xor a			;6bfe
	ld (0e27fh),a		;6bff
	ret			;6c02
L_6C03:
	ld a,(0f0f7h)		;6c03
	ld h,080h		;6c06
	call 00024h		;6c08   ; BIOS ENASLT - Switches to specified slot and page definitively
	ld a,004h		;6c0b
	ld (08000h),a		;6c0d
	ld c,006h		;6c10
	ld de,(0f0e0h)		;6c12
	call 08000h		;6c16
	push af			;6c19
	ld a,(0f0e9h)		;6c1a
	ld h,080h		;6c1d
	call 00024h		;6c1f   ; BIOS ENASLT - Switches to specified slot and page definitively
	pop af			;6c22
L_6C23:
	ld a,002h		;6c23
	ld (0e27fh),a		;6c25
	ret			;6c28

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6c29..0x6c2e  (5 bytes)
DATA_6C29:
	defb 046h,049h,04ch,045h,03fh	; 6c29

; ======================================================================
; CODIGO 0x6c2e..0x6dda  (428 bytes)
; ======================================================================


L_6C2E:
	di			;6c2e
	ld a,(0fd9fh)		;6c2f
	ld (0f0e4h),a		;6c32
	ld a,0c9h		;6c35
	ld (0fd9fh),a		;6c37
	ld hl,0ee50h		;6c3a
	ld de,0ee51h		;6c3d
	ld bc,00020h		;6c40
	ld (hl),000h		;6c43
	ldir		;6c45
	ld hl,06c29h		;6c47
	ld de,0ee00h		;6c4a
	ld bc,00005h		;6c4d
	ldir		;6c50
	ld hl,0ee50h		;6c52
	ld (0ee0dh),hl		;6c55
	ld de,0ee00h		;6c58
	ld (0f0e0h),de		;6c5b
	ld a,(0f0f7h)		;6c5f
	ld h,080h		;6c62
	call 00024h		;6c64   ; BIOS ENASLT - Switches to specified slot and page definitively
	ld a,004h		;6c67
	ld (08000h),a		;6c69
	ld c,003h		;6c6c
	ld de,(0f0e0h)		;6c6e
	call 08000h		;6c72
	push af			;6c75
	ld a,(0f0e9h)		;6c76
	ld h,080h		;6c79
	call 00024h		;6c7b   ; BIOS ENASLT - Switches to specified slot and page definitively
	pop af			;6c7e
	and a			;6c7f
	jr nz,L_6CAF		;6c80
L_6C82:
	ld hl,(0ee0dh)		;6c82
	ld a,008h		;6c85
	call 04094h		;6c87
	ld (0ee0dh),hl		;6c8a
	ld a,(0f0f7h)		;6c8d
	ld h,080h		;6c90
	call 00024h		;6c92   ; BIOS ENASLT - Switches to specified slot and page definitively
	ld a,004h		;6c95
	ld (08000h),a		;6c97
	ld c,004h		;6c9a
	ld de,(0f0e0h)		;6c9c
	call 08000h		;6ca0
	push af			;6ca3
	ld a,(0f0e9h)		;6ca4
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
	ld de,0ee50h		;6cba
L_6CBD:
	ld a,(de)			;6cbd
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
	call 04099h		;6cdb
	jr L_6CBD		;6cde
L_6CE0:
	pop de			;6ce0
	ld hl,0f0e5h		;6ce1
	inc (hl)			;6ce4
	ld a,(hl)			;6ce5
	cp 003h		;6ce6
	ret nc			;6ce8
	jr L_6CD9		;6ce9
L_6CEB:
	ld b,000h		;6ceb
	ld a,(0ffa7h)		;6ced
	cp 0c9h		;6cf0
	jr z,L_6CF5		;6cf2
	inc b			;6cf4
L_6CF5:
	push bc			;6cf5
	call L_6D07		;6cf6
	pop bc			;6cf9
	ld a,(0f0f7h)		;6cfa
	inc a			;6cfd
	jr z,L_6D02		;6cfe
	set 1,b		;6d00
L_6D02:
	ld a,b			;6d02
	ld (0f0f9h),a		;6d03
	ret			;6d06
L_6D07:
	ld bc,00400h		;6d07
	ld hl,0fcc1h		;6d0a
L_6D0D:
	push bc			;6d0d
	push hl			;6d0e
	ld a,(hl)			;6d0f
	bit 7,a		;6d10
	jr nz,L_6D1A		;6d12
	ld a,c			;6d14
	call L_6D3A		;6d15
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
	ld a,0ffh		;6d24
	ld (0f0f7h),a		;6d26
	ret			;6d29
L_6D2A:
	and 080h		;6d2a
	or c			;6d2c
	ld b,004h		;6d2d
L_6D2F:
	push bc			;6d2f
	call L_6D3A		;6d30
	pop bc			;6d33
	ret c			;6d34
	add a,004h		;6d35
	djnz L_6D2F		;6d37
	ret			;6d39
L_6D3A:
	ld (0f0f7h),a		;6d3a
	ld hl,04010h		;6d3d
	call 0000ch		;6d40   ; BIOS RDSLT - Reads the value of an address in another slot
	cp 059h		;6d43
	jr nz,L_6D59		;6d45
	ld hl,04011h		;6d47
	ld a,(0f0f7h)		;6d4a
	call 0000ch		;6d4d   ; BIOS RDSLT - Reads the value of an address in another slot
	cp 05ah		;6d50
	jr nz,L_6D59		;6d52
	ld a,(0f0f7h)		;6d54
	scf			;6d57
	ret			;6d58
L_6D59:
	ld a,(0f0f7h)		;6d59
	and a			;6d5c
	ret			;6d5d
L_6D5E:
	ld bc,00400h		;6d5e
	ld hl,0fcc1h		;6d61
L_6D64:
	push bc			;6d64
	push hl			;6d65
	ld a,(hl)			;6d66
	bit 7,a		;6d67
	jr nz,L_6D71		;6d69
	ld a,c			;6d6b
	call L_6D91		;6d6c
	jr L_6D74		;6d6f
L_6D71:
	call L_6D81		;6d71
L_6D74:
	pop hl			;6d74
	pop bc			;6d75
	ret c			;6d76
	inc hl			;6d77
	inc c			;6d78
	djnz L_6D64		;6d79
	ld a,0ffh		;6d7b
	ld (0f0efh),a		;6d7d
	ret			;6d80
L_6D81:
	and 080h		;6d81
	or c			;6d83
	ld b,004h		;6d84
L_6D86:
	push bc			;6d86
	call L_6D91		;6d87
	pop bc			;6d8a
	ret c			;6d8b
	add a,004h		;6d8c
	djnz L_6D86		;6d8e
	ret			;6d90
L_6D91:
	ld (0f0efh),a		;6d91
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
	ld a,(0f0efh)		;6dc4
	and a			;6dc7
	ret			;6dc8
L_6DC9:
	call L_6DCF		;6dc9
	jp 0564ah		;6dcc
L_6DCF:
	ld hl,0edc9h		;6dcf
	inc (hl)			;6dd2
	ld a,(0e257h)		;6dd3
	dec a			;6dd6
	call 0409eh		;6dd7

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6dda..0x6dee  (20 bytes)
DATA_6DDA:
	defb 0eeh,06dh,027h,06eh,03fh,06eh,091h,06eh,0ach,06eh,0c2h,06eh,0d1h,06eh,0deh,06eh	; 6dda  .m'n?n.n.n.n.n.n
	defb 001h,06fh,027h,06fh	; 6dea

; ======================================================================
; CODIGO 0x6dee..0x6f73  (389 bytes)
; ======================================================================


L_6DEE:
	call 056c2h		;6dee
	call 05890h		;6df1
	call 05b38h		;6df4
	ld a,(0e241h)		;6df7
	dec a			;6dfa
	add a,a			;6dfb
	ld hl,06fc6h		;6dfc
	call 04094h		;6dff
	ld de,0edcbh		;6e02
	ldi		;6e05
	ldi		;6e07
	xor a			;6e09
	ld (0edc8h),a		;6e0a
	call 04ec7h		;6e0d
	call 056eah		;6e10
	call 05800h		;6e13
	call L_6FBD		;6e16
	call 04224h		;6e19
	ld a,03ch		;6e1c
L_6E1E:
	ld hl,0e204h		;6e1e
	ld (hl),a			;6e21
L_6E22:
	ld hl,0e257h		;6e22
	inc (hl)			;6e25
	ret			;6e26
L_6E27:
	call L_6FBD		;6e27
	ld hl,0e204h		;6e2a
	dec (hl)			;6e2d
	ret nz			;6e2e
	xor a			;6e2f
	ld (0edd8h),a		;6e30
	inc a			;6e33
	ld (0edceh),a		;6e34
	call L_6FA1		;6e37
	ld a,005h		;6e3a
	jp L_6E1E		;6e3c
L_6E3F:
	ld a,(0e207h)		;6e3f
	and 030h		;6e42
	jr z,L_6E5E		;6e44
	ld a,(0e241h)		;6e46
	dec a			;6e49
	add a,a			;6e4a
	ld hl,06fd0h		;6e4b
	call 04094h		;6e4e
	ld de,0edcbh		;6e51
	ldi		;6e54
	ldi		;6e56
	call L_6E8C		;6e58
	jp L_6FB4		;6e5b
L_6E5E:
	call L_6E64		;6e5e
	jp L_6FB4		;6e61
L_6E64:
	ld b,004h		;6e64
	call L_6F55		;6e66
	ld a,(0edceh)		;6e69
	cp 004h		;6e6c
	ld a,(0edd8h)		;6e6e
	call z,05782h		;6e71
	ld hl,0e204h		;6e74
	dec (hl)			;6e77
	ret nz			;6e78
	ld a,005h		;6e79
	ld (hl),a			;6e7b
	call L_6F78		;6e7c
	call L_6F64		;6e7f
	jr z,L_6E8C		;6e82
	call L_6F3C		;6e84
	ld hl,0edc8h		;6e87
	inc (hl)			;6e8a
	ret			;6e8b
L_6E8C:
	ld a,005h		;6e8c
	jp L_6E1E		;6e8e
L_6E91:
	ld b,004h		;6e91
	call L_6F55		;6e93
	ld hl,0e204h		;6e96
	dec (hl)			;6e99
	jp nz,L_6FB4		;6e9a
	xor a			;6e9d
	call 05782h		;6e9e
	call 0579ah		;6ea1
L_6EA4:
	ld a,005h		;6ea4
	call L_6E1E		;6ea6
	jp nz,L_6FB4		;6ea9
L_6EAC:
	ld b,004h		;6eac
	call L_6F55		;6eae
	ld hl,0e204h		;6eb1
	dec (hl)			;6eb4
	jp nz,L_6FB4		;6eb5
	ld a,001h		;6eb8
	call 05782h		;6eba
	call 057ach		;6ebd
	jr L_6EA4		;6ec0
L_6EC2:
	ld hl,0e204h		;6ec2
	dec (hl)			;6ec5
	ret nz			;6ec6
	xor a			;6ec7
	call 05782h		;6ec8
	call 057beh		;6ecb
	jp L_6E22		;6ece
L_6ED1:
	ld a,006h		;6ed1
	ld (0edc8h),a		;6ed3
	call 057d0h		;6ed6
	ld a,010h		;6ed9
	jp L_6E1E		;6edb
L_6EDE:
	ld hl,0e204h		;6ede
	dec (hl)			;6ee1
	ret nz			;6ee2
	ld (hl),010h		;6ee3
	ld hl,0edc8h		;6ee5
	dec (hl)			;6ee8
	ld a,(hl)			;6ee9
	cp 005h		;6eea
	push hl			;6eec
	call z,04303h		;6eed
	pop hl			;6ef0
	ld a,(hl)			;6ef1
	cp 0ffh		;6ef2
	jp nz,057d0h		;6ef4
	ld (hl),000h		;6ef7
	call 05b38h		;6ef9
	ld a,010h		;6efc
	jp L_6E1E		;6efe
L_6F01:
	ld hl,0e204h		;6f01
	dec (hl)			;6f04
	ret nz			;6f05
	ld (hl),010h		;6f06
	ld hl,0edc8h		;6f08
	inc (hl)			;6f0b
	ld a,(hl)			;6f0c
	dec a			;6f0d
	push hl			;6f0e
	call z,04303h		;6f0f
	pop hl			;6f12
	ld a,(hl)			;6f13
	cp 006h		;6f14
	call z,0429ch		;6f16
	ld a,(hl)			;6f19
	cp 007h		;6f1a
	jp nz,057d0h		;6f1c
	call 04323h		;6f1f
	ld a,0c0h		;6f22
	jp L_6E1E		;6f24
L_6F27:
	ld hl,0e204h		;6f27
	dec (hl)			;6f2a
	ret nz			;6f2b
	call 0431bh		;6f2c
	call 041e8h		;6f2f
	xor a			;6f32
	ld (0e257h),a		;6f33
	call 04ec7h		;6f36
	jp 05a3dh		;6f39
L_6F3C:
	ld hl,0edcbh		;6f3c
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
	ld hl,0edceh		;6f55
	dec (hl)			;6f58
	ret nz			;6f59
	ld (hl),b			;6f5a
	ld a,(0edd8h)		;6f5b
	xor 001h		;6f5e
	ld (0edd8h),a		;6f60
	ret			;6f63
L_6F64:
	ld a,(0e241h)		;6f64
	dec a			;6f67
	ld hl,06f73h		;6f68
	call 04094h		;6f6b
	ld a,(0edc8h)		;6f6e
	cp (hl)			;6f71
	ret			;6f72

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6f73..0x6f78  (5 bytes)
DATA_6F73:
	defb 058h,0b8h,088h,08eh,095h	; 6f73

; ======================================================================
; CODIGO 0x6f78..0x6fc6  (78 bytes)
; ======================================================================


L_6F78:
	call 041c7h		;6f78
	call L_6F81		;6f7b
	jp 04192h		;6f7e
L_6F81:
	ld hl,0ba57h		;6f81
	ld a,(0e241h)		;6f84
	dec a			;6f87
	call 04d4dh		;6f88
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
	call 041bdh		;6fa1
	ld hl,0ac13h		;6fa4
	ld a,(0e241h)		;6fa7
	dec a			;6faa
	call 04d4dh		;6fab
	call 04f0bh		;6fae
	jp 04192h		;6fb1
L_6FB4:
	call 041bdh		;6fb4
	call 0bdb2h		;6fb7
	jp 04192h		;6fba
L_6FBD:
	call 041bdh		;6fbd
	call 0bdc9h		;6fc0
	jp 04192h		;6fc3

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6fc6..0x6fda  (20 bytes)
DATA_6FC6:
	defb 02ah,04eh,03ah,02eh,062h,030h,065h,053h,052h,05eh,03bh,038h,05eh,02bh,06bh,04eh	; 6fc6  *N:.b0eSR^.8^+kN
	defb 04eh,063h,048h,046h	; 6fd6

; ======================================================================
; CODIGO 0x6fda..0x6fec  (18 bytes)
; ======================================================================


L_6FDA:
	call L_6FE0		;6fda
	jp 0564ah		;6fdd
L_6FE0:
	ld hl,0edc9h		;6fe0
	inc (hl)			;6fe3
	ld de,0e257h		;6fe4
	ld a,(de)			;6fe7
	dec a			;6fe8
	call 0409eh		;6fe9

; ----------------------------------------------------------------------
; DATOS sin identificar  0x6fec..0x7070  (132 bytes)
DATA_6FEC:
	defb 070h,070h,08ah,070h,099h,070h,0a6h,070h,0cfh,070h,0e5h,070h,0f8h,070h,00dh,071h	; 6fec  pp.p.p.p.p.p.p.q
	defb 037h,071h,050h,071h,05fh,071h,080h,071h,0b3h,071h,0c1h,071h,0d6h,071h,00eh,072h	; 6ffc  7qPq_q.q.q.q.q.r
	defb 027h,072h,04bh,072h,06ah,072h,07eh,072h,08dh,072h,09bh,072h,0c2h,072h,0cfh,072h	; 700c  'rKrjr~r.r.r.r.r
	defb 0ebh,072h,0f3h,072h,012h,073h,023h,073h,032h,073h,058h,073h,07ch,073h,091h,073h	; 701c  .r.r.s#s2sXs|s.s
	defb 0a0h,073h,0aeh,073h,07ch,073h,091h,073h,0a0h,073h,0aeh,073h,07ch,073h,091h,073h	; 702c  .s.s|s.s.s.s|s.s
	defb 0a0h,073h,0aeh,073h,07ch,073h,091h,073h,0a0h,073h,0aeh,073h,07ch,073h,091h,073h	; 703c  .s.s|s.s.s.s|s.s
	defb 0a0h,073h,0aeh,073h,07ch,073h,091h,073h,0a0h,073h,0aeh,073h,07ch,073h,091h,073h	; 704c  .s.s|s.s.s.s|s.s
	defb 0a0h,073h,0aeh,073h,07ch,073h,091h,073h,0a0h,073h,0aeh,073h,07ch,073h,091h,073h	; 705c  .s.s|s.s.s.s|s.s
	defb 0a0h,073h,0c1h,073h	; 706c

; ======================================================================
; CODIGO 0x7070..0x747d  (1037 bytes)
; ======================================================================


L_7070:
	call L_7427		;7070
	call 04ec7h		;7073
	call 05b38h		;7076
	call 05890h		;7079
	ld de,01000h		;707c
	call L_743B		;707f
	ld hl,0acc3h		;7082
	call L_73E5		;7085
	jr L_70CA		;7088
L_708A:
	ld de,01000h		;708a
	call L_744F		;708d
	ld a,(0edb1h)		;7090
	or a			;7093
	ret nz			;7094
	ld a,0f0h		;7095
	jr L_70F2		;7097
L_7099:
	ld hl,0e204h		;7099
	dec (hl)			;709c
	ret nz			;709d
	ld de,01001h		;709e
	call L_743B		;70a1
	jr L_70CA		;70a4
L_70A6:
	ld de,01001h		;70a6
	call L_744F		;70a9
	ld a,(0edb1h)		;70ac
	or a			;70af
	ret nz			;70b0
	call 04ec7h		;70b1
	xor a			;70b4
	call 05410h		;70b5
	call 05818h		;70b8
	call 05b38h		;70bb
	ld de,05010h		;70be
	call 056edh		;70c1
	call 0541bh		;70c4
	call 0423dh		;70c7
L_70CA:
	ld hl,0e257h		;70ca
	inc (hl)			;70cd
	ret			;70ce
L_70CF:
	call 0541bh		;70cf
	ld a,(0edd4h)		;70d2
	or a			;70d5
	ret nz			;70d6
	ld de,01000h		;70d7
	call L_743B		;70da
	ld hl,0ad12h		;70dd
	call L_73E5		;70e0
	jr L_70CA		;70e3
L_70E5:
	ld de,01000h		;70e5
	call L_744F		;70e8
	ld a,(0edb1h)		;70eb
	or a			;70ee
	ret nz			;70ef
	ld a,0f0h		;70f0
L_70F2:
	ld hl,0e204h		;70f2
	ld (hl),a			;70f5
	jr L_70CA		;70f6
L_70F8:
	ld hl,0e204h		;70f8
	dec (hl)			;70fb
	ret nz			;70fc
	xor a			;70fd
	call 053f9h		;70fe
	ld de,01001h		;7101
	call L_743B		;7104
	call 0550bh		;7107
	jp L_70CA		;710a
L_710D:
	ld de,01001h		;710d
	ld a,(0edb1h)		;7110
	or a			;7113
	ld b,a			;7114
	call nz,L_744F		;7115
	ld a,(0edd4h)		;7118
	or a			;711b
	jp nz,0550bh		;711c
	or b			;711f
	ret nz			;7120
	call 04ec7h		;7121
	call 04ec7h		;7124
	call 041bdh		;7127
	call 0bc54h		;712a
	call 04192h		;712d
	call L_73CC		;7130
	ld a,030h		;7133
	jr L_70F2		;7135
L_7137:
	call L_73CC		;7137
	ld hl,0e204h		;713a
	dec (hl)			;713d
	ret nz			;713e
	ld de,05020h		;713f
	call 056fch		;7142
	ld a,001h		;7145
	call 05410h		;7147
	call 0541bh		;714a
	jp L_70CA		;714d
L_7150:
	call L_73CC		;7150
	call 0541bh		;7153
	ld a,(0edd4h)		;7156
	and a			;7159
	ret nz			;715a
	ld a,0a0h		;715b
	jr L_70F2		;715d
L_715F:
	ld hl,0e204h		;715f
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
	call L_70F2		;717a
	jp 05890h		;717d
L_7180:
	call L_73CC		;7180
	ld hl,0e204h		;7183
	dec (hl)			;7186
	jr z,L_71AE		;7187
	ld a,(hl)			;7189
	and 00fh		;718a
	ret nz			;718c
	call 041bdh		;718d
	ld hl,0af37h		;7190
	ld a,(0edceh)		;7193
	ld b,a			;7196
	add a,a			;7197
	add a,b			;7198
	call 04094h		;7199
	ld d,(hl)			;719c
	inc hl			;719d
	ld e,(hl)			;719e
	inc hl			;719f
	ld a,(hl)			;71a0
	call 053efh		;71a1
	ld hl,0edceh		;71a4
	inc (hl)			;71a7
	call 04192h		;71a8
	jp 042ffh		;71ab
L_71AE:
	ld a,050h		;71ae
	jp L_70F2		;71b0
L_71B3:
	ld hl,0e204h		;71b3
	dec (hl)			;71b6
	ret nz			;71b7
	ld de,01001h		;71b8
	call L_743B		;71bb
	jp L_70CA		;71be
L_71C1:
	ld de,01001h		;71c1
	call L_744F		;71c4
	ld a,(0edb1h)		;71c7
	or a			;71ca
	ret nz			;71cb
	xor a			;71cc
	call 053f9h		;71cd
	call 0550bh		;71d0
	jp L_70CA		;71d3
L_71D6:
	call 0550bh		;71d6
	ld a,(0edd4h)		;71d9
	or a			;71dc
	ret nz			;71dd
	call 04ec7h		;71de
	call 04ec7h		;71e1
	call 056e1h		;71e4
	call 05b38h		;71e7
	ld a,080h		;71ea
	call L_746F		;71ec
	call 04eeah		;71ef
	ld de,05020h		;71f2
	call 0570eh		;71f5
	xor a			;71f8
	call 05740h		;71f9
	xor a			;71fc
	call 05728h		;71fd
	ld hl,0ad69h		;7200
	call L_73E5		;7203
	ld a,080h		;7206
	call L_70F2		;7208
	jp 042e7h		;720b
L_720E:
	call L_7409		;720e
	call L_7419		;7211
	ld hl,0e204h		;7214
	dec (hl)			;7217
	ret nz			;7218
	ld a,0f0h		;7219
	call L_746F		;721b
	ld hl,0ad58h		;721e
	call L_73E5		;7221
	jp L_70CA		;7224
L_7227:
	call L_7409		;7227
	ld a,(0e208h)		;722a
	and 030h		;722d
	ret z			;722f
	xor a			;7230
	call L_746F		;7231
	ld a,001h		;7234
	call 05740h		;7236
	xor a			;7239
	call 05728h		;723a
	call 05716h		;723d
	call 05b38h		;7240
	ld a,000h		;7243
	call L_70F2		;7245
	jp 042efh		;7248
L_724B:
	ld hl,0e204h		;724b
	dec (hl)			;724e
	ld a,(hl)			;724f
	or a			;7250
	jr z,L_725C		;7251
	cp 080h		;7253
	jp c,L_73D5		;7255
	jp z,042f3h		;7258
	ret			;725b
L_725C:
	ld bc,00007h		;725c
	call 00047h		;725f   ; BIOS WRTVDP - Writes data in the VDP-register
	call 04ec7h		;7262
	ld a,078h		;7265
	jp L_70F2		;7267
L_726A:
	ld hl,0e204h		;726a
	dec (hl)			;726d
	ret nz			;726e
	ld hl,0aeddh		;726f
	call L_73E5		;7272
	ld de,01000h		;7275
	call L_743B		;7278
	jp L_70CA		;727b
L_727E:
	ld de,01000h		;727e
	call L_744F		;7281
	ld a,(0edb1h)		;7284
	or a			;7287
	ret nz			;7288
	xor a			;7289
	jp L_70F2		;728a
L_728D:
	ld hl,0e204h		;728d
	dec (hl)			;7290
	ret nz			;7291
	ld de,01001h		;7292
	call L_743B		;7295
	jp L_70CA		;7298
L_729B:
	ld de,01001h		;729b
	call L_744F		;729e
	ld a,(0edb1h)		;72a1
	or a			;72a4
	ret nz			;72a5
	call 04ec7h		;72a6
	call 05b38h		;72a9
	call L_7427		;72ac
	ld a,00fh		;72af
	call 05758h		;72b1
	call 04229h		;72b4
	ld a,002h		;72b7
	call 05410h		;72b9
	call 0541bh		;72bc
	jp L_70CA		;72bf
L_72C2:
	call 0541bh		;72c2
	ld a,(0edd4h)		;72c5
	or a			;72c8
	ret nz			;72c9
	ld a,020h		;72ca
	jp L_70F2		;72cc
L_72CF:
	ld hl,0e204h		;72cf
	dec (hl)			;72d2
	ret nz			;72d3
	ld a,097h		;72d4
	ld (0edcbh),a		;72d6
	ld a,080h		;72d9
	ld (0edcch),a		;72db
	xor a			;72de
	ld (0edd8h),a		;72df
	ld (0edceh),a		;72e2
	call L_74A1		;72e5
	jp L_70CA		;72e8
L_72EB:
	call L_74A1		;72eb
	ld a,030h		;72ee
	jp L_70F2		;72f0
L_72F3:
	call L_74A1		;72f3
	ld hl,0e204h		;72f6
	dec (hl)			;72f9
	ret nz			;72fa
	ld a,004h		;72fb
	ld (0edd8h),a		;72fd
	call 05890h		;7300
	ld hl,0af21h		;7303
	call L_73E5		;7306
	ld de,01000h		;7309
	call L_743B		;730c
	jp L_70CA		;730f
L_7312:
	ld de,01000h		;7312
	call L_744F		;7315
	ld a,(0edb1h)		;7318
	or a			;731b
	jp nz,L_74A1		;731c
	xor a			;731f
	jp L_70F2		;7320
L_7323:
	ld hl,0e204h		;7323
	dec (hl)			;7326
	ret nz			;7327
	xor a			;7328
	ld (0edd8h),a		;7329
	call L_74A1		;732c
	jp L_70CA		;732f
L_7332:
	call L_7485		;7332
	ld hl,0edc9h		;7335
	ld a,(hl)			;7338
	and 003h		;7339
	jp nz,L_74A1		;733b
	ld hl,0edcch		;733e
	dec (hl)			;7341
	ld a,(hl)			;7342
	or a			;7343
	jp nz,L_74A1		;7344
	call 05b38h		;7347
	ld a,001h		;734a
	call 053f9h		;734c
	ld de,00101h		;734f
	call L_743B		;7352
	jp L_70CA		;7355
L_7358:
	ld de,00101h		;7358
	call L_744F		;735b
	call 0550bh		;735e
	ld a,(0edd4h)		;7361
	or a			;7364
	ld b,a			;7365
	ret nz			;7366
	ld a,(0edb1h)		;7367
	or b			;736a
	ret nz			;736b
	call 04ec7h		;736c
	call 05890h		;736f
	ld hl,0edcfh		;7372
	ld (hl),0ffh		;7375
	ld a,060h		;7377
	jp L_70F2		;7379
L_737C:
	ld hl,0e204h		;737c
	dec (hl)			;737f
	ret nz			;7380
	ld hl,0edcfh		;7381
	inc (hl)			;7384
	ld de,00c00h		;7385
	call L_743B		;7388
	call L_73F7		;738b
	jp L_70CA		;738e
L_7391:
	ld de,00c00h		;7391
	call L_744F		;7394
	ld a,(0edb1h)		;7397
	or a			;739a
	ret nz			;739b
	xor a			;739c
	jp L_70F2		;739d
L_73A0:
	ld hl,0e204h		;73a0
	dec (hl)			;73a3
	ret nz			;73a4
	ld de,00c01h		;73a5
	call L_743B		;73a8
	jp L_70CA		;73ab
L_73AE:
	ld de,00c01h		;73ae
	call L_744F		;73b1
	ld a,(0edb1h)		;73b4
	or a			;73b7
	ret nz			;73b8
	call 04ec7h		;73b9
	ld a,020h		;73bc
	jp L_70F2		;73be
L_73C1:
	ld a,(0e208h)		;73c1
	and 030h		;73c4
	ret z			;73c6
	sub a			;73c7
	ld (0e257h),a		;73c8
	ret			;73cb
L_73CC:
	call 041bdh		;73cc
	call 0bcb8h		;73cf
	jp 04192h		;73d2
L_73D5:
	ld a,(0edc9h)		;73d5
	rra			;73d8
	rra			;73d9
	ld bc,00007h		;73da
	jp c,00047h		;73dd   ; BIOS WRTVDP - Writes data in the VDP-register
	ld b,00fh		;73e0
	jp 00047h		;73e2   ; BIOS WRTVDP - Writes data in the VDP-register
L_73E5:
	call 041bdh		;73e5
	call 04f0bh		;73e8
	jp 04192h		;73eb
L_73EE:
	call 041bdh		;73ee
	call 04f0fh		;73f1
	jp 04192h		;73f4
L_73F7:
	call 041bdh		;73f7
	ld a,(0edcfh)		;73fa
	ld hl,0ad76h		;73fd
	call 04d4dh		;7400
	call 04f0bh		;7403
	jp 04192h		;7406
L_7409:
	ld a,(0edc9h)		;7409
	rra			;740c
	rra			;740d
	rra			;740e
	rra			;740f
	ld a,000h		;7410
	jp nc,05728h		;7412
	inc a			;7415
	jp 05728h		;7416
L_7419:
	ld hl,0ad69h		;7419
	ld a,(0e204h)		;741c
	rra			;741f
	rra			;7420
	rra			;7421
	rra			;7422
	jr c,L_73E5		;7423
	jr L_73EE		;7425
L_7427:
	ld hl,02000h		;7427
	ld bc,01800h		;742a
	xor a			;742d
	call 04e10h		;742e
	ld hl,00000h		;7431
	ld bc,01800h		;7434
	xor a			;7437
	jp 04e10h		;7438
L_743B:
	ld hl,0edb1h		;743b
	ld (hl),001h		;743e
	inc hl			;7440
	ld (hl),d			;7441
	inc hl			;7442
	ld (hl),000h		;7443
	ld a,010h		;7445
	rr e		;7447
	jr nc,L_746F		;7449
	ld a,0f0h		;744b
	jr L_746F		;744d
L_744F:
	ld hl,0edb2h		;744f
	dec (hl)			;7452
	ret nz			;7453
	ld (hl),d			;7454
	ld a,(0edb3h)		;7455
	inc a			;7458
	cp 004h		;7459
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
	ld hl,00680h		;746f
	ld bc,00180h		;7472
	jp 04ea8h		;7475
L_7478:
	xor a			;7478
	ld (0edb1h),a		;7479
	ret			;747c

; ----------------------------------------------------------------------
; DATOS sin identificar  0x747d..0x7485  (8 bytes)
DATA_747D:
	defb 010h,040h,070h,0f0h,0f0h,070h,040h,010h	; 747d  .@p..p@.

; ======================================================================
; CODIGO 0x7485..0x749d  (24 bytes)
; ======================================================================


L_7485:
	ld a,(0edc9h)		;7485
	and 00fh		;7488
	ret nz			;748a
	ld hl,0edceh		;748b
	inc (hl)			;748e
	ld a,(hl)			;748f
	and 003h		;7490
	ld hl,0749dh		;7492
	call 04094h		;7495
	ld a,(hl)			;7498
	ld (0edd8h),a		;7499
	ret			;749c

; ----------------------------------------------------------------------
; DATOS sin identificar  0x749d..0x74a1  (4 bytes)
DATA_749D:
	defb 001h,002h,003h,002h	; 749d

; ======================================================================
; CODIGO 0x74a1..0x74e2  (65 bytes)
; ======================================================================


L_74A1:
	ld hl,0e810h		;74a1
	ld de,074e2h		;74a4
	ld a,(0edd8h)		;74a7
	add a,a			;74aa
	add a,a			;74ab
	add a,a			;74ac
	call 04099h		;74ad
	exx			;74b0
	ld b,007h		;74b1
	exx			;74b3
	call L_74C9		;74b4
	exx			;74b7
	ld b,00ah		;74b8
	exx			;74ba
	call L_74C9		;74bb
	exx			;74be
	ld b,001h		;74bf
	exx			;74c1
	call L_74C9		;74c2
	exx			;74c5
	ld b,001h		;74c6
	exx			;74c8
L_74C9:
	ld a,(0edcch)		;74c9
	ld b,a			;74cc
	ld a,(0edcbh)		;74cd
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
; DATOS sin identificar  0x74e2..0x751a  (56 bytes)
DATA_74E2:
	defb 0ffh,000h,0fch,004h,0f8h,008h,008h,00ch,0ffh,010h,0fch,014h,0f8h,018h,008h,01ch	; 74e2  ................
	defb 0ffh,020h,0fch,024h,0f8h,028h,008h,02ch,0ffh,030h,0fch,034h,0f8h,038h,008h,03ch	; 74f2  . .$.(.,.0.4.8.<
	defb 0feh,060h,0fch,064h,0f8h,068h,008h,06ch,0feh,040h,0fch,044h,0f8h,048h,008h,04ch	; 7502  .`.d.h.l.@.D.H.L
	defb 0feh,050h,0fch,054h,0f8h,058h,008h,05ch	; 7512  .P.T.X.\

; ======================================================================
; CODIGO 0x751a..0x7521  (7 bytes)
; ======================================================================


L_751A:
	ld a,(0e25ah)		;751a
	dec a			;751d
	call 0409eh		;751e

; ----------------------------------------------------------------------
; DATOS sin identificar  0x7521..0x752d  (12 bytes)
DATA_7521:
	defb 02dh,075h,06eh,075h,08dh,075h,09eh,075h,043h,077h,045h,082h	; 7521  -unu.u.uCwE.

; ======================================================================
; CODIGO 0x752d..0x7749  (540 bytes)
; ======================================================================


L_752D:
	call 04ec7h		;752d
	ld a,001h		;7530
	ld (0e241h),a		;7532
	call 052fdh		;7535
	call L_76EA		;7538
	call L_7596		;753b
	ld a,001h		;753e
	ld (0e25bh),a		;7540
	ld hl,0e2c0h		;7543
	ld de,0e2c1h		;7546
	ld bc,00d3fh		;7549
	ld (hl),000h		;754c
	ldir		;754e
	call 05b38h		;7550
	ld hl,0e25ch		;7553
	ld de,0e25dh		;7556
	ld bc,00013h		;7559
	ld (hl),000h		;755c
	ldir		;755e
L_7560:
	ld hl,0e270h		;7560
	ld de,0e271h		;7563
	ld bc,0000bh		;7566
	ld (hl),020h		;7569
	ldir		;756b
	ret			;756d
L_756E:
	call 0879fh		;756e
	ld a,(0e25bh)		;7571
	and a			;7574
	ret nz			;7575
	call L_7596		;7576
	ld a,(0e27eh)		;7579
	and a			;757c
	ret z			;757d
	dec a			;757e
	jr nz,L_7587		;757f
	call L_7596		;7581
	jp L_7656		;7584
L_7587:
	ld a,001h		;7587
	ld (0e25ah),a		;7589
	ret			;758c
L_758D:
	call 04ec7h		;758d
	call L_7682		;7590
	call L_7694		;7593
L_7596:
	ld hl,0e25ah		;7596
	inc (hl)			;7599
	inc hl			;759a
	ld (hl),000h		;759b
	ret			;759d
L_759E:
	call L_7660		;759e
	ld a,(0e20ch)		;75a1
	rla			;75a4
	jp c,L_763A		;75a5
	ld a,(0e207h)		;75a8
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
	call L_773D		;75cd
	pop hl			;75d0
	ret z			;75d1
	dec (hl)			;75d2
	ld b,000h		;75d3
	jp L_75E9		;75d5
L_75D8:
	ld a,(hl)			;75d8
	and a			;75d9
	jr z,L_75E2		;75da
	push hl			;75dc
	call L_7717		;75dd
	pop hl			;75e0
	ret z			;75e1
L_75E2:
	ld a,(hl)			;75e2
	cp 006h		;75e3
	ret nc			;75e5
	inc (hl)			;75e6
	ld b,001h		;75e7
L_75E9:
	call L_7709		;75e9
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
	call 04094h		;75fe
	ld de,03864h		;7601
	add hl,de			;7604
	ex de,hl			;7605
	ld a,b			;7606
	and a			;7607
	ld hl,08295h		;7608
	jr z,L_7610		;760b
	ld hl,082a1h		;760d
L_7610:
	ld bc,00304h		;7610
L_7613:
	push hl			;7613
	push de			;7614
	push bc			;7615
	ld b,000h		;7616
	call 04e06h		;7618
	pop bc			;761b
	pop de			;761c
	pop hl			;761d
	ld a,004h		;761e
	call 04094h		;7620
	ld a,020h		;7623
	call 04099h		;7625
	djnz L_7613		;7628
	ret			;762a
L_762B:
	ld a,(hl)			;762b
	cp 005h		;762c
	ret nc			;762e
	inc (hl)			;762f
	jp 042d3h		;7630
L_7633:
	ld a,(hl)			;7633
	and a			;7634
	ret z			;7635
	dec (hl)			;7636
	jp 042d3h		;7637
L_763A:
	ld hl,0e788h		;763a
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
	call 083bfh		;7650
	call L_792E		;7653
L_7656:
	xor a			;7656
	ld hl,0e260h		;7657
	ld (hl),a			;765a
	inc hl			;765b
	ld (hl),a			;765c
	jp L_7596		;765d
L_7660:
	ld hl,0e800h		;7660
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
	ld hl,026b8h		;7682
	ld de,082cdh		;7685
	call 04eb7h		;7688
	ld hl,006b8h		;768b
	ld de,082e2h		;768e
	jp 04eb7h		;7691
L_7694:
	ld hl,03843h		;7694
	ld a,0d8h		;7697
	call 0004dh		;7699   ; BIOS WRTVRM - Writes data in VRAM
	ld hl,03844h		;769c
	ld bc,00018h		;769f
	ld a,0d9h		;76a2
	call 04e10h		;76a4
	ld hl,03863h		;76a7
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
	call 04094h		;76b9
	djnz L_76B0		;76bc
	pop bc			;76be
	pop hl			;76bf
	ld a,004h		;76c0
	call 04094h		;76c2
	djnz L_76AD		;76c5
	ld hl,038a4h		;76c7
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
	call 04094h		;76e4
	djnz L_76CD		;76e7
	ret			;76e9
L_76EA:
	call 0532eh		;76ea
	xor a			;76ed
	ld (0e285h),a		;76ee
	ld (0e298h),a		;76f1
	ld (0e287h),a		;76f4
	call 0565fh		;76f7
L_76FA:
	call 041c7h		;76fa
	ld de,0bbfch		;76fd
	ld hl,01880h		;7700
	call 04e55h		;7703
	jp 04192h		;7706
L_7709:
	ld hl,(0e25ch)		;7709
	ld a,l			;770c
	add a,a			;770d
	add a,a			;770e
	add a,a			;770f
	add a,h			;7710
	ld hl,0e788h		;7711
	jp 04094h		;7714
L_7717:
	call L_7709		;7717
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
	call 04094h		;772b
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
	call L_7709		;773d
	ld a,(hl)			;7740
	and a			;7741
	ret			;7742
L_7743:
	ld a,(0e25bh)		;7743
	call 0409eh		;7746

; ----------------------------------------------------------------------
; DATOS sin identificar  0x7749..0x7755  (12 bytes)
DATA_7749:
	defb 055h,077h,08bh,077h,06fh,078h,0b4h,078h,086h,07ah,074h,07ah	; 7749  Uw.wox.x.ztz

; ======================================================================
; CODIGO 0x7755..0x7913  (446 bytes)
; ======================================================================


L_7755:
	call 04ec7h		;7755
	call 05b38h		;7758
	call L_776E		;775b
	call 0825bh		;775e
	call L_7972		;7761
	ld a,008h		;7764
	ld (0e80bh),a		;7766
L_7769:
	ld hl,0e25bh		;7769
	inc (hl)			;776c
	ret			;776d
L_776E:
	call 041c7h		;776e
	ld hl,0bc44h		;7771
	ld de,027f0h		;7774
	ld bc,00010h		;7777
	call 04e99h		;777a
	call 04192h		;777d
	ld hl,007f0h		;7780
	ld bc,00010h		;7783
	ld a,050h		;7786
	jp 04ea8h		;7788
L_778B:
	ld a,(0e20ch)		;778b
	rla			;778e
	jr nc,L_77AD		;778f
	ld a,(0e260h)		;7791
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
	call L_781B		;77ad
	ld hl,0e260h		;77b0
	ld a,(0e207h)		;77b3
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
	ld (0e261h),a		;77dc
	call L_783C		;77df
	jp L_7769		;77e2
L_77E5:
	ld hl,0e25bh		;77e5
	inc (hl)			;77e8
	inc (hl)			;77e9
	ret			;77ea
L_77EB:
	ld a,005h		;77eb
	ld (0e25bh),a		;77ed
	call 05b38h		;77f0
	call 04ec7h		;77f3
	xor a			;77f6
	call 08474h		;77f7
	call 041c7h		;77fa
	ld hl,0be77h		;77fd
	call 04f0bh		;7800
	jp 04192h		;7803
L_7806:
	call 042d3h		;7806
	dec (hl)			;7809
	ld a,(hl)			;780a
	rla			;780b
	ret nc			;780c
	ld (hl),00ah		;780d
	ret			;780f
L_7810:
	call 042d3h		;7810
	inc (hl)			;7813
	ld a,(hl)			;7814
	cp 00bh		;7815
	ret c			;7817
	ld (hl),000h		;7818
	ret			;781a
L_781B:
	ld b,010h		;781b
	ld a,(0e260h)		;781d
	ld hl,0e800h		;7820
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
	ld a,(0e203h)		;7830
	and 008h		;7833
	ld a,008h		;7835
	jr z,L_783A		;7837
	xor a			;7839
L_783A:
	ld (hl),a			;783a
	ret			;783b
L_783C:
	call 041c7h		;783c
	ld a,(0e260h)		;783f
	sub 004h		;7842
	ld hl,0bcbbh		;7844
	call 04d4dh		;7847
	ld a,(hl)			;784a
	ld (0e263h),a		;784b
	inc hl			;784e
	call 04f0bh		;784f
	jp 04192h		;7852
L_7855:
	ld hl,03854h		;7855
	ld d,010h		;7858
L_785A:
	ld bc,0000ah		;785a
	xor a			;785d
	call 04e10h		;785e
	ld a,020h		;7861
	call 04094h		;7863
	dec d			;7866
	jr nz,L_785A		;7867
	ld a,0e0h		;7869
	ld (0e804h),a		;786b
	ret			;786e
L_786F:
	ld a,(0e20ch)		;786f
	rla			;7872
	jp c,L_78E2		;7873
	call L_78A9		;7876
	ld hl,0e261h		;7879
	ld a,(0e207h)		;787c
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
	call 042d3h		;7891
	dec (hl)			;7894
	ld a,(hl)			;7895
	rla			;7896
	ret nc			;7897
	ld a,(0e263h)		;7898
	ld (hl),a			;789b
	ret			;789c
L_789D:
	call 042d3h		;789d
	inc (hl)			;78a0
	ld a,(0e263h)		;78a1
	cp (hl)			;78a4
	ret nc			;78a5
	ld (hl),000h		;78a6
	ret			;78a8
L_78A9:
	ld b,088h		;78a9
	ld a,(0e261h)		;78ab
	ld hl,0e804h		;78ae
	jp L_7823		;78b1
L_78B4:
	ld a,(0e20ch)		;78b4
	rla			;78b7
	jp c,L_78E2		;78b8
	call L_7972		;78bb
	ld hl,0e262h		;78be
	ld de,0e788h		;78c1
	ld a,(0e207h)		;78c4
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
	ld (0e25bh),a		;78de
	ret			;78e1
L_78E2:
	call 04ec7h		;78e2
	ld hl,0e264h		;78e5
	ld (hl),00bh		;78e8
	inc hl			;78ea
	ld (hl),00fh		;78eb
	call 05b38h		;78ed
	call L_79CB		;78f0
	ld a,004h		;78f3
	ld (0e25bh),a		;78f5
	ld a,(0e260h)		;78f8
	ld b,a			;78fb
	add a,a			;78fc
	add a,b			;78fd
	ld hl,07913h		;78fe
	call 04094h		;7901
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
; DATOS sin identificar  0x7913..0x792e  (27 bytes)
DATA_7913:
	defb 018h,020h,000h,018h,020h,000h,018h,01eh,001h,016h,01eh,011h,016h,01eh,011h,016h	; 7913  . .. ...........
	defb 01eh,011h,016h,01eh,011h,016h,01eh,011h,014h,01ch,011h	; 7923  ...........

; ======================================================================
; CODIGO 0x792e..0x7a9a  (364 bytes)
; ======================================================================


L_792E:
	ld hl,0e788h		;792e
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
	ld (0e262h),a		;793c
	ret			;793f
L_7940:
	ld a,(hl)			;7940
	and 038h		;7941
	ret z			;7943
	ld a,(hl)			;7944
	sub 008h		;7945
	jr L_7955		;7947
L_7949:
	ld a,(hl)			;7949
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
	call 04099h		;7956
	ld a,(de)			;7959
	and a			;795a
	ret z			;795b
	ld (hl),b			;795c
	jp 042d3h		;795d
L_7960:
	ld a,(hl)			;7960
	and 007h		;7961
	ret z			;7963
	ld a,(hl)			;7964
	dec a			;7965
	jr L_7955		;7966
L_7968:
	ld a,(hl)			;7968
	and 007h		;7969
	cp 005h		;796b
	ret nc			;796d
	ld a,(hl)			;796e
	inc a			;796f
	jr L_7955		;7970
L_7972:
	ld a,(0e262h)		;7972
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
	ld a,(0e203h)		;798c
	and 008h		;798f
	ld a,008h		;7991
	jr z,L_7996		;7993
	xor a			;7995
L_7996:
	ld (hl),a			;7996
	ret			;7997
L_7998:
	ld hl,0e26ah		;7998
	ld a,(hl)			;799b
	inc hl			;799c
	and (hl)			;799d
	ret z			;799e
	call L_79B1		;799f
	call 04ec7h		;79a2
	call 05b38h		;79a5
	call L_7596		;79a8
	ld a,001h		;79ab
	ld (0e25bh),a		;79ad
	ret			;79b0
L_79B1:
	ld hl,0e700h		;79b1
	ld bc,01000h		;79b4
L_79B7:
	ld a,(hl)			;79b7
	and a			;79b8
	jr z,L_79BC		;79b9
	inc c			;79bb
L_79BC:
	ld a,008h		;79bc
	call 04094h		;79be
	djnz L_79B7		;79c1
	ld a,c			;79c3
	ld (0e2f4h),a		;79c4
	ld (0e2f5h),a		;79c7
	ret			;79ca
L_79CB:
	call L_7A60		;79cb
	ld a,(0e26ch)		;79ce
	and a			;79d1
	call nz,L_7FC5		;79d2
	call L_7B64		;79d5
	ld c,a			;79d8
	ld ix,0e700h		;79d9
	ld b,010h		;79dd
L_79DF:
	push bc			;79df
	ld a,(ix+000h)		;79e0
	and a			;79e3
	jr z,L_79EF		;79e4
	ld a,(ix+001h)		;79e6
	cp c			;79e9
	jr nz,L_79EF		;79ea
	call L_6347		;79ec
L_79EF:
	ld bc,00008h		;79ef
	add ix,bc		;79f2
	pop bc			;79f4
	djnz L_79DF		;79f5
	call L_7B64		;79f7
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
	call 053d6h		;7a0c
	pop hl			;7a0f
	pop bc			;7a10
	call 081f0h		;7a11
L_7A14:
	call L_7B64		;7a14
	ld c,a			;7a17
	ld hl,0e300h		;7a18
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
	call 08119h		;7a2f
	ld bc,00202h		;7a32
	call 053d6h		;7a35
L_7A38:
	pop hl			;7a38
	ld a,008h		;7a39
	call 04094h		;7a3b
	pop bc			;7a3e
	djnz L_7A1D		;7a3f
	ld a,(0e267h)		;7a41
	and a			;7a44
	call nz,L_7E00		;7a45
	ld a,(0e266h)		;7a48
	and a			;7a4b
	call nz,L_7D3E		;7a4c
	ld a,(0e26bh)		;7a4f
	and a			;7a52
	ret z			;7a53
	ld a,(0e243h)		;7a54
	ld b,a			;7a57
	call L_7B64		;7a58
	cp b			;7a5b
	call z,L_7C71		;7a5c
	ret			;7a5f
L_7A60:
	call L_7B64		;7a60
	dec a			;7a63
	ld h,000h		;7a64
	ld l,a			;7a66
	call 05b29h		;7a67
	push hl			;7a6a
	pop ix		;7a6b
	xor a			;7a6d
	ld (0efc0h),a		;7a6e
	jp 0455bh		;7a71
L_7A74:
	call 08642h		;7a74
	and a			;7a77
	ret z			;7a78
	dec a			;7a79
	jr z,L_7A81		;7a7a
	xor a			;7a7c
	ld (0e25bh),a		;7a7d
	ret			;7a80
L_7A81:
	xor a			;7a81
	ld (0e25ah),a		;7a82
	ret			;7a85
L_7A86:
	ld a,(0e20ch)		;7a86
	rla			;7a89
	jr nc,L_7A91		;7a8a
	xor a			;7a8c
	ld (0e25bh),a		;7a8d
	ret			;7a90
L_7A91:
	call 08223h		;7a91
	ld a,(0e260h)		;7a94
	call 0409eh		;7a97

; ----------------------------------------------------------------------
; DATOS sin identificar  0x7a9a..0x7aac  (18 bytes)
DATA_7A9A:
	defb 0ach,07ah,06fh,07bh,075h,07bh,043h,07ch,0c4h,07ch,09bh,07dh,059h,080h,021h,081h	; 7a9a  .zo{u{C|.|.}Y.!.
	defb 0b6h,081h	; 7aaa

; ======================================================================
; CODIGO 0x7aac..0x7e25  (889 bytes)
; ======================================================================


L_7AAC:
	ld hl,00502h		;7aac
L_7AAF:
	ld (0efd0h),hl		;7aaf
	call 08325h		;7ab2
	call L_7C1B		;7ab5
	ret c			;7ab8
	ld a,(0e207h)		;7ab9
	and 030h		;7abc
	ret z			;7abe
	and 010h		;7abf
	jr nz,L_7AC7		;7ac1
	xor a			;7ac3
	ld (0efd0h),a		;7ac4
L_7AC7:
	ld a,(0efd0h)		;7ac7
	ld b,a			;7aca
	call L_7B64		;7acb
	ld h,a			;7ace
	call L_7B55		;7acf
	ex de,hl			;7ad2
	push hl			;7ad3
	ld a,d			;7ad4
	exx			;7ad5
	call 0928ah		;7ad6
	pop hl			;7ad9
	call 09d5fh		;7ada
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
	ld a,b			;7aec
	push hl			;7aed
	push hl			;7aee
	push af			;7aef
	ld bc,00101h		;7af0
	call L_61F7		;7af3
	pop af			;7af6
	pop de			;7af7
	and a			;7af8
	jr nz,L_7B00		;7af9
	ld a,0e0h		;7afb
	ld (0efd1h),a		;7afd
L_7B00:
	ld a,(0efd1h)		;7b00
	call 053efh		;7b03
	pop de			;7b06
	push de			;7b07
	call L_7B3B		;7b08
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
	call L_7B1F		;7b17
	pop hl			;7b1a
L_7B1B:
	dec c			;7b1b
	ret nz			;7b1c
	ld h,000h		;7b1d
L_7B1F:
	push bc			;7b1f
	push de			;7b20
	ld bc,00101h		;7b21
	ld a,(0efd0h)		;7b24
	push hl			;7b27
	push de			;7b28
	call L_61F7		;7b29
	call L_7B64		;7b2c
	pop bc			;7b2f
	pop de			;7b30
	cp b			;7b31
	ld a,(0efd1h)		;7b32
	call z,053efh		;7b35
	pop de			;7b38
	pop bc			;7b39
	ret			;7b3a
L_7B3B:
	ld c,003h		;7b3b
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
	ld a,(0e262h)		;7b49
	ld b,a			;7b4c
	ld a,c			;7b4d
	push bc			;7b4e
	call 05c2fh		;7b4f
	pop bc			;7b52
	ld a,l			;7b53
	ret			;7b54
L_7B55:
	ld a,(0e264h)		;7b55
	add a,a			;7b58
	add a,a			;7b59
	add a,a			;7b5a
	ld e,a			;7b5b
	ld a,(0e265h)		;7b5c
	add a,a			;7b5f
	add a,a			;7b60
	add a,a			;7b61
	ld d,a			;7b62
	ret			;7b63
L_7B64:
	ld de,0e788h		;7b64
	ld a,(0e262h)		;7b67
	call 04099h		;7b6a
	ld a,(de)			;7b6d
	ret			;7b6e
L_7B6F:
	ld hl,06203h		;7b6f
	jp L_7AAF		;7b72
L_7B75:
	call 08325h		;7b75
	call L_7C20		;7b78
	ret c			;7b7b
	ld a,(0e207h)		;7b7c
	and 030h		;7b7f
	ret z			;7b81
	and 010h		;7b82
	ld a,001h		;7b84
	jr nz,L_7B89		;7b86
	xor a			;7b88
L_7B89:
	ld (0efd0h),a		;7b89
	ld b,a			;7b8c
	call L_7B64		;7b8d
	ld h,a			;7b90
	exx			;7b91
	call 0928ah		;7b92
	ld (0e250h),de		;7b95
	exx			;7b99
	call L_7B55		;7b9a
	ex de,hl			;7b9d
	ld a,b			;7b9e
	and a			;7b9f
	jr nz,L_7BBA		;7ba0
	push hl			;7ba2
	exx			;7ba3
	pop hl			;7ba4
	ld de,(0e250h)		;7ba5
	push hl			;7ba9
	call 09d5fh		;7baa
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
	call L_61F7		;7bc1
	pop de			;7bc4
	call L_7BE0		;7bc5
	pop af			;7bc8
	pop de			;7bc9
	and a			;7bca
	jr z,L_7BCF		;7bcb
	ld a,003h		;7bcd
L_7BCF:
	push af			;7bcf
	push de			;7bd0
	call 053efh		;7bd1
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
	push de			;7be0
	call L_7C0C		;7be1
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
	call L_61F7		;7bf7
	call L_7B64		;7bfa
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
	ld c,001h		;7c0c
	ld a,e			;7c0e
	and a			;7c0f
	jp z,L_7B49		;7c10
	inc c			;7c13
	cp 0b8h		;7c14
	jp z,L_7B49		;7c16
	xor a			;7c19
	ret			;7c1a
L_7C1B:
	ld bc,02000h		;7c1b
	jr L_7C23		;7c1e
L_7C20:
	ld bc,02808h		;7c20
L_7C23:
	ld a,(0e26ah)		;7c23
	and a			;7c26
	jr z,L_7C41		;7c27
	ld hl,0e2f3h		;7c29
	call L_7B64		;7c2c
	cp (hl)			;7c2f
	jr nz,L_7C41		;7c30
	dec hl			;7c32
	call L_7B55		;7c33
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
	call 08325h		;7c43
	ld a,(0e207h)		;7c46
	and 030h		;7c49
	ret z			;7c4b
	and 010h		;7c4c
	ld hl,0e282h		;7c4e
	jr z,L_7C64		;7c51
	call L_7B64		;7c53
	ld (0e243h),a		;7c56
	call L_7B55		;7c59
	ld (hl),e			;7c5c
	inc hl			;7c5d
	inc hl			;7c5e
	ld (hl),d			;7c5f
	ld a,001h		;7c60
	jr L_7C6E		;7c62
L_7C64:
	ld a,(0e243h)		;7c64
	ld b,a			;7c67
	call L_7B64		;7c68
	cp b			;7c6b
	ret nz			;7c6c
	xor a			;7c6d
L_7C6E:
	ld (0e26bh),a		;7c6e
L_7C71:
	ld hl,0e808h		;7c71
	ld de,0e80ch		;7c74
	exx			;7c77
	ld hl,0e810h		;7c78
	ld de,0e814h		;7c7b
	exx			;7c7e
	and a			;7c7f
	ld a,0e0h		;7c80
	jr z,L_7C87		;7c82
	ld a,(0e282h)		;7c84
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
	ld a,(0e284h)		;7c9b
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
	call 08325h		;7cc4
	ld a,(0e207h)		;7cc7
	and 030h		;7cca
	ret z			;7ccc
	and 010h		;7ccd
	ld hl,0e266h		;7ccf
	jr z,L_7D21		;7cd2
	ld a,(hl)			;7cd4
	cp 008h		;7cd5
	ret nc			;7cd7
	push hl			;7cd8
	call L_7D07		;7cd9
	pop hl			;7cdc
	ret z			;7cdd
	inc (hl)			;7cde
	ld b,008h		;7cdf
	ld hl,0e2c0h		;7ce1
L_7CE4:
	ld a,(hl)			;7ce4
	and a			;7ce5
	jr z,L_7CEF		;7ce6
	ld a,005h		;7ce8
	call 04094h		;7cea
	jr L_7CE4		;7ced
L_7CEF:
	ld a,(0e261h)		;7cef
	inc a			;7cf2
	or 080h		;7cf3
	ld (hl),a			;7cf5
	inc hl			;7cf6
	ld (hl),020h		;7cf7
	inc hl			;7cf9
	call L_7B64		;7cfa
	ld (hl),a			;7cfd
	inc hl			;7cfe
	call L_7B55		;7cff
	ld (hl),e			;7d02
	inc hl			;7d03
	ld (hl),d			;7d04
	jr L_7D3E		;7d05
L_7D07:
	ld hl,0e2c0h		;7d07
	ld b,008h		;7d0a
L_7D0C:
	ld a,(hl)			;7d0c
	and a			;7d0d
	jr z,L_7D16		;7d0e
	push hl			;7d10
	call L_7D82		;7d11
	pop hl			;7d14
	ret z			;7d15
L_7D16:
	ld a,005h		;7d16
	call 04094h		;7d18
	djnz L_7D0C		;7d1b
	ld a,001h		;7d1d
	and a			;7d1f
	ret			;7d20
L_7D21:
	ld a,(hl)			;7d21
	and a			;7d22
	ret z			;7d23
	ld hl,0e2c0h		;7d24
	ld b,008h		;7d27
L_7D29:
	ld a,(hl)			;7d29
	and a			;7d2a
	jr z,L_7D37		;7d2b
	push hl			;7d2d
	call L_7D82		;7d2e
	pop hl			;7d31
	push hl			;7d32
	call z,L_7D94		;7d33
	pop hl			;7d36
L_7D37:
	ld a,005h		;7d37
	call 04094h		;7d39
	djnz L_7D29		;7d3c
L_7D3E:
	ld hl,0e2c0h		;7d3e
	ld b,008h		;7d41
	ld de,0e840h		;7d43
L_7D46:
	push hl			;7d46
	exx			;7d47
	call L_7B64		;7d48
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
	jr nz,L_7D61		;7d5d
	ld a,0e0h		;7d5f
L_7D61:
	ld (de),a			;7d61
	inc hl			;7d62
	inc de			;7d63
	ldi		;7d64
	ld a,c			;7d66
	ld hl,082adh		;7d67
	call 04d4dh		;7d6a
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
	call 04094h		;7d77
	ld a,004h		;7d7a
	call 04099h		;7d7c
	djnz L_7D46		;7d7f
	ret			;7d81
L_7D82:
	call L_7B64		;7d82
	inc hl			;7d85
	inc hl			;7d86
	cp (hl)			;7d87
	ret nz			;7d88
	call L_7B55		;7d89
	inc hl			;7d8c
	ld a,(hl)			;7d8d
	cp e			;7d8e
	ret nz			;7d8f
	inc hl			;7d90
	ld a,(hl)			;7d91
	cp d			;7d92
	ret			;7d93
L_7D94:
	ld (hl),000h		;7d94
	ld hl,0e266h		;7d96
	dec (hl)			;7d99
	ret			;7d9a
L_7D9B:
	call 08312h		;7d9b
	ld a,(0e207h)		;7d9e
	and 030h		;7da1
	ret z			;7da3
	and 010h		;7da4
	ld hl,0e267h		;7da6
	jp z,L_7E92		;7da9
	ld a,(0e261h)		;7dac
	cp 007h		;7daf
	jp z,L_7F87		;7db1
	ld a,(hl)			;7db4
	cp 010h		;7db5
	ret nc			;7db7
	push hl			;7db8
	call L_7E2F		;7db9
	pop hl			;7dbc
	ret z			;7dbd
	inc (hl)			;7dbe
	ld hl,0e600h		;7dbf
L_7DC2:
	ld a,(hl)			;7dc2
	and a			;7dc3
	jr z,L_7DCD		;7dc4
	ld a,010h		;7dc6
	call 04094h		;7dc8
	jr L_7DC2		;7dcb
L_7DCD:
	push hl			;7dcd
	pop ix		;7dce
	ld b,010h		;7dd0
L_7DD2:
	ld (hl),000h		;7dd2
	inc hl			;7dd4
	djnz L_7DD2		;7dd5
	ld a,(0e261h)		;7dd7
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
	call L_7B55		;7deb
	ld (ix+002h),e		;7dee
	ld (ix+003h),d		;7df1
	call L_7B64		;7df4
	ld (ix+004h),a		;7df7
	ld (ix+009h),a		;7dfa
	call L_7EED		;7dfd
L_7E00:
	call L_7B64		;7e00
	ld c,a			;7e03
	ld ix,0e600h		;7e04
	ld b,010h		;7e08
L_7E0A:
	push bc			;7e0a
	ld a,(ix+004h)		;7e0b
	cp c			;7e0e
	jr nz,L_7E18		;7e0f
	ld a,(ix+000h)		;7e11
	and a			;7e14
	call nz,L_7E21		;7e15
L_7E18:
	ld bc,00010h		;7e18
	add ix,bc		;7e1b
	pop bc			;7e1d
	djnz L_7E0A		;7e1e
	ret			;7e20
L_7E21:
	dec a			;7e21
	call 0409eh		;7e22

; ----------------------------------------------------------------------
; DATOS sin identificar  0x7e25..0x7e2f  (10 bytes)
DATA_7E25:
	defb 04ah,07eh,060h,07eh,07dh,07eh,03bh,0bbh,06bh,093h	; 7e25  J~`~}~..k.

; ======================================================================
; CODIGO 0x7e2f..0x7ed4  (165 bytes)
; ======================================================================


L_7E2F:
	ld ix,0e600h		;7e2f
	ld b,010h		;7e33
L_7E35:
	ld a,(ix+000h)		;7e35
	and a			;7e38
	jr z,L_7E3F		;7e39
	call L_7ED9		;7e3b
	ret z			;7e3e
L_7E3F:
	ld de,00010h		;7e3f
	add ix,de		;7e42
	djnz L_7E35		;7e44
	ld a,001h		;7e46
	and a			;7e48
	ret			;7e49
L_7E4A:
	ld a,(ix+007h)		;7e4a
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
	ld a,(ix+007h)		;7e60
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
	ld e,(ix+002h)		;7e7d
	ld d,(ix+003h)		;7e80
	ld b,(ix+008h)		;7e83
L_7E86:
	ld a,0feh		;7e86
	call 053efh		;7e88
	ld a,e			;7e8b
	add a,008h		;7e8c
	ld e,a			;7e8e
	djnz L_7E86		;7e8f
	ret			;7e91
L_7E92:
	ld a,(0e261h)		;7e92
	cp 007h		;7e95
	jp z,08017h		;7e97
	ld a,(hl)			;7e9a
	and a			;7e9b
	ret z			;7e9c
	ld ix,0e600h		;7e9d
	ld b,010h		;7ea1
L_7EA3:
	ld a,(ix+000h)		;7ea3
	and a			;7ea6
	jr z,L_7EB1		;7ea7
	push hl			;7ea9
	call L_7ED9		;7eaa
	call z,L_7EB9		;7ead
	pop hl			;7eb0
L_7EB1:
	ld de,00010h		;7eb1
	add ix,de		;7eb4
	djnz L_7EA3		;7eb6
	ret			;7eb8
L_7EB9:
	ld a,(ix+000h)		;7eb9
	ld (ix+000h),000h		;7ebc
	dec (hl)			;7ec0
	ld hl,07ed3h		;7ec1
	call 04094h		;7ec4
	ld c,(hl)			;7ec7
	ld b,(ix+008h)		;7ec8
	call L_7B55		;7ecb
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
	call L_7B64		;7ed9
	cp (ix+004h)		;7edc
	ret nz			;7edf
	call L_7B55		;7ee0
	ld a,(ix+002h)		;7ee3
	cp e			;7ee6
	ret nz			;7ee7
	ld a,(ix+003h)		;7ee8
	cp d			;7eeb
	ret			;7eec
L_7EED:
	ld a,(0e261h)		;7eed
	call 0409eh		;7ef0

; ----------------------------------------------------------------------
; DATOS sin identificar  0x7ef3..0x7f01  (14 bytes)
DATA_7EF3:
	defb 001h,07fh,02fh,07fh,001h,07fh,033h,07fh,027h,07fh,01dh,07fh,022h,07fh	; 7ef3  ../...3.'...".

; ======================================================================
; CODIGO 0x7f01..0x8000  (255 bytes)
; ======================================================================


L_7F01:
	ld c,000h		;7f01
	xor a			;7f03
	ld b,003h		;7f04
L_7F06:
	ld (ix+005h),c		;7f06
	ld (ix+007h),a		;7f09
	call L_7F3B		;7f0c
	ld (ix+008h),c		;7f0f
	dec c			;7f12
	ret nz			;7f13
	ld (ix+000h),000h		;7f14
	ld hl,0e267h		;7f18
	dec (hl)			;7f1b
	ret			;7f1c
L_7F1D:
	ld (ix+008h),001h		;7f1d
	ret			;7f21
L_7F22:
	ld (ix+008h),002h		;7f22
	ret			;7f26
L_7F27:
	xor a			;7f27
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
	ld c,001h		;7f3b
	call L_7B55		;7f3d
L_7F40:
	ld a,e			;7f40
	add a,008h		;7f41
	ld e,a			;7f43
	cp 0b8h		;7f44
	ret nc			;7f46
	push bc			;7f47
	push de			;7f48
	call L_7F53		;7f49
	pop de			;7f4c
	pop bc			;7f4d
	ret nc			;7f4e
	inc c			;7f4f
	djnz L_7F40		;7f50
	ret			;7f52
L_7F53:
	push de			;7f53
	call L_7B64		;7f54
	dec a			;7f57
	ld l,a			;7f58
	ld h,000h		;7f59
	call 05b29h		;7f5b
	pop de			;7f5e
	push hl			;7f5f
	ex de,hl			;7f60
	call 04d7ch		;7f61
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
	call 04094h		;7f75
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
	ld hl,0e26ch		;7f87
	ld a,(hl)			;7f8a
	cp 010h		;7f8b
	ret nc			;7f8d
	push hl			;7f8e
	call L_7FFC		;7f8f
	pop hl			;7f92
	ret z			;7f93
	inc (hl)			;7f94
	ld hl,0e7c0h		;7f95
L_7F98:
	ld a,(hl)			;7f98
	and a			;7f99
	jr z,L_7FA3		;7f9a
	ld a,004h		;7f9c
	call 04094h		;7f9e
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
	call L_7B64		;7fad
	ld (hl),a			;7fb0
	inc hl			;7fb1
	call L_7B55		;7fb2
	ld (hl),e			;7fb5
	inc hl			;7fb6
	ld (hl),d			;7fb7
	ld b,01eh		;7fb8
	push hl			;7fba
	call L_7F3B		;7fbb
	pop hl			;7fbe
	inc hl			;7fbf
	ld a,080h		;7fc0
	or c			;7fc2
	ld (hl),a			;7fc3
	pop hl			;7fc4
L_7FC5:
	ld c,001h		;7fc5
	ld ix,0e7c0h		;7fc7
	ld b,010h		;7fcb
L_7FCD:
	push bc			;7fcd
	call L_7B64		;7fce
	cp (ix+000h)		;7fd1
	call z,L_7FE0		;7fd4
	ld bc,00004h		;7fd7
	add ix,bc		;7fda
	pop bc			;7fdc
	djnz L_7FCD		;7fdd
	ret			;7fdf
L_7FE0:
	ld a,(ix+003h)		;7fe0
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
	ld ix,0e7c0h		;7ffc
