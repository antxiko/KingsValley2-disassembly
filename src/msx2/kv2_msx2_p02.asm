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
	call 07f39h		;8001
	cp (hl)			;8004
	jr nz,L_8016		;8005
	dec hl			;8007
	call 07f2ah		;8008
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
	call L_871B		;8018
	ld a,(0e207h)		;801b
	and 030h		;801e
	ret z			;8020
	and 010h		;8021
	ld hl,0e282h		;8023
	jr z,L_8039		;8026
	call 07f39h		;8028
	ld (0e243h),a		;802b
	call 07f2ah		;802e
	ld (hl),e			;8031
	inc hl			;8032
	inc hl			;8033
	ld (hl),d			;8034
	ld a,001h		;8035
	jr L_8043		;8037
L_8039:
	ld a,(0e243h)		;8039
	ld b,a			;803c
	call 07f39h		;803d
	cp b			;8040
	ret nz			;8041
	xor a			;8042
L_8043:
	ld (0e26bh),a		;8043
L_8046:
	ld hl,0e808h		;8046
	ld de,0e80ch		;8049
	exx			;804c
	ld hl,0e810h		;804d
	ld de,0e814h		;8050
	exx			;8053
	and a			;8054
	ld a,0e0h		;8055
	jr z,L_805E		;8057
	ld a,(0e282h)		;8059
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
	ld a,(0e284h)		;806a
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
	ld a,00dh		;8087
	ld hl,0d220h		;8089
	call 07c04h		;808c
	ld a,04eh		;808f
	ld hl,0d230h		;8091
	call 07c04h		;8094
	ld a,00dh		;8097
	ld hl,0d240h		;8099
	call 07c04h		;809c
	ld a,04eh		;809f
	ld hl,0d250h		;80a1
	jp 07c04h		;80a4
L_80A7:
	call L_871B		;80a7
	ld a,(0e207h)		;80aa
	and 030h		;80ad
	ret z			;80af
	and 010h		;80b0
	ld hl,0e266h		;80b2
	jr z,L_8102		;80b5
	ld a,(hl)			;80b7
	cp 008h		;80b8
	ret nc			;80ba
	push hl			;80bb
	call L_80E8		;80bc
	pop hl			;80bf
	ret z			;80c0
	inc (hl)			;80c1
	ld hl,0e2c0h		;80c2
L_80C5:
	ld a,(hl)			;80c5
	and a			;80c6
	jr z,L_80D0		;80c7
	ld a,005h		;80c9
	call 0408fh		;80cb
	jr L_80C5		;80ce
L_80D0:
	ld a,(0e261h)		;80d0
	inc a			;80d3
	or 080h		;80d4
	ld (hl),a			;80d6
	inc hl			;80d7
	ld (hl),020h		;80d8
	inc hl			;80da
	call 07f39h		;80db
	ld (hl),a			;80de
	inc hl			;80df
	call 07f2ah		;80e0
	ld (hl),e			;80e3
	inc hl			;80e4
	ld (hl),d			;80e5
	jr L_811F		;80e6
L_80E8:
	ld hl,0e2c0h		;80e8
	ld b,008h		;80eb
L_80ED:
	ld a,(hl)			;80ed
	and a			;80ee
	jr z,L_80F7		;80ef
	push hl			;80f1
	call L_819E		;80f2
	pop hl			;80f5
	ret z			;80f6
L_80F7:
	ld a,005h		;80f7
	call 0408fh		;80f9
	djnz L_80ED		;80fc
	ld a,001h		;80fe
	and a			;8100
	ret			;8101
L_8102:
	ld a,(hl)			;8102
	and a			;8103
	ret z			;8104
	ld hl,0e2c0h		;8105
	ld b,008h		;8108
L_810A:
	ld a,(hl)			;810a
	and a			;810b
	jr z,L_8118		;810c
	push hl			;810e
	call L_819E		;810f
	pop hl			;8112
	push hl			;8113
	call z,L_81B0		;8114
	pop hl			;8117
L_8118:
	ld a,005h		;8118
	call 0408fh		;811a
	djnz L_810A		;811d
L_811F:
	ld hl,0e2c0h		;811f
	ld b,008h		;8122
	ld de,0e840h		;8124
L_8127:
	push hl			;8127
	exx			;8128
	call 07f39h		;8129
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
	call 04094h		;8138
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
	jr nz,L_814B		;8147
	ld a,0e0h		;8149
L_814B:
	ld (de),a			;814b
	exx			;814c
	ld (de),a			;814d
	inc de			;814e
	exx			;814f
	inc hl			;8150
	inc de			;8151
	ld a,(hl)			;8152
	ld (de),a			;8153
	exx			;8154
	ld (de),a			;8155
	inc de			;8156
	exx			;8157
	inc hl			;8158
	inc de			;8159
	ld a,c			;815a
	dec a			;815b
	ld c,a			;815c
	add a,a			;815d
	add a,c			;815e
	ld hl,086b9h		;815f
	call 0408fh		;8162
	ld a,(hl)			;8165
	ld (de),a			;8166
	exx			;8167
	add a,004h		;8168
	ld (de),a			;816a
	exx			;816b
	inc hl			;816c
	ld b,(hl)			;816d
	inc hl			;816e
	ld c,(hl)			;816f
	ld a,e			;8170
	ld de,0d200h		;8171
	and 07ch		;8174
	ld h,000h		;8176
	ld l,a			;8178
	add hl,hl			;8179
	add hl,hl			;817a
	add hl,de			;817b
	push hl			;817c
	ld a,b			;817d
	push bc			;817e
	call 07c04h		;817f
	pop bc			;8182
	ld a,c			;8183
	exx			;8184
	pop hl			;8185
	ld bc,00010h		;8186
	add hl,bc			;8189
	call 07c04h		;818a
	exx			;818d
	pop de			;818e
	pop hl			;818f
	pop bc			;8190
L_8191:
	ld a,005h		;8191
	call 0408fh		;8193
	ld a,008h		;8196
	call 04094h		;8198
	djnz L_8127		;819b
	ret			;819d
L_819E:
	call 07f39h		;819e
	inc hl			;81a1
	inc hl			;81a2
	cp (hl)			;81a3
	ret nz			;81a4
	call 07f2ah		;81a5
	inc hl			;81a8
	ld a,(hl)			;81a9
	cp e			;81aa
	ret nz			;81ab
	inc hl			;81ac
	ld a,(hl)			;81ad
	cp d			;81ae
	ret			;81af
L_81B0:
	ld (hl),000h		;81b0
	ld hl,0e266h		;81b2
	dec (hl)			;81b5
	ret			;81b6
L_81B7:
	call L_8708		;81b7
	ld a,(0e207h)		;81ba
	and 030h		;81bd
	ret z			;81bf
	and 010h		;81c0
	ld hl,0e267h		;81c2
	jp z,L_82B1		;81c5
	ld a,(0e261h)		;81c8
	cp 007h		;81cb
	jp z,L_83A5		;81cd
	ld a,(hl)			;81d0
	cp 010h		;81d1
	ret nc			;81d3
	push hl			;81d4
	call L_824B		;81d5
	pop hl			;81d8
	ret z			;81d9
	inc (hl)			;81da
	ld hl,0e600h		;81db
L_81DE:
	ld a,(hl)			;81de
	and a			;81df
	jr z,L_81E9		;81e0
	ld a,010h		;81e2
	call 0408fh		;81e4
	jr L_81DE		;81e7
L_81E9:
	push hl			;81e9
	pop ix		;81ea
	ld b,010h		;81ec
L_81EE:
	ld (hl),000h		;81ee
	inc hl			;81f0
	djnz L_81EE		;81f1
	ld a,(0e261h)		;81f3
	ld b,a			;81f6
	dec b			;81f7
	cp 004h		;81f8
	jr nc,L_8203		;81fa
	cp 002h		;81fc
	ld b,001h		;81fe
	jr c,L_8203		;8200
	inc b			;8202
L_8203:
	ld a,b			;8203
	ld (ix+000h),a		;8204
	call 07f2ah		;8207
	ld (ix+002h),e		;820a
	ld (ix+003h),d		;820d
	call 07f39h		;8210
	ld (ix+004h),a		;8213
	ld (ix+009h),a		;8216
	call L_830C		;8219
L_821C:
	call 07f39h		;821c
	ld c,a			;821f
	ld ix,0e600h		;8220
	ld b,010h		;8224
L_8226:
	push bc			;8226
	ld a,(ix+004h)		;8227
	cp c			;822a
	jr nz,L_8234		;822b
	ld a,(ix+000h)		;822d
	and a			;8230
	call nz,L_823D		;8231
L_8234:
	ld bc,00010h		;8234
	add ix,bc		;8237
	pop bc			;8239
	djnz L_8226		;823a
	ret			;823c
L_823D:
	dec a			;823d
	call 04099h		;823e

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
	ld ix,0e600h		;824b
	ld b,010h		;824f
L_8251:
	ld a,(ix+000h)		;8251
	and a			;8254
	jr z,L_825B		;8255
	call L_82F8		;8257
	ret z			;825a
L_825B:
	ld de,00010h		;825b
	add ix,de		;825e
	djnz L_8251		;8260
	ld a,001h		;8262
	and a			;8264
	ret			;8265
L_8266:
	ld a,(ix+007h)		;8266
	and 002h		;8269
	ld a,003h		;826b
	jr nz,L_8270		;826d
	xor a			;826f
L_8270:
	ld (ix+005h),a		;8270
	ld hl,09374h		;8273
	ld de,09374h		;8276
	ld bc,09374h		;8279
	jp 0bb63h		;827c
L_827F:
	ld a,(ix+007h)		;827f
	rra			;8282
	rra			;8283
	ld hl,0937ch		;8284
	ld de,09384h		;8287
	ld bc,0938ch		;828a
	jp nc,0bb63h		;828d
	ld hl,09394h		;8290
	ld de,0939ch		;8293
	ld bc,093a4h		;8296
	jp 0bb63h		;8299
L_829C:
	ld e,(ix+002h)		;829c
	ld d,(ix+003h)		;829f
	ld b,(ix+008h)		;82a2
L_82A5:
	ld a,0feh		;82a5
	call 0576ah		;82a7
	ld a,e			;82aa
	add a,008h		;82ab
	ld e,a			;82ad
	djnz L_82A5		;82ae
	ret			;82b0
L_82B1:
	ld a,(0e261h)		;82b1
	cp 007h		;82b4
	jp z,L_8435		;82b6
	ld a,(hl)			;82b9
	and a			;82ba
	ret z			;82bb
	ld ix,0e600h		;82bc
	ld b,010h		;82c0
L_82C2:
	ld a,(ix+000h)		;82c2
	and a			;82c5
	jr z,L_82D0		;82c6
	push hl			;82c8
	call L_82F8		;82c9
	call z,L_82D8		;82cc
	pop hl			;82cf
L_82D0:
	ld de,00010h		;82d0
	add ix,de		;82d3
	djnz L_82C2		;82d5
	ret			;82d7
L_82D8:
	ld a,(ix+000h)		;82d8
	ld (ix+000h),000h		;82db
	dec (hl)			;82df
	ld hl,082f2h		;82e0
	call 0408fh		;82e3
	ld c,(hl)			;82e6
	ld b,(ix+008h)		;82e7
	call 07f2ah		;82ea
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
	call 07f39h		;82f8
	cp (ix+004h)		;82fb
	ret nz			;82fe
	call 07f2ah		;82ff
	ld a,(ix+002h)		;8302
	cp e			;8305
	ret nz			;8306
	ld a,(ix+003h)		;8307
	cp d			;830a
	ret			;830b
L_830C:
	ld a,(0e261h)		;830c
	call 04099h		;830f

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
	ld c,000h		;8320
	xor a			;8322
	ld b,003h		;8323
L_8325:
	ld (ix+005h),c		;8325
	ld (ix+007h),a		;8328
	call L_8359		;832b
	ld (ix+008h),c		;832e
	dec c			;8331
	ret nz			;8332
	ld (ix+000h),000h		;8333
	ld hl,0e267h		;8337
	dec (hl)			;833a
	ret			;833b
L_833C:
	ld (ix+008h),001h		;833c
	ret			;8340
L_8341:
	ld (ix+008h),002h		;8341
	ret			;8345
L_8346:
	xor a			;8346
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
	ld c,001h		;8359
	call 07f2ah		;835b
L_835E:
	ld a,e			;835e
	add a,008h		;835f
	ld e,a			;8361
	cp 0b8h		;8362
	ret nc			;8364
	push bc			;8365
	push de			;8366
	call L_8371		;8367
	pop de			;836a
	pop bc			;836b
	ret nc			;836c
	inc c			;836d
	djnz L_835E		;836e
	ret			;8370
L_8371:
	push de			;8371
	call 07f39h		;8372
	dec a			;8375
	ld l,a			;8376
	ld h,000h		;8377
	call 05d32h		;8379
	pop de			;837c
	push hl			;837d
	ex de,hl			;837e
	call 04d7bh		;837f
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
	call 0408fh		;8393
	ld a,c			;8396
	and 003h		;8397
	inc a			;8399
	ld b,a			;839a
	ld a,(hl)			;839b
L_839C:
	rlca			;839c
	rlca			;839d
	djnz L_839C		;839e
	and 003h		;83a0
	cp 002h		;83a2
	ret			;83a4
L_83A5:
	ld hl,0e26ch		;83a5
	ld a,(hl)			;83a8
	cp 010h		;83a9
	ret nc			;83ab
	push hl			;83ac
	call L_841A		;83ad
	pop hl			;83b0
	ret z			;83b1
	inc (hl)			;83b2
	ld hl,0e7c0h		;83b3
L_83B6:
	ld a,(hl)			;83b6
	and a			;83b7
	jr z,L_83C1		;83b8
	ld a,004h		;83ba
	call 0408fh		;83bc
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
	call 07f39h		;83cb
	ld (hl),a			;83ce
	inc hl			;83cf
	call 07f2ah		;83d0
	ld (hl),e			;83d3
	inc hl			;83d4
	ld (hl),d			;83d5
	ld b,01eh		;83d6
	push hl			;83d8
	call L_8359		;83d9
	pop hl			;83dc
	inc hl			;83dd
	ld a,080h		;83de
	or c			;83e0
	ld (hl),a			;83e1
	pop hl			;83e2
