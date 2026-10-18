; ==========================================================================
; KING'S VALLEY II - Konami (1988) - MSX2 - MegaROM RC-761 de 128 KB (Konami SCC) - banco 00 (se ejecuta en 0x4000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x04000


; ----------------------------------------------------------------------
; DATOS resto_4000: lo apuntan con el banco puesto p02:9221 (0x4001), p01:6F3C
;   (0x4010), p01:6F46 (0x4011); el tamano es lo que hay hasta lo siguiente,
;   no sale de recorrerlo; lo leen p02:9221, p01:6F3C, p01:6F46 (46 bytes)
;   0x4000..0x402e  (46 bytes)
DATA_resto_4000:
	defb 041h,042h,0a3h,040h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 4000  AB.@............
	defb 043h,044h,007h,061h,0e0h,000h,0e2h,004h,042h,0e2h,03ch,040h,0e2h,023h,0e2h,026h	; 4010  CD.a....B.<@.#.&
	defb 0e2h,000h,000h,000h,000h,000h,000h,000h,081h,001h,001h,000h,080h,0f6h	; 4020  ..............

; ======================================================================
; CODIGO 0x402e..0x41a6  (376 bytes)
; ======================================================================


L_402E:
	di			;402e
	ld hl,0e215h		;402f
	ld a,(hl)			;4032
	cp 002h		;4033
	jr c,L_403E		;4035
	inc hl			;4037
	ld a,(hl)			;4038
	and a			;4039
	jr nz,L_403E		;403a
	dec hl			;403c
	dec (hl)			;403d
L_403E:
	ld hl,0e21ah		;403e
	ld a,(hl)			;4041
	and a			;4042
	jr z,L_4049		;4043
	dec a			;4045
	jr z,L_4049		;4046
	dec (hl)			;4048
L_4049:
	ld hl,0e206h		;4049
	ld a,(hl)			;404c
	and a			;404d
	ld (hl),001h		;404e
	jp nz,L_408D		;4050
	ld a,004h		;4053
	ld (07000h),a		;4055
	inc a			;4058
	ld (09000h),a		;4059
	inc a			;405c
	ld (0b000h),a		;405d
	call 06006h		;4060
	xor a			;4063
	ld (0e206h),a		;4064
	di			;4067
	ld a,(0f0f1h)		;4068
	ld (07000h),a		;406b
	ld a,(0f0f2h)		;406e
	ld (09000h),a		;4071
	ld a,(0f0f3h)		;4074
	ld (0b000h),a		;4077
	ld hl,0e205h		;407a
	ld a,(hl)			;407d
	and a			;407e
	jr nz,L_408D		;407f
	inc (hl)			;4081
	ei			;4082
	call L_541C		;4083
	call L_46D4		;4086
	xor a			;4089
	ld (0e205h),a		;408a
L_408D:
	ei			;408d
	ret			;408e
L_408F:
	add a,l			;408f
	ld l,a			;4090
	ret nc			;4091
	inc h			;4092
	ret			;4093
L_4094:
	add a,e			;4094
	ld e,a			;4095
	ret nc			;4096
	inc d			;4097
	ret			;4098
L_4099:
	pop hl			;4099
L_409A:
	add a,a			;409a
	call L_408F		;409b
	ld a,(hl)			;409e
	inc hl			;409f
	ld h,(hl)			;40a0
	ld l,a			;40a1
	jp (hl)			;40a2
L_40A3:
	di			;40a3
	call L_4146		;40a4
	di			;40a7
	ld h,a			;40a8
	ld l,0f7h		;40a9
	ld (0fedah),hl		;40ab
	ld hl,L_40B5		;40ae
	ld (0fedch),hl		;40b1
	ret			;40b4
L_40B5:
	di			;40b5
	im 1		;40b6
	ld sp,0e000h		;40b8
	ld a,(0ffa7h)		;40bb
	cp 0c9h		;40be
	call nz,L_4162		;40c0
	ld a,0c9h		;40c3
	ld (0fd9ah),a		;40c5
	call L_4126		;40c8
	call L_4146		;40cb
	ld a,001h		;40ce
	ld (0f0f4h),a		;40d0
	ld (0f0f5h),a		;40d3
	xor a			;40d6
	ld hl,0e000h		;40d7
	ld de,0e001h		;40da
	ld bc,00fffh		;40dd
	ld (hl),a			;40e0
	ldir		;40e1
	ld hl,0d200h		;40e3
	ld de,0d201h		;40e6
	ld bc,001ffh		;40e9
	ld (hl),a			;40ec
	ldir		;40ed
	ld a,001h		;40ef
	ld (0e219h),a		;40f1
	xor a			;40f4
	ld (0f3eah),a		;40f5
	ld (0f3ebh),a		;40f8
	ld hl,0f0f1h		;40fb
	ld a,001h		;40fe
	ld (07000h),a		;4100
	ld (hl),a			;4103
	inc a			;4104
	ld (09000h),a		;4105
	inc hl			;4108
	ld (hl),a			;4109
	inc a			;410a
	ld (0b000h),a		;410b
	inc hl			;410e
	ld (hl),a			;410f
	call L_53B6		;4110
	di			;4113
	ld a,0c3h		;4114
	ld (0fd9fh),a		;4116
	ld hl,L_402E		;4119
	ld (0fda0h),hl		;411c
	xor a			;411f
	ld (0f3dbh),a		;4120
	ei			;4123
L_4124:
	jr L_4124		;4124
L_4126:
	call 00138h		;4126   ; BIOS RSLREG - Reads the primary slot register
	rrca			;4129
	rrca			;412a
	and 003h		;412b
	ld c,a			;412d
	ld b,000h		;412e
	ld hl,0fcc1h		;4130
	add hl,bc			;4133
	ld a,(hl)			;4134
	and 080h		;4135
	or c			;4137
	ld c,a			;4138
	inc hl			;4139
	inc hl			;413a
	inc hl			;413b
	inc hl			;413c
	ld a,(hl)			;413d
	and 00ch		;413e
	or c			;4140
	ld h,080h		;4141
	jp 00024h		;4143   ; BIOS ENASLT - Switches to specified slot and page definitively
L_4146:
	call 00138h		;4146   ; BIOS RSLREG - Reads the primary slot register
	rrca			;4149
	rrca			;414a
	and 003h		;414b
	ld c,a			;414d
	ld b,000h		;414e
	ld hl,0fcc1h		;4150
	add hl,bc			;4153
	or (hl)			;4154
	ld c,a			;4155
	inc hl			;4156
	inc hl			;4157
	inc hl			;4158
	inc hl			;4159
	ld a,(hl)			;415a
	and 00ch		;415b
	or c			;415d
	ld (0f0e9h),a		;415e
	ret			;4161
L_4162:
	ld hl,0972ch		;4162
	ld (0f323h),hl		;4165
	ld hl,0e280h		;4168
	ld bc,01100h		;416b
	ld de,0c000h		;416e
	ldir		;4171
	ld hl,0f100h		;4173
	ld de,0d780h		;4176
	ld bc,00280h		;4179
	ldir		;417c
	ld hl,0fd9fh		;417e
	ld de,0f0eah		;4181
	ld bc,00005h		;4184
	ldir		;4187
	ret			;4189
L_418A:
	push af			;418a
	ld a,001h		;418b
L_418D:
	di			;418d
	push hl			;418e
	ld hl,0f0f1h		;418f
	ld (hl),a			;4192
	ld (07000h),a		;4193
	inc a			;4196
	inc hl			;4197
	ld (hl),a			;4198
	ld (09000h),a		;4199
	inc a			;419c
	inc hl			;419d
	ld (hl),a			;419e
	ld (0b000h),a		;419f
	pop hl			;41a2
	pop af			;41a3
	ei			;41a4
	ret			;41a5

; ----------------------------------------------------------------------
; DATOS sin identificar  0x41a6..0x41ab  (5 bytes)
DATA_41A6:
	defb 0f5h,03eh,004h,018h,0e2h	; 41a6

; ======================================================================
; CODIGO 0x41ab..0x41ba  (15 bytes)
; ======================================================================


L_41AB:
	push af			;41ab
	ld a,007h		;41ac
	jr $-33		;41ae
L_41B0:
	push af			;41b0
	ld a,00ah		;41b1
	jr $-38		;41b3
L_41B5:
	push af			;41b5
	ld a,00ch		;41b6
	jr $+10		;41b8

; ----------------------------------------------------------------------
; DATOS sin identificar  0x41ba..0x41bf  (5 bytes)
DATA_41BA:
	defb 0f5h,03eh,00fh,018h,003h	; 41ba

; ======================================================================
; CODIGO 0x41bf..0x41e5  (38 bytes)
; ======================================================================


L_41BF:
	push af			;41bf
	ld a,00dh		;41c0
L_41C2:
	di			;41c2
	ld (0f0f3h),a		;41c3
	ld (0b000h),a		;41c6
	pop af			;41c9
	ei			;41ca
	ret			;41cb
L_41CC:
	push af			;41cc
	ld a,00eh		;41cd
	di			;41cf
	ld (0f0f2h),a		;41d0
	ld (09000h),a		;41d3
	inc a			;41d6
	ld (0f0f3h),a		;41d7
	ld (0b000h),a		;41da
	pop af			;41dd
	ei			;41de
	ret			;41df
L_41E0:
	ld a,001h		;41e0
	jp L_4326		;41e2

; ----------------------------------------------------------------------
; DATOS sin identificar  0x41e5..0x41ea  (5 bytes)
DATA_41E5:
	defb 03eh,002h,0c3h,026h,043h	; 41e5

; ======================================================================
; CODIGO 0x41ea..0x41ef  (5 bytes)
; ======================================================================


L_41EA:
	ld a,003h		;41ea
	jp L_4326		;41ec

; ----------------------------------------------------------------------
; DATOS sin identificar  0x41ef..0x41f4  (5 bytes)
DATA_41EF:
	defb 03eh,004h,0c3h,026h,043h	; 41ef

; ======================================================================
; CODIGO 0x41f4..0x4271  (125 bytes)
; ======================================================================


L_41F4:
	ld a,005h		;41f4
	jp L_4326		;41f6
L_41F9:
	ld a,006h		;41f9
	jp L_4326		;41fb
L_41FE:
	ld a,007h		;41fe
	jp L_4326		;4200
L_4203:
	ld a,008h		;4203
	jp L_4326		;4205
L_4208:
	ld a,009h		;4208
	jp L_4326		;420a
L_420D:
	ld a,00ah		;420d
	jp L_4326		;420f
L_4212:
	ld a,00bh		;4212
	jp L_4326		;4214
L_4217:
	ld a,00ch		;4217
	jp L_4326		;4219
L_421C:
	ld a,00dh		;421c
	jp L_4326		;421e
L_4221:
	ld a,00eh		;4221
	jp L_4326		;4223
L_4226:
	ld a,00fh		;4226
	jp L_4326		;4228
L_422B:
	ld a,010h		;422b
	jp L_4326		;422d
L_4230:
	ld a,011h		;4230
	jp L_4326		;4232
L_4235:
	ld a,012h		;4235
	jp L_4326		;4237
L_423A:
	ld a,013h		;423a
	jp L_4326		;423c
L_423F:
	ld a,014h		;423f
	jp L_4326		;4241
L_4244:
	ld a,015h		;4244
	jp L_4326		;4246
L_4249:
	ld a,016h		;4249
	jp L_4326		;424b
L_424E:
	ld a,017h		;424e
	jp L_4326		;4250
L_4253:
	ld a,018h		;4253
	jp L_4326		;4255
L_4258:
	ld a,019h		;4258
	jp L_4326		;425a
L_425D:
	ld a,01ah		;425d
	jp L_4326		;425f
L_4262:
	ld a,01bh		;4262
	jp L_4326		;4264
L_4267:
	ld a,01ch		;4267
	jp L_4326		;4269
L_426C:
	ld a,01dh		;426c
	jp L_4326		;426e

; ----------------------------------------------------------------------
; DATOS resto_4271: lo apuntan con el banco puesto p03:AD4D (0x4271), p03:B37C
;   (0x4276); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p03:AD4D, p03:B37C (10 bytes)
;   0x4271..0x427b  (10 bytes)
DATA_resto_4271:
	defb 03eh,01eh,0c3h,026h,043h,03eh,01fh,0c3h,026h,043h	; 4271  >..&C>..&C

; ======================================================================
; CODIGO 0x427b..0x42af  (52 bytes)
; ======================================================================


L_427B:
	ld a,020h		;427b
	jp L_4326		;427d
L_4280:
	ld a,021h		;4280
	jp L_4326		;4282
L_4285:
	ld a,022h		;4285
	jp L_4326		;4287
L_428A:
	ld a,023h		;428a
	jp L_4326		;428c
L_428F:
	ld a,024h		;428f
	jp L_4326		;4291
L_4294:
	ld a,025h		;4294
	jp L_4326		;4296
L_4299:
	ld a,026h		;4299
	jp L_4326		;429b
L_429E:
	ld a,027h		;429e
	jp L_4326		;42a0
L_42A3:
	ld a,028h		;42a3
	jr $+129		;42a5
L_42A7:
	ld a,029h		;42a7
	jr $+125		;42a9
L_42AB:
	ld a,02ah		;42ab
	jr $+121		;42ad

; ----------------------------------------------------------------------
; DATOS resto_42AF: lo apuntan con el banco puesto p03:AF48 (0x42B3); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p03:AF48 (8 bytes)
;   0x42af..0x42b7  (8 bytes)
DATA_resto_42AF:
	defb 03eh,02bh,018h,073h,03eh,02ch,018h,06fh	; 42af  >+.s>,.o

; ======================================================================
; CODIGO 0x42b7..0x42bf  (8 bytes)
; ======================================================================


L_42B7:
	ld a,02dh		;42b7
	jr $+109		;42b9
L_42BB:
	ld a,02eh		;42bb
	jr $+105		;42bd

; ----------------------------------------------------------------------
; DATOS sin identificar  0x42bf..0x42c3  (4 bytes)
DATA_42BF:
	defb 03eh,02fh,018h,063h	; 42bf

; ======================================================================
; CODIGO 0x42c3..0x42c7  (4 bytes)
; ======================================================================


L_42C3:
	ld a,030h		;42c3
	jr $+97		;42c5

; ----------------------------------------------------------------------
; DATOS sin identificar  0x42c7..0x42cb  (4 bytes)
DATA_42C7:
	defb 03eh,031h,018h,05bh	; 42c7

; ======================================================================
; CODIGO 0x42cb..0x42cf  (4 bytes)
; ======================================================================


L_42CB:
	ld a,032h		;42cb
	jr $+89		;42cd

; ----------------------------------------------------------------------
; DATOS sin identificar  0x42cf..0x42d7  (8 bytes)
DATA_42CF:
	defb 03eh,033h,018h,053h,03eh,034h,018h,04fh	; 42cf  >3.S>4.O

; ======================================================================
; CODIGO 0x42d7..0x42ff  (40 bytes)
; ======================================================================


L_42D7:
	ld a,035h		;42d7
	jr $+77		;42d9
L_42DB:
	ld a,036h		;42db
	jr $+73		;42dd
L_42DF:
	ld a,037h		;42df
	jr $+69		;42e1
L_42E3:
	ld a,038h		;42e3
	jr $+65		;42e5
L_42E7:
	ld a,039h		;42e7
	jr $+61		;42e9
L_42EB:
	ld a,03ah		;42eb
	jr $+57		;42ed
L_42EF:
	ld a,03bh		;42ef
	jr $+53		;42f1
L_42F3:
	ld a,03ch		;42f3
	jr $+49		;42f5
L_42F7:
	ld a,03dh		;42f7
	jr $+45		;42f9
L_42FB:
	ld a,03eh		;42fb
	jr $+41		;42fd

; ----------------------------------------------------------------------
; DATOS sin identificar  0x42ff..0x4303  (4 bytes)
DATA_42FF:
	defb 03eh,03fh,018h,023h	; 42ff

; ======================================================================
; CODIGO 0x4303..0x4307  (4 bytes)
; ======================================================================


L_4303:
	ld a,040h		;4303
	jr $+33		;4305

; ----------------------------------------------------------------------
; DATOS resto_4307: lo apuntan con el banco puesto p03:AE3F (0x4307); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p03:AE3F (4 bytes)
;   0x4307..0x430b  (4 bytes)
DATA_resto_4307:
	defb 03eh,041h,018h,01bh	; 4307

; ======================================================================
; CODIGO 0x430b..0x4324  (25 bytes)
; ======================================================================


L_430B:
	ld a,080h		;430b
	jr $+25		;430d
L_430F:
	ld a,081h		;430f
	jr $+21		;4311
L_4313:
	xor a			;4313
	ld (0e21ah),a		;4314
	ld a,082h		;4317
	jr $+13		;4319
L_431B:
	ld a,0ffh		;431b
	ld (0e21ah),a		;431d
	ld a,083h		;4320
	jr $+4		;4322

; ----------------------------------------------------------------------
; DATOS sin identificar  0x4324..0x4326  (2 bytes)
DATA_4324:
	defb 03eh,084h	; 4324

; ======================================================================
; CODIGO 0x4326..0x43a4  (126 bytes)
; ======================================================================


L_4326:
	di			;4326
	push hl			;4327
	push de			;4328
	push bc			;4329
	push ix		;432a
	push af			;432c
	ld a,004h		;432d
	ld (07000h),a		;432f
	inc a			;4332
	ld (09000h),a		;4333
	inc a			;4336
	ld (0b000h),a		;4337
	pop af			;433a
	push af			;433b
	call 06003h		;433c
	ld hl,0f0f1h		;433f
	ld a,(hl)			;4342
	ld (07000h),a		;4343
	inc hl			;4346
	ld a,(hl)			;4347
	ld (09000h),a		;4348
	inc hl			;434b
	ld a,(hl)			;434c
	ld (0b000h),a		;434d
	pop af			;4350
	pop ix		;4351
	pop bc			;4353
	pop de			;4354
	pop hl			;4355
	ei			;4356
	ret			;4357
L_4358:
	call L_418A		;4358
	call L_5D63		;435b
	jr L_4366		;435e
L_4360:
	call L_418A		;4360
	call L_5C80		;4363
L_4366:
	jp L_41B5		;4366
L_4369:
	call L_418A		;4369
	call L_5CF5		;436c
	jr L_4366		;436f
L_4371:
	ld a,(0e215h)		;4371
	and a			;4374
	ret nz			;4375
	ld a,(0e20ch)		;4376
	and 008h		;4379
	ret z			;437b
	ld hl,0e253h		;437c
	ld a,(hl)			;437f
	xor 001h		;4380
	ld (hl),a			;4382
	jp nz,L_41E0		;4383
	jr L_438D		;4386
