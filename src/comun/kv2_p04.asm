; ==========================================================================
; KING'S VALLEY II - Konami (1988) - MSX y MSX2 - RC-760 y RC-761 (Konami SCC) - banco 04 (se ejecuta en 0x6000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x06000


; ======================================================================
; CODIGO 0x6000..0x617c  (380 bytes)
; ======================================================================


L_6000:
	jp L_6009		;6000
L_6003:
	jp L_603D		;6003
L_6006:
	jp L_62F8		;6006
L_6009:
	ld a,001h		;6009
	call L_603D		;600b
	ld a,0ffh		;600e
	ld hl,0e1ebh		;6010
	ld (hl),a			;6013
	inc hl			;6014
	ld (hl),a			;6015
	inc hl			;6016
	ld de,0e1eeh		;6017
	ld (hl),001h		;601a
	ld bc,0000eh		;601c
	ldir		;601f
	call L_6DF4		;6021
	ld a,03fh		;6024
	ld (09000h),a		;6026
	xor a			;6029
	ld (0988fh),a		;602a
	ld a,002h		;602d
	ld (09000h),a		;602f
	ld a,0bfh		;6032
	ld (0e1e3h),a		;6034
	ld e,a			;6037
	ld a,007h		;6038
	jp 00093h		;603a   ; BIOS WRTPSG - Writes data to PSG-register
L_603D:
	ld c,a			;603d
	cp 082h		;603e
	jp z,L_61BB		;6040
	cp 083h		;6043
	jp z,L_61C2		;6045
	cp 084h		;6048
	jp z,L_61CD		;604a
	cp 080h		;604d
	jp z,L_61E4		;604f
	cp 081h		;6052
	call z,L_6248		;6054
	ld hl,0e1cch		;6057
	ld (hl),c			;605a
	ld hl,06f2ch		;605b
	ld a,c			;605e
	add a,c			;605f
	ld e,a			;6060
	ld d,000h		;6061
	add hl,de			;6063
	ld e,(hl)			;6064
	inc hl			;6065
	ld d,(hl)			;6066
	ex de,hl			;6067
	ld de,0e1cdh		;6068
	ld bc,00012h		;606b
	ldir		;606e
	ld ix,0e1cfh		;6070
	ld hl,0e1cdh		;6074
	bit 7,(hl)		;6077
	jr z,L_6092		;6079
	push ix		;607b
	ld ix,0e000h		;607d
	call L_62DF		;6081
	pop ix		;6084
	inc hl			;6086
	ld a,(hl)			;6087
	ld hl,0e001h		;6088
	call L_615C		;608b
	inc ix		;608e
	inc ix		;6090
L_6092:
	ld hl,0e1cdh		;6092
	bit 6,(hl)		;6095
	jr z,L_60B0		;6097
	push ix		;6099
	ld ix,0e033h		;609b
	call L_62DF		;609f
	pop ix		;60a2
	inc hl			;60a4
	ld a,(hl)			;60a5
	ld hl,0e034h		;60a6
	call L_615C		;60a9
	inc ix		;60ac
	inc ix		;60ae
L_60B0:
	ld hl,0e1cdh		;60b0
	bit 5,(hl)		;60b3
	jr z,L_60CE		;60b5
	push ix		;60b7
	ld ix,0e066h		;60b9
	call L_62DF		;60bd
	pop ix		;60c0
	inc hl			;60c2
	ld a,(hl)			;60c3
	ld hl,0e067h		;60c4
	call L_615C		;60c7
	inc ix		;60ca
	inc ix		;60cc
L_60CE:
	ld hl,0e1cdh		;60ce
	bit 4,(hl)		;60d1
	jr z,L_60EC		;60d3
	push ix		;60d5
	ld ix,0e099h		;60d7
	call L_62DF		;60db
	pop ix		;60de
	inc hl			;60e0
	ld a,(hl)			;60e1
	ld hl,0e09ah		;60e2
	call L_615C		;60e5
	inc ix		;60e8
	inc ix		;60ea
L_60EC:
	ld hl,0e1cdh		;60ec
	bit 3,(hl)		;60ef
	jr z,L_610A		;60f1
	push ix		;60f3
	ld ix,0e0cch		;60f5
	call L_62DF		;60f9
	pop ix		;60fc
	inc hl			;60fe
	ld a,(hl)			;60ff
	ld hl,0e0cdh		;6100
	call L_615C		;6103
	inc ix		;6106
	inc ix		;6108
L_610A:
	ld hl,0e1cdh		;610a
	bit 2,(hl)		;610d
	jr z,L_6128		;610f
	push ix		;6111
	ld ix,0e0ffh		;6113
	call L_62DF		;6117
	pop ix		;611a
	inc hl			;611c
	ld a,(hl)			;611d
	ld hl,0e100h		;611e
	call L_615C		;6121
	inc ix		;6124
	inc ix		;6126
L_6128:
	ld hl,0e1cdh		;6128
	bit 1,(hl)		;612b
	jr z,L_6146		;612d
	push ix		;612f
	ld ix,0e132h		;6131
	call L_62DF		;6135
	pop ix		;6138
	inc hl			;613a
	ld a,(hl)			;613b
	ld hl,0e133h		;613c
	call L_615C		;613f
	inc ix		;6142
	inc ix		;6144
L_6146:
	ld hl,0e1cdh		;6146
	bit 0,(hl)		;6149
	ret z			;614b
	push ix		;614c
	ld ix,0e165h		;614e
	call L_62DF		;6152
	pop ix		;6155
	inc hl			;6157
	ld a,(hl)			;6158
	ld hl,0e166h		;6159
L_615C:
	ld b,(hl)			;615c
	cp b			;615d
	ret c			;615e
	ex de,hl			;615f
	ld (de),a			;6160
	dec de			;6161
	ld hl,0e1cch		;6162
	ld a,(hl)			;6165
	ld (de),a			;6166
	inc de			;6167
	inc de			;6168
	ld a,(ix+000h)		;6169
	ld (de),a			;616c
	inc de			;616d
	ld a,(ix+001h)		;616e
	ld (de),a			;6171
	inc de			;6172
	ld hl,0617ch		;6173
	ld bc,0002eh		;6176
	ldir		;6179
	ret			;617b

; ----------------------------------------------------------------------
; DATOS canal_nuevo: 46 bytes con los que p04:6173 llena un canal desde IX+05
;   al empezar un sonido; lo leen p04:6179 (46 bytes)
;   0x617c..0x61aa  (46 bytes)
DATA_canal_nuevo:
	defb 001h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 617c  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 618c  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 619c  ..............

; ----------------------------------------------------------------------
; DATOS sin identificar  0x61aa..0x61bb  (17 bytes)
DATA_61AA:
	defb 000h,021h,0cbh,0e1h,0cbh,0e6h,0cbh,086h,021h,0e1h,0e1h,036h,000h,023h,036h,009h	; 61aa  .!......!..6.#6.
	defb 0c9h	; 61ba

; ======================================================================
; CODIGO 0x61bb..0x6480  (709 bytes)
; ======================================================================


L_61BB:
	ld hl,0e1cbh		;61bb
	res 0,(hl)		;61be
	jr L_61DC		;61c0
L_61C2:
	ld hl,0e1dfh		;61c2
	ld (hl),025h		;61c5
	inc hl			;61c7
	ld (hl),00ah		;61c8
	jp L_61D5		;61ca
L_61CD:
	ld hl,0e1dfh		;61cd
	ld (hl),025h		;61d0
	inc hl			;61d2
	ld (hl),00ah		;61d3
L_61D5:
	ld hl,0e1cbh		;61d5
	set 0,(hl)		;61d8
	res 4,(hl)		;61da
L_61DC:
	ld hl,0e1e1h		;61dc
	xor a			;61df
	ld (hl),a			;61e0
	inc hl			;61e1
	ld (hl),a			;61e2
	ret			;61e3
L_61E4:
	ld hl,0e1cbh		;61e4
	bit 1,(hl)		;61e7
	ld b,000h		;61e9
	jr nz,L_61EF		;61eb
	ld b,001h		;61ed
L_61EF:
	res 1,(hl)		;61ef
	bit 3,(hl)		;61f1
	jr z,L_61F9		;61f3
	res 3,(hl)		;61f5
	set 0,(hl)		;61f7
L_61F9:
	ld hl,0e198h		;61f9
	ld de,0e099h		;61fc
	call L_62D9		;61ff
	ld a,(0e00dh)		;6202
	ld e,a			;6205
	ld a,(0e1feh)		;6206
	and 00fh		;6209
	or e			;620b
	ld (0e00dh),a		;620c
	ld a,(0e040h)		;620f
	ld e,a			;6212
	ld a,(0e1feh)		;6213
	and 0f0h		;6216
	rrca			;6218
	rrca			;6219
	rrca			;621a
	rrca			;621b
	or e			;621c
	ld (0e040h),a		;621d
	ld a,(0e073h)		;6220
	ld e,a			;6223
	ld a,(0e1ffh)		;6224
	and 00fh		;6227
	or e			;6229
	ld (0e073h),a		;622a
	ld a,03fh		;622d
	ld (09000h),a		;622f
	ld a,(0e1fch)		;6232
	ld (0988fh),a		;6235
	ld a,002h		;6238
	ld (09000h),a		;623a
	ld a,0ffh		;623d
	ld hl,0e1ebh		;623f
	ld (hl),a			;6242
	inc hl			;6243
	ld (hl),a			;6244
	jp L_6DF4		;6245
L_6248:
	ld hl,0e1cbh		;6248
	bit 1,(hl)		;624b
	ld b,000h		;624d
	jr z,L_6253		;624f
	ld b,001h		;6251
L_6253:
	set 1,(hl)		;6253
	bit 0,(hl)		;6255
	jr z,L_625D		;6257
	res 0,(hl)		;6259
	set 3,(hl)		;625b
L_625D:
	ld hl,0e099h		;625d
	ld de,0e198h		;6260
	call L_62D9		;6263
	ld a,(0e00dh)		;6266
	ld d,a			;6269
	and 00fh		;626a
	ld (0e1feh),a		;626c
	ld a,d			;626f
	and 0f0h		;6270
	ld (0e00dh),a		;6272
	ld a,(0e040h)		;6275
	ld d,a			;6278
	and 00fh		;6279
	rlca			;627b
	rlca			;627c
	rlca			;627d
	rlca			;627e
	ld e,a			;627f
	ld a,(0e1feh)		;6280
	and e			;6283
	ld (0e1feh),a		;6284
	ld a,d			;6287
	and 0f0h		;6288
	ld (0e040h),a		;628a
	ld a,(0e073h)		;628d
	ld d,a			;6290
	and 00fh		;6291
	ld (0e1ffh),a		;6293
	ld a,d			;6296
	and 0f0h		;6297
	ld (0e073h),a		;6299
	ld a,(0e00ch)		;629c
	res 4,a		;629f
	ld (0e00ch),a		;62a1
	ld a,(0e03fh)		;62a4
	res 4,a		;62a7
	ld (0e03fh),a		;62a9
	ld a,(0e072h)		;62ac
	res 4,a		;62af
	ld (0e072h),a		;62b1
	ld a,03fh		;62b4
	ld (09000h),a		;62b6
	ld a,(0e1fch)		;62b9
	and 0feh		;62bc
	ld (0988fh),a		;62be
	xor a			;62c1
	ld (0988bh),a		;62c2
	ld (0988ch),a		;62c5
	ld (0988dh),a		;62c8
	ld (0988eh),a		;62cb
	ld a,002h		;62ce
	ld (09000h),a		;62d0
	ld a,b			;62d3
	or a			;62d4
	ret nz			;62d5
	ld c,002h		;62d6
	ret			;62d8
L_62D9:
	ld bc,00033h		;62d9
	ldir		;62dc
	ret			;62de
L_62DF:
	ld (ix+01ah),000h		;62df
	ld (ix+01bh),000h		;62e3
	ld (ix+01ch),000h		;62e7
	ld (ix+01dh),000h		;62eb
	ld (ix+01eh),000h		;62ef
	ld (ix+026h),000h		;62f3
	ret			;62f7
L_62F8:
	ld a,(0e1e3h)		;62f8
	call L_6C73		;62fb
	ld a,(0fda2h)		;62fe
	ld hl,0e1fdh		;6301
	cp (hl)			;6304
	jr z,L_632B		;6305
	ld ix,0e099h		;6307
	set 7,(ix+00fh)		;630b
	ld ix,0e0cch		;630f
	set 7,(ix+00fh)		;6313
	ld ix,0e0ffh		;6317
	set 7,(ix+00fh)		;631b
	ld ix,0e132h		;631f
	set 7,(ix+00fh)		;6323
	ld a,(0fda2h)		;6327
	ld (hl),a			;632a
L_632B:
	inc (hl)			;632b
	ld a,(hl)			;632c
	ld (0fda2h),a		;632d
	ld hl,0e1cbh		;6330
	bit 1,(hl)		;6333
	jp nz,L_63B4		;6335
	ld a,(0e1cbh)		;6338
	bit 0,a		;633b
	call nz,L_67B1		;633d
	ld a,(0e1cbh)		;6340
	bit 4,a		;6343
	call nz,L_6835		;6345
	ld a,001h		;6348
	ld (0e1e4h),a		;634a
	ld ix,0e000h		;634d
	call L_63AC		;6351
	ld a,002h		;6354
	ld (0e1e4h),a		;6356
	ld ix,0e033h		;6359
	call L_63AC		;635d
	ld a,004h		;6360
	ld (0e1e4h),a		;6362
	ld ix,0e066h		;6365
	call L_63AC		;6369
	ld a,008h		;636c
	ld (0e1e4h),a		;636e
	ld ix,0e099h		;6371
	call L_63AC		;6375
	ld a,010h		;6378
	ld (0e1e4h),a		;637a
	ld ix,0e0cch		;637d
	call L_63AC		;6381
	ld a,020h		;6384
	ld (0e1e4h),a		;6386
	ld ix,0e0ffh		;6389
	call L_63AC		;638d
	ld a,040h		;6390
	ld (0e1e4h),a		;6392
	ld ix,0e132h		;6395
	call L_63AC		;6399
	ld a,080h		;639c
	ld (0e1e4h),a		;639e
	ld ix,0e165h		;63a1
	call L_63AC		;63a5
	call L_6B98		;63a8
	ret			;63ab
L_63AC:
	ld a,(ix+000h)		;63ac
	or a			;63af
	call nz,L_63CC		;63b0
	ret			;63b3
L_63B4:
	ld a,008h		;63b4
	ld (0e1e4h),a		;63b6
	ld ix,0e099h		;63b9
	call L_63AC		;63bd
	ld a,0bfh		;63c0
	ld (0e1e3h),a		;63c2
	call L_6975		;63c5
	call L_6B98		;63c8
	ret			;63cb
L_63CC:
	dec (ix+004h)		;63cc
	jp nz,L_65E2		;63cf
	bit 6,(ix+00dh)		;63d2
	jr z,L_63DC		;63d6
	set 5,(ix+00dh)		;63d8
L_63DC:
	ld l,(ix+002h)		;63dc
	ld h,(ix+003h)		;63df
L_63E2:
	ld a,(hl)			;63e2
	cp 0ffh		;63e3
	jp z,L_684D		;63e5
	cp 0d0h		;63e8
	jr c,L_63F3		;63ea
	call L_688E		;63ec
	inc hl			;63ef
	jp L_63E2		;63f0
L_63F3:
	bit 0,(ix+009h)		;63f3
	jp nz,L_640A		;63f7
	bit 1,(ix+009h)		;63fa
	jp nz,L_648D		;63fe
	ld a,(ix+009h)		;6401
	and 01ch		;6404
	jp nz,L_6506		;6406
	ret			;6409
L_640A:
	ld a,(hl)			;640a
	and 00fh		;640b
	ld b,a			;640d
	ld a,(ix+014h)		;640e
	jr z,L_6417		;6411
	ld e,a			;6413
L_6414:
	add a,e			;6414
	djnz L_6414		;6415
L_6417:
	ld (ix+004h),a		;6417
	ld a,(hl)			;641a
	and 0f0h		;641b
	rrca			;641d
	rrca			;641e
	rrca			;641f
	rrca			;6420
	call L_67A9		;6421
	bit 7,(ix+009h)		;6424
	ret nz			;6428
	cp 00ch		;6429
	jr nc,L_6477		;642b
	ld hl,06480h		;642d
	ld e,a			;6430
	ld d,000h		;6431
	add hl,de			;6433
	ld l,(hl)			;6434
	ld h,000h		;6435
	ld a,(ix+016h)		;6437
	or a			;643a
	jr z,L_6453		;643b
	bit 7,(ix+00dh)		;643d
	jr z,L_644F		;6441
	ld a,(ix+02fh)		;6443
	ld b,a			;6446
	ld a,(ix+016h)		;6447
	sub b			;644a
	jr z,L_6453		;644b
	jr c,L_6453		;644d
L_644F:
	ld b,a			;644f
L_6450:
	add hl,hl			;6450
	djnz L_6450		;6451
L_6453:
	ld (ix+010h),l		;6453
	ld (ix+011h),h		;6456
	ld e,(ix+015h)		;6459
	ld a,(0e1cbh)		;645c
	and 011h		;645f
	call nz,L_6811		;6461
	ld (ix+012h),e		;6464
	ld a,(ix+00dh)		;6467
	and 0f0h		;646a
	ld (ix+00dh),a		;646c
	set 1,(ix+00dh)		;646f
	call L_6591		;6473
	ret			;6476
L_6477:
	ld a,(ix+00dh)		;6477
	and 0f0h		;647a
	ld (ix+00dh),a		;647c
	ret			;647f

; ----------------------------------------------------------------------
; DATOS notas_psg: 13 bytes: el divisor de cada nota (de do a do) que p04:6434
;   lee con la nota < 12 (p04:6429) y dobla por la octava (p04:6450); el 13 no
;   lo lee nadie; lo leen p04:6434 (13 bytes)
;   0x6480..0x648d  (13 bytes)
DATA_notas_psg:
	defb 06ah,064h,05eh,059h,054h,04fh,04ah,046h,042h,03fh,03bh,038h,035h	; 6480  jd^YTOJFB?.85

; ======================================================================
; CODIGO 0x648d..0x68a3  (1046 bytes)
; ======================================================================