L_83E3:
	ld c,001h		;83e3
	ld ix,0e7c0h		;83e5
	ld b,010h		;83e9
L_83EB:
	push bc			;83eb
	call 07f39h		;83ec
	cp (ix+000h)		;83ef
	call z,L_83FE		;83f2
	ld bc,00004h		;83f5
	add ix,bc		;83f8
	pop bc			;83fa
	djnz L_83EB		;83fb
	ret			;83fd
L_83FE:
	ld a,(ix+003h)		;83fe
	and 01fh		;8401
	ld b,a			;8403
	ld d,(ix+002h)		;8404
	ld e,(ix+001h)		;8407
L_840A:
	push de			;840a
	push bc			;840b
	ld a,c			;840c
	and a			;840d
	call 07fa4h		;840e
	pop bc			;8411
	pop de			;8412
	ld a,e			;8413
	add a,008h		;8414
	ld e,a			;8416
	djnz L_840A		;8417
	ret			;8419
L_841A:
	ld ix,0e7c0h		;841a
	ld b,010h		;841e
L_8420:
	ld a,(ix+000h)		;8420
	and a			;8423
	jr z,L_842A		;8424
	call L_8456		;8426
	ret z			;8429
L_842A:
	ld de,00004h		;842a
	add ix,de		;842d
	djnz L_8420		;842f
	ld a,001h		;8431
	and a			;8433
	ret			;8434
L_8435:
	ld a,(0e26ch)		;8435
	and a			;8438
	ret z			;8439
	ld ix,0e7c0h		;843a
	ld b,010h		;843e
L_8440:
	push bc			;8440
	ld a,(ix+000h)		;8441
	and a			;8444
	jr z,L_844D		;8445
	call L_8456		;8447
	call z,L_846A		;844a
L_844D:
	ld bc,00004h		;844d
	add ix,bc		;8450
	pop bc			;8452
	djnz L_8440		;8453
	ret			;8455
L_8456:
	call 07f39h		;8456
	cp (ix+000h)		;8459
	ret nz			;845c
	call 07f2ah		;845d
	ld a,(ix+001h)		;8460
	cp e			;8463
	ret nz			;8464
	ld a,(ix+002h)		;8465
	cp d			;8468
	ret			;8469
L_846A:
	ld hl,0e26ch		;846a
	dec (hl)			;846d
	ld (ix+000h),000h		;846e
	ld c,000h		;8472
	jp L_83FE		;8474
L_8477:
	call L_871B		;8477
	ld a,(0e207h)		;847a
	and 030h		;847d
	ret z			;847f
	and 010h		;8480
	ld hl,0e268h		;8482
	jr z,L_84B8		;8485
	ld a,000h		;8487
	ld (0efd0h),a		;8489
	ld a,(hl)			;848c
	cp 040h		;848d
	ret nc			;848f
	push hl			;8490
	call L_8501		;8491
	pop hl			;8494
	ret z			;8495
	inc (hl)			;8496
	ld hl,0e300h		;8497
L_849A:
	ld a,(hl)			;849a
	and a			;849b
	jr z,L_84A5		;849c
	ld a,008h		;849e
	call 0408fh		;84a0
	jr L_849A		;84a3
L_84A5:
	ld a,(0e261h)		;84a5
	inc a			;84a8
	ld (hl),a			;84a9
	inc hl			;84aa
	call 07f2ah		;84ab
	ld (hl),e			;84ae
	inc hl			;84af
	ld (hl),d			;84b0
	inc hl			;84b1
	call 07f39h		;84b2
	ld (hl),a			;84b5
	jr L_84DD		;84b6
L_84B8:
	ld a,001h		;84b8
	ld (0efd0h),a		;84ba
	ld a,(hl)			;84bd
	and a			;84be
	ret z			;84bf
	ld hl,0e300h		;84c0
	ld b,040h		;84c3
L_84C5:
	push bc			;84c5
	ld a,(hl)			;84c6
	and a			;84c7
	jr z,L_84D4		;84c8
	push hl			;84ca
	call L_851B		;84cb
	pop hl			;84ce
	push hl			;84cf
	call z,L_852E		;84d0
	pop hl			;84d3
L_84D4:
	ld a,008h		;84d4
	call 0408fh		;84d6
	pop bc			;84d9
	djnz L_84C5		;84da
	ret			;84dc
L_84DD:
	call 07f2ah		;84dd
	ld a,(0e261h)		;84e0
	call L_8537		;84e3
	ld a,(0efd0h)		;84e6
	and a			;84e9
	jr z,L_84EF		;84ea
	ld hl,086c5h		;84ec
L_84EF:
	ld bc,00202h		;84ef
	push bc			;84f2
	push de			;84f3
	call 05737h		;84f4
	pop hl			;84f7
	pop bc			;84f8
	call 07f39h		;84f9
	ld d,a			;84fc
	xor a			;84fd
	jp 063edh		;84fe
L_8501:
	ld hl,0e300h		;8501
	ld b,040h		;8504
L_8506:
	ld a,(hl)			;8506
	and a			;8507
	jr z,L_8510		;8508
	push hl			;850a
	call L_851B		;850b
	pop hl			;850e
	ret z			;850f
L_8510:
	ld a,008h		;8510
	call 0408fh		;8512
	djnz L_8506		;8515
	ld a,001h		;8517
	and a			;8519
	ret			;851a
L_851B:
	call 07f39h		;851b
	inc hl			;851e
	inc hl			;851f
	inc hl			;8520
	cp (hl)			;8521
	ret nz			;8522
	call 07f2ah		;8523
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
	ld hl,0e268h		;8530
	dec (hl)			;8533
	jp L_84DD		;8534
L_8537:
	ld hl,09328h		;8537
	add a,a			;853a
	add a,a			;853b
	jp 0408fh		;853c
L_853F:
	call L_871B		;853f
	ld a,(0e207h)		;8542
	and 030h		;8545
	ret z			;8547
	and 010h		;8548
	ld a,001h		;854a
	jr nz,L_8550		;854c
	ld a,000h		;854e
L_8550:
	ld (0efd0h),a		;8550
	ld hl,0e269h		;8553
	jr z,L_857C		;8556
	ld a,(hl)			;8558
	cp 010h		;8559
	ret nc			;855b
	ld a,(hl)			;855c
	inc (hl)			;855d
	ld hl,0e700h		;855e
L_8561:
	ld a,(hl)			;8561
	and a			;8562
	jr z,L_856C		;8563
	ld a,008h		;8565
	call 0408fh		;8567
	jr L_8561		;856a
L_856C:
	ld (hl),001h		;856c
	inc hl			;856e
	call 07f39h		;856f
	ld (hl),a			;8572
	inc hl			;8573
	call 07f2ah		;8574
	ld (hl),e			;8577
	inc hl			;8578
	ld (hl),d			;8579
	jr L_85B3		;857a
L_857C:
	ld a,(hl)			;857c
	and a			;857d
	ret z			;857e
	ld hl,0e700h		;857f
	ld b,010h		;8582
L_8584:
	push bc			;8584
	ld a,(hl)			;8585
	and a			;8586
	jr z,L_8593		;8587
	push hl			;8589
	call L_859C		;858a
	pop hl			;858d
	push hl			;858e
	call z,L_85AD		;858f
	pop hl			;8592
L_8593:
	ld a,008h		;8593
	call 0408fh		;8595
	pop bc			;8598
	djnz L_8584		;8599
	ret			;859b
L_859C:
	call 07f39h		;859c
	inc hl			;859f
	cp (hl)			;85a0
	ret nz			;85a1
	call 07f2ah		;85a2
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
	ld hl,0e269h		;85af
	dec (hl)			;85b2
L_85B3:
	call 07f2ah		;85b3
	ld a,(0efd0h)		;85b6
	and a			;85b9
	ld hl,09324h		;85ba
	jr nz,L_85C2		;85bd
	ld hl,086c5h		;85bf
L_85C2:
	ld bc,00202h		;85c2
	push bc			;85c5
	push de			;85c6
	call 05737h		;85c7
	pop hl			;85ca
	pop bc			;85cb
	call 07f39h		;85cc
	ld d,a			;85cf
	xor a			;85d0
	jp 063edh		;85d1
L_85D4:
	call L_871B		;85d4
	ld a,(0e207h)		;85d7
	and 030h		;85da
	ret z			;85dc
	and 010h		;85dd
	jr z,L_8616		;85df
	ld a,(0e26ah)		;85e1
	and a			;85e4
	call nz,L_8621		;85e5
	call L_8633		;85e8
	ld hl,0e2f1h		;85eb
	call 07f2ah		;85ee
	ld (hl),e			;85f1
	inc hl			;85f2
	ld (hl),d			;85f3
	inc hl			;85f4
	call 07f39h		;85f5
	ld (hl),a			;85f8
	ld a,001h		;85f9
	ld (0e26ah),a		;85fb
	call 07f2ah		;85fe
	ld hl,09340h		;8601
L_8604:
	ld bc,00404h		;8604
	push de			;8607
	push bc			;8608
	call 05737h		;8609
	pop bc			;860c
	pop hl			;860d
L_860E:
	call 07f39h		;860e
	ld d,a			;8611
	xor a			;8612
	jp 063edh		;8613
L_8616:
	call L_8621		;8616
	call L_8633		;8619
	xor a			;861c
	ld (0e26ah),a		;861d
	ret			;8620
L_8621:
	ld hl,0e2f3h		;8621
	call 07f39h		;8624
	cp (hl)			;8627
	ret nz			;8628
	dec hl			;8629
	ld d,(hl)			;862a
	dec hl			;862b
	ld e,(hl)			;862c
	ld hl,086c5h		;862d
	jp L_8604		;8630
L_8633:
	ld hl,0e2f0h		;8633
	ld de,0e2f1h		;8636
	ld bc,00007h		;8639
	ld (hl),000h		;863c
	ldir		;863e
	ret			;8640
L_8641:
	ld hl,0e800h		;8641
	ld a,(0e264h)		;8644
	add a,a			;8647
	add a,a			;8648
	add a,a			;8649
	ld (hl),a			;864a
	inc hl			;864b
	ld a,(0e265h)		;864c
	add a,a			;864f
	add a,a			;8650
	add a,a			;8651
	ld (hl),a			;8652
	inc hl			;8653
	ld (hl),01ch		;8654
	inc hl			;8656
	ld a,(0e203h)		;8657
	and 008h		;865a
	ld a,007h		;865c
	jr z,L_8661		;865e
	xor a			;8660
L_8661:
	ld hl,0d200h		;8661
	jp 07c04h		;8664
L_8667:
	ld a,(0e20ch)		;8667
	rla			;866a
	rla			;866b
	jr c,L_8676		;866c
	call L_88AB		;866e
	ld a,(0e25bh)		;8671
	and a			;8674
	ret nz			;8675
L_8676:
	ld hl,00005h		;8676
	ld (0e25ah),hl		;8679
	ret			;867c
L_867D:
	ld a,001h		;867d
	call L_886A		;867f
	call 041bfh		;8682
	ld hl,0bc54h		;8685
	call 051d0h		;8688
	call 0418ah		;868b
	ld de,0a090h		;868e
	ld hl,0e788h		;8691
	ld bc,00606h		;8694
L_8697:
	push de			;8697
	push bc			;8698
	ld b,c			;8699
L_869A:
	ld a,(hl)			;869a
	and a			;869b
	ld c,0ffh		;869c
	jr z,L_86A3		;869e
	add a,0d0h		;86a0
	ld c,a			;86a2
L_86A3:
	ld a,c			;86a3
	call 05207h		;86a4
	ld a,d			;86a7
	add a,008h		;86a8
	ld d,a			;86aa
	inc hl			;86ab
	djnz L_869A		;86ac
	pop bc			;86ae
	pop de			;86af
	ld a,e			;86b0
	add a,008h		;86b1
	ld e,a			;86b3
	inc hl			;86b4
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
	ld hl,0e21ch		;86dd
	ld de,0e207h		;86e0
	ld bc,0e208h		;86e3
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
	ld a,(bc)			;86f6
	and a			;86f7
	jr z,L_8705		;86f8
	inc hl			;86fa
	inc (hl)			;86fb
	ld a,(hl)			;86fc
	cp 005h		;86fd
	ret nz			;86ff
	ld (hl),000h		;8700
	ld a,(bc)			;8702
	ld (de),a			;8703
	ret			;8704
L_8705:
	ld (hl),000h		;8705
	ret			;8707
L_8708:
	exx			;8708
	ld a,(0e261h)		;8709
	ld bc,00201h		;870c
	cp 004h		;870f
	jr c,L_871F		;8711
	ld c,002h		;8713
	cp 006h		;8715
	jr z,L_871F		;8717
	jr L_871C		;8719
L_871B:
	exx			;871b
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
	ld hl,0e264h		;872f
	ld de,0e265h		;8732
	ld bc,(0e27ch)		;8735
	ld a,(0e207h)		;8739
	rra			;873c
	jr c,L_8757		;873d
	rra			;873f
	jr c,L_8769		;8740
	rra			;8742
	jr c,L_8778		;8743
	rra			;8745
	ret nc			;8746
	call 042cbh		;8747
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
	call 042cbh		;8757
	ld a,(hl)			;875a
	exx			;875b
	sub c			;875c
	exx			;875d
	ld (hl),a			;875e
	rla			;875f
	jr c,L_8766		;8760
	exx			;8762
	cp e			;8763
	exx			;8764
	ret nc			;8765
L_8766:
	ld (hl),c			;8766
	dec (hl)			;8767
	ret			;8768
L_8769:
	call 042cbh		;8769
	ld a,(hl)			;876c
	exx			;876d
	add a,c			;876e
	exx			;876f
	ld (hl),a			;8770
	cp c			;8771
	ret c			;8772
	exx			;8773
	ld a,e			;8774
	exx			;8775
	ld (hl),a			;8776
	ret			;8777