L_4388:
	ld a,(0e253h)		;4388
	and a			;438b
	ret nz			;438c
L_438D:
	call L_4313		;438d
	ld a,(0e242h)		;4390
	call L_4CFD		;4393
	dec a			;4396
	and 00fh		;4397
	cp 00fh		;4399
	jr nz,L_439F		;439b
	ld a,009h		;439d
L_439F:
	srl a		;439f
	call L_4099		;43a1

; ----------------------------------------------------------------------
; DATOS tabla_43A4: 5 destinos del despachador p00:4099 (call en p00:43A1, el
;   indice en A): 41F4, 41F9, 41FE, 4203, 4208; lo leen p00:43A1 (10 bytes)
;   0x43a4..0x43ae  (10 bytes)
DATA_tabla_43A4:
	defw 041f4h,041f9h,041feh,04203h,04208h	; 43a4

; ======================================================================
; CODIGO 0x43ae..0x45c9  (539 bytes)
; ======================================================================


L_43AE:
	ld a,(0e203h)		;43ae
	call L_4CFD		;43b1
	and 00fh		;43b4
	inc a			;43b6
	ld (0e242h),a		;43b7
	ret			;43ba
L_43BB:
	call L_43C2		;43bb
	call L_4400		;43be
	ret			;43c1
L_43C2:
	call L_41B0		;43c2
	call L_43CB		;43c5
	jp L_418A		;43c8
L_43CB:
	ld a,(0e242h)		;43cb
	dec a			;43ce
	ld hl,06000h		;43cf
	call L_4D4C		;43d2
	ex de,hl			;43d5
	ld hl,0e900h		;43d6
	exx			;43d9
	ld b,004h		;43da
	exx			;43dc
L_43DD:
	ld a,(de)			;43dd
	and a			;43de
	ret z			;43df
	and 03fh		;43e0
	ld b,a			;43e2
	ld a,(de)			;43e3
	rlca			;43e4
	rlca			;43e5
	and 003h		;43e6
	inc de			;43e8
	ld c,a			;43e9
L_43EA:
	call L_43F1		;43ea
	djnz L_43EA		;43ed
	jr L_43DD		;43ef
L_43F1:
	ld a,(hl)			;43f1
	add a,a			;43f2
	add a,a			;43f3
	or c			;43f4
	ld (hl),a			;43f5
	exx			;43f6
	dec b			;43f7
	exx			;43f8
	ret nz			;43f9
	exx			;43fa
	ld b,004h		;43fb
	exx			;43fd
	inc hl			;43fe
	ret			;43ff
L_4400:
	call L_41B0		;4400
	call L_4416		;4403
	call L_440C		;4406
	jp L_418A		;4409
L_440C:
	ld a,001h		;440c
	ld (0efc3h),a		;440e
	ld hl,060f0h		;4411
	jr L_441D		;4414
L_4416:
	ld hl,06078h		;4416
	xor a			;4419
	ld (0efc3h),a		;441a
L_441D:
	ld a,001h		;441d
	ld (0efc2h),a		;441f
	ld de,0e900h		;4422
	ld (0efc0h),de		;4425
	ld ix,0e7c0h		;4429
	ld a,(0e242h)		;442d
	dec a			;4430
	call L_4D4C		;4431
L_4434:
	ld e,(hl)			;4434
	inc hl			;4435
	ld a,e			;4436
	cp 0ffh		;4437
	jr z,L_444A		;4439
	ld d,(hl)			;443b
	ld a,e			;443c
	and a			;443d
	ret z			;443e
	inc hl			;443f
	push hl			;4440
	call L_4460		;4441
	call L_446C		;4444
	pop hl			;4447
L_4448:
	jr L_4434		;4448
L_444A:
	push hl			;444a
	call L_4451		;444b
	pop hl			;444e
	jr L_4448		;444f
L_4451:
	ld hl,0efc2h		;4451
	inc (hl)			;4454
	ld hl,(0efc0h)		;4455
	ld bc,000c0h		;4458
	add hl,bc			;445b
	ld (0efc0h),hl		;445c
	ret			;445f
L_4460:
	ld l,e			;4460
	ld h,d			;4461
	add hl,hl			;4462
	ld l,h			;4463
	ld h,000h		;4464
	ld bc,(0efc0h)		;4466
	add hl,bc			;446a
	ret			;446b
L_446C:
	ld a,(0efc3h)		;446c
	and a			;446f
	call nz,L_44AC		;4470
	ld a,e			;4473
	and 01fh		;4474
	ld b,a			;4476
	ld a,e			;4477
	rlca			;4478
	rlca			;4479
	rlca			;447a
	and 003h		;447b
	ld e,a			;447d
L_447E:
	push bc			;447e
	call L_449A		;447f
	inc e			;4482
	ld a,e			;4483
	and 003h		;4484
	ld e,a			;4486
	jr nz,L_448A		;4487
	inc hl			;4489
L_448A:
	call L_449A		;448a
	ld bc,00008h		;448d
	dec e			;4490
	jp p,L_4495		;4491
	dec c			;4494
L_4495:
	add hl,bc			;4495
	pop bc			;4496
	djnz L_447E		;4497
	ret			;4499
L_449A:
	ld a,e			;449a
	and a			;449b
	ld a,040h		;449c
	jr z,L_44A5		;449e
	ld b,e			;44a0
L_44A1:
	rra			;44a1
	rra			;44a2
	djnz L_44A1		;44a3
L_44A5:
	ld b,a			;44a5
	rlca			;44a6
	cpl			;44a7
	and (hl)			;44a8
	or b			;44a9
	ld (hl),a			;44aa
	ret			;44ab
L_44AC:
	ld a,(0efc2h)		;44ac
	ld (ix+000h),a		;44af
	ld a,d			;44b2
	add a,a			;44b3
	and 0f8h		;44b4
	ld (ix+001h),a		;44b6
	ld c,d			;44b9
	ld a,e			;44ba
	rr c		;44bb
	rra			;44bd
	rr c		;44be
	rra			;44c0
	and 0f8h		;44c1
	ld (ix+002h),a		;44c3
	ld a,e			;44c6
	and 01fh		;44c7
	or 080h		;44c9
	ld (ix+003h),a		;44cb
	ld bc,00004h		;44ce
	add ix,bc		;44d1
	ret			;44d3
L_44D4:
	call 0ba3ch		;44d4
	call L_41CC		;44d7
	call L_44F2		;44da
	call L_4606		;44dd
	call L_41B0		;44e0
	call L_4535		;44e3
	call L_418A		;44e6
	call L_46A4		;44e9
	call 0651dh		;44ec
	jp 0ba54h		;44ef
L_44F2:
	ld a,(0e241h)		;44f2
	ld hl,07ffeh		;44f5
	call L_4D4C		;44f8
	ld a,(0e242h)		;44fb
	rra			;44fe
	ld a,020h		;44ff
	jr c,L_4504		;4501
	xor a			;4503
L_4504:
	call L_408F		;4504
	ld de,00000h		;4507
	ld c,006h		;450a
L_450C:
	push hl			;450c
	ld b,004h		;450d
L_450F:
	push bc			;450f
	ld c,004h		;4510
L_4512:
	ld b,008h		;4512
	push hl			;4514
L_4515:
	ld a,(hl)			;4515
	call L_5207		;4516
	ld a,d			;4519
	add a,008h		;451a
	ld d,a			;451c
	inc hl			;451d
	djnz L_4515		;451e
	pop hl			;4520
	dec c			;4521
	jr nz,L_4512		;4522
	ld a,008h		;4524
	call L_408F		;4526
	ld a,e			;4529
	add a,008h		;452a
	ld e,a			;452c
	pop bc			;452d
	djnz L_450F		;452e
	pop hl			;4530
	dec c			;4531
	jr nz,L_450C		;4532
	ret			;4534
L_4535:
	xor a			;4535
	ld (0efc0h),a		;4536
	ld hl,(0e242h)		;4539
	dec h			;453c
	ld l,000h		;453d
	ld e,l			;453f
	ld d,h			;4540
	srl d		;4541
	rr e		;4543
	srl d		;4545
	rr e		;4547
	and a			;4549
	sbc hl,de		;454a
	ld de,0e900h		;454c
	add hl,de			;454f
	push hl			;4550
	pop ix		;4551
L_4553:
	ld de,00000h		;4553
	ld b,0c0h		;4556
L_4558:
	push bc			;4558
	ld a,(ix+000h)		;4559
	ld b,004h		;455c
L_455E:
	rlca			;455e
	rlca			;455f
	push af			;4560
	and 003h		;4561
	dec a			;4563
	jr z,$+103		;4564
	dec a			;4566
	jp m,L_4576		;4567
	ld a,005h		;456a
	jr z,L_4570		;456c
	ld a,05eh		;456e
L_4570:
	ld (0efc0h),a		;4570
	call L_5767		;4573
L_4576:
	call L_524B		;4576
	pop af			;4579
	djnz L_455E		;457a
	inc ix		;457c
	pop bc			;457e
	djnz L_4558		;457f
	ld a,(0e200h)		;4581
	cp 00bh		;4584
	ret z			;4586
	ld ix,0e7c0h		;4587
	ld b,010h		;458b
	ld a,(0e243h)		;458d
	ld c,a			;4590
L_4591:
	push bc			;4591
	ld a,(ix+000h)		;4592
	and a			;4595
	jr z,L_459E		;4596
	cp c			;4598
	jr nz,L_459E		;4599
	call L_45A7		;459b
L_459E:
	ld bc,00004h		;459e
	add ix,bc		;45a1
	pop bc			;45a3
	djnz L_4591		;45a4
	ret			;45a6
L_45A7:
	ld c,002h		;45a7
	ld a,(ix+003h)		;45a9
	and 01fh		;45ac
	ld b,a			;45ae
	ld e,(ix+001h)		;45af
	ld d,(ix+002h)		;45b2
	push bc			;45b5
	push de			;45b6
	call L_56DE		;45b7
	pop de			;45ba
	pop bc			;45bb
L_45BC:
	ld hl,045c9h		;45bc
	call L_4690		;45bf
	ld a,e			;45c2
	add a,008h		;45c3
	ld e,a			;45c5
	djnz L_45BC		;45c6
	ret			;45c8

; ----------------------------------------------------------------------
; DATOS resto_45C9: lo apuntan con el banco puesto p00:45BC (0x45C9); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p00:45BC (2 bytes)
;   0x45c9..0x45cb  (2 bytes)
DATA_resto_45C9:
	defb 001h,002h	; 45c9

; ======================================================================
; CODIGO 0x45cb..0x46ed  (290 bytes)
; ======================================================================


L_45CB:
	ld a,(0efc0h)		;45cb
	cp 003h		;45ce
	jr z,L_45F1		;45d0
	cp 003h		;45d2
	jr z,L_45F9		;45d4
	ld a,e			;45d6
	and a			;45d7
	jr z,L_45F5		;45d8
	ld a,b			;45da
	sub 005h		;45db
	neg		;45dd
	ld c,a			;45df
	ld a,(ix-008h)		;45e0
L_45E3:
	rlca			;45e3
	rlca			;45e4
	dec c			;45e5
	jr nz,L_45E3		;45e6
	and 003h		;45e8
	dec a			;45ea
	jr z,L_45F5		;45eb
	ld a,003h		;45ed
	jr L_45FD		;45ef
L_45F1:
	ld a,004h		;45f1
	jr L_45FD		;45f3
L_45F5:
	ld a,003h		;45f5
	jr L_45FD		;45f7
L_45F9:
	ld a,004h		;45f9
	jr L_45FD		;45fb
L_45FD:
	ld (0efc0h),a		;45fd
	call L_5767		;4600
	jp L_4576		;4603
L_4606:
	ld a,(0e254h)		;4606
	and a			;4609
	ret nz			;460a
	ld a,(0e242h)		;460b
	ld hl,0806ah		;460e
	call L_4D4C		;4611
L_4614:
	ld a,(hl)			;4614
	cp 0ffh		;4615
	ret z			;4617
	ld b,a			;4618
	and 0f8h		;4619
	ld e,a			;461b
	inc hl			;461c
	ld a,(hl)			;461d
	and 007h		;461e
	ld d,a			;4620
	ld a,(0e243h)		;4621
	dec a			;4624
	cp d			;4625
	jr nz,L_4634		;4626
	ld a,(hl)			;4628
	and 0f8h		;4629
	ld d,a			;462b
	inc hl			;462c
	ld c,(hl)			;462d
	dec hl			;462e
	push hl			;462f
	call L_4638		;4630
	pop hl			;4633
L_4634:
	inc hl			;4634
	inc hl			;4635
	jr L_4614		;4636
L_4638:
	ld a,b			;4638
	and 007h		;4639
	ld b,a			;463b
	ld a,(0e241h)		;463c
	dec a			;463f
	add a,a			;4640
	add a,a			;4641
	add a,a			;4642
	add a,b			;4643
	ld hl,0800ch		;4644
	call L_4D4C		;4647
	ld a,b			;464a
	srl a		;464b
	cp 003h		;464d
	jr z,L_4679		;464f
	ld bc,00404h		;4651
	and a			;4654
	jr z,L_4660		;4655
	ld bc,00402h		;4657
	dec a			;465a
	jr z,L_4660		;465b
	ld bc,00204h		;465d
L_4660:
	push bc			;4660
	ld b,c			;4661
	push de			;4662
L_4663:
	ld a,(hl)			;4663
	inc hl			;4664
	push hl			;4665
	call L_5767		;4666
	pop hl			;4669
	ld a,d			;466a
	add a,008h		;466b
	ld d,a			;466d
	djnz L_4663		;466e
	pop de			;4670
	ld a,e			;4671
	add a,008h		;4672
	ld e,a			;4674
	pop bc			;4675
	djnz L_4660		;4676
	ret			;4678
L_4679:
	call L_4690		;4679
	inc hl			;467c
	ld a,e			;467d
	add a,008h		;467e
	ld e,a			;4680
	ld b,c			;4681
	dec b			;4682
	dec b			;4683
L_4684:
	call L_4690		;4684
	dec hl			;4687
	ld a,e			;4688
	add a,008h		;4689
	ld e,a			;468b
	djnz L_4684		;468c
	inc hl			;468e
	inc hl			;468f
L_4690:
	push de			;4690
	ld a,(hl)			;4691
	push hl			;4692
	call L_5767		;4693
	pop hl			;4696
	ld a,d			;4697
	add a,008h		;4698
	ld d,a			;469a
	inc hl			;469b
	ld a,(hl)			;469c
	push hl			;469d
	call L_5767		;469e
	pop hl			;46a1
	pop de			;46a2
	ret			;46a3
L_46A4:
	ld hl,0e2c0h		;46a4
	ld b,008h		;46a7
L_46A9:
	push bc			;46a9
	push hl			;46aa
	ld a,(hl)			;46ab
	and 07fh		;46ac
	dec a			;46ae
	sub 002h		;46af
	call c,L_46BD		;46b1
	pop hl			;46b4
	ld de,00005h		;46b5
	add hl,de			;46b8
	pop bc			;46b9
	djnz L_46A9		;46ba
	ret			;46bc
L_46BD:
	inc l			;46bd
	inc l			;46be
	ld a,(0e243h)		;46bf
	cp (hl)			;46c2
	ret nz			;46c3
	inc l			;46c4
	ld a,(hl)			;46c5
	sub 008h		;46c6
	ld e,a			;46c8
	inc l			;46c9
	ld d,(hl)			;46ca
	ld bc,00302h		;46cb
	ld hl,093ach		;46ce
	jp L_573B		;46d1
L_46D4:
	call L_46DA		;46d4
	jp L_4BBA		;46d7
L_46DA:
	ld a,(0e21ah)		;46da
	dec a			;46dd
	call z,L_4313		;46de
	ld hl,0e203h		;46e1
	inc (hl)			;46e4
	ld bc,(0e200h)		;46e5
	ld a,c			;46e9
	call L_4099		;46ea

; ----------------------------------------------------------------------
; DATOS tabla_46ED: 14 destinos del despachador p00:4099 (call en p00:46EA, el
;   indice en A): 4709, 4768, 4787, 47C1, 48AE, 4942, 4A1D, 4A3D, 4AEE, 4B06,
;   4B4C, 4B5D, 4B6E, 4BAF; lo leen p00:46EA (28 bytes)
;   0x46ed..0x4709  (28 bytes)
DATA_tabla_46ED:
	defw 04709h,04768h,04787h,047c1h,048aeh,04942h,04a1dh,04a3dh	; 46ed
	defw 04aeeh,04b06h,04b4ch,04b5dh,04b6eh,04bafh	; 46fd

; ======================================================================
; CODIGO 0x4709..0x470d  (4 bytes)
; ======================================================================


L_4709:
	ld a,b			;4709
	call L_4099		;470a

; ----------------------------------------------------------------------
; DATOS tabla_470D: 5 destinos del despachador p00:4099 (call en p00:470A, el
;   indice en A): 4717, 4723, 4725, 4742, 475C; lo leen p00:470A (10 bytes)
;   0x470d..0x4717  (10 bytes)
DATA_tabla_470D:
	defw 04717h,04723h,04725h,04742h,0475ch	; 470d

; ======================================================================
; CODIGO 0x4717..0x47c5  (174 bytes)
; ======================================================================


L_4717:
	call L_541B		;4717
	call L_41E0		;471a
	call L_4E98		;471d
	call L_5B6A		;4720
L_4723:
	jr L_479C		;4723
L_4725:
	ld a,(0f0f4h)		;4725
	and a			;4728
	jr nz,L_4737		;4729
	ld a,(0e203h)		;472b
	rra			;472e
	ret nc			;472f
	call L_5BC8		;4730
	ret nz			;4733
	xor a			;4734
	jr L_4799		;4735
L_4737:
	call L_5BC8		;4737
	ld a,(0e2c2h)		;473a
	or a			;473d
	ret z			;473e
	xor a			;473f
	jr L_4799		;4740
L_4742:
	ld hl,0e204h		;4742
	dec (hl)			;4745
	ret nz			;4746
	call L_5D41		;4747
	call L_4ECB		;474a
	call L_5BEB		;474d
	call L_5F8D		;4750
	call L_41EA		;4753
	xor a			;4756
	ld (0e2c2h),a		;4757
	jr L_4799		;475a
L_475C:
	call L_5FC6		;475c
	ld a,(0e2c2h)		;475f
	or a			;4762
	ret z			;4763
	ld a,b			;4764
	jp L_4936		;4765