L_648D:
	ld a,(ix+00dh)		;648d
	and 003h		;6490
	jr z,L_64F7		;6492
	cp 001h		;6494
	jr z,L_64CE		;6496
	ld a,(hl)			;6498
	bit 6,(ix+00eh)		;6499
	jr nz,L_64BA		;649d
	bit 5,(ix+00eh)		;649f
	jr nz,L_64BF		;64a3
	and 0f0h		;64a5
	ld b,a			;64a7
	xor (hl)			;64a8
	ld d,a			;64a9
	inc hl			;64aa
	ld a,(hl)			;64ab
	ld (ix+010h),a		;64ac
	ld (ix+011h),d		;64af
	ld a,b			;64b2
	rrca			;64b3
	rrca			;64b4
	rrca			;64b5
	rrca			;64b6
	ld b,a			;64b7
	jr L_64D2		;64b8
L_64BA:
	ld (ix+010h),a		;64ba
	jr L_64E6		;64bd
L_64BF:
	and 0f0h		;64bf
	rrca			;64c1
	rrca			;64c2
	rrca			;64c3
	rrca			;64c4
	ld b,a			;64c5
	ld a,(hl)			;64c6
	and 00fh		;64c7
	ld (ix+011h),a		;64c9
	jr L_64D2		;64cc
L_64CE:
	ld a,(hl)			;64ce
	and 00fh		;64cf
	ld b,a			;64d1
L_64D2:
	ld a,(0e1e4h)		;64d2
	cp 008h		;64d5
	jr nc,L_64E1		;64d7
	bit 2,(ix+00dh)		;64d9
	jr z,L_64E1		;64dd
	ld b,010h		;64df
L_64E1:
	inc b			;64e1
	inc b			;64e2
	ld (ix+012h),b		;64e3
L_64E6:
	ld e,(ix+012h)		;64e6
	ld a,(0e1cbh)		;64e9
	and 011h		;64ec
	call nz,L_6811		;64ee
	ld (ix+012h),e		;64f1
	call L_6591		;64f4
L_64F7:
	bit 7,(ix+009h)		;64f7
	ret nz			;64fb
	call L_67A9		;64fc
	ld a,(ix+013h)		;64ff
	ld (ix+004h),a		;6502
	ret			;6505
L_6506:
	set 7,(ix+009h)		;6506
	call L_640A		;650a
	ld b,a			;650d
	call L_653D		;650e
	ld a,b			;6511
	add a,a			;6512
	ld e,a			;6513
	ld d,000h		;6514
	add hl,de			;6516
	ld e,(hl)			;6517
	inc hl			;6518
	ld d,(hl)			;6519
	ex de,hl			;651a
	ld a,(hl)			;651b
L_651C:
	set 1,(ix+009h)		;651c
	call L_63E2		;6520
	res 1,(ix+009h)		;6523
	res 7,(ix+009h)		;6527
	ld a,(ix+013h)		;652b
	ld (ix+019h),a		;652e
	inc hl			;6531
	ld (ix+017h),l		;6532
	ld (ix+018h),h		;6535
	set 0,(ix+00eh)		;6538
	ret			;653c
L_653D:
	bit 2,(ix+009h)		;653d
	jp nz,L_6552		;6541
	bit 3,(ix+009h)		;6544
	jp nz,L_6567		;6548
	bit 4,(ix+009h)		;654b
	jp nz,L_657C		;654f
L_6552:
	ld a,(ix+02ch)		;6552
	cp 000h		;6555
	jp z,L_655F		;6557
	cp 001h		;655a
	jp z,L_6563		;655c
L_655F:
	ld hl,076a0h		;655f
	ret			;6562
L_6563:
	ld hl,077e1h		;6563
	ret			;6566
L_6567:
	ld a,(ix+02ch)		;6567
	cp 000h		;656a
	jp z,L_6574		;656c
	cp 001h		;656f
	jp z,L_6578		;6571
L_6574:
	ld hl,077fah		;6574
	ret			;6577
L_6578:
	ld hl,07813h		;6578
	ret			;657b
L_657C:
	ld a,(ix+02ch)		;657c
	cp 000h		;657f
	jp z,L_6589		;6581
	cp 001h		;6584
	jp z,L_658D		;6586
L_6589:
	ld hl,0782ch		;6589
	ret			;658c
L_658D:
	ld hl,07845h		;658d
	ret			;6590
L_6591:
	call L_6627		;6591
	res 4,(ix+00eh)		;6594
	ld a,(ix+00fh)		;6598
	and 0d7h		;659b
	ld (ix+00fh),a		;659d
	xor a			;65a0
	ld (ix+01dh),a		;65a1
	ld (ix+01eh),a		;65a4
	ld (ix+01fh),a		;65a7
	ld (ix+020h),a		;65aa
	set 2,(ix+00fh)		;65ad
	ld a,(ix+012h)		;65b1
	bit 7,(ix+00eh)		;65b4
	jr z,L_65C1		;65b8
	ld e,(ix+029h)		;65ba
	sub e			;65bd
	call m,L_65E0		;65be
L_65C1:
	ld (ix+00ch),a		;65c1
	ld a,(0e1e4h)		;65c4
	cp 008h		;65c7
	jr nc,L_65D0		;65c9
	bit 2,(ix+00dh)		;65cb
	ret nz			;65cf
L_65D0:
	bit 1,(ix+00fh)		;65d0
	ret z			;65d4
	ld a,(ix+025h)		;65d5
	ld (ix+00ch),a		;65d8
	res 2,(ix+00fh)		;65db
	ret			;65df
L_65E0:
	xor a			;65e0
	ret			;65e1
L_65E2:
	bit 0,(ix+00eh)		;65e2
	jp nz,L_65FF		;65e6
	bit 6,(ix+00dh)		;65e9
	call nz,L_6738		;65ed
	bit 2,(ix+00eh)		;65f0
	call nz,L_6642		;65f4
	bit 0,(ix+00fh)		;65f7
	call nz,L_6690		;65fb
	ret			;65fe
L_65FF:
	dec (ix+019h)		;65ff
	ret nz			;6602
	ld l,(ix+017h)		;6603
	ld h,(ix+018h)		;6606
	ld a,(hl)			;6609
	cp 0ffh		;660a
	jr z,L_6616		;660c
	set 7,(ix+009h)		;660e
	call L_651C		;6612
	ret			;6615
L_6616:
	res 0,(ix+00eh)		;6616
	xor a			;661a
	ld (ix+00ch),a		;661b
	ld a,(ix+00dh)		;661e
	and 0f0h		;6621
	ld (ix+00dh),a		;6623
	ret			;6626
L_6627:
	ld e,(ix+010h)		;6627
	ld d,(ix+011h)		;662a
	bit 1,(ix+00eh)		;662d
	jr z,L_663B		;6631
	ld a,(ix+026h)		;6633
	add a,e			;6636
	ld e,a			;6637
	jr nc,L_663B		;6638
	inc d			;663a
L_663B:
	ld (ix+00ah),e		;663b
	ld (ix+00bh),d		;663e
	ret			;6641
L_6642:
	inc (ix+01eh)		;6642
	ld a,(ix+01eh)		;6645
	ld b,(ix+00eh)		;6648
	bit 4,b		;664b
	jr nz,L_6661		;664d
	bit 3,b		;664f
	jr z,L_6661		;6651
	cp (ix+01ah)		;6653
	ret nz			;6656
	ld (ix+01eh),000h		;6657
	set 4,(ix+00eh)		;665b
	jr L_6665		;665f
L_6661:
	cp (ix+01bh)		;6661
	ret nz			;6664
L_6665:
	ld e,(ix+00ah)		;6665
	ld d,(ix+00bh)		;6668
	ld b,(ix+01ch)		;666b
	ld a,(ix+01dh)		;666e
	cpl			;6671
	ld (ix+01dh),a		;6672
	and a			;6675
	ld a,e			;6676
	jr nz,L_6680		;6677
	add a,b			;6679
	ld e,a			;667a
	jr nc,L_6685		;667b
	inc d			;667d
	jr L_6685		;667e
L_6680:
	sub b			;6680
	ld e,a			;6681
	jr nc,L_6685		;6682
	dec d			;6684
L_6685:
	ld (ix+00ah),e		;6685
	ld (ix+00bh),d		;6688
	ld (ix+01eh),000h		;668b
	ret			;668f
L_6690:
	ld a,(0e1e4h)		;6690
	cp 008h		;6693
	jr nc,L_669C		;6695
	bit 2,(ix+00dh)		;6697
	ret nz			;669b
L_669C:
	call L_66A3		;669c
	ld (ix+00ch),e		;669f
	ret			;66a2
L_66A3:
	ld e,(ix+00ch)		;66a3
	inc (ix+01fh)		;66a6
	ld b,(ix+01fh)		;66a9
	ld a,(ix+024h)		;66ac
	cp (ix+004h)		;66af
	call nc,L_6733		;66b2
	bit 5,(ix+00fh)		;66b5
	jr nz,L_6727		;66b9
	bit 3,(ix+00fh)		;66bb
	jr nz,L_66EE		;66bf
	bit 2,(ix+00fh)		;66c1
	jr nz,L_66DA		;66c5
	ld a,e			;66c7
	inc a			;66c8
	ld e,a			;66c9
	cp (ix+012h)		;66ca
	ret c			;66cd
	set 2,(ix+00fh)		;66ce
	ld e,(ix+012h)		;66d2
	ld (ix+01fh),000h		;66d5
	ret			;66d9
L_66DA:
	ld a,e			;66da
	dec a			;66db
	jp m,L_66E0		;66dc
	ld e,a			;66df
L_66E0:
	ld a,b			;66e0
	cp (ix+021h)		;66e1
	ret c			;66e4
	ld (ix+01fh),000h		;66e5
	set 3,(ix+00fh)		;66e9
	ret			;66ed
L_66EE:
	bit 4,(ix+00fh)		;66ee
	jp nz,L_6711		;66f2
	ld a,b			;66f5
	cp (ix+022h)		;66f6
	ret nz			;66f9
	ld a,e			;66fa
	dec a			;66fb
	ret m			;66fc
	ld e,a			;66fd
	inc (ix+020h)		;66fe
	ld a,(ix+020h)		;6701
	cp (ix+023h)		;6704
	ld (ix+01fh),000h		;6707
	ret nz			;670b
	set 5,(ix+00fh)		;670c
	ret			;6710
L_6711:
	ld a,(ix+022h)		;6711
	ld d,a			;6714
	ld a,e			;6715
	sub d			;6716
	ld e,000h		;6717
	jp m,L_671D		;6719
	ld e,a			;671c
L_671D:
	ld a,b			;671d
	cp (ix+023h)		;671e
	ret nz			;6721
	set 5,(ix+00fh)		;6722
	ret			;6726
L_6727:
	ld a,(ix+004h)		;6727
	cp (ix+024h)		;672a
	ret nc			;672d
	ld a,e			;672e
	dec a			;672f
	ret m			;6730
	ld e,a			;6731
	ret			;6732
L_6733:
	set 5,(ix+00fh)		;6733
	ret			;6737
L_6738:
	nop			;6738
	bit 5,(ix+00dh)		;6739
	ret z			;673d
	bit 3,(ix+031h)		;673e
	jr z,L_6768		;6742
	dec (ix+030h)		;6744
	bit 3,(ix+030h)		;6747
	jr z,L_6792		;674b
	ld a,(ix+030h)		;674d
	sub 008h		;6750
	ld b,a			;6752
	dec b			;6753
	ld a,(ix+032h)		;6754
	ld e,a			;6757
L_6758:
	add a,e			;6758
	djnz L_6758		;6759
	ld e,a			;675b
	ld d,000h		;675c
	ld l,(ix+010h)		;675e
	ld h,(ix+011h)		;6761
	sbc hl,de		;6764
	jr L_678B		;6766
L_6768:
	ld a,(ix+030h)		;6768
	or a			;676b
	jr z,L_6792		;676c
	dec (ix+030h)		;676e
	ld a,(ix+030h)		;6771
	or a			;6774
	jr z,L_6792		;6775
	ld b,a			;6777
	ld a,(ix+032h)		;6778
	ld hl,00000h		;677b
	ld d,000h		;677e
L_6780:
	ld e,a			;6780
	add hl,de			;6781
	djnz L_6780		;6782
	ld e,(ix+010h)		;6784
	ld d,(ix+011h)		;6787
	add hl,de			;678a
L_678B:
	ld (ix+00ah),l		;678b
	ld (ix+00bh),h		;678e
	ret			;6791
L_6792:
	res 5,(ix+00dh)		;6792
	ld e,(ix+010h)		;6796
	ld d,(ix+011h)		;6799
	ld (ix+00ah),e		;679c
	ld (ix+00bh),d		;679f
	ld a,(ix+031h)		;67a2
	ld (ix+030h),a		;67a5
	ret			;67a8
L_67A9:
	inc hl			;67a9
	ld (ix+002h),l		;67aa
	ld (ix+003h),h		;67ad
	ret			;67b0
L_67B1:
	ld de,0e1dfh		;67b1
	ld a,(de)			;67b4
	ld b,a			;67b5
	inc de			;67b6
	ld a,(de)			;67b7
	ld c,a			;67b8
	ld hl,0e1e1h		;67b9
	inc (hl)			;67bc
	ld a,(hl)			;67bd
	cp b			;67be
	ret nz			;67bf
	ld (hl),000h		;67c0
	inc hl			;67c2
	inc (hl)			;67c3
	ld a,(hl)			;67c4
	cp c			;67c5
	ret nz			;67c6
	ld hl,0e1cbh		;67c7
	res 0,(hl)		;67ca
	xor a			;67cc
	ld hl,0e1e1h		;67cd
	ld (hl),a			;67d0
	inc hl			;67d1
	ld (hl),a			;67d2
	ld a,(0e033h)		;67d3
	ld e,a			;67d6
	ld a,(0e066h)		;67d7
	cp e			;67da
	jr nz,L_67EB		;67db
	ld ix,0e066h		;67dd
	call L_684D		;67e1
	ld ix,0e099h		;67e4
	call L_684D		;67e8
L_67EB:
	ld de,00033h		;67eb
	ld ix,0e000h		;67ee
	call L_684D		;67f2
	add ix,de		;67f5
	call L_684D		;67f7
	ld ix,0e0cch		;67fa
	call L_684D		;67fe
	add ix,de		;6801
	call L_684D		;6803
	add ix,de		;6806
	call L_684D		;6808
	add ix,de		;680b
	call L_684D		;680d
	ret			;6810
L_6811:
	ld a,(0e033h)		;6811
	ld b,a			;6814
	ld a,(0e066h)		;6815
	cp b			;6818
	jr z,L_6821		;6819
	ld a,(0e1e4h)		;681b
	and 0f3h		;681e
	ret z			;6820
L_6821:
	bit 2,(ix+00dh)		;6821
	jr nz,L_6832		;6825
	ld a,(0e1e2h)		;6827
	ld b,a			;682a
	ld a,e			;682b
	sub b			;682c
	ld e,000h		;682d
	ret m			;682f
	ld e,a			;6830
	ret			;6831
L_6832:
	ld e,000h		;6832
	ret			;6834
L_6835:
	ld hl,0e1e1h		;6835
	inc (hl)			;6838
	ld a,(hl)			;6839
	cp 025h		;683a
	ret nz			;683c
	ld (hl),000h		;683d
	inc hl			;683f
	dec (hl)			;6840
	ret nz			;6841
	ld hl,0e1cbh		;6842
	res 4,(hl)		;6845
	ld hl,0e1e1h		;6847
	ld (hl),000h		;684a
	ret			;684c
L_684D:
	xor a			;684d
	ld (ix+000h),a		;684e
	ld (ix+001h),a		;6851
	ld (ix+005h),a		;6854
	ld (ix+006h),a		;6857
	ld (ix+00ah),a		;685a
	ld (ix+00bh),a		;685d
	ld (ix+00ch),a		;6860
	ld (ix+00dh),a		;6863
	ld (ix+00eh),a		;6866
	ld (ix+00fh),a		;6869
	ld a,(0e1e4h)		;686c
	cp 008h		;686f
	ret nc			;6871
	nop			;6872
	cp 004h		;6873
	ld hl,0e1e7h		;6875
	jr nz,L_6889		;6878
	res 0,(hl)		;687a
	res 1,(hl)		;687c
	bit 3,(hl)		;687e
	ret z			;6880
	bit 2,(hl)		;6881
	ret z			;6883
	set 2,(hl)		;6884
	res 3,(hl)		;6886
	ret			;6888
L_6889:
	res 2,(hl)		;6889
	res 3,(hl)		;688b
	ret			;688d
L_688E:
	cp 0e0h		;688e
	jp c,L_6AF8		;6890
	and 01fh		;6893
	push hl			;6895
	ld hl,068a3h		;6896
	add a,a			;6899
	ld e,a			;689a
	ld d,000h		;689b
	add hl,de			;689d
	ld e,(hl)			;689e
	inc hl			;689f
	ld d,(hl)			;68a0
	ex de,hl			;68a1
	jp (hl)			;68a2

; ----------------------------------------------------------------------
; DATOS ordenes: 31 destinos, uno por orden de la partitura de 0xE0 a 0xFE
;   (p04:6896: HL = 0x68A3 + 2 x (orden & 0x1F); jp (hl) en p04:68A2); el 0xFF
;   no llega aqui (lo mira antes p04:63E3); lo leen p04:68A2 (62 bytes)
;   0x68a3..0x68e1  (62 bytes)
DATA_ordenes:
	defw 068e1h,068f7h,068e1h,068f7h,06914h,0693eh,06952h,06962h	; 68a3
	defw 06974h,06985h,0698ch,06993h,069e6h,069f0h,069f7h,06a02h	; 68b3
	defw 06a08h,06a12h,06a2dh,06a3ch,06a42h,06a48h,06a4eh,06a58h	; 68c3
	defw 06a63h,06a7dh,06a88h,06a90h,06aaah,06abfh,06ac2h	; 68d3

; ======================================================================
; CODIGO 0x68e1..0x6c84  (931 bytes)
; ======================================================================


L_68E1:
	pop hl			;68e1
L_68E2:
	res 6,(ix+00eh)		;68e2
	ld a,(hl)			;68e6
	and 003h		;68e7
	ld (ix+00dh),a		;68e9
	ld b,a			;68ec
	inc hl			;68ed
	ld a,(hl)			;68ee
	ld (ix+013h),a		;68ef
	ld a,b			;68f2
	or a			;68f3
	ret nz			;68f4
	dec hl			;68f5
	ret			;68f6
