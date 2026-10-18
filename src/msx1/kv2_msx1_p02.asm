; ==========================================================================
; KING'S VALLEY II - Konami (1988) - MSX - MegaROM RC-760 de 128 KB (Konami SCC) - banco 02 (se ejecuta en 0x8000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x08000


; ======================================================================
; CODIGO 0x8000..0x8295  (661 bytes)
; ======================================================================


L_8000:
	ld b,010h		;8000
L_8002:
	ld a,(ix+000h)		;8002
	and a			;8005
	jr z,L_800C		;8006
	call L_8038		;8008
	ret z			;800b
L_800C:
	ld de,00004h		;800c
	add ix,de		;800f
	djnz L_8002		;8011
	ld a,001h		;8013
	and a			;8015
	ret			;8016
L_8017:
	ld a,(0e26ch)		;8017
	and a			;801a
	ret z			;801b
	ld ix,0e7c0h		;801c
	ld b,010h		;8020
L_8022:
	push bc			;8022
	ld a,(ix+000h)		;8023
	and a			;8026
	jr z,L_802F		;8027
	call L_8038		;8029
	call z,L_804C		;802c
L_802F:
	ld bc,00004h		;802f
	add ix,bc		;8032
	pop bc			;8034
	djnz L_8022		;8035
	ret			;8037
L_8038:
	call 07b64h		;8038
	cp (ix+000h)		;803b
	ret nz			;803e
	call 07b55h		;803f
	ld a,(ix+001h)		;8042
	cp e			;8045
	ret nz			;8046
	ld a,(ix+002h)		;8047
	cp d			;804a
	ret			;804b
L_804C:
	ld hl,0e26ch		;804c
	dec (hl)			;804f
	ld (ix+000h),000h		;8050
	ld c,000h		;8054
	jp 07fe0h		;8056
L_8059:
	call L_8325		;8059
	ld a,(0e207h)		;805c
	and 030h		;805f
	ret z			;8061
	and 010h		;8062
	ld hl,0e268h		;8064
	jr z,L_809A		;8067
	ld a,000h		;8069
	ld (0efd0h),a		;806b
	ld a,(hl)			;806e
	cp 040h		;806f
	ret nc			;8071
	push hl			;8072
	call L_80E3		;8073
	pop hl			;8076
	ret z			;8077
	inc (hl)			;8078
	ld hl,0e300h		;8079
L_807C:
	ld a,(hl)			;807c
	and a			;807d
	jr z,L_8087		;807e
	ld a,008h		;8080
	call 04094h		;8082
	jr L_807C		;8085
L_8087:
	ld a,(0e261h)		;8087
	inc a			;808a
	ld (hl),a			;808b
	inc hl			;808c
	call 07b55h		;808d
	ld (hl),e			;8090
	inc hl			;8091
	ld (hl),d			;8092
	inc hl			;8093
	call 07b64h		;8094
	ld (hl),a			;8097
	jr L_80BF		;8098
L_809A:
	ld a,001h		;809a
	ld (0efd0h),a		;809c
	ld a,(hl)			;809f
	and a			;80a0
	ret z			;80a1
	ld hl,0e300h		;80a2
	ld b,040h		;80a5
L_80A7:
	push bc			;80a7
	ld a,(hl)			;80a8
	and a			;80a9
	jr z,L_80B6		;80aa
	push hl			;80ac
	call L_80FD		;80ad
	pop hl			;80b0
	push hl			;80b1
	call z,L_8110		;80b2
	pop hl			;80b5
L_80B6:
	ld a,008h		;80b6
	call 04094h		;80b8
	pop bc			;80bb
	djnz L_80A7		;80bc
	ret			;80be
L_80BF:
	call 07b55h		;80bf
	ld a,(0e261h)		;80c2
	call L_8119		;80c5
	ld a,(0efd0h)		;80c8
	and a			;80cb
	jr z,L_80D1		;80cc
	ld hl,082b5h		;80ce
L_80D1:
	ld bc,00202h		;80d1
	push bc			;80d4
	push de			;80d5
	call 053d6h		;80d6
	pop hl			;80d9
	pop bc			;80da
	call 07b64h		;80db
	ld d,a			;80de
	xor a			;80df
	jp 061f7h		;80e0
L_80E3:
	ld hl,0e300h		;80e3
	ld b,040h		;80e6
L_80E8:
	ld a,(hl)			;80e8
	and a			;80e9
	jr z,L_80F2		;80ea
	push hl			;80ec
	call L_80FD		;80ed
	pop hl			;80f0
	ret z			;80f1
L_80F2:
	ld a,008h		;80f2
	call 04094h		;80f4
	djnz L_80E8		;80f7
	ld a,001h		;80f9
	and a			;80fb
	ret			;80fc
L_80FD:
	call 07b64h		;80fd
	inc hl			;8100
	inc hl			;8101
	inc hl			;8102
	cp (hl)			;8103
	ret nz			;8104
	call 07b55h		;8105
	dec hl			;8108
	ld a,(hl)			;8109
	cp d			;810a
	ret nz			;810b
	dec hl			;810c
	ld a,(hl)			;810d
	cp e			;810e
	ret			;810f
L_8110:
	ld (hl),000h		;8110
	ld hl,0e268h		;8112
	dec (hl)			;8115
	jp L_80BF		;8116
L_8119:
	ld hl,09041h		;8119
	add a,a			;811c
	add a,a			;811d
	jp 04094h		;811e
L_8121:
	call L_8325		;8121
	ld a,(0e207h)		;8124
	and 030h		;8127
	ret z			;8129
	and 010h		;812a
	ld a,001h		;812c
	jr nz,L_8132		;812e
	ld a,000h		;8130
L_8132:
	ld (0efd0h),a		;8132
	ld hl,0e269h		;8135
	jr z,L_815E		;8138
	ld a,(hl)			;813a
	cp 010h		;813b
	ret nc			;813d
	ld a,(hl)			;813e
	inc (hl)			;813f
	ld hl,0e700h		;8140
L_8143:
	ld a,(hl)			;8143
	and a			;8144
	jr z,L_814E		;8145
	ld a,008h		;8147
	call 04094h		;8149
	jr L_8143		;814c
L_814E:
	ld (hl),001h		;814e
	inc hl			;8150
	call 07b64h		;8151
	ld (hl),a			;8154
	inc hl			;8155
	call 07b55h		;8156
	ld (hl),e			;8159
	inc hl			;815a
	ld (hl),d			;815b
	jr L_8195		;815c
L_815E:
	ld a,(hl)			;815e
	and a			;815f
	ret z			;8160
	ld hl,0e700h		;8161
	ld b,010h		;8164
L_8166:
	push bc			;8166
	ld a,(hl)			;8167
	and a			;8168
	jr z,L_8175		;8169
	push hl			;816b
	call L_817E		;816c
	pop hl			;816f
	push hl			;8170
	call z,L_818F		;8171
	pop hl			;8174
L_8175:
	ld a,008h		;8175
	call 04094h		;8177
	pop bc			;817a
	djnz L_8166		;817b
	ret			;817d
L_817E:
	call 07b64h		;817e
	inc hl			;8181
	cp (hl)			;8182
	ret nz			;8183
	call 07b55h		;8184
	inc hl			;8187
	ld a,(hl)			;8188
	cp e			;8189
	ret nz			;818a
	inc hl			;818b
	ld a,(hl)			;818c
	cp d			;818d
	ret			;818e
L_818F:
	ld (hl),000h		;818f
	ld hl,0e269h		;8191
	dec (hl)			;8194
L_8195:
	call 07b55h		;8195
	ld a,(0efd0h)		;8198
	and a			;819b
	ld hl,0903dh		;819c
	jr nz,L_81A4		;819f
	ld hl,082b5h		;81a1
L_81A4:
	ld bc,00202h		;81a4
	push bc			;81a7
	push de			;81a8
	call 053d6h		;81a9
	pop hl			;81ac
	pop bc			;81ad
	call 07b64h		;81ae
	ld d,a			;81b1
	xor a			;81b2
	jp 061f7h		;81b3
L_81B6:
	call L_8325		;81b6
	ld a,(0e207h)		;81b9
	and 030h		;81bc
	ret z			;81be
	and 010h		;81bf
	jr z,L_81F8		;81c1
	ld a,(0e26ah)		;81c3
	and a			;81c6
	call nz,L_8203		;81c7
	call L_8215		;81ca
	ld hl,0e2f1h		;81cd
	call 07b55h		;81d0
	ld (hl),e			;81d3
	inc hl			;81d4
	ld (hl),d			;81d5
	inc hl			;81d6
	call 07b64h		;81d7
	ld (hl),a			;81da
	ld a,001h		;81db
	ld (0e26ah),a		;81dd
	call 07b55h		;81e0
	ld hl,09059h		;81e3
L_81E6:
	ld bc,00404h		;81e6
	push de			;81e9
	push bc			;81ea
	call 053d6h		;81eb
	pop bc			;81ee
	pop hl			;81ef
L_81F0:
	call 07b64h		;81f0
	ld d,a			;81f3
	xor a			;81f4
	jp 061f7h		;81f5
L_81F8:
	call L_8203		;81f8
	call L_8215		;81fb
	xor a			;81fe
	ld (0e26ah),a		;81ff
	ret			;8202
L_8203:
	ld hl,0e2f3h		;8203
	call 07b64h		;8206
	cp (hl)			;8209
	ret nz			;820a
	dec hl			;820b
	ld d,(hl)			;820c
	dec hl			;820d
	ld e,(hl)			;820e
	ld hl,082b5h		;820f
	jp L_81E6		;8212
L_8215:
	ld hl,0e2f0h		;8215
	ld de,0e2f1h		;8218
	ld bc,00007h		;821b
	ld (hl),000h		;821e
	ldir		;8220
	ret			;8222
L_8223:
	ld hl,0e800h		;8223
	ld a,(0e264h)		;8226
	add a,a			;8229
	add a,a			;822a
	add a,a			;822b
	ld (hl),a			;822c
	inc hl			;822d
	ld a,(0e265h)		;822e
	add a,a			;8231
	add a,a			;8232
	add a,a			;8233
	ld (hl),a			;8234
	inc hl			;8235
	ld (hl),01ch		;8236
	inc hl			;8238
	ld a,(0e203h)		;8239
	and 008h		;823c
	ld a,008h		;823e
	jr z,L_8243		;8240
	xor a			;8242
L_8243:
	ld (hl),a			;8243
	ret			;8244
L_8245:
	ld a,(0e20ch)		;8245
	rla			;8248
	rla			;8249
	jr c,L_8254		;824a
	call L_84B5		;824c
	ld a,(0e25bh)		;824f
	and a			;8252
	ret nz			;8253
L_8254:
	ld hl,00005h		;8254
	ld (0e25ah),hl		;8257
	ret			;825a
L_825B:
	ld a,001h		;825b
	call L_8474		;825d
	call 041c7h		;8260
	ld hl,0bc54h		;8263
	call 04f0bh		;8266
	call 04192h		;8269
	ld hl,03a54h		;826c
	ld de,0e788h		;826f
	ld bc,00606h		;8272
L_8275:
	push hl			;8275
	push bc			;8276
	ld b,c			;8277
L_8278:
	ld a,(de)			;8278
	and a			;8279
	ld c,0ffh		;827a
	jr z,L_8281		;827c
	add a,0d0h		;827e
	ld c,a			;8280
L_8281:
	ld a,c			;8281
	call 0004dh		;8282   ; BIOS WRTVRM - Writes data in VRAM
	inc de			;8285
	inc hl			;8286
	djnz L_8278		;8287
	pop bc			;8289
	pop hl			;828a
	ld a,020h		;828b
	call 04094h		;828d
	inc de			;8290
	inc de			;8291
	djnz L_8275		;8292
	ret			;8294