L_4768:
	ld a,(0e201h)		;4768
	or a			;476b
	jr nz,L_477A		;476c
	ld hl,0e204h		;476e
	dec (hl)			;4771
	jr z,L_4777		;4772
	jp L_4D57		;4774
L_4777:
	xor a			;4777
	jr L_4799		;4778
L_477A:
	ld hl,0e204h		;477a
	dec (hl)			;477d
	jr z,L_4784		;477e
	call nz,L_4D57		;4780
	ret			;4783
L_4784:
	jp L_4934		;4784
L_4787:
	ld a,b			;4787
	and a			;4788
	jr nz,L_47A1		;4789
	call L_4E98		;478b
	call L_41B5		;478e
	call 0ba11h		;4791
	call L_418A		;4794
	ld a,020h		;4797
L_4799:
	ld (0e204h),a		;4799
L_479C:
	ld hl,0e201h		;479c
	inc (hl)			;479f
	ret			;47a0
L_47A1:
	call L_41B5		;47a1
	call 0ba66h		;47a4
	call 0ba41h		;47a7
	call L_418A		;47aa
	ld a,(0e246h)		;47ad
	or a			;47b0
	ret nz			;47b1
L_47B2:
	xor a			;47b2
L_47B3:
	ld l,a			;47b3
	ld h,000h		;47b4
	ld (0e200h),hl		;47b6
	ld a,020h		;47b9
	ld (0e204h),a		;47bb
	jp L_493D		;47be
L_47C1:
	ld a,b			;47c1
	call L_4099		;47c2

; ----------------------------------------------------------------------
; DATOS tabla_47C5: 12 destinos del despachador p00:4099 (call en p00:47C2, el
;   indice en A): 47DD, 47E4, 483B, 4844, 4854, 4868, 486E, 487B, 4881, 4890,
;   4896, 48A8; lo leen p00:47C2 (24 bytes)
;   0x47c5..0x47dd  (24 bytes)
DATA_tabla_47C5:
	defw 047ddh,047e4h,0483bh,04844h,04854h,04868h,0486eh,0487bh	; 47c5
	defw 04881h,04890h,04896h,048a8h	; 47d5  -> L_4881 L_4890 L_4896 L_48A8

; ======================================================================
; CODIGO 0x47dd..0x4c1a  (1085 bytes)
; ======================================================================


L_47DD:
	call L_422B		;47dd
	ld a,070h		;47e0
	jr $-73		;47e2
L_47E4:
	ld hl,0e204h		;47e4
	dec (hl)			;47e7
	jr z,L_4801		;47e8
	ld a,(0e222h)		;47ea
	and a			;47ed
	ld hl,05f3eh		;47ee
	jr z,L_47F6		;47f1
	ld hl,05f45h		;47f3
L_47F6:
	ld a,(0e204h)		;47f6
	and 004h		;47f9
	jp z,L_51D0		;47fb
	jp L_51D4		;47fe
L_4801:
	call L_4230		;4801
	ld a,(0e222h)		;4804
	and a			;4807
	jr z,L_4813		;4808
	ld a,001h		;480a
	ld (0e25ah),a		;480c
	ld a,00bh		;480f
	jr $-94		;4811
L_4813:
	ld a,(0f0f7h)		;4813
	inc a			;4816
	jr z,L_4835		;4817
	ld a,001h		;4819
	call 00141h		;481b   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;481e
	and 020h		;481f
	jr z,L_4835		;4821
	call L_4E98		;4823
	call L_41B5		;4826
	ld hl,0b284h		;4829
	call L_51D0		;482c
	call L_418A		;482f
	jp L_479C		;4832
L_4835:
	ld hl,0e201h		;4835
	inc (hl)			;4838
	inc (hl)			;4839
	ret			;483a
L_483B:
	ld a,(0e207h)		;483b
	and 010h		;483e
	ret z			;4840
	jp L_479C		;4841
L_4844:
	xor a			;4844
	ld (0e24ah),a		;4845
	ld (0e254h),a		;4848
	call L_5D41		;484b
	call 0677eh		;484e
	jp L_479C		;4851
L_4854:
	call 06794h		;4854
	ld hl,0e24ah		;4857
	ld a,(hl)			;485a
	and a			;485b
	ret z			;485c
	ld (hl),000h		;485d
	ld a,(0e24bh)		;485f
	add a,a			;4862
	add a,005h		;4863
	jp L_493E		;4865
L_4868:
	call 06807h		;4868
	jp L_479C		;486b
L_486E:
	call 0683eh		;486e
	ld a,(0e24ah)		;4871
	and a			;4874
	ret z			;4875
	ld a,00bh		;4876
	jp L_493E		;4878
L_487B:
	call 06a0bh		;487b
	jp L_479C		;487e
L_4881:
	call 06a32h		;4881
	ld a,(0e24ah)		;4884
	and a			;4887
	ret z			;4888
	dec a			;4889
	jp nz,L_47B2		;488a
	jp L_4934		;488d
L_4890:
	call 08ecbh		;4890
	jp L_479C		;4893
L_4896:
	call 08edah		;4896
	call L_583B		;4899
	ld a,(0e24ah)		;489c
	and a			;489f
	ret z			;48a0
	dec a			;48a1
	jp z,L_4934		;48a2
	jp L_4BEA		;48a5
L_48A8:
	call L_4C01		;48a8
	jp L_4934		;48ab
L_48AE:
	ld a,b			;48ae
	and a			;48af
	jr nz,L_491B		;48b0
	call L_4E98		;48b2
	ld a,(0e254h)		;48b5
	and a			;48b8
	jr nz,L_48F7		;48b9
	ld hl,0e240h		;48bb
	ld a,(hl)			;48be
	sub 001h		;48bf
	daa			;48c1
	ld (hl),a			;48c2
	ld hl,05f13h		;48c3
	call L_51D0		;48c6
	ld de,09048h		;48c9
	call L_4CEF		;48cc
	call L_41BF		;48cf
	ld a,(0e242h)		;48d2
	ld b,a			;48d5
	add a,a			;48d6
	add a,b			;48d7
	add a,002h		;48d8
	ld hl,0b8f8h		;48da
	call L_408F		;48dd
	ld a,(hl)			;48e0
	and 01fh		;48e1
	call L_4CFD		;48e3
	call L_418A		;48e6
	ld hl,0efc0h		;48e9
	ld (hl),a			;48ec
	ld b,001h		;48ed
	ld de,0a868h		;48ef
	call L_4D26		;48f2
	jr L_4913		;48f5
L_48F7:
	xor a			;48f7
	ld (0e240h),a		;48f8
	dec a			;48fb
	ld (0e245h),a		;48fc
	call L_43AE		;48ff
	ld a,001h		;4902
	ld (0e241h),a		;4904
	ld hl,05f28h		;4907
	call L_51D0		;490a
	ld de,06058h		;490d
	call 08a17h		;4910
L_4913:
	ld a,078h		;4913
	ld (0e204h),a		;4915
	jp L_479C		;4918
L_491B:
	ld hl,0e204h		;491b
	dec (hl)			;491e
	ret nz			;491f
	call L_4E98		;4920
	call L_431B		;4923
	call L_5C80		;4926
	call L_4313		;4929
	call L_4388		;492c
	ld hl,0e246h		;492f
	ld (hl),001h		;4932
L_4934:
	ld a,020h		;4934
L_4936:
	ld (0e204h),a		;4936
	ld hl,0e200h		;4939
	inc (hl)			;493c
L_493D:
	xor a			;493d
L_493E:
	ld (0e201h),a		;493e
	ret			;4941
L_4942:
	ld a,(0e24ch)		;4942
	and a			;4945
	jp nz,L_49E1		;4946
	ld hl,0e215h		;4949
	ld a,(hl)			;494c
	and a			;494d
	jr z,L_4958		;494e
	dec a			;4950
	jr nz,L_4958		;4951
	ld (hl),000h		;4953
	call L_4388		;4955
L_4958:
	ld a,(0e24eh)		;4958
	and a			;495b
	jp nz,L_4A07		;495c
	ld a,(0e20ch)		;495f
	and 010h		;4962
	jr nz,L_49A4		;4964
	call L_5D63		;4966
	ld a,(0e248h)		;4969
	and a			;496c
	ld a,008h		;496d
	jp nz,L_47B3		;496f
	ld a,(0e249h)		;4972
	and a			;4975
	jr nz,L_49B4		;4976
	ld a,(0e246h)		;4978
	or a			;497b
	jr z,L_4934		;497c
	ld a,(0e20ch)		;497e
	rra			;4981
	jr c,L_49C1		;4982
	rra			;4984
	ret nc			;4985
	ld a,(0f0f4h)		;4986
	and a			;4989
	ret nz			;498a
	ld a,001h		;498b
	ld (0e24eh),a		;498d
	ld hl,03b00h		;4990
	call 00174h		;4993   ; BIOS NRDVRM - Reads VRAM like in RDVRM (with 16-bit VRAM-address)
	ld (0e24fh),a		;4996
	ld a,0d0h		;4999
	call 00177h		;499b   ; BIOS NWRVRM - Writes to VRAM like in WRTVRM (with 16-bit VRAM-address)
	call L_427B		;499e
	jp L_4D8F		;49a1
L_49A4:
	ld a,(0e298h)		;49a4
	or a			;49a7
	ret nz			;49a8
	ld a,004h		;49a9
	ld (0e280h),a		;49ab
	call 092ffh		;49ae
	jp L_42A3		;49b1
L_49B4:
	xor a			;49b4
	ld (0e249h),a		;49b5
	inc a			;49b8
	ld (0e257h),a		;49b9
	ld a,009h		;49bc
	jp L_47B3		;49be
L_49C1:
	ld a,(0e280h)		;49c1
	sub 004h		;49c4
	cp 002h		;49c6
	ret c			;49c8
	ld a,001h		;49c9
	ld (0e24ch),a		;49cb
	ld (0e216h),a		;49ce
	call L_58D2		;49d1
	xor a			;49d4
	ld (0e2b0h),a		;49d5
	ld (0e2b3h),a		;49d8
	call L_5864		;49db
	jp L_430F		;49de
L_49E1:
	call 06059h		;49e1
	ld a,(0edc0h)		;49e4
	or a			;49e7
	ret nz			;49e8
	call 09801h		;49e9
	call L_5864		;49ec
	call 09881h		;49ef
	call L_583B		;49f2
	ld a,(0e20ch)		;49f5
	rra			;49f8
	ret nc			;49f9
	xor a			;49fa
	ld (0e24ch),a		;49fb
	ld (0e216h),a		;49fe
	call L_58D2		;4a01
	call L_430B		;4a04
L_4A07:
	ld a,(0e20ch)		;4a07
	rra			;4a0a
	rra			;4a0b
	ret nc			;4a0c
	xor a			;4a0d
	ld (0e24eh),a		;4a0e
	ld hl,03b00h		;4a11
	ld a,(0e24fh)		;4a14
	call 00177h		;4a17   ; BIOS NWRVRM - Writes to VRAM like in WRTVRM (with 16-bit VRAM-address)
	jp L_4DCE		;4a1a
L_4A1D:
	xor a			;4a1d
	ld (0e215h),a		;4a1e
	ld (0e255h),a		;4a21
	ld a,(0e254h)		;4a24
	and a			;4a27
	jr nz,L_4A35		;4a28
	ld a,(0e240h)		;4a2a
	or a			;4a2d
	jr z,L_4A35		;4a2e
L_4A30:
	ld a,004h		;4a30
	jp L_47B3		;4a32
L_4A35:
	call L_4226		;4a35
L_4A38:
	ld a,007h		;4a38
	jp L_47B3		;4a3a
L_4A3D:
	ld a,b			;4a3d
	and a			;4a3e
	jr nz,L_4A6F		;4a3f
	call L_4E98		;4a41
	ld hl,05f4ch		;4a44
	call L_51D0		;4a47
	ld a,(0e254h)		;4a4a
	ld b,a			;4a4d
	ld a,(0e217h)		;4a4e
	or b			;4a51
	ld (0e218h),a		;4a52
	ld hl,05f59h		;4a55
	call nz,L_51D0		;4a58
	call L_4C8A		;4a5b
	xor a			;4a5e
	ld (0e247h),a		;4a5f
	ld a,(0e254h)		;4a62
	and a			;4a65
	ld a,078h		;4a66
	jr z,L_4A6C		;4a68
	ld a,0b4h		;4a6a
L_4A6C:
	jp L_4799		;4a6c
L_4A6F:
	ld a,(0e218h)		;4a6f
	and a			;4a72
	call nz,L_4ADB		;4a73
	ld a,(0e203h)		;4a76
	rra			;4a79
	ret c			;4a7a
	ld hl,0e204h		;4a7b
	dec (hl)			;4a7e
	ret nz			;4a7f
	ld a,(0e247h)		;4a80
	and a			;4a83
	jr z,L_4AC3		;4a84
	ld hl,0e226h		;4a86
	xor a			;4a89
	ld (hl),a			;4a8a
	inc l			;4a8b
	ld (hl),a			;4a8c
	inc l			;4a8d
	ld (hl),a			;4a8e
	inc a			;4a8f
	ld (0e240h),a		;4a90
	ld a,(0e254h)		;4a93
	and a			;4a96
	jr z,L_4AC3		;4a97
	ld a,(0f0f8h)		;4a99
	and a			;4a9c
	jr z,L_4ABC		;4a9d
	call 08f0ch		;4a9f
	call L_41E0		;4aa2
	ld hl,0e278h		;4aa5
	ld (hl),045h		;4aa8
	inc hl			;4aaa
	ld (hl),04ch		;4aab
	inc hl			;4aad
	ld (hl),047h		;4aae
	ld a,005h		;4ab0
	ld (0e25bh),a		;4ab2
	ld hl,00a03h		;4ab5
	ld (0e200h),hl		;4ab8
	ret			;4abb
L_4ABC:
	ld hl,00903h		;4abc
	ld (0e200h),hl		;4abf
	ret			;4ac2
L_4AC3:
	ld a,(0e247h)		;4ac3
	and a			;4ac6
	jp nz,L_4A30		;4ac7
L_4ACA:
	xor a			;4aca
	ld (0e217h),a		;4acb
	ld (0e254h),a		;4ace
	ld hl,0e202h		;4ad1
	ld a,(hl)			;4ad4
	and 0bfh		;4ad5
	ld (hl),a			;4ad7
	jp L_47B2		;4ad8
L_4ADB:
	ld a,007h		;4adb
	call 00141h		;4add   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	bit 1,a		;4ae0
	ret nz			;4ae2
	ld a,001h		;4ae3
	ld (0e247h),a		;4ae5
	ld hl,05f59h		;4ae8
	jp L_51D4		;4aeb
L_4AEE:
	xor a			;4aee
	ld (0e24dh),a		;4aef
	call L_5DFE		;4af2
	ld a,(0e24dh)		;4af5
	and a			;4af8
	jr nz,L_4B01		;4af9
	call 0afb4h		;4afb
	call L_5CF5		;4afe
L_4B01:
	ld a,005h		;4b01
	jp L_47B3		;4b03
L_4B06:
	xor a			;4b06
	ld (0e215h),a		;4b07
	call 071deh		;4b0a
	call L_583B		;4b0d
	ld a,(0e257h)		;4b10
	ld b,a			;4b13
	cp 004h		;4b14
	jr nz,L_4B26		;4b16
	ld a,(0e254h)		;4b18
	and a			;4b1b
	jp nz,L_4A38		;4b1c
	ld a,(0e242h)		;4b1f
	cp 03ch		;4b22
	jr nc,L_4B3F		;4b24
L_4B26:
	ld a,b			;4b26
	and a			;4b27
	ret nz			;4b28
	ld a,(0e242h)		;4b29
	call L_4CFD		;4b2c
	and 00fh		;4b2f
	dec a			;4b31
	jp nz,L_4A30		;4b32
	ld a,001h		;4b35
	ld (0e257h),a		;4b37
	ld a,00ah		;4b3a
	jp L_47B3		;4b3c
L_4B3F:
	ld a,001h		;4b3f
	ld (0e257h),a		;4b41
	call L_4E98		;4b44
	ld a,00dh		;4b47
	jp L_47B3		;4b49
L_4B4C:
	call 06f5dh		;4b4c
	ld a,(0e257h)		;4b4f
	and a			;4b52
	ret nz			;4b53
	ld bc,0e201h		;4b54
	call 00047h		;4b57   ; BIOS WRTVDP - Writes data in the VDP-register
	jp L_4A30		;4b5a
L_4B5D:
	call L_57D8		;4b5d
	call 07920h		;4b60
	call L_57FB		;4b63
	ld a,(0e25ah)		;4b66
	and a			;4b69
	ret nz			;4b6a
	jp L_4BEA		;4b6b
L_4B6E:
	djnz L_4B78		;4b6e
	ld hl,0e204h		;4b70
	dec (hl)			;4b73
	ret nz			;4b74
	jp L_479C		;4b75
L_4B78:
	djnz L_4B8F		;4b78
	call L_41B5		;4b7a
	call 0b534h		;4b7d
	call L_418A		;4b80
	ld a,(0ef10h)		;4b83
	or a			;4b86
	ret nz			;4b87
	ld hl,0e240h		;4b88
	inc (hl)			;4b8b
	jp L_4A30		;4b8c
L_4B8F:
	call L_4E98		;4b8f
	ld a,078h		;4b92
	call L_4799		;4b94
	call L_41CC		;4b97
	ld hl,09d37h		;4b9a
	ld a,(0ef10h)		;4b9d
	dec a			;4ba0
	add a,a			;4ba1
	call L_408F		;4ba2
	ld a,(hl)			;4ba5
	inc hl			;4ba6
	ld h,(hl)			;4ba7
	ld l,a			;4ba8
	call L_51D0		;4ba9
	jp L_418A		;4bac
L_4BAF:
	call 0734dh		;4baf
	ld a,(0e257h)		;4bb2
	and a			;4bb5
	ret nz			;4bb6
	jp L_4ACA		;4bb7
L_4BBA:
	ld a,(0e200h)		;4bba
	cp 003h		;4bbd
	ret nc			;4bbf
	call L_543E		;4bc0
	ld hl,0e221h		;4bc3
	call L_5437		;4bc6
	or a			;4bc9
	ret z			;4bca
	ld hl,0e204h		;4bcb
	ld (hl),000h		;4bce
	ld l,(hl)			;4bd0
	ld de,0e222h		;4bd1
	ld b,(hl)			;4bd4
	djnz L_4BEA		;4bd5
	and 030h		;4bd7
	jr z,L_4BFC		;4bd9
	ld a,040h		;4bdb
	ld (0e202h),a		;4bdd
	ld (hl),003h		;4be0
	inc hl			;4be2
	ld c,000h		;4be3
	ld (hl),c			;4be5
	dec c			;4be6
	jp L_4D61		;4be7