L_68F7:
	pop hl			;68f7
	ld a,(0e1e4h)		;68f8
	cp 004h		;68fb
	ld a,(0e1e7h)		;68fd
	jr nz,L_690B		;6900
	set 0,a		;6902
	res 1,a		;6904
	ld (0e1e7h),a		;6906
	jr L_68E2		;6909
L_690B:
	set 2,a		;690b
	res 3,a		;690d
	ld (0e1e7h),a		;690f
	jr L_68E2		;6912
L_6914:
	pop hl			;6914
	inc hl			;6915
	ld a,(hl)			;6916
	and 01fh		;6917
	ld b,a			;6919
	ld a,(0e1e4h)		;691a
	cp 004h		;691d
	ld a,b			;691f
	jr nz,L_6930		;6920
	ld (0e1e5h),a		;6922
	ld a,(0e1e7h)		;6925
	set 0,a		;6928
	res 1,a		;692a
	ld (0e1e7h),a		;692c
	ret			;692f
L_6930:
	ld (0e1e6h),a		;6930
	ld a,(0e1e7h)		;6933
	set 2,a		;6936
	res 3,a		;6938
	ld (0e1e7h),a		;693a
	ret			;693d
L_693E:
	pop hl			;693e
	inc hl			;693f
	res 3,(ix+00dh)		;6940
	ld a,(hl)			;6944
	ld (0e1e8h),a		;6945
	ld de,0e1e7h		;6948
	ld a,(de)			;694b
	set 5,a		;694c
	ld (de),a			;694e
	jp L_6953		;694f
L_6952:
	pop hl			;6952
L_6953:
	inc hl			;6953
	ld a,(hl)			;6954
	ld (0e1eah),a		;6955
	ld de,0e1e7h		;6958
	ld a,(de)			;695b
	set 6,a		;695c
	ld (de),a			;695e
	jp L_6963		;695f
L_6962:
	pop hl			;6962
L_6963:
	inc hl			;6963
	ld a,(hl)			;6964
	ld (0e1e9h),a		;6965
	ld de,0e1e7h		;6968
	ld a,(de)			;696b
	set 7,a		;696c
	ld (de),a			;696e
	set 2,(ix+00dh)		;696f
	ret			;6973
L_6974:
	pop hl			;6974
L_6975:
	ld de,0e1e7h		;6975
	ld a,(de)			;6978
	and 01fh		;6979
	ld (de),a			;697b
	ld a,(ix+00dh)		;697c
	and 0f3h		;697f
	ld (ix+00dh),a		;6981
	ret			;6984
L_6985:
	pop hl			;6985
	inc hl			;6986
	ld a,(hl)			;6987
	ld (ix+014h),a		;6988
	ret			;698b
L_698C:
	pop hl			;698c
	inc hl			;698d
	ld a,(hl)			;698e
	ld (ix+015h),a		;698f
	ret			;6992
L_6993:
	pop hl			;6993
	inc hl			;6994
	ld a,(ix+00fh)		;6995
	and 080h		;6998
	ld (ix+00fh),a		;699a
	ld a,(hl)			;699d
	and 0f0h		;699e
	rrca			;69a0
	rrca			;69a1
	rrca			;69a2
	rrca			;69a3
	cp 008h		;69a4
	jp nc,L_69AD		;69a6
	set 2,(ix+00fh)		;69a9
L_69AD:
	res 3,a		;69ad
	inc a			;69af
	bit 2,(ix+00fh)		;69b0
	jp nz,L_69BB		;69b4
	set 1,(ix+00fh)		;69b7
L_69BB:
	ld (ix+021h),a		;69bb
	ld a,(hl)			;69be
	and 00fh		;69bf
	cp 008h		;69c1
	jp c,L_69CA		;69c3
	set 4,(ix+00fh)		;69c6
L_69CA:
	res 3,a		;69ca
	inc a			;69cc
	ld (ix+022h),a		;69cd
	inc hl			;69d0
	ld a,(hl)			;69d1
	and 0f0h		;69d2
	rrca			;69d4
	rrca			;69d5
	rrca			;69d6
	rrca			;69d7
	ld (ix+023h),a		;69d8
	ld a,(hl)			;69db
	and 00fh		;69dc
	ld (ix+024h),a		;69de
	set 0,(ix+00fh)		;69e1
	ret			;69e5
L_69E6:
	pop hl			;69e6
	res 0,(ix+00fh)		;69e7
	res 1,(ix+00fh)		;69eb
	ret			;69ef
L_69F0:
	pop hl			;69f0
	inc hl			;69f1
	ld a,(hl)			;69f2
	ld (ix+025h),a		;69f3
	ret			;69f6
L_69F7:
	pop hl			;69f7
	inc hl			;69f8
	ld a,(hl)			;69f9
	ld (ix+026h),a		;69fa
	set 1,(ix+00eh)		;69fd
	ret			;6a01
L_6A02:
	pop hl			;6a02
	res 1,(ix+00eh)		;6a03
	ret			;6a07
L_6A08:
	pop hl			;6a08
	ld a,(ix+00eh)		;6a09
	and 0e2h		;6a0c
	ld (ix+00eh),a		;6a0e
	ret			;6a11
L_6A12:
	pop hl			;6a12
	inc hl			;6a13
	ld a,(ix+00eh)		;6a14
	or 014h		;6a17
	ld (ix+00eh),a		;6a19
	ld a,(hl)			;6a1c
	and 00fh		;6a1d
	ld (ix+01ch),a		;6a1f
	ld a,(hl)			;6a22
	and 0f0h		;6a23
	rrca			;6a25
	rrca			;6a26
	rrca			;6a27
	rrca			;6a28
	ld (ix+01bh),a		;6a29
	ret			;6a2c
L_6A2D:
	pop hl			;6a2d
	inc hl			;6a2e
	ld a,(hl)			;6a2f
	ld (ix+01ah),a		;6a30
	ld a,(ix+00eh)		;6a33
	or 00ch		;6a36
	ld (ix+00eh),a		;6a38
	ret			;6a3b
L_6A3C:
	pop hl			;6a3c
	res 3,(ix+00eh)		;6a3d
	ret			;6a41
L_6A42:
	pop hl			;6a42
	set 6,(ix+00eh)		;6a43
	ret			;6a47
L_6A48:
	pop hl			;6a48
	set 5,(ix+00eh)		;6a49
	ret			;6a4d
L_6A4E:
	pop hl			;6a4e
	ld a,(ix+00eh)		;6a4f
	and 09fh		;6a52
	ld (ix+00eh),a		;6a54
	ret			;6a57
L_6A58:
	pop hl			;6a58
	set 7,(ix+00eh)		;6a59
	inc hl			;6a5d
	ld a,(hl)			;6a5e
	ld (ix+029h),a		;6a5f
	ret			;6a62
L_6A63:
	pop hl			;6a63
	inc hl			;6a64
	ld a,(hl)			;6a65
	ld de,07210h		;6a66
	add a,a			;6a69
	add a,e			;6a6a
	ld e,a			;6a6b
	jr nc,L_6A6F		;6a6c
	inc d			;6a6e
L_6A6F:
	ld a,(de)			;6a6f
	ld (ix+027h),a		;6a70
	inc de			;6a73
	ld a,(de)			;6a74
	ld (ix+028h),a		;6a75
	set 7,(ix+00fh)		;6a78
	ret			;6a7c
L_6A7D:
	pop hl			;6a7d
	call L_6A9C		;6a7e
	ld (ix+007h),e		;6a81
	ld (ix+008h),d		;6a84
	ret			;6a87
L_6A88:
	pop hl			;6a88
	ld l,(ix+007h)		;6a89
	ld h,(ix+008h)		;6a8c
	ret			;6a8f
L_6A90:
	pop hl			;6a90
	inc hl			;6a91
	ld a,(ix+005h)		;6a92
	inc a			;6a95
	cp (hl)			;6a96
	jr z,L_6AA3		;6a97
	ld (ix+005h),a		;6a99
L_6A9C:
	inc hl			;6a9c
	ld e,(hl)			;6a9d
	inc hl			;6a9e
	ld d,(hl)			;6a9f
	ex de,hl			;6aa0
	dec hl			;6aa1
	ret			;6aa2
L_6AA3:
	inc hl			;6aa3
	inc hl			;6aa4
	ld (ix+005h),000h		;6aa5
	ret			;6aa9
L_6AAA:
	pop hl			;6aaa
	inc hl			;6aab
	ld a,(ix+006h)		;6aac
	inc a			;6aaf
	cp (hl)			;6ab0
	jr z,L_6AB8		;6ab1
	ld (ix+006h),a		;6ab3
	jr L_6A9C		;6ab6
L_6AB8:
	inc hl			;6ab8
	inc hl			;6ab9
	ld (ix+006h),000h		;6aba
	ret			;6abe
L_6ABF:
	pop hl			;6abf
	jr L_6A9C		;6ac0
L_6AC2:
	pop hl			;6ac2
	inc hl			;6ac3
	ld b,(ix+009h)		;6ac4
	ld a,(hl)			;6ac7
	ld (ix+009h),a		;6ac8
	cp 001h		;6acb
	ld a,b			;6acd
	jp z,L_6AE8		;6ace
	cp 001h		;6ad1
	ret nz			;6ad3
	ld a,(ix+00eh)		;6ad4
	ld (ix+02ah),a		;6ad7
	ld a,(ix+00fh)		;6ada
	ld (ix+02bh),a		;6add
	xor a			;6ae0
	ld (ix+00eh),a		;6ae1
	ld (ix+00fh),a		;6ae4
	ret			;6ae7
L_6AE8:
	cp 001h		;6ae8
	ret z			;6aea
	ld a,(ix+02ah)		;6aeb
	ld (ix+00eh),a		;6aee
	ld a,(ix+02bh)		;6af1
	ld (ix+00fh),a		;6af4
	ret			;6af7
L_6AF8:
	ld a,(hl)			;6af8
	and 00fh		;6af9
	cp 006h		;6afb
	jr nc,L_6B06		;6afd
	ld (ix+016h),a		;6aff
	ld (ix+02ch),a		;6b02
	ret			;6b05
L_6B06:
	cp 007h		;6b06
	jr z,L_6B28		;6b08
	cp 008h		;6b0a
	jr z,L_6B31		;6b0c
	cp 009h		;6b0e
	jr z,L_6B51		;6b10
	cp 00ah		;6b12
	jr z,L_6B5B		;6b14
	cp 00bh		;6b16
	jr z,L_6B62		;6b18
	cp 00ch		;6b1a
	jr z,L_6B7E		;6b1c
	cp 00dh		;6b1e
	jr z,L_6B88		;6b20
	cp 00eh		;6b22
	jr z,L_6B8D		;6b24
	jr L_6B93		;6b26
L_6B28:
	res 6,(ix+00dh)		;6b28
	res 5,(ix+00dh)		;6b2c
	ret			;6b30
L_6B31:
	set 6,(ix+00dh)		;6b31
	set 5,(ix+00dh)		;6b35
	inc hl			;6b39
	ld a,(hl)			;6b3a
	and 0f0h		;6b3b
	rrca			;6b3d
	rrca			;6b3e
	rrca			;6b3f
	rrca			;6b40
	ld (ix+030h),a		;6b41
	ld a,(ix+030h)		;6b44
	ld (ix+031h),a		;6b47
	ld a,(hl)			;6b4a
	and 00fh		;6b4b
	ld (ix+032h),a		;6b4d
	ret			;6b50
L_6B51:
	call L_6A9C		;6b51
	ld (ix+02dh),e		;6b54
	ld (ix+02eh),d		;6b57
	ret			;6b5a
L_6B5B:
	ld l,(ix+02dh)		;6b5b
	ld h,(ix+02eh)		;6b5e
	ret			;6b61
L_6B62:
	inc hl			;6b62
	ld a,(ix+005h)		;6b63
	inc a			;6b66
	cp (hl)			;6b67
	jr z,L_6B78		;6b68
	ld (ix+005h),a		;6b6a
	inc hl			;6b6d
	ld a,(hl)			;6b6e
	ld e,a			;6b6f
	ld a,l			;6b70
	sub e			;6b71
	ld l,a			;6b72
	jr nc,L_6B76		;6b73
	dec h			;6b75
L_6B76:
	dec hl			;6b76
	ret			;6b77
L_6B78:
	inc hl			;6b78
	ld (ix+005h),000h		;6b79
	ret			;6b7d
L_6B7E:
	set 7,(ix+00dh)		;6b7e
	inc hl			;6b82
	ld a,(hl)			;6b83
	ld (ix+02fh),a		;6b84
	ret			;6b87
L_6B88:
	res 7,(ix+00dh)		;6b88
	ret			;6b8c
L_6B8D:
	inc hl			;6b8d
	ld a,(hl)			;6b8e
	ld (ix+001h),a		;6b8f
	ret			;6b92
L_6B93:
	res 7,(ix+00eh)		;6b93
	ret			;6b97
L_6B98:
	call L_6B9F		;6b98
	call L_6C90		;6b9b
	ret			;6b9e
L_6B9F:
	call L_6BAF		;6b9f
	call L_6BC6		;6ba2
	call L_6BFB		;6ba5
	call L_6C22		;6ba8
	call L_6C50		;6bab
	ret			;6bae
L_6BAF:
	ld hl,0e00dh		;6baf
	ld a,(hl)			;6bb2
	and 001h		;6bb3
	jr z,L_6BC5		;6bb5
	ld hl,0e073h		;6bb7
	ld a,(hl)			;6bba
	and 001h		;6bbb
	jr z,L_6BC5		;6bbd
	ld hl,0e00dh		;6bbf
	ld a,002h		;6bc2
	ld (hl),a			;6bc4
L_6BC5:
	ret			;6bc5
L_6BC6:
	ld b,000h		;6bc6
	ld c,008h		;6bc8
	ld hl,0e00ah		;6bca
	call L_6BDD		;6bcd
	ld hl,0e03dh		;6bd0
	call L_6BDD		;6bd3
	ld hl,0e070h		;6bd6
	call L_6BDD		;6bd9
	ret			;6bdc
L_6BDD:
	ld e,(hl)			;6bdd
	ld a,b			;6bde
	call 00093h		;6bdf   ; BIOS WRTPSG - Writes data to PSG-register
	inc hl			;6be2
	inc b			;6be3
	ld e,(hl)			;6be4
	ld a,b			;6be5
	call 00093h		;6be6   ; BIOS WRTPSG - Writes data to PSG-register
	inc hl			;6be9
	ld e,(hl)			;6bea
	ld a,c			;6beb
	inc b			;6bec
	inc c			;6bed
	inc hl			;6bee
	bit 3,(hl)		;6bef
	ret nz			;6bf1
	call 00093h		;6bf2   ; BIOS WRTPSG - Writes data to PSG-register
	bit 2,(hl)		;6bf5
	ret z			;6bf7
	set 3,(hl)		;6bf8
	ret			;6bfa
L_6BFB:
	ld hl,0e1e7h		;6bfb
	bit 0,(hl)		;6bfe
	jr z,L_6C0E		;6c00
	res 0,(hl)		;6c02
	set 1,(hl)		;6c04
	ld a,(0e1e5h)		;6c06
	ld e,a			;6c09
	ld a,006h		;6c0a
	jr L_6C1E		;6c0c
L_6C0E:
	bit 1,(hl)		;6c0e
	ret nz			;6c10
	bit 2,(hl)		;6c11
	ret z			;6c13
	res 2,(hl)		;6c14
	set 3,(hl)		;6c16
	ld a,(0e1e6h)		;6c18
	ld e,a			;6c1b
	ld a,006h		;6c1c
L_6C1E:
	call 00093h		;6c1e   ; BIOS WRTPSG - Writes data to PSG-register
	ret			;6c21
L_6C22:
	ld hl,0e1e7h		;6c22
	bit 7,(hl)		;6c25
	ret z			;6c27
	res 7,(hl)		;6c28
	ld a,(0e1e9h)		;6c2a
	ld e,a			;6c2d
	ld a,00bh		;6c2e
	call 00093h		;6c30   ; BIOS WRTPSG - Writes data to PSG-register
	bit 6,(hl)		;6c33
	ret z			;6c35
	res 6,(hl)		;6c36
	ld a,(0e1eah)		;6c38
	ld e,a			;6c3b
	ld a,00ch		;6c3c
	call 00093h		;6c3e   ; BIOS WRTPSG - Writes data to PSG-register
	bit 5,(hl)		;6c41
	ret z			;6c43
	res 5,(hl)		;6c44
	ld a,(0e1e8h)		;6c46
	ld e,a			;6c49
	ld a,00dh		;6c4a
	call 00093h		;6c4c   ; BIOS WRTPSG - Writes data to PSG-register
	ret			;6c4f
L_6C50:
	ld hl,0e00dh		;6c50
	ld a,(hl)			;6c53
	ld hl,06c84h		;6c54
	call L_6C7D		;6c57
	ld b,(hl)			;6c5a
	ld hl,0e040h		;6c5b
	ld a,(hl)			;6c5e
	ld hl,06c88h		;6c5f
	call L_6C7D		;6c62
	ld c,(hl)			;6c65
	ld hl,0e073h		;6c66
	ld a,(hl)			;6c69
	ld hl,06c8ch		;6c6a
	call L_6C7D		;6c6d
	ld a,(hl)			;6c70
	or b			;6c71
	or c			;6c72
L_6C73:
	ld e,a			;6c73
	ld (0e1e3h),a		;6c74
	ld a,007h		;6c77
	call 00093h		;6c79   ; BIOS WRTPSG - Writes data to PSG-register
	ret			;6c7c
L_6C7D:
	and 003h		;6c7d
	ld e,a			;6c7f
	ld d,000h		;6c80
	add hl,de			;6c82
	ret			;6c83

; ----------------------------------------------------------------------
; DATOS resto_6C84: lo apuntan con el banco puesto p04:6C54 (0x6C84), p04:6C5F
;   (0x6C88), p04:6C6A (0x6C8C); el tamano es lo que hay hasta lo siguiente,
;   no sale de recorrerlo; lo leen p04:6C54, p04:6C5F, p04:6C6A (12 bytes)
;   0x6c84..0x6c90  (12 bytes)
DATA_resto_6C84:
	defb 089h,081h,088h,080h,092h,082h,090h,080h,0a4h,084h,0a0h,080h	; 6c84  ............

; ======================================================================
; CODIGO 0x6c90..0x6f2e  (670 bytes)
; ======================================================================