L_8778:
	call 042cbh		;8778
	ex de,hl			;877b
	ld a,(hl)			;877c
	exx			;877d
	sub b			;877e
	exx			;877f
	ld (hl),a			;8780
	rla			;8781
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
	ld hl,0e7c0h		;878b
	ld b,010h		;878e
L_8790:
	push bc			;8790
	ld a,(hl)			;8791
	and a			;8792
	push hl			;8793
	call nz,L_87A1		;8794
	pop hl			;8797
	pop bc			;8798
	ld a,004h		;8799
	call 0408fh		;879b
	djnz L_8790		;879e
	ret			;87a0
L_87A1:
	ld a,(hl)			;87a1
	push af			;87a2
	inc hl			;87a3
	ld e,(hl)			;87a4
	inc hl			;87a5
	ld d,(hl)			;87a6
	inc hl			;87a7
	ld a,(hl)			;87a8
	and 01fh		;87a9
	ld b,a			;87ab
	ld c,002h		;87ac
	ex de,hl			;87ae
	pop de			;87af
	ld a,001h		;87b0
	jp 063edh		;87b2
L_87B5:
	ld hl,0e788h		;87b5
	ld bc,03001h		;87b8
	xor a			;87bb
	ld (0efc0h),a		;87bc
	ld (0efc1h),a		;87bf
L_87C2:
	ld a,(hl)			;87c2
	cp c			;87c3
	jr nz,L_87D3		;87c4
	push hl			;87c6
	push bc			;87c7
	call L_87FA		;87c8
	pop bc			;87cb
	pop hl			;87cc
	inc c			;87cd
	ld a,c			;87ce
	cp 007h		;87cf
	jr nc,L_87D6		;87d1
L_87D3:
	inc hl			;87d3
	djnz L_87C2		;87d4
L_87D6:
	ld a,(0efc0h)		;87d6
	ld hl,0ed80h		;87d9
	ld de,0ed90h		;87dc
	call L_87EB		;87df
	ld a,(0efc1h)		;87e2
	ld hl,0eda0h		;87e5
	ld de,0edb0h		;87e8
L_87EB:
	add a,a			;87eb
	ld b,a			;87ec
	call 0408fh		;87ed
	ld (hl),0ffh		;87f0
	ld a,b			;87f2
	call 04094h		;87f3
	ld a,0ffh		;87f6
	ld (de),a			;87f8
	ret			;87f9
L_87FA:
	push hl			;87fa
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
	ld bc,0ed80h		;880a
	ld de,0ed91h		;880d
	call L_882A		;8810
	ld hl,0efc0h		;8813
	inc (hl)			;8816
	pop bc			;8817
	pop hl			;8818
L_8819:
	ld a,b			;8819
	and a			;881a
	ret nz			;881b
	ld bc,0eda0h		;881c
	ld de,0edb1h		;881f
	call L_884D		;8822
	ld hl,0efc1h		;8825
	inc (hl)			;8828
	ret			;8829
L_882A:
	ld a,(0efc0h)		;882a
	add a,a			;882d
	push af			;882e
	add a,c			;882f
	ld c,a			;8830
	pop af			;8831
	add a,e			;8832
	ld e,a			;8833
	ld a,l			;8834
	sub 088h		;8835
	ld (bc),a			;8837
	ld (de),a			;8838
L_8839:
	ld a,l			;8839
	add a,008h		;883a
	ld l,a			;883c
	ld a,(hl)			;883d
	and a			;883e
	jr nz,L_8839		;883f
	ld a,l			;8841
	sub 008h		;8842
	ld l,a			;8844
	ld a,l			;8845
	sub 088h		;8846
	inc bc			;8848
	ld (bc),a			;8849
	dec de			;884a
	ld (de),a			;884b
	ret			;884c
L_884D:
	ld a,(0efc1h)		;884d
	add a,a			;8850
	push af			;8851
	add a,c			;8852
	ld c,a			;8853
	pop af			;8854
	add a,e			;8855
	ld e,a			;8856
	ld a,l			;8857
	sub 088h		;8858
	ld (bc),a			;885a
	ld (de),a			;885b
L_885C:
	inc hl			;885c
	ld a,(hl)			;885d
	and a			;885e
	jr nz,L_885C		;885f
	dec hl			;8861
	ld a,l			;8862
	sub 088h		;8863
	inc bc			;8865
	ld (bc),a			;8866
	dec de			;8867
	ld (de),a			;8868
	ret			;8869
L_886A:
	push af			;886a
	call 04ebeh		;886b
	pop af			;886e
	call 041bfh		;886f
	ld hl,0bb38h		;8872
	call 04d4ch		;8875
	ld de,00000h		;8878
	ld b,060h		;887b
	ld a,(0f0f4h)		;887d
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
	rla			;888c
	push af			;888d
	ld a,c			;888e
	call c,05767h		;888f
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
	call 0418ah		;88a4
	call 04eb1h		;88a7
	ret			;88aa
L_88AB:
	ld a,(0e25bh)		;88ab
	dec a			;88ae
	call 04099h		;88af

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
	call L_8908		;88be
	call 05bebh		;88c1
	xor a			;88c4
	call L_886A		;88c5
	call 041bfh		;88c8
	ld hl,0be14h		;88cb
	call 051d0h		;88ce
	ld a,(0f0f9h)		;88d1
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
	pop af			;88e9
	rra			;88ea
	ld hl,0be3ah		;88eb
	ld c,0ffh		;88ee
	call c,051dah		;88f0
	call 0418ah		;88f3
	xor a			;88f6
	ld (0e26dh),a		;88f7
	ld (0e26eh),a		;88fa
	ld (0e27fh),a		;88fd
	ld (0e21eh),a		;8900
L_8903:
	ld hl,0e25bh		;8903
	inc (hl)			;8906
	ret			;8907
L_8908:
	ld hl,0e270h		;8908
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
	call L_897A		;8917
	ld hl,0e26dh		;891a
	ld a,(0e207h)		;891d
	rra			;8920
	jr c,L_8973		;8921
	rra			;8923
	jr c,L_8960		;8924
	rra			;8926
	rra			;8927
	rra			;8928
	ret nc			;8929
	call 05d41h		;892a
	call L_8903		;892d
	call L_89CD		;8930
	call 04e98h		;8933
	xor a			;8936
	call L_886A		;8937
	call 041bfh		;893a
	ld a,(0f0f8h)		;893d
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
	call 051d0h		;895a
	jp 0418ah		;895d
L_8960:
	ld a,(0f0f9h)		;8960
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
	ld a,(hl)			;8973
	and a			;8974
	ret z			;8975
	dec (hl)			;8976
	jp 042cbh		;8977
L_897A:
	ld hl,0e800h		;897a
	ld a,(0e26dh)		;897d
	add a,a			;8980
	add a,a			;8981
	add a,a			;8982
	add a,a			;8983
	add a,050h		;8984
	ld (hl),a			;8986
	inc hl			;8987
	ld (hl),048h		;8988
	inc hl			;898a
	ld (hl),014h		;898b
	inc hl			;898d
L_898E:
	ld (hl),008h		;898e
	ld a,(0f0f4h)		;8990
	and a			;8993
	ret z			;8994
	ld hl,0d200h		;8995
	ld de,0d201h		;8998
	ld bc,00010h		;899b
	ld (hl),007h		;899e
	ldir		;89a0
	ret			;89a2
L_89A3:
	xor a			;89a3
	call L_886A		;89a4
	call 041bfh		;89a7
	ld hl,0be5ch		;89aa
	call 051d0h		;89ad
	ld hl,0be44h		;89b0
	call 051d0h		;89b3
	ld hl,0be4ch		;89b6
	call 051d0h		;89b9
	ld hl,0be54h		;89bc
	call 051d0h		;89bf
	call 0418ah		;89c2
	ld a,003h		;89c5
	ld (0f0e5h),a		;89c7
	jp L_8903		;89ca
L_89CD:
	ld a,(0e26dh)		;89cd
	ld b,a			;89d0
	ld a,(0f0f9h)		;89d1
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
	ld (0f0f8h),a		;89e5
	ret			;89e8
L_89E9:
	call L_8A38		;89e9
	and a			;89ec
	ret z			;89ed
	dec a			;89ee
	jp nz,L_8B50		;89ef
	ld a,0e0h		;89f2
	ld a,(0edeeh)		;89f4
	call 04e98h		;89f7
	ld a,(0f0f8h)		;89fa
	cp 002h		;89fd
	jr z,L_89A3		;89ff
	xor a			;8a01
	call L_886A		;8a02
	call L_8903		;8a05
	call 041bfh		;8a08
	ld hl,0bde9h		;8a0b
	call 051d0h		;8a0e
	call 0418ah		;8a11
L_8A14:
	ld de,06058h		;8a14
L_8A17:
	ld hl,0e270h		;8a17
L_8A1A:
	ld b,008h		;8a1a
L_8A1C:
	push bc			;8a1c
	ld a,(hl)			;8a1d
	cp 020h		;8a1e
	ld b,000h		;8a20
	jr z,L_8A27		;8a22
	add a,0a0h		;8a24
	ld b,a			;8a26
L_8A27:
	ld a,b			;8a27
	push hl			;8a28
	push de			;8a29
	call 0576ah		;8a2a
	pop de			;8a2d
	pop hl			;8a2e
	ld a,d			;8a2f
	add a,008h		;8a30
	ld d,a			;8a32
	inc hl			;8a33
	pop bc			;8a34
	djnz L_8A1C		;8a35
	ret			;8a37
L_8A38:
	ld a,004h		;8a38
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
	ld a,(0f0f8h)		;8a54
	cp 002h		;8a57
	jp z,L_8AD1		;8a59
L_8A5C:
	call L_8ABB		;8a5c
	call 06c2eh		;8a5f
	call 06b8eh		;8a62
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
	call 042cbh		;8a7e
	pop af			;8a81
	inc (hl)			;8a82
L_8A83:
	ld hl,0e270h		;8a83
	call 0408fh		;8a86
	ld (hl),b			;8a89
	call L_8A14		;8a8a
L_8A8D:
	ld a,(0e207h)		;8a8d
	rra			;8a90
	rra			;8a91
	rra			;8a92
	jr c,L_8AB1		;8a93
	rra			;8a95
	jr c,L_8AA6		;8a96
	ld a,(0e20ch)		;8a98
	rla			;8a9b
	ret nc			;8a9c
	call 05d41h		;8a9d
	call 041e0h		;8aa0
	jp L_8903		;8aa3
L_8AA6:
	ld hl,0e26eh		;8aa6
	ld a,(hl)			;8aa9
	cp 007h		;8aaa
	ret nc			;8aac
	inc (hl)			;8aad
	jp 042cbh		;8aae
L_8AB1:
	ld hl,0e26eh		;8ab1
	ld a,(hl)			;8ab4
	and a			;8ab5
	ret z			;8ab6
	dec (hl)			;8ab7
	jp 042cbh		;8ab8
L_8ABB:
	ld hl,0e800h		;8abb
	ld (hl),057h		;8abe
	inc hl			;8ac0
	ld a,(0e26eh)		;8ac1
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
	call L_8B07		;8ad1
	ret nc			;8ad4
	ld a,(0e26eh)		;8ad5
	add a,a			;8ad8
	add a,a			;8ad9
	add a,a			;8ada
	ld hl,08aefh		;8adb
	call 0408fh		;8ade
	ld de,0e270h		;8ae1
	ld bc,00008h		;8ae4
	ldir		;8ae7
	call 041e0h		;8ae9
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
	call L_8B2C		;8b07
	ld hl,0e26eh		;8b0a
	ld a,(0e207h)		;8b0d
	rra			;8b10
	jr c,L_8B1F		;8b11
	rra			;8b13
	jr c,L_8B24		;8b14
	rra			;8b16
	rra			;8b17
	rra			;8b18
	ret c			;8b19
	ld a,(0e20ch)		;8b1a
	rla			;8b1d
	ret			;8b1e
L_8B1F:
	ld a,(hl)			;8b1f
	and a			;8b20
	ret z			;8b21
	dec (hl)			;8b22
	ret			;8b23
L_8B24:
	ld a,(0f0e5h)		;8b24
	dec a			;8b27
	cp (hl)			;8b28
	ret z			;8b29
	inc (hl)			;8b2a
	ret			;8b2b
L_8B2C:
	ld hl,0e800h		;8b2c
	ld a,(0e26eh)		;8b2f
	add a,a			;8b32
	add a,a			;8b33
	add a,a			;8b34
	add a,a			;8b35
	add a,050h		;8b36
	ld (hl),a			;8b38
	inc hl			;8b39
	ld (hl),058h		;8b3a
	inc hl			;8b3c
	ld (hl),014h		;8b3d
	inc hl			;8b3f
	jp L_898E		;8b40
L_8B43:
	call L_8B72		;8b43
	call 04230h		;8b46
	ld a,(0e27fh)		;8b49
	cp 002h		;8b4c
	jr z,L_8B57		;8b4e
L_8B50:
	xor a			;8b50
	ld (0e25bh),a		;8b51
	jp 04e98h		;8b54
L_8B57:
	ld a,(0f0f8h)		;8b57
	dec a			;8b5a
	jr z,L_8B6F		;8b5b
	call 05d41h		;8b5d
	call 04e98h		;8b60
	call 041bfh		;8b63
	ld hl,0be6ah		;8b66
	call 051d0h		;8b69
	call 0418ah		;8b6c
L_8B6F:
	jp L_8903		;8b6f
L_8B72:
	ld a,(0f0f8h)		;8b72
	or a			;8b75
	jr z,L_8B7F		;8b76
	dec a			;8b78
	jp z,L_9C20		;8b79
	jp 06c3dh		;8b7c
L_8B7F:
	call 041b5h		;8b7f
	call 0bf2bh		;8b82
	jp 0418ah		;8b85
L_8B88:
	ld a,(0e207h)		;8b88
	and a			;8b8b
	ret z			;8b8c
	ld a,001h		;8b8d
	ld (0e25bh),a		;8b8f
	jp 04e98h		;8b92