L_4BEA:
	ld hl,00001h		;4bea
	ld (0e200h),hl		;4bed
	call L_41E0		;4bf0
	call L_5BEB		;4bf3
	call L_5F8D		;4bf6
	jp L_5FB2		;4bf9
L_4BFC:
	ld a,(de)			;4bfc
	xor 001h		;4bfd
	ld (de),a			;4bff
	ret			;4c00
L_4C01:
	ld hl,0e226h		;4c01
	ld bc,00ddah		;4c04
	ld d,h			;4c07
	ld e,l			;4c08
	inc e			;4c09
	ld (hl),000h		;4c0a
	ldir		;4c0c
	ld hl,04c1ah		;4c0e
	ld de,0e240h		;4c11
	ld bc,00006h		;4c14
	ldir		;4c17
	ret			;4c19

; ----------------------------------------------------------------------
; DATOS resto_4C1A: lo apuntan con el banco puesto p00:4C0E (0x4C1A); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p00:4C0E (6 bytes)
;   0x4c1a..0x4c20  (6 bytes)
DATA_resto_4C1A:
	defb 001h,001h,001h,000h,000h,003h	; 4c1a

; ======================================================================
; CODIGO 0x4c20..0x4deb  (459 bytes)
; ======================================================================


L_4C20:
	ld c,000h		;4c20
	ld a,(0e202h)		;4c22
	add a,a			;4c25
	ret p			;4c26
	ld hl,0e226h		;4c27
	ld a,(hl)			;4c2a
	add a,e			;4c2b
	daa			;4c2c
	ld (hl),a			;4c2d
	inc l			;4c2e
	ld a,(hl)			;4c2f
	adc a,d			;4c30
	daa			;4c31
	ld (hl),a			;4c32
	inc hl			;4c33
	ld a,(hl)			;4c34
	adc a,c			;4c35
	daa			;4c36
	ld (hl),a			;4c37
	jr nc,L_4C47		;4c38
	ld bc,09999h		;4c3a
	ld (0e223h),bc		;4c3d
	ld (0e224h),bc		;4c41
	jr L_4CC0		;4c45
L_4C47:
	ex de,hl			;4c47
	ld hl,0e245h		;4c48
	cp (hl)			;4c4b
	jr c,L_4C6F		;4c4c
	ld a,(hl)			;4c4e
	add a,003h		;4c4f
	daa			;4c51
	jr nc,L_4C56		;4c52
	ld a,0ffh		;4c54
L_4C56:
	ld (hl),a			;4c56
	push de			;4c57
	ld hl,0e240h		;4c58
	ld a,(hl)			;4c5b
	cp 099h		;4c5c
	jr nc,L_4C64		;4c5e
	add a,001h		;4c60
	daa			;4c62
	ld (hl),a			;4c63
L_4C64:
	call L_42AB		;4c64
	ld a,(0f0f4h)		;4c67
	and a			;4c6a
	call nz,L_4D17		;4c6b
	pop de			;4c6e
L_4C6F:
	ex de,hl			;4c6f
	ld b,003h		;4c70
	ld de,0e225h		;4c72
L_4C75:
	ld a,(de)			;4c75
	sub (hl)			;4c76
	jr c,L_4C7F		;4c77
	jr nz,L_4CC0		;4c79
	dec l			;4c7b
	dec e			;4c7c
	djnz L_4C75		;4c7d
L_4C7F:
	ld bc,00003h		;4c7f
	ld e,025h		;4c82
	ld l,028h		;4c84
	lddr		;4c86
	jr L_4CC0		;4c88
L_4C8A:
	ld a,(0f0f4h)		;4c8a
	and a			;4c8d
	ret z			;4c8e
	ld hl,000c0h		;4c8f
	ld c,00ch		;4c92
	ld de,0ff13h		;4c94
	call L_4FC1		;4c97
	ld hl,05ef2h		;4c9a
	call L_51D0		;4c9d
	call L_4CC0		;4ca0
	call L_4D17		;4ca3
	ld a,(0e254h)		;4ca6
	and a			;4ca9
	jr z,L_4CB5		;4caa
	ld hl,0e270h		;4cac
	ld de,090cah		;4caf
	jp 08a1ah		;4cb2
L_4CB5:
	jp L_4CEC		;4cb5
L_4CB8:
	ld de,08848h		;4cb8
	ld hl,08858h		;4cbb
	jr L_4CC6		;4cbe
L_4CC0:
	ld de,018cah		;4cc0
	ld hl,058cah		;4cc3
L_4CC6:
	push hl			;4cc6
	ld hl,0e225h		;4cc7
	call L_4CD2		;4cca
	pop hl			;4ccd
	ex de,hl			;4cce
	ld hl,0e228h		;4ccf
L_4CD2:
	ld b,003h		;4cd2
	jr L_4D26		;4cd4
L_4CD6:
	ld a,(0e254h)		;4cd6
	and a			;4cd9
	jr z,L_4CE7		;4cda
	ld hl,0e270h		;4cdc
	ld de,05068h		;4cdf
	ld b,005h		;4ce2
	jp 08a1ch		;4ce4
L_4CE7:
	ld de,06868h		;4ce7
	jr L_4CEF		;4cea
L_4CEC:
	ld de,0b0cah		;4cec
L_4CEF:
	ld a,(0e242h)		;4cef
	call L_4CFD		;4cf2
	ld hl,0efc0h		;4cf5
	ld (hl),a			;4cf8
	ld b,001h		;4cf9
	jr L_4D26		;4cfb
L_4CFD:
	ld b,000h		;4cfd
L_4CFF:
	ld c,a			;4cff
	sub 00ah		;4d00
	jr c,L_4D07		;4d02
	inc b			;4d04
	jr L_4CFF		;4d05
L_4D07:
	rlc b		;4d07
	rlc b		;4d09
	rlc b		;4d0b
	rlc b		;4d0d
	ld a,b			;4d0f
	or c			;4d10
	ret			;4d11
L_4D12:
	ld de,0a868h		;4d12
	jr L_4D1F		;4d15
L_4D17:
	ld a,(0f0f4h)		;4d17
	and a			;4d1a
	ret z			;4d1b
	ld de,0e0cah		;4d1c
L_4D1F:
	ld hl,0e240h		;4d1f
	ld b,001h		;4d22
	jr L_4D26		;4d24
L_4D26:
	ld a,(0f0f4h)		;4d26
	and a			;4d29
	ex de,hl			;4d2a
	call z,L_4D7B		;4d2b
	ex de,hl			;4d2e
L_4D2F:
	dec b			;4d2f
	jr nz,L_4D34		;4d30
	ld c,0ffh		;4d32
L_4D34:
	inc b			;4d34
	ld a,(hl)			;4d35
	rra			;4d36
	rra			;4d37
	rra			;4d38
	rra			;4d39
	call L_4D45		;4d3a
	ld a,(hl)			;4d3d
	call L_4D45		;4d3e
	dec hl			;4d41
	djnz L_4D2F		;4d42
	ret			;4d44
L_4D45:
	and 00fh		;4d45
	add a,0d0h		;4d47
	jp L_51E8		;4d49
L_4D4C:
	add a,a			;4d4c
	add a,l			;4d4d
	ld l,a			;4d4e
	jr nc,L_4D52		;4d4f
	inc h			;4d51
L_4D52:
	ld a,(hl)			;4d52
	inc hl			;4d53
	ld h,(hl)			;4d54
	ld l,a			;4d55
	ret			;4d56
L_4D57:
	ld hl,0e204h		;4d57
	bit 3,(hl)		;4d5a
	ld c,0ffh		;4d5c
	jr nz,L_4D61		;4d5e
	inc c			;4d60
L_4D61:
	ld hl,0388ch		;4d61
	ld de,0389ch		;4d64
	ld a,(0e222h)		;4d67
	or a			;4d6a
	jr nz,L_4D6E		;4d6b
	ex de,hl			;4d6d
L_4D6E:
	push hl			;4d6e
	call L_4D75		;4d6f
	pop de			;4d72
	ld c,000h		;4d73
L_4D75:
	ld hl,05f68h		;4d75
	jp L_51DA		;4d78
L_4D7B:
	ld a,l			;4d7b
	rra			;4d7c
	rra			;4d7d
	rra			;4d7e
	rra			;4d7f
	rr h		;4d80
	rra			;4d82
	rr h		;4d83
	rra			;4d85
	rr h		;4d86
	ld l,h			;4d88
	and 003h		;4d89
	add a,038h		;4d8b
	ld h,a			;4d8d
	ret			;4d8e
L_4D8F:
	ld hl,03908h		;4d8f
	ld de,0e880h		;4d92
	ld bc,00710h		;4d95
L_4D98:
	push bc			;4d98
	ld b,000h		;4d99
	call L_4DFB		;4d9b
	ld a,010h		;4d9e
	call L_4094		;4da0
	ld a,020h		;4da3
	call L_408F		;4da5
	pop bc			;4da8
	djnz L_4D98		;4da9
	ld hl,03908h		;4dab
	ld bc,00710h		;4dae
L_4DB1:
	push bc			;4db1
	xor a			;4db2
	ld b,a			;4db3
	call L_4E0F		;4db4
	ld a,020h		;4db7
	call L_408F		;4db9
	pop bc			;4dbc
	djnz L_4DB1		;4dbd
	ld hl,05f6bh		;4dbf
	call L_51D0		;4dc2
	call L_4D12		;4dc5
	call L_4CD6		;4dc8
	jp L_4CB8		;4dcb
L_4DCE:
	ld de,03908h		;4dce
	ld hl,0e880h		;4dd1
	ld bc,00710h		;4dd4
L_4DD7:
	push bc			;4dd7
	ld b,000h		;4dd8
	call L_4E05		;4dda
	ld a,010h		;4ddd
	call L_408F		;4ddf
	ld a,020h		;4de2
	call L_4094		;4de4
	pop bc			;4de7
	djnz L_4DD7		;4de8
	ret			;4dea

; ----------------------------------------------------------------------
; DATOS sin identificar  0x4deb..0x4dfb  (16 bytes)
DATA_4DEB:
	defb 07ah,02fh,057h,07bh,02fh,05fh,013h,0c9h,07ch,02fh,067h,07dh,02fh,06fh,023h,0c9h	; 4deb  z/W{/_..|/g}/o#.

; ======================================================================
; CODIGO 0x4dfb..0x4e58  (93 bytes)
; ======================================================================


L_4DFB:
	push hl			;4dfb
	push de			;4dfc
	push bc			;4dfd
	call 00059h		;4dfe   ; BIOS LDIRMV - Block transfers to memory from VRAM
	pop bc			;4e01
	pop de			;4e02
	pop hl			;4e03
	ret			;4e04
L_4E05:
	push hl			;4e05
	push de			;4e06
	push bc			;4e07
	call 0005ch		;4e08   ; BIOS LDIRVM - Block transfers to VRAM from memory
	pop bc			;4e0b
	pop de			;4e0c
	pop hl			;4e0d
	ret			;4e0e
L_4E0F:
	push de			;4e0f
	push af			;4e10
	push bc			;4e11
	call 0016bh		;4e12   ; BIOS BIGFIL - Same function as FILVRM (with 16-bit VRAM-address)
	pop bc			;4e15
	pop af			;4e16
	pop de			;4e17
	ret			;4e18
L_4E19:
	push bc			;4e19
	call 00047h		;4e1a   ; BIOS WRTVDP - Writes data in the VDP-register
	pop bc			;4e1d
	ret			;4e1e
L_4E1F:
	ld c,000h		;4e1f
	ex de,hl			;4e21
	ld e,(hl)			;4e22
	inc hl			;4e23
	ld d,(hl)			;4e24
	inc hl			;4e25
	ex de,hl			;4e26
L_4E27:
	call 00171h		;4e27   ; BIOS NSTWRT - Same function as SETWRT (with 16-bit VRAM-address)
	exx			;4e2a
	ld a,(00007h)		;4e2b
	ld c,a			;4e2e
	exx			;4e2f
L_4E30:
	ld a,(de)			;4e30
	and a			;4e31
	ret z			;4e32
	inc de			;4e33
	ld b,a			;4e34
	and 07fh		;4e35
	cp b			;4e37
	jr z,L_4E49		;4e38
	and a			;4e3a
	jr z,L_4E1F		;4e3b
	ld b,a			;4e3d
L_4E3E:
	call L_4E88		;4e3e
	exx			;4e41
	out (c),a		;4e42
	exx			;4e44
	djnz L_4E3E		;4e45
	jr L_4E30		;4e47
L_4E49:
	call L_4E88		;4e49
L_4E4C:
	exx			;4e4c
	out (c),a		;4e4d
	exx			;4e4f
	djnz L_4E4C		;4e50
	jr L_4E30		;4e52
L_4E54:
	ld c,000h		;4e54
	jr L_4E27		;4e56

; ----------------------------------------------------------------------
; DATOS sin identificar  0x4e58..0x4e60  (8 bytes)
DATA_4E58:
	defb 00eh,001h,018h,0c5h,00eh,001h,018h,0c7h	; 4e58  ........

; ======================================================================
; CODIGO 0x4e60..0x5413  (1459 bytes)
; ======================================================================


L_4E60:
	call L_4E6C		;4e60
	ld a,020h		;4e63
	call L_4094		;4e65
	dec c			;4e68
	jr nz,L_4E60		;4e69
	ret			;4e6b
L_4E6C:
	push de			;4e6c
L_4E6D:
	ld b,010h		;4e6d
L_4E6F:
	call 00174h		;4e6f   ; BIOS NRDVRM - Reads VRAM like in RDVRM (with 16-bit VRAM-address)
	call L_4E8D		;4e72
	ex de,hl			;4e75
	call 00177h		;4e76   ; BIOS NWRVRM - Writes to VRAM like in WRTVRM (with 16-bit VRAM-address)
	ex de,hl			;4e79
	inc e			;4e7a
	inc hl			;4e7b
	djnz L_4E6F		;4e7c
	ld a,e			;4e7e
	sub 020h		;4e7f
	ld e,a			;4e81
	bit 4,e		;4e82
	jr z,L_4E6D		;4e84
	pop de			;4e86
	ret			;4e87
L_4E88:
	ld a,(de)			;4e88
	inc de			;4e89
	bit 0,c		;4e8a
	ret z			;4e8c
L_4E8D:
	push bc			;4e8d
	ld c,a			;4e8e
	ld b,008h		;4e8f
L_4E91:
	rr c		;4e91
	rla			;4e93
	djnz L_4E91		;4e94
	pop bc			;4e96
	ret			;4e97
L_4E98:
	call L_4ECB		;4e98
	call L_4EBE		;4e9b
	ld hl,00000h		;4e9e
	ld bc,00000h		;4ea1
	xor a			;4ea4
	ld d,000h		;4ea5
	call L_4FED		;4ea7
	ld b,000h		;4eaa
	ld c,017h		;4eac
	call 00047h		;4eae   ; BIOS WRTVDP - Writes data in the VDP-register
L_4EB1:
	ld a,(0f3e0h)		;4eb1
	or 040h		;4eb4
	ld b,a			;4eb6
	ld c,001h		;4eb7
	call 00047h		;4eb9   ; BIOS WRTVDP - Writes data in the VDP-register
	jr L_4EE7		;4ebc
L_4EBE:
	ld a,(0f3e0h)		;4ebe
	and 0bfh		;4ec1
	ld b,a			;4ec3
	ld c,001h		;4ec4
	call 00047h		;4ec6   ; BIOS WRTVDP - Writes data in the VDP-register
	jr L_4EDC		;4ec9
L_4ECB:
	ld hl,0f600h		;4ecb
	call L_4ED4		;4ece
	ld hl,0f200h		;4ed1
L_4ED4:
	ld bc,00080h		;4ed4
	ld a,0e0h		;4ed7
	jp L_4E0F		;4ed9
L_4EDC:
	ld a,(0ffe7h)		;4edc
	or 002h		;4edf
	ld b,a			;4ee1
	ld c,008h		;4ee2
	jp 00047h		;4ee4   ; BIOS WRTVDP - Writes data in the VDP-register
L_4EE7:
	ld a,(0ffe7h)		;4ee7
	and 0fdh		;4eea
	ld b,a			;4eec
	ld c,008h		;4eed
	jp 00047h		;4eef   ; BIOS WRTVDP - Writes data in the VDP-register
L_4EF2:
	push bc			;4ef2
	push hl			;4ef3
	ld b,a			;4ef4
	ld a,(00007h)		;4ef5
	inc a			;4ef8
	ld c,a			;4ef9
	di			;4efa
	out (c),b		;4efb
	ld a,090h		;4efd
	out (c),a		;4eff
	inc c			;4f01
	out (c),d		;4f02
	push af			;4f04
	pop af			;4f05
	out (c),e		;4f06
	dec c			;4f08
	ld hl,0f680h		;4f09
	ld a,b			;4f0c
	add a,a			;4f0d
	add a,l			;4f0e
	ld l,a			;4f0f
	call 00171h		;4f10   ; BIOS NSTWRT - Same function as SETWRT (with 16-bit VRAM-address)
	dec c			;4f13
	out (c),d		;4f14
	out (c),e		;4f16
	pop hl			;4f18
	pop bc			;4f19
	ei			;4f1a
	ret			;4f1b
L_4F1C:
	ld a,(hl)			;4f1c
	inc hl			;4f1d
	inc a			;4f1e
	ret z			;4f1f
	dec a			;4f20
	ld d,(hl)			;4f21
	inc hl			;4f22
	ld e,(hl)			;4f23
	inc hl			;4f24
	call L_4EF2		;4f25
	jr L_4F1C		;4f28
L_4F2A:
	ld a,002h		;4f2a
	call L_4F34		;4f2c
	rra			;4f2f
	jp c,L_4F2A		;4f30
	ret			;4f33
L_4F34:
	push bc			;4f34
	push hl			;4f35
	ld hl,(00006h)		;4f36
	inc h			;4f39
	inc l			;4f3a
	ld c,h			;4f3b
	di			;4f3c
	out (c),a		;4f3d
	ld a,08fh		;4f3f
	out (c),a		;4f41
	ld c,l			;4f43
	in a,(c)		;4f44
	push af			;4f46
	xor a			;4f47
	ld c,h			;4f48
	out (c),a		;4f49
	ld a,08fh		;4f4b
	out (c),a		;4f4d
	pop af			;4f4f
	pop hl			;4f50
	pop bc			;4f51
	ei			;4f52
	ret			;4f53