; ----------------------------------------------------------------------
; DATOS resto_8295: lo apuntan con el banco puesto p01:7608 (0x8295), p01:760D
;   (0x82A1), p01:7D67 (0x82AD), p01:7ECE (0x82B5), p02:80CE (0x82B5),
;   p02:81A1 (0x82B5); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p01:7608, p01:760D, p01:7D67, p01:7ECE, p02:80CE,
;   p02:81A1 (82 bytes)
;   0x8295..0x82e7  (82 bytes)
DATA_resto_8295:
	defb 0d7h,0d7h,0d7h,0dah,0d7h,0d7h,0d7h,0dah,0d9h,0d9h,0d9h,0dbh,0dch,0dch,0dch,0deh	; 8295  ................
	defb 0dch,0dch,0dch,0deh,0ddh,0ddh,0ddh,0dfh,058h,00fh,058h,00ah,068h,00ah,090h,009h	; 82a5  ........X.X.h...
	defb 0e0h,0e0h,0e0h,0e0h,0e0h,0e0h,0e0h,0e0h,0e0h,0e0h,0e0h,0e0h,0e0h,0e0h,0e0h,0e0h	; 82b5  ................
	defb 0e0h,0e0h,0e0h,0e0h,0e0h,0e0h,0e0h,0e0h,00fh,000h,081h,001h,007h,000h,081h,0ffh	; 82c5  ................
	defb 00fh,001h,081h,0ffh,00fh,000h,081h,0ffh,00fh,001h,081h,0ffh,000h,028h,0f1h,020h	; 82d5  .............(.
	defb 0f4h,000h	; 82e5

; ======================================================================
; CODIGO 0x82e7..0x84bc  (469 bytes)
; ======================================================================


L_82E7:
	ld hl,0e21ch		;82e7
	ld de,0e207h		;82ea
	ld bc,0e208h		;82ed
	ld a,(hl)			;82f0
	cp 02dh		;82f1
	jr nc,L_8300		;82f3
	ld a,(de)			;82f5
	and 00fh		;82f6
	jr nz,L_830F		;82f8
	ld a,(bc)			;82fa
	and a			;82fb
	jr z,L_830F		;82fc
	inc (hl)			;82fe
	ret			;82ff
L_8300:
	ld a,(bc)			;8300
	and a			;8301
	jr z,L_830F		;8302
	inc hl			;8304
	inc (hl)			;8305
	ld a,(hl)			;8306
	cp 005h		;8307
	ret nz			;8309
	ld (hl),000h		;830a
	ld a,(bc)			;830c
	ld (de),a			;830d
	ret			;830e
L_830F:
	ld (hl),000h		;830f
	ret			;8311
L_8312:
	exx			;8312
	ld a,(0e261h)		;8313
	ld bc,00201h		;8316
	cp 004h		;8319
	jr c,L_8329		;831b
	ld c,002h		;831d
	cp 006h		;831f
	jr z,L_8329		;8321
	jr L_8326		;8323
L_8325:
	exx			;8325
L_8326:
	ld bc,00101h		;8326
L_8329:
	ld a,(0e2fbh)		;8329
	ld h,a			;832c
	and 00fh		;832d
	ld d,a			;832f
	ld a,h			;8330
	rrca			;8331
	rrca			;8332
	rrca			;8333
	rrca			;8334
	and 00fh		;8335
	ld e,a			;8337
	exx			;8338
	ld hl,0e264h		;8339
	ld de,0e265h		;833c
	ld bc,(0e27ch)		;833f
	ld a,(0e207h)		;8343
	rra			;8346
	jr c,L_8361		;8347
	rra			;8349
	jr c,L_8373		;834a
	rra			;834c
	jr c,L_8382		;834d
	rra			;834f
	ret nc			;8350
	call 042d3h		;8351
	ex de,hl			;8354
	ld a,(hl)			;8355
	exx			;8356
	add a,b			;8357
	exx			;8358
	ld (hl),a			;8359
	cp b			;835a
	ret c			;835b
	exx			;835c
	ld a,d			;835d
	exx			;835e
	ld (hl),a			;835f
	ret			;8360
L_8361:
	call 042d3h		;8361
	ld a,(hl)			;8364
	exx			;8365
	sub c			;8366
	exx			;8367
	ld (hl),a			;8368
	rla			;8369
	jr c,L_8370		;836a
	exx			;836c
	cp e			;836d
	exx			;836e
	ret nc			;836f
L_8370:
	ld (hl),c			;8370
	dec (hl)			;8371
	ret			;8372
L_8373:
	call 042d3h		;8373
	ld a,(hl)			;8376
	exx			;8377
	add a,c			;8378
	exx			;8379
	ld (hl),a			;837a
	cp c			;837b
	ret c			;837c
	exx			;837d
	ld a,e			;837e
	exx			;837f
	ld (hl),a			;8380
	ret			;8381
L_8382:
	call 042d3h		;8382
	ex de,hl			;8385
	ld a,(hl)			;8386
	exx			;8387
	sub b			;8388
	exx			;8389
	ld (hl),a			;838a
	rla			;838b
	jr c,L_8392		;838c
	exx			;838e
	cp d			;838f
	exx			;8390
	ret nc			;8391
L_8392:
	ld (hl),b			;8392
	dec (hl)			;8393
	ret			;8394
L_8395:
	ld hl,0e7c0h		;8395
	ld b,010h		;8398
L_839A:
	push bc			;839a
	ld a,(hl)			;839b
	and a			;839c
	push hl			;839d
	call nz,L_83AB		;839e
	pop hl			;83a1
	pop bc			;83a2
	ld a,004h		;83a3
	call 04094h		;83a5
	djnz L_839A		;83a8
	ret			;83aa
L_83AB:
	ld a,(hl)			;83ab
	push af			;83ac
	inc hl			;83ad
	ld e,(hl)			;83ae
	inc hl			;83af
	ld d,(hl)			;83b0
	inc hl			;83b1
	ld a,(hl)			;83b2
	and 01fh		;83b3
	ld b,a			;83b5
	ld c,002h		;83b6
	ex de,hl			;83b8
	pop de			;83b9
	ld a,001h		;83ba
	jp 061f7h		;83bc
L_83BF:
	ld hl,0e788h		;83bf
	ld bc,03001h		;83c2
	xor a			;83c5
	ld (0efc0h),a		;83c6
	ld (0efc1h),a		;83c9
L_83CC:
	ld a,(hl)			;83cc
	cp c			;83cd
	jr nz,L_83DD		;83ce
	push hl			;83d0
	push bc			;83d1
	call L_8404		;83d2
	pop bc			;83d5
	pop hl			;83d6
	inc c			;83d7
	ld a,c			;83d8
	cp 007h		;83d9
	jr nc,L_83E0		;83db
L_83DD:
	inc hl			;83dd
	djnz L_83CC		;83de
L_83E0:
	ld a,(0efc0h)		;83e0
	ld hl,0ed80h		;83e3
	ld de,0ed90h		;83e6
	call L_83F5		;83e9
	ld a,(0efc1h)		;83ec
	ld hl,0eda0h		;83ef
	ld de,0edb0h		;83f2
L_83F5:
	add a,a			;83f5
	ld b,a			;83f6
	call 04094h		;83f7
	ld (hl),0ffh		;83fa
	ld a,b			;83fc
	call 04099h		;83fd
	ld a,0ffh		;8400
	ld (de),a			;8402
	ret			;8403
L_8404:
	push hl			;8404
	dec hl			;8405
	ld b,(hl)			;8406
	ld de,00007h		;8407
	or a			;840a
	sbc hl,de		;840b
	ld a,(hl)			;840d
	pop hl			;840e
	and a			;840f
	jr nz,L_8423		;8410
	push hl			;8412
	push bc			;8413
	ld bc,0ed80h		;8414
	ld de,0ed91h		;8417
	call L_8434		;841a
	ld hl,0efc0h		;841d
	inc (hl)			;8420
	pop bc			;8421
	pop hl			;8422
L_8423:
	ld a,b			;8423
	and a			;8424
	ret nz			;8425
	ld bc,0eda0h		;8426
	ld de,0edb1h		;8429
	call L_8457		;842c
	ld hl,0efc1h		;842f
	inc (hl)			;8432
	ret			;8433
L_8434:
	ld a,(0efc0h)		;8434
	add a,a			;8437
	push af			;8438
	add a,c			;8439
	ld c,a			;843a
	pop af			;843b
	add a,e			;843c
	ld e,a			;843d
	ld a,l			;843e
	sub 088h		;843f
	ld (bc),a			;8441
	ld (de),a			;8442
L_8443:
	ld a,l			;8443
	add a,008h		;8444
	ld l,a			;8446
	ld a,(hl)			;8447
	and a			;8448
	jr nz,L_8443		;8449
	ld a,l			;844b
	sub 008h		;844c
	ld l,a			;844e
	ld a,l			;844f
	sub 088h		;8450
	inc bc			;8452
	ld (bc),a			;8453
	dec de			;8454
	ld (de),a			;8455
	ret			;8456
L_8457:
	ld a,(0efc1h)		;8457
	add a,a			;845a
	push af			;845b
	add a,c			;845c
	ld c,a			;845d
	pop af			;845e
	add a,e			;845f
	ld e,a			;8460
	ld a,l			;8461
	sub 088h		;8462
	ld (bc),a			;8464
	ld (de),a			;8465
L_8466:
	inc hl			;8466
	ld a,(hl)			;8467
	and a			;8468
	jr nz,L_8466		;8469
	dec hl			;846b
	ld a,l			;846c
	sub 088h		;846d
	inc bc			;846f
	ld (bc),a			;8470
	dec de			;8471
	ld (de),a			;8472
	ret			;8473
L_8474:
	push af			;8474
	call 04edfh		;8475
	pop af			;8478
	call 041c7h		;8479
	ld hl,0bb38h		;847c
	call 04d4dh		;847f
	ld de,00000h		;8482
	ld b,060h		;8485
	ld a,(0f0f4h)		;8487
	and a			;848a
	ld c,062h		;848b
	jr z,L_8491		;848d
	ld c,05eh		;848f
L_8491:
	push bc			;8491
	push hl			;8492
	ld a,(hl)			;8493
	ld b,008h		;8494
L_8496:
	rla			;8496
	push af			;8497
	ld a,c			;8498
	call c,053efh		;8499
	ld a,d			;849c
	add a,008h		;849d
	ld d,a			;849f
	jr nc,L_84A6		;84a0
	ld a,e			;84a2
	add a,008h		;84a3
	ld e,a			;84a5
L_84A6:
	pop af			;84a6
	djnz L_8496		;84a7
	pop hl			;84a9
	inc hl			;84aa
	pop bc			;84ab
	djnz L_8491		;84ac
	call 04192h		;84ae
	call 04ed4h		;84b1
	ret			;84b4
L_84B5:
	ld a,(0e25bh)		;84b5
	dec a			;84b8
	call 0409eh		;84b9

; ----------------------------------------------------------------------
; DATOS tabla_84BC: 6 destinos del despachador p00:409E (call en p02:84B9, el
;   indice en A): 84C8, 8521, 85F3, 865E, 874D, 8792; lo leen p02:84B9 (12
;   bytes)
;   0x84bc..0x84c8  (12 bytes)
DATA_tabla_84BC:
	defw 084c8h,08521h,085f3h,0865eh,0874dh,08792h	; 84bc

; ======================================================================
; CODIGO 0x84c8..0x86f9  (561 bytes)
; ======================================================================


L_84C8:
	call L_8512		;84c8
	call 05a3dh		;84cb
	xor a			;84ce
	call L_8474		;84cf
	call 041c7h		;84d2
	ld hl,0be14h		;84d5
	call 04f0bh		;84d8
	ld a,(0f0f9h)		;84db
	rra			;84de
	ld de,06060h		;84df
	push af			;84e2
	jr nc,L_84F3		;84e3
	ld hl,0be30h		;84e5
	ld c,0ffh		;84e8
	push de			;84ea
	call 04f15h		;84eb
	pop de			;84ee
	ld a,e			;84ef
	add a,010h		;84f0
	ld e,a			;84f2
L_84F3:
	pop af			;84f3
	rra			;84f4
	ld hl,0be3ah		;84f5
	ld c,0ffh		;84f8
	call c,04f15h		;84fa
	call 04192h		;84fd
	xor a			;8500
	ld (0e26dh),a		;8501
	ld (0e26eh),a		;8504
	ld (0e27fh),a		;8507
	ld (0e21eh),a		;850a
L_850D:
	ld hl,0e25bh		;850d
	inc (hl)			;8510
	ret			;8511
L_8512:
	ld hl,0e270h		;8512
	ld b,00bh		;8515
L_8517:
	ld a,(hl)			;8517
	and a			;8518
	jr nz,L_851D		;8519
	ld (hl),020h		;851b
L_851D:
	inc hl			;851d
	djnz L_8517		;851e
	ret			;8520
L_8521:
	call L_8584		;8521
	ld hl,0e26dh		;8524
	ld a,(0e207h)		;8527
	rra			;852a
	jr c,L_857D		;852b
	rra			;852d
	jr c,L_856A		;852e
	rra			;8530
	rra			;8531
	rra			;8532
	ret nc			;8533
	call 05b38h		;8534
	call L_850D		;8537
	call L_85D7		;853a
	call 04ec7h		;853d
	xor a			;8540
	call L_8474		;8541
	call 041c7h		;8544
	ld a,(0f0f8h)		;8547
	ld hl,0be26h		;854a
	and a			;854d
	jr z,L_8559		;854e
	ld hl,0be30h		;8550
	dec a			;8553
	jr z,L_8559		;8554
	ld hl,0be3ah		;8556
L_8559:
	ld de,05848h		;8559
	ld c,0ffh		;855c
	call 04f15h		;855e
	ld hl,0be82h		;8561
	call 04f0bh		;8564
	jp 04192h		;8567
L_856A:
	ld a,(0f0f9h)		;856a
	and a			;856d
	ret z			;856e
	cp 003h		;856f
	ld b,002h		;8571
	jr z,L_8576		;8573
	dec b			;8575
L_8576:
	ld a,(hl)			;8576
	cp b			;8577
	ret nc			;8578
	inc (hl)			;8579
	jp 042d3h		;857a
L_857D:
	ld a,(hl)			;857d
	and a			;857e
	ret z			;857f
	dec (hl)			;8580
	jp 042d3h		;8581
L_8584:
	ld hl,0e800h		;8584
	ld a,(0e26dh)		;8587
	add a,a			;858a
	add a,a			;858b
	add a,a			;858c
	add a,a			;858d
	add a,050h		;858e
	ld (hl),a			;8590
	inc hl			;8591
	ld (hl),048h		;8592
	inc hl			;8594
	ld (hl),014h		;8595
	inc hl			;8597
L_8598:
	ld (hl),008h		;8598
	ld a,(0f0f4h)		;859a
	and a			;859d
	ret z			;859e
	ld hl,0d200h		;859f
	ld de,0d201h		;85a2
	ld bc,00010h		;85a5
	ld (hl),007h		;85a8
	ldir		;85aa
	ret			;85ac
L_85AD:
	xor a			;85ad
	call L_8474		;85ae
	call 041c7h		;85b1
	ld hl,0be5ch		;85b4
	call 04f0bh		;85b7
	ld hl,0be44h		;85ba
	call 04f0bh		;85bd
	ld hl,0be4ch		;85c0
	call 04f0bh		;85c3
	ld hl,0be54h		;85c6
	call 04f0bh		;85c9
	call 04192h		;85cc
	ld a,003h		;85cf
	ld (0f0e5h),a		;85d1
	jp L_850D		;85d4
L_85D7:
	ld a,(0e26dh)		;85d7
	ld b,a			;85da
	ld a,(0f0f9h)		;85db
	and a			;85de
	jr z,L_85EE		;85df
	cp 003h		;85e1
	jr z,L_85EE		;85e3
	dec a			;85e5
	jr z,L_85EE		;85e6
	ld a,b			;85e8
	and a			;85e9
	jr z,L_85EE		;85ea
	ld b,002h		;85ec
L_85EE:
	ld a,b			;85ee
	ld (0f0f8h),a		;85ef
	ret			;85f2
L_85F3:
	call L_8642		;85f3
	and a			;85f6
	ret z			;85f7
	dec a			;85f8
	jp nz,L_875A		;85f9
	ld a,0e0h		;85fc
	ld a,(0edeeh)		;85fe
	call 04ec7h		;8601
	ld a,(0f0f8h)		;8604
	cp 002h		;8607
	jr z,L_85AD		;8609
	xor a			;860b
	call L_8474		;860c
	call L_850D		;860f
	call 041c7h		;8612
	ld hl,0bde9h		;8615
	call 04f0bh		;8618
	call 04192h		;861b
L_861E:
	ld de,06058h		;861e
L_8621:
	ld hl,0e270h		;8621
L_8624:
	ld b,008h		;8624
L_8626:
	push bc			;8626
	ld a,(hl)			;8627
	cp 020h		;8628
	ld b,000h		;862a
	jr z,L_8631		;862c
	add a,0a0h		;862e
	ld b,a			;8630
L_8631:
	ld a,b			;8631
	push hl			;8632
	push de			;8633
	call 053efh		;8634
	pop de			;8637
	pop hl			;8638
	ld a,d			;8639
	add a,008h		;863a
	ld d,a			;863c
	inc hl			;863d
	pop bc			;863e
	djnz L_8626		;863f
	ret			;8641
L_8642:
	ld a,004h		;8642
	call 00141h		;8644   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;8647
	and 008h		;8648
	jr nz,L_8658		;864a
	ld a,005h		;864c
	call 00141h		;864e   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;8651
	and 040h		;8652
	jr nz,L_865B		;8654
	xor a			;8656
	ret			;8657
L_8658:
	ld a,002h		;8658
	ret			;865a
L_865B:
	ld a,001h		;865b
	ret			;865d
L_865E:
	ld a,(0f0f8h)		;865e
	cp 002h		;8661
	jp z,L_86DB		;8663
L_8666:
	call L_86C5		;8666
	call 06a2fh		;8669
	call 0698fh		;866c
	ld a,(0ededh)		;866f
	and a			;8672
	jr z,L_8697		;8673
	cp 0e0h		;8675
	ld b,0a0h		;8677
	jr nz,L_867D		;8679
	ld b,0c0h		;867b
L_867D:
	sub b			;867d
	ld b,a			;867e
	ld hl,0e26eh		;867f
	ld a,(hl)			;8682
	cp 007h		;8683
	jr nc,L_868D		;8685
	push af			;8687
	call 042d3h		;8688
	pop af			;868b
	inc (hl)			;868c
L_868D:
	ld hl,0e270h		;868d
	call 04094h		;8690
	ld (hl),b			;8693
	call L_861E		;8694
L_8697:
	ld a,(0e207h)		;8697
	rra			;869a
	rra			;869b
	rra			;869c
	jr c,L_86BB		;869d
	rra			;869f
	jr c,L_86B0		;86a0
	ld a,(0e20ch)		;86a2
	rla			;86a5
	ret nc			;86a6
	call 05b38h		;86a7
	call 041e8h		;86aa
	jp L_850D		;86ad
L_86B0:
	ld hl,0e26eh		;86b0
	ld a,(hl)			;86b3
	cp 007h		;86b4
	ret nc			;86b6
	inc (hl)			;86b7
	jp 042d3h		;86b8
L_86BB:
	ld hl,0e26eh		;86bb
	ld a,(hl)			;86be
	and a			;86bf
	ret z			;86c0
	dec (hl)			;86c1
	jp 042d3h		;86c2
L_86C5:
	ld hl,0e800h		;86c5
	ld (hl),057h		;86c8
	inc hl			;86ca
	ld a,(0e26eh)		;86cb
	add a,a			;86ce
	add a,a			;86cf
	add a,a			;86d0
	add a,060h		;86d1
	ld (hl),a			;86d3
	inc hl			;86d4
	ld (hl),020h		;86d5
	inc hl			;86d7
	jp L_8598		;86d8
L_86DB:
	call L_8711		;86db
	ret nc			;86de
	ld a,(0e26eh)		;86df
	add a,a			;86e2
	add a,a			;86e3
	add a,a			;86e4
	ld hl,086f9h		;86e5
	call 04094h		;86e8
	ld de,0e270h		;86eb
	ld bc,00008h		;86ee
	ldir		;86f1
	call 041e8h		;86f3
	jp L_850D		;86f6

; ----------------------------------------------------------------------
; DATOS resto_86F9: lo apuntan con el banco puesto p02:86E5 (0x86F9); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p02:86E5 (24 bytes)
;   0x86f9..0x8711  (24 bytes)
DATA_resto_86F9:
	defb 046h,049h,04ch,045h,031h,020h,020h,020h,046h,049h,04ch,045h,032h,020h,020h,020h	; 86f9  FILE1   FILE2
	defb 046h,049h,04ch,045h,033h,020h,020h,020h	; 8709  FILE3

; ======================================================================
; CODIGO 0x8711..0x87a6  (149 bytes)
; ======================================================================


L_8711:
	call L_8736		;8711
	ld hl,0e26eh		;8714
	ld a,(0e207h)		;8717
	rra			;871a
	jr c,L_8729		;871b
	rra			;871d
	jr c,L_872E		;871e
	rra			;8720
	rra			;8721
	rra			;8722
	ret c			;8723
	ld a,(0e20ch)		;8724
	rla			;8727
	ret			;8728
L_8729:
	ld a,(hl)			;8729
	and a			;872a
	ret z			;872b
	dec (hl)			;872c
	ret			;872d
L_872E:
	ld a,(0f0e5h)		;872e
	dec a			;8731
	cp (hl)			;8732
	ret z			;8733
	inc (hl)			;8734
	ret			;8735
L_8736:
	ld hl,0e800h		;8736
	ld a,(0e26eh)		;8739
	add a,a			;873c
	add a,a			;873d
	add a,a			;873e
	add a,a			;873f
	add a,050h		;8740
	ld (hl),a			;8742
	inc hl			;8743
	ld (hl),058h		;8744
	inc hl			;8746
	ld (hl),014h		;8747
	inc hl			;8749
	jp L_8598		;874a
L_874D:
	call L_877C		;874d
	call 04238h		;8750
	ld a,(0e27fh)		;8753
	cp 002h		;8756
	jr z,L_8761		;8758
L_875A:
	xor a			;875a
	ld (0e25bh),a		;875b
	jp 04ec7h		;875e
L_8761:
	ld a,(0f0f8h)		;8761
	dec a			;8764
	jr z,L_8779		;8765
	call 05b38h		;8767
	call 04ec7h		;876a
	call 041c7h		;876d
	ld hl,0be6ah		;8770
	call 04f0bh		;8773
	call 04192h		;8776
L_8779:
	jp L_850D		;8779
L_877C:
	ld a,(0f0f8h)		;877c
	or a			;877f
	jr z,L_8789		;8780
	dec a			;8782
	jp z,L_9F74		;8783
	jp 06a3eh		;8786
L_8789:
	call 041bdh		;8789
	call 0bec8h		;878c
	jp 04192h		;878f
L_8792:
	ld a,(0e207h)		;8792
	and a			;8795
	ret z			;8796
	ld a,001h		;8797
	ld (0e25bh),a		;8799
	jp 04ec7h		;879c
L_879F:
	ld a,(0e25bh)		;879f
	dec a			;87a2
	call 0409eh		;87a3

; ----------------------------------------------------------------------
; DATOS tabla_87A6: 8 destinos del despachador p00:409E (call en p02:87A3, el
;   indice en A): 87B6, 87D4, 885C, 889F, 8991, 8A92, 8AC3, 8A02; lo leen
;   p02:87A3 (16 bytes)
;   0x87a6..0x87b6  (16 bytes)
DATA_tabla_87A6:
	defw 087b6h,087d4h,0885ch,0889fh,08991h,08a92h,08ac3h,08a02h	; 87a6

; ======================================================================
; CODIGO 0x87b6..0x8aeb  (821 bytes)
; ======================================================================


L_87B6:
	call 04ec7h		;87b6
	xor a			;87b9
	call L_8474		;87ba
	call 041c7h		;87bd
	ld hl,0bd6dh		;87c0
	call 04f0bh		;87c3
	call 04192h		;87c6
	call L_8B16		;87c9
	call 07560h		;87cc
L_87CF:
	ld hl,0e25bh		;87cf
	inc (hl)			;87d2
	ret			;87d3
L_87D4:
	call L_883D		;87d4
	ld hl,0e26dh		;87d7
	ld a,(0e207h)		;87da
	ld b,a			;87dd
	and 003h		;87de
	jr z,L_87E9		;87e0
	ld a,(hl)			;87e2
	xor 001h		;87e3
	ld (hl),a			;87e5
	jp 042d3h		;87e6
L_87E9:
	ld a,b			;87e9
	and 010h		;87ea
	ret z			;87ec
	ld a,(hl)			;87ed
	and a			;87ee
	jr nz,L_8838		;87ef
L_87F1:
	call 04ec7h		;87f1
	xor a			;87f4
	call L_8474		;87f5
	call 041c7h		;87f8
	ld hl,0bdb9h		;87fb
	call 04f0bh		;87fe
	call 04192h		;8801
	ld a,(0f0f9h)		;8804
	rra			;8807
	ld de,06060h		;8808
	push af			;880b
	jr nc,L_8822		;880c
	call 041c7h		;880e
	ld hl,0bdd5h		;8811
	ld c,0ffh		;8814
	push de			;8816
	call 04f15h		;8817
	pop de			;881a
	ld a,e			;881b
	add a,010h		;881c
	ld e,a			;881e
	call 04192h		;881f
L_8822:
	pop af			;8822
	rra			;8823
	call 041c7h		;8824
	ld hl,0bddfh		;8827
	ld c,0ffh		;882a
	call c,04f15h		;882c
	call 04192h		;882f
	xor a			;8832
	ld (0e26dh),a		;8833
	jr L_87CF		;8836
L_8838:
	xor a			;8838
	ld (0e25bh),a		;8839
	ret			;883c
L_883D:
	ld hl,0e800h		;883d
	ld a,(0e26dh)		;8840
	and a			;8843
	ld a,058h		;8844
	jr z,L_884A		;8846
	ld a,068h		;8848
L_884A:
	ld (hl),a			;884a
	inc hl			;884b
	ld (hl),068h		;884c
	inc hl			;884e
	ld (hl),014h		;884f
	inc hl			;8851
	call L_8598		;8852
	ret			;8855
L_8856:
	ld a,001h		;8856
	ld (0e25bh),a		;8858
	ret			;885b
L_885C:
	ld a,(0e20ch)		;885c
	rla			;885f
	rla			;8860
	jr c,L_8856		;8861
	call L_8584		;8863
	ld hl,0e26dh		;8866
	ld a,(0e207h)		;8869
	rra			;886c
	jr c,L_8898		;886d
	rra			;886f
	jr c,L_8885		;8870
	rra			;8872
	rra			;8873
	rra			;8874
	ret nc			;8875
	call L_85D7		;8876
	call 05b38h		;8879
	call 04ec7h		;887c
	call L_87CF		;887f
	jp 041e8h		;8882
L_8885:
	ld a,(0f0f9h)		;8885
	and a			;8888
	ret z			;8889
	cp 003h		;888a
	ld b,002h		;888c
	jr z,L_8891		;888e
	dec b			;8890
L_8891:
	ld a,(hl)			;8891
	cp b			;8892
	ret nc			;8893
	inc (hl)			;8894
	jp 042d3h		;8895
L_8898:
	ld a,(hl)			;8898
	and a			;8899
	ret z			;889a
	dec (hl)			;889b
	jp 042d3h		;889c
L_889F:
	ld a,(0f0f8h)		;889f
	dec a			;88a2
	jp z,L_893B		;88a3
	dec a			;88a6
	jr z,L_88BF		;88a7
	xor a			;88a9
	call L_8474		;88aa
	call 041c7h		;88ad
	ld hl,0bde9h		;88b0
	call 04f0bh		;88b3
	call 04192h		;88b6
	call 04238h		;88b9
	jp L_87CF		;88bc
L_88BF:
	call 06c2eh		;88bf
	ld a,(0f0e5h)		;88c2
	and a			;88c5
	jr z,L_8924		;88c6
	xor a			;88c8
	call L_8474		;88c9
	call 041c7h		;88cc
	ld hl,0be5ch		;88cf
	call 04f0bh		;88d2
	call 04192h		;88d5
	ld hl,0ee54h		;88d8
	ld de,07050h		;88db
	ld b,003h		;88de
L_88E0:
	ld a,(hl)			;88e0
	and a			;88e1
	jr z,L_88F7		;88e2
	push hl			;88e4
	push de			;88e5
	push bc			;88e6
	call 041c7h		;88e7
	call L_8904		;88ea
	call 04192h		;88ed
	pop bc			;88f0
	pop de			;88f1
	pop hl			;88f2
	ld a,e			;88f3
	add a,010h		;88f4
	ld e,a			;88f6
L_88F7:
	ld a,008h		;88f7
	call 04094h		;88f9
	djnz L_88E0		;88fc
	call L_87CF		;88fe
	jp 04238h		;8901
L_8904:
	sub 031h		;8904
	and a			;8906
	jr z,L_8914		;8907
	dec a			;8909
	jr z,L_891C		;890a
	ld hl,0be56h		;890c
	ld c,0ffh		;890f
	jp 04f15h		;8911
L_8914:
	ld hl,0be46h		;8914
	ld c,0ffh		;8917
	jp 04f15h		;8919
L_891C:
	ld hl,0be4eh		;891c
	ld c,0ffh		;891f
	jp 04f15h		;8921
L_8924:
	call 04ec7h		;8924
	call 041bdh		;8927
	ld hl,0af7dh		;892a
	call 04f0bh		;892d
	call 04192h		;8930
	ld a,007h		;8933
	ld (0e25bh),a		;8935
	jp 04238h		;8938
L_893B:
	call 0a000h		;893b
	ld a,(0f0e5h)		;893e
	and a			;8941
	jr z,L_8924		;8942
	call L_87CF		;8944
	call 04238h		;8947
L_894A:
	call 04ec7h		;894a
	ld a,001h		;894d
	call L_8474		;894f
	call 041c7h		;8952
	ld hl,0bd86h		;8955
	call 04f0bh		;8958
	call 04192h		;895b
	ld hl,0ee50h		;895e
	ld de,03020h		;8961
	ld b,008h		;8964
L_8966:
	push bc			;8966
	push hl			;8967
	push de			;8968
	call L_8624		;8969
	pop de			;896c
	pop hl			;896d
	pop bc			;896e
	ld a,00bh		;896f
	call 04094h		;8971
	ld a,(hl)			;8974
	and a			;8975
	ret z			;8976
	push bc			;8977
	push hl			;8978
	push de			;8979
	ld d,0a0h		;897a
	call L_8624		;897c
	pop de			;897f
	pop hl			;8980
	pop bc			;8981
	ld a,00bh		;8982
	call 04094h		;8984
	ld a,(hl)			;8987
	and a			;8988
	ret z			;8989
	ld a,e			;898a
	add a,010h		;898b
	ld e,a			;898d
	djnz L_8966		;898e
	ret			;8990
L_8991:
	ld a,(0e20ch)		;8991
	rla			;8994
	rla			;8995
	jp c,L_8856		;8996
	ld a,(0f0f8h)		;8999
	and a			;899c
	jp z,L_8666		;899d
	dec a			;89a0
	jp nz,L_8A64		;89a1
	ld a,(0e207h)		;89a4
	and 020h		;89a7
	jr nz,L_89F9		;89a9
	call L_8A43		;89ab
	ld a,(0f0e5h)		;89ae
	ld b,a			;89b1
	ld hl,0e26eh		;89b2
	ld a,(0e207h)		;89b5
	rra			;89b8
	jr c,L_8A1B		;89b9
	rra			;89bb
	jr c,L_8A24		;89bc
	rra			;89be
	jr c,L_8A2E		;89bf
	rra			;89c1
	jr c,L_8A38		;89c2
	ld a,(0e20ch)		;89c4
	rla			;89c7
	ret nc			;89c8
	ld a,(hl)			;89c9
	and a			;89ca
	jr z,L_89D3		;89cb
	ld b,a			;89cd
	xor a			;89ce
L_89CF:
	add a,00bh		;89cf
	djnz L_89CF		;89d1
L_89D3:
	ld hl,0ee50h		;89d3
	call 04094h		;89d6
	ld de,0e270h		;89d9
	ld bc,0000bh		;89dc
	ldir		;89df
	call 04ec7h		;89e1
	call 05b38h		;89e4
	call 041c7h		;89e7
	ld hl,0be06h		;89ea
	call 04f0bh		;89ed
	call 04192h		;89f0
	call 041e8h		;89f3
	jp L_87CF		;89f6
L_89F9:
	call 041e8h		;89f9
	ld a,008h		;89fc
L_89FE:
	ld (0e25bh),a		;89fe
	ret			;8a01
L_8A02:
	call 0a000h		;8a02
	call L_894A		;8a05
	xor a			;8a08
	ld (0e26eh),a		;8a09
	call 04238h		;8a0c
	ld a,(0e200h)		;8a0f
	cp 00bh		;8a12
	ld a,005h		;8a14
	jr z,L_89FE		;8a16
	dec a			;8a18
	jr L_89FE		;8a19
L_8A1B:
	ld a,(hl)			;8a1b
	cp 002h		;8a1c
	ret c			;8a1e
	dec (hl)			;8a1f
	dec (hl)			;8a20
	jp 042d3h		;8a21
L_8A24:
	ld a,(hl)			;8a24
	inc a			;8a25
	inc a			;8a26
	cp b			;8a27
	ret nc			;8a28
	inc (hl)			;8a29
	inc (hl)			;8a2a
	jp 042d3h		;8a2b
L_8A2E:
	ld a,(hl)			;8a2e
	rra			;8a2f
	ret nc			;8a30
	ld a,(hl)			;8a31
	and a			;8a32
	ret z			;8a33
	dec (hl)			;8a34
	jp 042d3h		;8a35
L_8A38:
	ld a,(hl)			;8a38
	rra			;8a39
	ret c			;8a3a
	ld a,(hl)			;8a3b
	inc a			;8a3c
	cp b			;8a3d
	ret nc			;8a3e
	inc (hl)			;8a3f
	jp 042d3h		;8a40
L_8A43:
	ld de,0e26eh		;8a43
	ld hl,0e800h		;8a46
	ld a,(de)			;8a49
	and 0feh		;8a4a
	add a,a			;8a4c
	add a,a			;8a4d
	add a,a			;8a4e
	add a,020h		;8a4f
	ld (hl),a			;8a51
	inc hl			;8a52
	ld a,(de)			;8a53
	rra			;8a54
	ld a,018h		;8a55
	jr nc,L_8A5B		;8a57
	ld a,088h		;8a59
L_8A5B:
	ld (hl),a			;8a5b
	inc hl			;8a5c
	ld (hl),014h		;8a5d
	inc hl			;8a5f
	call L_8598		;8a60
	ret			;8a63
L_8A64:
	call L_8711		;8a64
	ret nc			;8a67
	ld hl,0e270h		;8a68
	ld de,0e271h		;8a6b
	ld bc,00007h		;8a6e
	ld (hl),020h		;8a71
	ldir		;8a73
	ld a,(0e26eh)		;8a75
	add a,a			;8a78
	add a,a			;8a79
	add a,a			;8a7a
	ld hl,0ee50h		;8a7b
	call 04094h		;8a7e
	ld de,0e270h		;8a81
	ld bc,00005h		;8a84
	ldir		;8a87
	call 05b38h		;8a89
	call 041e8h		;8a8c
	jp L_87CF		;8a8f
L_8A92:
	call L_8AAD		;8a92
	ld a,001h		;8a95
	ld (0e27eh),a		;8a97
	call 04238h		;8a9a
	ld a,(0e27fh)		;8a9d
	cp 002h		;8aa0
	jp z,L_87CF		;8aa2
	call 04ec7h		;8aa5
	xor a			;8aa8
	ld (0e25bh),a		;8aa9
	ret			;8aac
L_8AAD:
	ld a,(0f0f8h)		;8aad
	or a			;8ab0
	jr z,L_8ABA		;8ab1
	dec a			;8ab3
	jp z,L_9EEB		;8ab4
	jp 06a56h		;8ab7
L_8ABA:
	call 041bdh		;8aba
	call 0be1bh		;8abd
	jp 04192h		;8ac0
L_8AC3:
	ld a,(0e207h)		;8ac3
	and a			;8ac6
	ret z			;8ac7
	ld a,002h		;8ac8
	ld (0e27eh),a		;8aca
	call 04ec7h		;8acd
	xor a			;8ad0
	ld (0e25bh),a		;8ad1
	ret			;8ad4
L_8AD5:
	call 065f6h		;8ad5
	call 05b38h		;8ad8
	xor a			;8adb
	ld (0e24ah),a		;8adc
	inc a			;8adf
	ld (0e25bh),a		;8ae0
	ret			;8ae3
L_8AE4:
	ld a,(0e25bh)		;8ae4
	dec a			;8ae7
	call 0409eh		;8ae8

; ----------------------------------------------------------------------
; DATOS tabla_8AEB: 8 destinos del despachador p00:409E (call en p02:8AE8, el
;   indice en A): 8AFB, 885C, 889F, 8991, 8B41, 8B47, 8B6E, 8A02; lo leen
;   p02:8AE8 (16 bytes)
;   0x8aeb..0x8afb  (16 bytes)
DATA_tabla_8AEB:
	defw 08afbh,0885ch,0889fh,08991h,08b41h,08b47h,08b6eh,08a02h	; 8aeb

; ======================================================================
; CODIGO 0x8afb..0x8cab  (432 bytes)
; ======================================================================


L_8AFB:
	ld a,001h		;8afb
	ld (0e241h),a		;8afd
	call 052fdh		;8b00
	ld a,(0f0f4h)		;8b03
	and a			;8b06
	call nz,053eeh		;8b07
	call 076fah		;8b0a
	call L_8B16		;8b0d
	call 07560h		;8b10
	jp L_87F1		;8b13
L_8B16:
	xor a			;8b16
	ld hl,0e226h		;8b17
	ld de,0e227h		;8b1a
	ld bc,00032h		;8b1d
	ld (hl),a			;8b20
	ldir		;8b21
	ld hl,0e280h		;8b23
	ld de,0e281h		;8b26
	ld bc,00d7fh		;8b29
	ld (hl),a			;8b2c
	ldir		;8b2d
	ld (0e26dh),a		;8b2f
	ld (0e26eh),a		;8b32
	ld (0e27fh),a		;8b35
	ld (0e26fh),a		;8b38
	ld (0e27eh),a		;8b3b
	jp 05b38h		;8b3e
L_8B41:
	call L_8B7C		;8b41
	jp L_87CF		;8b44
L_8B47:
	call L_8AAD		;8b47
	ld a,(0e27fh)		;8b4a
	and a			;8b4d
	jp nz,L_87CF		;8b4e
	call 05bddh		;8b51
	call L_8FE3		;8b54
	call L_8F34		;8b57
	call L_8395		;8b5a
	ld a,001h		;8b5d
	ld (0e24ah),a		;8b5f
	ld (0e254h),a		;8b62
	ld a,(0e282h)		;8b65
	or a			;8b68
	ret nz			;8b69
	ld (0e294h),a		;8b6a
	ret			;8b6d
L_8B6E:
	ld a,(0e207h)		;8b6e
	and a			;8b71
	ret z			;8b72
	call 04ec7h		;8b73
	ld a,002h		;8b76
	ld (0e24ah),a		;8b78
	ret			;8b7b
L_8B7C:
	call 0532eh		;8b7c
	call 056b0h		;8b7f
	ld hl,0e2c0h		;8b82
	ld de,0e2c1h		;8b85
	ld bc,00d3fh		;8b88
	ld (hl),000h		;8b8b
	ldir		;8b8d
	call 05b38h		;8b8f
	xor a			;8b92
	ld (0e287h),a		;8b93
	ld (0edcdh),a		;8b96
	ret			;8b99
L_8B9A:
	call 041c7h		;8b9a
	ld a,(0e242h)		;8b9d
	ld b,a			;8ba0
	add a,a			;8ba1
	add a,b			;8ba2
	ld hl,0b8f8h		;8ba3
	call 04094h		;8ba6
	ld de,0e2f1h		;8ba9
	ldi		;8bac
	ldi		;8bae
	ld a,(hl)			;8bb0
	rlca			;8bb1
	rlca			;8bb2
	rlca			;8bb3
	and 007h		;8bb4
	ld (de),a			;8bb6
	inc de			;8bb7
	inc de			;8bb8
	inc de			;8bb9
	xor a			;8bba
	ld (de),a			;8bbb
	call 04192h		;8bbc
	jp 079b1h		;8bbf
L_8BC2:
	ld hl,0e2f3h		;8bc2
	ld a,(0e243h)		;8bc5
	cp (hl)			;8bc8
	ret nz			;8bc9
	ld a,(0e2f5h)		;8bca
	and a			;8bcd
	ret nz			;8bce
	ld a,(0e282h)		;8bcf
	ld b,a			;8bd2
	ld a,(0e284h)		;8bd3
	ld c,a			;8bd6
	ld a,(0e2f1h)		;8bd7
	add a,012h		;8bda
	sub b			;8bdc
	cp 004h		;8bdd
	ret nc			;8bdf
	ld a,(0e2f2h)		;8be0
	add a,00ah		;8be3
	sub c			;8be5
	cp 004h		;8be6
	ret nc			;8be8
	call L_8C83		;8be9
	xor a			;8bec
	ld (0e2f0h),a		;8bed
	ld hl,0e257h		;8bf0
	ld (hl),a			;8bf3
	inc hl			;8bf4
	ld (hl),a			;8bf5
	inc hl			;8bf6
	ld (hl),a			;8bf7
	inc a			;8bf8
	ld (0e249h),a		;8bf9
	ld hl,0e2f7h		;8bfc
	ld (hl),01eh		;8bff
	call 04292h		;8c01
	call 0531fh		;8c04
	xor a			;8c07
	ld (0e21bh),a		;8c08
	call L_8D02		;8c0b
	ld bc,00007h		;8c0e
	jp 00047h		;8c11   ; BIOS WRTVDP - Writes data in the VDP-register
L_8C14:
	ld a,(0e2f3h)		;8c14
	ld b,a			;8c17
	ld a,(0e243h)		;8c18
	cp b			;8c1b
	ret nz			;8c1c
	ld hl,09059h		;8c1d
	ld a,(0e2f6h)		;8c20
	add a,a			;8c23
	add a,a			;8c24
	add a,a			;8c25
	add a,a			;8c26
	call 04094h		;8c27
	ld bc,00404h		;8c2a
	ld de,(0e2f1h)		;8c2d
L_8C31:
	push bc			;8c31
	push de			;8c32
	ld b,c			;8c33
L_8C34:
	ld a,(hl)			;8c34
	push hl			;8c35
	call 053efh		;8c36
	pop hl			;8c39
	inc hl			;8c3a
	ld a,d			;8c3b
	add a,008h		;8c3c
	ld d,a			;8c3e
	djnz L_8C34		;8c3f
	pop de			;8c41
	pop bc			;8c42
	ld a,e			;8c43
	add a,008h		;8c44
	ld e,a			;8c46
	djnz L_8C31		;8c47
	ld de,(0e2f4h)		;8c49
	ld a,d			;8c4d
	and a			;8c4e
	ret z			;8c4f
	call 041c7h		;8c50
	ld a,e			;8c53
	ld hl,0b9adh		;8c54
	call 04d4dh		;8c57
	ld b,d			;8c5a
L_8C5B:
	ld de,(0e2f1h)		;8c5b
	ld a,(hl)			;8c5f
	and 003h		;8c60
	add a,a			;8c62
	add a,a			;8c63
	add a,a			;8c64
	add a,d			;8c65
	ld d,a			;8c66
	ld a,(hl)			;8c67
	and 00ch		;8c68
	add a,a			;8c6a
	add a,e			;8c6b
	ld e,a			;8c6c
	ld a,(0f0f4h)		;8c6d
	and a			;8c70
	ld a,060h		;8c71
	jr z,L_8C77		;8c73
	ld a,0aeh		;8c75
L_8C77:
	push hl			;8c77
	call 053efh		;8c78
	pop hl			;8c7b
	inc hl			;8c7c
	djnz L_8C5B		;8c7d
	call 04192h		;8c7f
	ret			;8c82
L_8C83:
	ld hl,0e500h		;8c83
	ld de,0e501h		;8c86
	ld bc,000ffh		;8c89
	ld (hl),000h		;8c8c
	ldir		;8c8e
	ld hl,0e300h		;8c90
	ld de,0e301h		;8c93
	ld bc,001ffh		;8c96
	ld (hl),000h		;8c99
	ldir		;8c9b
	call 05b38h		;8c9d
	jp 04eeah		;8ca0
L_8CA3:
	ld de,0e257h		;8ca3
	ld a,(de)			;8ca6
	dec a			;8ca7
	call 0409eh		;8ca8

; ----------------------------------------------------------------------
; DATOS tabla_8CAB: 8 destinos del despachador p00:409E (call en p02:8CA8, el
;   indice en A): 8CBB, 8CE4, 8D6A, 8DB5, 8DE7, 8E05, 8E0F, 8E16; lo leen
;   p02:8CA8 (16 bytes)
;   0x8cab..0x8cbb  (16 bytes)
DATA_tabla_8CAB:
	defw 08cbbh,08ce4h,08d6ah,08db5h,08de7h,08e05h,08e0fh,08e16h	; 8cab

; ======================================================================
; CODIGO 0x8cbb..0x8d3c  (129 bytes)
; ======================================================================


L_8CBB:
	ld a,(0e2f0h)		;8cbb
	cp 001h		;8cbe
	jr z,L_8CC4		;8cc0
	jr nc,L_8CD4		;8cc2
L_8CC4:
	ld hl,0e2f7h		;8cc4
	dec (hl)			;8cc7
	ret nz			;8cc8
	ld (hl),01eh		;8cc9
	dec hl			;8ccb
	inc (hl)			;8ccc
	ld hl,0e2f0h		;8ccd
	inc (hl)			;8cd0
	jp L_8C14		;8cd1
L_8CD4:
	ld hl,0e2f7h		;8cd4
	dec (hl)			;8cd7
	ret nz			;8cd8
	ld hl,0e257h		;8cd9
	inc (hl)			;8cdc
	inc hl			;8cdd
	ld (hl),000h		;8cde
	inc hl			;8ce0
	ld (hl),020h		;8ce1
	ret			;8ce3
L_8CE4:
	ld hl,0e259h		;8ce4
	dec (hl)			;8ce7
	jr nz,L_8CF5		;8ce8
	ld (hl),020h		;8cea
	dec hl			;8cec
	inc (hl)			;8ced
	ld a,(hl)			;8cee
	cp 004h		;8cef
	jp nc,L_8D5C		;8cf1
	inc hl			;8cf4
L_8CF5:
	ld a,(hl)			;8cf5
	and 00fh		;8cf6
	jr nz,L_8D01		;8cf8
	ld de,0e282h		;8cfa
	ld a,(de)			;8cfd
	sub 002h		;8cfe
	ld (de),a			;8d00
L_8D01:
	ld a,(hl)			;8d01
L_8D02:
	rra			;8d02
	rra			;8d03
	rra			;8d04
	rra			;8d05
	and 001h		;8d06
	ld c,a			;8d08
	ld a,(0e258h)		;8d09
	add a,a			;8d0c
	ld b,a			;8d0d
	add a,c			;8d0e
	add a,a			;8d0f
	add a,a			;8d10
	add a,a			;8d11
	add a,a			;8d12
	ld c,a			;8d13
	ld a,b			;8d14
	add a,a			;8d15
	add a,a			;8d16
	ld hl,08d3ch		;8d17
	call 04094h		;8d1a
	ld de,0e800h		;8d1d
	ld b,004h		;8d20
L_8D22:
	ld a,(0e282h)		;8d22
	add a,(hl)			;8d25
	ld (de),a			;8d26
	inc hl			;8d27
	inc de			;8d28
	ld a,(0e284h)		;8d29
	ld (de),a			;8d2c
	inc de			;8d2d
	ld a,c			;8d2e
	ld (de),a			;8d2f
	ld a,c			;8d30
	add a,004h		;8d31
	ld c,a			;8d33
	inc de			;8d34
	ld a,(hl)			;8d35
	ld (de),a			;8d36
	inc hl			;8d37
	inc de			;8d38
	djnz L_8D22		;8d39
	ret			;8d3b

; ----------------------------------------------------------------------
; DATOS resto_8D3C: lo apuntan con el banco puesto p02:8D17 (0x8D3C); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p02:8D17 (32 bytes)
;   0x8d3c..0x8d5c  (32 bytes)
DATA_resto_8D3C:
	defb 0ffh,007h,000h,00ah,0f8h,001h,008h,001h,000h,007h,000h,00ah,0f8h,001h,008h,001h	; 8d3c  ................
	defb 000h,007h,000h,00ah,000h,001h,000h,000h,000h,007h,000h,001h,000h,000h,000h,000h	; 8d4c  ................

; ======================================================================
; CODIGO 0x8d5c..0x8fac  (592 bytes)
; ======================================================================


L_8D5C:
	call 05b38h		;8d5c
	ld hl,0e257h		;8d5f
	inc (hl)			;8d62
	inc hl			;8d63
	ld (hl),000h		;8d64
	inc hl			;8d66
	ld (hl),004h		;8d67
	ret			;8d69
L_8D6A:
	ld hl,0e259h		;8d6a
	dec (hl)			;8d6d
	ret nz			;8d6e
	ld a,(0e258h)		;8d6f
	ld c,a			;8d72
	add a,a			;8d73
	add a,a			;8d74
	add a,a			;8d75
	ld e,a			;8d76
	push bc			;8d77
	call L_8DA6		;8d78
	pop bc			;8d7b
	ld a,017h		;8d7c
	sub c			;8d7e
	add a,a			;8d7f
	add a,a			;8d80
	add a,a			;8d81
	ld e,a			;8d82
	call L_8DA6		;8d83
	ld hl,0e258h		;8d86
	inc (hl)			;8d89
	ld a,(hl)			;8d8a
	inc hl			;8d8b
	ld (hl),004h		;8d8c
	cp 00ch		;8d8e
	ret c			;8d90
	ld hl,0e800h		;8d91
	ld b,002h		;8d94
L_8D96:
	ld a,(hl)			;8d96
	sub 010h		;8d97
	ld (hl),a			;8d99
	ld a,004h		;8d9a
	call 04094h		;8d9c
	djnz L_8D96		;8d9f
	ld hl,0e257h		;8da1
	inc (hl)			;8da4
	ret			;8da5
L_8DA6:
	ld b,020h		;8da6
	ld d,000h		;8da8
L_8DAA:
	xor a			;8daa
	call 053efh		;8dab
	ld a,d			;8dae
	add a,008h		;8daf
	ld d,a			;8db1
	djnz L_8DAA		;8db2
	ret			;8db4
L_8DB5:
	ld hl,0e242h		;8db5
	inc (hl)			;8db8
	xor a			;8db9
	ld (0e249h),a		;8dba
	call 04ec7h		;8dbd
	call 041bdh		;8dc0
	ld hl,0b256h		;8dc3
	call 04f0bh		;8dc6
	call 04192h		;8dc9
	ld c,0ffh		;8dcc
	ld hl,05d05h		;8dce
	ld de,06068h		;8dd1
	call 04f15h		;8dd4
	ld de,08868h		;8dd7
	call 04d20h		;8dda
	ld a,03ch		;8ddd
L_8DDF:
	ld (0e204h),a		;8ddf
	ld hl,0e257h		;8de2
	inc (hl)			;8de5
	ret			;8de6
L_8DE7:
	ld hl,0e204h		;8de7
	dec (hl)			;8dea
	ret nz			;8deb
	ld hl,0e240h		;8dec
	ld a,(hl)			;8def
	cp 099h		;8df0
	jr nc,L_8DF8		;8df2
	add a,001h		;8df4
	daa			;8df6
	ld (hl),a			;8df7
L_8DF8:
	ld de,08868h		;8df8
	push hl			;8dfb
	call 04d20h		;8dfc
	pop hl			;8dff
	inc (hl)			;8e00
	ld a,078h		;8e01
	jr L_8DDF		;8e03
L_8E05:
	ld hl,0e204h		;8e05
	dec (hl)			;8e08
	ret nz			;8e09
	call 0677dh		;8e0a
	jr L_8DDF		;8e0d
L_8E0F:
	ld a,(0e207h)		;8e0f
	and a			;8e12
	ret z			;8e13
	jr L_8DDF		;8e14
L_8E16:
	ld hl,0e204h		;8e16
	dec (hl)			;8e19
	ret nz			;8e1a
	ld hl,0e257h		;8e1b
	ld (hl),000h		;8e1e
	ret			;8e20
L_8E21:
	push ix		;8e21
	call L_8E2D		;8e23
	pop ix		;8e26
	call L_8F64		;8e28
	jr L_8E74		;8e2b
L_8E2D:
	ld hl,0ee50h		;8e2d
	ld b,040h		;8e30
L_8E32:
	ld a,(hl)			;8e32
	or a			;8e33
	ret z			;8e34
	call L_8F97		;8e35
	ld a,(ix+000h)		;8e38
	or a			;8e3b
	jr z,L_8E58		;8e3c
	and 0f0h		;8e3e
	jr z,L_8E49		;8e40
	cp 0f0h		;8e42
	jr nz,L_8E58		;8e44
	call L_8E5C		;8e46
L_8E49:
	ld a,(0e243h)		;8e49
	cp (ix+003h)		;8e4c
	jr nz,L_8E58		;8e4f
	push hl			;8e51
	push bc			;8e52
	call L_8E65		;8e53
	pop bc			;8e56
	pop hl			;8e57
L_8E58:
	inc hl			;8e58
	djnz L_8E32		;8e59
	ret			;8e5b
L_8E5C:
	ld a,(ix+000h)		;8e5c
	and 01fh		;8e5f
	ld (ix+000h),a		;8e61
	ret			;8e64
L_8E65:
	push ix		;8e65
	pop hl			;8e67
	inc l			;8e68
	ld e,(hl)			;8e69
	inc l			;8e6a
	ld d,(hl)			;8e6b
	inc l			;8e6c
	inc l			;8e6d
	ld bc,00202h		;8e6e
	jp 053d6h		;8e71
L_8E74:
	ld hl,0ee8fh		;8e74
	ld b,040h		;8e77
L_8E79:
	ld a,(hl)			;8e79
	or a			;8e7a
	jr z,L_8E8F		;8e7b
	call L_8F97		;8e7d
	ld a,(0e243h)		;8e80
	cp (ix+003h)		;8e83
	jr nz,L_8E8F		;8e86
	push bc			;8e88
	push hl			;8e89
	call L_8E93		;8e8a
	pop hl			;8e8d
	pop bc			;8e8e
L_8E8F:
	dec hl			;8e8f
	djnz L_8E79		;8e90
	ret			;8e92
L_8E93:
	ld a,(ix+000h)		;8e93
	or a			;8e96
	ret z			;8e97
	and 0f0h		;8e98
	ret nz			;8e9a
	call L_8EB7		;8e9b
	ld hl,09041h		;8e9e
	ld a,(ix+000h)		;8ea1
	dec a			;8ea4
	add a,a			;8ea5
	add a,a			;8ea6
	ld e,a			;8ea7
	ld d,000h		;8ea8
	add hl,de			;8eaa
	ld e,(ix+001h)		;8eab
	ld d,(ix+002h)		;8eae
	ld bc,00202h		;8eb1
	jp 053d6h		;8eb4
L_8EB7:
	ld l,(ix+001h)		;8eb7
	ld h,(ix+002h)		;8eba
	call 04d7ch		;8ebd
	push ix		;8ec0
	pop de			;8ec2
	ld a,004h		;8ec3
	add a,e			;8ec5
	ld e,a			;8ec6
	jp 053c1h		;8ec7
L_8ECA:
	call L_8EF3		;8eca
	ld hl,0e300h		;8ecd
	ld de,0e810h		;8ed0
	ld b,040h		;8ed3
L_8ED5:
	push bc			;8ed5
	push hl			;8ed6
	ld a,(hl)			;8ed7
	and 00fh		;8ed8
	cp 003h		;8eda
	jr nc,L_8EEA		;8edc
	ld a,(hl)			;8ede
	rra			;8edf
	rra			;8ee0
	rra			;8ee1
	rra			;8ee2
	and 00fh		;8ee3
	cp 002h		;8ee5
	call nc,L_8F01		;8ee7
L_8EEA:
	pop hl			;8eea
	ld bc,00008h		;8eeb
	add hl,bc			;8eee
	pop bc			;8eef
	djnz L_8ED5		;8ef0
	ret			;8ef2
L_8EF3:
	ld b,006h		;8ef3
	ld hl,0e810h		;8ef5
L_8EF8:
	ld (hl),0e0h		;8ef8
	ld de,00004h		;8efa
	add hl,de			;8efd
	djnz L_8EF8		;8efe
	ret			;8f00
L_8F01:
	push de			;8f01
	call L_8F0B		;8f02
	pop de			;8f05
	inc e			;8f06
	inc e			;8f07
	inc e			;8f08
	inc e			;8f09
	ret			;8f0a
L_8F0B:
	ld a,(hl)			;8f0b
	ex af,af'			;8f0c
	ld a,(0e243h)		;8f0d
	inc l			;8f10
	ldi		;8f11
	ldi		;8f13
	cp (hl)			;8f15
	jr nz,L_8F2E		;8f16
	inc l			;8f18
	ld a,(hl)			;8f19
	ld hl,08fafh		;8f1a
	call 04094h		;8f1d
	ldi		;8f20
	ex af,af'			;8f22
	and 00fh		;8f23
	ld hl,08fach		;8f25
	call 04094h		;8f28
	ldi		;8f2b
	ret			;8f2d
L_8F2E:
	dec de			;8f2e
	dec de			;8f2f
	ld a,0e0h		;8f30
	ld (de),a			;8f32
	ret			;8f33
L_8F34:
	ld ix,0e300h		;8f34
	ld hl,0ee50h		;8f38
	ld bc,04001h		;8f3b
	ld de,00008h		;8f3e
L_8F41:
	ld a,(ix+000h)		;8f41
	or a			;8f44
	jr z,L_8F49		;8f45
	ld (hl),c			;8f47
	inc hl			;8f48
L_8F49:
	inc c			;8f49
	add ix,de		;8f4a
	djnz L_8F41		;8f4c
	ld (hl),000h		;8f4e
	ret			;8f50
L_8F51:
	call L_8F78		;8f51
	ld a,c			;8f54
	or a			;8f55
	ret z			;8f56
	ld b,000h		;8f57
	ld d,h			;8f59
	ld e,l			;8f5a
	ld a,(hl)			;8f5b
	dec hl			;8f5c
	lddr		;8f5d
	ld hl,0ee50h		;8f5f
	ld (hl),a			;8f62
	ret			;8f63
L_8F64:
	call L_8F78		;8f64
	ld d,h			;8f67
	ld e,l			;8f68
	ld b,(hl)			;8f69
	inc hl			;8f6a
	ld a,(hl)			;8f6b
	or a			;8f6c
	ret z			;8f6d
	push bc			;8f6e
L_8F6F:
	ldi		;8f6f
	ld a,(hl)			;8f71
	or a			;8f72
	jr nz,L_8F6F		;8f73
	pop af			;8f75
	ld (de),a			;8f76
	ret			;8f77
L_8F78:
	push ix		;8f78
	pop hl			;8f7a
	ld de,0e300h		;8f7b
	and a			;8f7e
	sbc hl,de		;8f7f
	ld a,l			;8f81
	rr h		;8f82
	rra			;8f84
	rr h		;8f85
	rra			;8f87
	rr h		;8f88
	rra			;8f8a
	inc a			;8f8b
	ld c,000h		;8f8c
	ld hl,0ee50h		;8f8e
L_8F91:
	cp (hl)			;8f91
	ret z			;8f92
	inc hl			;8f93
	inc c			;8f94
	jr L_8F91		;8f95
L_8F97:
	push hl			;8f97
	call L_8F9D		;8f98
	pop hl			;8f9b
	ret			;8f9c
L_8F9D:
	dec a			;8f9d
	ld l,a			;8f9e
	ld h,000h		;8f9f
	add hl,hl			;8fa1
	add hl,hl			;8fa2
	add hl,hl			;8fa3
	ld de,0e300h		;8fa4
	add hl,de			;8fa7
	push hl			;8fa8
	pop ix		;8fa9
	ret			;8fab

; ----------------------------------------------------------------------
; DATOS resto_8FAC: lo apuntan con el banco puesto p02:8F25 (0x8FAC), p02:8F1A
;   (0x8FAF); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p02:8F25, p02:8F1A (10 bytes)
;   0x8fac..0x8fb6  (10 bytes)
DATA_resto_8FAC:
	defb 00fh,00fh,00ah,010h,014h,018h,01ch,020h,024h,028h	; 8fac  ....... $(

; ======================================================================
; CODIGO 0x8fb6..0x9010  (90 bytes)
; ======================================================================


L_8FB6:
	ld hl,0e280h		;8fb6
	ld de,0e281h		;8fb9
	ld (hl),000h		;8fbc
	ld bc,00040h		;8fbe
	ldir		;8fc1
	call 041c7h		;8fc3
	ld a,(0e242h)		;8fc6
	ld b,a			;8fc9
	add a,a			;8fca
	add a,b			;8fcb
	ld hl,0b844h		;8fcc
	call 04094h		;8fcf
	ld a,(hl)			;8fd2
	ld (0e282h),a		;8fd3
	inc hl			;8fd6
	ld a,(hl)			;8fd7
	ld (0e284h),a		;8fd8
	inc hl			;8fdb
	ld a,(hl)			;8fdc
	ld (0e243h),a		;8fdd
	call 04192h		;8fe0
L_8FE3:
	ld hl,09010h		;8fe3
	ld de,0e28ah		;8fe6
	ld bc,00008h		;8fe9
	ldir		;8fec
	ld a,004h		;8fee
	ld (0e296h),a		;8ff0
	ld a,001h		;8ff3
	ld (0e285h),a		;8ff5
	ld a,(0e202h)		;8ff8
	and 040h		;8ffb
	ld a,00eh		;8ffd
	jr nz,L_9002		;8fff
	xor a			;9001
L_9002:
	ld (0e280h),a		;9002
	ld a,020h		;9005
	ld (0e2a8h),a		;9007
	ld a,006h		;900a
	ld (0e2a4h),a		;900c
	ret			;900f

; ----------------------------------------------------------------------
; DATOS resto_9010: lo apuntan con el banco puesto p02:8FE3 (0x9010); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p02:8FE3 (8 bytes)
;   0x9010..0x9018  (8 bytes)
DATA_resto_9010:
	defb 000h,0feh,000h,002h,000h,0feh,000h,002h	; 9010  ........

; ======================================================================
; CODIGO 0x9018..0x903d  (37 bytes)
; ======================================================================


L_9018:
	xor a			;9018
	ld (0e295h),a		;9019
	ld (0e285h),a		;901c
	ld a,(0e280h)		;901f
	cp 004h		;9022
	jr nz,L_902B		;9024
	ld a,004h		;9026
	ld (0e285h),a		;9028
L_902B:
	ld a,001h		;902b
	ld (0e298h),a		;902d
	ld hl,0e215h		;9030
	ld (hl),000h		;9033
	ld a,003h		;9035
	ld (0e296h),a		;9037
	jp L_9D06		;903a

; ----------------------------------------------------------------------
; DATOS resto_903D: lo apuntan con el banco puesto p01:6347 (0x903D), p02:819C
;   (0x903D), p02:8119 (0x9041), p02:8E9E (0x9041), p00:48CA (0x9048),
;   p01:7A04 (0x9059); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p01:6347, p02:819C, p02:8119, p02:8E9E, p00:48CA,
;   p01:7A04 (154 bytes)
;   0x903d..0x90d7  (154 bytes)
DATA_resto_903D:
	defb 098h,099h,09ah,09bh,068h,070h,067h,073h,06dh,000h,06eh,06fh,000h,0a3h,06bh,0a4h	; 903d  ....hpgsm.no..k.
	defb 069h,06ch,06ah,0a0h,064h,063h,065h,072h,0a1h,0a2h,066h,071h,0aeh,0b2h,0c6h,0c2h	; 904d  ilj.dcer..fq....
	defb 0afh,08eh,090h,0c3h,0b0h,091h,074h,0c4h,0b1h,0b3h,0c7h,0c5h,0aeh,000h,000h,0c6h	; 905d  ......t.........
	defb 08eh,000h,000h,090h,091h,081h,082h,074h,0b3h,088h,088h,0c7h,083h,000h,000h,084h	; 906d  .......t........
	defb 085h,000h,000h,086h,085h,081h,082h,086h,087h,088h,088h,089h,08ah,08dh,08bh,08fh	; 907d  ................
	defb 0a8h,0a9h,0aah,0abh,0bfh,0beh,0bdh,0bch,0b4h,000h,0b7h,0b9h,09ch,09dh,0b7h,0b9h	; 908d  ................
	defb 0b5h,000h,0a5h,0bah,09eh,09fh,0a5h,0bah,0b6h,000h,0b8h,0bbh,0a6h,0a7h,0b8h,0bbh	; 909d  ................
	defb 000h,0c8h,0cdh,0cbh,09ch,09dh,0cdh,0cbh,000h,0c9h,0ceh,0a5h,09eh,09fh,0ceh,0a5h	; 90ad  ................
	defb 000h,0cah,0cfh,0cch,0a6h,0a7h,0cfh,0cch,07eh,075h,07fh,077h,080h,076h,092h,078h	; 90bd  ........~u.w.v.x
	defb 093h,07ah,094h,079h,095h,07bh,096h,07dh,096h,07ch	; 90cd  .z.y.{.}.|

; ======================================================================
; CODIGO 0x90d7..0x9112  (59 bytes)
; ======================================================================


L_90D7:
	ld a,(0e2f9h)		;90d7
	cp 003h		;90da
	ret c			;90dc
	ld ix,0e600h		;90dd
	ld b,010h		;90e1
L_90E3:
	push bc			;90e3
	ld a,(ix+000h)		;90e4
	cp 005h		;90e7
	call z,L_90F5		;90e9
	ld bc,00010h		;90ec
	add ix,bc		;90ef
	pop bc			;90f1
	djnz L_90E3		;90f2
	ret			;90f4
L_90F5:
	ld a,(ix+003h)		;90f5
	cp 010h		;90f8
	jr nc,L_9102		;90fa
	ld (ix+003h),010h		;90fc
	jr L_9109		;9100
L_9102:
	cp 0e8h		;9102
	ret c			;9104
	ld (ix+003h),0e0h		;9105
L_9109:
	jp L_92BA		;9109
L_910C:
	ld a,(ix+001h)		;910c
	call 0409eh		;910f

; ----------------------------------------------------------------------
; DATOS tabla_9112: 3 destinos del despachador p00:409E (call en p02:910F, el
;   indice en A): 9118, 9182, 9218; lo leen p02:910F (6 bytes)
;   0x9112..0x9118  (6 bytes)
DATA_tabla_9112:
	defw 09118h,09182h,09218h	; 9112  -> L_9118 L_9182 L_9218

; ======================================================================
; CODIGO 0x9118..0x929e  (390 bytes)
; ======================================================================


L_9118:
	call L_9262		;9118
	jr nc,L_9127		;911b
	ld a,002h		;911d
	ld (ix+001h),a		;911f
	dec a			;9122
	ld (ix+006h),a		;9123
	ret			;9126
L_9127:
	ld a,(0e243h)		;9127
	cp (ix+004h)		;912a
	ret nz			;912d
	ld a,(0e280h)		;912e
	and a			;9131
	ret nz			;9132
	ld a,(0e282h)		;9133
	add a,00fh		;9136
	sub (ix+002h)		;9138
	cp 010h		;913b
	jr nc,L_917D		;913d
	ld a,(0e294h)		;913f
	and a			;9142
	ld a,(0e284h)		;9143
	ld b,(ix+003h)		;9146
	jr z,L_9165		;9149
	add a,014h		;914b
	sub b			;914d
	cp 008h		;914e
	jr nc,L_917D		;9150
	ld a,(0e208h)		;9152
	and 008h		;9155
	jr z,L_917D		;9157
	dec (ix+006h)		;9159
	ret nz			;915c
	res 1,(ix+007h)		;915d
L_9161:
	inc (ix+001h)		;9161
	ret			;9164
L_9165:
	sub 00ch		;9165
	sub b			;9167
	cp 008h		;9168
	jr nc,L_917D		;916a
	ld a,(0e208h)		;916c
	and 004h		;916f
	jr z,L_917D		;9171
	dec (ix+006h)		;9173
	ret nz			;9176
	set 1,(ix+007h)		;9177
	jr L_9161		;917b
L_917D:
	ld (ix+006h),00ah		;917d
	ret			;9181
L_9182:
	bit 1,(ix+007h)		;9182
	ld bc,00002h		;9186
	jr nz,L_918E		;9189
	ld bc,0f003h		;918b
L_918E:
	ld a,(ix+003h)		;918e
	cp b			;9191
	jr z,L_91CC		;9192
	call L_925C		;9194
	jr nc,L_91C6		;9197
	bit 1,(ix+007h)		;9199
	ld a,(ix+003h)		;919d
	ld (ix+00bh),a		;91a0
	jr nz,L_91A9		;91a3
	add a,008h		;91a5
	jr L_91AB		;91a7
L_91A9:
	sub 008h		;91a9
L_91AB:
	ld (ix+003h),a		;91ab
	set 0,(ix+007h)		;91ae
	call 04297h		;91b2
	ld l,(ix+002h)		;91b5
	ld (ix+00ah),l		;91b8
	call L_9262		;91bb
	jr nc,L_91C6		;91be
	ld (ix+006h),001h		;91c0
	jr L_9161		;91c4
L_91C6:
	xor a			;91c6
	ld (ix+001h),a		;91c7
	jr L_917D		;91ca
L_91CC:
	set 0,(ix+007h)		;91cc
	bit 1,(ix+007h)		;91d0
	ld bc,01004h		;91d4
	jr z,L_91DC		;91d7
	ld bc,0e003h		;91d9
L_91DC:
	push bc			;91dc
	ld h,(ix+003h)		;91dd
	ld l,(ix+002h)		;91e0
	ld (ix+003h),b		;91e3
	call L_92F3		;91e6
	call L_931A		;91e9
	pop bc			;91ec
	call L_91F3		;91ed
	jp L_91C6		;91f0
L_91F3:
	push bc			;91f3
	call L_93B3		;91f4
	call L_9204		;91f7
	pop bc			;91fa
	ld b,a			;91fb
	ld a,c			;91fc
	call 05c2fh		;91fd
	ld (ix+004h),l		;9200
	ret			;9203
L_9204:
	ld a,(ix+004h)		;9204
	ld hl,0e788h		;9207
	ld bc,03000h		;920a
L_920D:
	cp (hl)			;920d
	jr z,L_9216		;920e
	inc c			;9210
	inc hl			;9211
	djnz L_920D		;9212
	ld c,000h		;9214
L_9216:
	ld a,c			;9216
	ret			;9217
L_9218:
	dec (ix+006h)		;9218
	ret nz			;921b
	ld (ix+006h),002h		;921c
	set 0,(ix+007h)		;9220
	ld a,(ix+002h)		;9224
	ld (ix+00ah),a		;9227
	add a,008h		;922a
	ld (ix+002h),a		;922c
	ld e,a			;922f
	ld h,(ix+003h)		;9230
	ld (ix+00bh),h		;9233
	cp 0b8h		;9236
	jr nc,L_9247		;9238
	cp 0b0h		;923a
	ret nc			;923c
	call L_9262		;923d
	ret c			;9240
	call 0429ch		;9241
	jp L_91C6		;9244
L_9247:
	ld h,(ix+00bh)		;9247
	ld l,(ix+00ah)		;924a
	ld (ix+002h),000h		;924d
	call L_92F3		;9251
	call L_931A		;9254
	ld c,002h		;9257
	jp L_91F3		;9259
L_925C:
	call L_927D		;925c
	jp L_9DAC		;925f
L_9262:
	call L_927D		;9262
	ld bc,00410h		;9265
	add hl,bc			;9268
	push hl			;9269
	push de			;926a
	call L_9D5F		;926b
	pop de			;926e
	pop hl			;926f
	cp 001h		;9270
	ret nc			;9272
	ld a,h			;9273
	add a,008h		;9274
	ld h,a			;9276
	call L_9D5F		;9277
	cp 001h		;927a
	ret			;927c
L_927D:
	ld a,(ix+004h)		;927d
	call L_928A		;9280
	ld h,(ix+003h)		;9283
	ld l,(ix+002h)		;9286
	ret			;9289
L_928A:
	ld l,a			;928a
	dec l			;928b
	ld h,000h		;928c
	add hl,hl			;928e
	add hl,hl			;928f
	add hl,hl			;9290
	add hl,hl			;9291
	add hl,hl			;9292
	add hl,hl			;9293
	ld d,h			;9294
	ld e,l			;9295
	add hl,hl			;9296
	add hl,de			;9297
	ld de,0e900h		;9298
	add hl,de			;929b
	ex de,hl			;929c
	ret			;929d

; ----------------------------------------------------------------------
; DATOS sin identificar  0x929e..0x92ba  (28 bytes)
DATA_929E:
	defb 0cdh,0f3h,092h,0d5h,0cdh,01ah,093h,0e1h,0cdh,0c3h,092h,03eh,003h,0ddh,066h,003h	; 929e  ...........>..f.
	defb 0ddh,06eh,002h,0ddh,056h,004h,001h,002h,002h,0c3h,0f7h,061h	; 92ae  .n..V......a

; ======================================================================
; CODIGO 0x92ba..0x934f  (149 bytes)
; ======================================================================


L_92BA:
	ld h,(ix+003h)		;92ba
	ld l,(ix+002h)		;92bd
	call L_92F3		;92c0
	ld a,(ix+004h)		;92c3
	ld (ix+009h),a		;92c6
	ld bc,(0e2feh)		;92c9
	ld de,(0e2fch)		;92cd
	push hl			;92d1
	call L_92DA		;92d2
	pop hl			;92d5
	ld a,l			;92d6
	add a,008h		;92d7
	ld l,a			;92d9
L_92DA:
	push hl			;92da
	push de			;92db
	push bc			;92dc
	call L_9D5F		;92dd
	pop bc			;92e0
	pop de			;92e1
	pop hl			;92e2
	ld (bc),a			;92e3
	inc bc			;92e4
	ld a,h			;92e5
	add a,008h		;92e6
	ld h,a			;92e8
	push de			;92e9
	push bc			;92ea
	call L_9D5F		;92eb
	pop bc			;92ee
	pop de			;92ef
	ld (bc),a			;92f0
	inc bc			;92f1
	ret			;92f2
L_92F3:
	exx			;92f3
	ld a,(ix+004h)		;92f4
	call L_928A		;92f7
	ld (0e2fch),de		;92fa
	push ix		;92fe
	pop hl			;9300
	ld a,l			;9301
	and 0f0h		;9302
	rrca			;9304
	rrca			;9305
	ld hl,0ef40h		;9306
	call 04094h		;9309
	ld (0e2feh),hl		;930c
	exx			;930f
	ret			;9310
L_9311:
	ld h,(ix+003h)		;9311
	ld l,(ix+002h)		;9314
	call L_92F3		;9317
L_931A:
	ld a,(ix+004h)		;931a
	cp (ix+009h)		;931d
	ret nz			;9320
	ld de,(0e2feh)		;9321
	push hl			;9325
	call L_932E		;9326
	pop hl			;9329
	ld a,l			;932a
	add a,008h		;932b
	ld l,a			;932d
L_932E:
	push hl			;932e
	push de			;932f
	ld a,(de)			;9330
	ld d,(ix+004h)		;9331
	ld bc,00101h		;9334
	call 061f7h		;9337
	pop de			;933a
	pop hl			;933b
	inc de			;933c
	ld a,h			;933d
	add a,008h		;933e
	ld h,a			;9340
	ld a,(de)			;9341
	push de			;9342
	ld d,(ix+004h)		;9343
	ld bc,00101h		;9346
	call 061f7h		;9349
	pop de			;934c
	inc de			;934d
	ret			;934e

; ----------------------------------------------------------------------
; DATOS sin identificar  0x934f..0x936b  (28 bytes)
DATA_934F:
	defb 0cdh,0b3h,093h,0ddh,066h,00bh,0ddh,06eh,00ah,0ddh,056h,003h,0ddh,05eh,002h,0cdh	; 934f  ....f..n..V..^..
	defb 09eh,092h,03ah,043h,0e2h,0ddh,0beh,009h,0c0h,0cdh,07fh,093h	; 935f  ..:C........

; ======================================================================
; CODIGO 0x936b..0x9451  (230 bytes)
; ======================================================================


L_936B:
	ld hl,09089h		;936b
	ld d,(ix+003h)		;936e
	ld e,(ix+002h)		;9371
	ld bc,00202h		;9374
	jp 053d6h		;9377
L_937A:
	call L_937F		;937a
	jr L_936B		;937d
L_937F:
	ld h,(ix+003h)		;937f
	ld l,(ix+002h)		;9382
	ld (ix+00bh),h		;9385
	ld (ix+00ah),l		;9388
	ld a,(0f0f4h)		;938b
	and a			;938e
	jr nz,L_939F		;938f
	call 04d7ch		;9391
	push ix		;9394
	pop de			;9396
	ld a,00ch		;9397
	call 04099h		;9399
	jp 053c1h		;939c
L_939F:
	push ix		;939f
	pop de			;93a1
	ld a,e			;93a2
	add a,a			;93a3
	ld d,a			;93a4
	ld e,040h		;93a5
	jr nc,L_93AB		;93a7
	ld e,050h		;93a9
L_93AB:
	ld bc,01010h		;93ab
	ld a,004h		;93ae
	jp 04f66h		;93b0
L_93B3:
	ld d,(ix+00bh)		;93b3
	ld e,(ix+00ah)		;93b6
L_93B9:
	ld a,(0e243h)		;93b9
	cp (ix+009h)		;93bc
	ret nz			;93bf
	push ix		;93c0
	pop hl			;93c2
	ld a,(0f0f4h)		;93c3
	and a			;93c6
	jr nz,L_93D4		;93c7
	ld a,00ch		;93c9
	call 04094h		;93cb
	ld bc,00202h		;93ce
	jp 053d6h		;93d1
L_93D4:
	push ix		;93d4
	pop hl			;93d6
	ld a,l			;93d7
	add a,a			;93d8
	ld h,a			;93d9
	ld l,040h		;93da
	jr nc,L_93E0		;93dc
	ld l,050h		;93de
L_93E0:
	ld bc,01010h		;93e0
	ld a,001h		;93e3
	jp 04f66h		;93e5
L_93E8:
	ld ix,0e600h		;93e8
	ld b,010h		;93ec
L_93EE:
	push bc			;93ee
	ld a,(ix+000h)		;93ef
	cp 005h		;93f2
	call z,L_9400		;93f4
	ld bc,00010h		;93f7
	add ix,bc		;93fa
	pop bc			;93fc
	djnz L_93EE		;93fd
	ret			;93ff
L_9400:
	ld a,(0e243h)		;9400
	cp (ix+004h)		;9403
	ret nz			;9406
	call L_92F3		;9407
	ld h,(ix+003h)		;940a
	ld l,(ix+002h)		;940d
	push hl			;9410
	pop hl			;9411
	call L_937F		;9412
	jp L_936B		;9415
L_9418:
	ld ix,0e600h		;9418
	ld b,010h		;941c
L_941E:
	push bc			;941e
	ld a,(ix+000h)		;941f
	cp 005h		;9422
	call z,L_9430		;9424
	ld bc,00010h		;9427
	add ix,bc		;942a
	pop bc			;942c
	djnz L_941E		;942d
	ret			;942f
L_9430:
	ld a,(0e243h)		;9430
	cp (ix+004h)		;9433
	ret nz			;9436
	call L_92F3		;9437
	ld h,(ix+003h)		;943a
	ld l,(ix+002h)		;943d
	push hl			;9440
	pop de			;9441
	jp L_93B9		;9442
L_9445:
	call L_944B		;9445
	jp L_9BFD		;9448
L_944B:
	ld a,(0e280h)		;944b
	call 0409eh		;944e

; ----------------------------------------------------------------------
; DATOS tabla_9451: 15 destinos del despachador p00:409E (call en p02:944E, el
;   indice en A): 946F, 9711, 9790, 9871, 9896, 989D, 98D1, 98ED, 9905, 9905,
;   9986, 9990, 999A, 99A4, 99BD; lo leen p02:944E (30 bytes)
;   0x9451..0x946f  (30 bytes)
DATA_tabla_9451:
	defw 0946fh,09711h,09790h,09871h,09896h,0989dh,098d1h,098edh	; 9451
	defw 09905h,09905h,09986h,09990h,0999ah,099a4h,099bdh	; 9461

; ======================================================================
; CODIGO 0x946f..0x94c6  (87 bytes)
; ======================================================================


L_946F:
	call L_9BA5		;946f
	call L_9A70		;9472
	call L_94CE		;9475
	call L_9A93		;9478
	jr nz,L_9483		;947b
	call L_99DF		;947d
	jp nz,L_9555		;9480
L_9483:
	call L_95C6		;9483
	ld a,(0e280h)		;9486
	or a			;9489
	ret nz			;948a
	call L_94F8		;948b
	ld a,(0e280h)		;948e
	or a			;9491
	ret nz			;9492
	ld a,(0e288h)		;9493
	and 00ch		;9496
	jr z,L_94C0		;9498
L_949A:
	ld hl,0e296h		;949a
	dec (hl)			;949d
	ret nz			;949e
	ld (hl),004h		;949f
L_94A1:
	ld a,(0e295h)		;94a1
	inc a			;94a4
	and 003h		;94a5
	ld b,a			;94a7
	ld (0e295h),a		;94a8
	ld a,(0e294h)		;94ab
	or a			;94ae
	ld hl,094c6h		;94af
	jr z,L_94B7		;94b2
	ld hl,094cah		;94b4
L_94B7:
	ld a,b			;94b7
	call 04094h		;94b8
	ld a,(hl)			;94bb
	ld (0e285h),a		;94bc
	ret			;94bf
L_94C0:
	ld a,001h		;94c0
	ld (0e296h),a		;94c2
	ret			;94c5

; ----------------------------------------------------------------------
; DATOS resto_94C6: lo apuntan con el banco puesto p02:94AF (0x94C6), p02:94B4
;   (0x94CA); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p02:94AF, p02:94B4 (8 bytes)
;   0x94c6..0x94ce  (8 bytes)
DATA_resto_94C6:
	defb 000h,001h,002h,001h,003h,004h,005h,004h	; 94c6  ........

; ======================================================================
; CODIGO 0x94ce..0x95f6  (296 bytes)
; ======================================================================


L_94CE:
	ld a,(0e2a6h)		;94ce
	or a			;94d1
	ret z			;94d2
	ld a,(0e282h)		;94d3
	add a,010h		;94d6
	ld l,a			;94d8
	ld a,(0e294h)		;94d9
	or a			;94dc
	ld a,(0e284h)		;94dd
	jr z,L_94E4		;94e0
	add a,00fh		;94e2
L_94E4:
	ld h,a			;94e4
	call L_9D5B		;94e5
	sub 002h		;94e8
	ret c			;94ea
	ld a,(0e282h)		;94eb
	and 0f8h		;94ee
	ld (0e282h),a		;94f0
	xor a			;94f3
	ld (0e2a6h),a		;94f4
	ret			;94f7
L_94F8:
	call L_99D3		;94f8
	jr c,L_9516		;94fb
	ld a,(0e207h)		;94fd
	bit 4,a		;9500
	jp nz,L_9589		;9502
	ld a,(0e208h)		;9505
	rra			;9508
	jr nc,L_9510		;9509
	call L_9B23		;950b
	jr L_9516		;950e
L_9510:
	rra			;9510
	jr nc,L_951B		;9511
	call L_9B12		;9513
L_9516:
	ld a,(0e280h)		;9516
	or a			;9519
	ret nz			;951a
L_951B:
	ld a,(0e288h)		;951b
	ld de,(0e28eh)		;951e
	ld c,002h		;9522
	bit 2,a		;9524
	jr nz,L_9531		;9526
	ld de,(0e290h)		;9528
	ld c,003h		;952c
	bit 3,a		;952e
	ret z			;9530
L_9531:
	push bc			;9531
	ld hl,(0e283h)		;9532
	add hl,de			;9535
	push hl			;9536
	ld a,(0e282h)		;9537
	ld l,a			;953a
	call L_9D89		;953b
	pop hl			;953e
	pop bc			;953f
	jr c,L_9551		;9540
L_9542:
	ld a,(0e294h)		;9542
	or a			;9545
	ld a,007h		;9546
	jr z,L_954B		;9548
	xor a			;954a
L_954B:
	ld l,000h		;954b
	add a,h			;954d
	and 0f8h		;954e
	ld h,a			;9550
L_9551:
	ld (0e283h),hl		;9551
	ret			;9554
L_9555:
	ld a,001h		;9555
	ld (0e2a7h),a		;9557
	ld a,(0e280h)		;955a
	or a			;955d
	jr nz,L_956A		;955e
	ld a,(0e2a6h)		;9560
	or a			;9563
	jr nz,L_956A		;9564
	xor a			;9566
	ld (0e2a7h),a		;9567
L_956A:
	xor a			;956a
	ld (0e295h),a		;956b
	ld a,007h		;956e
	ld (0e296h),a		;9570
	ld b,001h		;9573
	ld a,(0e294h)		;9575
	or a			;9578
	jr z,L_957D		;9579
	ld b,004h		;957b
L_957D:
	ld a,b			;957d
	ld (0e285h),a		;957e
	ld a,003h		;9581
	ld (0e280h),a		;9583
	jp 042fbh		;9586
L_9589:
	ld a,(0e2a6h)		;9589
	or a			;958c
	ret nz			;958d
	ld a,(0e287h)		;958e
	or a			;9591
	ret nz			;9592
	ld a,(0e282h)		;9593
	cp 0f8h		;9596
	ret nc			;9598
	ld l,a			;9599
	ld a,(0e284h)		;959a
	ld h,a			;959d
	ld c,000h		;959e
	call L_9D89		;95a0
	ret nc			;95a3
	ld a,(0e288h)		;95a4
	ld (0e289h),a		;95a7
	ld a,(0e294h)		;95aa
	ld b,a			;95ad
	ld a,008h		;95ae
	add a,b			;95b0
	ld (0e285h),a		;95b1
	xor a			;95b4
	ld (0e2a5h),a		;95b5
	ld hl,0fc00h		;95b8
	ld (0e292h),hl		;95bb
	call 04242h		;95be
	ld hl,0e280h		;95c1
	inc (hl)			;95c4
	ret			;95c5
L_95C6:
	ld a,(0e2a6h)		;95c6
	or a			;95c9
	ret nz			;95ca
	ld a,(0e287h)		;95cb
	and a			;95ce
	ret z			;95cf
	ld a,(0e207h)		;95d0
	bit 4,a		;95d3
	ret z			;95d5
	ld hl,0e300h		;95d6
	ld b,040h		;95d9
L_95DB:
	ld a,(hl)			;95db
	rra			;95dc
	rra			;95dd
	rra			;95de
	rra			;95df
	and 00fh		;95e0
	dec a			;95e2
	jr z,L_95EC		;95e3
	ld de,00008h		;95e5
	add hl,de			;95e8
	djnz L_95DB		;95e9
	ret			;95eb
L_95EC:
	ld (0e2a0h),hl		;95ec
	ld a,(0e287h)		;95ef
	dec a			;95f2
	call 0409eh		;95f3

; ----------------------------------------------------------------------
; DATOS tabla_95F6: 6 destinos del despachador p00:409E (call en p02:95F3, el
;   indice en A): 9602, 9602, 9627, 9627, 9671, 9671; lo leen p02:95F3 (12
;   bytes)
;   0x95f6..0x9602  (12 bytes)
DATA_tabla_95F6:
	defw 09602h,09602h,09627h,09627h,09671h,09671h	; 95f6

; ======================================================================
; CODIGO 0x9602..0x9c44  (1602 bytes)
; ======================================================================


L_9602:
	ld hl,0e2a9h		;9602
	ld a,(hl)			;9605
	cp 006h		;9606
	ret nc			;9608
	inc (hl)			;9609
	ld a,(0e294h)		;960a
	or a			;960d
	ld a,00ah		;960e
	jr z,L_9614		;9610
	ld a,00ch		;9612
L_9614:
	ld (0e285h),a		;9614
	ld a,008h		;9617
	ld (0e286h),a		;9619
L_961C:
	ld a,(0e287h)		;961c
	and 00fh		;961f
	add a,007h		;9621
	ld (0e280h),a		;9623
	ret			;9626
L_9627:
	ld a,(0e294h)		;9627
	or a			;962a
	ld bc,0f80ah		;962b
	jr z,L_9633		;962e
	ld bc,0080ch		;9630
L_9633:
	ld a,c			;9633
	exx			;9634
	ld c,a			;9635
	exx			;9636
	ld a,(0e284h)		;9637
	add a,004h		;963a
	and 0f8h		;963c
	add a,b			;963e
	ld h,a			;963f
	ld a,(0e282h)		;9640
	add a,010h		;9643
	and 0f8h		;9645
	ld l,a			;9647
	ld (0e2a2h),hl		;9648
	push hl			;964b
	call L_9D5B		;964c
	pop hl			;964f
	cp 002h		;9650
	ret nz			;9652
	ld a,h			;9653
	add a,008h		;9654
	ld h,a			;9656
	call L_9D5B		;9657
	cp 002h		;965a
	ret nz			;965c
	exx			;965d
	ld a,c			;965e
	ld (0e285h),a		;965f
	exx			;9662
	ld hl,(0e2a0h)		;9663
	ld a,010h		;9666
	add a,(hl)			;9668
	ld (hl),a			;9669
	ld a,020h		;966a
	ld (0e286h),a		;966c
	jr L_961C		;966f
L_9671:
	ld a,(0e294h)		;9671
	or a			;9674
	ld b,0feh		;9675
	ld a,00ah		;9677
	jr z,L_967F		;9679
	ld b,012h		;967b
	ld a,00ch		;967d
L_967F:
	exx			;967f
	ld c,a			;9680
	exx			;9681
	ld a,(0e284h)		;9682
	add a,b			;9685
	and 0f8h		;9686
	ld h,a			;9688
	ld a,(0e282h)		;9689
	and 0f8h		;968c
	ld l,a			;968e
	ld (0e2a2h),hl		;968f
	call L_9D55		;9692
	cp 002h		;9695
	ret nz			;9697
	ld a,l			;9698
	add a,008h		;9699
	ld l,a			;969b
	call L_9D5B		;969c
	cp 002h		;969f
	ret nz			;96a1
	exx			;96a2
	ld a,c			;96a3
	ld (0e285h),a		;96a4
	exx			;96a7
	ld hl,(0e2a0h)		;96a8
	ld a,010h		;96ab
	add a,(hl)			;96ad
	ld (hl),a			;96ae
	ld a,020h		;96af
	ld (0e286h),a		;96b1
	jp L_961C		;96b4
L_96B7:
	ld de,0fec0h		;96b7
	ld c,002h		;96ba
	bit 2,a		;96bc
	jp nz,L_96CC		;96be
	ld de,00140h		;96c1
	ld c,003h		;96c4
	bit 3,a		;96c6
	jp nz,L_96CC		;96c8
	ret			;96cb
L_96CC:
	ld hl,(0e283h)		;96cc
	add hl,de			;96cf
	ld a,h			;96d0
	cp 0f0h		;96d1
	jp nc,L_9551		;96d3
	push bc			;96d6
	push hl			;96d7
	ld a,(0e2a5h)		;96d8
	or a			;96db
	ld a,(0e282h)		;96dc
	jr z,L_96E3		;96df
	add a,006h		;96e1
L_96E3:
	call L_96EE		;96e3
	pop hl			;96e6
	pop bc			;96e7
	jp c,L_9551		;96e8
	jp L_9542		;96eb
L_96EE:
	add a,008h		;96ee
	ld l,a			;96f0
	ld a,c			;96f1
	sub 002h		;96f2
	ld h,0ffh		;96f4
	jr z,L_96FA		;96f6
	ld h,010h		;96f8
L_96FA:
	ld a,(0e284h)		;96fa
	add a,h			;96fd
	ld h,a			;96fe
	call L_9D55		;96ff
	sub 002h		;9702
	ret nc			;9704
	ld a,l			;9705
	and 0f8h		;9706
	add a,006h		;9708
	ld a,a			;970a
	call L_9D5B		;970b
	sub 002h		;970e
	ret			;9710
L_9711:
	xor a			;9711
	ld (0e2a5h),a		;9712
	call L_9742		;9715
	ld a,(0e289h)		;9718
	and 00ch		;971b
	call nz,L_96B7		;971d
	call L_9AB6		;9720
	ld a,(0efc0h)		;9723
	or a			;9726
	ret z			;9727
	call L_99C7		;9728
	xor a			;972b
	ld (0e280h),a		;972c
	ld (0e2a6h),a		;972f
	ld (0e2a5h),a		;9732
	ld (0e295h),a		;9735
	inc a			;9738
	ld (0e296h),a		;9739
	call L_94A1		;973c
	jp 042ebh		;973f
L_9742:
	ld hl,(0e292h)		;9742
	ld a,h			;9745
	cp 004h		;9746
	jr z,L_9762		;9748
	ld de,00080h		;974a
	add hl,de			;974d
	ld (0e292h),hl		;974e
	ex de,hl			;9751
L_9752:
	ld hl,(0e281h)		;9752
	add hl,de			;9755
	ld (0e281h),hl		;9756
	call L_9767		;9759
	ret c			;975c
	ld hl,0e2a5h		;975d
	inc (hl)			;9760
	ret			;9761
L_9762:
	ld de,00400h		;9762
	jr L_9752		;9765
L_9767:
	ld l,h			;9767
	dec l			;9768
	call L_977A		;9769
	ret nc			;976c
	ld a,l			;976d
	inc a			;976e
	and 0f8h		;976f
	add a,008h		;9771
	ld l,a			;9773
	call L_977A		;9774
	ret nc			;9777
	inc l			;9778
	inc l			;9779
L_977A:
	ld a,(0e284h)		;977a
	add a,002h		;977d
	ld h,a			;977f
	call L_9D55		;9780
	sub 002h		;9783
	ret nc			;9785
	ld a,h			;9786
	add a,00ch		;9787
	ld h,a			;9789
	call L_9D55		;978a
	sub 002h		;978d
	ret			;978f
L_9790:
	call L_9BD4		;9790
	ld a,(0e208h)		;9793
	and 00ch		;9796
	jr z,L_9811		;9798
	rra			;979a
	rra			;979b
	rra			;979c
	ld c,002h		;979d
	jr c,L_97A2		;979f
	inc c			;97a1
L_97A2:
	ld a,(0e282h)		;97a2
	ld l,a			;97a5
	ld a,(0e284h)		;97a6
	ld h,a			;97a9
	push hl			;97aa
	push bc			;97ab
	call L_9D89		;97ac
	pop bc			;97af
	pop hl			;97b0
	jr nc,L_9811		;97b1
	ld a,l			;97b3
	add a,004h		;97b4
	ld l,a			;97b6
	ld a,c			;97b7
	cp 002h		;97b8
	ld a,0fch		;97ba
	jr z,L_97C0		;97bc
	ld a,014h		;97be
L_97C0:
	add a,h			;97c0
	ld h,a			;97c1
	call L_9D55		;97c2
	or a			;97c5
	jr nz,L_97F1		;97c6
	ld a,l			;97c8
	add a,008h		;97c9
	ld l,a			;97cb
	call L_9D55		;97cc
	or a			;97cf
	jr nz,L_97F1		;97d0
	ld a,l			;97d2
	add a,008h		;97d3
	ld l,a			;97d5
	call L_9D55		;97d6
	or a			;97d9
	jr z,L_97F1		;97da
	ld a,l			;97dc
	sub 010h		;97dd
L_97DF:
	and 0f8h		;97df
	ld h,a			;97e1
	xor a			;97e2
	ld (0e280h),a		;97e3
	ld (0e2a4h),a		;97e6
	ld (0e2a6h),a		;97e9
	ld l,a			;97ec
	ld (0e281h),hl		;97ed
	ret			;97f0
L_97F1:
	ld a,(0e282h)		;97f1
	add a,004h		;97f4
	ld l,a			;97f6
	ld a,(0e284h)		;97f7
	ld h,a			;97fa
	ld c,001h		;97fb
	push hl			;97fd
	call L_9D89		;97fe
	pop hl			;9801
	ld a,l			;9802
	jr nc,L_97DF		;9803
	xor a			;9805
	ld (0e280h),a		;9806
	ld (0e2a4h),a		;9809
	inc a			;980c
	ld (0e2a6h),a		;980d
	ret			;9810
L_9811:
	call L_9A10		;9811
	ld a,(0e280h)		;9814
	cp 002h		;9817
	ret nz			;9819
	call L_99F7		;981a
	ld a,(0e280h)		;981d
	cp 002h		;9820
	ret nz			;9822
	call L_983C		;9823
	ld a,(0e288h)		;9826
	and 003h		;9829
	ret z			;982b
	ld hl,0e296h		;982c
	dec (hl)			;982f
	ret nz			;9830
	ld (hl),004h		;9831
	ld a,(0e285h)		;9833
	xor 001h		;9836
	ld (0e285h),a		;9838
	ret			;983b
L_983C:
	ld de,(0e28ah)		;983c
	ld c,000h		;9840
	ld a,(0e288h)		;9842
	rra			;9845
	jr c,L_9857		;9846
	ld de,(0e28ch)		;9848
	ld c,001h		;984c
	rra			;984e
	jr c,L_9857		;984f
	ld hl,0e296h		;9851
	ld (hl),001h		;9854
	ret			;9856
L_9857:
	ld hl,(0e281h)		;9857
	add hl,de			;985a
	ld a,h			;985b
	cp 0e8h		;985c
	jr nc,L_986D		;985e
	push bc			;9860
	push hl			;9861
	ld l,h			;9862
	ld a,(0e284h)		;9863
	ld h,a			;9866
	call L_9D89		;9867
	pop hl			;986a
	pop bc			;986b
	ret nc			;986c
L_986D:
	ld (0e281h),hl		;986d
	ret			;9870
L_9871:
	ld a,(0e284h)		;9871
	ld h,a			;9874
	ld a,(0e282h)		;9875
	add a,004h		;9878
	ld l,a			;987a
	ld (0e282h),a		;987b
	cp 0adh		;987e
	ret nc			;9880
	call L_9A93		;9881
	ret z			;9884
	call L_99C7		;9885
	xor a			;9888
	ld (0e280h),a		;9889
	ld (0e2a6h),a		;988c
	inc a			;988f
	ld (0e296h),a		;9890
	jp 042ebh		;9893
L_9896:
	ld de,00a06h		;9896
	ld c,004h		;9899
	jr L_98A2		;989b
L_989D:
	ld de,00504h		;989d
	ld c,000h		;98a0
L_98A2:
	ld hl,0e296h		;98a2
	dec (hl)			;98a5
	ret nz			;98a6
	ld a,(0e295h)		;98a7
	cp d			;98aa
	jr z,L_98CC		;98ab
	ld (hl),003h		;98ad
	ld hl,0e285h		;98af
	inc (hl)			;98b2
	ld a,(hl)			;98b3
	cp e			;98b4
	ret nz			;98b5
	ld a,(0e295h)		;98b6
	inc a			;98b9
	ld (0e295h),a		;98ba
	cp d			;98bd
	jr z,L_98C2		;98be
	ld (hl),c			;98c0
	ret			;98c1
L_98C2:
	ld (hl),006h		;98c2
	ld hl,0e296h		;98c4
	ld (hl),028h		;98c7
	jp 042afh		;98c9
L_98CC:
	xor a			;98cc
	ld (0e246h),a		;98cd
	ret			;98d0
L_98D1:
	ld hl,0e299h		;98d1
	inc (hl)			;98d4
	ld a,(hl)			;98d5
	sub 012h		;98d6
	jr z,L_98E9		;98d8
	xor a			;98da
	ld (0e283h),a		;98db
	ld a,(0e284h)		;98de
	dec a			;98e1
	dec a			;98e2
	ld (0e284h),a		;98e3
	jp L_949A		;98e6
L_98E9:
	ld (0e280h),a		;98e9
	ret			;98ec
L_98ED:
	ld hl,0e299h		;98ed
	inc (hl)			;98f0
	ld a,(hl)			;98f1
	sub 012h		;98f2
	jr z,L_98E9		;98f4
	xor a			;98f6
	ld (0e283h),a		;98f7
	ld a,(0e284h)		;98fa
	inc a			;98fd
	inc a			;98fe
	ld (0e284h),a		;98ff
	jp L_949A		;9902
L_9905:
	ld hl,0e286h		;9905
	dec (hl)			;9908
	jr z,L_9914		;9909
	ld a,(hl)			;990b
	cp 004h		;990c
	ret nz			;990e
	ld hl,0e285h		;990f
	inc (hl)			;9912
	ret			;9913
L_9914:
	xor a			;9914
	ld (0e287h),a		;9915
	ld (0e280h),a		;9918
	ld a,(0e294h)		;991b
	or a			;991e
	ld a,003h		;991f
	jr nz,L_9924		;9921
	xor a			;9923
L_9924:
	ld (0e285h),a		;9924
	ld hl,0e2a0h		;9927
	ld a,(hl)			;992a
	inc l			;992b
	ld h,(hl)			;992c
	ld l,a			;992d
	ld a,010h		;992e
	add a,(hl)			;9930
	ld (hl),a			;9931
	inc l			;9932
	push hl			;9933
	ld a,(0e282h)		;9934
	and 0f8h		;9937
	ld (hl),a			;9939
	ld l,a			;993a
	ld a,(0e284h)		;993b
	ld h,a			;993e
	ld b,000h		;993f
	ld a,(0e294h)		;9941
	or a			;9944
	ld c,003h		;9945
	jr z,L_994F		;9947
	cp 0e8h		;9949
	jr nc,L_995E		;994b
	jr L_9955		;994d
L_994F:
	dec c			;994f
	ld a,h			;9950
	cp 010h		;9951
	jr c,L_995E		;9953
L_9955:
	call L_9D89		;9955
	ld b,000h		;9958
	jr nc,L_995E		;995a
	ld b,010h		;995c
L_995E:
	pop hl			;995e
	inc l			;995f
	ld c,004h		;9960
	ld a,(0e294h)		;9962
	or a			;9965
	ld a,(0e284h)		;9966
	jr nz,L_9970		;9969
	ld c,003h		;996b
	sub b			;996d
	jr L_9971		;996e
L_9970:
	add a,b			;9970
L_9971:
	ld (hl),a			;9971
	ret nc			;9972
	inc l			;9973
	push hl			;9974
	ld a,(0e243h)		;9975
	push bc			;9978
	call 05be7h		;9979
	pop bc			;997c
	ld b,a			;997d
	ld a,c			;997e
	call 05c2fh		;997f
	ld a,l			;9982
	pop hl			;9983
	ld (hl),a			;9984
	ret			;9985
L_9986:
	ld a,(0e286h)		;9986
	and 003h		;9989
	call z,0424ch		;998b
	jr L_99AC		;998e
L_9990:
	ld a,(0e286h)		;9990
	and 003h		;9993
	call z,04256h		;9995
	jr L_99AC		;9998
L_999A:
	ld a,(0e286h)		;999a
	and 003h		;999d
	call z,0425bh		;999f
	jr L_99AC		;99a2
L_99A4:
	ld a,(0e286h)		;99a4
	and 003h		;99a7
	call z,04251h		;99a9
L_99AC:
	ld hl,0e286h		;99ac
	dec (hl)			;99af
	ld a,(hl)			;99b0
	rra			;99b1
	rra			;99b2
	ret c			;99b3
	ld a,(0e285h)		;99b4
	xor 001h		;99b7
	ld (0e285h),a		;99b9
	ret			;99bc
L_99BD:
	ld hl,0e2a8h		;99bd
	dec (hl)			;99c0
	ret nz			;99c1
	xor a			;99c2
	ld (0e280h),a		;99c3
	ret			;99c6
L_99C7:
	ld a,(0e282h)		;99c7
	and 0f8h		;99ca
	ld h,a			;99cc
	ld l,000h		;99cd
	ld (0e281h),hl		;99cf
	ret			;99d2
L_99D3:
	ld a,(0e2a4h)		;99d3
	cp 006h		;99d6
	ret nc			;99d8
	inc a			;99d9
	ld (0e2a4h),a		;99da
	scf			;99dd
	ret			;99de
L_99DF:
	ld a,(0e284h)		;99df
	add a,002h		;99e2
	ld h,a			;99e4
	ld a,(0e282h)		;99e5
	ld l,a			;99e8
	call L_9D55		;99e9
	dec a			;99ec
	ret z			;99ed
	ld a,h			;99ee
	add a,00ch		;99ef
	ld h,a			;99f1
	call L_9D5B		;99f2
	dec a			;99f5
	ret			;99f6
L_99F7:
	ld a,(0e284h)		;99f7
	ld h,a			;99fa
	ld a,(0e282h)		;99fb
	ld l,a			;99fe
	call L_9D55		;99ff
	dec a			;9a02
	ret z			;9a03
	ld a,l			;9a04
	add a,010h		;9a05
	ld l,a			;9a07
	call L_9D5B		;9a08
	dec a			;9a0b
	ret z			;9a0c
	jp L_9555		;9a0d
L_9A10:
	ld a,(0e284h)		;9a10
	ld h,a			;9a13
	ld a,(0e282h)		;9a14
	add a,012h		;9a17
	ld l,a			;9a19
	ld a,(0e288h)		;9a1a
	rra			;9a1d
	jr c,L_9A51		;9a1e
	rra			;9a20
	ret nc			;9a21
	call L_9D55		;9a22
	cp 002h		;9a25
	jr nc,L_9A33		;9a27
	ld a,h			;9a29
	add a,008h		;9a2a
	ld h,a			;9a2c
	call L_9D55		;9a2d
	cp 002h		;9a30
	ret c			;9a32
L_9A33:
	ld a,l			;9a33
	cp 0c0h		;9a34
	ret nc			;9a36
	sub 00bh		;9a37
L_9A39:
	and 0f8h		;9a39
	ld h,a			;9a3b
	xor a			;9a3c
	ld l,a			;9a3d
	ld (0e281h),hl		;9a3e
	ld (0e280h),a		;9a41
	ld (0e2a6h),a		;9a44
	inc a			;9a47
	ld (0e2a7h),a		;9a48
	ld (0e296h),a		;9a4b
	jp L_949A		;9a4e
L_9A51:
	ld a,(0e282h)		;9a51
	sub 008h		;9a54
	cp 008h		;9a56
	ret c			;9a58
	ld a,l			;9a59
	sub 010h		;9a5a
	ld l,a			;9a5c
	call L_9D55		;9a5d
	or a			;9a60
	ret nz			;9a61
	ld a,l			;9a62
	add a,009h		;9a63
	ld l,a			;9a65
	call L_9D55		;9a66
	or a			;9a69
	ret nz			;9a6a
	ld a,l			;9a6b
	sub 009h		;9a6c
	jr L_9A39		;9a6e
L_9A70:
	ld b,000h		;9a70
	ld a,(0e288h)		;9a72
	rra			;9a75
	rra			;9a76
	and 003h		;9a77
	ret z			;9a79
	rra			;9a7a
	jr c,L_9A80		;9a7b
	inc b			;9a7d
	rra			;9a7e
	ret nc			;9a7f
L_9A80:
	ld a,b			;9a80
	ld a,(0e294h)		;9a81
	cp b			;9a84
	ld a,b			;9a85
	ld (0e294h),a		;9a86
	ret z			;9a89
	xor a			;9a8a
	ld (0e295h),a		;9a8b
	inc a			;9a8e
	ld (0e296h),a		;9a8f
	ret			;9a92
L_9A93:
	ld a,(0e282h)		;9a93
	add a,010h		;9a96
	ld l,a			;9a98
	ld a,(0e284h)		;9a99
	add a,003h		;9a9c
	ld h,a			;9a9e
	call L_9D55		;9a9f
	or a			;9aa2
	ret nz			;9aa3
	ld a,h			;9aa4
	add a,005h		;9aa5
	ld h,a			;9aa7
	call L_9D55		;9aa8
	or a			;9aab
	ret nz			;9aac
	ld a,h			;9aad
	add a,005h		;9aae
	ld h,a			;9ab0
	call L_9D55		;9ab1
	or a			;9ab4
	ret			;9ab5
L_9AB6:
	xor a			;9ab6
	ld (0efc0h),a		;9ab7
	call L_9A93		;9aba
	ret z			;9abd
	dec a			;9abe
	jr nz,L_9AE0		;9abf
	ld a,l			;9ac1
	sub 00ch		;9ac2
	and 0f8h		;9ac4
	ld l,a			;9ac6
	call L_9D55		;9ac7
	or a			;9aca
	jr nz,L_9AE6		;9acb
	ld a,l			;9acd
	add a,008h		;9ace
	ld l,a			;9ad0
	call L_9D55		;9ad1
	or a			;9ad4
	jr nz,L_9AE6		;9ad5
	ld a,l			;9ad7
	add a,008h		;9ad8
	ld l,a			;9ada
	call L_9D55		;9adb
	or a			;9ade
	ret z			;9adf
L_9AE0:
	ld a,001h		;9ae0
	ld (0efc0h),a		;9ae2
	ret			;9ae5
L_9AE6:
	ld a,(0e282h)		;9ae6
	add a,010h		;9ae9
	ld l,a			;9aeb
	call L_9AF2		;9aec
	ret c			;9aef
	jr L_9AE0		;9af0
L_9AF2:
	ld a,(0e284h)		;9af2
	add a,003h		;9af5
	ld h,a			;9af7
	call L_9D55		;9af8
	sub 002h		;9afb
	ret nc			;9afd
	ld a,h			;9afe
	add a,005h		;9aff
	ld h,a			;9b01
	call L_9D55		;9b02
	sub 002h		;9b05
	ret nc			;9b07
	ld a,h			;9b08
	add a,005h		;9b09
	ld h,a			;9b0b
	call L_9D55		;9b0c
	sub 002h		;9b0f
	ret			;9b11
L_9B12:
	call L_9B7C		;9b12
	ld a,(0e280h)		;9b15
	cp 002h		;9b18
	ret z			;9b1a
	ld a,(0e282h)		;9b1b
	add a,010h		;9b1e
	ld l,a			;9b20
	jr L_9B32		;9b21
L_9B23:
	call L_9B7C		;9b23
	ld a,(0e280h)		;9b26
	cp 002h		;9b29
	ret z			;9b2b
	ld a,(0e282h)		;9b2c
	add a,00ah		;9b2f
	ld l,a			;9b31
L_9B32:
	ld a,(0e284h)		;9b32
	ld h,a			;9b35
	call L_9D55		;9b36
	dec a			;9b39
	ld bc,00c0ch		;9b3a
	jr z,L_9B4D		;9b3d
	ld bc,0f400h		;9b3f
	ld a,h			;9b42
	add a,010h		;9b43
	ld h,a			;9b45
	push bc			;9b46
	call L_9D55		;9b47
	pop bc			;9b4a
	dec a			;9b4b
	ret nz			;9b4c
L_9B4D:
	ld a,h			;9b4d
	add a,b			;9b4e
	ld h,a			;9b4f
	push bc			;9b50
	call L_9D55		;9b51
	pop bc			;9b54
	dec a			;9b55
	ret nz			;9b56
	ld a,h			;9b57
	sub c			;9b58
	and 0f8h		;9b59
	ld h,a			;9b5b
	ld l,000h		;9b5c
	push hl			;9b5e
	call L_9B84		;9b5f
	pop hl			;9b62
	ret c			;9b63
	ld (0e283h),hl		;9b64
	xor a			;9b67
	ld (0e295h),a		;9b68
	ld (0e2a4h),a		;9b6b
	inc a			;9b6e
	ld (0e296h),a		;9b6f
	inc a			;9b72
	ld (0e280h),a		;9b73
	ld a,006h		;9b76
	ld (0e285h),a		;9b78
	ret			;9b7b
L_9B7C:
	ld a,(0e282h)		;9b7c
	add a,002h		;9b7f
	ld l,a			;9b81
	jr L_9B32		;9b82
L_9B84:
	ld a,(0e208h)		;9b84
	rra			;9b87
	ld a,(0e282h)		;9b88
	jr c,L_9B8F		;9b8b
	add a,010h		;9b8d
L_9B8F:
	ld l,a			;9b8f
L_9B90:
	ld c,0ffh		;9b90
L_9B92:
	inc c			;9b92
	ld a,h			;9b93
	or a			;9b94
	jr z,L_9BA2		;9b95
	sub 008h		;9b97
	ld h,a			;9b99
	push bc			;9b9a
	call L_9D55		;9b9b
	pop bc			;9b9e
	dec a			;9b9f
	jr z,L_9B92		;9ba0
L_9BA2:
	ld a,c			;9ba2
	rra			;9ba3
	ret			;9ba4
L_9BA5:
	ld a,(0e208h)		;9ba5
	and 00ch		;9ba8
	ld b,a			;9baa
	ld c,000h		;9bab
	jr z,L_9BCF		;9bad
	ld a,(0e207h)		;9baf
	and 00ch		;9bb2
	cp 00ch		;9bb4
	ret z			;9bb6
	bit 2,a		;9bb7
	ld c,004h		;9bb9
	jr nz,L_9BCF		;9bbb
	bit 3,a		;9bbd
	ld c,008h		;9bbf
	jr nz,L_9BCF		;9bc1
	ld a,b			;9bc3
	cp 00ch		;9bc4
	ret z			;9bc6
	bit 2,a		;9bc7
	ld c,004h		;9bc9
	jr nz,L_9BCF		;9bcb
	ld c,008h		;9bcd
L_9BCF:
	ld a,c			;9bcf
	ld (0e288h),a		;9bd0
	ret			;9bd3
L_9BD4:
	ld a,(0e208h)		;9bd4
	and 003h		;9bd7
	ld b,a			;9bd9
	ld c,000h		;9bda
	jr z,L_9BCF		;9bdc
	ld a,(0e207h)		;9bde
	and 003h		;9be1
	cp 003h		;9be3
	ret z			;9be5
	rra			;9be6
	ld c,001h		;9be7
	jr c,L_9BCF		;9be9
	rra			;9beb
	ld c,002h		;9bec
	jr c,L_9BCF		;9bee
	ld a,b			;9bf0
	cp 003h		;9bf1
	ret z			;9bf3
	rra			;9bf4
	ld c,001h		;9bf5
	jr c,L_9BCF		;9bf7
	ld c,002h		;9bf9
	jr L_9BCF		;9bfb
L_9BFD:
	ld a,(0e282h)		;9bfd
	add a,008h		;9c00
	cp 002h		;9c02
	jr c,L_9C29		;9c04
	sub 008h		;9c06
	cp 0aeh		;9c08
	jr nc,L_9C35		;9c0a
	ld a,(0e294h)		;9c0c
	or a			;9c0f
	ld a,(0e284h)		;9c10
	jr z,L_9C1E		;9c13
	cp 0f1h		;9c15
	ret c			;9c17
	ld a,004h		;9c18
	ld (0e248h),a		;9c1a
	ret			;9c1d
L_9C1E:
	add a,008h		;9c1e
	cp 00ah		;9c20
	ret nc			;9c22
	ld a,003h		;9c23
	ld (0e248h),a		;9c25
	ret			;9c28
L_9C29:
	ld a,(0e280h)		;9c29
	sub 002h		;9c2c
	ret nz			;9c2e
	ld a,001h		;9c2f
	ld (0e248h),a		;9c31
	ret			;9c34
L_9C35:
	cp 0f0h		;9c35
	ret nc			;9c37
	ld a,002h		;9c38
	ld (0e248h),a		;9c3a
	ret			;9c3d
L_9C3E:
	ld a,(0e2b0h)		;9c3e
	call 0409eh		;9c41

; ----------------------------------------------------------------------
; DATOS tabla_9C44: 4 destinos del despachador p00:409E (call en p02:9C41, el
;   indice en A): 9C4C, 9C59, 9C6E, 9C83; lo leen p02:9C41 (8 bytes)
;   0x9c44..0x9c4c  (8 bytes)
DATA_tabla_9C44:
	defw 09c4ch,09c59h,09c6eh,09c83h	; 9c44  -> L_9C4C L_9C59 L_9C6E L_9C83

; ======================================================================
; CODIGO 0x9c4c..0x9c6a  (30 bytes)
; ======================================================================


L_9C4C:
	ld hl,0e2b0h		;9c4c
	ld (hl),001h		;9c4f
	inc hl			;9c51
	ld (hl),020h		;9c52
	inc hl			;9c54
	inc hl			;9c55
	ld (hl),000h		;9c56
	ret			;9c58
L_9C59:
	ld hl,0e2b1h		;9c59
	dec (hl)			;9c5c
	ret nz			;9c5d
	ld hl,09c6ah		;9c5e
	ld de,0e2b0h		;9c61
	ld bc,00004h		;9c64
	ldir		;9c67
	ret			;9c69

; ----------------------------------------------------------------------
; DATOS resto_9C6A: lo apuntan con el banco puesto p02:9C5E (0x9C6A); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p02:9C5E (4 bytes)
;   0x9c6a..0x9c6e  (4 bytes)
DATA_resto_9C6A:
	defb 002h,030h,030h,001h	; 9c6a

; ======================================================================
; CODIGO 0x9c6e..0x9e65  (503 bytes)
; ======================================================================


L_9C6E:
	ld c,003h		;9c6e
	call L_9C88		;9c70
	ld a,(0e2b2h)		;9c73
	cp 010h		;9c76
	ret nz			;9c78
	ld a,003h		;9c79
	ld (0e2b3h),a		;9c7b
	ld hl,0e2b0h		;9c7e
	inc (hl)			;9c81
	ret			;9c82
L_9C83:
	ld c,007h		;9c83
	jp L_9C88		;9c85
L_9C88:
	ld hl,0e2b1h		;9c88
	dec (hl)			;9c8b
	ret nz			;9c8c
	ld a,(0e2b2h)		;9c8d
	ld (hl),a			;9c90
	inc hl			;9c91
	inc hl			;9c92
	ld a,(hl)			;9c93
	xor c			;9c94
	ld (hl),a			;9c95
	rra			;9c96
	ret c			;9c97
	ld a,(0e2b2h)		;9c98
	cp 005h		;9c9b
	ret c			;9c9d
	dec a			;9c9e
	ld (0e2b2h),a		;9c9f
	ret			;9ca2
L_9CA3:
	ld a,(0e280h)		;9ca3
	cp 00eh		;9ca6
	jr nz,L_9CBE		;9ca8
	ld a,(0e2a8h)		;9caa
	rra			;9cad
	jr c,L_9CBE		;9cae
	ld hl,0e800h		;9cb0
	ld de,0e801h		;9cb3
	ld (hl),0e0h		;9cb6
	ld bc,0000fh		;9cb8
	ldir		;9cbb
	ret			;9cbd
L_9CBE:
	ld hl,0e800h		;9cbe
	ld a,(0e284h)		;9cc1
	ld e,a			;9cc4
	ld a,(0e280h)		;9cc5
	cp 002h		;9cc8
	jr z,L_9CD4		;9cca
	ld a,(0e294h)		;9ccc
	or a			;9ccf
	jr z,L_9CD4		;9cd0
	inc e			;9cd2
	inc e			;9cd3
L_9CD4:
	ld a,(0e282h)		;9cd4
	dec a			;9cd7
	dec a			;9cd8
	ld (hl),a			;9cd9
	inc hl			;9cda
	ld (hl),e			;9cdb
	inc hl			;9cdc
	ld (hl),000h		;9cdd
	inc hl			;9cdf
	ld (hl),007h		;9ce0
	inc hl			;9ce2
	sub 003h		;9ce3
	ld (hl),a			;9ce5
	inc hl			;9ce6
	ld (hl),e			;9ce7
	inc hl			;9ce8
	ld (hl),004h		;9ce9
	inc hl			;9ceb
	ld (hl),00ah		;9cec
	inc hl			;9cee
	sub 004h		;9cef
	ld (hl),a			;9cf1
	inc hl			;9cf2
	ld (hl),e			;9cf3
	inc hl			;9cf4
	ld (hl),008h		;9cf5
	inc hl			;9cf7
	ld (hl),001h		;9cf8
	inc hl			;9cfa
	add a,010h		;9cfb
	ld (hl),a			;9cfd
	inc hl			;9cfe
	ld (hl),e			;9cff
	inc hl			;9d00
	ld (hl),00ch		;9d01
	inc hl			;9d03
	ld (hl),001h		;9d04
L_9D06:
	ret			;9d06
L_9D07:
	call 041c2h		;9d07
	ld a,(0e2b3h)		;9d0a
	add a,a			;9d0d
	add a,a			;9d0e
	ld de,0bba0h		;9d0f
	call 04099h		;9d12
	ld hl,0e800h		;9d15
	ld a,(0e284h)		;9d18
	ld b,a			;9d1b
	ld a,(0e282h)		;9d1c
	ld c,a			;9d1f
	ld a,(de)			;9d20
	add a,c			;9d21
	ld (hl),a			;9d22
	inc hl			;9d23
	ld (hl),b			;9d24
	inc hl			;9d25
	ld (hl),000h		;9d26
	inc hl			;9d28
	ld (hl),007h		;9d29
	inc hl			;9d2b
	inc de			;9d2c
	ld a,(de)			;9d2d
	add a,c			;9d2e
	ld (hl),a			;9d2f
	inc hl			;9d30
	ld (hl),b			;9d31
	inc hl			;9d32
	ld (hl),004h		;9d33
	inc hl			;9d35
	ld (hl),00bh		;9d36
	inc hl			;9d38
	inc de			;9d39
	ld a,(de)			;9d3a
	add a,c			;9d3b
	ld (hl),a			;9d3c
	inc hl			;9d3d
	ld (hl),b			;9d3e
	inc hl			;9d3f
	ld (hl),008h		;9d40
	inc hl			;9d42
	ld (hl),001h		;9d43
	inc hl			;9d45
	inc de			;9d46
	ld a,(de)			;9d47
	add a,c			;9d48
	ld (hl),a			;9d49
	inc hl			;9d4a
	ld (hl),b			;9d4b
	inc hl			;9d4c
	ld (hl),00ch		;9d4d
	inc hl			;9d4f
	ld (hl),001h		;9d50
	jp 04192h		;9d52
L_9D55:
	push hl			;9d55
	call L_9D5B		;9d56
	pop hl			;9d59
	ret			;9d5a
L_9D5B:
	ld de,(0e250h)		;9d5b
L_9D5F:
	ld a,l			;9d5f
	and 0f8h		;9d60
	ld l,a			;9d62
	ld a,h			;9d63
	and 0f8h		;9d64
	ld h,000h		;9d66
	add hl,de			;9d68
	rra			;9d69
	rra			;9d6a
	rra			;9d6b
	and 01fh		;9d6c
	ld b,a			;9d6e
	rra			;9d6f
	rra			;9d70
	and 007h		;9d71
	ld d,000h		;9d73
	ld e,a			;9d75
	add hl,de			;9d76
	ld a,b			;9d77
	and 003h		;9d78
	xor 003h		;9d7a
	ld b,a			;9d7c
	push bc			;9d7d
	ld a,(hl)			;9d7e
	jr z,L_9D85		;9d7f
L_9D81:
	rra			;9d81
	rra			;9d82
	djnz L_9D81		;9d83
L_9D85:
	pop bc			;9d85
	and 003h		;9d86
	ret			;9d88
L_9D89:
	push bc			;9d89
	call L_9DD3		;9d8a
	push hl			;9d8d
	call L_9D5B		;9d8e
	pop hl			;9d91
	pop bc			;9d92
	sub 002h		;9d93
	ret nc			;9d95
	push bc			;9d96
	call L_9E07		;9d97
	push hl			;9d9a
	call L_9D5B		;9d9b
	pop hl			;9d9e
	pop bc			;9d9f
	sub 002h		;9da0
	ret nc			;9da2
	call L_9E07		;9da3
	call L_9D5B		;9da6
	sub 002h		;9da9
	ret			;9dab
L_9DAC:
	push bc			;9dac
	call L_9DD3		;9dad
	push hl			;9db0
	push de			;9db1
	call L_9D5F		;9db2
	pop de			;9db5
	pop hl			;9db6
	pop bc			;9db7
	sub 002h		;9db8
	ret nc			;9dba
	push bc			;9dbb
	call L_9E07		;9dbc
	push hl			;9dbf
	push de			;9dc0
	call L_9D5F		;9dc1
	pop de			;9dc4
	pop hl			;9dc5
	pop bc			;9dc6
	sub 002h		;9dc7
	ret nc			;9dc9
	call L_9E07		;9dca
	call L_9D5F		;9dcd
	sub 002h		;9dd0
	ret			;9dd2
L_9DD3:
	ld a,c			;9dd3
	dec a			;9dd4
	jr z,L_9DE9		;9dd5
	dec a			;9dd7
	jr z,L_9DF7		;9dd8
	dec a			;9dda
	jr z,L_9DFF		;9ddb
	ld a,h			;9ddd
	add a,002h		;9dde
	ld h,a			;9de0
	ld a,l			;9de1
	sub 001h		;9de2
	ld l,a			;9de4
	ret nc			;9de5
	ld l,000h		;9de6
	ret			;9de8
L_9DE9:
	ld a,h			;9de9
	add a,002h		;9dea
	ld h,a			;9dec
	ld a,l			;9ded
	add a,010h		;9dee
	ld l,a			;9df0
	cp 0b8h		;9df1
	ret c			;9df3
	ld l,0b8h		;9df4
	ret			;9df6
L_9DF7:
	ld a,h			;9df7
	sub 001h		;9df8
	ld h,a			;9dfa
	ret nc			;9dfb
	ld h,000h		;9dfc
	ret			;9dfe
L_9DFF:
	ld a,h			;9dff
	add a,010h		;9e00
	ld h,a			;9e02
	ret nc			;9e03
	ld h,0f8h		;9e04
	ret			;9e06
L_9E07:
	ld a,c			;9e07
	cp 002h		;9e08
	jr nc,L_9E11		;9e0a
	ld a,h			;9e0c
	add a,006h		;9e0d
	ld h,a			;9e0f
	ret			;9e10
L_9E11:
	ld a,l			;9e11
	add a,006h		;9e12
	ld l,a			;9e14
	ret			;9e15
L_9E16:
	call 041c7h		;9e16
	call L_9E1F		;9e19
	jp 04192h		;9e1c
L_9E1F:
	ld ix,0e300h		;9e1f
	ld hl,0afb1h		;9e23
	ld a,(0e242h)		;9e26
	dec a			;9e29
	call 04d4dh		;9e2a
L_9E2D:
	call L_9E38		;9e2d
	ret z			;9e30
	ld de,00008h		;9e31
	add ix,de		;9e34
	jr L_9E2D		;9e36
L_9E38:
	ld a,(hl)			;9e38
	cp 0ffh		;9e39
	ret z			;9e3b
	and 00fh		;9e3c
	ld (ix+000h),a		;9e3e
	ld a,(hl)			;9e41
	rra			;9e42
	rra			;9e43
	rra			;9e44
	rra			;9e45
	and 00fh		;9e46
	ld (ix+003h),a		;9e48
	inc hl			;9e4b
	ld a,(hl)			;9e4c
	ld (ix+001h),a		;9e4d
	inc hl			;9e50
	ld a,(hl)			;9e51
	ld (ix+002h),a		;9e52
	inc hl			;9e55
	xor a			;9e56
	ld (ix+004h),a		;9e57
	ld (ix+005h),a		;9e5a
	ld (ix+006h),a		;9e5d
	ld (ix+007h),a		;9e60
	inc a			;9e63
	ret			;9e64

; ----------------------------------------------------------------------
; DATOS resto_9E65: lo apuntan con el banco puesto p00:4165 (0x9E65), p03:A135
;   (0x9E65); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p00:4165, p03:A135 (50 bytes)
;   0x9e65..0x9e97  (50 bytes)
DATA_resto_9E65:
	defb 067h,09eh,0c5h,0cdh,04fh,0a1h,03eh,001h,032h,0e6h,0f0h,03ah,0e9h,0f0h,026h,040h	; 9e65  g...O.>.2..:..&@
	defb 0cdh,024h,000h,0c1h,079h,0e6h,00eh,00fh,0feh,002h,038h,006h,0feh,006h,038h,00bh	; 9e75  .$..y.....8...8.
	defb 018h,005h,00eh,004h,00fh,030h,006h,00eh,003h,018h,002h,00eh,000h,0c3h,09ch,09eh	; 9e85  .....0..........
	defb 00eh,006h	; 9e95

; ======================================================================
; CODIGO 0x9e97..0x9ed0  (57 bytes)
; ======================================================================


L_9E97:
	push bc			;9e97
	call 0a14fh		;9e98
	pop bc			;9e9b
	ld b,000h		;9e9c
	ld a,c			;9e9e
	add a,a			;9e9f
	ld c,a			;9ea0
	call 041bdh		;9ea1
	ld hl,0af52h		;9ea4
	add hl,bc			;9ea7
	ld a,(hl)			;9ea8
	inc hl			;9ea9
	ld h,(hl)			;9eaa
	ld l,a			;9eab
	push hl			;9eac
	call 04ec7h		;9ead
	pop hl			;9eb0
	call 04f0bh		;9eb1
	ld hl,0af60h		;9eb4
	call 04f0bh		;9eb7
	call 04192h		;9eba
	call 0a196h		;9ebd
	ld a,(0f0e4h)		;9ec0
	ld (0fd9ah),a		;9ec3
	ld a,002h		;9ec6
	ld (0e27fh),a		;9ec8
	ld sp,(0f0e2h)		;9ecb
	ret			;9ecf

; ----------------------------------------------------------------------
; DATOS resto_9ED0: lo apuntan con el banco puesto p03:A013 (0x9ED0); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p03:A013 (27 bytes)
;   0x9ed0..0x9eeb  (27 bytes)
DATA_resto_9ED0:
	defb 0d2h,09eh,0cdh,04fh,0a1h,03ah,0e9h,0f0h,026h,040h,0cdh,024h,000h,0cdh,096h,0a1h	; 9ed0  ...O.:..&@.$....
	defb 03ah,0e4h,0f0h,032h,09ah,0fdh,0edh,07bh,0e2h,0f0h,0c9h	; 9ee0  :..2...{...

; ======================================================================
; CODIGO 0x9eeb..0xa000  (277 bytes)
; ======================================================================


L_9EEB:
	di			;9eeb
	ld a,(0fd9ah)		;9eec
	ld (0f0e4h),a		;9eef
	ld a,0c9h		;9ef2
	ld (0fd9ah),a		;9ef4
	ld (0f0e2h),sp		;9ef7
	call 0a108h		;9efb
	ld hl,0c270h		;9efe
	ld de,0ce00h		;9f01
	call 0a0a6h		;9f04
	call 0a038h		;9f07
	call 0a07bh		;9f0a
	call L_9F1F		;9f0d
	call 0a05ah		;9f10
	di			;9f13
	call 0a14fh		;9f14
	ld a,(0f0e4h)		;9f17
	ld (0fd9ah),a		;9f1a
	ei			;9f1d
	ret			;9f1e
L_9F1F:
	ld de,0c243h		;9f1f
	ld c,01ah		;9f22
	call 0f37dh		;9f24
	ld hl,00001h		;9f27
	call 0a0f8h		;9f2a
	ld de,0c25ch		;9f2d
	ld c,01ah		;9f30
	call 0f37dh		;9f32
	ld hl,00023h		;9f35
	call 0a0f8h		;9f38
	ld de,0c282h		;9f3b
	ld c,01ah		;9f3e
	call 0f37dh		;9f40
	ld hl,00003h		;9f43
	call 0a0f8h		;9f46
	ld de,0c2c0h		;9f49
	ld c,01ah		;9f4c
	call 0f37dh		;9f4e
	ld hl,00240h		;9f51
	call 0a0f8h		;9f54
	ld de,0c600h		;9f57
	ld c,01ah		;9f5a
	call 0f37dh		;9f5c
	ld hl,00200h		;9f5f
	call 0a0f8h		;9f62
	ld de,0c900h		;9f65
	ld c,01ah		;9f68
	call 0f37dh		;9f6a
	ld hl,004c0h		;9f6d
	call 0a0f8h		;9f70
	ret			;9f73
L_9F74:
	di			;9f74
	ld a,(0fd9ah)		;9f75
	ld (0f0e4h),a		;9f78
	ld a,0c9h		;9f7b
	ld (0fd9ah),a		;9f7d
	ld (0f0e2h),sp		;9f80
	call 0a108h		;9f84
	ld hl,0c270h		;9f87
	ld de,0ce00h		;9f8a
	call 0a0bah		;9f8d
	call 0a1a0h		;9f90
	call 0a048h		;9f93
	call 0a07bh		;9f96
	call L_9FAB		;9f99
	call 0a05ah		;9f9c
	di			;9f9f
	call 0a14fh		;9fa0
	ld a,(0f0e4h)		;9fa3
	ld (0fd9ah),a		;9fa6
	ei			;9fa9
	ret			;9faa
L_9FAB:
	ld de,0c243h		;9fab
	ld c,01ah		;9fae
	call 0f37dh		;9fb0
	ld hl,00001h		;9fb3
	call 0a0e8h		;9fb6
	ld de,0c25ch		;9fb9
	ld c,01ah		;9fbc
	call 0f37dh		;9fbe
	ld hl,00023h		;9fc1
	call 0a0e8h		;9fc4
	ld de,0c282h		;9fc7
	ld c,01ah		;9fca
	call 0f37dh		;9fcc
	ld hl,00003h		;9fcf
	call 0a0e8h		;9fd2
	ld de,0c2c0h		;9fd5
	ld c,01ah		;9fd8
	call 0f37dh		;9fda
	ld hl,00240h		;9fdd
	call 0a0e8h		;9fe0
	ld de,0c600h		;9fe3
	ld c,01ah		;9fe6
	call 0f37dh		;9fe8
	ld hl,00200h		;9feb
	call 0a0e8h		;9fee
	ld de,0c900h		;9ff1
	ld c,01ah		;9ff4
	call 0f37dh		;9ff6
	ld hl,004c0h		;9ff9
	call 0a0e8h		;9ffc
	ret			;9fff