L_8B95:
	ld a,(0e25bh)		;8b95
	dec a			;8b98
	call 04099h		;8b99

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
	call 04e98h		;8bac
	xor a			;8baf
	call L_886A		;8bb0
	call 041bfh		;8bb3
	ld hl,0bd6dh		;8bb6
	call 051d0h		;8bb9
	call 0418ah		;8bbc
	call L_8F0C		;8bbf
	call 07969h		;8bc2
L_8BC5:
	ld hl,0e25bh		;8bc5
	inc (hl)			;8bc8
	ret			;8bc9
L_8BCA:
	call L_8C33		;8bca
	ld hl,0e26dh		;8bcd
	ld a,(0e207h)		;8bd0
	ld b,a			;8bd3
	and 003h		;8bd4
	jr z,L_8BDF		;8bd6
	ld a,(hl)			;8bd8
	xor 001h		;8bd9
	ld (hl),a			;8bdb
	jp 042cbh		;8bdc
L_8BDF:
	ld a,b			;8bdf
	and 010h		;8be0
	ret z			;8be2
	ld a,(hl)			;8be3
	and a			;8be4
	jr nz,L_8C2E		;8be5
L_8BE7:
	call 04e98h		;8be7
	xor a			;8bea
	call L_886A		;8beb
	call 041bfh		;8bee
	ld hl,0bdb9h		;8bf1
	call 051d0h		;8bf4
	call 0418ah		;8bf7
	ld a,(0f0f9h)		;8bfa
	rra			;8bfd
	ld de,06060h		;8bfe
	push af			;8c01
	jr nc,L_8C18		;8c02
	call 041bfh		;8c04
	ld hl,0bdd5h		;8c07
	ld c,0ffh		;8c0a
	push de			;8c0c
	call 051dah		;8c0d
	pop de			;8c10
	ld a,e			;8c11
	add a,010h		;8c12
	ld e,a			;8c14
	call 0418ah		;8c15
L_8C18:
	pop af			;8c18
	rra			;8c19
	call 041bfh		;8c1a
	ld hl,0bddfh		;8c1d
	ld c,0ffh		;8c20
	call c,051dah		;8c22
	call 0418ah		;8c25
	xor a			;8c28
	ld (0e26dh),a		;8c29
	jr L_8BC5		;8c2c
L_8C2E:
	xor a			;8c2e
	ld (0e25bh),a		;8c2f
	ret			;8c32
L_8C33:
	ld hl,0e800h		;8c33
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
	call L_898E		;8c48
	ret			;8c4b
L_8C4C:
	ld a,001h		;8c4c
	ld (0e25bh),a		;8c4e
	ret			;8c51
L_8C52:
	ld a,(0e20ch)		;8c52
	rla			;8c55
	rla			;8c56
	jr c,L_8C4C		;8c57
	call L_897A		;8c59
	ld hl,0e26dh		;8c5c
	ld a,(0e207h)		;8c5f
	rra			;8c62
	jr c,L_8C8E		;8c63
	rra			;8c65
	jr c,L_8C7B		;8c66
	rra			;8c68
	rra			;8c69
	rra			;8c6a
	ret nc			;8c6b
	call L_89CD		;8c6c
	call 05d41h		;8c6f
	call 04e98h		;8c72
	call L_8BC5		;8c75
	jp 041e0h		;8c78
L_8C7B:
	ld a,(0f0f9h)		;8c7b
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
	ld a,(0f0f8h)		;8c95
	dec a			;8c98
	jp z,L_8D31		;8c99
	dec a			;8c9c
	jr z,L_8CB5		;8c9d
	xor a			;8c9f
	call L_886A		;8ca0
	call 041bfh		;8ca3
	ld hl,0bde9h		;8ca6
	call 051d0h		;8ca9
	call 0418ah		;8cac
	call 04230h		;8caf
	jp L_8BC5		;8cb2
L_8CB5:
	call 06e2dh		;8cb5
	ld a,(0f0e5h)		;8cb8
	and a			;8cbb
	jr z,L_8D1A		;8cbc
	xor a			;8cbe
	call L_886A		;8cbf
	call 041bfh		;8cc2
	ld hl,0be5ch		;8cc5
	call 051d0h		;8cc8
	call 0418ah		;8ccb
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
	call 041bfh		;8cdd
	call L_8CFA		;8ce0
	call 0418ah		;8ce3
	pop bc			;8ce6
	pop de			;8ce7
	pop hl			;8ce8
	ld a,e			;8ce9
	add a,010h		;8cea
	ld e,a			;8cec
L_8CED:
	ld a,008h		;8ced
	call 0408fh		;8cef
	djnz L_8CD6		;8cf2
	call L_8BC5		;8cf4
	jp 04230h		;8cf7
L_8CFA:
	sub 031h		;8cfa
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
	call 04e98h		;8d1a
	call 041b5h		;8d1d
	ld hl,0af7dh		;8d20
	call 051d0h		;8d23
	call 0418ah		;8d26
	ld a,007h		;8d29
	ld (0e25bh),a		;8d2b
	jp 04230h		;8d2e
L_8D31:
	call L_9CAB		;8d31
	ld a,(0f0e5h)		;8d34
	and a			;8d37
	jr z,L_8D1A		;8d38
	call L_8BC5		;8d3a
	call 04230h		;8d3d
L_8D40:
	call 04e98h		;8d40
	ld a,001h		;8d43
	call L_886A		;8d45
	call 041bfh		;8d48
	ld hl,0bd86h		;8d4b
	call 051d0h		;8d4e
	call 0418ah		;8d51
	ld hl,0ee50h		;8d54
	ld de,03020h		;8d57
	ld b,008h		;8d5a
L_8D5C:
	push bc			;8d5c
	push hl			;8d5d
	push de			;8d5e
	call L_8A1A		;8d5f
	pop de			;8d62
	pop hl			;8d63
	pop bc			;8d64
	ld a,00bh		;8d65
	call 0408fh		;8d67
	ld a,(hl)			;8d6a
	and a			;8d6b
	ret z			;8d6c
	push bc			;8d6d
	push hl			;8d6e
	push de			;8d6f
	ld d,0a0h		;8d70
	call L_8A1A		;8d72
	pop de			;8d75
	pop hl			;8d76
	pop bc			;8d77
	ld a,00bh		;8d78
	call 0408fh		;8d7a
	ld a,(hl)			;8d7d
	and a			;8d7e
	ret z			;8d7f
	ld a,e			;8d80
	add a,010h		;8d81
	ld e,a			;8d83
	djnz L_8D5C		;8d84
	ret			;8d86
L_8D87:
	ld a,(0e20ch)		;8d87
	rla			;8d8a
	rla			;8d8b
	jp c,L_8C4C		;8d8c
	ld a,(0f0f8h)		;8d8f
	and a			;8d92
	jp z,L_8A5C		;8d93
	dec a			;8d96
	jp nz,L_8E5A		;8d97
	ld a,(0e207h)		;8d9a
	and 020h		;8d9d
	jr nz,L_8DEF		;8d9f
	call L_8E39		;8da1
	ld a,(0f0e5h)		;8da4
	ld b,a			;8da7
	ld hl,0e26eh		;8da8
	ld a,(0e207h)		;8dab
	rra			;8dae
	jr c,L_8E11		;8daf
	rra			;8db1
	jr c,L_8E1A		;8db2
	rra			;8db4
	jr c,L_8E24		;8db5
	rra			;8db7
	jr c,L_8E2E		;8db8
	ld a,(0e20ch)		;8dba
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
	ld hl,0ee50h		;8dc9
	call 0408fh		;8dcc
	ld de,0e270h		;8dcf
	ld bc,0000bh		;8dd2
	ldir		;8dd5
	call 04e98h		;8dd7
	call 05d41h		;8dda
	call 041bfh		;8ddd
	ld hl,0be06h		;8de0
	call 051d0h		;8de3
	call 0418ah		;8de6
	call 041e0h		;8de9
	jp L_8BC5		;8dec
L_8DEF:
	call 041e0h		;8def
	ld a,008h		;8df2
L_8DF4:
	ld (0e25bh),a		;8df4
	ret			;8df7
L_8DF8:
	call L_9CAB		;8df8
	call L_8D40		;8dfb
	xor a			;8dfe
	ld (0e26eh),a		;8dff
	call 04230h		;8e02
	ld a,(0e200h)		;8e05
	cp 00bh		;8e08
	ld a,005h		;8e0a
	jr z,L_8DF4		;8e0c
	dec a			;8e0e
	jr L_8DF4		;8e0f
L_8E11:
	ld a,(hl)			;8e11
	cp 002h		;8e12
	ret c			;8e14
	dec (hl)			;8e15
	dec (hl)			;8e16
	jp 042cbh		;8e17
L_8E1A:
	ld a,(hl)			;8e1a
	inc a			;8e1b
	inc a			;8e1c
	cp b			;8e1d
	ret nc			;8e1e
	inc (hl)			;8e1f
	inc (hl)			;8e20
	jp 042cbh		;8e21
L_8E24:
	ld a,(hl)			;8e24
	rra			;8e25
	ret nc			;8e26
	ld a,(hl)			;8e27
	and a			;8e28
	ret z			;8e29
	dec (hl)			;8e2a
	jp 042cbh		;8e2b
L_8E2E:
	ld a,(hl)			;8e2e
	rra			;8e2f
	ret c			;8e30
	ld a,(hl)			;8e31
	inc a			;8e32
	cp b			;8e33
	ret nc			;8e34
	inc (hl)			;8e35
	jp 042cbh		;8e36
L_8E39:
	ld de,0e26eh		;8e39
	ld hl,0e800h		;8e3c
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
	call L_898E		;8e56
	ret			;8e59
L_8E5A:
	call L_8B07		;8e5a
	ret nc			;8e5d
	ld hl,0e270h		;8e5e
	ld de,0e271h		;8e61
	ld bc,00007h		;8e64
	ld (hl),020h		;8e67
	ldir		;8e69
	ld a,(0e26eh)		;8e6b
	add a,a			;8e6e
	add a,a			;8e6f
	add a,a			;8e70
	ld hl,0ee50h		;8e71
	call 0408fh		;8e74
	ld de,0e270h		;8e77
	ld bc,00005h		;8e7a
	ldir		;8e7d
	call 05d41h		;8e7f
	call 041e0h		;8e82
	jp L_8BC5		;8e85
L_8E88:
	call L_8EA3		;8e88
	ld a,001h		;8e8b
	ld (0e27eh),a		;8e8d
	call 04230h		;8e90
	ld a,(0e27fh)		;8e93
	cp 002h		;8e96
	jp z,L_8BC5		;8e98
	call 04e98h		;8e9b
	xor a			;8e9e
	ld (0e25bh),a		;8e9f
	ret			;8ea2
L_8EA3:
	ld a,(0f0f8h)		;8ea3
	or a			;8ea6
	jr z,L_8EB0		;8ea7
	dec a			;8ea9
	jp z,L_9B98		;8eaa
	jp 06c55h		;8ead
L_8EB0:
	call 041b5h		;8eb0
	call 0be7eh		;8eb3
	jp 0418ah		;8eb6
L_8EB9:
	ld a,(0e207h)		;8eb9
	and a			;8ebc
	ret z			;8ebd
	ld a,002h		;8ebe
	ld (0e27eh),a		;8ec0
	call 04e98h		;8ec3
	xor a			;8ec6
	ld (0e25bh),a		;8ec7
	ret			;8eca
L_8ECB:
	call 067ech		;8ecb
	call 05d41h		;8ece
	xor a			;8ed1
	ld (0e24ah),a		;8ed2
	inc a			;8ed5
	ld (0e25bh),a		;8ed6
	ret			;8ed9
L_8EDA:
	ld a,(0e25bh)		;8eda
	dec a			;8edd
	call 04099h		;8ede

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
	ld a,001h		;8ef1
	ld (0e241h),a		;8ef3
	call 05634h		;8ef6
	ld a,(0f0f4h)		;8ef9
	and a			;8efc
	call nz,0565eh		;8efd
	call 07aa6h		;8f00
	call L_8F0C		;8f03
	call 07969h		;8f06
	jp L_8BE7		;8f09
L_8F0C:
	xor a			;8f0c
	ld hl,0e226h		;8f0d
	ld de,0e227h		;8f10
	ld bc,00032h		;8f13
	ld (hl),a			;8f16
	ldir		;8f17
	ld hl,0e280h		;8f19
	ld de,0e281h		;8f1c
	ld bc,00d7fh		;8f1f
	ld (hl),a			;8f22
	ldir		;8f23
	ld (0e26dh),a		;8f25
	ld (0e26eh),a		;8f28
	ld (0e27fh),a		;8f2b
	ld (0e26fh),a		;8f2e
	ld (0e27eh),a		;8f31
	jp 05d41h		;8f34
L_8F37:
	call L_8F72		;8f37
	jp L_8BC5		;8f3a
L_8F3D:
	call L_8EA3		;8f3d
	ld a,(0e27fh)		;8f40
	and a			;8f43
	jp nz,L_8BC5		;8f44
	call 05de6h		;8f47
	call L_92CA		;8f4a
	call L_921A		;8f4d
	call L_878B		;8f50
	ld a,001h		;8f53
	ld (0e24ah),a		;8f55
	ld (0e254h),a		;8f58
	ld a,(0e282h)		;8f5b
	or a			;8f5e
	ret nz			;8f5f
	ld (0e294h),a		;8f60
	ret			;8f63
L_8F64:
	ld a,(0e207h)		;8f64
	and a			;8f67
	ret z			;8f68
	call 04e98h		;8f69
	ld a,002h		;8f6c
	ld (0e24ah),a		;8f6e
	ret			;8f71
L_8F72:
	call 05696h		;8f72
	call 0594fh		;8f75
	call 058d2h		;8f78
	xor a			;8f7b
	ld hl,0e2c0h		;8f7c
	ld de,0e2c1h		;8f7f
	ld bc,00d3fh		;8f82
	ld (hl),a			;8f85
	ldir		;8f86
	ld (0e287h),a		;8f88
	ld (0edcdh),a		;8f8b
	inc a			;8f8e
	ld (0e241h),a		;8f8f
	call 05d41h		;8f92
	ret			;8f95