L_4F54:
	call L_4F2A		;4f54
	push bc			;4f57
	ld a,(00007h)		;4f58
	inc a			;4f5b
	ld c,a			;4f5c
	ld a,024h		;4f5d
	di			;4f5f
	out (c),a		;4f60
	ld a,091h		;4f62
	out (c),a		;4f64
	inc c			;4f66
	inc c			;4f67
	out (c),h		;4f68
	xor a			;4f6a
	out (c),a		;4f6b
	out (c),l		;4f6d
	out (c),a		;4f6f
	pop hl			;4f71
	out (c),h		;4f72
	xor a			;4f74
	cp h			;4f75
	jr nz,L_4F79		;4f76
	inc a			;4f78
L_4F79:
	out (c),a		;4f79
	xor a			;4f7b
	out (c),a		;4f7c
	out (c),a		;4f7e
	out (c),l		;4f80
	out (c),a		;4f82
	ld a,070h		;4f84
	out (c),a		;4f86
	ei			;4f88
	ret			;4f89
L_4F8A:
	call L_4F2A		;4f8a
	push bc			;4f8d
	ld a,(00007h)		;4f8e
	inc a			;4f91
	ld c,a			;4f92
	ld a,024h		;4f93
	di			;4f95
	out (c),a		;4f96
	ld a,091h		;4f98
	out (c),a		;4f9a
	inc c			;4f9c
	inc c			;4f9d
	out (c),h		;4f9e
	xor a			;4fa0
	out (c),a		;4fa1
	out (c),l		;4fa3
	out (c),a		;4fa5
	pop hl			;4fa7
	out (c),h		;4fa8
	xor a			;4faa
	cp h			;4fab
	jr nz,L_4FAF		;4fac
	inc a			;4fae
L_4FAF:
	out (c),a		;4faf
	xor a			;4fb1
	out (c),a		;4fb2
	out (c),a		;4fb4
	out (c),l		;4fb6
	inc a			;4fb8
	out (c),a		;4fb9
	ld a,070h		;4fbb
	out (c),a		;4fbd
	ei			;4fbf
	ret			;4fc0
L_4FC1:
	ld b,e			;4fc1
	call L_4FD9		;4fc2
	ld b,d			;4fc5
	call L_4FE3		;4fc6
	push hl			;4fc9
	ld a,l			;4fca
	add a,e			;4fcb
	ld l,a			;4fcc
	ld b,d			;4fcd
	call L_4FE3		;4fce
	pop hl			;4fd1
	ld a,h			;4fd2
	add a,d			;4fd3
	ld h,a			;4fd4
	ld b,e			;4fd5
	jp L_4FD9		;4fd6
L_4FD9:
	push hl			;4fd9
	push de			;4fda
	push bc			;4fdb
	call L_4F8A		;4fdc
	pop bc			;4fdf
	pop de			;4fe0
	pop hl			;4fe1
	ret			;4fe2
L_4FE3:
	push hl			;4fe3
	push de			;4fe4
	push bc			;4fe5
	call L_4F54		;4fe6
	pop bc			;4fe9
	pop de			;4fea
	pop hl			;4feb
	ret			;4fec
L_4FED:
	ex af,af'			;4fed
	call L_4F2A		;4fee
	push bc			;4ff1
	ld a,(00007h)		;4ff2
	inc a			;4ff5
	ld c,a			;4ff6
	ld a,024h		;4ff7
	di			;4ff9
	out (c),a		;4ffa
	ld a,091h		;4ffc
	out (c),a		;4ffe
	inc c			;5000
	inc c			;5001
	out (c),h		;5002
	xor a			;5004
	out (c),a		;5005
	out (c),l		;5007
	out (c),d		;5009
	pop hl			;500b
	out (c),h		;500c
	cp h			;500e
	jr nz,L_5012		;500f
	inc a			;5011
L_5012:
	out (c),a		;5012
	xor a			;5014
	out (c),l		;5015
	cp l			;5017
	jr nz,L_501B		;5018
	inc a			;501a
L_501B:
	out (c),a		;501b
	ex af,af'			;501d
	out (c),a		;501e
	xor a			;5020
	out (c),a		;5021
	ld a,0c0h		;5023
	out (c),a		;5025
	ei			;5027
	ret			;5028
L_5029:
	ex af,af'			;5029
	call L_4F2A		;502a
	push bc			;502d
	ld a,(00007h)		;502e
	inc a			;5031
	ld c,a			;5032
	ld a,020h		;5033
	di			;5035
	out (c),a		;5036
	ld a,091h		;5038
	out (c),a		;503a
	inc c			;503c
	inc c			;503d
	out (c),h		;503e
	xor a			;5040
	out (c),a		;5041
	out (c),l		;5043
	ex af,af'			;5045
	ld l,a			;5046
	and 003h		;5047
	out (c),a		;5049
	out (c),d		;504b
	xor a			;504d
	out (c),a		;504e
	out (c),e		;5050
	ld a,l			;5052
	rra			;5053
	rra			;5054
	and 003h		;5055
	out (c),a		;5057
	pop hl			;5059
	out (c),h		;505a
	xor a			;505c
	out (c),a		;505d
	out (c),l		;505f
	out (c),a		;5061
	out (c),a		;5063
	out (c),a		;5065
	ld a,0d0h		;5067
	out (c),a		;5069
	ei			;506b
	ret			;506c
L_506D:
	ex af,af'			;506d
	call L_4F2A		;506e
	push bc			;5071
	ld a,(00007h)		;5072
	inc a			;5075
	ld c,a			;5076
	ld a,024h		;5077
	di			;5079
	out (c),a		;507a
	ld a,091h		;507c
	out (c),a		;507e
	inc c			;5080
	inc c			;5081
	out (c),d		;5082
	xor a			;5084
	out (c),a		;5085
	out (c),e		;5087
	ex af,af'			;5089
	out (c),a		;508a
	pop de			;508c
	out (c),d		;508d
	xor a			;508f
	out (c),a		;5090
	out (c),e		;5092
	out (c),a		;5094
	ld a,(hl)			;5096
	inc hl			;5097
	out (c),a		;5098
	xor a			;509a
	out (c),a		;509b
	ld a,0f0h		;509d
	out (c),a		;509f
	dec c			;50a1
	dec c			;50a2
	ld a,0ach		;50a3
	out (c),a		;50a5
	ld a,091h		;50a7
	out (c),a		;50a9
	inc c			;50ab
	inc c			;50ac
L_50AD:
	ld a,002h		;50ad
	call L_4F34		;50af
	rra			;50b2
	ret nc			;50b3
	add a,a			;50b4
	add a,a			;50b5
	jr nc,L_50AD		;50b6
	ld a,(hl)			;50b8
	inc hl			;50b9
	out (c),a		;50ba
	jr L_50AD		;50bc
L_50BE:
	ex af,af'			;50be
	call L_4F2A		;50bf
	ld a,(00007h)		;50c2
	inc a			;50c5
	ld c,a			;50c6
	ld a,022h		;50c7
	di			;50c9
	out (c),a		;50ca
	ld a,091h		;50cc
	out (c),a		;50ce
	inc c			;50d0
	inc c			;50d1
	out (c),l		;50d2
	ex af,af'			;50d4
	ld l,a			;50d5
	and 003h		;50d6
	out (c),a		;50d8
	out (c),h		;50da
	xor a			;50dc
	out (c),a		;50dd
	out (c),e		;50df
	ld a,l			;50e1
	rra			;50e2
	rra			;50e3
	and 003h		;50e4
	out (c),a		;50e6
	xor a			;50e8
	out (c),a		;50e9
	out (c),a		;50eb
	out (c),d		;50ed
	cp d			;50ef
	jr nz,L_50F3		;50f0
	inc a			;50f2
L_50F3:
	out (c),a		;50f3
	xor a			;50f5
	out (c),a		;50f6
	out (c),a		;50f8
	ld a,0e0h		;50fa
	out (c),a		;50fc
	ei			;50fe
	ret			;50ff
L_5100:
	ex af,af'			;5100
	call L_4F2A		;5101
	push bc			;5104
	ld a,(00007h)		;5105
	inc a			;5108
	ld c,a			;5109
	ld a,020h		;510a
	di			;510c
	out (c),a		;510d
	ld a,091h		;510f
	out (c),a		;5111
	inc c			;5113
	inc c			;5114
	out (c),h		;5115
	xor a			;5117
	out (c),a		;5118
	out (c),l		;511a
	ex af,af'			;511c
	rlca			;511d
	rlca			;511e
	ld l,a			;511f
	and 003h		;5120
	out (c),a		;5122
	out (c),d		;5124
	xor a			;5126
	out (c),a		;5127
	out (c),e		;5129
	ld a,l			;512b
	ld e,a			;512c
	rlca			;512d
	rlca			;512e
	and 003h		;512f
	out (c),a		;5131
	pop hl			;5133
	out (c),h		;5134
	xor a			;5136
	out (c),a		;5137
	out (c),l		;5139
	out (c),a		;513b
	out (c),a		;513d
	out (c),a		;513f
	ld a,e			;5141
	rra			;5142
	rra			;5143
	and 00fh		;5144
	or 090h		;5146
	out (c),a		;5148
	ei			;514a
	ret			;514b
L_514C:
	call L_5181		;514c
	call L_524B		;514f
	djnz L_514C		;5152
	ret			;5154
L_5155:
	ld b,008h		;5155
	ld de,0ef80h		;5157
L_515A:
	push bc			;515a
	push hl			;515b
	ex de,hl			;515c
	ld a,(de)			;515d
	ld d,a			;515e
	ld b,004h		;515f
L_5161:
	ld a,c			;5161
	rl d		;5162
	jr c,L_516A		;5164
	rrca			;5166
	rrca			;5167
	rrca			;5168
	rrca			;5169
L_516A:
	rld		;516a
	ld a,c			;516c
	rl d		;516d
	jr c,L_5175		;516f
	rrca			;5171
	rrca			;5172
	rrca			;5173
	rrca			;5174
L_5175:
	rld		;5175
	inc hl			;5177
	djnz L_5161		;5178
	ex de,hl			;517a
	pop hl			;517b
	inc hl			;517c
	pop bc			;517d
	djnz L_515A		;517e
	ret			;5180
L_5181:
	push bc			;5181
	push de			;5182
	push hl			;5183
	push de			;5184
	call L_5155		;5185
	pop de			;5188
	ld b,d			;5189
	ld d,e			;518a
	ld e,b			;518b
	srl d		;518c
	rr e		;518e
	ld a,d			;5190
	add a,080h		;5191
	ld d,a			;5193
	ld hl,0ef80h		;5194
	call L_51A2		;5197
	pop hl			;519a
	ld bc,00008h		;519b
	add hl,bc			;519e
	pop de			;519f
	pop bc			;51a0
	ret			;51a1
L_51A2:
	push de			;51a2
	ld b,008h		;51a3
L_51A5:
	push bc			;51a5
	ld bc,00004h		;51a6
	call L_4E05		;51a9
	ld bc,00004h		;51ac
	add hl,bc			;51af
	ex de,hl			;51b0
	ld bc,00080h		;51b1
	add hl,bc			;51b4
	ex de,hl			;51b5
	pop bc			;51b6
	djnz L_51A5		;51b7
	pop de			;51b9
	ret			;51ba
L_51BB:
	push bc			;51bb
	call L_51A2		;51bc
	ld a,004h		;51bf
	add a,e			;51c1
	cp 080h		;51c2
	jr nz,L_51CB		;51c4
	ld a,004h		;51c6
	add a,d			;51c8
	ld d,a			;51c9
	xor a			;51ca
L_51CB:
	ld e,a			;51cb
	pop bc			;51cc
	djnz L_51BB		;51cd
	ret			;51cf
L_51D0:
	ld c,0ffh		;51d0
	jr L_51D6		;51d2
L_51D4:
	ld c,000h		;51d4
L_51D6:
	ld d,(hl)			;51d6
	inc hl			;51d7
	ld e,(hl)			;51d8
	inc hl			;51d9
L_51DA:
	ld a,(hl)			;51da
	inc hl			;51db
	ld b,a			;51dc
	inc b			;51dd
	ret z			;51de
	inc b			;51df
	jr z,L_51D6		;51e0
	and c			;51e2
	call L_51E8		;51e3
	jr L_51DA		;51e6
L_51E8:
	call L_5207		;51e8
	ld a,d			;51eb
	add a,008h		;51ec
	ld d,a			;51ee
	ret			;51ef
L_51F0:
	ld a,d			;51f0
	sub 020h		;51f1
	ld d,a			;51f3
	ld a,e			;51f4
	add a,008h		;51f5
	ld e,a			;51f7
	jr L_51FA		;51f8
L_51FA:
	ld a,(hl)			;51fa
	inc hl			;51fb
	ld b,a			;51fc
	inc b			;51fd
	ret z			;51fe
	inc b			;51ff
	jr z,L_51F0		;5200
	call L_51E8		;5202
	jr L_51FA		;5205
L_5207:
	push bc			;5207
	push hl			;5208
	push de			;5209
	call L_523D		;520a
	ld bc,00808h		;520d
	ld a,001h		;5210
	call L_5029		;5212
	pop de			;5215
	pop hl			;5216
	pop bc			;5217
	ret			;5218
L_5219:
	push bc			;5219
	push hl			;521a
	push de			;521b
	call L_523D		;521c
	ld bc,00808h		;521f
	ld a,048h		;5222
	call L_5100		;5224
	pop de			;5227
	pop hl			;5228
	pop bc			;5229
	ret			;522a
L_522B:
	push bc			;522b
	push hl			;522c
	push de			;522d
	call L_523D		;522e
	ld bc,00808h		;5231
	ld a,058h		;5234
	call L_5100		;5236
	pop de			;5239
	pop hl			;523a
	pop bc			;523b
	ret			;523c
L_523D:
	ld b,a			;523d
	and 01fh		;523e
	add a,a			;5240
	add a,a			;5241
	add a,a			;5242
	ld h,a			;5243
	ld a,b			;5244
	and 0e0h		;5245
	rrca			;5247
	rrca			;5248
	ld l,a			;5249
	ret			;524a
L_524B:
	ld a,d			;524b
	add a,008h		;524c
	ld d,a			;524e
	ret nz			;524f
	ld a,e			;5250
	add a,008h		;5251
	ld e,a			;5253
	ret			;5254
L_5255:
	push bc			;5255
	push de			;5256
	exx			;5257
	ld hl,0e800h		;5258
	exx			;525b
L_525C:
	push bc			;525c
	call L_5281		;525d
	pop bc			;5260
	djnz L_525C		;5261
	pop de			;5263
	pop bc			;5264
	ld hl,0e800h		;5265
	jp L_51BB		;5268
L_526B:
	push bc			;526b
	push de			;526c
	exx			;526d
	ld hl,0e800h		;526e
	exx			;5271
L_5272:
	push bc			;5272
	call L_5281		;5273
	pop bc			;5276
	djnz L_5272		;5277
	pop de			;5279
	pop bc			;527a
	ld hl,0e800h		;527b
	jp L_539E		;527e
L_5281:
	ld b,008h		;5281
L_5283:
	ld e,(hl)			;5283
	inc hl			;5284
	push bc			;5285
	call L_528D		;5286
	pop bc			;5289
	djnz L_5283		;528a
	ret			;528c
L_528D:
	ld b,004h		;528d
L_528F:
	xor a			;528f
	rl e		;5290
	rla			;5292
	exx			;5293
	ld e,a			;5294
	ld d,0e7h		;5295
	ld a,(de)			;5297
	add a,a			;5298
	add a,a			;5299
	add a,a			;529a
	add a,a			;529b
	ld c,a			;529c
	exx			;529d
	xor a			;529e
	rl e		;529f
	rla			;52a1
	exx			;52a2
	ld e,a			;52a3
	ld d,0e7h		;52a4
	ld a,(de)			;52a6
	or c			;52a7
	ld (hl),a			;52a8
	inc hl			;52a9
	exx			;52aa
	djnz L_528F		;52ab
	ret			;52ad
L_52AE:
	push bc			;52ae
	push de			;52af
	exx			;52b0
	ld hl,0e800h		;52b1
	exx			;52b4
L_52B5:
	push bc			;52b5
	call L_52DA		;52b6
	pop bc			;52b9
	djnz L_52B5		;52ba
	pop de			;52bc
	pop bc			;52bd
	ld hl,0e800h		;52be
	jp L_51BB		;52c1
L_52C4:
	push bc			;52c4
	push de			;52c5
	exx			;52c6
	ld hl,0e800h		;52c7
	exx			;52ca
L_52CB:
	push bc			;52cb
	call L_52DA		;52cc
	pop bc			;52cf
	djnz L_52CB		;52d0
	pop de			;52d2
	pop bc			;52d3
	ld hl,0e800h		;52d4
	jp L_539E		;52d7
L_52DA:
	ld b,008h		;52da
L_52DC:
	push bc			;52dc
	call L_52E4		;52dd
	pop bc			;52e0
	djnz L_52DC		;52e1
	ret			;52e3
L_52E4:
	ld b,004h		;52e4
	ld e,(hl)			;52e6
	inc hl			;52e7
	ld d,(hl)			;52e8
	inc hl			;52e9
L_52EA:
	xor a			;52ea
	rl d		;52eb
	rla			;52ed
	rl e		;52ee
	rla			;52f0
	exx			;52f1
	ld e,a			;52f2
	ld d,0e7h		;52f3
	ld a,(de)			;52f5
	add a,a			;52f6
	add a,a			;52f7
	add a,a			;52f8
	add a,a			;52f9
	ld c,a			;52fa
	exx			;52fb
	xor a			;52fc
	rl d		;52fd
	rla			;52ff
	rl e		;5300
	rla			;5302
	exx			;5303
	ld e,a			;5304
	ld d,0e7h		;5305
	ld a,(de)			;5307
	or c			;5308
	ld (hl),a			;5309
	inc hl			;530a
	exx			;530b
	djnz L_52EA		;530c
	ret			;530e
L_530F:
	push bc			;530f
	push de			;5310
	exx			;5311
	ld hl,0e800h		;5312
	exx			;5315
L_5316:
	push bc			;5316
	call L_533B		;5317
	pop bc			;531a
	djnz L_5316		;531b
	pop de			;531d
	pop bc			;531e
	ld hl,0e800h		;531f
	jp L_51BB		;5322
L_5325:
	push bc			;5325
	push de			;5326
	exx			;5327
	ld hl,0e800h		;5328
	exx			;532b