L_6C90:
	call L_6C9D		;6c90
	call L_6DA2		;6c93
	call L_6DF4		;6c96
	call L_6EBB		;6c99
	ret			;6c9c
L_6C9D:
	ld ix,0e1ebh		;6c9d
	ld bc,0e1f7h		;6ca1
	ld de,0e1edh		;6ca4
	ld hl,0e0a3h		;6ca7
	ld a,(de)			;6caa
	res 0,(ix+000h)		;6cab
	cp (hl)			;6caf
	jr z,L_6CB8		;6cb0
	set 0,(ix+000h)		;6cb2
	ld a,(hl)			;6cb6
	ld (de),a			;6cb7
L_6CB8:
	inc de			;6cb8
	inc hl			;6cb9
	ld a,(de)			;6cba
	res 1,(ix+000h)		;6cbb
	cp (hl)			;6cbf
	jr z,L_6CC8		;6cc0
	set 1,(ix+000h)		;6cc2
	ld a,(hl)			;6cc6
	ld (de),a			;6cc7
L_6CC8:
	inc de			;6cc8
	inc hl			;6cc9
	res 2,(ix+001h)		;6cca
	ld a,(bc)			;6cce
	cp (hl)			;6ccf
	jr z,L_6CD8		;6cd0
	set 2,(ix+001h)		;6cd2
	ld a,(hl)			;6cd6
	ld (bc),a			;6cd7
L_6CD8:
	inc bc			;6cd8
	ld hl,0e0d6h		;6cd9
	ld a,(de)			;6cdc
	res 2,(ix+000h)		;6cdd
	cp (hl)			;6ce1
	jr z,L_6CEA		;6ce2
	set 2,(ix+000h)		;6ce4
	ld a,(hl)			;6ce8
	ld (de),a			;6ce9
L_6CEA:
	inc de			;6cea
	inc hl			;6ceb
	ld a,(de)			;6cec
	res 3,(ix+000h)		;6ced
	cp (hl)			;6cf1
	jr z,L_6CFA		;6cf2
	set 3,(ix+000h)		;6cf4
	ld a,(hl)			;6cf8
	ld (de),a			;6cf9
L_6CFA:
	inc de			;6cfa
	inc hl			;6cfb
	res 3,(ix+001h)		;6cfc
	ld a,(bc)			;6d00
	cp (hl)			;6d01
	jr z,L_6D0A		;6d02
	set 3,(ix+001h)		;6d04
	ld a,(hl)			;6d08
	ld (bc),a			;6d09
L_6D0A:
	inc bc			;6d0a
	ld hl,0e109h		;6d0b
	ld a,(de)			;6d0e
	res 4,(ix+000h)		;6d0f
	cp (hl)			;6d13
	jr z,L_6D1C		;6d14
	set 4,(ix+000h)		;6d16
	ld a,(hl)			;6d1a
	ld (de),a			;6d1b
L_6D1C:
	inc de			;6d1c
	inc hl			;6d1d
	ld a,(de)			;6d1e
	res 5,(ix+000h)		;6d1f
	cp (hl)			;6d23
	jr z,L_6D2C		;6d24
	set 5,(ix+000h)		;6d26
	ld a,(hl)			;6d2a
	ld (de),a			;6d2b
L_6D2C:
	inc de			;6d2c
	inc hl			;6d2d
	res 4,(ix+001h)		;6d2e
	ld a,(bc)			;6d32
	cp (hl)			;6d33
	jr z,L_6D3C		;6d34
	set 4,(ix+001h)		;6d36
	ld a,(hl)			;6d3a
	ld (bc),a			;6d3b
L_6D3C:
	inc bc			;6d3c
	ld hl,0e13ch		;6d3d
	ld a,(de)			;6d40
	res 6,(ix+000h)		;6d41
	cp (hl)			;6d45
	jr z,L_6D4E		;6d46
	set 6,(ix+000h)		;6d48
	ld a,(hl)			;6d4c
	ld (de),a			;6d4d
L_6D4E:
	inc de			;6d4e
	inc hl			;6d4f
	ld a,(de)			;6d50
	res 7,(ix+000h)		;6d51
	cp (hl)			;6d55
	jr z,L_6D5E		;6d56
	set 7,(ix+000h)		;6d58
	ld a,(hl)			;6d5c
	ld (de),a			;6d5d
L_6D5E:
	inc de			;6d5e
	inc hl			;6d5f
	res 5,(ix+001h)		;6d60
	ld a,(bc)			;6d64
	cp (hl)			;6d65
	jr z,L_6D6E		;6d66
	set 5,(ix+001h)		;6d68
	ld a,(hl)			;6d6c
	ld (bc),a			;6d6d
L_6D6E:
	inc bc			;6d6e
	ld hl,0e16fh		;6d6f
	ld a,(de)			;6d72
	res 0,(ix+001h)		;6d73
	cp (hl)			;6d77
	jr z,L_6D80		;6d78
	set 0,(ix+001h)		;6d7a
	ld a,(hl)			;6d7e
	ld (de),a			;6d7f
L_6D80:
	inc de			;6d80
	inc hl			;6d81
	ld a,(de)			;6d82
	res 1,(ix+001h)		;6d83
	cp (hl)			;6d87
	jr z,L_6D90		;6d88
	set 1,(ix+001h)		;6d8a
	ld a,(hl)			;6d8e
	ld (de),a			;6d8f
L_6D90:
	inc de			;6d90
	inc hl			;6d91
	res 6,(ix+001h)		;6d92
	ld a,(bc)			;6d96
	cp (hl)			;6d97
	jr z,L_6DA0		;6d98
	set 6,(ix+001h)		;6d9a
	ld a,(hl)			;6d9e
	ld (bc),a			;6d9f
L_6DA0:
	inc bc			;6da0
	ret			;6da1
L_6DA2:
	ld e,000h		;6da2
	ld hl,0e0a6h		;6da4
	ld c,001h		;6da7
	ld a,(hl)			;6da9
	or a			;6daa
	jr z,L_6DAE		;6dab
	ld a,c			;6dad
L_6DAE:
	or e			;6dae
	ld e,a			;6daf
	ld hl,0e0d9h		;6db0
	sla c		;6db3
	ld a,(hl)			;6db5
	or a			;6db6
	jr z,L_6DBA		;6db7
	ld a,c			;6db9
L_6DBA:
	or e			;6dba
	ld e,a			;6dbb
	ld hl,0e10ch		;6dbc
	sla c		;6dbf
	ld a,(hl)			;6dc1
	or a			;6dc2
	jr z,L_6DC6		;6dc3
	ld a,c			;6dc5
L_6DC6:
	or e			;6dc6
	ld e,a			;6dc7
	ld hl,0e13fh		;6dc8
	sla c		;6dcb
	ld a,(hl)			;6dcd
	or a			;6dce
	jr z,L_6DD2		;6dcf
	ld a,c			;6dd1
L_6DD2:
	or e			;6dd2
	ld e,a			;6dd3
	ld hl,0e172h		;6dd4
	sla c		;6dd7
	ld a,(hl)			;6dd9
	or a			;6dda
	jr z,L_6DDE		;6ddb
	ld a,c			;6ddd
L_6DDE:
	or e			;6dde
	ld e,a			;6ddf
	ld hl,0e1fch		;6de0
	ld a,(hl)			;6de3
	cp e			;6de4
	jr z,L_6DEE		;6de5
	ld (hl),e			;6de7
	ld hl,0e1ech		;6de8
	set 7,(hl)		;6deb
	ret			;6ded
L_6DEE:
	ld hl,0e1ech		;6dee
	res 7,(hl)		;6df1
	ret			;6df3
L_6DF4:
	ld ix,0e1ebh		;6df4
	ld hl,0e1edh		;6df8
	ld de,09880h		;6dfb
	bit 0,(ix+000h)		;6dfe
	jr z,L_6E07		;6e02
	call L_6EAC		;6e04
L_6E07:
	inc hl			;6e07
	inc de			;6e08
	bit 1,(ix+000h)		;6e09
	jr z,L_6E12		;6e0d
	call L_6EAC		;6e0f
L_6E12:
	inc hl			;6e12
	inc de			;6e13
	bit 2,(ix+000h)		;6e14
	jr z,L_6E1D		;6e18
	call L_6EAC		;6e1a
L_6E1D:
	inc hl			;6e1d
	inc de			;6e1e
	bit 3,(ix+000h)		;6e1f
	jr z,L_6E28		;6e23
	call L_6EAC		;6e25
L_6E28:
	inc hl			;6e28
	inc de			;6e29
	bit 4,(ix+000h)		;6e2a
	jr z,L_6E33		;6e2e
	call L_6EAC		;6e30
L_6E33:
	inc hl			;6e33
	inc de			;6e34
	bit 5,(ix+000h)		;6e35
	jr z,L_6E3E		;6e39
	call L_6EAC		;6e3b
L_6E3E:
	inc hl			;6e3e
	inc de			;6e3f
	bit 6,(ix+000h)		;6e40
	jr z,L_6E49		;6e44
	call L_6EAC		;6e46
L_6E49:
	inc hl			;6e49
	inc de			;6e4a
	bit 7,(ix+000h)		;6e4b
	jr z,L_6E54		;6e4f
	call L_6EAC		;6e51
L_6E54:
	inc hl			;6e54
	inc de			;6e55
	bit 0,(ix+001h)		;6e56
	jr z,L_6E5F		;6e5a
	call L_6EAC		;6e5c
L_6E5F:
	inc hl			;6e5f
	inc de			;6e60
	bit 1,(ix+001h)		;6e61
	jr z,L_6E6A		;6e65
	call L_6EAC		;6e67
L_6E6A:
	inc hl			;6e6a
	inc de			;6e6b
	bit 2,(ix+001h)		;6e6c
	jr z,L_6E75		;6e70
	call L_6EAC		;6e72
L_6E75:
	inc hl			;6e75
	inc de			;6e76
	bit 3,(ix+001h)		;6e77
	jr z,L_6E80		;6e7b
	call L_6EAC		;6e7d
L_6E80:
	inc hl			;6e80
	inc de			;6e81
	bit 4,(ix+001h)		;6e82
	jr z,L_6E8B		;6e86
	call L_6EAC		;6e88
L_6E8B:
	inc hl			;6e8b
	inc de			;6e8c
	bit 5,(ix+001h)		;6e8d
	jr z,L_6E96		;6e91
	call L_6EAC		;6e93
L_6E96:
	inc hl			;6e96
	inc de			;6e97
	bit 6,(ix+001h)		;6e98
	jr z,L_6EA1		;6e9c
	call L_6EAC		;6e9e
L_6EA1:
	inc hl			;6ea1
	inc de			;6ea2
	bit 7,(ix+001h)		;6ea3
	ret z			;6ea7
	call L_6EAC		;6ea8
	ret			;6eab
L_6EAC:
	ld a,(hl)			;6eac
	ld c,a			;6ead
	ld a,03fh		;6eae
	ld (09000h),a		;6eb0
	ld a,c			;6eb3
	ld (de),a			;6eb4
	ld a,005h		;6eb5
	ld (09000h),a		;6eb7
	ret			;6eba
L_6EBB:
	ld hl,0e0a8h		;6ebb
	bit 7,(hl)		;6ebe
	jr z,L_6ED1		;6ec0
	res 7,(hl)		;6ec2
	ld hl,0e0c0h		;6ec4
	ld e,(hl)			;6ec7
	inc hl			;6ec8
	ld d,(hl)			;6ec9
	ex de,hl			;6eca
	ld de,09800h		;6ecb
	call L_6F0F		;6ece
L_6ED1:
	ld hl,0e0dbh		;6ed1
	bit 7,(hl)		;6ed4
	jr z,L_6EE7		;6ed6
	res 7,(hl)		;6ed8
	ld hl,0e0f3h		;6eda
	ld e,(hl)			;6edd
	inc hl			;6ede
	ld d,(hl)			;6edf
	ex de,hl			;6ee0
	ld de,09820h		;6ee1
	call L_6F0F		;6ee4
L_6EE7:
	ld hl,0e10eh		;6ee7
	bit 7,(hl)		;6eea
	jr z,L_6EFD		;6eec
	res 7,(hl)		;6eee
	ld hl,0e126h		;6ef0
	ld e,(hl)			;6ef3
	inc hl			;6ef4
	ld d,(hl)			;6ef5
	ex de,hl			;6ef6
	ld de,09840h		;6ef7
	call L_6F0F		;6efa
L_6EFD:
	ld hl,0e141h		;6efd
	bit 7,(hl)		;6f00
	ret z			;6f02
	res 7,(hl)		;6f03
	ld hl,0e159h		;6f05
	ld e,(hl)			;6f08
	inc hl			;6f09
	ld d,(hl)			;6f0a
	ex de,hl			;6f0b
	ld de,09860h		;6f0c
L_6F0F:
	ld a,03fh		;6f0f
	ld (09000h),a		;6f11
	xor a			;6f14
	ld (0988fh),a		;6f15
	ld b,020h		;6f18
L_6F1A:
	ld a,(hl)			;6f1a
	ld (de),a			;6f1b
	inc hl			;6f1c
	inc de			;6f1d
	djnz L_6F1A		;6f1e
	ld hl,0988fh		;6f20
	ld de,0e1fch		;6f23
	ld a,(de)			;6f26
	ld (hl),a			;6f27
	ld a,005h		;6f28
	ld (09000h),a		;6f2a
	ret			;6f2d

; ----------------------------------------------------------------------
; DATOS sonidos: 65 punteros, uno por sonido del 1 al 0x41 (A en p04:603D,
;   tabla en 0x6F2C + 2 x A): su cabecera [canales][prioridad][una palabra por
;   canal]. La entrada 0 serian los dos ultimos bytes del codigo de delante:
;   no hay sonido 0; lo leen p04:605B (130 bytes)
;   0x6f2e..0x6fb0  (130 bytes)
DATA_sonidos:
	defw 06fb0h,06fc2h,06fc6h,06fd8h,06fe6h,06ff4h,07002h,07010h	; 6f2e
	defw 0701eh,0702ch,0703ah,07048h,0705ah,07068h,0707ah,0708ch	; 6f3e
	defw 0709eh,070ach,070bah,070c0h,070c6h,070cch,070d2h,070d8h	; 6f4e
	defw 070deh,070e4h,070eah,070f0h,070f6h,070fch,07102h,07108h	; 6f5e
	defw 0710eh,07114h,0711ah,0712ch,07132h,07138h,0713eh,07144h	; 6f6e
	defw 07156h,07168h,0716eh,07174h,0717ah,07180h,07186h,0718ch	; 6f7e
	defw 0719eh,071a4h,071aah,071b0h,071b6h,071bch,071c2h,071c8h	; 6f8e
	defw 071ceh,071d4h,071e6h,071ech,071f2h,071f8h,071feh,07204h	; 6f9e
	defw 0720ah	; 6fae  -> DATA_cabecera_41

; ----------------------------------------------------------------------
; DATOS cabecera_01: cabecera del sonido 0x01: canales 0xFF, prioridad 0xFE y
;   8 partituras (p04:6068 copia 18 bytes a 0xE1CD); lo leen p04:605B (18
;   bytes)
;   0x6fb0..0x6fc2  (18 bytes)
DATA_cabecera_01:
	defb 0ffh,0feh,05eh,078h,05eh,078h,05eh,078h,05eh,078h,05eh,078h,05eh,078h,05eh,078h,05eh,078h	; 6fb0  ..^x^x^x^x^x^x^x^x

; ----------------------------------------------------------------------
; DATOS cabecera_02: cabecera del sonido 0x02: canales 0x10, prioridad 0xFD y
;   1 partituras (p04:6068 copia 18 bytes a 0xE1CD); lo leen p04:605B (4
;   bytes)
;   0x6fc2..0x6fc6  (4 bytes)
DATA_cabecera_02:
	defb 010h,0fdh,0e9h,0b0h	; 6fc2

; ----------------------------------------------------------------------
; DATOS cabecera_03: cabecera del sonido 0x03: canales 0xFF, prioridad 0xA0 y
;   8 partituras (p04:6068 copia 18 bytes a 0xE1CD); lo leen p04:605B (18
;   bytes)
;   0x6fc6..0x6fd8  (18 bytes)
DATA_cabecera_03:
	defb 0ffh,0a0h,05fh,078h,082h,078h,0b1h,078h,0dfh,078h,00dh,079h,051h,079h,099h,079h,0bbh,079h	; 6fc6  .._x.x.x.x.yQy.y.y

; ----------------------------------------------------------------------
; DATOS cabecera_04: cabecera del sonido 0x04: canales 0xCF, prioridad 0xA0 y
;   6 partituras (p04:6068 copia 18 bytes a 0xE1CD); lo leen p04:605B (14
;   bytes)
;   0x6fd8..0x6fe6  (14 bytes)
DATA_cabecera_04:
	defb 0cfh,0a0h,0dah,079h,0dah,079h,0dah,079h,0dah,079h,0dah,079h,0dah,079h	; 6fd8  ...y.y.y.y.y.y

; ----------------------------------------------------------------------
; DATOS cabecera_05: cabecera del sonido 0x05: canales 0xCF, prioridad 0xA0 y
;   6 partituras (p04:6068 copia 18 bytes a 0xE1CD); lo leen p04:605B (14
;   bytes)
;   0x6fe6..0x6ff4  (14 bytes)
DATA_cabecera_05:
	defb 0cfh,0a0h,0dbh,079h,00dh,07ah,0a4h,07ah,0f0h,07ah,084h,07bh,023h,07ch	; 6fe6  ...y.z.z.z.{#|

; ----------------------------------------------------------------------
; DATOS cabecera_06: cabecera del sonido 0x06: canales 0xCF, prioridad 0xA0 y
;   6 partituras (p04:6068 copia 18 bytes a 0xE1CD); lo leen p04:605B (14
;   bytes)
;   0x6ff4..0x7002  (14 bytes)
DATA_cabecera_06:
	defb 0cfh,0a0h,042h,07dh,098h,07dh,035h,07eh,093h,07eh,058h,07fh,0d7h,07fh	; 6ff4  ..B}.}5~.~X...

; ----------------------------------------------------------------------
; DATOS cabecera_07: cabecera del sonido 0x07: canales 0xCF, prioridad 0xA0 y
;   6 partituras (p04:6068 copia 18 bytes a 0xE1CD); lo leen p04:605B (14
;   bytes)
;   0x7002..0x7010  (14 bytes)
DATA_cabecera_07:
	defb 0cfh,0a0h,0a0h,080h,0d8h,080h,001h,082h,065h,082h,091h,083h,0c3h,084h	; 7002  ........e.....