L_8F96:
	call 041bfh		;8f96
	ld a,(0e242h)		;8f99
	ld b,a			;8f9c
	add a,a			;8f9d
	add a,b			;8f9e
	ld hl,0b8f8h		;8f9f
	call 0408fh		;8fa2
	ld de,0e2f1h		;8fa5
	ldi		;8fa8
	ldi		;8faa
	ld a,(hl)			;8fac
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
	call 0418ah		;8fb8
	jp 07d86h		;8fbb
L_8FBE:
	ld hl,0e2f3h		;8fbe
	ld a,(0e243h)		;8fc1
	cp (hl)			;8fc4
	ret nz			;8fc5
	ld a,(0e2f5h)		;8fc6
	and a			;8fc9
	ret nz			;8fca
	ld a,(0e282h)		;8fcb
	ld b,a			;8fce
	ld a,(0e284h)		;8fcf
	ld c,a			;8fd2
	ld a,(0e2f1h)		;8fd3
	add a,012h		;8fd6
	sub b			;8fd8
	cp 004h		;8fd9
	ret nc			;8fdb
	ld a,(0e2f2h)		;8fdc
	add a,00ah		;8fdf
	sub c			;8fe1
	cp 004h		;8fe2
	ret nc			;8fe4
	call L_907F		;8fe5
	xor a			;8fe8
	ld (0e2f0h),a		;8fe9
	ld hl,0e257h		;8fec
	ld (hl),a			;8fef
	inc hl			;8ff0
	ld (hl),a			;8ff1
	inc hl			;8ff2
	ld (hl),a			;8ff3
	inc a			;8ff4
	ld (0e249h),a		;8ff5
	ld hl,0e2f7h		;8ff8
	ld (hl),01eh		;8ffb
	call 0428ah		;8ffd
	call 05687h		;9000
	xor a			;9003
	ld (0e21bh),a		;9004
	call 0723dh		;9007
	ld bc,00007h		;900a
	jp 00047h		;900d   ; BIOS WRTVDP - Writes data in the VDP-register
L_9010:
	ld a,(0e2f3h)		;9010
	ld b,a			;9013
	ld a,(0e243h)		;9014
	cp b			;9017
	ret nz			;9018
	ld hl,09340h		;9019
	ld a,(0e2f6h)		;901c
	add a,a			;901f
	add a,a			;9020
	add a,a			;9021
	add a,a			;9022
	call 0408fh		;9023
	ld bc,00404h		;9026
	ld de,(0e2f1h)		;9029
L_902D:
	push bc			;902d
	push de			;902e
	ld b,c			;902f
L_9030:
	ld a,(hl)			;9030
	push hl			;9031
	call 05767h		;9032
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
	ld de,(0e2f4h)		;9045
	ld a,d			;9049
	and a			;904a
	ret z			;904b
	call 041bfh		;904c
	ld a,e			;904f
	ld hl,0b9adh		;9050
	call 04d4ch		;9053
	ld b,d			;9056
L_9057:
	ld de,(0e2f1h)		;9057
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
	ld a,(0f0f4h)		;9069
	and a			;906c
	ld a,060h		;906d
	jr z,L_9073		;906f
	ld a,0aeh		;9071
L_9073:
	push hl			;9073
	call 05767h		;9074
	pop hl			;9077
	inc hl			;9078
	djnz L_9057		;9079
	call 0418ah		;907b
	ret			;907e
L_907F:
	ld hl,0e500h		;907f
	ld de,0e501h		;9082
	ld bc,000ffh		;9085
	ld (hl),000h		;9088
	ldir		;908a
	ld hl,0e300h		;908c
	ld de,0e301h		;908f
	ld bc,001ffh		;9092
	ld (hl),000h		;9095
	ldir		;9097
	call 05d41h		;9099
	jp 04ecbh		;909c
L_909F:
	push ix		;909f
	call L_90AB		;90a1
	pop ix		;90a4
	call L_924A		;90a6
	jr L_90F7		;90a9
L_90AB:
	ld hl,0ee50h		;90ab
	ld b,040h		;90ae
L_90B0:
	ld a,(hl)			;90b0
	or a			;90b1
	ret z			;90b2
	call L_927D		;90b3
	ld a,(ix+000h)		;90b6
	or a			;90b9
	jr z,L_90D6		;90ba
	and 0f0h		;90bc
	jr z,L_90C7		;90be
	cp 0f0h		;90c0
	jr nz,L_90D6		;90c2
	call L_90DA		;90c4
L_90C7:
	ld a,(0e243h)		;90c7
	cp (ix+003h)		;90ca
	jr nz,L_90D6		;90cd
	push hl			;90cf
	push bc			;90d0
	call L_90E3		;90d1
	pop bc			;90d4
	pop hl			;90d5
L_90D6:
	inc hl			;90d6
	djnz L_90B0		;90d7
	ret			;90d9
L_90DA:
	ld a,(ix+000h)		;90da
	and 01fh		;90dd
	ld (ix+000h),a		;90df
	ret			;90e2
L_90E3:
	ld l,(ix+004h)		;90e3
	ld h,(ix+005h)		;90e6
	ld e,(ix+001h)		;90e9
	ld d,(ix+002h)		;90ec
	ld bc,01010h		;90ef
	ld a,001h		;90f2
	jp 05029h		;90f4
L_90F7:
	ld hl,0ee8fh		;90f7
	ld b,040h		;90fa
L_90FC:
	ld a,(hl)			;90fc
	or a			;90fd
	jr z,L_9112		;90fe
	call L_927D		;9100
	ld a,(0e243h)		;9103
	cp (ix+003h)		;9106
	jr nz,L_9112		;9109
	push bc			;910b
	push hl			;910c
	call L_9116		;910d
	pop hl			;9110
	pop bc			;9111
L_9112:
	dec hl			;9112
	djnz L_90FC		;9113
	ret			;9115
L_9116:
	ld a,(ix+000h)		;9116
	or a			;9119
	ret z			;911a
	and 0f0h		;911b
	ret nz			;911d
	call L_913A		;911e
	ld hl,09328h		;9121
	ld a,(ix+000h)		;9124
	dec a			;9127
	add a,a			;9128
	add a,a			;9129
	ld e,a			;912a
	ld d,000h		;912b
	add hl,de			;912d
	ld e,(ix+001h)		;912e
	ld d,(ix+002h)		;9131
	ld bc,00202h		;9134
	jp 0573bh		;9137
L_913A:
	call L_9151		;913a
	ld (ix+004h),e		;913d
	ld (ix+005h),d		;9140
	ld l,(ix+001h)		;9143
	ld h,(ix+002h)		;9146
	ld bc,01010h		;9149
	ld a,004h		;914c
	jp 05029h		;914e
L_9151:
	push ix		;9151
	pop hl			;9153
	ld de,0e300h		;9154
	and a			;9157
	sbc hl,de		;9158
	ld a,l			;915a
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
	ld a,l			;9167
	rla			;9168
	and 0f8h		;9169
	ld d,a			;916b
	ret			;916c
L_916D:
	call L_9196		;916d
	ld hl,0e300h		;9170
	ld de,0e810h		;9173
	ld b,040h		;9176
L_9178:
	push bc			;9178
	push hl			;9179
	ld a,(hl)			;917a
	and 00fh		;917b
	cp 003h		;917d
	jr nc,L_918D		;917f
	ld a,(hl)			;9181
	rra			;9182
	rra			;9183
	rra			;9184
	rra			;9185
	and 00fh		;9186
	cp 002h		;9188
	call nc,L_91A4		;918a
L_918D:
	pop hl			;918d
	ld bc,00008h		;918e
	add hl,bc			;9191
	pop bc			;9192
	djnz L_9178		;9193
	ret			;9195
L_9196:
	ld b,00ch		;9196
	ld hl,0e810h		;9198
L_919B:
	ld (hl),0e0h		;919b
	ld de,00004h		;919d
	add hl,de			;91a0
	djnz L_919B		;91a1
	ret			;91a3
L_91A4:
	push de			;91a4
	call L_91B2		;91a5
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
	ld a,(hl)			;91b2
	ex af,af'			;91b3
	ld a,(0e243h)		;91b4
	inc l			;91b7
	ldi		;91b8
	ldi		;91ba
	cp (hl)			;91bc
	jr nz,L_9214		;91bd
	inc l			;91bf
	ld a,(hl)			;91c0
	ld hl,09296h		;91c1
	call 0408fh		;91c4
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
	ex af,af'			;91dd
	and 00fh		;91de
	dec a			;91e0
	add a,a			;91e1
	ld hl,09292h		;91e2
	call 0408fh		;91e5
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
	ld hl,0d200h		;91f7
	call 0408fh		;91fa
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
	dec de			;9214
	dec de			;9215
	ld a,0e0h		;9216
	ld (de),a			;9218
	ret			;9219
L_921A:
	ld ix,0e300h		;921a
	ld hl,0ee50h		;921e
	ld bc,04001h		;9221
	ld de,00008h		;9224
L_9227:
	ld a,(ix+000h)		;9227
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
	call L_925E		;9237
	ld a,c			;923a
	or a			;923b
	ret z			;923c
	ld b,000h		;923d
	ld d,h			;923f
	ld e,l			;9240
	ld a,(hl)			;9241
	dec hl			;9242
	lddr		;9243
	ld hl,0ee50h		;9245
	ld (hl),a			;9248
	ret			;9249
L_924A:
	call L_925E		;924a
	ld d,h			;924d
	ld e,l			;924e
	ld b,(hl)			;924f
	inc hl			;9250
	ld a,(hl)			;9251
	or a			;9252
	ret z			;9253
	push bc			;9254
L_9255:
	ldi		;9255
	ld a,(hl)			;9257
	or a			;9258
	jr nz,L_9255		;9259
	pop af			;925b
	ld (de),a			;925c
	ret			;925d
L_925E:
	push ix		;925e
	pop hl			;9260
	ld de,0e300h		;9261
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
	ld hl,0ee50h		;9274
L_9277:
	cp (hl)			;9277
	ret z			;9278
	inc hl			;9279
	inc c			;927a
	jr L_9277		;927b
L_927D:
	push hl			;927d
	call L_9283		;927e
	pop hl			;9281
	ret			;9282
L_9283:
	dec a			;9283
	ld l,a			;9284
	ld h,000h		;9285
	add hl,hl			;9287
	add hl,hl			;9288
	add hl,hl			;9289
	ld de,0e300h		;928a
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
	ld hl,0e280h		;929d
	ld de,0e281h		;92a0
	ld (hl),000h		;92a3
	ld bc,00040h		;92a5
	ldir		;92a8
	call 041bfh		;92aa
	ld a,(0e242h)		;92ad
	ld b,a			;92b0
	add a,a			;92b1
	add a,b			;92b2
	ld hl,0b844h		;92b3
	call 0408fh		;92b6
	ld a,(hl)			;92b9
	ld (0e282h),a		;92ba
	inc hl			;92bd
	ld a,(hl)			;92be
	ld (0e284h),a		;92bf
	inc hl			;92c2
	ld a,(hl)			;92c3
	ld (0e243h),a		;92c4
	call 0418ah		;92c7
L_92CA:
	ld hl,092f7h		;92ca
	ld de,0e28ah		;92cd
	ld bc,00008h		;92d0
	ldir		;92d3
	ld a,004h		;92d5
	ld (0e296h),a		;92d7
	ld a,001h		;92da
	ld (0e285h),a		;92dc
	ld a,(0e202h)		;92df
	and 040h		;92e2
	ld a,00eh		;92e4
	jr nz,L_92E9		;92e6
	xor a			;92e8
L_92E9:
	ld (0e280h),a		;92e9
	ld a,020h		;92ec
	ld (0e2a8h),a		;92ee
	ld a,006h		;92f1
	ld (0e2a4h),a		;92f3
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
	xor a			;92ff
	ld (0e295h),a		;9300
	ld (0e285h),a		;9303
	ld a,(0e280h)		;9306
	cp 004h		;9309
	jr nz,L_9312		;930b
	ld a,004h		;930d
	ld (0e285h),a		;930f
L_9312:
	ld a,001h		;9312
	ld (0e298h),a		;9314
	ld hl,0e215h		;9317
	ld (hl),000h		;931a
	ld a,003h		;931c
	ld (0e296h),a		;931e
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
	ld a,(0e2f9h)		;93be
	cp 003h		;93c1
	ret c			;93c3
	ld ix,0e600h		;93c4
	ld b,010h		;93c8
L_93CA:
	push bc			;93ca
	ld a,(ix+000h)		;93cb
	cp 005h		;93ce
	call z,L_93DC		;93d0
	ld bc,00010h		;93d3
	add ix,bc		;93d6
	pop bc			;93d8
	djnz L_93CA		;93d9
	ret			;93db
L_93DC:
	ld a,(ix+003h)		;93dc
	cp 010h		;93df
	jr nc,L_93E9		;93e1
	ld (ix+003h),010h		;93e3
	jr L_93F0		;93e7
L_93E9:
	cp 0e8h		;93e9
	ret c			;93eb
	ld (ix+003h),0e0h		;93ec
L_93F0:
	jp L_95A1		;93f0
L_93F3:
	ld a,(ix+001h)		;93f3
	call 04099h		;93f6

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
	call L_9549		;93ff
	jr nc,L_940E		;9402
	ld a,002h		;9404
	ld (ix+001h),a		;9406
	dec a			;9409
	ld (ix+006h),a		;940a
	ret			;940d
L_940E:
	ld a,(0e243h)		;940e
	cp (ix+004h)		;9411
	ret nz			;9414
	ld a,(0e280h)		;9415
	and a			;9418
	ret nz			;9419
	ld a,(0e282h)		;941a
	add a,00fh		;941d
	sub (ix+002h)		;941f
	cp 010h		;9422
	jr nc,L_9464		;9424
	ld a,(0e294h)		;9426
	and a			;9429
	ld a,(0e284h)		;942a
	ld b,(ix+003h)		;942d
	jr z,L_944C		;9430
	add a,014h		;9432
	sub b			;9434
	cp 008h		;9435
	jr nc,L_9464		;9437
	ld a,(0e208h)		;9439
	and 008h		;943c
	jr z,L_9464		;943e
	dec (ix+006h)		;9440
	ret nz			;9443
	res 1,(ix+007h)		;9444