L_532C:
	push bc			;532c
	call L_533B		;532d
	pop bc			;5330
	djnz L_532C		;5331
	pop de			;5333
	pop bc			;5334
	ld hl,0e800h		;5335
	jp L_539E		;5338
L_533B:
	ld b,008h		;533b
L_533D:
	push bc			;533d
	call L_5345		;533e
	pop bc			;5341
	djnz L_533D		;5342
	ret			;5344
L_5345:
	ld b,004h		;5345
	ld e,(hl)			;5347
	inc hl			;5348
	ld d,(hl)			;5349
	inc hl			;534a
	ld c,(hl)			;534b
	inc hl			;534c
L_534D:
	xor a			;534d
	rl c		;534e
	rla			;5350
	rl d		;5351
	rla			;5353
	rl e		;5354
	rla			;5356
	exx			;5357
	ld e,a			;5358
	ld d,0e7h		;5359
	ld a,(de)			;535b
	add a,a			;535c
	add a,a			;535d
	add a,a			;535e
	add a,a			;535f
	ld c,a			;5360
	exx			;5361
	xor a			;5362
	rl c		;5363
	rla			;5365
	rl d		;5366
	rla			;5368
	rl e		;5369
	rla			;536b
	exx			;536c
	ld e,a			;536d
	ld d,0e7h		;536e
	ld a,(de)			;5370
	or c			;5371
	ld (hl),a			;5372
	inc hl			;5373
	exx			;5374
	djnz L_534D		;5375
	ret			;5377
L_5378:
	push de			;5378
	ld a,(00007h)		;5379
	ld c,a			;537c
	ld b,008h		;537d
L_537F:
	push bc			;537f
	ex de,hl			;5380
	call 00171h		;5381   ; BIOS NSTWRT - Same function as SETWRT (with 16-bit VRAM-address)
	ex de,hl			;5384
	ld b,004h		;5385
L_5387:
	ld a,(hl)			;5387
	dec hl			;5388
	rrca			;5389
	rrca			;538a
	rrca			;538b
	rrca			;538c
	out (c),a		;538d
	djnz L_5387		;538f
	ld c,008h		;5391
	add hl,bc			;5393
	ex de,hl			;5394
	ld c,080h		;5395
	add hl,bc			;5397
	ex de,hl			;5398
	pop bc			;5399
	djnz L_537F		;539a
	pop de			;539c
	ret			;539d
L_539E:
	inc hl			;539e
	inc hl			;539f
	inc hl			;53a0
L_53A1:
	push bc			;53a1
	call L_5378		;53a2
	ld a,004h		;53a5
	add a,e			;53a7
	cp 080h		;53a8
	jr nz,L_53B1		;53aa
	ld a,004h		;53ac
	add a,d			;53ae
	ld d,a			;53af
	xor a			;53b0
L_53B1:
	ld e,a			;53b1
	pop bc			;53b2
	djnz L_53A1		;53b3
	ret			;53b5
L_53B6:
	ld a,004h		;53b6
	ld (07000h),a		;53b8
	inc a			;53bb
	ld (09000h),a		;53bc
	inc a			;53bf
	ld (0b000h),a		;53c0
	call 06000h		;53c3
	ld a,(0f0f1h)		;53c6
	ld (07000h),a		;53c9
	ld a,(0f0f2h)		;53cc
	ld (09000h),a		;53cf
	ld a,(0f0f3h)		;53d2
	ld (0b000h),a		;53d5
	call 06eeah		;53d8
	ld a,005h		;53db
	call 0005fh		;53dd   ; BIOS CHGMOD - Switches to given screen mode
	ld a,00fh		;53e0
	ld (0f3ebh),a		;53e2
	call 00062h		;53e5   ; BIOS CHGCLR - Changes the screen colors
	xor a			;53e8
	ld h,a			;53e9
	ld l,a			;53ea
	ld b,a			;53eb
	ld c,a			;53ec
	ld d,a			;53ed
	call L_4FED		;53ee
	xor a			;53f1
	ld h,a			;53f2
	ld l,a			;53f3
	ld b,a			;53f4
	ld c,a			;53f5
	ld d,001h		;53f6
	call L_4FED		;53f8
	call L_4F2A		;53fb
	ld b,004h		;53fe
	ld hl,05413h		;5400
L_5403:
	push bc			;5403
	ld c,(hl)			;5404
	inc hl			;5405
	ld b,(hl)			;5406
	inc hl			;5407
	push hl			;5408
	call 00047h		;5409   ; BIOS WRTVDP - Writes data in the VDP-register
	pop hl			;540c
	pop bc			;540d
	djnz L_5403		;540e
	jp L_4EDC		;5410

; ----------------------------------------------------------------------
; DATOS resto_5413: lo apuntan con el banco puesto p00:5400 (0x5413); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p00:5400 (8 bytes)
;   0x5413..0x541b  (8 bytes)
DATA_resto_5413:
	defb 001h,062h,005h,0efh,006h,01fh,00bh,001h	; 5413  .b......

; ======================================================================
; CODIGO 0x541b..0x5aa4  (1673 bytes)
; ======================================================================


L_541B:
	ret			;541b
L_541C:
	call L_543E		;541c
	call L_5434		;541f
	call L_5479		;5422
	ld hl,0e20dh		;5425
	call L_5437		;5428
	ld a,(0e200h)		;542b
	cp 00bh		;542e
	jp z,086ddh		;5430
	ret			;5433
L_5434:
	ld hl,0e208h		;5434
L_5437:
	ld c,(hl)			;5437
	ld (hl),a			;5438
	xor c			;5439
	and (hl)			;543a
	dec hl			;543b
	ld (hl),a			;543c
	ret			;543d
L_543E:
	ld e,08fh		;543e
	ld a,00fh		;5440
	call 00093h		;5442   ; BIOS WRTPSG - Writes data to PSG-register
	ld a,00eh		;5445
	di			;5447
	call 00096h		;5448   ; BIOS RDPSG - Reads value from PSG-register
	ei			;544b
	cpl			;544c
	and 03fh		;544d
	push af			;544f
	ld a,004h		;5450
	call 00141h		;5452   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;5455
	rlca			;5456
	rlca			;5457
	rlca			;5458
	and 020h		;5459
	ld e,a			;545b
	ld a,008h		;545c
	call 00141h		;545e   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;5461
	rrca			;5462
	rrca			;5463
	ld b,a			;5464
	and 004h		;5465
	or e			;5467
	ld c,a			;5468
	ld a,b			;5469
	rrca			;546a
	rrca			;546b
	ld b,a			;546c
	and 018h		;546d
	or c			;546f
	ld c,a			;5470
	ld a,b			;5471
	rrca			;5472
	and 003h		;5473
	or c			;5475
	pop bc			;5476
	or b			;5477
	ret			;5478
L_5479:
	ld a,006h		;5479
	call 00141h		;547b   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;547e
	and 0e0h		;547f
	ld e,a			;5481
	ld a,007h		;5482
	call 00141h		;5484   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;5487
	ld b,a			;5488
	and 003h		;5489
	or e			;548b
	rlca			;548c
	rlca			;548d
	rlca			;548e
	and 01fh		;548f
	ld e,a			;5491
	ld a,b			;5492
	and 080h		;5493
	or e			;5495
	ld e,a			;5496
	ld a,b			;5497
	rlca			;5498
	rlca			;5499
	rlca			;549a
	rlca			;549b
	and 040h		;549c
	or e			;549e
	ret			;549f
L_54A0:
	ld a,(hl)			;54a0
	inc a			;54a1
	ret z			;54a2
	push de			;54a3
	ld a,(hl)			;54a4
	ld c,a			;54a5
	ex de,hl			;54a6
	and 0f8h		;54a7
	rrca			;54a9
	rrca			;54aa
	rrca			;54ab
	call L_4D4C		;54ac
	push de			;54af
	push bc			;54b0
	ld a,c			;54b1
	and 006h		;54b2
	add a,a			;54b4
	jr nz,L_54B9		;54b5
	ld a,002h		;54b7
L_54B9:
	ld c,a			;54b9
	ld b,000h		;54ba
	ld de,0e700h		;54bc
	ldir		;54bf
	pop bc			;54c1
	pop hl			;54c2
	inc hl			;54c3
	push hl			;54c4
	ld a,(hl)			;54c5
	ld b,a			;54c6
	and 0e0h		;54c7
	ld h,000h		;54c9
	ld l,a			;54cb
	add hl,hl			;54cc
	add hl,hl			;54cd
	add hl,hl			;54ce
	add hl,hl			;54cf
	add hl,hl			;54d0
	ld de,08000h		;54d1
	add hl,de			;54d4
	ld a,b			;54d5
	and 01fh		;54d6
	add a,a			;54d8
	add a,a			;54d9
	call L_408F		;54da
	ex de,hl			;54dd
	pop hl			;54de
	inc hl			;54df
	ld b,(hl)			;54e0
	inc hl			;54e1
	ld a,(hl)			;54e2
	inc hl			;54e3
	push hl			;54e4
	ld h,(hl)			;54e5
	ld l,a			;54e6
	call L_54EF		;54e7
	pop hl			;54ea
	pop de			;54eb
	inc hl			;54ec
	jr L_54A0		;54ed
L_54EF:
	ld a,c			;54ef
	and 007h		;54f0
	jp z,L_5255		;54f2
	dec a			;54f5
	jp z,L_526B		;54f6
	dec a			;54f9
	jp z,L_52AE		;54fa
	dec a			;54fd
	jp z,L_52C4		;54fe
	dec a			;5501
	jp z,L_530F		;5502
	jp L_5325		;5505
L_5508:
	ld a,(ix+000h)		;5508
	and a			;550b
	ret z			;550c
	ld l,a			;550d
	ld h,000h		;550e
	add hl,hl			;5510
	add hl,hl			;5511
	add hl,hl			;5512
	add hl,hl			;5513
	add hl,hl			;5514
	ld c,l			;5515
	ld b,h			;5516
	ld l,(ix+001h)		;5517
	ld h,000h		;551a
	add hl,hl			;551c
	add hl,hl			;551d
	add hl,hl			;551e
	ld de,0f800h		;551f
	ld a,(0f0f4h)		;5522
	and a			;5525
	jr nz,L_552B		;5526
	ld de,01800h		;5528
L_552B:
	add hl,de			;552b
	ex de,hl			;552c
	ld l,(ix+002h)		;552d
	ld h,(ix+003h)		;5530
	call L_4E05		;5533
	ld de,00004h		;5536
	add ix,de		;5539
	jr L_5508		;553b
L_553D:
	ld a,(ix+000h)		;553d
	dec a			;5540
	ret m			;5541
	push af			;5542
	ld a,(0f0f4h)		;5543
	and a			;5546
	ld bc,0f800h		;5547
	jr nz,L_554F		;554a
	ld bc,01800h		;554c
L_554F:
	pop af			;554f
	push af			;5550
	push bc			;5551
	call z,L_5561		;5552
	pop bc			;5555
	pop af			;5556
	call nz,L_55CD		;5557
	ld bc,00004h		;555a
	add ix,bc		;555d
	jr L_553D		;555f
L_5561:
	ld a,(ix+001h)		;5561
	or a			;5564
	ret z			;5565
	ld (0efd0h),a		;5566
	ld l,(ix+002h)		;5569
	ld h,000h		;556c
	add hl,hl			;556e
	add hl,hl			;556f
	add hl,hl			;5570
	add hl,bc			;5571
	ld (0efd2h),hl		;5572
	ld l,(ix+003h)		;5575
	ld h,000h		;5578
	add hl,hl			;557a
	add hl,hl			;557b
	add hl,hl			;557c
	add hl,bc			;557d
	ld (0efd4h),hl		;557e
L_5581:
	ld hl,(0efd2h)		;5581
	ld de,0ef80h		;5584
	ld bc,00020h		;5587
	call L_4DFB		;558a
	call L_55B5		;558d
	ld de,(0efd4h)		;5590
	ld hl,0efa0h		;5594
	ld bc,00020h		;5597
	call L_4E05		;559a
	ld bc,00020h		;559d
	ld hl,(0efd2h)		;55a0
	add hl,bc			;55a3
	ld (0efd2h),hl		;55a4
	ld hl,(0efd4h)		;55a7
	add hl,bc			;55aa
	ld (0efd4h),hl		;55ab
	ld hl,0efd0h		;55ae
	dec (hl)			;55b1
	jr nz,L_5581		;55b2
	ret			;55b4
L_55B5:
	ld hl,0ef80h		;55b5
	ld de,0efafh		;55b8
	call L_55C4		;55bb
	ld hl,0ef90h		;55be
	ld de,0efbfh		;55c1
L_55C4:
	ld b,010h		;55c4
L_55C6:
	ld a,(hl)			;55c6
	ld (de),a			;55c7
	inc hl			;55c8
	dec de			;55c9
	djnz L_55C6		;55ca
	ret			;55cc
L_55CD:
	ld a,(ix+001h)		;55cd
	or a			;55d0
	ret z			;55d1
	ld l,(ix+003h)		;55d2
	ld h,000h		;55d5
	add hl,hl			;55d7
	add hl,hl			;55d8
	add hl,hl			;55d9
	add hl,bc			;55da
	ld a,010h		;55db
	call L_408F		;55dd
	ex de,hl			;55e0
	ld l,(ix+002h)		;55e1
	ld h,000h		;55e4
	add hl,hl			;55e6
	add hl,hl			;55e7
	add hl,hl			;55e8
	add hl,bc			;55e9
	ld c,(ix+001h)		;55ea
	jp L_4E60		;55ed
L_55F0:
	call L_599D		;55f0
	call L_41CC		;55f3
	ld de,0b116h		;55f6
	ld hl,0b120h		;55f9
	call L_54A0		;55fc
	ld hl,0bb05h		;55ff
	ld de,0f800h		;5602
	ld bc,00100h		;5605
	call L_4E05		;5608
	ld hl,0a7ceh		;560b
	call L_4F1C		;560e
	call L_418A		;5611
	xor a			;5614
	call L_59DC		;5615
	ld hl,01050h		;5618
	ld bc,0a838h		;561b
	ld a,0ffh		;561e
	ld d,001h		;5620
	call L_4FED		;5622
	call L_41CC		;5625
	ld hl,0b8dbh		;5628
	ld de,01050h		;562b
	call L_576D		;562e
	jp L_418A		;5631
L_5634:
	call L_41AB		;5634
	call L_5640		;5637
	call L_5655		;563a
	jp L_418A		;563d
L_5640:
	ld a,(0e241h)		;5640
	ld b,a			;5643
	ld hl,06065h		;5644
	call L_4D4C		;5647
	ex de,hl			;564a
	ld a,b			;564b
	ld hl,06177h		;564c
	call L_4D4C		;564f
	jp L_54A0		;5652
L_5655:
	ld hl,0602ah		;5655
	ld de,06000h		;5658
	jp L_54A0		;565b
L_565E:
	call L_41CC		;565e
	ld a,(0e242h)		;5661
	dec a			;5664
	and 002h		;5665
	ld hl,0b97ah		;5667
	jr z,L_566F		;566a
	ld hl,0b9f8h		;566c
L_566F:
	ld a,(0e241h)		;566f
	call L_4D4C		;5672
	call L_4F1C		;5675
	call L_418A		;5678
	call L_41CC		;567b
	ld hl,0b95dh		;567e
	call L_4F1C		;5681
	jp L_418A		;5684
L_5687:
	call L_41CC		;5687
	ld hl,0f800h		;568a
	ld de,0abb9h		;568d
	call L_4E54		;5690
	jp L_418A		;5693
L_5696:
	call L_41CC		;5696
	ld ix,098c9h		;5699
	call L_5508		;569d
	ld ix,098eah		;56a0
	call L_553D		;56a4
	jp L_418A		;56a7
L_56AA:
	call L_41B0		;56aa
	ld bc,00307h		;56ad
	call 00047h		;56b0   ; BIOS WRTVDP - Writes data in the VDP-register
	ld hl,0afddh		;56b3
	ld de,00800h		;56b6
	ld bc,035fbh		;56b9
	call L_514C		;56bc
	call L_418A		;56bf
	jp L_57BB		;56c2
L_56C5:
	call L_41B5		;56c5
	ld hl,0ef13h		;56c8
	ld e,(hl)			;56cb
	inc l			;56cc
	ld d,(hl)			;56cd
	ld hl,0b1d6h		;56ce
	ld bc,01010h		;56d1
	ld a,000h		;56d4
	call L_506D		;56d6
	jp L_57C4		;56d9
L_56DC:
	ld c,002h		;56dc
L_56DE:
	call L_41CC		;56de
L_56E1:
	push bc			;56e1
	push de			;56e2
	ld b,c			;56e3
L_56E4:
	call L_56F8		;56e4
	ld a,d			;56e7
	add a,008h		;56e8
	ld d,a			;56ea
	djnz L_56E4		;56eb
	pop de			;56ed
	ld a,e			;56ee
	add a,008h		;56ef
	ld e,a			;56f1
	pop bc			;56f2
	djnz L_56E1		;56f3
	jp L_418A		;56f5
L_56F8:
	ld a,(0e241h)		;56f8
	ld hl,07ffeh		;56fb
	call L_4D4C		;56fe
	ld a,(0e242h)		;5701
	rra			;5704
	ld a,020h		;5705
	jr c,L_570A		;5707
	xor a			;5709
L_570A:
	call L_408F		;570a
	ld a,e			;570d
	and 018h		;570e
	ld c,a			;5710
	ld a,d			;5711
	srl a		;5712
	srl a		;5714
	srl a		;5716
	and 007h		;5718
	add a,c			;571a
	call L_408F		;571b
	ld a,(hl)			;571e
	jp L_5767		;571f
L_5722:
	ld b,002h		;5722
L_5724:
	call 00174h		;5724   ; BIOS NRDVRM - Reads VRAM like in RDVRM (with 16-bit VRAM-address)
	ld (de),a			;5727
	inc hl			;5728
	inc de			;5729
	call 00174h		;572a   ; BIOS NRDVRM - Reads VRAM like in RDVRM (with 16-bit VRAM-address)
	ld (de),a			;572d
	ld a,01fh		;572e
	call L_408F		;5730
	inc de			;5733
	djnz L_5724		;5734
	ret			;5736
L_5737:
	ld a,001h		;5737
	jr L_573C		;5739
L_573B:
	xor a			;573b
L_573C:
	ld (0efc0h),a		;573c
L_573F:
	push bc			;573f
	push de			;5740
	ld b,c			;5741
L_5742:
	ld a,(hl)			;5742
	push hl			;5743
	call L_5758		;5744
	pop hl			;5747
	ld a,d			;5748
	add a,008h		;5749
	ld d,a			;574b
	inc hl			;574c
	djnz L_5742		;574d
	pop de			;574f
	ld a,e			;5750
	add a,008h		;5751
	ld e,a			;5753
	pop bc			;5754
	djnz L_573F		;5755
	ret			;5757