; ----------------------------------------------------------------------
; DATOS cabecera_08: cabecera del sonido 0x08: canales 0xCF, prioridad 0xA0 y
;   6 partituras (p04:6068 copia 18 bytes a 0xE1CD); lo leen p04:605B (14
;   bytes)
;   0x7010..0x701e  (14 bytes)
DATA_cabecera_08:
	defb 0cfh,0a0h,019h,086h,05bh,086h,0a8h,086h,012h,087h,0dbh,087h,095h,088h	; 7010  ....[.........

; ----------------------------------------------------------------------
; DATOS cabecera_09: cabecera del sonido 0x09: canales 0xCF, prioridad 0xA0 y
;   6 partituras (p04:6068 copia 18 bytes a 0xE1CD); lo leen p04:605B (14
;   bytes)
;   0x701e..0x702c  (14 bytes)
DATA_cabecera_09:
	defb 0cfh,0a0h,06fh,089h,0b7h,089h,067h,08ah,0c2h,08ah,078h,08bh,075h,08ch	; 701e  ..o...g...x.u.

; ----------------------------------------------------------------------
; DATOS cabecera_0A: cabecera del sonido 0x0A: canales 0xCF, prioridad 0xA0 y
;   6 partituras (p04:6068 copia 18 bytes a 0xE1CD); lo leen p04:605B (14
;   bytes)
;   0x702c..0x703a  (14 bytes)
DATA_cabecera_0A:
	defb 0cfh,0a0h,060h,08dh,0e6h,08dh,0e7h,08eh,0bfh,08fh,002h,091h,049h,092h	; 702c  ..`.........I.

; ----------------------------------------------------------------------
; DATOS cabecera_0B: cabecera del sonido 0x0B: canales 0xCF, prioridad 0xA0 y
;   6 partituras (p04:6068 copia 18 bytes a 0xE1CD); lo leen p04:605B (14
;   bytes)
;   0x703a..0x7048  (14 bytes)
DATA_cabecera_0B:
	defb 0cfh,0a0h,072h,093h,094h,093h,0bbh,093h,0e9h,093h,01dh,094h,053h,094h	; 703a  ..r.........S.

; ----------------------------------------------------------------------
; DATOS cabecera_0C: cabecera del sonido 0x0C: canales 0xFF, prioridad 0xA0 y
;   8 partituras (p04:6068 copia 18 bytes a 0xE1CD); lo leen p04:605B (18
;   bytes)
;   0x7048..0x705a  (18 bytes)
DATA_cabecera_0C:
	defb 0ffh,0a0h,092h,094h,0a7h,094h,0d2h,094h,0fdh,094h,027h,095h,05bh,095h,0a3h,095h,0efh,095h	; 7048  ..........'.[.....

; ----------------------------------------------------------------------
; DATOS cabecera_0D: cabecera del sonido 0x0D: canales 0xCF, prioridad 0xA0 y
;   6 partituras (p04:6068 copia 18 bytes a 0xE1CD); lo leen p04:605B (14
;   bytes)
;   0x705a..0x7068  (14 bytes)
DATA_cabecera_0D:
	defb 0cfh,0a0h,023h,096h,082h,096h,029h,097h,0a4h,097h,03eh,098h,084h,098h	; 705a  ..#...)...>...

; ----------------------------------------------------------------------
; DATOS cabecera_0E: cabecera del sonido 0x0E: canales 0xFF, prioridad 0xA0 y
;   8 partituras (p04:6068 copia 18 bytes a 0xE1CD); lo leen p04:605B (18
;   bytes)
;   0x7068..0x707a  (18 bytes)
DATA_cabecera_0E:
	defb 0ffh,0a0h,0c9h,098h,04fh,099h,0c8h,099h,0a2h,09ah,049h,09bh,0dfh,09bh,0e3h,09ch,08fh,09dh	; 7068  ....O.....I.......

; ----------------------------------------------------------------------
; DATOS cabecera_0F: cabecera del sonido 0x0F: canales 0xFF, prioridad 0xA0 y
;   8 partituras (p04:6068 copia 18 bytes a 0xE1CD); lo leen p04:605B (18
;   bytes)
;   0x707a..0x708c  (18 bytes)
DATA_cabecera_0F:
	defb 0ffh,0a0h,0c8h,09fh,0d3h,09fh,0fah,09fh,01fh,0a0h,031h,0a0h,06ah,0a0h,085h,0a0h,0aah,0a0h	; 707a  ..........1.j.....

; ----------------------------------------------------------------------
; DATOS cabecera_10: cabecera del sonido 0x10: canales 0xFF, prioridad 0xA0 y
;   8 partituras (p04:6068 copia 18 bytes a 0xE1CD); lo leen p04:605B (18
;   bytes)
;   0x708c..0x709e  (18 bytes)
DATA_cabecera_10:
	defb 0ffh,0a0h,0cch,0a0h,0d3h,0a0h,0dah,0a0h,0e1h,0a0h,0f5h,0a0h,00ah,0a1h,01fh,0a1h,038h,0a1h	; 708c  ................8.

; ----------------------------------------------------------------------
; DATOS cabecera_11: cabecera del sonido 0x11: canales 0xCF, prioridad 0xA0 y
;   6 partituras (p04:6068 copia 18 bytes a 0xE1CD); lo leen p04:605B (14
;   bytes)
;   0x709e..0x70ac  (14 bytes)
DATA_cabecera_11:
	defb 0cfh,0a0h,049h,0a1h,05eh,0a1h,09dh,0a1h,0c7h,0a1h,007h,0a2h,03ch,0a2h	; 709e  ..I.^.......<.

; ----------------------------------------------------------------------
; DATOS cabecera_12: cabecera del sonido 0x12: canales 0xCF, prioridad 0xA0 y
;   6 partituras (p04:6068 copia 18 bytes a 0xE1CD); lo leen p04:605B (14
;   bytes)
;   0x70ac..0x70ba  (14 bytes)
DATA_cabecera_12:
	defb 0cfh,0a0h,0adh,0a2h,0bfh,0a2h,038h,0a3h,051h,0a3h,0d9h,0a3h,083h,0a4h	; 70ac  ......8.Q.....

; ----------------------------------------------------------------------
; DATOS cabecera_13: cabecera del sonido 0x13: canales 0x30, prioridad 0x05 y
;   2 partituras (p04:6068 copia 18 bytes a 0xE1CD); lo leen p04:605B (6
;   bytes)
;   0x70ba..0x70c0  (6 bytes)
DATA_cabecera_13:
	defb 030h,005h,00eh,0a5h,03dh,0a5h	; 70ba

; ----------------------------------------------------------------------
; DATOS cabecera_14: cabecera del sonido 0x14: canales 0x30, prioridad 0x02 y
;   2 partituras (p04:6068 copia 18 bytes a 0xE1CD); lo leen p04:605B (6
;   bytes)
;   0x70c0..0x70c6  (6 bytes)
DATA_cabecera_14:
	defb 030h,002h,072h,0a5h,088h,0a5h	; 70c0

; ----------------------------------------------------------------------
; DATOS cabecera_15: cabecera del sonido 0x15: canales 0x30, prioridad 0x1B y
;   2 partituras (p04:6068 copia 18 bytes a 0xE1CD); lo leen p04:605B (6
;   bytes)
;   0x70c6..0x70cc  (6 bytes)
DATA_cabecera_15:
	defb 030h,01bh,0a9h,0a5h,0e0h,0a5h	; 70c6

; ----------------------------------------------------------------------
; DATOS cabecera_16: cabecera del sonido 0x16: canales 0x30, prioridad 0x1B y
;   2 partituras (p04:6068 copia 18 bytes a 0xE1CD); lo leen p04:605B (6
;   bytes)
;   0x70cc..0x70d2  (6 bytes)
DATA_cabecera_16:
	defb 030h,01bh,01bh,0a6h,034h,0a6h	; 70cc

; ----------------------------------------------------------------------
; DATOS cabecera_17: cabecera del sonido 0x17: canales 0x30, prioridad 0x1B y
;   2 partituras (p04:6068 copia 18 bytes a 0xE1CD); lo leen p04:605B (6
;   bytes)
;   0x70d2..0x70d8  (6 bytes)
DATA_cabecera_17:
	defb 030h,01bh,04dh,0a6h,084h,0a6h	; 70d2

; ----------------------------------------------------------------------
; DATOS cabecera_18: cabecera del sonido 0x18: canales 0x30, prioridad 0x1B y
;   2 partituras (p04:6068 copia 18 bytes a 0xE1CD); lo leen p04:605B (6
;   bytes)
;   0x70d8..0x70de  (6 bytes)
DATA_cabecera_18:
	defb 030h,01bh,0c1h,0a6h,0e0h,0a6h	; 70d8

; ----------------------------------------------------------------------
; DATOS cabecera_19: cabecera del sonido 0x19: canales 0x30, prioridad 0x38 y
;   2 partituras (p04:6068 copia 18 bytes a 0xE1CD); lo leen p04:605B (6
;   bytes)
;   0x70de..0x70e4  (6 bytes)
DATA_cabecera_19:
	defb 030h,038h,001h,0a7h,04eh,0a7h	; 70de

; ----------------------------------------------------------------------
; DATOS cabecera_1A: cabecera del sonido 0x1A: canales 0x30, prioridad 0x40 y
;   2 partituras (p04:6068 copia 18 bytes a 0xE1CD); lo leen p04:605B (6
;   bytes)
;   0x70e4..0x70ea  (6 bytes)
DATA_cabecera_1A:
	defb 030h,040h,09fh,0a7h,0c6h,0a7h	; 70e4

; ----------------------------------------------------------------------
; DATOS cabecera_1B: cabecera del sonido 0x1B: canales 0x30, prioridad 0x07 y
;   2 partituras (p04:6068 copia 18 bytes a 0xE1CD); lo leen p04:605B (6
;   bytes)
;   0x70ea..0x70f0  (6 bytes)
DATA_cabecera_1B:
	defb 030h,007h,0edh,0a7h,00fh,0a8h	; 70ea

; ----------------------------------------------------------------------
; DATOS cabecera_1C: cabecera del sonido 0x1C: canales 0x30, prioridad 0x07 y
;   2 partituras (p04:6068 copia 18 bytes a 0xE1CD); lo leen p04:605B (6
;   bytes)
;   0x70f0..0x70f6  (6 bytes)
DATA_cabecera_1C:
	defb 030h,007h,050h,0a8h,097h,0a8h	; 70f0

; ----------------------------------------------------------------------
; DATOS cabecera_1D: cabecera del sonido 0x1D: canales 0x30, prioridad 0x18 y
;   2 partituras (p04:6068 copia 18 bytes a 0xE1CD); lo leen p04:605B (6
;   bytes)
;   0x70f6..0x70fc  (6 bytes)
DATA_cabecera_1D:
	defb 030h,018h,0d2h,0a8h,047h,0a9h	; 70f6

; ----------------------------------------------------------------------
; DATOS cabecera_1E: cabecera del sonido 0x1E: canales 0x30, prioridad 0x18 y
;   2 partituras (p04:6068 copia 18 bytes a 0xE1CD); lo leen p04:605B (6
;   bytes)
;   0x70fc..0x7102  (6 bytes)
DATA_cabecera_1E:
	defb 030h,018h,088h,0aah,0b5h,0aah	; 70fc

; ----------------------------------------------------------------------
; DATOS cabecera_1F: cabecera del sonido 0x1F: canales 0x30, prioridad 0x03 y
;   2 partituras (p04:6068 copia 18 bytes a 0xE1CD); lo leen p04:605B (6
;   bytes)
;   0x7102..0x7108  (6 bytes)
DATA_cabecera_1F:
	defb 030h,003h,00ah,0abh,041h,0abh	; 7102

; ----------------------------------------------------------------------
; DATOS cabecera_20: cabecera del sonido 0x20: canales 0x30, prioridad 0xFD y
;   2 partituras (p04:6068 copia 18 bytes a 0xE1CD); lo leen p04:605B (6
;   bytes)
;   0x7108..0x710e  (6 bytes)
DATA_cabecera_20:
	defb 030h,0fdh,078h,0abh,09bh,0abh	; 7108

; ----------------------------------------------------------------------
; DATOS cabecera_21: cabecera del sonido 0x21: canales 0x30, prioridad 0x10 y
;   2 partituras (p04:6068 copia 18 bytes a 0xE1CD); lo leen p04:605B (6
;   bytes)
;   0x710e..0x7114  (6 bytes)
DATA_cabecera_21:
	defb 030h,010h,0ceh,0a9h,029h,0aah	; 710e

; ----------------------------------------------------------------------
; DATOS cabecera_22: cabecera del sonido 0x22: canales 0x30, prioridad 0x10 y
;   2 partituras (p04:6068 copia 18 bytes a 0xE1CD); lo leen p04:605B (6
;   bytes)
;   0x7114..0x711a  (6 bytes)
DATA_cabecera_22:
	defb 030h,010h,034h,0ach,08fh,0ach	; 7114

; ----------------------------------------------------------------------
; DATOS cabecera_23: cabecera del sonido 0x23: canales 0xFF, prioridad 0xA0 y
;   8 partituras (p04:6068 copia 18 bytes a 0xE1CD); lo leen p04:605B (18
;   bytes)
;   0x711a..0x712c  (18 bytes)
DATA_cabecera_23:
	defb 0ffh,0a0h,088h,094h,09dh,094h,0c6h,094h,0e4h,094h,00fh,095h,043h,095h,087h,095h,0dbh,095h	; 711a  ............C.....

; ----------------------------------------------------------------------
; DATOS cabecera_24: cabecera del sonido 0x24: canales 0x30, prioridad 0x10 y
;   2 partituras (p04:6068 copia 18 bytes a 0xE1CD); lo leen p04:605B (6
;   bytes)
;   0x712c..0x7132  (6 bytes)
DATA_cabecera_24:
	defb 030h,010h,0c2h,0abh,0f9h,0abh	; 712c

; ----------------------------------------------------------------------
; DATOS cabecera_25: cabecera del sonido 0x25: canales 0x30, prioridad 0x10 y
;   2 partituras (p04:6068 copia 18 bytes a 0xE1CD); lo leen p04:605B (6
;   bytes)
;   0x7132..0x7138  (6 bytes)
DATA_cabecera_25:
	defb 030h,010h,034h,0ach,08fh,0ach	; 7132

; ----------------------------------------------------------------------
; DATOS cabecera_26: cabecera del sonido 0x26: canales 0x30, prioridad 0x39 y
;   2 partituras (p04:6068 copia 18 bytes a 0xE1CD); lo leen p04:605B (6
;   bytes)
;   0x7138..0x713e  (6 bytes)
DATA_cabecera_26:
	defb 030h,039h,0eah,0ach,051h,0adh	; 7138

; ----------------------------------------------------------------------
; DATOS cabecera_27: cabecera del sonido 0x27: canales 0x30, prioridad 0x40 y
;   2 partituras (p04:6068 copia 18 bytes a 0xE1CD); lo leen p04:605B (6
;   bytes)
;   0x713e..0x7144  (6 bytes)
DATA_cabecera_27:
	defb 030h,040h,0beh,0adh,0f7h,0adh	; 713e

; ----------------------------------------------------------------------
; DATOS cabecera_28: cabecera del sonido 0x28: canales 0xFF, prioridad 0xA0 y
;   8 partituras (p04:6068 copia 18 bytes a 0xE1CD); lo leen p04:605B (18
;   bytes)
;   0x7144..0x7156  (18 bytes)
DATA_cabecera_28:
	defb 0ffh,0a0h,034h,0aeh,067h,0aeh,09ah,0aeh,0d3h,0aeh,008h,0afh,03fh,0afh,07ah,0afh,0afh,0afh	; 7144  ..4.g.......?.z...

; ----------------------------------------------------------------------
; DATOS cabecera_29: cabecera del sonido 0x29: canales 0xFF, prioridad 0xA0 y
;   8 partituras (p04:6068 copia 18 bytes a 0xE1CD); lo leen p04:605B (18
;   bytes)
;   0x7156..0x7168  (18 bytes)
DATA_cabecera_29:
	defb 0ffh,0a0h,0e8h,0afh,019h,0b0h,04ah,0b0h,05ah,0b0h,06ch,0b0h,076h,0b0h,082h,0b0h,0b3h,0b0h	; 7156  ......J.Z.l.v.....

; ----------------------------------------------------------------------
; DATOS cabecera_2A: cabecera del sonido 0x2A: canales 0x30, prioridad 0x80 y
;   2 partituras (p04:6068 copia 18 bytes a 0xE1CD); lo leen p04:605B (6
;   bytes)
;   0x7168..0x716e  (6 bytes)
DATA_cabecera_2A:
	defb 030h,080h,0ffh,0b0h,044h,0b1h	; 7168

; ----------------------------------------------------------------------
; DATOS cabecera_2B: cabecera del sonido 0x2B: canales 0x30, prioridad 0x01 y
;   2 partituras (p04:6068 copia 18 bytes a 0xE1CD); lo leen p04:605B (6
;   bytes)
;   0x716e..0x7174  (6 bytes)
DATA_cabecera_2B:
	defb 030h,001h,08bh,0b1h,0a6h,0b1h	; 716e

; ----------------------------------------------------------------------
; DATOS cabecera_2C: cabecera del sonido 0x2C: canales 0x30, prioridad 0x02 y
;   2 partituras (p04:6068 copia 18 bytes a 0xE1CD); lo leen p04:605B (6
;   bytes)
;   0x7174..0x717a  (6 bytes)
DATA_cabecera_2C:
	defb 030h,002h,0bfh,0b1h,012h,0b2h	; 7174

; ----------------------------------------------------------------------
; DATOS cabecera_2D: cabecera del sonido 0x2D: canales 0x30, prioridad 0x39 y
;   2 partituras (p04:6068 copia 18 bytes a 0xE1CD); lo leen p04:605B (6
;   bytes)
;   0x717a..0x7180  (6 bytes)
DATA_cabecera_2D:
	defb 030h,039h,065h,0b2h,0c4h,0b2h	; 717a

; ----------------------------------------------------------------------
; DATOS cabecera_2E: cabecera del sonido 0x2E: canales 0x30, prioridad 0x40 y
;   2 partituras (p04:6068 copia 18 bytes a 0xE1CD); lo leen p04:605B (6
;   bytes)
;   0x7180..0x7186  (6 bytes)
DATA_cabecera_2E:
	defb 030h,040h,025h,0b3h,066h,0b3h	; 7180

; ----------------------------------------------------------------------
; DATOS cabecera_2F: cabecera del sonido 0x2F: canales 0x30, prioridad 0x40 y
;   2 partituras (p04:6068 copia 18 bytes a 0xE1CD); lo leen p04:605B (6
;   bytes)
;   0x7186..0x718c  (6 bytes)
DATA_cabecera_2F:
	defb 030h,040h,0abh,0b3h,0abh,0b3h	; 7186

; ----------------------------------------------------------------------
; DATOS cabecera_30: cabecera del sonido 0x30: canales 0xFF, prioridad 0xA0 y
;   8 partituras (p04:6068 copia 18 bytes a 0xE1CD); lo leen p04:605B (18
;   bytes)
;   0x718c..0x719e  (18 bytes)
DATA_cabecera_30:
	defb 0ffh,0a0h,0ach,0b3h,0b4h,0b3h,0c0h,0b3h,0cah,0b3h,0d6h,0b3h,0e4h,0b3h,0f0h,0b3h,0fch,0b3h	; 718c  ..................

; ----------------------------------------------------------------------
; DATOS cabecera_31: cabecera del sonido 0x31: canales 0x30, prioridad 0x10 y
;   2 partituras (p04:6068 copia 18 bytes a 0xE1CD); lo leen p04:605B (6
;   bytes)
;   0x719e..0x71a4  (6 bytes)
DATA_cabecera_31:
	defb 030h,010h,088h,0aah,0b5h,0aah	; 719e

; ----------------------------------------------------------------------
; DATOS cabecera_32: cabecera del sonido 0x32: canales 0x30, prioridad 0x10 y
;   2 partituras (p04:6068 copia 18 bytes a 0xE1CD); lo leen p04:605B (6
;   bytes)
;   0x71a4..0x71aa  (6 bytes)
DATA_cabecera_32:
	defb 030h,010h,0a2h,0b4h,0d1h,0b4h	; 71a4

; ----------------------------------------------------------------------
; DATOS cabecera_33: cabecera del sonido 0x33: canales 0x30, prioridad 0x11 y
;   2 partituras (p04:6068 copia 18 bytes a 0xE1CD); lo leen p04:605B (6
;   bytes)
;   0x71aa..0x71b0  (6 bytes)
DATA_cabecera_33:
	defb 030h,011h,0feh,0b4h,0feh,0b4h	; 71aa

; ----------------------------------------------------------------------
; DATOS cabecera_34: cabecera del sonido 0x34: canales 0x30, prioridad 0x02 y
;   2 partituras (p04:6068 copia 18 bytes a 0xE1CD); lo leen p04:605B (6
;   bytes)
;   0x71b0..0x71b6  (6 bytes)
DATA_cabecera_34:
	defb 030h,002h,0ffh,0b4h,0ffh,0b4h	; 71b0

; ----------------------------------------------------------------------
; DATOS cabecera_35: cabecera del sonido 0x35: canales 0x30, prioridad 0x39 y
;   2 partituras (p04:6068 copia 18 bytes a 0xE1CD); lo leen p04:605B (6
;   bytes)
;   0x71b6..0x71bc  (6 bytes)
DATA_cabecera_35:
	defb 030h,039h,000h,0b5h,01dh,0b5h	; 71b6

; ----------------------------------------------------------------------
; DATOS cabecera_36: cabecera del sonido 0x36: canales 0x30, prioridad 0x08 y
;   2 partituras (p04:6068 copia 18 bytes a 0xE1CD); lo leen p04:605B (6
;   bytes)
;   0x71bc..0x71c2  (6 bytes)
DATA_cabecera_36:
	defb 030h,008h,030h,0b5h,051h,0b5h	; 71bc

; ----------------------------------------------------------------------
; DATOS cabecera_37: cabecera del sonido 0x37: canales 0x30, prioridad 0x10 y
;   2 partituras (p04:6068 copia 18 bytes a 0xE1CD); lo leen p04:605B (6
;   bytes)
;   0x71c2..0x71c8  (6 bytes)
DATA_cabecera_37:
	defb 030h,010h,06ah,0b5h,099h,0b5h	; 71c2

; ----------------------------------------------------------------------
; DATOS cabecera_38: cabecera del sonido 0x38: canales 0x30, prioridad 0x02 y
;   2 partituras (p04:6068 copia 18 bytes a 0xE1CD); lo leen p04:605B (6
;   bytes)
;   0x71c8..0x71ce  (6 bytes)
DATA_cabecera_38:
	defb 030h,002h,0c8h,0b5h,0e9h,0b5h	; 71c8

; ----------------------------------------------------------------------
; DATOS cabecera_39: cabecera del sonido 0x39: canales 0x30, prioridad 0x10 y
;   2 partituras (p04:6068 copia 18 bytes a 0xE1CD); lo leen p04:605B (6
;   bytes)
;   0x71ce..0x71d4  (6 bytes)
DATA_cabecera_39:
	defb 030h,010h,00ch,0b6h,061h,0b6h	; 71ce

; ----------------------------------------------------------------------
; DATOS cabecera_3A: cabecera del sonido 0x3A: canales 0xFF, prioridad 0xA0 y
;   8 partituras (p04:6068 copia 18 bytes a 0xE1CD); lo leen p04:605B (18
;   bytes)
;   0x71d4..0x71e6  (18 bytes)
DATA_cabecera_3A:
	defb 0ffh,0a0h,0b4h,0b6h,0fdh,0b6h,046h,0b7h,0d1h,0b7h,06ch,0b8h,007h,0b9h,092h,0b9h,019h,0bah	; 71d4  ......F...l.......

; ----------------------------------------------------------------------
; DATOS cabecera_3B: cabecera del sonido 0x3B: canales 0x30, prioridad 0x40 y
;   2 partituras (p04:6068 copia 18 bytes a 0xE1CD); lo leen p04:605B (6
;   bytes)
;   0x71e6..0x71ec  (6 bytes)
DATA_cabecera_3B:
	defb 030h,040h,0a0h,0bah,0c7h,0bah	; 71e6

; ----------------------------------------------------------------------
; DATOS cabecera_3C: cabecera del sonido 0x3C: canales 0x30, prioridad 0x02 y
;   2 partituras (p04:6068 copia 18 bytes a 0xE1CD); lo leen p04:605B (6
;   bytes)
;   0x71ec..0x71f2  (6 bytes)
DATA_cabecera_3C:
	defb 030h,002h,0ech,0bah,03fh,0bbh	; 71ec

; ----------------------------------------------------------------------
; DATOS cabecera_3D: cabecera del sonido 0x3D: canales 0x30, prioridad 0x10 y
;   2 partituras (p04:6068 copia 18 bytes a 0xE1CD); lo leen p04:605B (6
;   bytes)
;   0x71f2..0x71f8  (6 bytes)
DATA_cabecera_3D:
	defb 030h,010h,092h,0bbh,0cdh,0bbh	; 71f2

; ----------------------------------------------------------------------
; DATOS cabecera_3E: cabecera del sonido 0x3E: canales 0x30, prioridad 0x10 y
;   2 partituras (p04:6068 copia 18 bytes a 0xE1CD); lo leen p04:605B (6
;   bytes)
;   0x71f8..0x71fe  (6 bytes)
DATA_cabecera_3E:
	defb 030h,010h,0feh,0bbh,06bh,0bch	; 71f8

; ----------------------------------------------------------------------
; DATOS cabecera_3F: cabecera del sonido 0x3F: canales 0x30, prioridad 0x10 y
;   2 partituras (p04:6068 copia 18 bytes a 0xE1CD); lo leen p04:605B (6
;   bytes)
;   0x71fe..0x7204  (6 bytes)
DATA_cabecera_3F:
	defb 030h,010h,0dah,0bch,0dbh,0bch	; 71fe

; ----------------------------------------------------------------------
; DATOS cabecera_40: cabecera del sonido 0x40: canales 0x30, prioridad 0x40 y
;   2 partituras (p04:6068 copia 18 bytes a 0xE1CD); lo leen p04:605B (6
;   bytes)
;   0x7204..0x720a  (6 bytes)
DATA_cabecera_40:
	defb 030h,040h,0dch,0bch,019h,0bdh	; 7204

; ----------------------------------------------------------------------
; DATOS cabecera_41: cabecera del sonido 0x41: canales 0x30, prioridad 0x18 y
;   2 partituras (p04:6068 copia 18 bytes a 0xE1CD); lo leen p04:605B (6
;   bytes)
;   0x720a..0x7210  (6 bytes)
DATA_cabecera_41:
	defb 030h,018h,05ah,0bdh,079h,0bdh	; 720a

; ----------------------------------------------------------------------
; DATOS ondas: 72 punteros a las formas de onda del SCC (orden 0xF8 de la
;   partitura, p04:6A66: 0x7210 + 2 x n); los 46 primeros apuntan a las de
;   detras, los 26 ultimos a 0x76A0, la tabla de golpes; lo leen p04:6A6F (144
;   bytes)
;   0x7210..0x72a0  (144 bytes)
DATA_ondas:
	defw 072a0h,072a0h,072a0h,072c0h,072e0h,07300h,07320h,07340h	; 7210
	defw 07360h,07360h,07380h,073a0h,073c0h,073e0h,07400h,07400h	; 7220
	defw 07400h,07400h,07420h,07440h,07460h,07480h,074a0h,074c0h	; 7230
	defw 074e0h,07500h,07500h,07520h,07540h,07560h,07580h,07580h	; 7240
	defw 07580h,075a0h,075c0h,075c0h,075e0h,075e0h,07600h,07620h	; 7250
	defw 07620h,07640h,07660h,07680h,07680h,07680h,076a0h,076a0h	; 7260
	defw 076a0h,076a0h,076a0h,076a0h,076a0h,076a0h,076a0h,076a0h	; 7270
	defw 076a0h,076a0h,076a0h,076a0h,076a0h,076a0h,076a0h,076a0h	; 7280
	defw 076a0h,076a0h,076a0h,076a0h,076a0h,076a0h,076a0h,076a0h	; 7290

; ----------------------------------------------------------------------
; DATOS ondas_72A0: 32 formas de onda del SCC de 32 muestras con signo, que
;   empiezan en 0x72A0, 0x72C0, 0x72E0, 0x7300, 0x7320, 0x7340, 0x7360,
;   0x7380, 0x73A0, 0x73C0, 0x73E0, 0x7400, 0x7420, 0x7440, 0x7460, 0x7480,
;   0x74A0, 0x74C0, 0x74E0, 0x7500, 0x7520, 0x7540, 0x7560, 0x7580, 0x75A0,
;   0x75C0, 0x75E0, 0x7600, 0x7620, 0x7640, 0x7660, 0x7680; ninguna partitura
;   pide 0x7420, 0x7600, 0x7640; lo leen p04:6A6F (1024 bytes)
;   0x72a0..0x76a0  (1024 bytes)
DATA_ondas_72A0:
	defb 000h,0f8h,0f0h,0e8h,0e0h,0d8h,0d0h,0c8h,0c0h,0b8h,0b0h,0a8h,0a0h,098h,090h,088h	; 72a0  ................
	defb 080h,078h,070h,068h,060h,058h,050h,048h,040h,038h,030h,028h,020h,018h,010h,008h	; 72b0  .xph`XPH@80( ...
	defb 000h,0f0h,0e0h,0d0h,0c0h,0b0h,0a0h,090h,080h,070h,060h,050h,040h,030h,020h,010h	; 72c0  .........p`P@0 .
	defb 000h,0f0h,0e0h,0d0h,0c0h,0b0h,0a0h,090h,080h,070h,060h,050h,040h,030h,020h,010h	; 72d0  .........p`P@0 .
	defb 000h,04eh,062h,06dh,075h,07ah,07dh,07eh,07fh,07eh,07dh,07ah,075h,06dh,062h,04eh	; 72e0  .Nbmuz}~.~}zumbN
	defb 000h,0b1h,09dh,092h,08ah,085h,082h,081h,080h,081h,082h,085h,08ah,092h,09dh,0b1h	; 72f0  ................
	defb 000h,019h,031h,047h,05ah,06ah,075h,07dh,07fh,07dh,075h,06ah,05ah,047h,031h,019h	; 7300  ..1GZju}.}ujZG1.
	defb 000h,0e7h,0cfh,0b9h,0a6h,096h,08bh,083h,080h,083h,08bh,096h,0a6h,0b9h,0cfh,0e7h	; 7310  ................
	defb 000h,0f0h,0e0h,0d0h,0c0h,0b0h,0a0h,090h,080h,090h,0a0h,0b0h,0c0h,0d0h,0e0h,0f0h	; 7320  ................
	defb 000h,010h,020h,030h,040h,050h,060h,070h,07fh,070h,060h,050h,040h,030h,020h,010h	; 7330  .. 0@P`p.p`P@0 .
	defb 000h,0e0h,0c0h,0a0h,080h,0a0h,0c0h,0e0h,000h,020h,040h,060h,07fh,060h,040h,020h	; 7340  ......... @`.`@
	defb 000h,0e0h,0c0h,0a0h,080h,0a0h,0c0h,0e0h,000h,020h,040h,060h,07fh,060h,040h,020h	; 7350  ......... @`.`@
	defb 000h,019h,031h,047h,05ah,06ah,075h,07dh,07fh,07dh,075h,06ah,05ah,047h,031h,019h	; 7360  ..1GZju}.}ujZG1.
	defb 000h,0e0h,0c0h,0a0h,080h,0a0h,0c0h,0e0h,000h,020h,040h,060h,07fh,060h,040h,020h	; 7370  ......... @`.`@
	defb 000h,019h,031h,047h,05ah,06ah,075h,07dh,07fh,07dh,075h,06ah,05ah,047h,031h,019h	; 7380  ..1GZju}.}ujZG1.
	defb 080h,090h,0a0h,0b0h,0c0h,0d0h,0e0h,0f0h,000h,010h,020h,030h,040h,050h,060h,070h	; 7390  .......... 0@P`p
	defb 000h,019h,031h,047h,05ah,06ah,075h,07dh,07fh,07dh,075h,06ah,05ah,047h,031h,019h	; 73a0  ..1GZju}.}ujZG1.
	defb 080h,0a0h,0c0h,0e0h,000h,020h,040h,060h,080h,0a0h,0c0h,0e0h,000h,020h,040h,060h	; 73b0  ..... @`..... @`
	defb 001h,02ah,040h,050h,05ch,068h,070h,078h,07fh,078h,070h,068h,05ch,050h,040h,02ah	; 73c0  .*@P\hpx.xph\P@*
	defb 0ffh,0d6h,0c0h,0b0h,0a4h,098h,090h,088h,081h,088h,090h,098h,0a4h,0b0h,0c0h,0d6h	; 73d0  ................
	defb 000h,040h,07fh,040h,001h,0c0h,081h,0c0h,001h,040h,07fh,040h,001h,0c0h,001h,040h	; 73e0  .@.@.....@.@...@
	defb 001h,0e0h,001h,020h,001h,0f0h,001h,010h,001h,0ffh,0ffh,0ffh,0ffh,040h,040h,040h	; 73f0  ... .........@@@
	defb 000h,040h,07fh,040h,010h,001h,0eah,0d6h,0c3h,0b9h,0afh,0a4h,09ch,095h,08fh,08ah	; 7400  .@.@............
	defb 086h,083h,081h,083h,086h,08ah,08fh,095h,09ch,0a4h,0afh,0b9h,0c3h,0d6h,0eah,0ffh	; 7410  ................
	defb 000h,040h,07fh,040h,000h,0c0h,0ffh,0c0h,005h,0ebh,0d6h,0c3h,0b9h,0afh,0a4h,09ch	; 7420  .@.@............
	defb 095h,08fh,089h,084h,081h,084h,089h,08fh,095h,09ch,0a4h,0afh,0b9h,0c3h,0d6h,0eah	; 7430  ................
	defb 000h,0f0h,0e0h,0d0h,0c0h,0b0h,0a0h,090h,080h,080h,080h,080h,080h,080h,080h,080h	; 7440  ................
	defb 080h,080h,080h,080h,080h,080h,080h,080h,07fh,070h,060h,050h,040h,030h,020h,010h	; 7450  .........p`P@0 .
	defb 000h,030h,050h,060h,070h,060h,050h,030h,000h,0d0h,0b0h,0a0h,090h,0a0h,0b0h,0d0h	; 7460  .0P`p`P0........
	defb 000h,040h,060h,070h,060h,040h,000h,0c0h,0a0h,090h,0a0h,0c0h,000h,070h,000h,090h	; 7470  .@`p`@.......p..
	defb 030h,050h,050h,030h,000h,000h,010h,040h,060h,070h,060h,030h,0f0h,0e0h,0e0h,000h	; 7480  0PP0...@`p`0....
	defb 020h,020h,010h,0c0h,0a0h,090h,0a0h,0c0h,000h,000h,0d0h,0b0h,0b0h,0d0h,000h,000h	; 7490    ..............
	defb 0a0h,090h,090h,0a0h,0a0h,0b0h,0b0h,0b0h,0c0h,0c0h,0d0h,0d0h,0e0h,0e0h,0f0h,0f0h	; 74a0  ................
	defb 000h,000h,010h,010h,020h,020h,030h,030h,040h,040h,050h,050h,060h,060h,060h,050h	; 74b0  ....  00@@PP```P
	defb 000h,07fh,000h,080h,0a0h,0c0h,0d8h,0f0h,008h,020h,030h,040h,050h,060h,070h,078h	; 74c0  ......... 0@P`px
	defb 07ch,07fh,07ch,078h,070h,060h,050h,040h,030h,020h,008h,0f0h,0d8h,0c0h,0a0h,080h	; 74d0  |.|xp`P@0 ......
	defb 07fh,080h,07fh,080h,07fh,080h,07fh,080h,07fh,080h,07fh,080h,07fh,080h,07fh,080h	; 74e0  ................
	defb 07fh,080h,07fh,080h,07fh,080h,07fh,080h,07fh,080h,07fh,080h,07fh,080h,07fh,080h	; 74f0  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,07fh,080h,07fh,080h,07fh,080h,07fh,080h	; 7500  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 7510  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,07fh,080h,07fh,080h,07fh,080h,07fh,080h	; 7520  ................
	defb 07fh,080h,07fh,080h,07fh,080h,07fh,080h,000h,000h,000h,000h,000h,000h,000h,000h	; 7530  ................
	defb 080h,08eh,0a0h,0c0h,0e0h,000h,020h,03fh,03eh,03ch,03ah,037h,031h,029h,020h,01ch	; 7540  ...... ?><:71) .
	defb 010h,000h,0e6h,0c0h,0d0h,000h,020h,03fh,010h,0e0h,080h,0c0h,000h,020h,000h,090h	; 7550  ...... ?..... ..
	defb 000h,070h,050h,020h,050h,070h,030h,000h,050h,07fh,060h,010h,030h,040h,000h,0b0h	; 7560  .pP Pp0.P.`.0@..
	defb 010h,060h,000h,0e0h,0f0h,000h,0b0h,090h,0c0h,010h,0e0h,0a0h,0c0h,0f0h,0c0h,0a0h	; 7570  .`..............
	defb 000h,000h,000h,000h,000h,078h,078h,000h,000h,080h,080h,080h,000h,000h,000h,000h	; 7580  .....xx.........
	defb 078h,078h,078h,000h,080h,080h,000h,000h,000h,000h,078h,078h,000h,000h,080h,080h	; 7590  xxx.......xx....
	defb 078h,078h,078h,078h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h	; 75a0  xxxx............
	defb 080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h,080h	; 75b0  ................
	defb 080h,0b0h,0c0h,010h,01ah,02ah,02ch,01ah,000h,0e0h,0d0h,0e0h,022h,053h,070h,075h	; 75c0  .....*,....."Spu
	defb 070h,031h,0eah,080h,088h,08ah,08ch,08eh,000h,07fh,075h,073h,062h,000h,0c0h,090h	; 75d0  p1........usb...
	defb 000h,000h,000h,000h,000h,070h,070h,000h,000h,080h,080h,080h,000h,000h,000h,000h	; 75e0  .....pp.........
	defb 070h,070h,070h,000h,080h,080h,000h,000h,000h,000h,070h,070h,000h,000h,080h,080h	; 75f0  ppp.......pp....
	defb 000h,000h,000h,080h,000h,070h,070h,070h,000h,000h,000h,080h,000h,000h,000h,080h	; 7600  .....ppp........
	defb 080h,080h,080h,000h,080h,000h,000h,000h,000h,080h,080h,080h,000h,080h,080h,080h	; 7610  ................
	defb 070h,070h,070h,070h,070h,070h,070h,070h,080h,080h,080h,080h,080h,080h,080h,080h	; 7620  pppppppp........
	defb 070h,070h,070h,080h,080h,080h,070h,070h,070h,070h,080h,080h,080h,080h,080h,080h	; 7630  ppp...pppp......
	defb 0a0h,090h,090h,090h,0a0h,0a0h,0b0h,0b0h,0c0h,0c0h,0d0h,0d0h,0e0h,0e0h,0f0h,0f0h	; 7640  ................
	defb 000h,000h,010h,010h,020h,020h,030h,030h,040h,040h,050h,050h,060h,060h,060h,050h	; 7650  ....  00@@PP```P
	defb 070h,070h,060h,080h,090h,090h,080h,080h,040h,040h,030h,080h,090h,090h,080h,080h	; 7660  pp`.....@@0.....
	defb 020h,020h,010h,080h,090h,090h,080h,080h,000h,000h,0f0h,080h,090h,090h,080h,080h	; 7670    ..............
	defb 078h,070h,068h,060h,058h,050h,048h,040h,038h,030h,028h,020h,018h,010h,008h,000h	; 7680  xph`XPH@80( ....
	defb 078h,070h,068h,060h,058h,050h,048h,040h,038h,030h,028h,020h,018h,010h,008h,000h	; 7690  xph`XPH@80( ....

; ----------------------------------------------------------------------
; DATOS golpes_76A0: 12 punteros a los guiones de bateria del modo con el bit
;   2 y la octava distinta de 1 (p04:653D; la cifra alta de la nota elige
;   uno); lo leen p04:6517 (24 bytes)
;   0x76a0..0x76b8  (24 bytes)
DATA_golpes_76A0:
	defw 076b8h,076bfh,076cch,076e1h,076fah,07712h,0772bh,07744h	; 76a0
	defw 0775fh,0777ch,0778bh,077a6h	; 76b0

; ----------------------------------------------------------------------
; DATOS partitura_76B8: partitura (p04:63E2: ordenes 0xD0-0xFF y notas) de
;   golpe 0 de 0x76A0, golpe 1 de 0x76A0, golpe 10 de 0x76A0, golpe 11 de
;   0x76A0, golpe 2 de 0x76A0, golpe 3 de 0x76A0 y otros; lo leen p04:63E2
;   (297 bytes)
;   0x76b8..0x77e1  (297 bytes)
DATA_partitura_76B8:
	defb 0e1h,001h,0e4h,000h,007h,005h,0ffh,0e3h,001h,0e4h,000h,08ah,000h,0e1h,004h,006h	; 76b8  ................
	defb 005h,004h,003h,0ffh,0e1h,001h,0e4h,014h,007h,0e2h,001h,072h,000h,0e1h,002h,0e4h	; 76c8  ...........r....
	defb 010h,003h,002h,0e1h,001h,0e4h,006h,002h,0ffh,0e2h,001h,0e5h,00ah,000h,042h,0c1h	; 76d8  ..............B.
	defb 0b0h,0e8h,0e1h,001h,0e4h,008h,008h,007h,006h,005h,004h,003h,002h,002h,001h,001h	; 76e8  ................
	defb 000h,0ffh,0e2h,002h,0e5h,009h,000h,0d0h,0a2h,080h,0e1h,002h,0e4h,007h,006h,0e1h	; 76f8  ................
	defb 001h,0e4h,003h,005h,004h,003h,002h,001h,000h,0ffh,0e2h,001h,0a1h,02ah,091h,04ah	; 7708  .............*.J
	defb 081h,055h,071h,060h,061h,06ah,051h,075h,041h,080h,031h,08ah,021h,095h,011h,0a0h	; 7718  .Uq`ajQuA.1.!...
	defb 001h,0b0h,0ffh,0e2h,001h,0b1h,05ah,091h,080h,081h,08ah,071h,095h,061h,0a0h,051h	; 7728  ......Z....q.a.Q
	defb 0aah,041h,0b5h,031h,0c0h,021h,0cah,011h,0d5h,001h,0e0h,0ffh,0e2h,001h,0b1h,095h	; 7738  .A.1.!..........
	defb 0a1h,0c0h,091h,0cah,0b1h,0d5h,071h,0e0h,061h,0eah,051h,0f5h,042h,000h,032h,00ah	; 7748  ......q.a.Q.B.2.
	defb 022h,015h,012h,020h,002h,030h,0ffh,0e2h,001h,0c1h,0e0h,0b2h,010h,0a2h,01ah,092h	; 7758  ".. .0..........
	defb 025h,082h,030h,072h,03ah,062h,045h,052h,050h,042h,05ah,032h,065h,022h,070h,012h	; 7768  %.0r:bERPBZ2e"p.
	defb 07ah,002h,085h,0ffh,0e2h,001h,0e5h,009h,001h,0a0h,094h,050h,096h,000h,097h,000h	; 7778  z..........P....
	defb 098h,000h,0ffh,0e3h,001h,0e4h,00fh,0e5h,009h,000h,0b0h,001h,060h,0e8h,0e3h,002h	; 7788  ............`...
	defb 0e4h,000h,0b0h,000h,050h,007h,0e1h,001h,005h,004h,003h,002h,001h,0ffh,0e0h,001h	; 7798  ....P...........
	defb 0e3h,001h,0e4h,00fh,0e5h,003h,000h,0a0h,001h,060h,0e8h,0e3h,002h,0e4h,000h,0b0h	; 77a8  .........`......
	defb 000h,050h,007h,0e1h,001h,005h,004h,003h,002h,0e3h,002h,060h,000h,030h,007h,0e1h	; 77b8  .P.........`.0..
	defb 001h,003h,002h,001h,001h,0e3h,002h,040h,000h,020h,007h,0e1h,002h,002h,001h,0e3h	; 77c8  .......@. ......
	defb 002h,020h,000h,010h,007h,0e1h,004h,001h,0ffh	; 77d8  . .......

; ----------------------------------------------------------------------
; DATOS golpes_77E1: 12 punteros a los guiones de bateria del modo con el bit
;   2 y la octava 1 (p04:653D; la cifra alta de la nota elige uno); lo leen
;   p04:6517 (24 bytes)
;   0x77e1..0x77f9  (24 bytes)
DATA_golpes_77E1:
	defw 077f9h,077f9h,077f9h,077f9h,077f9h,077f9h,077f9h,077f9h	; 77e1
	defw 077f9h,077f9h,077f9h,077f9h	; 77f1  -> DATA_partitura_77F9 DATA_partitura_77F9 DATA_partitura_77F9 DATA_partitura_77F9

; ----------------------------------------------------------------------
; DATOS partitura_77F9: partitura (p04:63E2: ordenes 0xD0-0xFF y notas) de
;   golpe 0 de 0x77E1; lo leen p04:63E2 (1 bytes)
;   0x77f9..0x77fa  (1 bytes)
DATA_partitura_77F9:
	defb 0ffh	; 77f9

; ----------------------------------------------------------------------
; DATOS golpes_77FA: 12 punteros a los guiones de bateria del modo con el bit
;   3 y la octava distinta de 1 (p04:653D; la cifra alta de la nota elige
;   uno); lo leen p04:6517 (24 bytes)
;   0x77fa..0x7812  (24 bytes)
DATA_golpes_77FA:
	defw 07812h,07812h,07812h,07812h,07812h,07812h,07812h,07812h	; 77fa
	defw 07812h,07812h,07812h,07812h	; 780a  -> DATA_partitura_7812 DATA_partitura_7812 DATA_partitura_7812 DATA_partitura_7812

; ----------------------------------------------------------------------
; DATOS partitura_7812: partitura (p04:63E2: ordenes 0xD0-0xFF y notas) de
;   golpe 0 de 0x77FA; lo leen p04:63E2 (1 bytes)
;   0x7812..0x7813  (1 bytes)
DATA_partitura_7812:
	defb 0ffh	; 7812

; ----------------------------------------------------------------------
; DATOS golpes_7813: 12 punteros a los guiones de bateria del modo con el bit
;   3 y la octava 1 (p04:653D; la cifra alta de la nota elige uno); lo leen
;   p04:6517 (24 bytes)
;   0x7813..0x782b  (24 bytes)
DATA_golpes_7813:
	defw 0782bh,0782bh,0782bh,0782bh,0782bh,0782bh,0782bh,0782bh	; 7813
	defw 0782bh,0782bh,0782bh,0782bh	; 7823  -> DATA_partitura_782B DATA_partitura_782B DATA_partitura_782B DATA_partitura_782B

; ----------------------------------------------------------------------
; DATOS partitura_782B: partitura (p04:63E2: ordenes 0xD0-0xFF y notas) de
;   golpe 0 de 0x7813; lo leen p04:63E2 (1 bytes)
;   0x782b..0x782c  (1 bytes)
DATA_partitura_782B:
	defb 0ffh	; 782b

; ----------------------------------------------------------------------
; DATOS golpes_782C: 12 punteros a los guiones de bateria del modo con el bit
;   4 y la octava distinta de 1 (p04:653D; la cifra alta de la nota elige
;   uno); lo leen p04:6517 (24 bytes)
;   0x782c..0x7844  (24 bytes)
DATA_golpes_782C:
	defw 07844h,07844h,07844h,07844h,07844h,07844h,07844h,07844h	; 782c
	defw 07844h,07844h,07844h,07844h	; 783c  -> DATA_partitura_7844 DATA_partitura_7844 DATA_partitura_7844 DATA_partitura_7844

; ----------------------------------------------------------------------
; DATOS partitura_7844: partitura (p04:63E2: ordenes 0xD0-0xFF y notas) de
;   golpe 0 de 0x782C; lo leen p04:63E2 (1 bytes)
;   0x7844..0x7845  (1 bytes)
DATA_partitura_7844:
	defb 0ffh	; 7844

; ----------------------------------------------------------------------
; DATOS golpes_7845: 12 punteros a los guiones de bateria del modo con el bit
;   4 y la octava 1 (p04:653D; la cifra alta de la nota elige uno); lo leen
;   p04:6517 (24 bytes)
;   0x7845..0x785d  (24 bytes)
DATA_golpes_7845:
	defw 0785dh,0785dh,0785dh,0785dh,0785dh,0785dh,0785dh,0785dh	; 7845
	defw 0785dh,0785dh,0785dh,0785dh	; 7855  -> DATA_partitura_785D DATA_partitura_785D DATA_partitura_785D DATA_partitura_785D

; ----------------------------------------------------------------------
; DATOS partitura_785D: partitura (p04:63E2: ordenes 0xD0-0xFF y notas) de los
;   sonidos 0x01, 0x03, 0x04, 0x05, 0x06, golpe 0 de 0x7845; lo leen p04:63E2
;   (1955 bytes)
;   0x785d..0x8000  (1955 bytes)
DATA_partitura_785D:
	defb 0ffh,0ffh,0feh,004h,0d0h,0e9h,005h,093h,001h,001h,093h,001h,091h,093h,091h,031h	; 785d  ...............1
	defb 031h,031h,031h,031h,093h,001h,001h,093h,001h,091h,093h,091h,031h,031h,031h,030h	; 786d  1111........1110
	defb 030h,030h,030h,09fh,0ffh,0feh,001h,0e9h,005h,0c2h,0eeh,001h,0f8h,013h,0d8h,0cbh	; 787d  000.............
	defb 0eah,008h,0ebh,001h,011h,0f1h,043h,0f2h,010h,0d2h,093h,0d8h,08ch,061h,061h,0d8h	; 788d  ......C......aa.
	defb 09ch,06bh,0d8h,08ch,063h,073h,093h,0d8h,0cch,0afh,0d8h,09ch,093h,0d8h,0ach,07bh	; 789d  .k..cs.........{
	defb 0e9h,00ah,06ch,0ffh,0feh,001h,0e9h,005h,0f8h,028h,0eah,00bh,0ebh,077h,0f1h,0d4h	; 78ad  ..l......(...w..
	defb 027h,025h,021h,0d3h,023h,0d4h,027h,023h,0fbh,002h,0bch,078h,0e9h,00ah,0ech,0eah	; 78bd  '%!.#.'#...x....
	defb 009h,025h,0eah,008h,021h,0eah,007h,021h,0eah,006h,021h,0eah,005h,021h,0eah,004h	; 78cd  .%..!..!..!..!..
	defb 021h,0ffh,0feh,001h,0e9h,005h,0f8h,014h,0eah,00eh,0ebh,077h,0f1h,0d5h,027h,025h	; 78dd  !..........w..'%
	defb 021h,0d4h,023h,0d5h,027h,023h,0fbh,002h,0eah,078h,0ech,0e9h,00ah,0eah,008h,025h	; 78ed  !.#.'#...x.....%
	defb 0eah,007h,021h,0eah,006h,021h,0eah,005h,021h,0eah,004h,021h,0eah,002h,021h,0ffh	; 78fd  ..!..!..!..!..!.
	defb 0feh,001h,0e9h,005h,0f8h,013h,0d8h,0e3h,0eah,00bh,0ebh,021h,032h,0f1h,045h,0f2h	; 790d  ...........!2.E.
	defb 010h,0d2h,093h,0d8h,0adh,061h,061h,0d8h,0bbh,06bh,0d8h,0adh,063h,073h,093h,0d8h	; 791d  .....aa..k..cs..
	defb 0e3h,0afh,0d8h,0bah,093h,0d8h,0c8h,078h,0e9h,003h,0ech,0d7h,0eah,004h,010h,0eah	; 792d  .......x........
	defb 005h,020h,0eah,006h,030h,0eah,007h,040h,0eah,008h,050h,0ebh,021h,042h,0eah,00ah	; 793d  . ..0..@..P.!B..
	defb 0e9h,00ah,06fh,0ffh,0feh,001h,0e9h,005h,0eeh,002h,0f8h,013h,0d8h,0e3h,0eah,00bh	; 794d  ..o.............
	defb 0ebh,021h,032h,0f1h,045h,0f2h,010h,0d2h,063h,0d8h,0adh,021h,021h,0d8h,0bbh,02bh	; 795d  .!2.E...c..!!..+
	defb 0d8h,0adh,023h,023h,023h,0d8h,0e3h,07fh,0d8h,0bah,063h,0d8h,0cbh,038h,0e9h,003h	; 796d  ..###.....c..8..
	defb 0ech,0d7h,0d3h,0eah,004h,090h,0eah,005h,0a0h,0eah,006h,0b0h,0d2h,0eah,007h,000h	; 797d  ................
	defb 0eah,008h,010h,0ebh,021h,042h,0eah,00ah,0e9h,00ah,02fh,0ffh,0feh,001h,0e9h,005h	; 798d  ....!B..../.....
	defb 0f8h,009h,0eah,008h,0edh,004h,0ebh,087h,061h,0f1h,043h,0f2h,013h,0d8h,0f4h,0d1h	; 799d  ........a.C.....
	defb 02fh,0d2h,09fh,077h,0a7h,097h,077h,0ebh,087h,051h,0e9h,00ah,09fh,0ffh,0feh,001h	; 79ad  /..w..w..Q......
	defb 0e9h,005h,0eah,008h,0edh,004h,0ebh,087h,061h,0f1h,043h,0f2h,013h,0d8h,0f4h,0d2h	; 79bd  ........a.C.....
	defb 09fh,06fh,047h,077h,067h,047h,0ebh,087h,051h,0e9h,00ah,06fh,0ffh,0ffh,0feh,004h	; 79cd  .oGwgG..Q..o....
	defb 0e9h,005h,0d0h,093h,001h,001h,093h,013h,0fbh,008h,0e0h,079h,093h,093h,003h,091h	; 79dd  ...........y....
	defb 003h,091h,003h,093h,001h,091h,013h,093h,003h,091h,003h,091h,003h,093h,001h,091h	; 79ed  ................
	defb 0fbh,003h,0f3h,079h,093h,001h,001h,093h,013h,0fbh,008h,001h,07ah,0fdh,0dbh,079h	; 79fd  ...y........z..y
	defb 0feh,001h,0e9h,005h,0c1h,0eeh,001h,0e9h,00bh,0f2h,008h,0f1h,044h,0eah,007h,0ebh	; 7a0d  ............D...
	defb 002h,010h,0d8h,0cfh,0d1h,028h,0d7h,0e9h,001h,030h,0e9h,005h,020h,010h,0d2h,0a0h	; 7a1d  .....(...0.. ...
	defb 090h,087h,0d7h,091h,0a1h,091h,081h,091h,0a1h,091h,081h,0d8h,0cfh,0ebh,087h,030h	; 7a2d  ...............0
	defb 0edh,004h,0d1h,01dh,0fbh,002h,00fh,07ah,0feh,004h,0e9h,005h,0d0h,013h,0feh,001h	; 7a3d  .......z........
	defb 0e9h,005h,0eeh,001h,0f2h,008h,0f1h,041h,0eah,006h,0ebh,001h,010h,0d3h,0c3h,091h	; 7a4d  .......A........
	defb 081h,093h,043h,051h,041h,033h,043h,087h,091h,081h,093h,043h,053h,051h,04dh,091h	; 7a5d  ..CQA3C....CSQM.
	defb 081h,093h,043h,051h,041h,033h,043h,087h,091h,081h,093h,0b3h,0d2h,003h,0d3h,0b3h	; 7a6d  ..CQA3C.........
	defb 0e9h,002h,0ebh,002h,080h,0d2h,083h,090h,0a0h,0eah,007h,0b0h,0d1h,000h,0eah,008h	; 7a7d  ................
	defb 020h,030h,0d7h,0e9h,005h,0f1h,044h,0ebh,001h,010h,0d8h,0efh,0d1h,04fh,0d2h,09fh	; 7a8d   0....D......O..
	defb 0fbh,004h,099h,07ah,0fdh,00dh,07ah,0feh,001h,0f8h,023h,0e9h,005h,0eah,00dh,0ebh	; 7a9d  ...z..z...#.....
	defb 077h,060h,0f9h,0a1h,07ch,0d5h,093h,091h,081h,091h,0a1h,0b1h,0d4h,011h,0f9h,0a1h	; 7aad  w`..|...........
	defb 07ch,043h,041h,021h,011h,0d5h,0a1h,091h,0d4h,011h,0f9h,0b5h,07ch,0d5h,093h,0a3h	; 7abd  |CA!........|...
	defb 0a1h,099h,0f9h,0b5h,07ch,043h,053h,043h,053h,083h,0d5h,093h,0d4h,041h,041h,0d5h	; 7acd  ....|CSCS....AA.
	defb 093h,0d4h,043h,0fbh,007h,0d7h,07ah,0d5h,093h,091h,081h,091h,0a1h,0b1h,0d4h,011h	; 7add  ..C...z.........
	defb 0fdh,0a4h,07ah,0feh,001h,0f8h,00dh,0e9h,00bh,0f2h,008h,0f1h,044h,0eah,008h,0ebh	; 7aed  ..z.........D...
	defb 003h,050h,0d8h,0efh,0d1h,028h,0d7h,0e9h,001h,030h,0e9h,005h,020h,010h,0d2h,0a0h	; 7afd  .P...(...0.. ...
	defb 090h,087h,0d7h,091h,0a1h,091h,081h,091h,0a1h,091h,081h,0eah,007h,0ebh,087h,050h	; 7b0d  ...............P
	defb 0edh,004h,0d8h,0efh,0d1h,01fh,0d7h,0fbh,002h,0f4h,07ah,0f8h,01ah,0f2h,008h,0f1h	; 7b1d  ..........z.....
	defb 041h,0eah,006h,0ebh,003h,040h,0d3h,0c3h,091h,081h,093h,043h,051h,041h,033h,043h	; 7b2d  A....@.....CQA3C
	defb 087h,091h,081h,093h,043h,053h,051h,04dh,091h,081h,093h,043h,051h,041h,033h,043h	; 7b3d  ....CSQM...CQA3C
	defb 087h,091h,081h,093h,0b3h,0d2h,003h,0d3h,0b3h,0d2h,003h,0e9h,002h,0ech,0eah,004h	; 7b4d  ................
	defb 042h,050h,060h,0eah,005h,070h,080h,090h,0eah,006h,0a0h,0b0h,0d7h,0f8h,00dh,0e9h	; 7b5d  BP`..p..........
	defb 005h,0f1h,044h,0eah,009h,0ebh,003h,050h,0d8h,0efh,0d2h,09fh,04fh,09fh,04fh,09fh	; 7b6d  ..D....P....O.O.
	defb 04fh,09fh,0d1h,01fh,0fdh,0f0h,07ah,0f9h,010h,07dh,0d7h,0eah,008h,0f8h,020h,0ebh	; 7b7d  O.....z..}.... .
	defb 022h,020h,0d3h,091h,081h,091h,0a1h,0b1h,0d2h,011h,0f9h,010h,07dh,0eah,008h,0f8h	; 7b8d  " ..........}...
	defb 020h,0ebh,022h,020h,0d7h,0d2h,041h,021h,011h,0d3h,0a1h,091h,0d2h,011h,0f8h,01bh	; 7b9d   ." ..A!........
	defb 0f1h,041h,0eah,006h,0ebh,003h,040h,0d2h,0c3h,021h,011h,023h,0d3h,093h,0a1h,091h	; 7bad  .A....@..!.#....
	defb 083h,093h,0d2h,017h,021h,011h,023h,0d3h,093h,0a3h,0a1h,09dh,0d2h,021h,011h,023h	; 7bbd  ....!.#......!.#
	defb 0d3h,093h,0a1h,091h,083h,093h,0d2h,017h,021h,011h,023h,043h,053h,043h,053h,0e9h	; 7bcd  ........!.#CSCS.
	defb 002h,0f8h,00dh,0ech,0eah,004h,082h,090h,0a0h,0eah,005h,0b0h,0d1h,000h,0eah,006h	; 7bdd  ................
	defb 010h,020h,030h,0f8h,00dh,0e9h,005h,0f1h,043h,0eah,00ah,0ebh,003h,050h,0d1h,041h	; 7bed  . 0.....C....P.A
	defb 051h,071h,051h,041h,051h,041h,021h,011h,021h,041h,021h,011h,021h,041h,021h,041h	; 7bfd  QqQAQA!.!A!.!A!A
	defb 051h,071h,051h,041h,051h,041h,021h,013h,0ebh,042h,020h,0d2h,091h,091h,097h,0fbh	; 7c0d  QqQAQA!..B .....
	defb 002h,0f0h,07bh,0fdh,084h,07bh,0feh,001h,0eeh,001h,0e9h,005h,0c1h,0f2h,008h,0f1h	; 7c1d  ..{..{..........
	defb 043h,0eah,005h,0f9h,0c6h,07ch,0d7h,0ebh,002h,020h,0d3h,091h,081h,091h,0a1h,0b1h	; 7c2d  C....|... ......
	defb 0d2h,011h,0f9h,0c6h,07ch,0ebh,002h,020h,0d7h,0d2h,041h,021h,011h,0d3h,0a1h,091h	; 7c3d  ....|.. ..A!....
	defb 0c1h,0f1h,041h,0eah,003h,0ebh,004h,010h,0d2h,0c3h,021h,011h,023h,0d3h,093h,0a1h	; 7c4d  ..A.......!.#...
	defb 091h,083h,093h,0d2h,017h,021h,011h,023h,0d3h,093h,0a3h,0a1h,09dh,0d2h,021h,011h	; 7c5d  .....!.#......!.
	defb 023h,0d3h,093h,0a1h,091h,083h,093h,0d2h,017h,021h,011h,023h,043h,053h,043h,051h	; 7c6d  #........!.#CSCQ
	defb 0e9h,002h,0ech,0eah,004h,0d2h,083h,090h,0a0h,0eah,005h,0b0h,0d1h,000h,0eah,006h	; 7c7d  ................
	defb 010h,020h,0e9h,005h,0c1h,0f1h,043h,0eah,005h,0f9h,0ech,07ch,097h,0f9h,0ech,07ch	; 7c8d  . ....C....|...|
	defb 095h,0fdh,023h,07ch,0d4h,023h,091h,091h,023h,093h,0fbh,002h,0a1h,07ch,0d5h,093h	; 7c9d  ..#|.#..#....|..
	defb 0d4h,041h,041h,0d5h,093h,0d4h,043h,0fah,0d4h,0c3h,021h,011h,023h,0d5h,093h,0a1h	; 7cad  .AA...C...!.#...
	defb 091h,083h,093h,0d4h,017h,021h,011h,023h,0fah,0ebh,001h,020h,0d8h,09fh,0d2h,023h	; 7cbd  .....!.#... ...#
	defb 0d7h,091h,091h,0d8h,09fh,083h,093h,0d7h,0d1h,021h,0d2h,091h,081h,091h,0d8h,09fh	; 7ccd  .........!......
	defb 083h,093h,0d7h,041h,051h,041h,031h,041h,051h,041h,031h,0d8h,09fh,043h,0fah,0ebh	; 7cdd  ...AQA1AQA1..C..
	defb 001h,010h,0d1h,041h,051h,071h,051h,041h,051h,041h,021h,011h,021h,041h,021h,011h	; 7ced  ...AQqQAQA!.!A!.
	defb 021h,041h,021h,041h,051h,071h,051h,041h,051h,041h,021h,013h,0ebh,002h,020h,0d2h	; 7cfd  !A!AQqQAQA!... .
	defb 091h,091h,0fah,0feh,001h,0f8h,00dh,0e9h,005h,0f2h,008h,0f1h,043h,0eah,00ah,0ebh	; 7d0d  ............C...
	defb 003h,050h,0d8h,0bfh,0d2h,023h,0d7h,091h,091h,0d8h,0bfh,083h,093h,0d7h,0d1h,021h	; 7d1d  .P...#.........!
	defb 0d2h,091h,081h,091h,0d8h,0bfh,083h,093h,0d7h,041h,051h,041h,031h,041h,051h,041h	; 7d2d  .........AQA1AQA
	defb 031h,0d8h,0bfh,043h,0fah,0feh,004h,0d0h,0e9h,00ah,091h,000h,090h,011h,091h,0fbh	; 7d3d  1..C............
	defb 003h,047h,07dh,091h,000h,090h,011h,000h,010h,091h,000h,090h,011h,091h,0fbh,003h	; 7d4d  .G}.............
	defb 056h,07dh,090h,000h,010h,030h,030h,030h,011h,091h,000h,090h,011h,091h,0fbh,003h	; 7d5d  V}...000........
	defb 066h,07dh,091h,000h,090h,011h,000h,010h,091h,000h,090h,011h,091h,0fbh,003h,075h	; 7d6d  f}.............u
	defb 07dh,090h,000h,010h,030h,030h,030h,011h,091h,000h,090h,011h,091h,0fbh,006h,085h	; 7d7d  }...000.........
	defb 07dh,090h,000h,010h,030h,030h,030h,011h,0fdh,042h,07dh,0feh,001h,0e9h,00ah,0eah	; 7d8d  }...000..B}.....
	defb 00bh,0ebh,014h,078h,0d5h,003h,001h,001h,0fbh,007h,0a1h,07dh,003h,070h,080h,0b0h	; 7d9d  ...x.......}.p..
	defb 0d4h,000h,0eah,008h,0edh,004h,0ebh,081h,030h,0f1h,054h,0f2h,011h,0d8h,024h,0d1h	; 7dad  ........0.T...$.
	defb 021h,030h,020h,030h,060h,070h,090h,070h,0d0h,025h,0d1h,090h,080h,070h,060h,030h	; 7dbd  !0 0`p.p.%...p`0
	defb 060h,030h,020h,010h,030h,025h,0d2h,090h,0a0h,0d1h,020h,030h,020h,030h,060h,070h	; 7dcd  `0 .0%.... 0 0`p
	defb 090h,070h,0d0h,025h,0d1h,0a0h,090h,083h,070h,080h,0b0h,080h,076h,0eah,00ah,0ebh	; 7ddd  .p.%....p...v...
	defb 027h,025h,0d3h,0c0h,0a0h,0a0h,0a0h,0a1h,0a0h,0a0h,0a1h,0ebh,027h,010h,0d2h,005h	; 7ded  '%..........'...
	defb 0eah,006h,000h,0eah,00ah,0ebh,027h,025h,0d3h,0a0h,0a0h,0a0h,0a0h,0a0h,0a0h,0a0h	; 7dfd  ......'%........
	defb 0a1h,0ebh,027h,010h,095h,0eah,006h,090h,0eah,00ah,0ebh,027h,025h,0a0h,0a0h,0a0h	; 7e0d  ..'........'%...
	defb 0a1h,0a0h,0a0h,0a0h,0d2h,000h,001h,000h,0d3h,0a0h,0a1h,0a0h,090h,0ebh,027h,010h	; 7e1d  ..............'.
	defb 093h,0eah,006h,091h,0f0h,0fdh,098h,07dh,0feh,001h,0f8h,00dh,0e9h,00ah,0eah,00bh	; 7e2d  .......}........
	defb 0ebh,064h,0a8h,0d4h,003h,001h,001h,0fbh,007h,040h,07eh,003h,070h,080h,0b0h,0d3h	; 7e3d  .d.......@~.p...
	defb 000h,0eah,00ch,0ebh,064h,0b8h,0d4h,003h,001h,001h,0fbh,007h,053h,07eh,003h,070h	; 7e4d  ....d.......S~.p
	defb 080h,0b0h,0d3h,000h,0eah,00bh,0ebh,054h,0a8h,0d4h,003h,001h,001h,003h,0ebh,067h	; 7e5d  .......T.......g
	defb 060h,0f8h,023h,0d4h,000h,010h,020h,030h,0fbh,002h,061h,07eh,0f8h,00dh,0ebh,054h	; 7e6d  `.#... 0..a~...T
	defb 0a8h,003h,001h,001h,003h,001h,001h,003h,0ebh,067h,060h,0f8h,023h,0d5h,070h,080h	; 7e7d  .........g`.#.p.
	defb 0b0h,0d4h,000h,0fdh,035h,07eh,0feh,001h,0f8h,00dh,0e9h,00ah,0eah,009h,0edh,004h	; 7e8d  ....5~..........
	defb 0ebh,0c7h,045h,0f1h,054h,0f2h,011h,0d2h,0c0h,020h,020h,020h,061h,071h,093h,071h	; 7e9d  ..E.T....   aq.q
	defb 061h,035h,0d8h,0bch,031h,0d8h,05ch,027h,0d7h,0d2h,0c0h,020h,020h,020h,061h,071h	; 7ead  a5..1.\'...   aq
	defb 093h,071h,061h,035h,0d8h,04ch,031h,0d8h,05ch,023h,0f8h,016h,0eah,006h,0d7h,0d2h	; 7ebd  .qa5.L1.\#......
	defb 070h,080h,070h,080h,0f8h,009h,0eah,007h,0edh,001h,0ebh,081h,030h,0d8h,024h,0d1h	; 7ecd  p.p.........0.$.
	defb 020h,030h,020h,030h,060h,070h,090h,070h,0d0h,025h,0d1h,090h,080h,070h,060h,030h	; 7edd   0 0`p.p.%...p`0
	defb 060h,030h,020h,010h,030h,025h,0d2h,090h,0a0h,0d1h,020h,030h,020h,030h,060h,070h	; 7eed  `0 .0%.... 0 0`p
	defb 090h,070h,0d0h,025h,0d1h,0a0h,090h,083h,070h,080h,0b0h,080h,0d7h,075h,0ech,0eah	; 7efd  .p.%....p....u..
	defb 001h,071h,0f8h,002h,0eah,009h,0ebh,037h,025h,0d2h,0c0h,030h,030h,030h,031h,030h	; 7f0d  .q.....7%..00010
	defb 030h,031h,0ebh,017h,020h,055h,0eah,005h,050h,0eah,009h,0ebh,037h,025h,0d2h,030h	; 7f1d  01.. U..P...7%.0
	defb 030h,030h,030h,030h,030h,030h,031h,0ebh,017h,020h,025h,0eah,005h,020h,0eah,009h	; 7f2d  0000001.. %.. ..
	defb 0ebh,037h,025h,030h,030h,030h,031h,030h,030h,030h,050h,051h,050h,030h,031h,030h	; 7f3d  .7%0001000PQP010
	defb 020h,0ebh,027h,010h,023h,0eah,005h,021h,0fdh,093h,07eh,0feh,001h,0f8h,00dh,0e9h	; 7f4d   .'.#..!..~.....
	defb 00ah,0eah,009h,0edh,004h,0ebh,0c7h,045h,0f1h,054h,0f2h,011h,0f9h,08bh,080h,0f9h	; 7f5d  .......E.T......
	defb 08bh,080h,0eah,00ah,0ebh,0c6h,0f5h,0f9h,08bh,080h,0c0h,070h,070h,070h,0b1h,0d1h	; 7f6d  ...........ppp..
	defb 001h,023h,001h,0d2h,0b1h,085h,0d8h,04ch,0d1h,001h,0d8h,05ch,0d2h,077h,0d7h,0f8h	; 7f7d  .#.....L...\.w..
	defb 002h,0eah,00bh,0ebh,037h,025h,0c0h,0a0h,0a0h,0a0h,0a1h,0a0h,0a0h,0a1h,0ebh,027h	; 7f8d  ....7%.........'
	defb 010h,0d1h,005h,0eah,006h,000h,0eah,00bh,0ebh,037h,025h,0d2h,0a0h,0a0h,0a0h,0a0h	; 7f9d  .........7%.....
	defb 0a0h,0a0h,0a0h,0a1h,0ebh,017h,020h,095h,0eah,006h,090h,0eah,00bh,0ebh,037h,025h	; 7fad  ...... .......7%
	defb 0a0h,0a0h,0a0h,0a1h,0a0h,0a0h,0a0h,0d1h,000h,001h,000h,0d2h,0a0h,0a1h,0a0h,090h	; 7fbd  ................
	defb 0ebh,027h,010h,093h,0eah,006h,091h,0fdh,058h,07fh,0feh,001h,0e9h,005h,0eah,007h	; 7fcd  .'......X.......
	defb 0eeh,002h,0edh,004h,0ebh,0c7h,040h,0f1h,054h,0f2h,011h,0d2h,0c2h,0e9h,00ah,070h	; 7fdd  ......@.T......p
	defb 070h,070h,0b1h,0d1h,001h,023h,001h,0d2h,0b1h,085h,0d8h,0bch,081h,0d8h,05ch,077h	; 7fed  pp...#........\w
	defb 0d7h,0c0h,070h	; 7ffd