L_9448:
	inc (ix+001h)		;9448
	ret			;944b
L_944C:
	sub 00ch		;944c
	sub b			;944e
	cp 008h		;944f
	jr nc,L_9464		;9451
	ld a,(0e208h)		;9453
	and 004h		;9456
	jr z,L_9464		;9458
	dec (ix+006h)		;945a
	ret nz			;945d
	set 1,(ix+007h)		;945e
	jr L_9448		;9462
L_9464:
	ld (ix+006h),00ah		;9464
	ret			;9468
L_9469:
	bit 1,(ix+007h)		;9469
	ld bc,00002h		;946d
	jr nz,L_9475		;9470
	ld bc,0f003h		;9472
L_9475:
	ld a,(ix+003h)		;9475
	cp b			;9478
	jr z,L_94B3		;9479
	call L_9543		;947b
	jr nc,L_94AD		;947e
	bit 1,(ix+007h)		;9480
	ld a,(ix+003h)		;9484
	ld (ix+00bh),a		;9487
	jr nz,L_9490		;948a
	add a,008h		;948c
	jr L_9492		;948e
L_9490:
	sub 008h		;9490
L_9492:
	ld (ix+003h),a		;9492
	set 0,(ix+007h)		;9495
	call 0428fh		;9499
	ld l,(ix+002h)		;949c
	ld (ix+00ah),l		;949f
	call L_9549		;94a2
	jr nc,L_94AD		;94a5
	ld (ix+006h),001h		;94a7
	jr L_9448		;94ab
L_94AD:
	xor a			;94ad
	ld (ix+001h),a		;94ae
	jr L_9464		;94b1
L_94B3:
	set 0,(ix+007h)		;94b3
	bit 1,(ix+007h)		;94b7
	ld bc,01004h		;94bb
	jr z,L_94C3		;94be
	ld bc,0e003h		;94c0
L_94C3:
	push bc			;94c3
	ld h,(ix+003h)		;94c4
	ld l,(ix+002h)		;94c7
	ld (ix+003h),b		;94ca
	call L_95DA		;94cd
	call L_9601		;94d0
	pop bc			;94d3
	call L_94DA		;94d4
	jp L_94AD		;94d7
L_94DA:
	push bc			;94da
	call L_969A		;94db
	call L_94EB		;94de
	pop bc			;94e1
	ld b,a			;94e2
	ld a,c			;94e3
	call 05e38h		;94e4
	ld (ix+004h),l		;94e7
	ret			;94ea
L_94EB:
	ld a,(ix+004h)		;94eb
	ld hl,0e788h		;94ee
	ld bc,03000h		;94f1
L_94F4:
	cp (hl)			;94f4
	jr z,L_94FD		;94f5
	inc c			;94f7
	inc hl			;94f8
	djnz L_94F4		;94f9
	ld c,000h		;94fb
L_94FD:
	ld a,c			;94fd
	ret			;94fe
L_94FF:
	dec (ix+006h)		;94ff
	ret nz			;9502
	ld (ix+006h),002h		;9503
	set 0,(ix+007h)		;9507
	ld a,(ix+002h)		;950b
	ld (ix+00ah),a		;950e
	add a,008h		;9511
	ld (ix+002h),a		;9513
	ld e,a			;9516
	ld h,(ix+003h)		;9517
	ld (ix+00bh),h		;951a
	cp 0b8h		;951d
	jr nc,L_952E		;951f
	cp 0b0h		;9521
	ret nc			;9523
	call L_9549		;9524
	ret c			;9527
	call 04294h		;9528
	jp L_94AD		;952b
L_952E:
	ld h,(ix+00bh)		;952e
	ld l,(ix+00ah)		;9531
	ld (ix+002h),000h		;9534
	call L_95DA		;9538
	call L_9601		;953b
	ld c,002h		;953e
	jp L_94DA		;9540
L_9543:
	call L_9564		;9543
	jp L_9933		;9546
L_9549:
	call L_9564		;9549
	ld bc,00410h		;954c
	add hl,bc			;954f
	push hl			;9550
	push de			;9551
	call L_98E6		;9552
	pop de			;9555
	pop hl			;9556
	cp 001h		;9557
	ret nc			;9559
	ld a,h			;955a
	add a,008h		;955b
	ld h,a			;955d
	call L_98E6		;955e
	cp 001h		;9561
	ret			;9563
L_9564:
	ld a,(ix+004h)		;9564
	call L_9571		;9567
	ld h,(ix+003h)		;956a
	ld l,(ix+002h)		;956d
	ret			;9570
L_9571:
	ld l,a			;9571
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
	ld de,0e900h		;957f
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
	ld h,(ix+003h)		;95a1
	ld l,(ix+002h)		;95a4
	call L_95DA		;95a7
	ld a,(ix+004h)		;95aa
	ld (ix+009h),a		;95ad
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
	call L_98E6		;95c4
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
	call L_98E6		;95d2
	pop bc			;95d5
	pop de			;95d6
	ld (bc),a			;95d7
	inc bc			;95d8
	ret			;95d9
L_95DA:
	exx			;95da
	ld a,(ix+004h)		;95db
	call L_9571		;95de
	ld (0e2fch),de		;95e1
	push ix		;95e5
	pop hl			;95e7
	ld a,l			;95e8
	and 0f0h		;95e9
	rrca			;95eb
	rrca			;95ec
	ld hl,0ef40h		;95ed
	call 0408fh		;95f0
	ld (0e2feh),hl		;95f3
	exx			;95f6
	ret			;95f7
L_95F8:
	ld h,(ix+003h)		;95f8
	ld l,(ix+002h)		;95fb
	call L_95DA		;95fe
L_9601:
	ld a,(ix+004h)		;9601
	cp (ix+009h)		;9604
	ret nz			;9607
	ld de,(0e2feh)		;9608
	push hl			;960c
	call L_9615		;960d
	pop hl			;9610
	ld a,l			;9611
	add a,008h		;9612
	ld l,a			;9614
L_9615:
	push hl			;9615
	push de			;9616
	ld a,(de)			;9617
	ld d,(ix+004h)		;9618
	ld bc,00101h		;961b
	call 063edh		;961e
	pop de			;9621
	pop hl			;9622
	inc de			;9623
	ld a,h			;9624
	add a,008h		;9625
	ld h,a			;9627
	ld a,(de)			;9628
	push de			;9629
	ld d,(ix+004h)		;962a
	ld bc,00101h		;962d
	call 063edh		;9630
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
	ld hl,09370h		;9652
	ld d,(ix+003h)		;9655
	ld e,(ix+002h)		;9658
	ld bc,00202h		;965b
	jp 0573bh		;965e
L_9661:
	call L_9666		;9661
	jr L_9652		;9664
L_9666:
	ld h,(ix+003h)		;9666
	ld l,(ix+002h)		;9669
	ld (ix+00bh),h		;966c
	ld (ix+00ah),l		;966f
	ld a,(0f0f4h)		;9672
	and a			;9675
	jr nz,L_9686		;9676
	call 04d7bh		;9678
	push ix		;967b
	pop de			;967d
	ld a,00ch		;967e
	call 04094h		;9680
	jp 05722h		;9683
L_9686:
	push ix		;9686
	pop de			;9688
	ld a,e			;9689
	add a,a			;968a
	ld d,a			;968b
	ld e,040h		;968c
	jr nc,L_9692		;968e
	ld e,050h		;9690
L_9692:
	ld bc,01010h		;9692
	ld a,004h		;9695
	jp 05029h		;9697
L_969A:
	ld d,(ix+00bh)		;969a
	ld e,(ix+00ah)		;969d
L_96A0:
	ld a,(0e243h)		;96a0
	cp (ix+009h)		;96a3
	ret nz			;96a6
	push ix		;96a7
	pop hl			;96a9
	ld a,(0f0f4h)		;96aa
	and a			;96ad
	jr nz,L_96BB		;96ae
	ld a,00ch		;96b0
	call 0408fh		;96b2
	ld bc,00202h		;96b5
	jp 0573bh		;96b8
L_96BB:
	push ix		;96bb
	pop hl			;96bd
	ld a,l			;96be
	add a,a			;96bf
	ld h,a			;96c0
	ld l,040h		;96c1
	jr nc,L_96C7		;96c3
	ld l,050h		;96c5
L_96C7:
	ld bc,01010h		;96c7
	ld a,001h		;96ca
	jp 05029h		;96cc
L_96CF:
	ld ix,0e600h		;96cf
	ld b,010h		;96d3
L_96D5:
	push bc			;96d5
	ld a,(ix+000h)		;96d6
	cp 005h		;96d9
	call z,L_96E7		;96db
	ld bc,00010h		;96de
	add ix,bc		;96e1
	pop bc			;96e3
	djnz L_96D5		;96e4
	ret			;96e6
L_96E7:
	ld a,(0e243h)		;96e7
	cp (ix+004h)		;96ea
	ret nz			;96ed
	call L_95DA		;96ee
	ld h,(ix+003h)		;96f1
	ld l,(ix+002h)		;96f4
	push hl			;96f7
	pop hl			;96f8
	call L_9666		;96f9
	jp L_9652		;96fc
L_96FF:
	ld ix,0e600h		;96ff
	ld b,010h		;9703
L_9705:
	push bc			;9705
	ld a,(ix+000h)		;9706
	cp 005h		;9709
	call z,L_9717		;970b
	ld bc,00010h		;970e
	add ix,bc		;9711
	pop bc			;9713
	djnz L_9705		;9714
	ret			;9716
L_9717:
	ld a,(0e243h)		;9717
	cp (ix+004h)		;971a
	ret nz			;971d
	call L_95DA		;971e
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
	push bc			;975e
	call L_9DE7		;975f
	pop bc			;9762
	ld b,000h		;9763
	ld a,c			;9765
	add a,a			;9766
	ld c,a			;9767
	call 041b5h		;9768
	ld hl,0af52h		;976b
	add hl,bc			;976e
	ld a,(hl)			;976f
	inc hl			;9770
	ld h,(hl)			;9771
	ld l,a			;9772
	push hl			;9773
	call 04e98h		;9774
	pop hl			;9777
	call 051d0h		;9778
	ld hl,0af60h		;977b
	call 051d0h		;977e
	call 0418ah		;9781
	call L_9E1D		;9784
	ld a,(0f0e4h)		;9787
	ld (0fd9fh),a		;978a
	ld a,002h		;978d
	ld (0e27fh),a		;978f
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
	call 041bfh		;97b2
	call L_97BB		;97b5
	jp 0418ah		;97b8
L_97BB:
	ld ix,0e300h		;97bb
	ld hl,0afb1h		;97bf
	ld a,(0e242h)		;97c2
	dec a			;97c5
	call 04d4ch		;97c6
L_97C9:
	call L_97D4		;97c9
	ret z			;97cc
	ld de,00008h		;97cd
	add ix,de		;97d0
	jr L_97C9		;97d2
L_97D4:
	ld a,(hl)			;97d4
	cp 0ffh		;97d5
	ret z			;97d7
	and 00fh		;97d8
	ld (ix+000h),a		;97da
	ld a,(hl)			;97dd
	rra			;97de
	rra			;97df
	rra			;97e0
	rra			;97e1
	and 00fh		;97e2
	ld (ix+003h),a		;97e4
	inc hl			;97e7
	ld a,(hl)			;97e8
	ld (ix+001h),a		;97e9
	inc hl			;97ec
	ld a,(hl)			;97ed
	ld (ix+002h),a		;97ee
	inc hl			;97f1
	xor a			;97f2
	ld (ix+004h),a		;97f3
	ld (ix+005h),a		;97f6
	ld (ix+006h),a		;97f9
	ld (ix+007h),a		;97fc
	inc a			;97ff
	ret			;9800
L_9801:
	ld a,(0e2b0h)		;9801
	call 04099h		;9804

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
	ld hl,0e2b0h		;980f
	ld (hl),001h		;9812
	inc hl			;9814
	ld (hl),020h		;9815
	inc hl			;9817
	inc hl			;9818
	ld (hl),000h		;9819
	ret			;981b
L_981C:
	ld hl,0e2b1h		;981c
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
	ld c,003h		;9831
	call L_984B		;9833
	ld a,(0e2b2h)		;9836
	cp 010h		;9839
	ret nz			;983b
	ld a,003h		;983c
	ld (0e2b3h),a		;983e
	ld hl,0e2b0h		;9841
	inc (hl)			;9844
	ret			;9845
L_9846:
	ld c,007h		;9846
	jp L_984B		;9848
L_984B:
	ld hl,0e2b1h		;984b
	dec (hl)			;984e
	ret nz			;984f
	ld a,(0e2b2h)		;9850
	ld (hl),a			;9853
	inc hl			;9854
	inc hl			;9855
	ld a,(hl)			;9856
	xor c			;9857
	ld (hl),a			;9858
	rra			;9859
	ret c			;985a
	ld a,(0e2b2h)		;985b
	cp 005h		;985e
	ret c			;9860
	dec a			;9861
	ld (0e2b2h),a		;9862
	ret			;9865
L_9866:
	ld a,(0e280h)		;9866
	cp 00eh		;9869
	jr nz,L_9881		;986b
	ld a,(0e2a8h)		;986d
	rra			;9870
	jr c,L_9881		;9871
	ld hl,0e800h		;9873
	ld de,0e801h		;9876
	ld (hl),0e0h		;9879
	ld bc,0000fh		;987b
	ldir		;987e
	ret			;9880
L_9881:
	ld b,000h		;9881
	ld hl,0e800h		;9883
	ld a,(0e282h)		;9886
	sub 009h		;9889
	ld d,a			;988b
	ld a,(0e284h)		;988c
	ld e,a			;988f
	ld a,(0e280h)		;9890
	cp 002h		;9893
	jr z,L_989F		;9895
	ld a,(0e294h)		;9897
	or a			;989a
	jr z,L_989F		;989b
	inc e			;989d
	inc e			;989e