L_5758:
	push af			;5758
	ld a,(0efc0h)		;5759
	and a			;575c
	jr nz,L_5764		;575d
	pop af			;575f
	call L_5767		;5760
	ret			;5763
L_5764:
	pop af			;5764
	jr L_576A		;5765
L_5767:
	jp L_5219		;5767
L_576A:
	jp L_5207		;576a
L_576D:
	push de			;576d
L_576E:
	ld a,(hl)			;576e
	inc hl			;576f
	ld c,a			;5770
	inc a			;5771
	jr z,L_578B		;5772
	inc a			;5774
	jr nz,L_5782		;5775
	pop de			;5777
	ld a,(hl)			;5778
	inc hl			;5779
	add a,d			;577a
	ld d,a			;577b
	ld a,008h		;577c
	add a,e			;577e
	ld e,a			;577f
	jr L_576D		;5780
L_5782:
	ld a,c			;5782
	call L_522B		;5783
	call L_524B		;5786
	jr L_576E		;5789
L_578B:
	pop de			;578b
	ret			;578c
L_578D:
	call L_4EBE		;578d
	ld b,003h		;5790
	ld c,007h		;5792
	call 00047h		;5794   ; BIOS WRTVDP - Writes data in the VDP-register
	call L_41CC		;5797
	ld bc,00d1ah		;579a
	ld hl,0bc05h		;579d
	ld de,01830h		;57a0
	call L_573B		;57a3
	call L_57C4		;57a6
	jp L_4EB1		;57a9
L_57AC:
	call L_41AB		;57ac
	ld de,0b7c7h		;57af
	ld hl,0b7dfh		;57b2
	call L_54A0		;57b5
	call L_418A		;57b8
L_57BB:
	call L_41CC		;57bb
	ld hl,0ba78h		;57be
	call L_4F1C		;57c1
L_57C4:
	call L_418A		;57c4
	jp L_41B5		;57c7
L_57CA:
	call L_41CC		;57ca
	ld hl,0f800h		;57cd
	ld de,0ba9ah		;57d0
	call L_4E54		;57d3
	jr L_57C4		;57d6
L_57D8:
	ld hl,(0e210h)		;57d8
	bit 2,h		;57db
	ld hl,0f600h		;57dd
	ld de,0f400h		;57e0
	ld bc,0e705h		;57e3
	jr z,L_57F1		;57e6
	ld hl,0f200h		;57e8
	ld de,0f000h		;57eb
	ld bc,0ef05h		;57ee
L_57F1:
	ld (0e212h),hl		;57f1
	ld (0e210h),de		;57f4
	jp 00047h		;57f8   ; BIOS WRTVDP - Writes data in the VDP-register
L_57FB:
	ld hl,0e20bh		;57fb
	ld a,(hl)			;57fe
	add a,068h		;57ff
	and 078h		;5801
	ld (hl),a			;5803
	ld a,(00007h)		;5804
	ld c,a			;5807
	ld hl,(0e210h)		;5808
	call 00171h		;580b   ; BIOS NSTWRT - Same function as SETWRT (with 16-bit VRAM-address)
	ld a,(0e20bh)		;580e
	ld d,010h		;5811
	add a,a			;5813
L_5814:
	ld h,069h		;5814
	ld l,a			;5816
	add hl,hl			;5817
	ld b,020h		;5818
	otir		;581a
	add a,090h		;581c
	dec d			;581e
	jr nz,L_5814		;581f
	ld hl,(0e212h)		;5821
	call 00171h		;5824   ; BIOS NSTWRT - Same function as SETWRT (with 16-bit VRAM-address)
	ld a,(0e20bh)		;5827
	ld d,010h		;582a
	ld h,0e8h		;582c
L_582E:
	ld b,008h		;582e
	ld l,a			;5830
	otir		;5831
	add a,048h		;5833
	and 078h		;5835
	dec d			;5837
	jr nz,L_582E		;5838
	ret			;583a
L_583B:
	ld bc,0ef05h		;583b
	call 00047h		;583e   ; BIOS WRTVDP - Writes data in the VDP-register
	ld hl,0d200h		;5841
	ld de,0f400h		;5844
	ld bc,00200h		;5847
	call L_4E05		;584a
	ld hl,0e800h		;584d
	ld de,0f600h		;5850
	ld bc,00080h		;5853
	jp L_4E05		;5856
L_5859:
	call L_585F		;5859
	jp L_418A		;585c
L_585F:
	call L_58D2		;585f
	jr L_586A		;5862
L_5864:
	call L_586A		;5864
	jp L_418A		;5867
L_586A:
	call L_41CC		;586a
	ld a,(0e24ch)		;586d
	or a			;5870
	jr nz,L_58CD		;5871
	ld a,(0e298h)		;5873
	or a			;5876
	jp nz,L_58BA		;5877
	ld a,(0e287h)		;587a
	and 00fh		;587d
	ld hl,0e297h		;587f
	cp (hl)			;5882
	call nz,L_5925		;5883
	ld a,(0e285h)		;5886
	add a,a			;5889
	ld e,a			;588a
	ld d,000h		;588b
	ld hl,0869ch		;588d
	add hl,de			;5890
	ld e,(hl)			;5891
	inc hl			;5892
	ld d,(hl)			;5893
	ld hl,000f0h		;5894
	ex de,hl			;5897
	ld bc,08001h		;5898
	ld a,005h		;589b
	call L_5029		;589d
	ld a,(0e285h)		;58a0
	add a,a			;58a3
	ld e,a			;58a4
	ld d,000h		;58a5
	ld hl,086b8h		;58a7
	add hl,de			;58aa
	ld e,(hl)			;58ab
	inc hl			;58ac
	ld d,(hl)			;58ad
	ld hl,080f0h		;58ae
	ex de,hl			;58b1
	ld bc,08001h		;58b2
	ld a,005h		;58b5
	jp L_5029		;58b7
L_58BA:
	ld a,(0e285h)		;58ba
L_58BD:
	ld de,000f0h		;58bd
	ld hl,000c0h		;58c0
	add a,l			;58c3
	ld l,a			;58c4
	ld bc,0ff01h		;58c5
	ld a,005h		;58c8
	jp L_5029		;58ca
L_58CD:
	ld a,(0e2b3h)		;58cd
	jr L_58BD		;58d0
L_58D2:
	call L_41CC		;58d2
	call L_58DB		;58d5
	jp L_418A		;58d8
L_58DB:
	ld a,(0e24ch)		;58db
	or a			;58de
	jr nz,L_5937		;58df
	ld a,(0e298h)		;58e1
	or a			;58e4
	jr nz,L_5928		;58e5
	ld a,(0e287h)		;58e7
	add a,a			;58ea
	ld e,a			;58eb
	ld d,000h		;58ec
	ld hl,0858bh		;58ee
	add hl,de			;58f1
	ld a,(hl)			;58f2
	inc hl			;58f3
	ld h,(hl)			;58f4
	ld l,a			;58f5
L_58F6:
	ld a,(hl)			;58f6
	cp 0ffh		;58f7
	ret z			;58f9
	and 00fh		;58fa
	jr nz,L_5910		;58fc
	ld e,(hl)			;58fe
	inc hl			;58ff
	ld d,(hl)			;5900
	inc hl			;5901
	ld c,(hl)			;5902
	inc hl			;5903
	ld b,(hl)			;5904
	inc hl			;5905
	push hl			;5906
	ld h,b			;5907
	ld l,c			;5908
	ex de,hl			;5909
	call L_4E54		;590a
	pop hl			;590d
	jr L_58F6		;590e
L_5910:
	ld c,a			;5910
	ld a,(hl)			;5911
	and 0f0h		;5912
	ld e,a			;5914
	inc hl			;5915
	ld d,(hl)			;5916
	inc hl			;5917
	ld a,(hl)			;5918
	inc hl			;5919
	ld b,(hl)			;591a
	inc hl			;591b
	push hl			;591c
	ld h,b			;591d
	ld l,a			;591e
	call L_4E60		;591f
	pop hl			;5922
	jr L_58F6		;5923
L_5925:
	ld (hl),a			;5925
	jr L_58DB		;5926
L_5928:
	call L_41CC		;5928
	ld hl,0e000h		;592b
	ld de,0953dh		;592e
	call L_4E54		;5931
	jp L_418A		;5934
L_5937:
	call L_41CC		;5937
	ld hl,0e000h		;593a
	ld de,0ab59h		;593d
	call L_4E54		;5940
	ld hl,0e080h		;5943
	ld de,0aa00h		;5946
	call L_4E54		;5949
	jp L_418A		;594c
L_594F:
	call L_41CC		;594f
	call L_5958		;5952
	jp L_418A		;5955
L_5958:
	ld hl,0f880h		;5958
	ld de,097a1h		;595b
	jp L_4E54		;595e
L_5961:
	call L_41AB		;5961
	ld hl,0902eh		;5964
	ld de,08ffch		;5967
	call L_54A0		;596a
	jp L_418A		;596d
L_5970:
	call L_41AB		;5970
	ld hl,09043h		;5973
	ld de,08ffch		;5976
	call L_54A0		;5979
	jp L_418A		;597c
L_597F:
	call L_41AB		;597f
	ld hl,09063h		;5982
	ld de,08ffch		;5985
	call L_54A0		;5988
	jp L_418A		;598b
L_598E:
	call L_41AB		;598e
	ld hl,09069h		;5991
	ld de,08ffch		;5994
	call L_54A0		;5997
	jp L_418A		;599a
L_599D:
	call L_41AB		;599d
	ld hl,09074h		;59a0
	ld de,08ffch		;59a3
	call L_54A0		;59a6
	jp L_418A		;59a9
L_59AC:
	ld de,01818h		;59ac
L_59AF:
	call L_41CC		;59af
	ld hl,0a358h		;59b2
	ld bc,00c0ch		;59b5
	call L_573B		;59b8
	jp L_418A		;59bb
L_59BE:
	call L_41CC		;59be
	ld hl,0a2c8h		;59c1
	ld bc,00c0ch		;59c4
	call L_573B		;59c7
	jp L_418A		;59ca
L_59CD:
	call L_41CC		;59cd
	ld hl,0a702h		;59d0
	ld bc,00c0ch		;59d3
	call L_573B		;59d6
	jp L_418A		;59d9
L_59DC:
	push af			;59dc
	ld bc,0a201h		;59dd
	call 00047h		;59e0   ; BIOS WRTVDP - Writes data in the VDP-register
	pop af			;59e3
	call L_59ED		;59e4
	ld bc,0e201h		;59e7
	jp 00047h		;59ea   ; BIOS WRTVDP - Writes data in the VDP-register
L_59ED:
	call L_41CC		;59ed
	ld de,00000h		;59f0
	ld b,020h		;59f3
L_59F5:
	push bc			;59f5
	push af			;59f6
	ld hl,09d58h		;59f7
	add a,a			;59fa
	ld c,a			;59fb
	ld b,000h		;59fc
	add hl,bc			;59fe
	ld a,(hl)			;59ff
	inc hl			;5a00
	ld h,(hl)			;5a01
	ld l,a			;5a02
	push de			;5a03
	ld bc,01b01h		;5a04
	call L_573B		;5a07
	pop de			;5a0a
	ld a,d			;5a0b
	add a,008h		;5a0c
	ld d,a			;5a0e
	pop af			;5a0f
	inc a			;5a10
	pop bc			;5a11
	djnz L_59F5		;5a12
	jp L_418A		;5a14
L_5A17:
	call L_41CC		;5a17
	ld hl,0a5a6h		;5a1a
	ld de,0b038h		;5a1d
	ld bc,00c02h		;5a20
	call L_573B		;5a23
	jp L_418A		;5a26
L_5A29:
	call L_41CC		;5a29
	ld hl,0a5beh		;5a2c
	ld de,0a838h		;5a2f
	ld bc,00c04h		;5a32
	call L_573B		;5a35
	jp L_418A		;5a38
L_5A3B:
	call L_41CC		;5a3b
	ld hl,0a5eeh		;5a3e
	ld de,0a030h		;5a41
	ld bc,00e06h		;5a44
	call L_573B		;5a47
	jp L_418A		;5a4a
L_5A4D:
	call L_41CC		;5a4d
	ld hl,0a6e0h		;5a50
	ld de,08848h		;5a53
	call L_576D		;5a56
	jp L_418A		;5a59
L_5A5C:
	call L_41CC		;5a5c
	ld hl,0a3e8h		;5a5f
	ld de,00040h		;5a62
	call L_576D		;5a65
	ld hl,0a4c7h		;5a68
	ld de,06040h		;5a6b
	call L_576D		;5a6e
	jp L_418A		;5a71
L_5A74:
	call L_41CC		;5a74
	ld hl,0a642h		;5a77
	ld de,06040h		;5a7a
	call L_576D		;5a7d
	ld hl,0a6b1h		;5a80
	ld de,09040h		;5a83
	call L_576D		;5a86
	jp L_418A		;5a89
L_5A8C:
	call L_41CC		;5a8c
	ld de,0af21h		;5a8f
	ld hl,0f820h		;5a92
	call L_4E54		;5a95
	ld de,0a9fbh		;5a98
	ld hl,0fe80h		;5a9b
	call L_4E54		;5a9e
	jp L_418A		;5aa1

; ----------------------------------------------------------------------
; DATOS sin identificar  0x5aa4..0x5aa5  (1 bytes)
DATA_5AA4:
	defb 0c9h	; 5aa4

; ======================================================================
; CODIGO 0x5aa5..0x5b34  (143 bytes)
; ======================================================================


L_5AA5:
	call L_41CC		;5aa5
	ld de,0ab59h		;5aa8
	ld hl,0f800h		;5aab
	call L_4E54		;5aae
	ld de,086d4h		;5ab1
	ld hl,0f880h		;5ab4
	call L_4E54		;5ab7
	ld de,08fd9h		;5aba
	ld hl,0f940h		;5abd
	call L_4E54		;5ac0
	ld de,0ae08h		;5ac3
	ld hl,0fa00h		;5ac6
	call L_4E54		;5ac9
	ld de,0a9f6h		;5acc
	ld hl,0fe80h		;5acf
	call L_4E54		;5ad2
	jp L_418A		;5ad5
L_5AD8:
	call L_41CC		;5ad8
	ld de,0ab59h		;5adb
	ld hl,0f800h		;5ade
	call L_4E54		;5ae1
	ld de,086d4h		;5ae4
	ld hl,0fc80h		;5ae7
	call L_4E54		;5aea
	ld de,08fd9h		;5aed
	ld hl,0fd40h		;5af0
	call L_4E54		;5af3
	ld de,0ae08h		;5af6
	ld hl,0fa00h		;5af9
	call L_4E54		;5afc
	ld de,0a9fbh		;5aff
	ld hl,0fe80h		;5b02
	call L_4E54		;5b05
	ld hl,0fc80h		;5b08
	ld de,0f890h		;5b0b
	ld c,00ch		;5b0e
	call L_4E60		;5b10
	jp L_418A		;5b13
L_5B16:
	call L_41B0		;5b16
	ld de,08030h		;5b19
	ld hl,0aa29h		;5b1c
	ld bc,0290ah		;5b1f
	call L_514C		;5b22
	ld de,0b838h		;5b25
	ld hl,0ab79h		;5b28
	ld bc,0050ah		;5b2b
	call L_514C		;5b2e
	jp L_418A		;5b31

; ----------------------------------------------------------------------
; DATOS sin identificar  0x5b34..0x5b52  (30 bytes)
DATA_5B34:
	defb 0cdh,0b0h,041h,011h,030h,080h,021h,029h,0aah,001h,00ch,02ah,0cdh,04ch,051h,011h	; 5b34  ..A.0.!)...*.LQ.
	defb 038h,0b8h,021h,079h,0abh,001h,00ch,005h,0cdh,04ch,051h,0c3h,08ah,041h	; 5b44  8.!y.....LQ..A

; ======================================================================
; CODIGO 0x5b52..0x5e43  (753 bytes)
; ======================================================================


L_5B52:
	call L_41CC		;5b52
	ld hl,0a7ffh		;5b55
	call L_4F1C		;5b58
	jp L_418A		;5b5b
L_5B5E:
	call L_41CC		;5b5e
	ld hl,0a8bbh		;5b61
	call L_4F1C		;5b64
	jp L_418A		;5b67
L_5B6A:
	call L_41AB		;5b6a
	call L_4EBE		;5b6d
	ld hl,0bb8bh		;5b70
	call L_4F1C		;5b73
	ld b,00fh		;5b76
	ld c,007h		;5b78
	call 00047h		;5b7a   ; BIOS WRTVDP - Writes data in the VDP-register
	ld hl,02840h		;5b7d
	ld bc,0a848h		;5b80
	xor a			;5b83
	ld d,001h		;5b84
	call L_4FED		;5b86
	ld hl,0bbdch		;5b89
	ld de,00800h		;5b8c
	ld bc,00d01h		;5b8f
	call L_514C		;5b92
	ld hl,0bc44h		;5b95
	ld de,07000h		;5b98
	ld bc,00d02h		;5b9b
	call L_514C		;5b9e
	ld hl,0bcach		;5ba1
	ld de,0d800h		;5ba4
	ld bc,01a03h		;5ba7
	call L_514C		;5baa
	ld de,04040h		;5bad
	ld hl,0bb9bh		;5bb0
	call L_576D		;5bb3
	call L_4EB1		;5bb6
	ld hl,0e2c0h		;5bb9
	ld (hl),03ch		;5bbc
	inc hl			;5bbe
	ld (hl),031h		;5bbf
	inc hl			;5bc1
	ld (hl),000h		;5bc2
	call L_418A		;5bc4
	ret			;5bc7
L_5BC8:
	ld hl,0e2c0h		;5bc8
	dec (hl)			;5bcb
	ld a,(hl)			;5bcc
	and 001h		;5bcd
	ret nz			;5bcf
	inc hl			;5bd0
	dec (hl)			;5bd1
	jr nz,L_5BDA		;5bd2
	ld a,001h		;5bd4
	ld (0e2c2h),a		;5bd6
	ret			;5bd9
L_5BDA:
	ld a,031h		;5bda
	sub (hl)			;5bdc
	ld c,a			;5bdd
	ld b,0a8h		;5bde
	ld hl,02840h		;5be0
	ld de,02840h		;5be3
	ld a,001h		;5be6
	jp L_5029		;5be8
L_5BEB:
	call L_41B0		;5beb
	ld de,08030h		;5bee
	ld hl,0aa29h		;5bf1
	ld bc,00c0bh		;5bf4
	call L_514C		;5bf7
	ld de,00038h		;5bfa
	ld hl,0aa89h		;5bfd
	ld bc,01e0bh		;5c00
	call L_514C		;5c03
	ld hl,0abc1h		;5c06
	ld de,09870h		;5c09
	ld b,002h		;5c0c
	call L_51BB		;5c0e
	jp L_418A		;5c11
L_5C14:
	call L_41CC		;5c14
	ld a,(0e241h)		;5c17
	ld b,a			;5c1a
	add a,a			;5c1b
	add a,a			;5c1c
	add a,b			;5c1d
	ld hl,0bd52h		;5c1e
	call L_408F		;5c21
	ld b,(hl)			;5c24
	inc hl			;5c25
	ld c,(hl)			;5c26
	inc hl			;5c27
	ld a,(hl)			;5c28
	exx			;5c29
	ld b,a			;5c2a
	exx			;5c2b
	inc hl			;5c2c
	ld e,(hl)			;5c2d
	inc hl			;5c2e
	ld d,(hl)			;5c2f
	ld hl,0ef00h		;5c30
	call L_5C51		;5c33
	ld a,(0e241h)		;5c36
	cp 004h		;5c39
	jp nz,L_418A		;5c3b
	exx			;5c3e
	ld b,005h		;5c3f
	exx			;5c41
	ld bc,00602h		;5c42
	ld de,0bdafh		;5c45
	ld hl,0ef04h		;5c48
	call L_5C51		;5c4b
	jp L_418A		;5c4e
L_5C51:
	inc (hl)			;5c51
	ld a,(hl)			;5c52
	exx			;5c53
	cp b			;5c54
	exx			;5c55
	ret c			;5c56
	ld (hl),000h		;5c57
	inc hl			;5c59
	ld a,(hl)			;5c5a
	inc hl			;5c5b
	and a			;5c5c
	push hl			;5c5d
	jr nz,L_5C68		;5c5e
	inc (hl)			;5c60
	ld a,(hl)			;5c61
	dec c			;5c62
	cp c			;5c63
	jr c,L_5C72		;5c64
	jr L_5C6D		;5c66
L_5C68:
	dec (hl)			;5c68
	ld a,(hl)			;5c69
	and a			;5c6a
	jr nz,L_5C72		;5c6b
L_5C6D:
	dec hl			;5c6d
	ld a,(hl)			;5c6e
	xor 001h		;5c6f
	ld (hl),a			;5c71
L_5C72:
	pop hl			;5c72
	ld a,(hl)			;5c73
	ex de,hl			;5c74
	add a,a			;5c75
	call L_408F		;5c76
	ld d,(hl)			;5c79
	inc hl			;5c7a
	ld e,(hl)			;5c7b
	ld a,b			;5c7c
	jp L_4EF2		;5c7d
L_5C80:
	ld a,(0e254h)		;5c80
	and a			;5c83
	jp nz,L_5CF5		;5c84
	ld a,(0e242h)		;5c87
	dec a			;5c8a
	ld b,001h		;5c8b
L_5C8D:
	sub 00ah		;5c8d
	jr c,L_5C94		;5c8f
	inc b			;5c91
	jr L_5C8D		;5c92
L_5C94:
	ld a,b			;5c94
	ld (0e241h),a		;5c95
	call L_5634		;5c98
	call L_5696		;5c9b
	call L_594F		;5c9e
	call L_565E		;5ca1
	ld hl,0e2c0h		;5ca4
	ld de,0e2c1h		;5ca7
	ld bc,00d3fh		;5caa
	ld (hl),000h		;5cad
	ldir		;5caf
	call L_5D41		;5cb1
	ld hl,0d200h		;5cb4
	ld de,0d201h		;5cb7
	ld bc,001ffh		;5cba
	ld (hl),000h		;5cbd
	ldir		;5cbf
	call 0929dh		;5cc1
	call 0674fh		;5cc4
	call 064e3h		;5cc7
	call 08f96h		;5cca
	call L_5DAC		;5ccd
	call L_5EB5		;5cd0
	call L_5DE6		;5cd3
	call L_43BB		;5cd6
	call 0632dh		;5cd9
	call 097b2h		;5cdc
	call 0921ah		;5cdf
	call L_41B5		;5ce2
	call 0b400h		;5ce5
	call L_418A		;5ce8
	xor a			;5ceb
	ld (0e287h),a		;5cec
	ld (0edcdh),a		;5cef
	call L_58D2		;5cf2
L_5CF5:
	call L_4E98		;5cf5
	call L_4ECB		;5cf8
	call L_4EBE		;5cfb
	call 0639ch		;5cfe
	call L_44D4		;5d01
	call L_41B5		;5d04
	call 0b51ch		;5d07
	call L_418A		;5d0a
	call 09010h		;5d0d
	call 093beh		;5d10
	call 0644ah		;5d13
	call 090f7h		;5d16
	call 06461h		;5d19
	call 06398h		;5d1c
	call L_4C8A		;5d1f
	call L_4EB1		;5d22
	ld hl,(0e243h)		;5d25
	dec l			;5d28
	ld h,000h		;5d29
	call L_5D32		;5d2b
	ld (0e250h),hl		;5d2e
	ret			;5d31
L_5D32:
	add hl,hl			;5d32
	add hl,hl			;5d33
	add hl,hl			;5d34
	add hl,hl			;5d35
	add hl,hl			;5d36
	add hl,hl			;5d37
	ld d,h			;5d38
	ld e,l			;5d39
	add hl,hl			;5d3a
	add hl,de			;5d3b
	ld de,0e900h		;5d3c
	add hl,de			;5d3f
	ret			;5d40
L_5D41:
	ld hl,0e800h		;5d41
	ld de,0e801h		;5d44
	ld bc,0007fh		;5d47
	ld (hl),0e0h		;5d4a
	ldir		;5d4c
	ret			;5d4e
L_5D4F:
	ld hl,0e21bh		;5d4f
	ld a,(hl)			;5d52
	and a			;5d53
	ret z			;5d54
	dec (hl)			;5d55
	ld a,(hl)			;5d56
	rra			;5d57
	ld b,000h		;5d58
	jr nc,L_5D5E		;5d5a
	ld b,00bh		;5d5c
L_5D5E:
	ld c,007h		;5d5e
	jp 00047h		;5d60   ; BIOS WRTVDP - Writes data in the VDP-register
L_5D63:
	call L_57D8		;5d63
	call L_5D6D		;5d66
	call L_57FB		;5d69
	ret			;5d6c
L_5D6D:
	call L_5D4F		;5d6d
	call 09ec4h		;5d70
	call L_5864		;5d73
	call 09866h		;5d76
	call 0a6bdh		;5d79
	call 0916dh		;5d7c
	call 09a14h		;5d7f
	call 0999dh		;5d82
	call 0671dh		;5d85
	call 0654ch		;5d88
	call 06645h		;5d8b
	call 08fbeh		;5d8e
	call 06483h		;5d91
	call 0be15h		;5d94
	call L_41B5		;5d97
	call 0b422h		;5d9a
	call L_418A		;5d9d
	call 09ab1h		;5da0
	call 09afeh		;5da3
	call L_4371		;5da6
	jp L_5C14		;5da9
L_5DAC:
	call L_41BF		;5dac
	ld hl,0e780h		;5daf
	ld de,0e781h		;5db2
	ld bc,0003fh		;5db5
	ld (hl),000h		;5db8
	ldir		;5dba
	ld de,0ab5ah		;5dbc
	ld a,(0e242h)		;5dbf
	dec a			;5dc2
	ld l,a			;5dc3
	ld h,000h		;5dc4
	add hl,hl			;5dc6
	add hl,hl			;5dc7
	add hl,hl			;5dc8
	add hl,de			;5dc9
	ex de,hl			;5dca
	ld hl,0e788h		;5dcb
	ld bc,00801h		;5dce
L_5DD1:
	push bc			;5dd1
	ld a,(de)			;5dd2
	ld b,008h		;5dd3
L_5DD5:
	rla			;5dd5
	jr nc,L_5DDA		;5dd6
	ld (hl),c			;5dd8
	inc c			;5dd9
L_5DDA:
	inc hl			;5dda
	djnz L_5DD5		;5ddb
	inc de			;5ddd
	ld a,c			;5dde
	pop bc			;5ddf
	ld c,a			;5de0
	djnz L_5DD1		;5de1
	jp L_418A		;5de3
L_5DE6:
	ld a,(0e243h)		;5de6
	call L_5DF0		;5de9
	ld (0e244h),a		;5dec
	ret			;5def
L_5DF0:
	ld hl,0e788h		;5df0
	ld c,000h		;5df3
L_5DF5:
	cp (hl)			;5df5
	jr z,L_5DFC		;5df6
	inc hl			;5df8
	inc c			;5df9
	jr L_5DF5		;5dfa
L_5DFC:
	ld a,c			;5dfc
	ret			;5dfd
L_5DFE:
	ld a,(0e244h)		;5dfe
	ld b,a			;5e01
	ld hl,0e248h		;5e02
	ld a,(hl)			;5e05
	ld (0e2f9h),a		;5e06
	ld (hl),000h		;5e09
	ld c,a			;5e0b
	call L_5E17		;5e0c
	ld a,c			;5e0f
	call L_5E38		;5e10
	ld (0e243h),hl		;5e13
	ret			;5e16
L_5E17:
	dec a			;5e17
	jr z,L_5E2C		;5e18
	dec a			;5e1a
	jr z,L_5E32		;5e1b
	dec a			;5e1d
	jr z,L_5E26		;5e1e
	ld a,003h		;5e20
	ld (0e284h),a		;5e22
	ret			;5e25
L_5E26:
	ld a,0f2h		;5e26
	ld (0e284h),a		;5e28
	ret			;5e2b
L_5E2C:
	ld a,0adh		;5e2c
	ld (0e282h),a		;5e2e
	ret			;5e31
L_5E32:
	ld a,003h		;5e32
	ld (0e282h),a		;5e34
	ret			;5e37
L_5E38:
	call L_5E3F		;5e38
	ld hl,(0efc0h)		;5e3b
	ret			;5e3e
L_5E3F:
	dec a			;5e3f
	call L_4099		;5e40

; ----------------------------------------------------------------------
; DATOS tabla_5E43: 4 destinos del despachador p00:4099 (call en p00:5E40, el
;   indice en A): 5E4B, 5E57, 5E65, 5E73; lo leen p00:5E40 (8 bytes)
;   0x5e43..0x5e4b  (8 bytes)
DATA_tabla_5E43:
	defw 05e4bh,05e57h,05e65h,05e73h	; 5e43  -> L_5E4B L_5E57 L_5E65 L_5E73

; ======================================================================
; CODIGO 0x5e4b..0x5ef2  (167 bytes)
; ======================================================================


L_5E4B:
	ld a,b			;5e4b
	sub 008h		;5e4c
	jr nc,L_5E52		;5e4e
	add a,030h		;5e50
L_5E52:
	ld hl,0ed80h		;5e52
	jr L_5E7F		;5e55
L_5E57:
	ld a,b			;5e57
	add a,008h		;5e58
	cp 030h		;5e5a
	jr c,L_5E60		;5e5c
	sub 030h		;5e5e
L_5E60:
	ld hl,0ed90h		;5e60
	jr L_5E7F		;5e63
L_5E65:
	ld a,b			;5e65
	dec a			;5e66
	and 007h		;5e67
	ld c,a			;5e69
	ld a,b			;5e6a
	and 0f8h		;5e6b
	or c			;5e6d
	ld hl,0eda0h		;5e6e
	jr L_5E7F		;5e71
L_5E73:
	ld a,b			;5e73
	inc a			;5e74
	and 007h		;5e75
	ld c,a			;5e77
	ld a,b			;5e78
	and 0f8h		;5e79
	or c			;5e7b
	ld hl,0edb0h		;5e7c
L_5E7F:
	ld (0efc1h),a		;5e7f
	ld de,0e788h		;5e82
	call L_4094		;5e85
	ld a,(de)			;5e88
	and a			;5e89
	jr z,L_5E90		;5e8a
	ld (0efc0h),a		;5e8c
	ret			;5e8f
L_5E90:
	ld a,(hl)			;5e90
	cp 0ffh		;5e91
	jr z,L_5EAF		;5e93
	cp b			;5e95
	inc hl			;5e96
	jr z,L_5E9C		;5e97
	inc hl			;5e99
	jr L_5E90		;5e9a
L_5E9C:
	ld a,(hl)			;5e9c
	cp b			;5e9d
	call z,L_5EAF		;5e9e
	ld (0efc1h),a		;5ea1
	ld hl,0e788h		;5ea4
	call L_408F		;5ea7
	ld a,(hl)			;5eaa
	ld (0efc0h),a		;5eab
	ret			;5eae
L_5EAF:
	ld hl,0e24dh		;5eaf
	ld (hl),001h		;5eb2
	ret			;5eb4
L_5EB5:
	call L_41BF		;5eb5
	ld hl,0adcfh		;5eb8
	ld de,0ed80h		;5ebb
	call L_5EDF		;5ebe
	ld hl,0ae47h		;5ec1
	ld de,0ed90h		;5ec4
	call L_5EDF		;5ec7
	ld hl,0aebfh		;5eca
	ld de,0eda0h		;5ecd
	call L_5EDF		;5ed0
	ld hl,0af37h		;5ed3
	ld de,0edb0h		;5ed6
	call L_5EDF		;5ed9
	jp L_418A		;5edc
L_5EDF:
	ld a,(0e242h)		;5edf
	call L_4D4C		;5ee2
L_5EE5:
	ld a,(hl)			;5ee5
	inc a			;5ee6
	jr z,L_5EEF		;5ee7
	ldi		;5ee9
	ldi		;5eeb
	jr L_5EE5		;5eed
L_5EEF:
	ldi		;5eef
	ret			;5ef1

; ----------------------------------------------------------------------
; DATOS resto_5EF2: lo apuntan con el banco puesto p00:4C9A (0x5EF2), p01:72FA
;   (0x5F0E), p00:48C3 (0x5F13), p00:4907 (0x5F28), p00:47EE (0x5F3E),
;   p00:47F3 (0x5F45); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p00:4C9A, p01:72FA, p00:48C3, p00:4907, p00:47EE,
;   p00:47F3 (155 bytes)
;   0x5ef2..0x5f8d  (155 bytes)
DATA_resto_5EF2:
	defb 010h,0c2h,0e8h,0e9h,0f3h,0e3h,0efh,0f2h,0e5h,0feh,060h,0c2h,0f3h,0e3h,0efh,0f2h	; 5ef2  ..........`.....
	defb 0e5h,0feh,098h,0c2h,0f3h,0f4h,0e1h,0e7h,0e5h,0feh,0d0h,0c2h,0f2h,0e5h,0f3h,0f4h	; 5f02  ................
	defb 0ffh,060h,048h,0f3h,0f4h,0e1h,0e7h,0e5h,0feh,048h,068h,0f3h,0efh,0f5h,0ech,000h	; 5f12  .`H......Hh.....
	defb 0f3h,0f4h,0efh,0eeh,0e5h,0ffh,060h,048h,0e6h,0e9h,0ech,0e5h,0ffh,038h,050h,0dah	; 5f22  ......`H.....8P.
	defb 0ebh,0efh,0eeh,0e1h,0edh,0e9h,000h,0d1h,0d9h,0d8h,0d8h,0feh,050h,08ch,0e7h,0e1h	; 5f32  ............P...
	defb 0edh,0e5h,0ffh,050h,09ch,0e5h,0e4h,0e9h,0f4h,0ffh,058h,058h,0e7h,0e1h,0edh,0e5h	; 5f42  ...P......XX....
	defb 000h,000h,0efh,0f6h,0e5h,0f2h,0ffh,050h,068h,0e6h,0d5h,000h,000h,0e3h,0efh,0eeh	; 5f52  .......Ph.......
	defb 0f4h,0e9h,0eeh,0f5h,0e5h,0ffh,0dch,0ddh,0ffh,048h,048h,0e8h,0e9h,0f3h,0e3h,0efh	; 5f62  .........HH.....
	defb 0f2h,0e5h,000h,0feh,050h,068h,0f3h,0f4h,000h,0feh,080h,068h,0f2h,0e5h,0f3h,0f4h	; 5f72  ....Ph.....h....
	defb 000h,0feh,058h,058h,0f3h,0e3h,0efh,0f2h,0e5h,000h,0ffh	; 5f82  ..XX.......

; ======================================================================
; CODIGO 0x5f8d..0x6000  (115 bytes)
; ======================================================================


L_5F8D:
	call L_4E98		;5f8d
	call L_5FA6		;5f90
	ld bc,00007h		;5f93
	call 00047h		;5f96   ; BIOS WRTVDP - Writes data in the VDP-register
	call L_55F0		;5f99
	call L_4EE7		;5f9c
	ld hl,00039h		;5f9f
	ld (0e214h),hl		;5fa2
	ret			;5fa5
L_5FA6:
	xor a			;5fa6
	ld h,a			;5fa7
	ld l,040h		;5fa8
	ld b,a			;5faa
	ld c,080h		;5fab
	ld d,001h		;5fad
	jp L_4FED		;5faf
L_5FB2:
	ld hl,01050h		;5fb2
	ld de,01820h		;5fb5
	ld bc,0a838h		;5fb8
	ld a,048h		;5fbb
	call L_5100		;5fbd
	call L_5FE7		;5fc0
	jp L_4EB1		;5fc3
L_5FC6:
	ld a,(0e203h)		;5fc6
	rra			;5fc9
	ret c			;5fca
	ld hl,0e214h		;5fcb
	dec (hl)			;5fce
	jr z,L_5FE7		;5fcf
	ld a,(hl)			;5fd1
	ld c,a			;5fd2
	add a,01fh		;5fd3
	ld e,a			;5fd5
	ld d,018h		;5fd6
	ld hl,01050h		;5fd8
	ld a,039h		;5fdb
	sub c			;5fdd
	ld c,a			;5fde
	ld b,0a8h		;5fdf
	ld a,001h		;5fe1
	call L_5029		;5fe3
	ret			;5fe6
L_5FE7:
	ld hl,03084h		;5fe7
	ld bc,04828h		;5fea
	xor a			;5fed
	ld d,a			;5fee
	call L_4FED		;5fef
	ld hl,03084h		;5ff2
	ld de,04828h		;5ff5
	ld c,00dh		;5ff8
	call L_4FC1		;5ffa
	ld hl,05f3eh		;5ffd