L_989F:
	ld (hl),d			;989f
	inc hl			;98a0
	ld (hl),e			;98a1
	inc hl			;98a2
	ld (hl),b			;98a3
	inc hl			;98a4
	inc hl			;98a5
	ld a,b			;98a6
	add a,004h		;98a7
	ld b,a			;98a9
	ld a,b			;98aa
	cp 010h		;98ab
	jr z,L_98B9		;98ad
	cp 008h		;98af
	jr nz,L_989F		;98b1
	ld a,d			;98b3
	add a,010h		;98b4
	ld d,a			;98b6
	jr L_989F		;98b7
L_98B9:
	ld hl,0d200h		;98b9
	ld de,0d201h		;98bc
	ld bc,0000fh		;98bf
	ld (hl),00dh		;98c2
	ldir		;98c4
	call L_98D2		;98c6
	inc hl			;98c9
	inc de			;98ca
	ld bc,0000fh		;98cb
	ld (hl),00dh		;98ce
	ldir		;98d0
L_98D2:
	inc hl			;98d2
	inc de			;98d3
	ld bc,0000fh		;98d4
	ld (hl),04eh		;98d7
	ldir		;98d9
	ret			;98db
L_98DC:
	push hl			;98dc
	call L_98E2		;98dd
	pop hl			;98e0
	ret			;98e1
L_98E2:
	ld de,(0e250h)		;98e2
L_98E6:
	ld a,l			;98e6
	and 0f8h		;98e7
	ld l,a			;98e9
	ld a,h			;98ea
	and 0f8h		;98eb
	ld h,000h		;98ed
	add hl,de			;98ef
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
	ld a,b			;98fe
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
	push bc			;9910
	call L_995A		;9911
	push hl			;9914
	call L_98E2		;9915
	pop hl			;9918
	pop bc			;9919
	sub 002h		;991a
	ret nc			;991c
	push bc			;991d
	call L_998E		;991e
	push hl			;9921
	call L_98E2		;9922
	pop hl			;9925
	pop bc			;9926
	sub 002h		;9927
	ret nc			;9929
	call L_998E		;992a
	call L_98E2		;992d
	sub 002h		;9930
	ret			;9932
L_9933:
	push bc			;9933
	call L_995A		;9934
	push hl			;9937
	push de			;9938
	call L_98E6		;9939
	pop de			;993c
	pop hl			;993d
	pop bc			;993e
	sub 002h		;993f
	ret nc			;9941
	push bc			;9942
	call L_998E		;9943
	push hl			;9946
	push de			;9947
	call L_98E6		;9948
	pop de			;994b
	pop hl			;994c
	pop bc			;994d
	sub 002h		;994e
	ret nc			;9950
	call L_998E		;9951
	call L_98E6		;9954
	sub 002h		;9957
	ret			;9959
L_995A:
	ld a,c			;995a
	dec a			;995b
	jr z,L_9970		;995c
	dec a			;995e
	jr z,L_997E		;995f
	dec a			;9961
	jr z,L_9986		;9962
	ld a,h			;9964
	add a,002h		;9965
	ld h,a			;9967
	ld a,l			;9968
	sub 001h		;9969
	ld l,a			;996b
	ret nc			;996c
	ld l,000h		;996d
	ret			;996f
L_9970:
	ld a,h			;9970
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
	ld a,h			;997e
	sub 001h		;997f
	ld h,a			;9981
	ret nc			;9982
	ld h,000h		;9983
	ret			;9985
L_9986:
	ld a,h			;9986
	add a,010h		;9987
	ld h,a			;9989
	ret nc			;998a
	ld h,0f8h		;998b
	ret			;998d
L_998E:
	ld a,c			;998e
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
	call L_9A0B		;999d
	ld a,(0e243h)		;99a0
	ld c,a			;99a3
	ld b,010h		;99a4
	ld hl,0e700h		;99a6
L_99A9:
	ld a,(hl)			;99a9
	and a			;99aa
	jr z,L_99C4		;99ab
	inc l			;99ad
	ld a,(hl)			;99ae
	cp c			;99af
	jr nz,L_99C4		;99b0
	inc l			;99b2
	ld a,(hl)			;99b3
	sub e			;99b4
	add a,00ch		;99b5
	cp 018h		;99b7
	jr nc,L_99C4		;99b9
	inc l			;99bb
	ld a,(hl)			;99bc
	sub d			;99bd
	add a,00ch		;99be
	cp 018h		;99c0
	jr c,L_99CD		;99c2
L_99C4:
	ld a,008h		;99c4
	add a,l			;99c6
	and 0f8h		;99c7
	ld l,a			;99c9
	djnz L_99A9		;99ca
	ret			;99cc
L_99CD:
	push hl			;99cd
	call L_96FF		;99ce
	call L_90AB		;99d1
	pop hl			;99d4
	ld d,(hl)			;99d5
	dec l			;99d6
	ld e,(hl)			;99d7
	dec l			;99d8
	dec l			;99d9
	ld (hl),000h		;99da
	ld bc,00202h		;99dc
	call 056deh		;99df
	ld hl,0e2f5h		;99e2
	dec (hl)			;99e5
	jr nz,L_99F8		;99e6
	call 04212h		;99e8
	xor a			;99eb
	ld (0e216h),a		;99ec
	dec a			;99ef
	ld (0e215h),a		;99f0
	ld a,010h		;99f3
	ld (0e21bh),a		;99f5
L_99F8:
	call 0425dh		;99f8
	call L_9010		;99fb
	call L_90F7		;99fe
	call L_96CF		;9a01
	ld de,00500h		;9a04
	call 04c20h		;9a07
	ret			;9a0a
L_9A0B:
	ld a,(0e282h)		;9a0b
	ld e,a			;9a0e
	ld a,(0e284h)		;9a0f
	ld d,a			;9a12
	ret			;9a13
L_9A14:
	ld a,(0e248h)		;9a14
	or a			;9a17
	ret nz			;9a18
	ld a,(0e287h)		;9a19
	or a			;9a1c
	ret nz			;9a1d
	ld hl,0ee50h		;9a1e
L_9A21:
	ld a,(hl)			;9a21
	or a			;9a22
	ret z			;9a23
	call L_927D		;9a24
	ld a,(0e243h)		;9a27
	cp (ix+003h)		;9a2a
	jr nz,L_9A42		;9a2d
	ld a,(ix+000h)		;9a2f
	and a			;9a32
	jr z,L_9A42		;9a33
	and 0f0h		;9a35
	jr nz,L_9A42		;9a37
	push hl			;9a39
	push bc			;9a3a
	call L_9A46		;9a3b
	pop bc			;9a3e
	pop hl			;9a3f
	jr c,$+83		;9a40
L_9A42:
	inc hl			;9a42
	djnz L_9A21		;9a43
	ret			;9a45
L_9A46:
	ld a,(0e282h)		;9a46
	sub (ix+001h)		;9a49
	jr nc,L_9A53		;9a4c
	neg		;9a4e
	cp 008h		;9a50
	ret nc			;9a52
L_9A53:
	cp 00dh		;9a53
	ret nc			;9a55
	ld b,000h		;9a56
	ld a,(0e284h)		;9a58
	rla			;9a5b
	rl b		;9a5c
	sla b		;9a5e
	ld a,(ix+002h)		;9a60
	rlca			;9a63
	and 001h		;9a64
	add a,b			;9a66
	call 04099h		;9a67

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
	ld a,(0e284h)		;9a72
	sub (ix+002h)		;9a75
	jr nc,L_9A7C		;9a78
	neg		;9a7a
L_9A7C:
	cp 00eh		;9a7c
	ret			;9a7e
L_9A7F:
	ld a,(0e284h)		;9a7f
	ld b,a			;9a82
	ld a,(ix+002h)		;9a83
	sub b			;9a86
	cp 00eh		;9a87
	ret			;9a89
L_9A8A:
	ld a,(0e284h)		;9a8a
	sub (ix+002h)		;9a8d
	cp 00eh		;9a90
	ret			;9a92
L_9A93:
	push ix		;9a93
	call L_96FF		;9a95
	pop ix		;9a98
	ld a,(ix+000h)		;9a9a
	and 00fh		;9a9d
	ld (0e287h),a		;9a9f
	or 0f0h		;9aa2
	ld (ix+000h),a		;9aa4
	call 04258h		;9aa7
	call L_909F		;9aaa
	call L_96CF		;9aad
	ret			;9ab0
L_9AB1:
	ld a,(0e255h)		;9ab1
	and a			;9ab4
	ret nz			;9ab5
	ld a,(0e298h)		;9ab6
	or a			;9ab9
	ret nz			;9aba
	ld ix,0e500h		;9abb
	ld b,008h		;9abf
L_9AC1:
	ld a,(0e243h)		;9ac1
	cp (ix+010h)		;9ac4
	jr nz,L_9AEB		;9ac7
	bit 0,(ix+013h)		;9ac9
	jr z,L_9AEB		;9acd
	ld a,(0e282h)		;9acf
	add a,008h		;9ad2
	sub (ix+003h)		;9ad4
	cp 010h		;9ad7
	jr nc,L_9AEB		;9ad9
	ld a,(0e284h)		;9adb
	add a,00ah		;9ade
	jr c,L_9AEB		;9ae0
	sub (ix+005h)		;9ae2
	jr c,L_9AEB		;9ae5
	cp 014h		;9ae7
	jr c,L_9AF3		;9ae9
L_9AEB:
	ld de,00020h		;9aeb
	add ix,de		;9aee
	djnz L_9AC1		;9af0
	ret			;9af2
L_9AF3:
	ld a,005h		;9af3
	ld (0e280h),a		;9af5
	call L_92FF		;9af8
	jp 042a3h		;9afb
L_9AFE:
	ld ix,0e300h		;9afe
	ld b,040h		;9b02
L_9B04:
	exx			;9b04
	ld a,(ix+000h)		;9b05
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
	ld l,(ix+001h)		;9b1b
	ld h,(ix+002h)		;9b1e
	ld c,(ix+003h)		;9b21
	ld iy,0e500h		;9b24
	ld b,008h		;9b28
L_9B2A:
	ld a,(iy+000h)		;9b2a
	and a			;9b2d
	jr z,L_9B54		;9b2e
	bit 1,(iy+013h)		;9b30
	jr z,L_9B54		;9b34
	ld a,c			;9b36
	cp (iy+010h)		;9b37
	jr nz,L_9B54		;9b3a
	ld a,l			;9b3c
	add a,00ch		;9b3d
	sub (iy+003h)		;9b3f
	cp 018h		;9b42
	jr nc,L_9B54		;9b44
	ld a,(iy+005h)		;9b46
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
	push ix		;9b64
	pop hl			;9b66
	ld (0e2e8h),hl		;9b67
	push iy		;9b6a
	pop ix		;9b6c
	ld a,001h		;9b6e
	ld (0edcdh),a		;9b70
	call L_9B80		;9b73
	ld de,00100h		;9b76
	call 04c20h		;9b79
	call 04299h		;9b7c
	ret			;9b7f
L_9B80:
	ld a,(ix+000h)		;9b80
	cp 004h		;9b83
	jp z,0b8c5h		;9b85
	ld hl,06611h		;9b88
	push hl			;9b8b
	cp 003h		;9b8c
	ret nc			;9b8e
	ld a,(ix+001h)		;9b8f
	cp 002h		;9b92
	ret nc			;9b94
	jp 0ae6fh		;9b95
L_9B98:
	di			;9b98
	ld a,(0fd9fh)		;9b99
	ld (0f0e4h),a		;9b9c
	ld a,0c9h		;9b9f
	ld (0fd9fh),a		;9ba1
	ld (0f0e2h),sp		;9ba4
	call L_9DB3		;9ba8
	ld hl,0c270h		;9bab
	ld de,0ce00h		;9bae
	call L_9D51		;9bb1
	call L_9CE3		;9bb4
	call L_9D26		;9bb7
	call L_9BCC		;9bba
	call L_9D05		;9bbd
	di			;9bc0
	call L_9DE7		;9bc1
	ld a,(0f0e4h)		;9bc4
	ld (0fd9fh),a		;9bc7
	ei			;9bca
	ret			;9bcb
L_9BCC:
	ld de,0c243h		;9bcc
	ld c,01ah		;9bcf
	call 0f37dh		;9bd1
	ld hl,00001h		;9bd4
	call L_9DA3		;9bd7
	ld de,0c25ch		;9bda
	ld c,01ah		;9bdd
	call 0f37dh		;9bdf
	ld hl,00023h		;9be2
	call L_9DA3		;9be5
	ld de,0c282h		;9be8
	ld c,01ah		;9beb
	call 0f37dh		;9bed
	ld hl,00003h		;9bf0
	call L_9DA3		;9bf3
	ld de,0c2c0h		;9bf6
	ld c,01ah		;9bf9
	call 0f37dh		;9bfb
	ld hl,00240h		;9bfe
	call L_9DA3		;9c01
	ld de,0c600h		;9c04
	ld c,01ah		;9c07
	call 0f37dh		;9c09
	ld hl,00200h		;9c0c
	call L_9DA3		;9c0f
	ld de,0c900h		;9c12
	ld c,01ah		;9c15
	call 0f37dh		;9c17
	ld hl,004c0h		;9c1a
	jp L_9DA3		;9c1d
L_9C20:
	di			;9c20
	ld a,(0fd9fh)		;9c21
	ld (0f0e4h),a		;9c24
	ld a,0c9h		;9c27
	ld (0fd9fh),a		;9c29
	ld (0f0e2h),sp		;9c2c
	call L_9DB3		;9c30
	ld hl,0c270h		;9c33
	ld de,0ce00h		;9c36
	call L_9D65		;9c39
	call L_9E27		;9c3c
	call L_9CF3		;9c3f
	call L_9D26		;9c42
	call L_9C57		;9c45
	call L_9D05		;9c48
	di			;9c4b
	call L_9DE7		;9c4c
	ld a,(0f0e4h)		;9c4f
	ld (0fd9fh),a		;9c52
	ei			;9c55
	ret			;9c56
L_9C57:
	ld de,0c243h		;9c57
	ld c,01ah		;9c5a
	call 0f37dh		;9c5c
	ld hl,00001h		;9c5f
	call L_9D93		;9c62
	ld de,0c25ch		;9c65
	ld c,01ah		;9c68
	call 0f37dh		;9c6a
	ld hl,00023h		;9c6d
	call L_9D93		;9c70
	ld de,0c282h		;9c73
	ld c,01ah		;9c76
	call 0f37dh		;9c78
	ld hl,00003h		;9c7b
	call L_9D93		;9c7e
	ld de,0c2c0h		;9c81
	ld c,01ah		;9c84
	call 0f37dh		;9c86
	ld hl,00240h		;9c89
	call L_9D93		;9c8c
	ld de,0c600h		;9c8f
	ld c,01ah		;9c92
	call 0f37dh		;9c94
	ld hl,00200h		;9c97
	call L_9D93		;9c9a
	ld de,0c900h		;9c9d
	ld c,01ah		;9ca0
	call 0f37dh		;9ca2
	ld hl,004c0h		;9ca5
	jp L_9D93		;9ca8
L_9CAB:
	di			;9cab
	ld a,(0fd9fh)		;9cac
	ld (0f0e4h),a		;9caf
	ld a,0c9h		;9cb2
	ld (0fd9fh),a		;9cb4
	ld (0f0e2h),sp		;9cb7
	call L_9DB3		;9cbb
	ld hl,09797h		;9cbe
	ld (0f323h),hl		;9cc1
	call L_9EA8		;9cc4
	call L_9D43		;9cc7
	xor a			;9cca
	ld (0d0e5h),a		;9ccb
	call L_9E33		;9cce
	di			;9cd1
	ld hl,(0d0e7h)		;9cd2
	ld (0f323h),hl		;9cd5
	call L_9DE7		;9cd8
	ld a,(0f0e4h)		;9cdb
	ld (0fd9fh),a		;9cde
	ei			;9ce1
	ret			;9ce2
L_9CE3:
	ld de,(0d0e0h)		;9ce3
	ld c,00fh		;9ce7
	call 0f37dh		;9ce9
	ld c,001h		;9cec
	inc a			;9cee
	jp z,L_975E		;9cef
	ret			;9cf2
L_9CF3:
	ld de,(0d0e0h)		;9cf3
	di			;9cf7
	ld c,016h		;9cf8
	call 0f37dh		;9cfa
	ei			;9cfd
	ld c,003h		;9cfe
	inc a			;9d00
	jp z,L_975E		;9d01
	ret			;9d04
L_9D05:
	ld de,(0d0e0h)		;9d05
	ld c,010h		;9d09
	call 0f37dh		;9d0b
	ld c,002h		;9d0e
	inc a			;9d10
	jp z,L_975E		;9d11
	ret			;9d14
L_9D15:
	ld hl,0ce00h		;9d15
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
	ld hl,(0d0e0h)		;9d26
	ld bc,0000ch		;9d29
	add hl,bc			;9d2c
	ld (hl),b			;9d2d
	inc hl			;9d2e
	ld (hl),b			;9d2f
	inc hl			;9d30
	ld bc,00001h		;9d31
	ld (hl),c			;9d34
	inc hl			;9d35
	ld (hl),b			;9d36
	ld bc,00011h		;9d37
	add hl,bc			;9d3a
	ld b,005h		;9d3b
	xor a			;9d3d
L_9D3E:
	ld (hl),a			;9d3e
	inc hl			;9d3f
	djnz L_9D3E		;9d40
	ret			;9d42
L_9D43:
	ld hl,0ce50h		;9d43
	ld de,0ce51h		;9d46
	ld (hl),000h		;9d49
	ld bc,000afh		;9d4b
	ldir		;9d4e
	ret			;9d50
L_9D51:
	ld (0d0e0h),de		;9d51
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
	ld (0d0e0h),de		;9d65
	xor a			;9d69
	ld (de),a			;9d6a
	inc de			;9d6b
	push de			;9d6c
	push hl			;9d6d
	ld h,d			;9d6e
	ld l,e			;9d6f
	inc de			;9d70
	ld (hl),000h		;9d71
	ld bc,0000bh		;9d73
	ldir		;9d76
	pop hl			;9d78
	pop de			;9d79
	ld b,00bh		;9d7a
L_9D7C:
	ld a,(hl)			;9d7c
	or a			;9d7d
	jr nz,L_9D83		;9d7e
	inc hl			;9d80
	djnz L_9D7C		;9d81
L_9D83:
	ld c,b			;9d83
	ld b,000h		;9d84
	ldir		;9d86
	ld de,0ce0ch		;9d88
	xor a			;9d8b
	ld b,019h		;9d8c
	ld (de),a			;9d8e
	inc de			;9d8f
	djnz L_9D60		;9d90
	ret			;9d92
L_9D93:
	ld de,(0d0e0h)		;9d93
	ld c,026h		;9d97
	call 0f37dh		;9d99
	ld c,004h		;9d9c
	or a			;9d9e
	jp nz,L_975E		;9d9f
	ret			;9da2
L_9DA3:
	ld de,(0d0e0h)		;9da3
	ld c,027h		;9da7
	call 0f37dh		;9da9
	ld c,000h		;9dac
	or a			;9dae
	jp nz,L_975E		;9daf
	ret			;9db2
L_9DB3:
	ld hl,0f100h		;9db3
	ld de,0d780h		;9db6
	ld bc,00280h		;9db9
	ldir		;9dbc
	ld de,0f0ffh		;9dbe
	ld hl,0d0ffh		;9dc1
	exx			;9dc4
	ld de,0f37fh		;9dc5
	ld bc,01100h		;9dc8
L_9DCB:
	exx			;9dcb
	ld b,(hl)			;9dcc
	ld a,(de)			;9dcd
	dec de			;9dce
	ld (hl),a			;9dcf
	dec hl			;9dd0
	ld a,b			;9dd1
	exx			;9dd2
	ld (de),a			;9dd3
	dec de			;9dd4
	dec bc			;9dd5
	ld a,b			;9dd6
	or c			;9dd7
	jr nz,L_9DCB		;9dd8
	ld hl,00000h		;9dda
	ld (0f1c0h),hl		;9ddd
	ld hl,0972ch		;9de0
	ld (0f323h),hl		;9de3
	ret			;9de6
L_9DE7:
	call L_9E13		;9de7
	ld de,0e000h		;9dea
	ld hl,0c000h		;9ded
	exx			;9df0
	ld de,0e280h		;9df1
	ld bc,01100h		;9df4
L_9DF7:
	exx			;9df7
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
	ld de,0f100h		;9e07
	ld hl,0d780h		;9e0a
	ld bc,00280h		;9e0d
	ldir		;9e10
	ret			;9e12
L_9E13:
	ld b,000h		;9e13
L_9E15:
	push bc			;9e15
	call 0d0eah		;9e16
	pop bc			;9e19
	djnz L_9E15		;9e1a
	ret			;9e1c
L_9E1D:
	ld b,000h		;9e1d
L_9E1F:
	push bc			;9e1f
	call 0f0eah		;9e20
	pop bc			;9e23
	djnz L_9E1F		;9e24
	ret			;9e26
L_9E27:
	ld hl,0ce09h		;9e27
	ld (hl),045h		;9e2a
	inc hl			;9e2c
	ld (hl),04ch		;9e2d
	inc hl			;9e2f
	ld (hl),047h		;9e30
	ret			;9e32
L_9E33:
	ld de,0ce25h		;9e33
	ld c,01ah		;9e36
	call 0f37dh		;9e38
	ld hl,0c26fh		;9e3b
	ld a,(hl)			;9e3e
	and a			;9e3f
	ld de,0ce00h		;9e40
	jr nz,L_9E4F		;9e43
	inc (hl)			;9e45
	ld c,011h		;9e46
	call 0f37dh		;9e48
	inc a			;9e4b
	ret z			;9e4c
	jr L_9E5D		;9e4d
L_9E4F:
	ld c,012h		;9e4f
	call 0f37dh		;9e51
	inc a			;9e54
	jr nz,L_9E5D		;9e55
	xor a			;9e57
	ld (0c26fh),a		;9e58
	jr L_9E33		;9e5b
L_9E5D:
	ld hl,0d0e5h		;9e5d
	inc (hl)			;9e60
	push hl			;9e61
	call L_9E7B		;9e62
	pop hl			;9e65
	ld a,(hl)			;9e66
	cp 010h		;9e67
	jr z,L_9E76		;9e69
	ld de,0ce00h		;9e6b
	ld c,012h		;9e6e
	call 0f37dh		;9e70
	inc a			;9e73
	jr nz,L_9E5D		;9e74
L_9E76:
	ld a,(0d0e5h)		;9e76
	or a			;9e79
	ret			;9e7a
L_9E7B:
	ld de,0ce26h		;9e7b
	ld a,(0d0e5h)		;9e7e
	dec a			;9e81
	call L_9E8C		;9e82
	ex de,hl			;9e85
	ld bc,0000bh		;9e86
	ldir		;9e89
	ret			;9e8b
L_9E8C:
	ld l,a			;9e8c
	ld h,000h		;9e8d
	ld b,h			;9e8f
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
	ld hl,0ce25h		;9ea8
	ld de,0ce26h		;9eab
	ld (hl),000h		;9eae
	ld bc,00024h		;9eb0
	ldir		;9eb3
	call L_9D15		;9eb5
	ld hl,09e9dh		;9eb8
	ld de,0ce01h		;9ebb
	ld bc,0000bh		;9ebe
	ldir		;9ec1
	ret			;9ec3
L_9EC4:
	call L_9ECA		;9ec4
	jp 0a67ch		;9ec7
L_9ECA:
	ld a,(0e280h)		;9eca
	call 04099h		;9ecd

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
	call 0a624h		;9eee
	call 0a4efh		;9ef1
	call L_9F4D		;9ef4
	call 0a512h		;9ef7
	jr nz,L_9F02		;9efa
	call 0a45eh		;9efc
	jp nz,L_9FD4		;9eff
L_9F02:
	call 0a045h		;9f02
	ld a,(0e280h)		;9f05
	or a			;9f08
	ret nz			;9f09
	call L_9F77		;9f0a
	ld a,(0e280h)		;9f0d
	or a			;9f10
	ret nz			;9f11
	ld a,(0e288h)		;9f12
	and 00ch		;9f15
	jr z,L_9F3F		;9f17
L_9F19:
	ld hl,0e296h		;9f19
	dec (hl)			;9f1c
	ret nz			;9f1d
	ld (hl),004h		;9f1e
L_9F20:
	ld a,(0e295h)		;9f20
	inc a			;9f23
	and 003h		;9f24
	ld b,a			;9f26
	ld (0e295h),a		;9f27
	ld a,(0e294h)		;9f2a
	or a			;9f2d
	ld hl,09f45h		;9f2e
	jr z,L_9F36		;9f31
	ld hl,09f49h		;9f33
L_9F36:
	ld a,b			;9f36
	call 0408fh		;9f37
	ld a,(hl)			;9f3a
	ld (0e285h),a		;9f3b
	ret			;9f3e
L_9F3F:
	ld a,001h		;9f3f
	ld (0e296h),a		;9f41
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
	ld a,(0e2a6h)		;9f4d
	or a			;9f50
	ret z			;9f51
	ld a,(0e282h)		;9f52
	add a,010h		;9f55
	ld l,a			;9f57
	ld a,(0e294h)		;9f58
	or a			;9f5b
	ld a,(0e284h)		;9f5c
	jr z,L_9F63		;9f5f
	add a,00fh		;9f61
L_9F63:
	ld h,a			;9f63
	call L_98E2		;9f64
	sub 002h		;9f67
	ret c			;9f69
	ld a,(0e282h)		;9f6a
	and 0f8h		;9f6d
	ld (0e282h),a		;9f6f
	xor a			;9f72
	ld (0e2a6h),a		;9f73
	ret			;9f76
L_9F77:
	call 0a452h		;9f77
	jr c,L_9F95		;9f7a
	ld a,(0e207h)		;9f7c
	bit 4,a		;9f7f
	jp nz,0a008h		;9f81
	ld a,(0e208h)		;9f84
	rra			;9f87
	jr nc,L_9F8F		;9f88
	call 0a5a2h		;9f8a
	jr L_9F95		;9f8d
L_9F8F:
	rra			;9f8f
	jr nc,L_9F9A		;9f90
	call 0a591h		;9f92
L_9F95:
	ld a,(0e280h)		;9f95
	or a			;9f98
	ret nz			;9f99
L_9F9A:
	ld a,(0e288h)		;9f9a
	ld de,(0e28eh)		;9f9d
	ld c,002h		;9fa1
	bit 2,a		;9fa3
	jr nz,L_9FB0		;9fa5
	ld de,(0e290h)		;9fa7
	ld c,003h		;9fab
	bit 3,a		;9fad
	ret z			;9faf
L_9FB0:
	push bc			;9fb0
	ld hl,(0e283h)		;9fb1
	add hl,de			;9fb4
	push hl			;9fb5
	ld a,(0e282h)		;9fb6
	ld l,a			;9fb9
	call L_9910		;9fba
	pop hl			;9fbd
	pop bc			;9fbe
	jr c,L_9FD0		;9fbf
L_9FC1:
	ld a,(0e294h)		;9fc1
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
	ld (0e283h),hl		;9fd0
	ret			;9fd3
L_9FD4:
	ld a,001h		;9fd4
	ld (0e2a7h),a		;9fd6
	ld a,(0e280h)		;9fd9
	or a			;9fdc
	jr nz,L_9FE9		;9fdd
	ld a,(0e2a6h)		;9fdf
	or a			;9fe2
	jr nz,L_9FE9		;9fe3
	xor a			;9fe5
	ld (0e2a7h),a		;9fe6
L_9FE9:
	xor a			;9fe9
	ld (0e295h),a		;9fea
	ld a,007h		;9fed
	ld (0e296h),a		;9fef
	ld b,001h		;9ff2
	ld a,(0e294h)		;9ff4
	or a			;9ff7
	jr z,L_9FFC		;9ff8
	ld b,004h		;9ffa
L_9FFC:
	ld a,b			;9ffc
	ld (0e285h),a		;9ffd
