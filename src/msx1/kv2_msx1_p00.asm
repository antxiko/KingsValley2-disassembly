; ==========================================================================
; KING'S VALLEY II - Konami (1988) - MSX - MegaROM RC-760 de 128 KB (Konami SCC) - banco 00 (se ejecuta en 0x4000)
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x04000


; ----------------------------------------------------------------------
; DATOS resto_4000: lo apuntan con el banco puesto p00:4F8F (0x4000), p02:8F3B
;   (0x4001), p01:6D3D (0x4010), p01:6D47 (0x4011); el tamano es lo que hay
;   hasta lo siguiente, no sale de recorrerlo; lo leen p00:4F8F, p02:8F3B,
;   p01:6D3D, p01:6D47 (46 bytes)
;   0x4000..0x402e  (46 bytes)
DATA_resto_4000:
	defb 041h,042h,0a8h,040h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 4000  AB.@............
	defb 043h,044h,007h,060h,0e0h,000h,0e2h,004h,042h,0e2h,03ch,040h,0e2h,023h,0e2h,026h	; 4010  CD.`....B.<@.#.&
	defb 0e2h,000h,000h,000h,000h,000h,000h,000h,080h,000h,001h,000h,0ffh,0ffh	; 4020  ..............

; ======================================================================
; CODIGO 0x402e..0x41ae  (384 bytes)
; ======================================================================


L_402E:
	di			;402e
	call 0013eh		;402f   ; BIOS RDVDP - Reads VDP status register
	ld hl,0e215h		;4032   ; 0xE215: una cuenta atras de cuadros (de dos bytes, con 0xE216)
	ld a,(hl)			;4035
	cp 002h		;4036   ; la cuenta baja solo si vale 2 o mas...
	jr c,L_4041		;4038   ; ...o si el byte alto no es cero
	inc hl			;403a
	ld a,(hl)			;403b   ; byte alto de la cuenta
	and a			;403c
	jr nz,L_4041		;403d   ; con el alto a 0 se baja el bajo
	dec hl			;403f   ; si el alto no es cero, se baja el alto (cuenta de 256 en 256)
	dec (hl)			;4040
L_4041:
	ld hl,0e21ah		;4041   ; 0xE21A: otra cuenta atras, que se para en 1
	ld a,(hl)			;4044
	cp 002h		;4045
	jr c,L_404A		;4047
	dec (hl)			;4049
L_404A:
	di			;404a
	ld hl,0e206h		;404b   ; 0xE206: el sonido ya esta en marcha (otra interrupcion lo cogio)
	ld a,(hl)			;404e
	and a			;404f
	ld (hl),001h		;4050   ; se marca ocupado antes de mirar
	jp nz,L_408F		;4052   ; ya estaba: no se entra dos veces
	ld a,004h		;4055   ; los bancos 4-5-6 del sonido en 0x6000-0xBFFF
	ld (07000h),a		;4057   ; el mapper: pone en 0x6000 el banco de A
	inc a			;405a
	ld (09000h),a		;405b   ; el mapper: pone en 0x8000 el banco de A
	inc a			;405e
	ld (0b000h),a		;405f   ; el mapper: pone en 0xA000 el banco de A
	call 06006h		;4062   ; un cuadro del motor de sonido (p04:6006)
	xor a			;4065   ; sonido libre otra vez
	ld (0e206h),a		;4066   ; guarda la marca de sonido en marcha en la interrupcion
	di			;4069
	ld a,(0f0f1h)		;406a   ; vuelven los bancos que habia (sus copias 0xF0F1-3)
	ld (07000h),a		;406d   ; el mapper: pone en 0x6000 el banco de A
	ld a,(0f0f2h)		;4070   ; lee el banco puesto en 0x8000
	ld (09000h),a		;4073   ; el mapper: pone en 0x8000 el banco de A
	ld a,(0f0f3h)		;4076   ; lee el banco puesto en 0xA000
	ld (0b000h),a		;4079   ; el mapper: pone en 0xA000 el banco de A
	ld hl,0e205h		;407c   ; 0xE205: un cuadro del juego ya en marcha
	ld a,(hl)			;407f
	and a			;4080
	jr nz,L_408F		;4081   ; si la anterior no ha acabado, solo suena: el juego espera
	inc (hl)			;4083   ; se marca ocupado
	ei			;4084   ; con interrupciones: el juego puede durar mas de un cuadro
	call L_4FAF		;4085   ; lee teclado y mando
	call L_46D5		;4088   ; un cuadro del juego
	xor a			;408b   ; cuadro acabado
	ld (0e205h),a		;408c   ; guarda la marca de cuadro del juego en marcha
L_408F:
	call 0013eh		;408f   ; BIOS RDVDP - Reads VDP status register
	ei			;4092
	ret			;4093
L_4094:
	add a,l			;4094   ; suma A a HL (HL = HL + A)
	ld l,a			;4095
	ret nc			;4096
	inc h			;4097
	ret			;4098
L_4099:
	add a,e			;4099   ; suma A a DE (DE = DE + A)
	ld e,a			;409a
	ret nc			;409b
	inc d			;409c
	ret			;409d
L_409E:
	pop hl			;409e   ; el despachador de Konami: la tabla va detras del call
L_409F:
	add a,a			;409f   ; dos bytes por entrada
	call L_4094		;40a0   ; HL apunta a la entrada A
	ld a,(hl)			;40a3
	inc hl			;40a4
	ld h,(hl)			;40a5   ; HL = el destino de la entrada
	ld l,a			;40a6
	jp (hl)			;40a7   ; y se salta alla
L_40A8:
	di			;40a8   ; INIT de la cabecera AB: solo se engancha para cuando acabe de arrancar la BIOS
	call 06d5eh		;40a9   ; busca otro cartucho con 0x30 0x31 0x13 0x35 en 0x7FFB (p01:6D5E): si esta, se arranca ya sin esperar a la BIOS
	di			;40ac
	ld a,(0f0efh)		;40ad
	inc a			;40b0
	jr nz,L_40C4		;40b1   ; con ese cartucho (0xF0EF), directamente al arranque de verdad
	call L_4149		;40b3   ; A = el slot de este cartucho, tambien en 0xF0E9
	di			;40b6
	ld h,a			;40b7   ; H.STKE (0xFEDA) = rst 0x30 (0xF7) a este slot...
	ld l,0f7h		;40b8
	ld (0fedah),hl		;40ba
	ld hl,L_40C4		;40bd   ; ...con la direccion 0x40C4: la BIOS lo llama tras arrancar (y el disco, si hay)
	ld (0fedch),hl		;40c0
	ret			;40c3
L_40C4:
	di			;40c4   ; el arranque de verdad
	im 1		;40c5   ; modo de interrupciones 1
	ld sp,0f0e0h		;40c7   ; la pila en 0xF0E0
	ld a,(0ffa7h)		;40ca   ; 0xFFA7 (H.PHYD) con algo: hay disco
	cp 0c9h		;40cd
	call nz,L_4165		;40cf   ; hay disco: 0xF323 = 0x9E65 y los cinco bytes de H.TIMI (0xFD9F) a 0xF0EA
	call L_4129		;40d2   ; pone en 0x8000 el slot de este cartucho (ENASLT)
	call L_4149		;40d5   ; A = el slot de este cartucho, tambien en 0xF0E9
	xor a			;40d8   ; 0xF0F4 y 0xF0F5 a 0: MSX1
	ld (0f0f4h),a		;40d9   ; guarda la marca de MSX2 (1 en el cartucho de MSX2, 0 en el de MSX1)
	ld (0f0f5h),a		;40dc
	ld hl,0e000h		;40df   ; la RAM del juego, 0xE000-0xEFFF, a cero
	ld de,0e001h		;40e2
	ld bc,00fffh		;40e5
	ld (hl),000h		;40e8
	ldir		;40ea
	ld a,001h		;40ec   ; 0xE219 = 1
	ld (0e219h),a		;40ee   ; guarda la demostracion siguiente (1-6)
	ld hl,0f0f0h		;40f1   ; los bancos 0-1-2-3 en 0x4000-0xBFFF, con sus copias en 0xF0F0-3
	xor a			;40f4
	ld (05000h),a		;40f5   ; el mapper: pone en 0x4000 el banco de A
	ld (hl),a			;40f8   ; y su copia
	inc a			;40f9
	ld (07000h),a		;40fa   ; el mapper: pone en 0x6000 el banco de A
	inc hl			;40fd
	ld (hl),a			;40fe
	inc a			;40ff
	ld (09000h),a		;4100   ; el mapper: pone en 0x8000 el banco de A
	inc hl			;4103
	ld (hl),a			;4104
	inc a			;4105
	ld (0b000h),a		;4106   ; el mapper: pone en 0xA000 el banco de A
	inc hl			;4109
	ld (hl),a			;410a
	di			;410b
	call L_4F67		;410c   ; arranca el sonido y la pantalla: la VRAM a cero y SCREEN 2 (los registros de 0x4FA7)
	ld a,0c3h		;410f   ; la interrupcion: H.KEYI (0xFD9A) = jp 0x402E
	ld (0fd9ah),a		;4111
	ld hl,L_402E		;4114
	ld (0fd9bh),hl		;4117
	ld a,0c9h		;411a   ; H.TIMI (0xFD9F) a ret
	ld (0fd9fh),a		;411c
	xor a			;411f   ; 0xF3DB = 0: sin el clic de las teclas
	ld (0f3dbh),a		;4120
	call 0013eh		;4123   ; BIOS RDVDP - Reads VDP status register | lee S#0: se borra la interrupcion pendiente
	ei			;4126
L_4127:
	jr L_4127		;4127   ; todo lo demas pasa en la interrupcion
L_4129:
	call 00138h		;4129   ; BIOS RSLREG - Reads the primary slot register | pone en 0x8000 el slot de este cartucho (ENASLT)
	rrca			;412c   ; la pagina 1 del slot primario (RSLREG)
	rrca			;412d
	and 003h		;412e
	ld c,a			;4130   ; C = el slot primario
	ld b,000h		;4131
	ld hl,0fcc1h		;4133   ; EXPTBL: si esta expandido...
	add hl,bc			;4136
	ld a,(hl)			;4137
	and 080h		;4138   ; ...se marca con el bit 7
	or c			;413a
	ld c,a			;413b
	inc hl			;413c   ; SLTTBL del slot: el secundario
	inc hl			;413d
	inc hl			;413e
	inc hl			;413f
	ld a,(hl)			;4140
	and 00ch		;4141   ; el secundario de la pagina 1 (bits 2-3)
	or c			;4143
	ld h,080h		;4144   ; en la pagina 2 (0x8000)
	jp 00024h		;4146   ; BIOS ENASLT - Switches to specified slot and page definitively
L_4149:
	call 00138h		;4149   ; BIOS RSLREG - Reads the primary slot register | A = el slot de este cartucho, tambien en 0xF0E9
	rrca			;414c   ; la pagina 1 del slot primario
	rrca			;414d
	and 003h		;414e
	ld c,a			;4150
	ld b,000h		;4151
	ld hl,0fcc1h		;4153   ; EXPTBL: expandido o no
	add hl,bc			;4156
	or (hl)			;4157   ; con su bit 7 (expandido)
	ld c,a			;4158
	inc hl			;4159   ; SLTTBL del slot
	inc hl			;415a
	inc hl			;415b
	inc hl			;415c
	ld a,(hl)			;415d   ; el secundario de la pagina 1
	and 00ch		;415e
	or c			;4160
	ld (0f0e9h),a		;4161   ; se guarda en 0xF0E9
	ret			;4164
L_4165:
	ld hl,09e65h		;4165   ; hay disco: 0xF323 = 0x9E65 y los cinco bytes de H.TIMI (0xFD9F) a 0xF0EA
	ld (0f323h),hl		;4168   ; 0xF323 = 0x9E65
	ld hl,0fd9fh		;416b
	ld de,0f0eah		;416e
	ld bc,00005h		;4171
	ldir		;4174
	ld a,(0f0efh)		;4176   ; 0xF0EF a 0xFF...
	inc a			;4179
	ret nz			;417a
	ld hl,0e280h		;417b   ; ...tambien la RAM: 0xE280-0xF37F a 0xC000 (4352 bytes)
	ld bc,01100h		;417e
	ld de,0c000h		;4181
	ldir		;4184
	ld hl,0f100h		;4186   ; y 0xF100-0xF37F a 0xD780
	ld de,0d780h		;4189
	ld bc,00280h		;418c
	ldir		;418f
	ret			;4191
L_4192:
	push af			;4192   ; pone los bancos 1-2-3 (el juego)
	ld a,001h		;4193
L_4195:
	di			;4195   ; pone A, A+1 y A+2 en 0x6000, 0x8000 y 0xA000, con sus copias en 0xF0F1-3
	push hl			;4196
	ld hl,0f0f1h		;4197   ; apunta a el banco puesto en 0x6000
	ld (hl),a			;419a
	ld (07000h),a		;419b   ; el mapper: pone en 0x6000 el banco de A
	inc a			;419e
	inc hl			;419f
	ld (hl),a			;41a0
	ld (09000h),a		;41a1   ; el mapper: pone en 0x8000 el banco de A
	inc a			;41a4
	inc hl			;41a5
	ld (hl),a			;41a6
	ld (0b000h),a		;41a7   ; el mapper: pone en 0xA000 el banco de A
	pop hl			;41aa
	pop af			;41ab
	ei			;41ac
	ret			;41ad

; ----------------------------------------------------------------------
; DATOS sin identificar  0x41ae..0x41b3  (5 bytes)
DATA_41AE:
	defb 0f5h,03eh,004h,018h,0e2h	; 41ae

; ======================================================================
; CODIGO 0x41b3..0x41ed  (58 bytes)
; ======================================================================


L_41B3:
	push af			;41b3   ; pone los bancos 7-8-9
	ld a,007h		;41b4
	jr $-33		;41b6
L_41B8:
	push af			;41b8   ; pone los bancos 10-11-12
	ld a,00ah		;41b9
	jr $-38		;41bb
L_41BD:
	push af			;41bd   ; pone el banco 12 en 0xA000
	ld a,00ch		;41be
	jr L_41CA		;41c0
L_41C2:
	push af			;41c2
	ld a,00fh		;41c3
	jr L_41CA		;41c5
L_41C7:
	push af			;41c7   ; pone el banco 13 en 0xA000
	ld a,00dh		;41c8
L_41CA:
	di			;41ca   ; A en 0xA000 y en su copia 0xF0F3
	ld (0f0f3h),a		;41cb   ; guarda el banco puesto en 0xA000
	ld (0b000h),a		;41ce   ; el mapper: pone en 0xA000 el banco de A
	pop af			;41d1
	ei			;41d2
	ret			;41d3
L_41D4:
	push af			;41d4   ; pone los bancos 14-15 en 0x8000-0xBFFF
	ld a,00eh		;41d5
	di			;41d7
	ld (0f0f2h),a		;41d8   ; guarda el banco puesto en 0x8000
	ld (09000h),a		;41db   ; el mapper: pone en 0x8000 el banco de A
	inc a			;41de
	ld (0f0f3h),a		;41df   ; guarda el banco puesto en 0xA000
	ld (0b000h),a		;41e2   ; el mapper: pone en 0xA000 el banco de A
	pop af			;41e5
	ei			;41e6
	ret			;41e7
L_41E8:
	ld a,001h		;41e8   ; pide el sonido 1
	jp L_432E		;41ea

; ----------------------------------------------------------------------
; DATOS sin identificar  0x41ed..0x41f2  (5 bytes)
DATA_41ED:
	defb 03eh,002h,0c3h,02eh,043h	; 41ed

; ======================================================================
; CODIGO 0x41f2..0x41f7  (5 bytes)
; ======================================================================


L_41F2:
	ld a,003h		;41f2   ; pide el sonido 3
	jp L_432E		;41f4

; ----------------------------------------------------------------------
; DATOS sin identificar  0x41f7..0x41fc  (5 bytes)
DATA_41F7:
	defb 03eh,004h,0c3h,02eh,043h	; 41f7

; ======================================================================
; CODIGO 0x41fc..0x432c  (304 bytes)
; ======================================================================


L_41FC:
	ld a,005h		;41fc   ; pide el sonido 5
	jp L_432E		;41fe
L_4201:
	ld a,006h		;4201   ; pide el sonido 6
	jp L_432E		;4203
L_4206:
	ld a,007h		;4206   ; pide el sonido 7
	jp L_432E		;4208
L_420B:
	ld a,008h		;420b   ; pide el sonido 8
	jp L_432E		;420d
L_4210:
	ld a,009h		;4210   ; pide el sonido 9
	jp L_432E		;4212
L_4215:
	ld a,00ah		;4215   ; pide el sonido 0x0A
	jp L_432E		;4217
L_421A:
	ld a,00bh		;421a   ; pide el sonido 0x0B
	jp L_432E		;421c
L_421F:
	ld a,00ch		;421f   ; pide el sonido 0x0C
	jp L_432E		;4221
L_4224:
	ld a,00dh		;4224   ; pide el sonido 0x0D
	jp L_432E		;4226
L_4229:
	ld a,00eh		;4229   ; pide el sonido 0x0E
	jp L_432E		;422b
L_422E:
	ld a,00fh		;422e   ; pide el sonido 0x0F
	jp L_432E		;4230
L_4233:
	ld a,010h		;4233   ; pide el sonido 0x10
	jp L_432E		;4235
L_4238:
	ld a,011h		;4238   ; pide el sonido 0x11
	jp L_432E		;423a
L_423D:
	ld a,012h		;423d   ; pide el sonido 0x12
	jp L_432E		;423f
L_4242:
	ld a,013h		;4242   ; pide el sonido 0x13
	jp L_432E		;4244
L_4247:
	ld a,014h		;4247   ; pide el sonido 0x14
	jp L_432E		;4249
L_424C:
	ld a,015h		;424c   ; pide el sonido 0x15
	jp L_432E		;424e
L_4251:
	ld a,016h		;4251   ; pide el sonido 0x16
	jp L_432E		;4253
L_4256:
	ld a,017h		;4256   ; pide el sonido 0x17
	jp L_432E		;4258
L_425B:
	ld a,018h		;425b   ; pide el sonido 0x18
	jp L_432E		;425d
L_4260:
	ld a,019h		;4260   ; pide el sonido 0x19
	jp L_432E		;4262
L_4265:
	ld a,01ah		;4265   ; pide el sonido 0x1A
	jp L_432E		;4267
L_426A:
	ld a,01bh		;426a   ; pide el sonido 0x1B
	jp L_432E		;426c
L_426F:
	ld a,01ch		;426f   ; pide el sonido 0x1C
	jp L_432E		;4271
L_4274:
	ld a,01dh		;4274   ; pide el sonido 0x1D
	jp L_432E		;4276
L_4279:
	ld a,01eh		;4279
	jp L_432E		;427b
L_427E:
	ld a,01fh		;427e
	jp L_432E		;4280
L_4283:
	ld a,020h		;4283   ; pide el sonido 0x20
	jp L_432E		;4285
L_4288:
	ld a,021h		;4288   ; pide el sonido 0x21
	jp L_432E		;428a
L_428D:
	ld a,022h		;428d   ; pide el sonido 0x22
	jp L_432E		;428f
L_4292:
	ld a,023h		;4292   ; pide el sonido 0x23
	jp L_432E		;4294
L_4297:
	ld a,024h		;4297   ; pide el sonido 0x24
	jp L_432E		;4299
L_429C:
	ld a,025h		;429c   ; pide el sonido 0x25
	jp L_432E		;429e
L_42A1:
	ld a,026h		;42a1   ; pide el sonido 0x26
	jp L_432E		;42a3
L_42A6:
	ld a,027h		;42a6   ; pide el sonido 0x27
	jp L_432E		;42a8
L_42AB:
	ld a,028h		;42ab   ; pide el sonido 0x28
	jr $+129		;42ad
L_42AF:
	ld a,029h		;42af   ; pide el sonido 0x29
	jr $+125		;42b1
L_42B3:
	ld a,02ah		;42b3   ; pide el sonido 0x2A
	jr $+121		;42b5
L_42B7:
	ld a,02bh		;42b7
	jr $+117		;42b9
L_42BB:
	ld a,02ch		;42bb
	jr $+113		;42bd
L_42BF:
	ld a,02dh		;42bf   ; pide el sonido 0x2D
	jr $+109		;42c1
L_42C3:
	ld a,02eh		;42c3   ; pide el sonido 0x2E
	jr $+105		;42c5
L_42C7:
	ld a,02fh		;42c7
	jr $+101		;42c9
L_42CB:
	ld a,030h		;42cb   ; pide el sonido 0x30
	jr $+97		;42cd
L_42CF:
	ld a,031h		;42cf
	jr $+93		;42d1
L_42D3:
	ld a,032h		;42d3   ; pide el sonido 0x32
	jr $+89		;42d5
L_42D7:
	ld a,033h		;42d7
	jr $+85		;42d9
L_42DB:
	ld a,034h		;42db
	jr $+81		;42dd
L_42DF:
	ld a,035h		;42df   ; pide el sonido 0x35
	jr $+77		;42e1
L_42E3:
	ld a,036h		;42e3   ; pide el sonido 0x36
	jr $+73		;42e5
L_42E7:
	ld a,037h		;42e7   ; pide el sonido 0x37
	jr $+69		;42e9
L_42EB:
	ld a,038h		;42eb   ; pide el sonido 0x38
	jr $+65		;42ed
L_42EF:
	ld a,039h		;42ef   ; pide el sonido 0x39
	jr $+61		;42f1
L_42F3:
	ld a,03ah		;42f3   ; pide el sonido 0x3A
	jr $+57		;42f5
L_42F7:
	ld a,03bh		;42f7   ; pide el sonido 0x3B
	jr $+53		;42f9
L_42FB:
	ld a,03ch		;42fb   ; pide el sonido 0x3C
	jr $+49		;42fd
L_42FF:
	ld a,03dh		;42ff   ; pide el sonido 0x3D
	jr $+45		;4301
L_4303:
	ld a,03eh		;4303   ; pide el sonido 0x3E
	jr $+41		;4305
L_4307:
	ld a,03fh		;4307
	jr $+37		;4309
L_430B:
	ld a,040h		;430b   ; pide el sonido 0x40
	jr $+33		;430d
L_430F:
	ld a,041h		;430f
	jr $+29		;4311
L_4313:
	ld a,080h		;4313   ; orden 0x80 al motor de sonido (p04:61E4)
	jr $+25		;4315
L_4317:
	ld a,081h		;4317   ; orden 0x81 al motor (p04:6248)
	jr $+21		;4319
L_431B:
	xor a			;431b   ; orden 0x82 (p04:61BB), con 0xE21A a cero
	ld (0e21ah),a		;431c   ; guarda una cuenta atras que para la musica al llegar a 1
	ld a,082h		;431f
	jr $+13		;4321
L_4323:
	ld a,0ffh		;4323   ; orden 0x83 (p04:61C2), con 0xE21A a 0xFF
	ld (0e21ah),a		;4325   ; guarda una cuenta atras que para la musica al llegar a 1
	ld a,083h		;4328
	jr $+4		;432a

; ----------------------------------------------------------------------
; DATOS sin identificar  0x432c..0x432e  (2 bytes)
DATA_432C:
	defb 03eh,084h	; 432c

; ======================================================================
; CODIGO 0x432e..0x43ac  (126 bytes)
; ======================================================================


L_432E:
	di			;432e   ; pide al motor de sonido lo que diga A (p04:603D), con los bancos 4-5-6 y sin tocar registros
	push hl			;432f
	push de			;4330
	push bc			;4331
	push ix		;4332
	push af			;4334   ; A, guardado
	ld a,004h		;4335   ; los bancos 4-5-6
	ld (07000h),a		;4337   ; el mapper: pone en 0x6000 el banco de A
	inc a			;433a
	ld (09000h),a		;433b   ; el mapper: pone en 0x8000 el banco de A
	inc a			;433e
	ld (0b000h),a		;433f   ; el mapper: pone en 0xA000 el banco de A
	pop af			;4342
	push af			;4343
	call 06003h		;4344   ; p04:603D: el sonido o la orden A
	ld hl,0f0f1h		;4347   ; y vuelven los bancos que habia
	ld a,(hl)			;434a
	ld (07000h),a		;434b   ; el mapper: pone en 0x6000 el banco de A
	inc hl			;434e
	ld a,(hl)			;434f
	ld (09000h),a		;4350   ; el mapper: pone en 0x8000 el banco de A
	inc hl			;4353
	ld a,(hl)			;4354
	ld (0b000h),a		;4355   ; el mapper: pone en 0xA000 el banco de A
	pop af			;4358   ; y los registros vuelven
	pop ix		;4359
	pop bc			;435b
	pop de			;435c
	pop hl			;435d
	ei			;435e
	ret			;435f
L_4360:
	call L_4192		;4360   ; con los bancos 1-2-3, llama a 0x5B5A y pone el 12 en 0xA000
	call L_5B5A		;4363   ; un cuadro de la partida: sprites, todo lo que se mueve y los sprites a la VRAM
	jr L_436E		;4366
L_4368:
	call L_4192		;4368   ; con los bancos 1-2-3, llama a 0x5A8A y pone el 12 en 0xA000
	call L_5A8A		;436b   ; prepara la fase 0xE242 (con el editor, solo la pantalla)
L_436E:
	jp L_41BD		;436e   ; el banco 12 en 0xA000
L_4371:
	call L_4192		;4371   ; con los bancos 1-2-3, llama a 0x5AEC y pone el 12 en 0xA000
	call L_5AEC		;4374   ; pinta la pantalla en la que se esta: apaga, pinta y enciende
	jr L_436E		;4377
L_4379:
	ld a,(0e215h)		;4379   ; la tecla de quitar o poner la musica (bit 3 de 0xE20C), si no hay cuenta en 0xE215
	and a			;437c
	ret nz			;437d
	ld a,(0e20ch)		;437e   ; 0xE20C: las teclas que se acaban de pulsar
	and 008h		;4381
	ret z			;4383
	ld hl,0e253h		;4384   ; 0xE253: la musica quitada (1) o puesta (0)
	ld a,(hl)			;4387
	xor 001h		;4388   ; se cambia
	ld (hl),a			;438a
	jp nz,L_41E8		;438b   ; quitada: el sonido 1 (que la calla)
	jr L_4395		;438e
L_4390:
	ld a,(0e253h)		;4390   ; si la musica esta quitada no se pone
	and a			;4393
	ret nz			;4394
L_4395:
	call L_431B		;4395   ; pone la musica de la piramide: primero calla lo que suene (orden 0x82)
	ld a,(0e242h)		;4398   ; 0xE242: la piramide en la que se esta
	call L_4CFE		;439b   ; en BCD
	dec a			;439e   ; (piramide - 1) & 0x0F: la cifra de las unidades
	and 00fh		;439f
	cp 00fh		;43a1
	jr nz,L_43A7		;43a3   ; en la 10, 20... (unidades 0 -> 0x0F) se toma 9
	ld a,009h		;43a5
L_43A7:
	srl a		;43a7   ; una musica cada dos piramides
	call L_409E		;43a9   ; la tabla va detras

; ----------------------------------------------------------------------
; DATOS tabla_43AC: 5 destinos del despachador p00:409E (call en p00:43A9, el
;   indice en A): 41FC, 4201, 4206, 420B, 4210; lo leen p00:43A9 (10 bytes)
;   0x43ac..0x43b6  (10 bytes)
DATA_tabla_43AC:
	defw 041fch,04201h,04206h,0420bh,04210h	; 43ac

; ======================================================================
; CODIGO 0x43b6..0x45ca  (532 bytes)
; ======================================================================


L_43B6:
	ld a,(0e203h)		;43b6   ; la piramide de 0xE203: sus unidades en BCD + 1 a 0xE242
	call L_4CFE		;43b9   ; pasa A a BCD
	and 00fh		;43bc
	inc a			;43be
	ld (0e242h),a		;43bf   ; guarda la fase (1-60)
	ret			;43c2
L_43C3:
	call L_43CA		;43c3   ; carga el mapa de la piramide y lo prepara
	call L_4408		;43c6   ; lee las cosas de la fase de la tabla del banco 10 (0x6078), sin apuntarlas
	ret			;43c9
L_43CA:
	call L_41B8		;43ca   ; con los bancos 10-11-12, desempaqueta el mapa de la piramide en 0xE900
	call L_43D3		;43cd   ; el mapa de la piramide 0xE242 (tabla del banco 10 en 0x6000)
	jp L_4192		;43d0   ; y vuelven los bancos 1-2-3
L_43D3:
	ld a,(0e242h)		;43d3   ; el mapa de la piramide 0xE242 (tabla del banco 10 en 0x6000)
	dec a			;43d6
	ld hl,06000h		;43d7
	call L_4D4D		;43da   ; HL = la palabra (piramide - 1) de la tabla
	ex de,hl			;43dd
	ld hl,0e900h		;43de   ; a 0xE900, cuatro casillas por byte
	exx			;43e1
	ld b,004h		;43e2   ; B' = casillas que quedan en el byte de 0xE900
	exx			;43e4
L_43E5:
	ld a,(de)			;43e5   ; racha: [veces][valor]; un 0 acaba
	and a			;43e6
	ret z			;43e7
	and 03fh		;43e8   ; los 6 bits bajos: cuantas casillas
	ld b,a			;43ea
	ld a,(de)			;43eb   ; los 2 bits altos: el valor de la casilla
	rlca			;43ec
	rlca			;43ed
	and 003h		;43ee
	inc de			;43f0   ; el valor, a C
	ld c,a			;43f1
L_43F2:
	call L_43F9		;43f2   ; mete B casillas con el valor C
	djnz L_43F2		;43f5
	jr L_43E5		;43f7
L_43F9:
	ld a,(hl)			;43f9   ; mete una casilla de 2 bits en el byte de HL
	add a,a			;43fa   ; corre el byte dos bits...
	add a,a			;43fb
	or c			;43fc   ; ...y pone la casilla abajo
	ld (hl),a			;43fd
	exx			;43fe   ; B' cuenta las cuatro casillas del byte
	dec b			;43ff
	exx			;4400
	ret nz			;4401   ; sin llenar el byte, se queda
	exx			;4402   ; lleno: otras cuatro en el siguiente
	ld b,004h		;4403
	exx			;4405
	inc hl			;4406
	ret			;4407
L_4408:
	call L_41B8		;4408   ; lee las cosas de la fase de la tabla del banco 10 (0x6078), sin apuntarlas
	call L_441E		;440b   ; las de 0x6078: casillas de la fase
	call L_4414		;440e   ; y las de 0x60F0, apuntandolas en 0xE7C0
	jp L_4192		;4411   ; vuelven los bancos 1-2-3
L_4414:
	ld a,001h		;4414   ; las cosas de la fase de la tabla 0x60F0, apuntandolas (0xEFC3 = 1)
	ld (0efc3h),a		;4416   ; guarda la marca de apuntar en 0xE7C0 las columnas al leer el mapa
	ld hl,060f0h		;4419
	jr L_4425		;441c
L_441E:
	ld hl,06078h		;441e   ; las de la tabla 0x6078, sin apuntarlas (0xEFC3 = 0)
	xor a			;4421
	ld (0efc3h),a		;4422   ; guarda la marca de apuntar en 0xE7C0 las columnas al leer el mapa
L_4425:
	ld a,001h		;4425   ; 0xEFC2: la pantalla de la fase en la que se esta (empieza en 1)
	ld (0efc2h),a		;4427   ; guarda la pantalla que se lee del mapa
	ld de,0e900h		;442a   ; 0xEFC0: el mapa de esa pantalla (0xE900, 0xC0 bytes cada una)
	ld (0efc0h),de		;442d   ; guarda un dato de paso de la rutina en curso y el byte siguiente (16 bits)
	ld ix,0e7c0h		;4431   ; IX: la lista que se apunta en 0xE7C0, 4 bytes por cosa
	ld a,(0e242h)		;4435   ; la palabra (fase - 1) de la tabla
	dec a			;4438
	call L_4D4D		;4439   ; HL = la palabra A de la tabla de HL
L_443C:
	ld e,(hl)			;443c   ; cada cosa: [posicion de la casilla, 2 bytes]; 0xFF pasa a la pantalla siguiente y 0x00 acaba
	inc hl			;443d
	ld a,e			;443e   ; 0xFF: la pantalla siguiente
	cp 0ffh		;443f   ; 0xFF: la pantalla siguiente
	jr z,L_4452		;4441
	ld d,(hl)			;4443   ; el segundo byte
	ld a,e			;4444
	and a			;4445
	ret z			;4446   ; un 0 acaba
	inc hl			;4447
	push hl			;4448
	call L_4468		;4449   ; HL = el byte del mapa de la casilla
	call L_4474		;444c   ; y se pinta la cosa en el mapa
	pop hl			;444f
L_4450:
	jr L_443C		;4450
L_4452:
	push hl			;4452   ; pasa a la pantalla siguiente
	call L_4459		;4453   ; la pantalla siguiente: 0xEFC2 + 1 y 0xEFC0 + 0xC0
	pop hl			;4456
	jr L_4450		;4457
L_4459:
	ld hl,0efc2h		;4459   ; la pantalla siguiente: 0xEFC2 + 1 y 0xEFC0 + 0xC0
	inc (hl)			;445c
	ld hl,(0efc0h)		;445d   ; lee un dato de paso de la rutina en curso y el byte siguiente (16 bits)
	ld bc,000c0h		;4460
	add hl,bc			;4463
	ld (0efc0h),hl		;4464   ; guarda un dato de paso de la rutina en curso y el byte siguiente (16 bits)
	ret			;4467
L_4468:
	ld l,e			;4468   ; HL = el byte del mapa de la casilla DE: (DE x 2) / 256 + 0xEFC0
	ld h,d			;4469
	add hl,hl			;446a
	ld l,h			;446b
	ld h,000h		;446c
	ld bc,(0efc0h)		;446e   ; lee un dato de paso de la rutina en curso y el byte siguiente (16 bits)
	add hl,bc			;4472
	ret			;4473
L_4474:
	ld a,(0efc3h)		;4474   ; mete en el mapa la cosa de DE: una columna de casillas a 2
	and a			;4477   ; con 0xEFC3, se apunta en la lista de 0xE7C0
	call nz,L_44B4		;4478   ; apunta la cosa en la lista de IX: [pantalla][y][x][casillas | 0x80]
	ld a,e			;447b   ; los 5 bits bajos: cuantas casillas
	and 01fh		;447c
	ld b,a			;447e
	ld a,e			;447f   ; la casilla dentro del byte (cada byte lleva 4)
	rlca			;4480
	rlca			;4481
	rlca			;4482
	and 003h		;4483
	ld e,a			;4485
L_4486:
	push bc			;4486
	call L_44A2		;4487   ; la casilla de arriba...
	inc e			;448a   ; la casilla siguiente del byte
	ld a,e			;448b
	and 003h		;448c
	ld e,a			;448e
	jr nz,L_4492		;448f
	inc hl			;4491   ; el byte siguiente
L_4492:
	call L_44A2		;4492   ; ...y la de su derecha
	ld bc,00008h		;4495   ; una fila mas abajo: 8 bytes (32 casillas)
	dec e			;4498
	jp p,L_449D		;4499
	dec c			;449c
L_449D:
	add hl,bc			;449d
	pop bc			;449e
	djnz L_4486		;449f
	ret			;44a1
L_44A2:
	ld a,e			;44a2   ; pone a 01 la casilla E (0-3) del byte de HL
	and a			;44a3
	ld a,040h		;44a4   ; 0x40 = la casilla 0 a 01
	jr z,L_44AD		;44a6
	ld b,e			;44a8
L_44A9:
	rra			;44a9   ; se corre a su casilla
	rra			;44aa
	djnz L_44A9		;44ab
L_44AD:
	ld b,a			;44ad
	rlca			;44ae   ; se borra la casilla y se pone el 01
	cpl			;44af
	and (hl)			;44b0
	or b			;44b1
	ld (hl),a			;44b2
	ret			;44b3
L_44B4:
	ld a,(0efc2h)		;44b4   ; apunta la cosa en la lista de IX: [pantalla][y][x][casillas | 0x80]
	ld (ix+000h),a		;44b7   ; la pantalla
	ld a,d			;44ba   ; la y: (posicion alta x 2) & 0xF8
	add a,a			;44bb
	and 0f8h		;44bc
	ld (ix+001h),a		;44be   ; la y
	ld c,d			;44c1   ; la x: (posicion / 4) & 0xF8
	ld a,e			;44c2
	rr c		;44c3
	rra			;44c5
	rr c		;44c6
	rra			;44c8
	and 0f8h		;44c9
	ld (ix+002h),a		;44cb   ; la x
	ld a,e			;44ce   ; el alto (5 bits bajos) con el bit 7
	and 01fh		;44cf
	or 080h		;44d1
	ld (ix+003h),a		;44d3   ; el alto
	ld bc,00004h		;44d6   ; la siguiente de la lista
	add ix,bc		;44d9
	ret			;44db
L_44DC:
	call 0b7b7h		;44dc   ; pinta la pantalla en la que se esta
	call L_41D4		;44df   ; los bancos 14-15
	call L_44FA		;44e2   ; el fondo con los grabados de la piramide
	call L_4607		;44e5   ; las puertas y los adornos de la pantalla
	call L_41B8		;44e8   ; los bancos 10-11-12
	call L_453D		;44eb   ; los ladrillos del mapa
	call L_4192		;44ee   ; los bancos 1-2-3
	call L_46A5		;44f1   ; y lo que hay en 0xE2C0 en esta pantalla
	call 06327h		;44f4   ; pinta las cosas de 0xE700 de esta pantalla
	jp 0b7cfh		;44f7
L_44FA:
	ld a,(0e241h)		;44fa   ; el fondo: el dibujo de la piramide 0xE241 (tabla de 0x7FFE)
	ld hl,07ffeh		;44fd
	call L_4D4D		;4500   ; HL = la palabra A de la tabla de HL
	ld a,(0e242h)		;4503   ; fases impares y pares, dos fondos (la segunda mitad, +0x20)
	rra			;4506
	ld a,020h		;4507
	jr c,L_450C		;4509
	xor a			;450b
L_450C:
	call L_4094		;450c   ; suma A a HL (HL = HL + A)
	ex de,hl			;450f
	ld hl,03800h		;4510
	call 00053h		;4513   ; BIOS SETWRT - Enables VDP to write
	ex de,hl			;4516
	ld a,(00007h)		;4517
	ld c,a			;451a
	ld b,006h		;451b
L_451D:
	push bc			;451d
	push hl			;451e
	ld d,004h		;451f
L_4521:
	ld e,004h		;4521
L_4523:
	ld b,008h		;4523
	push hl			;4525
L_4526:
	ld a,(hl)			;4526   ; un byte a la VRAM
	out (c),a		;4527
	inc hl			;4529
	djnz L_4526		;452a
	pop hl			;452c
	dec e			;452d   ; la fila siguiente
	jr nz,L_4523		;452e
	ld a,008h		;4530   ; 8 bytes mas
	call L_4094		;4532   ; suma A a HL (HL = HL + A)
	dec d			;4535
	jr nz,L_4521		;4536
	pop hl			;4538
	pop bc			;4539
	djnz L_451D		;453a   ; el tercio siguiente
	ret			;453c
L_453D:
	xor a			;453d   ; pinta los ladrillos del mapa de la pantalla 0xE243
	ld (0efc0h),a		;453e   ; guarda un dato de paso de la rutina en curso
	ld hl,(0e242h)		;4541   ; 0xE242 y 0xE243: L = la fase, H = la pantalla
	dec h			;4544   ; (pantalla - 1) x 0xC0 = x 256 - x 64
	ld l,000h		;4545
	ld e,l			;4547
	ld d,h			;4548
	srl d		;4549
	rr e		;454b
	srl d		;454d
	rr e		;454f
	and a			;4551
	sbc hl,de		;4552
	ld de,0e900h		;4554   ; mas 0xE900: el mapa de la pantalla, a IX
	add hl,de			;4557
	push hl			;4558
	pop ix		;4559
L_455B:
	ld de,00000h		;455b   ; desde la esquina: 0xC0 bytes de 4 casillas
	ld b,0c0h		;455e
L_4560:
	push bc			;4560
	ld a,(ix+000h)		;4561
	ld b,004h		;4564
L_4566:
	rlca			;4566   ; las dos cifras de cada casilla
	rlca			;4567
	push af			;4568
	and 003h		;4569
	dec a			;456b   ; 1: escalera (p00:45CC)
	jr z,$+96		;456c
	dec a			;456e   ; 0: nada
	jp m,L_457E		;456f
	ld a,005h		;4572   ; 2: ladrillo, el caracter 5; 3: el 0x62
	jr z,L_4578		;4574
	ld a,062h		;4576
L_4578:
	ld (0efc0h),a		;4578   ; el dibujo a pintar
	call L_53EF		;457b   ; pinta la casilla
L_457E:
	call L_4F5D		;457e   ; la casilla siguiente a la derecha
	pop af			;4581
	djnz L_4566		;4582
	inc ix		;4584   ; el byte siguiente del mapa
	pop bc			;4586
	djnz L_4560		;4587
	ld a,(0e200h)		;4589   ; en el estado 0x0B (el editor) no se pintan las columnas de 0xE7C0
	cp 00bh		;458c
	ret z			;458e
	ld ix,0e7c0h		;458f   ; las 16 columnas de la lista de 0xE7C0 que son de esta pantalla
	ld b,010h		;4593
	ld a,(0e243h)		;4595   ; lee la pantalla de la fase (desde 1)
	ld c,a			;4598
L_4599:
	push bc			;4599
	ld a,(ix+000h)		;459a
	and a			;459d
	jr z,L_45A6		;459e
	cp c			;45a0
	jr nz,L_45A6		;45a1
	call L_45AF		;45a3   ; pinta una columna: B pares de caracteres de 0x45CA desde (D, E) hacia abajo
L_45A6:
	ld bc,00004h		;45a6
	add ix,bc		;45a9
	pop bc			;45ab
	djnz L_4599		;45ac
	ret			;45ae
L_45AF:
	ld c,002h		;45af   ; pinta una columna: B pares de caracteres de 0x45CA desde (D, E) hacia abajo
	ld a,(ix+003h)		;45b1   ; el alto
	and 01fh		;45b4
	ld b,a			;45b6
	ld e,(ix+001h)		;45b7   ; el sitio
	ld d,(ix+002h)		;45ba
L_45BD:
	ld hl,045cah		;45bd   ; dos caracteres por fila
	call L_4691		;45c0   ; pinta dos caracteres en vertical (HL y HL + 1) en (D, E)
	ld a,e			;45c3   ; 8 pixeles mas abajo
	add a,008h		;45c4
	ld e,a			;45c6
	djnz L_45BD		;45c7
	ret			;45c9

; ----------------------------------------------------------------------
; DATOS resto_45CA: lo apuntan con el banco puesto p00:45BD (0x45CA); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p00:45BD (2 bytes)
;   0x45ca..0x45cc  (2 bytes)
DATA_resto_45CA:
	defb 001h,002h	; 45ca

; ======================================================================
; CODIGO 0x45cc..0x46ee  (290 bytes)
; ======================================================================


L_45CC:
	ld a,(0efc0h)		;45cc   ; la casilla de escalera: el caracter 3, o el 4 si el de su izquierda era el 3 (los peldanos van de dos en dos)
	cp 003h		;45cf   ; si el de la izquierda era el 3: el 4
	jr z,L_45F2		;45d1
	cp 003h		;45d3
	jr z,L_45FA		;45d5
	ld a,e			;45d7   ; en la fila de arriba de la pantalla: el 3
	and a			;45d8
	jr z,L_45F6		;45d9
	ld a,b			;45db   ; la casilla de arriba (IX - 8)...
	sub 005h		;45dc
	neg		;45de
	ld c,a			;45e0
	ld a,(ix-008h)		;45e1
L_45E4:
	rlca			;45e4   ; ...sus dos bits
	rlca			;45e5
	dec c			;45e6
	jr nz,L_45E4		;45e7
	and 003h		;45e9
	dec a			;45eb
	jr z,L_45F6		;45ec   ; arriba tambien escalera: el 3
	ld a,003h		;45ee   ; si no, tambien el 3
	jr L_45FE		;45f0
L_45F2:
	ld a,004h		;45f2
	jr L_45FE		;45f4
L_45F6:
	ld a,003h		;45f6
	jr L_45FE		;45f8
L_45FA:
	ld a,004h		;45fa
	jr L_45FE		;45fc
L_45FE:
	ld (0efc0h),a		;45fe   ; guarda un dato de paso de la rutina en curso
	call L_53EF		;4601   ; escribe el caracter A en la posicion D, E de la tabla de nombres
	jp L_457E		;4604
L_4607:
	ld a,(0e254h)		;4607   ; las puertas y los adornos de la pantalla (tabla del banco 14 en 0x806A), salvo en el editor
	and a			;460a
	ret nz			;460b
	ld a,(0e242h)		;460c   ; por la fase 0xE242
	ld hl,0806ah		;460f
	call L_4D4D		;4612   ; HL = la palabra A de la tabla de HL
L_4615:
	ld a,(hl)			;4615   ; cada uno: [x | tipo (3 bits)][y | pantalla (3 bits)][otro byte]; 0xFF acaba
	cp 0ffh		;4616
	ret z			;4618
	ld b,a			;4619
	and 0f8h		;461a   ; la x
	ld e,a			;461c
	inc hl			;461d   ; el segundo byte
	ld a,(hl)			;461e
	and 007h		;461f   ; la pantalla
	ld d,a			;4621
	ld a,(0e243h)		;4622   ; solo los de la pantalla 0xE243
	dec a			;4625   ; la pantalla - 1
	cp d			;4626
	jr nz,L_4635		;4627
	ld a,(hl)			;4629   ; la y
	and 0f8h		;462a
	ld d,a			;462c
	inc hl			;462d
	ld c,(hl)			;462e   ; C = el tercer byte
	dec hl			;462f
	push hl			;4630
	call L_4639		;4631   ; pinta el adorno de tipo B de la piramide 0xE241: su dibujo en la tabla de 0x800C
	pop hl			;4634
L_4635:
	inc hl			;4635
	inc hl			;4636
	jr L_4615		;4637
L_4639:
	ld a,b			;4639   ; pinta el adorno de tipo B de la piramide 0xE241: su dibujo en la tabla de 0x800C
	and 007h		;463a
	ld b,a			;463c
	ld a,(0e241h)		;463d   ; lee la piramide (1-6)
	dec a			;4640   ; (piramide - 1) x 8
	add a,a			;4641
	add a,a			;4642
	add a,a			;4643
	add a,b			;4644
	ld hl,0800ch		;4645   ; la palabra (piramide - 1) x 8 + tipo
	call L_4D4D		;4648   ; HL = la palabra A de la tabla de HL
	ld a,b			;464b   ; el tamano sale del tipo: 4 x 4, 4 x 2, 2 x 4 o el tipo 6-7, de largo C
	srl a		;464c
	cp 003h		;464e
	jr z,L_467A		;4650
	ld bc,00404h		;4652   ; tipo 0-1: 4 x 4
	and a			;4655
	jr z,L_4661		;4656
	ld bc,00402h		;4658   ; tipo 2-3: 4 x 2
	dec a			;465b
	jr z,L_4661		;465c
	ld bc,00204h		;465e   ; tipo 4-5: 2 x 4
L_4661:
	push bc			;4661
	ld b,c			;4662
	push de			;4663
L_4664:
	ld a,(hl)			;4664   ; una fila de caracteres
	inc hl			;4665
	push hl			;4666
	call L_53EF		;4667   ; escribe el caracter A en la posicion D, E de la tabla de nombres
	pop hl			;466a
	ld a,d			;466b   ; 8 pixeles a la derecha
	add a,008h		;466c
	ld d,a			;466e
	djnz L_4664		;466f
	pop de			;4671
	ld a,e			;4672   ; la fila siguiente, 8 mas abajo
	add a,008h		;4673
	ld e,a			;4675
	pop bc			;4676
	djnz L_4661		;4677
	ret			;4679
L_467A:
	call L_4691		;467a   ; el de largo C: el primero, C - 2 del medio y el ultimo
	inc hl			;467d
	ld a,e			;467e
	add a,008h		;467f
	ld e,a			;4681
	ld b,c			;4682
	dec b			;4683
	dec b			;4684
L_4685:
	call L_4691		;4685   ; pinta dos caracteres en vertical (HL y HL + 1) en (D, E)
	dec hl			;4688
	ld a,e			;4689   ; 8 pixeles mas abajo
	add a,008h		;468a
	ld e,a			;468c
	djnz L_4685		;468d
	inc hl			;468f
	inc hl			;4690
L_4691:
	push de			;4691   ; pinta dos caracteres en vertical (HL y HL + 1) en (D, E)
	ld a,(hl)			;4692
	push hl			;4693
	call L_53EF		;4694   ; escribe el caracter A en la posicion D, E de la tabla de nombres
	pop hl			;4697
	ld a,d			;4698   ; 8 pixeles a la derecha
	add a,008h		;4699
	ld d,a			;469b
	inc hl			;469c   ; el segundo
	ld a,(hl)			;469d
	push hl			;469e
	call L_53EF		;469f   ; escribe el caracter A en la posicion D, E de la tabla de nombres
	pop hl			;46a2
	pop de			;46a3
	ret			;46a4
L_46A5:
	ld hl,0e2c0h		;46a5   ; pinta lo de 0xE2C0 (8 fichas de 5 bytes) que este en esta pantalla
	ld b,008h		;46a8
L_46AA:
	push bc			;46aa   ; una ficha de 0xE2C0
	push hl			;46ab
	ld a,(hl)			;46ac   ; el tipo, sin el bit 7
	and 07fh		;46ad
	dec a			;46af   ; solo los tipos 1 y 2 tienen dibujo
	sub 002h		;46b0
	call c,L_46BE		;46b2   ; una de 0xE2C0 en su sitio: el dibujo de 0x90C5, 3 x 2
	pop hl			;46b5
	ld de,00005h		;46b6   ; la siguiente (5 bytes)
	add hl,de			;46b9
	pop bc			;46ba
	djnz L_46AA		;46bb
	ret			;46bd
L_46BE:
	inc l			;46be   ; una de 0xE2C0 en su sitio: el dibujo de 0x90C5, 3 x 2
	inc l			;46bf
	ld a,(0e243h)		;46c0   ; lee la pantalla de la fase (desde 1)
	cp (hl)			;46c3
	ret nz			;46c4
	inc l			;46c5
	ld a,(hl)			;46c6   ; la y - 8
	sub 008h		;46c7
	ld e,a			;46c9
	inc l			;46ca
	ld d,(hl)			;46cb   ; la x
	ld bc,00302h		;46cc   ; 3 x 2 caracteres
	ld hl,090c5h		;46cf
	jp L_53D6		;46d2
L_46D5:
	call L_46DB		;46d5   ; un cuadro del juego: el estado y la pausa
	jp L_4BBB		;46d8
L_46DB:
	ld a,(0e21ah)		;46db   ; un cuadro: 0xE21A a 1 calla la musica
	dec a			;46de
	call z,L_431B		;46df   ; orden 0x82 (p04:61BB), con 0xE21A a cero
	ld hl,0e203h		;46e2   ; 0xE203: cuenta de cuadros
	inc (hl)			;46e5
	ld bc,(0e200h)		;46e6   ; C = 0xE200 (el estado), B = 0xE201 (su paso)
	ld a,c			;46ea
	call L_409E		;46eb   ; cada estado, su rutina (tabla detras)

; ----------------------------------------------------------------------
; DATOS tabla_46EE: 14 destinos del despachador p00:409E (call en p00:46EB, el
;   indice en A): 470A, 4769, 4788, 47C2, 48AF, 4943, 4A1E, 4A3E, 4AEF, 4B07,
;   4B4D, 4B5E, 4B6F, 4BB0; lo leen p00:46EB (28 bytes)
;   0x46ee..0x470a  (28 bytes)
DATA_tabla_46EE:
	defw 0470ah,04769h,04788h,047c2h,048afh,04943h,04a1eh,04a3eh	; 46ee
	defw 04aefh,04b07h,04b4dh,04b5eh,04b6fh,04bb0h	; 46fe

; ======================================================================
; CODIGO 0x470a..0x470e  (4 bytes)
; ======================================================================


L_470A:
	ld a,b			;470a   ; estado 0: la presentacion, por pasos (0xE201)
	call L_409E		;470b   ; el despachador de Konami: la tabla va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_470E: 5 destinos del despachador p00:409E (call en p00:470B, el
;   indice en A): 4718, 4724, 4726, 4743, 475D; lo leen p00:470B (10 bytes)
;   0x470e..0x4718  (10 bytes)
DATA_tabla_470E:
	defw 04718h,04724h,04726h,04743h,0475dh	; 470e

; ======================================================================
; CODIGO 0x4718..0x47c6  (174 bytes)
; ======================================================================


L_4718:
	call L_4F96		;4718   ; paso 0: el sonido 1 (callar), la pantalla y la presentacion
	call L_41E8		;471b   ; pide el sonido 1
	call L_4EC7		;471e   ; borra los sprites y la tabla de nombres (0x3800, 0x300 bytes)
	call L_597C		;4721   ; la presentacion (estado 0, paso 0): borra, R#7 = 0x0F y las rachas de 0x9BF2
L_4724:
	jr L_479D		;4724
L_4726:
	ld a,(0f0f4h)		;4726   ; lee la marca de MSX2 (1 en el cartucho de MSX2, 0 en el de MSX1)
	and a			;4729
	jr nz,L_4738		;472a
	ld a,(0e203h)		;472c   ; lee la cuenta de cuadros
	rra			;472f   ; cada dos cuadros
	ret nc			;4730
	call L_59BA		;4731   ; un cuadro de la presentacion: una columna de 21 bytes de patrones cada vez (NZ mientras queden)
	ret nz			;4734
	xor a			;4735
	jr L_479A		;4736
L_4738:
	call L_59BA		;4738   ; un cuadro de la presentacion: una columna de 21 bytes de patrones cada vez (NZ mientras queden)
	ld a,(0e2c2h)		;473b
	or a			;473e
	ret z			;473f
	xor a			;4740
	jr L_479A		;4741
L_4743:
	ld hl,0e204h		;4743   ; cuenta 0xE204 y luego pasa a la demostracion
	dec (hl)			;4746
	ret nz			;4747
	call L_5B38		;4748   ; los atributos de los sprites (0xE800, 0x80 bytes) a 0xE0: fuera de la pantalla
	call L_4EEA		;474b   ; los atributos de los sprites (0x3B00, 0x80 bytes) a 0xE0: fuera de la pantalla
	call L_5A3D		;474e   ; las fuentes del marcador (otra forma): 0xAA29, 0xAA89, 0xABA1 y 0xABB1, con color 0xF0
	call L_5D84		;4751   ; el menu: borra, R#7 = 0 y la presentacion
	call L_41F2		;4754   ; pide el sonido 3
	xor a			;4757
	ld (0e2c2h),a		;4758
	jr L_479A		;475b
L_475D:
	call L_5DCB		;475d
	ld a,(0e2c2h)		;4760   ; 0xE2C2: acabada?
	or a			;4763
	ret z			;4764
	ld a,b			;4765   ; el paso
	jp L_4937		;4766
L_4769:
	ld a,(0e201h)		;4769   ; estado 1: el titulo y el menu, con una cuenta 0xE204
	or a			;476c
	jr nz,L_477B		;476d
	ld hl,0e204h		;476f   ; apunta a la espera del paso (en cuadros)
	dec (hl)			;4772
	jr z,L_4778		;4773
	jp L_4D58		;4775
L_4778:
	xor a			;4778
	jr L_479A		;4779
L_477B:
	ld hl,0e204h		;477b   ; apunta a la espera del paso (en cuadros)
	dec (hl)			;477e
	jr z,L_4785		;477f
	call nz,L_4D58		;4781   ; el letrero del jugador (1 o 2) que parpadea
	ret			;4784
L_4785:
	jp L_4935		;4785
L_4788:
	ld a,b			;4788   ; estado 2: la cortina; paso 0 pinta y espera 0x20 cuadros
	and a			;4789
	jr nz,L_47A2		;478a
	call L_4EC7		;478c   ; borra los sprites y la tabla de nombres (0x3800, 0x300 bytes)
	call L_41BD		;478f   ; pone el banco 12 en 0xA000
	call 0b9f7h		;4792   ; la demostracion: la fase de la tabla 0xBA20 (una de 6, 0xE219 va dando la vuelta)
	call L_4192		;4795   ; pone los bancos 1-2-3 (el juego)
	ld a,020h		;4798
L_479A:
	ld (0e204h),a		;479a   ; 0xE204 = A: la espera del paso siguiente
L_479D:
	ld hl,0e201h		;479d   ; el paso siguiente (0xE201 + 1)
	inc (hl)			;47a0
	ret			;47a1
L_47A2:
	call L_41BD		;47a2   ; al acabar, sin partida empezada vuelve al estado 0
	call 0ba4ch		;47a5   ; el mando de la demostracion: [teclas][cuadros] de la tabla de la piramide (0xBA78)
	call 0ba27h		;47a8   ; un cuadro de la demostracion: la partida con el mando grabado; si muere, se acaba
	call L_4192		;47ab   ; pone los bancos 1-2-3 (el juego)
	ld a,(0e246h)		;47ae   ; lee la marca de fase empezada
	or a			;47b1
	ret nz			;47b2
L_47B3:
	xor a			;47b3   ; pasa al estado A (0xE200) con el paso 0
L_47B4:
	ld l,a			;47b4
	ld h,000h		;47b5
	ld (0e200h),hl		;47b7   ; guarda el estado del juego (0 presentacion, 1 titulo, 3 menu, 4 empieza la fase, 5 juego, 6 se acaba la vida, 7 fin, 9 fase acabada, 0x0B editor, 0x0D final) y el byte siguiente (16 bits)
	ld a,020h		;47ba
	ld (0e204h),a		;47bc   ; guarda la espera del paso (en cuadros)
	jp L_493E		;47bf
L_47C2:
	ld a,b			;47c2   ; estado 3: el menu de empezar, por pasos
	call L_409E		;47c3   ; el despachador de Konami: la tabla va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_47C6: 12 destinos del despachador p00:409E (call en p00:47C3, el
;   indice en A): 47DE, 47E5, 483C, 4845, 4855, 4869, 486F, 487C, 4882, 4891,
;   4897, 48A9; lo leen p00:47C3 (24 bytes)
;   0x47c6..0x47de  (24 bytes)
DATA_tabla_47C6:
	defw 047deh,047e5h,0483ch,04845h,04855h,04869h,0486fh,0487ch	; 47c6
	defw 04882h,04891h,04897h,048a9h	; 47d6  -> L_4882 L_4891 L_4897 L_48A9

; ======================================================================
; CODIGO 0x47de..0x4c1b  (1085 bytes)
; ======================================================================


L_47DE:
	call L_4233		;47de   ; paso 0: el sonido 0x10 y espera
	ld a,070h		;47e1
	jr $-73		;47e3
L_47E5:
	ld hl,0e204h		;47e5   ; paso 1: hace parpadear el texto de empezar (cada 4 cuadros)
	dec (hl)			;47e8
	jr z,L_4802		;47e9
	ld a,(0e222h)		;47eb   ; lee el jugador (0 el 1, 1 el 2)
	and a			;47ee
	ld hl,05d35h		;47ef
	jr z,L_47F7		;47f2
	ld hl,05d3ch		;47f4
L_47F7:
	ld a,(0e204h)		;47f7   ; lee la espera del paso (en cuadros)
	and 004h		;47fa
	jp z,L_4F0B		;47fc
	jp L_4F0F		;47ff
L_4802:
	call L_4238		;4802   ; se elige: el sonido 0x11
	ld a,(0e222h)		;4805   ; 0xE222: con el segundo jugador...
	and a			;4808
	jr z,L_4814		;4809
	ld a,001h		;480b
	ld (0e25ah),a		;480d   ; guarda el paso del editor
	ld a,00bh		;4810   ; ...al estado 0x0B
	jr $-94		;4812
L_4814:
	ld a,(0f0f7h)		;4814   ; sin cartucho en la otra ranura (0xF0F7 = 0xFF) no hay menu de grabar
	inc a			;4817
	jr z,L_4836		;4818
	ld a,001h		;481a
	call 00141h		;481c   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix | la fila 1 del teclado
	cpl			;481f   ; si se pulsa la tecla de la fila 1, bit 5
	and 020h		;4820
	jr z,L_4836		;4822
	call L_4EC7		;4824   ; hay cartucho y se pulsa: el letrero del menu de 0xB284
	call L_41BD		;4827   ; pone el banco 12 en 0xA000
	ld hl,0b284h		;482a
	call L_4F0B		;482d   ; pinta un letrero: [D][E] y caracteres; 0xFE trae otra posicion; 0xFF acaba
	call L_4192		;4830   ; pone los bancos 1-2-3 (el juego)
	jp L_479D		;4833
L_4836:
	ld hl,0e201h		;4836   ; se salta dos pasos
	inc (hl)			;4839
	inc (hl)			;483a
	ret			;483b
L_483C:
	ld a,(0e207h)		;483c   ; espera la tecla de disparo (bit 4 de 0xE207)
	and 010h		;483f
	ret z			;4841
	jp L_479D		;4842
L_4845:
	xor a			;4845   ; paso 3: el menu de empezar (opciones 0 empezar, 1 contrasena, 2 la de 0x8AD5)
	ld (0e24ah),a		;4846   ; guarda lo elegido en el menu
	ld (0e254h),a		;4849   ; guarda la marca de partida del editor
	call L_5B38		;484c   ; los atributos de los sprites (0xE800, 0x80 bytes) a 0xE0: fuera de la pantalla
	call 06588h		;484f   ; el menu de grabar y cargar (estado 3): el letrero de 0xB185
	jp L_479D		;4852
L_4855:
	call 0659eh		;4855   ; un cuadro del menu; al elegir (0xE24A) se pasa al paso 0xE24B x 2 + 5
	ld hl,0e24ah		;4858   ; apunta a lo elegido en el menu
	ld a,(hl)			;485b
	and a			;485c
	ret z			;485d
	ld (hl),000h		;485e   ; y se borra
	ld a,(0e24bh)		;4860
	add a,a			;4863
	add a,005h		;4864
	jp L_493F		;4866
L_4869:
	call 06611h		;4869   ; la entrada (opcion 0 del menu, antes de empezar): graficos y paleta
	jp L_479D		;486c
L_486F:
	call 06639h		;486f   ; un cuadro de la entrada; con disparo se salta
	ld a,(0e24ah)		;4872   ; lee lo elegido en el menu
	and a			;4875
	ret z			;4876
	ld a,00bh		;4877
	jp L_493F		;4879
L_487C:
	call 0680ch		;487c   ; la pantalla de meter la contrasena: 0xEDD9-0xEDFE a cero y el letrero de 0xBE91
	jp L_479D		;487f
L_4882:
	call 06833h		;4882   ; un cuadro de la contrasena; tras el letrero de bien o mal, una espera (0xEDEC) y se sale con 0xEDED
	ld a,(0e24ah)		;4885   ; lee lo elegido en el menu
	and a			;4888
	ret z			;4889
	dec a			;488a
	jp nz,L_47B3		;488b
	jp L_4935		;488e
L_4891:
	call 08ad5h		;4891   ; la opcion 2 del menu de empezar: cargar una fase hecha con el editor
	jp L_479D		;4894
L_4897:
	call 08ae4h		;4897   ; un cuadro de cargar la fase del editor, por pasos (0xE25B)
	call L_564A		;489a   ; copia los 128 bytes de atributos de 0xE800 a 0x3B00 sin cambiar el orden
	ld a,(0e24ah)		;489d   ; lee lo elegido en el menu
	and a			;48a0
	ret z			;48a1
	dec a			;48a2
	jp z,L_4935		;48a3
	jp L_4BEB		;48a6
L_48A9:
	call L_4C02		;48a9   ; partida nueva: la RAM 0xE226-0xF000 a cero y los 6 bytes de 0x4C1B a 0xE240
	jp L_4935		;48ac
L_48AF:
	ld a,b			;48af   ; estado 4: empieza la fase; paso 0 pinta el letrero de la fase
	and a			;48b0
	jr nz,L_491C		;48b1
	call L_4EC7		;48b3   ; borra los sprites y la tabla de nombres (0x3800, 0x300 bytes)
	ld a,(0e254h)		;48b6   ; 0xE254: la partida es del editor
	and a			;48b9
	jr nz,L_48F8		;48ba
	ld hl,0e240h		;48bc   ; 0xE240: las vidas, en BCD
	ld a,(hl)			;48bf   ; las vidas
	sub 001h		;48c0   ; una vida menos
	daa			;48c2
	ld (hl),a			;48c3
	ld hl,05d0ah		;48c4   ; el letrero de la fase
	call L_4F0B		;48c7   ; pinta un letrero: [D][E] y caracteres; 0xFE trae otra posicion; 0xFF acaba
	ld de,09048h		;48ca   ; la fase, en 0x9048
	call L_4CF0		;48cd   ; pinta la fase (0xE242) en DE, dos cifras
	call L_41C7		;48d0   ; pone el banco 13 en 0xA000
	ld a,(0e242h)		;48d3   ; la fase x 3 + 2: su entrada en la tabla de 0xB8F8 (banco 13)
	ld b,a			;48d6
	add a,a			;48d7
	add a,b			;48d8
	add a,002h		;48d9   ; + 2: el tercer byte
	ld hl,0b8f8h		;48db
	call L_4094		;48de   ; suma A a HL (HL = HL + A)
	ld a,(hl)			;48e1
	and 01fh		;48e2   ; los 5 bits bajos
	call L_4CFE		;48e4   ; pasa A a BCD
	call L_4192		;48e7   ; pone los bancos 1-2-3 (el juego)
	ld hl,0efc0h		;48ea   ; y la cifra, en 0xA868
	ld (hl),a			;48ed
	ld b,001h		;48ee   ; un byte
	ld de,0a868h		;48f0
	call L_4D27		;48f3   ; pinta B bytes BCD de HL hacia atras en DE (con 0xF0F4 a 0, DE se pasa antes a direccion de la VRAM)
	jr L_4914		;48f6
L_48F8:
	xor a			;48f8   ; con el editor: sin vidas, 0xE245 = 0xFF y la piramide 1
	ld (0e240h),a		;48f9   ; guarda las vidas (BCD)
	dec a			;48fc
	ld (0e245h),a		;48fd   ; guarda los puntos de la proxima vida
	call L_43B6		;4900   ; la piramide de 0xE203: sus unidades en BCD + 1 a 0xE242
	ld a,001h		;4903
	ld (0e241h),a		;4905   ; guarda la piramide (1-6)
	ld hl,05d1fh		;4908
	call L_4F0B		;490b   ; pinta un letrero: [D][E] y caracteres; 0xFE trae otra posicion; 0xFF acaba
	ld de,06058h		;490e
	call 08621h		;4911
L_4914:
	ld a,078h		;4914   ; se espera 0x78 cuadros
	ld (0e204h),a		;4916   ; guarda la espera del paso (en cuadros)
	jp L_479D		;4919
L_491C:
	ld hl,0e204h		;491c   ; paso 1: al acabar la espera, la pantalla y la musica
	dec (hl)			;491f
	ret nz			;4920
	call L_4EC7		;4921   ; borra los sprites y la tabla de nombres (0x3800, 0x300 bytes)
	call L_4323		;4924   ; orden 0x83 (p04:61C2), con 0xE21A a 0xFF
	call L_5A8A		;4927   ; prepara la fase 0xE242 (con el editor, solo la pantalla)
	call L_431B		;492a   ; orden 0x82 (p04:61BB), con 0xE21A a cero
	call L_4390		;492d   ; si la musica esta quitada no se pone
	ld hl,0e246h		;4930   ; apunta a la marca de fase empezada
	ld (hl),001h		;4933
L_4935:
	ld a,020h		;4935
L_4937:
	ld (0e204h),a		;4937   ; 0xE204 = A y el estado siguiente
	ld hl,0e200h		;493a   ; apunta a el estado del juego (0 presentacion, 1 titulo, 3 menu, 4 empieza la fase, 5 juego, 6 se acaba la vida, 7 fin, 9 fase acabada, 0x0B editor, 0x0D final)
	inc (hl)			;493d
L_493E:
	xor a			;493e   ; con el paso 0
L_493F:
	ld (0e201h),a		;493f   ; 0xE201 = A
	ret			;4942
L_4943:
	ld a,(0e24ch)		;4943   ; estado 5: el juego
	and a			;4946
	jp nz,L_49E2		;4947
	ld hl,0e215h		;494a   ; 0xE215: la cuenta de la musica de la piramide
	ld a,(hl)			;494d
	and a			;494e
	jr z,L_4959		;494f
	dec a			;4951   ; baja la cuenta
	jr nz,L_4959		;4952
	ld (hl),000h		;4954
	call L_4390		;4956   ; al llegar a 1 vuelve la musica
L_4959:
	ld a,(0e24eh)		;4959   ; lee la marca del recuadro de estado
	and a			;495c
	jp nz,L_4A08		;495d
	ld a,(0e20ch)		;4960   ; lee las teclas: lo que se acaba de pulsar (bit 0 pausa, 1 recuadro, 3 musica, 4 disparo)
	and 010h		;4963
	jr nz,L_49A5		;4965
	call L_5B5A		;4967   ; un cuadro de la partida
	ld a,(0e248h)		;496a   ; 0xE248: se ha muerto
	and a			;496d
	ld a,008h		;496e
	jp nz,L_47B4		;4970
	ld a,(0e249h)		;4973   ; 0xE249: se ha salido de la fase
	and a			;4976
	jr nz,L_49B5		;4977
	ld a,(0e246h)		;4979   ; 0xE246: aun no ha empezado (sin pulsar)
	or a			;497c
	jr z,L_4935		;497d
	ld a,(0e20ch)		;497f   ; bit 0 de 0xE20C: la tecla de la pausa
	rra			;4982
	jr c,L_49C2		;4983
	rra			;4985   ; bit 1: la del recuadro de estado, solo con 0xF0F4 a 0 (en MSX2 vale 1: no sale)
	ret nc			;4986
	ld a,(0f0f4h)		;4987   ; lee la marca de MSX2 (1 en el cartucho de MSX2, 0 en el de MSX1)
	and a			;498a
	ret nz			;498b
	ld a,001h		;498c   ; 0xE24E = 1, se guarda el byte de 0x3B00 y se pinta el recuadro
	ld (0e24eh),a		;498e   ; guarda la marca del recuadro de estado
	ld hl,03b00h		;4991
	call 0004ah		;4994   ; BIOS RDVRM - Reads the content of VRAM
	ld (0e24fh),a		;4997
	ld a,0d0h		;499a
	call 0004dh		;499c   ; BIOS WRTVRM - Writes data in VRAM
	call L_4283		;499f   ; pide el sonido 0x20
	jp L_4D90		;49a2
L_49A5:
	ld a,(0e298h)		;49a5   ; bit 4 de 0xE20C: rendirse; si no esta muerto, muere (0xE280 = 4) con el sonido 0x28
	or a			;49a8
	ret nz			;49a9
	ld a,004h		;49aa
	ld (0e280h),a		;49ac   ; guarda el estado del personaje
	call 09018h		;49af
	jp L_42AB		;49b2
L_49B5:
	xor a			;49b5   ; sale de la fase: 0xE257 = 1 y al estado 9
	ld (0e249h),a		;49b6   ; guarda la marca de salida de la fase
	inc a			;49b9
	ld (0e257h),a		;49ba   ; guarda el paso de la secuencia en curso (entrada, fase o piramide acabada)
	ld a,009h		;49bd
	jp L_47B4		;49bf
L_49C2:
	ld a,(0e280h)		;49c2   ; la pausa (bit 0), salvo con 0xE280 a 4 o 5
	sub 004h		;49c5
	cp 002h		;49c7
	ret c			;49c9
	ld a,001h		;49ca
	ld (0e24ch),a		;49cc   ; guarda la marca de pausa
	ld (0e216h),a		;49cf
	call 09d06h		;49d2
	xor a			;49d5
	ld (0e2b0h),a		;49d6   ; 0xE2B0 a cero: la pausa desde el paso 0
	ld (0e2b3h),a		;49d9   ; guarda el dibujo del personaje en pausa
	call L_565F		;49dc   ; los dibujos del personaje (bancos 14-15)
	jp L_4317		;49df
L_49E2:
	call L_5E70		;49e2   ; en pausa: un cuadro de la pausa
	ld a,(0edc0h)		;49e5
	or a			;49e8
	ret nz			;49e9
	call 09c3eh		;49ea   ; la pausa: el personaje, por pasos (0xE2B0)
	call L_565F		;49ed   ; los dibujos del personaje (bancos 14-15)
	call 09d07h		;49f0
	call L_564A		;49f3   ; copia los 128 bytes de atributos de 0xE800 a 0x3B00 sin cambiar el orden
	ld a,(0e20ch)		;49f6   ; lee las teclas: lo que se acaba de pulsar (bit 0 pausa, 1 recuadro, 3 musica, 4 disparo)
	rra			;49f9   ; la tecla de la pausa (bit 0) la quita
	ret nc			;49fa
	xor a			;49fb
	ld (0e24ch),a		;49fc   ; guarda la marca de pausa
	ld (0e216h),a		;49ff
	call 09d06h		;4a02
	call L_4313		;4a05   ; orden 0x80 al motor de sonido (p04:61E4)
L_4A08:
	ld a,(0e20ch)		;4a08   ; con el recuadro puesto: se quita con la misma tecla
	rra			;4a0b
	rra			;4a0c
	ret nc			;4a0d
	xor a			;4a0e
	ld (0e24eh),a		;4a0f   ; guarda la marca del recuadro de estado
	ld hl,03b00h		;4a12
	ld a,(0e24fh)		;4a15   ; el byte de 0x3B00 vuelve
	call 0004dh		;4a18   ; BIOS WRTVRM - Writes data in VRAM
	jp L_4DCF		;4a1b
L_4A1E:
	xor a			;4a1e   ; estado 6: se acaba la vida
	ld (0e215h),a		;4a1f   ; guarda la cuenta para volver a poner la musica
	ld (0e255h),a		;4a22   ; guarda la marca de FESTIVAL (invencible: p02:9AB1 no mira los enemigos)
	ld a,(0e254h)		;4a25   ; lee la marca de partida del editor
	and a			;4a28
	jr nz,L_4A36		;4a29
	ld a,(0e240h)		;4a2b   ; lee las vidas (BCD)
	or a			;4a2e
	jr z,L_4A36		;4a2f
L_4A31:
	ld a,004h		;4a31
	jp L_47B4		;4a33
L_4A36:
	call L_422E		;4a36   ; pide el sonido 0x0F
L_4A39:
	ld a,007h		;4a39
	jp L_47B4		;4a3b
L_4A3E:
	ld a,b			;4a3e   ; estado 7: fin de la partida (GAME OVER); paso 0 pinta el letrero
	and a			;4a3f
	jr nz,L_4A70		;4a40
	call L_4EC7		;4a42   ; borra los sprites y la tabla de nombres (0x3800, 0x300 bytes)
	ld hl,05d43h		;4a45
	call L_4F0B		;4a48   ; pinta un letrero: [D][E] y caracteres; 0xFE trae otra posicion; 0xFF acaba
	ld a,(0e254h)		;4a4b   ; lee la marca de partida del editor
	ld b,a			;4a4e
	ld a,(0e217h)		;4a4f   ; lee la marca de TRYAGAIN (se puede seguir tras el fin de la partida)
	or b			;4a52
	ld (0e218h),a		;4a53   ; 0xE218: se puede seguir con F5
	ld hl,05d50h		;4a56   ; el letrero de seguir
	call nz,L_4F0B		;4a59   ; pinta un letrero: [D][E] y caracteres; 0xFE trae otra posicion; 0xFF acaba
	call L_4C8B		;4a5c   ; el marcador, solo con 0xF0F4 (en MSX2)
	xor a			;4a5f
	ld (0e247h),a		;4a60   ; guarda la marca de seguir tras el fin de la partida (F5)
	ld a,(0e254h)		;4a63   ; lee la marca de partida del editor
	and a			;4a66
	ld a,078h		;4a67   ; la espera: 0x78 cuadros (0xB4 con el editor)
	jr z,L_4A6D		;4a69
	ld a,0b4h		;4a6b
L_4A6D:
	jp L_479A		;4a6d
L_4A70:
	ld a,(0e218h)		;4a70   ; paso 1: espera; F5 (fila 7, bit 1) pone 0xE247 y se sigue
	and a			;4a73
	call nz,L_4ADC		;4a74
	ld a,(0e203h)		;4a77   ; lee la cuenta de cuadros
	rra			;4a7a   ; cada dos cuadros
	ret c			;4a7b
	ld hl,0e204h		;4a7c   ; apunta a la espera del paso (en cuadros)
	dec (hl)			;4a7f
	ret nz			;4a80
	ld a,(0e247h)		;4a81   ; lee la marca de seguir tras el fin de la partida (F5)
	and a			;4a84
	jr z,L_4AC4		;4a85   ; sin F5: se acaba
	ld hl,0e226h		;4a87   ; los puntos a cero
	xor a			;4a8a
	ld (hl),a			;4a8b
	inc l			;4a8c
	ld (hl),a			;4a8d
	inc l			;4a8e
	ld (hl),a			;4a8f
	inc a			;4a90   ; una vida
	ld (0e240h),a		;4a91   ; guarda las vidas (BCD)
	ld a,(0e254h)		;4a94   ; lee la marca de partida del editor
	and a			;4a97
	jr z,L_4AC4		;4a98
	ld a,(0f0f8h)		;4a9a   ; lee donde se graba la fase del editor (0 cinta, 1 disco, 2 Game Master 2)
	and a			;4a9d
	jr z,L_4ABD		;4a9e   ; en cinta: aparte
	call 08b16h		;4aa0
	call L_41E8		;4aa3   ; pide el sonido 1
	ld hl,0e278h		;4aa6   ; la extension del nombre: ELG
	ld (hl),045h		;4aa9   ; E
	inc hl			;4aab
	ld (hl),04ch		;4aac   ; L
	inc hl			;4aae
	ld (hl),047h		;4aaf   ; G
	ld a,005h		;4ab1
	ld (0e25bh),a		;4ab3   ; guarda el paso dentro del menu del editor
	ld hl,00a03h		;4ab6   ; estado 3 (el menu), paso 0x0A
	ld (0e200h),hl		;4ab9   ; guarda el estado del juego (0 presentacion, 1 titulo, 3 menu, 4 empieza la fase, 5 juego, 6 se acaba la vida, 7 fin, 9 fase acabada, 0x0B editor, 0x0D final) y el byte siguiente (16 bits)
	ret			;4abc
L_4ABD:
	ld hl,00903h		;4abd
	ld (0e200h),hl		;4ac0   ; guarda el estado del juego (0 presentacion, 1 titulo, 3 menu, 4 empieza la fase, 5 juego, 6 se acaba la vida, 7 fin, 9 fase acabada, 0x0B editor, 0x0D final) y el byte siguiente (16 bits)
	ret			;4ac3
L_4AC4:
	ld a,(0e247h)		;4ac4   ; lee la marca de seguir tras el fin de la partida (F5)
	and a			;4ac7
	jp nz,L_4A31		;4ac8
L_4ACB:
	xor a			;4acb
	ld (0e217h),a		;4acc   ; guarda la marca de TRYAGAIN (se puede seguir tras el fin de la partida)
	ld (0e254h),a		;4acf   ; guarda la marca de partida del editor
	ld hl,0e202h		;4ad2   ; apunta a las marcas de la partida (bit 6: se pueden sumar puntos)
	ld a,(hl)			;4ad5
	and 0bfh		;4ad6
	ld (hl),a			;4ad8
	jp L_47B3		;4ad9
L_4ADC:
	ld a,007h		;4adc
	call 00141h		;4ade   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	bit 1,a		;4ae1
	ret nz			;4ae3
	ld a,001h		;4ae4
	ld (0e247h),a		;4ae6   ; guarda la marca de seguir tras el fin de la partida (F5)
	ld hl,05d50h		;4ae9
	jp L_4F0F		;4aec
L_4AEF:
	xor a			;4aef   ; estado 8
	ld (0e24dh),a		;4af0   ; guarda la marca de borde sin pantalla al otro lado
	call L_5BF5		;4af3   ; pasa a la pantalla de al lado al salir por el borde 0xE248 (1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ld a,(0e24dh)		;4af6   ; lee la marca de borde sin pantalla al otro lado
	and a			;4af9
	jr nz,L_4B02		;4afa
	call 0ad2fh		;4afc   ; al entrar en una pantalla, se quitan los enemigos que esten a menos de 24 pixeles del personaje
	call L_5AEC		;4aff   ; pinta la pantalla en la que se esta: apaga, pinta y enciende
L_4B02:
	ld a,005h		;4b02
	jp L_47B4		;4b04
L_4B07:
	xor a			;4b07   ; estado 9: la fase acabada
	ld (0e215h),a		;4b08   ; guarda la cuenta para volver a poner la musica
	call 08ca3h		;4b0b   ; un cuadro de la fase acabada (estado 9), por pasos (0xE257)
	call L_564A		;4b0e   ; copia los 128 bytes de atributos de 0xE800 a 0x3B00 sin cambiar el orden
	ld a,(0e257h)		;4b11   ; lee el paso de la secuencia en curso (entrada, fase o piramide acabada)
	ld b,a			;4b14
	cp 004h		;4b15
	jr nz,L_4B27		;4b17
	ld a,(0e254h)		;4b19   ; lee la marca de partida del editor
	and a			;4b1c
	jp nz,L_4A39		;4b1d
	ld a,(0e242h)		;4b20   ; lee la fase (1-60)
	cp 03ch		;4b23   ; la fase 60 (0x3C) o mas: el final
	jr nc,L_4B40		;4b25
L_4B27:
	ld a,b			;4b27
	and a			;4b28
	ret nz			;4b29
	ld a,(0e242h)		;4b2a   ; lee la fase (1-60)
	call L_4CFE		;4b2d   ; pasa A a BCD
	and 00fh		;4b30   ; la cifra baja de la fase: 1 (fases 1, 11, 21...)
	dec a			;4b32
	jp nz,L_4A31		;4b33
	ld a,001h		;4b36
	ld (0e257h),a		;4b38   ; guarda el paso de la secuencia en curso (entrada, fase o piramide acabada)
	ld a,00ah		;4b3b   ; estado 0x0A: la piramide acabada
	jp L_47B4		;4b3d
L_4B40:
	ld a,001h		;4b40
	ld (0e257h),a		;4b42   ; guarda el paso de la secuencia en curso (entrada, fase o piramide acabada)
	call L_4EC7		;4b45   ; borra los sprites y la tabla de nombres (0x3800, 0x300 bytes)
	ld a,00dh		;4b48
	jp L_47B4		;4b4a
L_4B4D:
	call 06dc9h		;4b4d   ; estado 10: la piramide acabada
	ld a,(0e257h)		;4b50   ; lee el paso de la secuencia en curso (entrada, fase o piramide acabada)
	and a			;4b53
	ret nz			;4b54
	ld bc,0e201h		;4b55   ; R#1 = 0xE2
	call 00047h		;4b58   ; BIOS WRTVDP - Writes data in the VDP-register
	jp L_4A31		;4b5b
L_4B5E:
	call L_561D		;4b5e   ; estado 11: el editor
	call 0751ah		;4b61   ; el editor (estado 11), por pasos (0xE25A)
	call L_5649		;4b64
	ld a,(0e25ah)		;4b67   ; lee el paso del editor
	and a			;4b6a
	ret nz			;4b6b
	jp L_4BEB		;4b6c
L_4B6F:
	djnz L_4B79		;4b6f   ; estado 12
	ld hl,0e204h		;4b71   ; apunta a la espera del paso (en cuadros)
	dec (hl)			;4b74
	ret nz			;4b75
	jp L_479D		;4b76
L_4B79:
	djnz L_4B90		;4b79
	call L_41BD		;4b7b   ; pone el banco 12 en 0xA000
	call 0b530h		;4b7e   ; un cuadro del minijuego del sitio escondido (estado 12)
	call L_4192		;4b81   ; pone los bancos 1-2-3 (el juego)
	ld a,(0ef10h)		;4b84   ; lee el sitio escondido de la fase: tipo, paso, pantalla, y, x (0xEF10-0xEF15)
	or a			;4b87
	ret nz			;4b88
	ld hl,0e240h		;4b89   ; apunta a las vidas (BCD)
	inc (hl)			;4b8c
	jp L_4A31		;4b8d
L_4B90:
	call L_4EC7		;4b90   ; borra los sprites y la tabla de nombres (0x3800, 0x300 bytes)
	ld a,078h		;4b93
	call L_479A		;4b95   ; 0xE204 = A: la espera del paso siguiente
	call L_41D4		;4b98   ; pone los bancos 14-15 en 0x8000-0xBFFF
	ld hl,0a778h		;4b9b
	ld a,(0ef10h)		;4b9e   ; lee el sitio escondido de la fase: tipo, paso, pantalla, y, x (0xEF10-0xEF15)
	dec a			;4ba1   ; la entrada (tipo - 1) de la tabla 0xA778: su letrero
	add a,a			;4ba2
	call L_4094		;4ba3   ; suma A a HL (HL = HL + A)
	ld a,(hl)			;4ba6
	inc hl			;4ba7
	ld h,(hl)			;4ba8
	ld l,a			;4ba9
	call L_4F0B		;4baa   ; pinta un letrero: [D][E] y caracteres; 0xFE trae otra posicion; 0xFF acaba
	jp L_4192		;4bad
L_4BB0:
	call 06fdah		;4bb0   ; estado 13: el final
	ld a,(0e257h)		;4bb3   ; lee el paso de la secuencia en curso (entrada, fase o piramide acabada)
	and a			;4bb6
	ret nz			;4bb7
	jp L_4ACB		;4bb8
L_4BBB:
	ld a,(0e200h)		;4bbb   ; en los estados 0-2: las teclas de empezar (0xE221)
	cp 003h		;4bbe
	ret nc			;4bc0
	call L_4FD1		;4bc1   ; el mando: el puerto 1 del PSG (registro 14) y el teclado
	ld hl,0e221h		;4bc4
	call L_4FCA		;4bc7   ; (HL) = A; (HL - 1) = lo que no estaba pulsado antes
	or a			;4bca   ; nada pulsado: nada
	ret z			;4bcb
	ld hl,0e204h		;4bcc   ; apunta a la espera del paso (en cuadros)
	ld (hl),000h		;4bcf   ; la espera a 0
	ld l,(hl)			;4bd1
	ld de,0e222h		;4bd2   ; apunta a el jugador (0 el 1, 1 el 2)
	ld b,(hl)			;4bd5
	djnz L_4BEB		;4bd6
	and 030h		;4bd8   ; un boton (bits 4-5)?
	jr z,L_4BFD		;4bda
	ld a,040h		;4bdc   ; los puntos se suman
	ld (0e202h),a		;4bde   ; guarda las marcas de la partida (bit 6: se pueden sumar puntos)
	ld (hl),003h		;4be1
	inc hl			;4be3
	ld c,000h		;4be4
	ld (hl),c			;4be6
	dec c			;4be7
	jp L_4D62		;4be8
L_4BEB:
	ld hl,00001h		;4beb   ; al menu: estado 1 paso 0
	ld (0e200h),hl		;4bee   ; guarda el estado del juego (0 presentacion, 1 titulo, 3 menu, 4 empieza la fase, 5 juego, 6 se acaba la vida, 7 fin, 9 fase acabada, 0x0B editor, 0x0D final) y el byte siguiente (16 bits)
	call L_41E8		;4bf1   ; pide el sonido 1
	call L_5A3D		;4bf4   ; las fuentes del marcador (otra forma): 0xAA29, 0xAA89, 0xABA1 y 0xABB1, con color 0xF0
	call L_5D84		;4bf7   ; el menu: borra, R#7 = 0 y la presentacion
	jp L_5DA1		;4bfa
L_4BFD:
	ld a,(de)			;4bfd
	xor 001h		;4bfe
	ld (de),a			;4c00
	ret			;4c01
L_4C02:
	ld hl,0e226h		;4c02   ; partida nueva: la RAM 0xE226-0xF000 a cero y los 6 bytes de 0x4C1B a 0xE240
	ld bc,00ddah		;4c05   ; 0xDDA bytes
	ld d,h			;4c08
	ld e,l			;4c09
	inc e			;4c0a
	ld (hl),000h		;4c0b
	ldir		;4c0d
	ld hl,04c1bh		;4c0f
	ld de,0e240h		;4c12   ; apunta a las vidas (BCD)
	ld bc,00006h		;4c15
	ldir		;4c18
	ret			;4c1a

; ----------------------------------------------------------------------
; DATOS resto_4C1B: lo apuntan con el banco puesto p00:4C0F (0x4C1B); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p00:4C0F (6 bytes)
;   0x4c1b..0x4c21  (6 bytes)
DATA_resto_4C1B:
	defb 001h,001h,001h,000h,000h,003h	; 4c1b

; ======================================================================
; CODIGO 0x4c21..0x4dec  (459 bytes)
; ======================================================================


L_4C21:
	ld c,000h		;4c21   ; suma DE (BCD) a los puntos 0xE226-0xE228, si el bit 6 de 0xE202 lo deja
	ld a,(0e202h)		;4c23   ; lee las marcas de la partida (bit 6: se pueden sumar puntos)
	add a,a			;4c26
	ret p			;4c27
	ld hl,0e226h		;4c28   ; apunta a los puntos (3 bytes BCD)
	ld a,(hl)			;4c2b
	add a,e			;4c2c   ; las dos cifras bajas...
	daa			;4c2d
	ld (hl),a			;4c2e
	inc l			;4c2f
	ld a,(hl)			;4c30
	adc a,d			;4c31   ; ...con el acarreo
	daa			;4c32
	ld (hl),a			;4c33
	inc hl			;4c34
	ld a,(hl)			;4c35
	adc a,c			;4c36   ; la cifra alta con el acarreo
	daa			;4c37
	ld (hl),a			;4c38
	jr nc,L_4C48		;4c39   ; se pasa de 999999: se queda en 999999
	ld bc,09999h		;4c3b   ; el record: 999999
	ld (0e223h),bc		;4c3e   ; guarda el record (3 bytes BCD) y el byte siguiente (16 bits)
	ld (0e224h),bc		;4c42
	jr L_4CC1		;4c46
L_4C48:
	ex de,hl			;4c48   ; 0xE245: los puntos de la proxima vida
	ld hl,0e245h		;4c49   ; apunta a los puntos de la proxima vida
	cp (hl)			;4c4c
	jr c,L_4C70		;4c4d
	ld a,(hl)			;4c4f   ; la siguiente, 30000 mas
	add a,003h		;4c50
	daa			;4c52
	jr nc,L_4C57		;4c53
	ld a,0ffh		;4c55
L_4C57:
	ld (hl),a			;4c57
	push de			;4c58
	ld hl,0e240h		;4c59   ; una vida mas (hasta 99)
	ld a,(hl)			;4c5c
	cp 099h		;4c5d
	jr nc,L_4C65		;4c5f
	add a,001h		;4c61   ; una mas, en BCD
	daa			;4c63
	ld (hl),a			;4c64
L_4C65:
	call L_42B3		;4c65   ; el sonido de la vida
	ld a,(0f0f4h)		;4c68   ; lee la marca de MSX2 (1 en el cartucho de MSX2, 0 en el de MSX1)
	and a			;4c6b
	call nz,L_4D18		;4c6c
	pop de			;4c6f
L_4C70:
	ex de,hl			;4c70   ; record: si los puntos pasan al de 0xE223, se copian
	ld b,003h		;4c71
	ld de,0e225h		;4c73
L_4C76:
	ld a,(de)			;4c76   ; compara byte a byte los puntos con el record
	sub (hl)			;4c77
	jr c,L_4C80		;4c78   ; menos: se queda el record
	jr nz,L_4CC1		;4c7a   ; mas: se copian
	dec l			;4c7c
	dec e			;4c7d
	djnz L_4C76		;4c7e
L_4C80:
	ld bc,00003h		;4c80
	ld e,025h		;4c83
	ld l,028h		;4c85
	lddr		;4c87
	jr L_4CC1		;4c89
L_4C8B:
	ld a,(0f0f4h)		;4c8b   ; el marcador, solo con 0xF0F4 (en MSX2)
	and a			;4c8e
	ret z			;4c8f
	ld hl,000c0h		;4c90   ; un recuadro en (0, 0xC0) de 0xFF x 0x13, color 12
	ld c,00ch		;4c93
	ld de,0ff13h		;4c95
	call L_4F66		;4c98   ; en este cartucho no hace nada: aqui iria el pintor de caracteres de MSX2
	ld hl,05ce9h		;4c9b   ; el letrero del marcador
	call L_4F0B		;4c9e   ; pinta un letrero: [D][E] y caracteres; 0xFE trae otra posicion; 0xFF acaba
	call L_4CC1		;4ca1   ; pinta el record y los puntos
	call L_4D18		;4ca4
	ld a,(0e254h)		;4ca7   ; lee la marca de partida del editor
	and a			;4caa
	jr z,L_4CB6		;4cab
	ld hl,0e270h		;4cad   ; en el editor: el nombre de la fase en 0x90CA
	ld de,090cah		;4cb0
	jp 08624h		;4cb3
L_4CB6:
	jp L_4CED		;4cb6
L_4CB9:
	ld de,08848h		;4cb9
	ld hl,08858h		;4cbc
	jr L_4CC7		;4cbf
L_4CC1:
	ld de,018cah		;4cc1   ; pinta el record y los puntos
	ld hl,058cah		;4cc4
L_4CC7:
	push hl			;4cc7   ; el record (0xE223-0xE225) en DE
	ld hl,0e225h		;4cc8
	call L_4CD3		;4ccb
	pop hl			;4cce
	ex de,hl			;4ccf
	ld hl,0e228h		;4cd0   ; y los puntos (0xE226-0xE228) en HL
L_4CD3:
	ld b,003h		;4cd3
	jr L_4D27		;4cd5
L_4CD7:
	ld a,(0e254h)		;4cd7   ; lee la marca de partida del editor
	and a			;4cda
	jr z,L_4CE8		;4cdb
	ld hl,0e270h		;4cdd   ; apunta a el nombre de la fase del editor (11 letras)
	ld de,05068h		;4ce0
	ld b,005h		;4ce3
	jp 08626h		;4ce5
L_4CE8:
	ld de,06868h		;4ce8
	jr L_4CF0		;4ceb
L_4CED:
	ld de,0b0cah		;4ced
L_4CF0:
	ld a,(0e242h)		;4cf0   ; pinta la fase (0xE242) en DE, dos cifras
	call L_4CFE		;4cf3   ; pasa A a BCD
	ld hl,0efc0h		;4cf6   ; apunta a un dato de paso de la rutina en curso
	ld (hl),a			;4cf9
	ld b,001h		;4cfa
	jr L_4D27		;4cfc
L_4CFE:
	ld b,000h		;4cfe   ; pasa A a BCD
L_4D00:
	ld c,a			;4d00
	sub 00ah		;4d01
	jr c,L_4D08		;4d03
	inc b			;4d05
	jr L_4D00		;4d06
L_4D08:
	rlc b		;4d08   ; las decenas arriba
	rlc b		;4d0a
	rlc b		;4d0c
	rlc b		;4d0e
	ld a,b			;4d10
	or c			;4d11
	ret			;4d12
L_4D13:
	ld de,0a868h		;4d13   ; las vidas en 0xA868
	jr L_4D20		;4d16
L_4D18:
	ld a,(0f0f4h)		;4d18   ; lee la marca de MSX2 (1 en el cartucho de MSX2, 0 en el de MSX1)
	and a			;4d1b
	ret z			;4d1c
	ld de,0e0cah		;4d1d
L_4D20:
	ld hl,0e240h		;4d20   ; apunta a las vidas (BCD)
	ld b,001h		;4d23
	jr L_4D27		;4d25
L_4D27:
	ld a,(0f0f4h)		;4d27   ; pinta B bytes BCD de HL hacia atras en DE (con 0xF0F4 a 0, DE se pasa antes a direccion de la VRAM)
	and a			;4d2a
	ex de,hl			;4d2b
	call z,L_4D7C		;4d2c   ; pasa la posicion de caracter de HL a direccion de la VRAM
	ex de,hl			;4d2f
L_4D30:
	dec b			;4d30
	jr nz,L_4D35		;4d31
	ld c,0ffh		;4d33
L_4D35:
	inc b			;4d35
	ld a,(hl)			;4d36   ; la cifra alta...
	rra			;4d37
	rra			;4d38
	rra			;4d39
	rra			;4d3a
	call L_4D46		;4d3b   ; pinta la cifra baja de A (caracteres 0xD0-0xD9)
	ld a,(hl)			;4d3e   ; ...y la baja
	call L_4D46		;4d3f   ; pinta la cifra baja de A (caracteres 0xD0-0xD9)
	dec hl			;4d42   ; el byte anterior
	djnz L_4D30		;4d43
	ret			;4d45
L_4D46:
	and 00fh		;4d46   ; pinta la cifra baja de A (caracteres 0xD0-0xD9)
	add a,0d0h		;4d48
	jp L_4F2C		;4d4a
L_4D4D:
	add a,a			;4d4d   ; HL = la palabra A de la tabla de HL
	add a,l			;4d4e
	ld l,a			;4d4f
	jr nc,L_4D53		;4d50
	inc h			;4d52
L_4D53:
	ld a,(hl)			;4d53
	inc hl			;4d54
	ld h,(hl)			;4d55
	ld l,a			;4d56
	ret			;4d57
L_4D58:
	ld hl,0e204h		;4d58   ; el letrero del jugador (1 o 2) que parpadea
	bit 3,(hl)		;4d5b
	ld c,0ffh		;4d5d
	jr nz,L_4D62		;4d5f
	inc c			;4d61
L_4D62:
	ld hl,0388ch		;4d62
	ld de,0389ch		;4d65
	ld a,(0e222h)		;4d68   ; lee el jugador (0 el 1, 1 el 2)
	or a			;4d6b
	jr nz,L_4D6F		;4d6c
	ex de,hl			;4d6e
L_4D6F:
	push hl			;4d6f
	call L_4D76		;4d70
	pop de			;4d73
	ld c,000h		;4d74
L_4D76:
	ld hl,05d5fh		;4d76
	jp L_4F15		;4d79
L_4D7C:
	ld a,l			;4d7c   ; pasa la posicion de caracter de HL a direccion de la VRAM
	rra			;4d7d   ; la columna (x / 8) y la fila (y / 8)...
	rra			;4d7e
	rra			;4d7f
	rra			;4d80
	rr h		;4d81
	rra			;4d83
	rr h		;4d84
	rra			;4d86
	rr h		;4d87
	ld l,h			;4d89
	and 003h		;4d8a
	add a,038h		;4d8c   ; ...a 0x3800 + fila x 32 + columna (la tabla de nombres)
	ld h,a			;4d8e
	ret			;4d8f
L_4D90:
	ld hl,03908h		;4d90   ; el recuadro de estado: guarda la VRAM de 0x3908 (7 filas de 16) en 0xE880 y lo pinta
	ld de,0e880h		;4d93   ; apunta a lo que tapa el recuadro de estado; en las secuencias, el fundido de paleta en marcha (0 al acabar)
	ld bc,00710h		;4d96
L_4D99:
	push bc			;4d99
	ld b,000h		;4d9a
	call L_4DFC		;4d9c   ; lee B C bytes de la VRAM (LDIRMV) sin tocar registros
	ld a,010h		;4d9f   ; DE: 16 bytes mas
	call L_4099		;4da1   ; suma A a DE (DE = DE + A)
	ld a,020h		;4da4   ; HL: la fila siguiente de la VRAM (32 bytes)
	call L_4094		;4da6   ; suma A a HL (HL = HL + A)
	pop bc			;4da9
	djnz L_4D99		;4daa
	ld hl,03908h		;4dac
	ld bc,00710h		;4daf
L_4DB2:
	push bc			;4db2   ; una fila a cero
	xor a			;4db3
	ld b,a			;4db4
	call L_4E10		;4db5   ; llena BC bytes de la VRAM con A (BIGFIL)
	ld a,020h		;4db8   ; la siguiente: 32 mas alla
	call L_4094		;4dba   ; suma A a HL (HL = HL + A)
	pop bc			;4dbd
	djnz L_4DB2		;4dbe
	ld hl,05d62h		;4dc0
	call L_4F0B		;4dc3   ; pinta un letrero: [D][E] y caracteres; 0xFE trae otra posicion; 0xFF acaba
	call L_4D13		;4dc6   ; las vidas en 0xA868
	call L_4CD7		;4dc9
	jp L_4CB9		;4dcc
L_4DCF:
	ld de,03908h		;4dcf   ; devuelve lo guardado en 0xE880 a 0x3908
	ld hl,0e880h		;4dd2   ; apunta a lo que tapa el recuadro de estado; en las secuencias, el fundido de paleta en marcha (0 al acabar)
	ld bc,00710h		;4dd5
L_4DD8:
	push bc			;4dd8
	ld b,000h		;4dd9
	call L_4E06		;4ddb   ; escribe BC bytes en la VRAM (LDIRVM) sin tocar registros
	ld a,010h		;4dde   ; HL: 16 bytes mas
	call L_4094		;4de0   ; suma A a HL (HL = HL + A)
	ld a,020h		;4de3   ; DE: la fila siguiente de la VRAM (32 bytes)
	call L_4099		;4de5   ; suma A a DE (DE = DE + A)
	pop bc			;4de8
	djnz L_4DD8		;4de9
	ret			;4deb

; ----------------------------------------------------------------------
; DATOS sin identificar  0x4dec..0x4dfc  (16 bytes)
DATA_4DEC:
	defb 07ah,02fh,057h,07bh,02fh,05fh,013h,0c9h,07ch,02fh,067h,07dh,02fh,06fh,023h,0c9h	; 4dec  z/W{/_..|/g}/o#.

; ======================================================================
; CODIGO 0x4dfc..0x4e1a  (30 bytes)
; ======================================================================


L_4DFC:
	push hl			;4dfc   ; lee B C bytes de la VRAM (LDIRMV) sin tocar registros
	push de			;4dfd
	push bc			;4dfe
	call 00059h		;4dff   ; BIOS LDIRMV - Block transfers to memory from VRAM
	pop bc			;4e02
	pop de			;4e03
	pop hl			;4e04
	ret			;4e05
L_4E06:
	push hl			;4e06   ; escribe BC bytes en la VRAM (LDIRVM) sin tocar registros
	push de			;4e07
	push bc			;4e08
	call 0005ch		;4e09   ; BIOS LDIRVM - Block transfers to VRAM from memory
	pop bc			;4e0c
	pop de			;4e0d
	pop hl			;4e0e
	ret			;4e0f
L_4E10:
	push de			;4e10   ; llena BC bytes de la VRAM con A (BIGFIL)
	push af			;4e11
	push bc			;4e12
	call 00056h		;4e13   ; BIOS FILVRM - Fills VRAM with value
	pop bc			;4e16
	pop af			;4e17
	pop de			;4e18
	ret			;4e19

; ----------------------------------------------------------------------
; DATOS sin identificar  0x4e1a..0x4e20  (6 bytes)
DATA_4E1A:
	defb 0c5h,0cdh,047h,000h,0c1h,0c9h	; 4e1a

; ======================================================================
; CODIGO 0x4e20..0x4e59  (57 bytes)
; ======================================================================


L_4E20:
	ld c,000h		;4e20   ; rachas a la VRAM: [destino] y rachas; [n < 0x80] repite el byte siguiente n veces; [0x80 + n] copia n; [0x80] trae otro destino; 0 acaba
	ex de,hl			;4e22
	ld e,(hl)			;4e23
	inc hl			;4e24
	ld d,(hl)			;4e25
	inc hl			;4e26
	ex de,hl			;4e27
L_4E28:
	call 00053h		;4e28   ; BIOS SETWRT - Enables VDP to write
	exx			;4e2b
	ld a,(00007h)		;4e2c   ; C' = el puerto de datos del VDP (0x0007 de la BIOS)
	ld c,a			;4e2f
	exx			;4e30
L_4E31:
	ld a,(de)			;4e31   ; 0 acaba
	and a			;4e32
	ret z			;4e33
	inc de			;4e34
	ld b,a			;4e35
	and 07fh		;4e36
	cp b			;4e38
	jr z,L_4E4A		;4e39   ; bit 7 a cero: racha
	and a			;4e3b
	jr z,L_4E20		;4e3c   ; 0x80: otro destino
	ld b,a			;4e3e
L_4E3F:
	call L_4E89		;4e3f   ; copia n bytes
	exx			;4e42
	out (c),a		;4e43
	exx			;4e45
	djnz L_4E3F		;4e46
	jr L_4E31		;4e48
L_4E4A:
	call L_4E89		;4e4a   ; repite el byte n veces
L_4E4D:
	exx			;4e4d
	out (c),a		;4e4e
	exx			;4e50
	djnz L_4E4D		;4e51
	jr L_4E31		;4e53
L_4E55:
	ld c,000h		;4e55   ; lo mismo con el destino en HL
	jr L_4E28		;4e57

; ----------------------------------------------------------------------
; DATOS sin identificar  0x4e59..0x4e61  (8 bytes)
DATA_4E59:
	defb 00eh,001h,018h,0c5h,00eh,001h,018h,0c7h	; 4e59  ........

; ======================================================================
; CODIGO 0x4e61..0x4ef5  (148 bytes)
; ======================================================================


L_4E61:
	call L_4E6D		;4e61   ; copia C bloques de 16 bytes de HL a DE en la VRAM dandoles la vuelta (espejo)
	ld a,020h		;4e64
	call L_4099		;4e66   ; suma A a DE (DE = DE + A)
	dec c			;4e69
	jr nz,L_4E61		;4e6a
	ret			;4e6c
L_4E6D:
	push de			;4e6d
L_4E6E:
	ld b,010h		;4e6e
L_4E70:
	call 0004ah		;4e70   ; BIOS RDVRM - Reads the content of VRAM
	call L_4E8E		;4e73   ; le da la vuelta a los 8 bits de A
	ex de,hl			;4e76
	call 0004dh		;4e77   ; BIOS WRTVRM - Writes data in VRAM
	ex de,hl			;4e7a
	inc e			;4e7b   ; el byte siguiente
	inc hl			;4e7c
	djnz L_4E70		;4e7d
	ld a,e			;4e7f
	sub 020h		;4e80
	ld e,a			;4e82
	bit 4,e		;4e83
	jr z,L_4E6E		;4e85
	pop de			;4e87
	ret			;4e88
L_4E89:
	ld a,(de)			;4e89   ; lee un byte de DE; con el bit 0 de C le da la vuelta
	inc de			;4e8a
	bit 0,c		;4e8b
	ret z			;4e8d
L_4E8E:
	push bc			;4e8e   ; le da la vuelta a los 8 bits de A
	ld c,a			;4e8f
	ld b,008h		;4e90
L_4E92:
	rr c		;4e92
	rla			;4e94
	djnz L_4E92		;4e95
	pop bc			;4e97
	ret			;4e98
L_4E99:
	ld a,003h		;4e99   ; escribe BC bytes de HL en la VRAM de DE en los tres tercios (DE, DE + 0x800, DE + 0x1000)
L_4E9B:
	push af			;4e9b
	call L_4E06		;4e9c   ; escribe BC bytes en la VRAM (LDIRVM) sin tocar registros
	ld a,008h		;4e9f   ; 8 x 256 bytes: el tercio siguiente
	add a,d			;4ea1
	ld d,a			;4ea2
	pop af			;4ea3
	dec a			;4ea4
	jr nz,L_4E9B		;4ea5
	ret			;4ea7
L_4EA8:
	ld d,003h		;4ea8   ; llena BC bytes de la VRAM de HL con A en los tres tercios
L_4EAA:
	push af			;4eaa
	call L_4E10		;4eab   ; llena BC bytes de la VRAM con A (BIGFIL)
	ld a,008h		;4eae
	add a,h			;4eb0
	ld h,a			;4eb1
	pop af			;4eb2
	dec d			;4eb3
	jr nz,L_4EAA		;4eb4
	ret			;4eb6
L_4EB7:
	ld b,003h		;4eb7   ; rachas de DE a la VRAM de HL en los tres tercios (las mismas tres veces)
L_4EB9:
	push bc			;4eb9
	push de			;4eba
	call L_4E55		;4ebb   ; lo mismo con el destino en HL
	ld bc,00800h		;4ebe   ; el tercio siguiente
	add hl,bc			;4ec1
	pop de			;4ec2
	pop bc			;4ec3
	djnz L_4EB9		;4ec4
	ret			;4ec6
L_4EC7:
	call L_4EEA		;4ec7   ; borra los sprites y la tabla de nombres (0x3800, 0x300 bytes)
	ld hl,03800h		;4eca
	ld bc,00300h		;4ecd
	xor a			;4ed0
	jp L_4E10		;4ed1
L_4ED4:
	ld a,(0f3e0h)		;4ed4   ; enciende la pantalla (bit 6 de R#1)
	or 040h		;4ed7
	ld b,a			;4ed9
	ld c,001h		;4eda
	jp 00047h		;4edc   ; BIOS WRTVDP - Writes data in the VDP-register
L_4EDF:
	ld a,(0f3e0h)		;4edf   ; apaga la pantalla (bit 6 de R#1 a cero)
	and 0bfh		;4ee2
	ld b,a			;4ee4
	ld c,001h		;4ee5
	jp 00047h		;4ee7   ; BIOS WRTVDP - Writes data in the VDP-register
L_4EEA:
	ld hl,03b00h		;4eea   ; los atributos de los sprites (0x3B00, 0x80 bytes) a 0xE0: fuera de la pantalla
	ld bc,00080h		;4eed
	ld a,0e0h		;4ef0
	jp L_4E10		;4ef2

; ----------------------------------------------------------------------
; DATOS sin identificar  0x4ef5..0x4f0b  (22 bytes)
DATA_4EF5:
	defb 03ah,0e7h,0ffh,0f6h,002h,047h,00eh,008h,0c3h,047h,000h,03ah,0e7h,0ffh,0e6h,0fdh	; 4ef5  :....G...G.:....
	defb 047h,00eh,008h,0c3h,047h,000h	; 4f05

; ======================================================================
; CODIGO 0x4f0b..0x4fa7  (156 bytes)
; ======================================================================


L_4F0B:
	ld c,0ffh		;4f0b   ; pinta un letrero: [D][E] y caracteres; 0xFE trae otra posicion; 0xFF acaba
	jr L_4F11		;4f0d
L_4F0F:
	ld c,000h		;4f0f   ; lo mismo, borrando (caracter 0)
L_4F11:
	ld d,(hl)			;4f11
	inc hl			;4f12
	ld e,(hl)			;4f13
	inc hl			;4f14
L_4F15:
	ld a,(0f0f4h)		;4f15   ; lee la marca de MSX2 (1 en el cartucho de MSX2, 0 en el de MSX1)
	and a			;4f18
	ex de,hl			;4f19
	call z,L_4D7C		;4f1a   ; pasa la posicion de caracter de HL a direccion de la VRAM
	ex de,hl			;4f1d
L_4F1E:
	ld a,(hl)			;4f1e
	inc hl			;4f1f
	ld b,a			;4f20   ; 0xFF acaba
	inc b			;4f21
	ret z			;4f22
	inc b			;4f23   ; 0xFE trae otra posicion
	jr z,L_4F11		;4f24
	and c			;4f26   ; el caracter, con la mascara de C
	call L_4F2C		;4f27   ; pinta el caracter A: en MSX1 lo escribe en la tabla de nombres (DE) y avanza
	jr L_4F1E		;4f2a
L_4F2C:
	push af			;4f2c   ; pinta el caracter A: en MSX1 lo escribe en la tabla de nombres (DE) y avanza
	ld a,(0f0f4h)		;4f2d   ; lee la marca de MSX2 (1 en el cartucho de MSX2, 0 en el de MSX1)
	and a			;4f30
	jr nz,L_4F3B		;4f31
	pop af			;4f33
	ex de,hl			;4f34
	call 0004dh		;4f35   ; BIOS WRTVRM - Writes data in VRAM
	ex de,hl			;4f38
	inc de			;4f39
	ret			;4f3a
L_4F3B:
	pop af			;4f3b   ; en MSX2 (0xF0F4): esta llamada es la de MSX2 y aqui solo hay un ret (p00:4F66)
	call L_4F66		;4f3c   ; pinta el caracter A en (D, E) y avanza 8 pixeles
	ld a,d			;4f3f
	add a,008h		;4f40
	ld d,a			;4f42
	ret			;4f43
L_4F44:
	ld a,01ch		;4f44   ; fila siguiente: 0x1C caracteres mas alla
	call L_4099		;4f46   ; suma A a DE (DE = DE + A)
	jr L_4F50		;4f49
L_4F4B:
	ex de,hl			;4f4b   ; lo mismo con la posicion de caracter en DE
	call L_4D7C		;4f4c   ; pasa la posicion de caracter de HL a direccion de la VRAM
	ex de,hl			;4f4f
L_4F50:
	ld a,(hl)			;4f50   ; pinta caracteres hasta 0xFF; 0xFE pasa a la fila de abajo
	inc hl			;4f51
	ld b,a			;4f52
	inc b			;4f53   ; 0xFF acaba
	ret z			;4f54
	inc b			;4f55   ; 0xFE: la fila de abajo
	jr z,L_4F44		;4f56
	call L_4F2C		;4f58   ; pinta el caracter A: en MSX1 lo escribe en la tabla de nombres (DE) y avanza
	jr L_4F50		;4f5b
L_4F5D:
	ld a,d			;4f5d   ; 8 pixeles a la derecha; al dar la vuelta, 8 mas abajo
	add a,008h		;4f5e
	ld d,a			;4f60
	ret nz			;4f61
	ld a,e			;4f62
	add a,008h		;4f63
	ld e,a			;4f65
L_4F66:
	ret			;4f66   ; en este cartucho no hace nada: aqui iria el pintor de caracteres de MSX2
L_4F67:
	ld a,004h		;4f67   ; arranca el sonido y la pantalla: la VRAM a cero y SCREEN 2 (los registros de 0x4FA7)
	ld (07000h),a		;4f69   ; el mapper: pone en 0x6000 el banco de A
	inc a			;4f6c
	ld (09000h),a		;4f6d   ; el mapper: pone en 0x8000 el banco de A
	inc a			;4f70
	ld (0b000h),a		;4f71   ; el mapper: pone en 0xA000 el banco de A
	call 06000h		;4f74   ; p04:6000: el sonido a punto
	ld a,(0f0f1h)		;4f77   ; lee el banco puesto en 0x6000
	ld (07000h),a		;4f7a   ; el mapper: pone en 0x6000 el banco de A
	ld a,(0f0f2h)		;4f7d   ; lee el banco puesto en 0x8000
	ld (09000h),a		;4f80   ; el mapper: pone en 0x8000 el banco de A
	ld a,(0f0f3h)		;4f83   ; lee el banco puesto en 0xA000
	ld (0b000h),a		;4f86   ; el mapper: pone en 0xA000 el banco de A
	call 06cebh		;4f89   ; 0x6CEB del banco 1
	ld hl,00000h		;4f8c   ; la VRAM entera a cero (16 KB)
	ld bc,04000h		;4f8f
	xor a			;4f92
	call L_4E10		;4f93   ; llena BC bytes de la VRAM con A (BIGFIL)
L_4F96:
	ld hl,04fa7h		;4f96   ; los 8 registros del VDP de la tabla 0x4FA7 (SCREEN 2)
	ld d,008h		;4f99
	ld c,000h		;4f9b
L_4F9D:
	ld b,(hl)			;4f9d
	call 00047h		;4f9e   ; BIOS WRTVDP - Writes data in the VDP-register
	inc hl			;4fa1
	inc c			;4fa2
	dec d			;4fa3
	jr nz,L_4F9D		;4fa4
	ret			;4fa6   ; no hace nada

; ----------------------------------------------------------------------
; DATOS resto_4FA7: lo apuntan con el banco puesto p00:4F96 (0x4FA7); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p00:4F96 (8 bytes)
;   0x4fa7..0x4faf  (8 bytes)
DATA_resto_4FA7:
	defb 002h,0e2h,00eh,07fh,007h,076h,003h,0efh	; 4fa7  .....v..

; ======================================================================
; CODIGO 0x4faf..0x5088  (217 bytes)
; ======================================================================


L_4FAF:
	call L_4FD1		;4faf   ; lee los mandos: 0xE207/0xE208 (cursores y disparo) y 0xE20C/0xE20D (las teclas)
	call L_4FC7		;4fb2   ; 0xE207 = lo pulsado, 0xE208 = lo que se acaba de pulsar
	call L_500C		;4fb5   ; las teclas de 0x500C
	ld hl,0e20dh		;4fb8   ; apunta a las teclas: lo pulsado
	call L_4FCA		;4fbb   ; (HL) = A; (HL - 1) = lo que no estaba pulsado antes
	ld a,(0e200h)		;4fbe   ; en el editor (estado 0x0B), sus teclas
	cp 00bh		;4fc1
	jp z,082e7h		;4fc3
	ret			;4fc6
L_4FC7:
	ld hl,0e208h		;4fc7   ; guarda A en 0xE208 y deja en 0xE207 lo recien pulsado
L_4FCA:
	ld c,(hl)			;4fca   ; (HL) = A; (HL - 1) = lo que no estaba pulsado antes
	ld (hl),a			;4fcb
	xor c			;4fcc
	and (hl)			;4fcd
	dec hl			;4fce
	ld (hl),a			;4fcf
	ret			;4fd0
L_4FD1:
	ld e,08fh		;4fd1   ; el mando: el puerto 1 del PSG (registro 14) y el teclado
	ld a,00fh		;4fd3   ; registro 15 del PSG = 0x8F: el puerto 1
	call 00093h		;4fd5   ; BIOS WRTPSG - Writes data to PSG-register
	ld a,00eh		;4fd8
	di			;4fda
	call 00096h		;4fdb   ; BIOS RDPSG - Reads value from PSG-register | RDPSG 14: los botones del mando
	ei			;4fde   ; y la interrupcion otra vez
	cpl			;4fdf   ; bits 0-5: arriba, abajo, izquierda, derecha y los dos botones
	and 03fh		;4fe0
	push af			;4fe2
	ld a,004h		;4fe3   ; la fila 4 del teclado (SNSMAT)
	call 00141h		;4fe5   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;4fe8   ; pulsada: 1
	rlca			;4fe9
	rlca			;4fea
	rlca			;4feb
	and 020h		;4fec   ; su bit 2 (la tecla M) al bit 5, como el segundo boton
	ld e,a			;4fee
	ld a,008h		;4fef   ; la fila 8: los cursores y el espacio
	call 00141h		;4ff1   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;4ff4   ; pulsadas: 1
	rrca			;4ff5
	rrca			;4ff6
	ld b,a			;4ff7
	and 004h		;4ff8   ; la izquierda (bit 4) al bit 2
	or e			;4ffa
	ld c,a			;4ffb
	ld a,b			;4ffc
	rrca			;4ffd
	rrca			;4ffe
	ld b,a			;4fff
	and 018h		;5000   ; los cursores y el espacio, a los mismos bits que el mando
	or c			;5002
	ld c,a			;5003
	ld a,b			;5004
	rrca			;5005
	and 003h		;5006
	or c			;5008
	pop bc			;5009   ; junto con el mando
	or b			;500a
	ret			;500b
L_500C:
	ld a,006h		;500c   ; las teclas de funcion: filas 6 y 7
	call 00141h		;500e   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;5011   ; pulsadas: 1
	and 0e0h		;5012   ; F1-F3 (bits 5-7)
	ld e,a			;5014
	ld a,007h		;5015   ; la fila 7
	call 00141h		;5017   ; BIOS SNSMAT - Returns the value of the specified line from the keyboard matrix
	cpl			;501a   ; pulsadas: 1
	ld b,a			;501b
	and 003h		;501c   ; F4-F5 (bits 0-1)
	or e			;501e
	rlca			;501f
	rlca			;5020
	rlca			;5021   ; bits 0-2: F1-F3; bits 3-4: F4-F5
	and 01fh		;5022
	ld e,a			;5024
	ld a,b			;5025
	and 080h		;5026   ; bit 7: RETURN
	or e			;5028
	ld e,a			;5029
	ld a,b			;502a
	rlca			;502b
	rlca			;502c
	rlca			;502d
	rlca			;502e
	and 040h		;502f   ; bit 6: ESC
	or e			;5031
	ret			;5032
L_5033:
	ld a,(ix+000h)		;5033   ; carga graficos: fichas de 6 bytes [tercios][colores][caracter][patrones], un 0 acaba
	and a			;5036
	ret z			;5037
	rra			;5038   ; bit 0: el tercio de abajo (0x1000)
	ld de,01000h		;5039
	call c,L_505A		;503c   ; un tercio: las rachas de colores a 0x2000 + 8 x caracter y las de patrones a 8 x caracter
	bit 1,(ix+000h)		;503f   ; bit 1: el del medio (0x0800)
	ld de,00800h		;5043
	call nz,L_505A		;5046   ; un tercio: las rachas de colores a 0x2000 + 8 x caracter y las de patrones a 8 x caracter
	bit 2,(ix+000h)		;5049   ; bit 2: el de arriba (0x0000)
	ld de,00000h		;504d
	call nz,L_505A		;5050   ; un tercio: las rachas de colores a 0x2000 + 8 x caracter y las de patrones a 8 x caracter
	ld de,00006h		;5053   ; la ficha siguiente
	add ix,de		;5056
	jr L_5033		;5058
L_505A:
	ld l,(ix+003h)		;505a   ; un tercio: las rachas de colores a 0x2000 + 8 x caracter y las de patrones a 8 x caracter
	ld h,000h		;505d   ; el caracter x 8
	add hl,hl			;505f
	add hl,hl			;5060
	add hl,hl			;5061
	add hl,de			;5062
	push hl			;5063
	ld de,02000h		;5064   ; la tabla de colores
	add hl,de			;5067
	ld e,(ix+001h)		;5068   ; las rachas de colores (IX+01)
	ld d,(ix+002h)		;506b
	push ix		;506e
	call L_4E55		;5070   ; lo mismo con el destino en HL
	pop ix		;5073
	pop hl			;5075
	ld de,00000h		;5076   ; la de patrones
	add hl,de			;5079
	ld e,(ix+004h)		;507a   ; las de patrones (IX+04)
	ld d,(ix+005h)		;507d
	push ix		;5080
	call L_4E55		;5082   ; lo mismo con el destino en HL
	pop ix		;5085
	ret			;5087

; ----------------------------------------------------------------------
; DATOS sin identificar  0x5088..0x519e  (278 bytes)
DATA_5088:
	defb 0ddh,07eh,000h,0a7h,0c8h,0ddh,05eh,002h,0afh,0cbh,013h,017h,032h,0c0h,0efh,0ddh	; 5088  .~....^.....2...
	defb 06eh,003h,07dh,032h,0c3h,0efh,0cdh,0a8h,050h,011h,004h,000h,0ddh,019h,018h,0e0h	; 5098  n.}2....P.......
	defb 026h,000h,029h,029h,029h,022h,0c1h,0efh,0cdh,04fh,051h,03ah,0c0h,0efh,0a7h,0f5h	; 50a8  &.)))"...OQ:....
	defb 0cch,0efh,050h,0f1h,0c4h,0c2h,050h,0c3h,005h,051h,021h,000h,0e8h,011h,007h,0e8h	; 50b8  ..P...P..Q!.....
	defb 0cdh,0d1h,050h,021h,000h,0eah,011h,007h,0eah,0d9h,03ah,0c3h,0efh,047h,0d9h,006h	; 50c8  ..P!......:..G..
	defb 004h,04eh,01ah,077h,079h,012h,023h,01bh,010h,0f7h,023h,023h,023h,023h,03eh,00ch	; 50d8  .N.wy.#...####>.
	defb 0cdh,099h,040h,0d9h,010h,0e8h,0c9h,021h,000h,0e8h,0edh,05bh,0c1h,0efh,006h,008h	; 50e8  ..@....!...[....
	defb 0cbh,01eh,08fh,010h,0fbh,077h,023h,01bh,07ah,0b3h,020h,0f2h,0c9h,0ddh,0cbh,002h	; 50f8  .....w#.z. .....
	defb 05eh,011h,000h,010h,0c4h,021h,051h,0ddh,0cbh,002h,066h,011h,000h,008h,0c4h,021h	; 5108  ^....!Q...f....!
	defb 051h,0ddh,0cbh,002h,06eh,011h,000h,000h,0c8h,0ddh,0e5h,0ddh,06eh,001h,026h,000h	; 5118  Q...n.......n.&.
	defb 029h,029h,029h,019h,0e5h,011h,000h,020h,019h,011h,000h,0e8h,0ebh,0edh,04bh,0c1h	; 5128  ))).... ......K.
	defb 0efh,0cdh,006h,04eh,0e1h,011h,000h,000h,019h,011h,000h,0eah,0ebh,0edh,04bh,0c1h	; 5138  ...N..........K.
	defb 0efh,0cdh,006h,04eh,0ddh,0e1h,0c9h,0edh,04bh,0c1h,0efh,0ddh,06eh,000h,026h,000h	; 5148  ...N....K...n.&.
	defb 029h,029h,029h,0e5h,011h,000h,020h,0ddh,0cbh,002h,056h,020h,00ah,016h,028h,0ddh	; 5158  )))... ...V ..(.
	defb 0cbh,002h,04eh,020h,002h,016h,030h,019h,011h,000h,0e8h,0ddh,0e5h,0cdh,059h,000h	; 5168  ..N ..0.......Y.
	defb 0ddh,0e1h,0e1h,011h,000h,000h,0ddh,0cbh,002h,056h,020h,00ah,016h,008h,0ddh,0cbh	; 5178  .........V .....
	defb 002h,04eh,020h,002h,016h,010h,019h,011h,000h,0eah,0edh,04bh,0c1h,0efh,0ddh,0e5h	; 5188  .N ........K....
	defb 0cdh,059h,000h,0ddh,0e1h,0c9h	; 5198

; ======================================================================
; CODIGO 0x519e..0x5377  (473 bytes)
; ======================================================================


L_519E:
	ld a,(ix+000h)		;519e   ; copia sprites a la VRAM: [n x 32 bytes][dibujo][puntero], 0 acaba
	and a			;51a1
	ret z			;51a2
	ld l,a			;51a3   ; n x 32: los bytes
	ld h,000h		;51a4
	add hl,hl			;51a6
	add hl,hl			;51a7
	add hl,hl			;51a8
	add hl,hl			;51a9
	add hl,hl			;51aa
	ld c,l			;51ab   ; BC = cuantos bytes
	ld b,h			;51ac
	ld l,(ix+001h)		;51ad   ; el dibujo x 8
	ld h,000h		;51b0
	add hl,hl			;51b2
	add hl,hl			;51b3
	add hl,hl			;51b4
	ld de,0f800h		;51b5   ; la tabla de dibujos de los sprites: 0xF800 en MSX2 (0xF0F4), 0x1800 en MSX1
	ld a,(0f0f4h)		;51b8   ; lee la marca de MSX2 (1 en el cartucho de MSX2, 0 en el de MSX1)
	and a			;51bb
	jr nz,L_51C1		;51bc
	ld de,01800h		;51be   ; en MSX1: 0x1800
L_51C1:
	add hl,de			;51c1
	ex de,hl			;51c2
	ld l,(ix+002h)		;51c3
	ld h,(ix+003h)		;51c6   ; HL = los bytes
	call L_4E06		;51c9   ; escribe BC bytes en la VRAM (LDIRVM) sin tocar registros
	ld de,00004h		;51cc   ; 4 bytes por entrada
	add ix,de		;51cf
	jr L_519E		;51d1
L_51D3:
	ld a,(ix+000h)		;51d3   ; copia sprites dados la vuelta: [tipo][n][de][a]; un 0 acaba
	dec a			;51d6
	ret m			;51d7
	push af			;51d8
	ld a,(0f0f4h)		;51d9   ; lee la marca de MSX2 (1 en el cartucho de MSX2, 0 en el de MSX1)
	and a			;51dc
	ld bc,0f800h		;51dd
	jr nz,L_51E5		;51e0
	ld bc,01800h		;51e2
L_51E5:
	pop af			;51e5
	push af			;51e6
	push bc			;51e7
	call z,L_51F7		;51e8   ; tipo 1: dados la vuelta de arriba abajo
	pop bc			;51eb
	pop af			;51ec
	call nz,L_5263		;51ed   ; tipo 2 o mas: de izquierda a derecha
	ld bc,00004h		;51f0   ; el siguiente (4 bytes)
	add ix,bc		;51f3
	jr L_51D3		;51f5
L_51F7:
	ld a,(ix+001h)		;51f7   ; n sprites del dibujo de a, dados la vuelta de arriba abajo, al dibujo de
	or a			;51fa   ; cuantos
	ret z			;51fb
	ld (0efd0h),a		;51fc   ; a 0xEFD0
	ld l,(ix+002h)		;51ff   ; de donde: el dibujo x 8
	ld h,000h		;5202
	add hl,hl			;5204
	add hl,hl			;5205
	add hl,hl			;5206
	add hl,bc			;5207
	ld (0efd2h),hl		;5208
	ld l,(ix+003h)		;520b   ; a donde
	ld h,000h		;520e
	add hl,hl			;5210
	add hl,hl			;5211
	add hl,hl			;5212
	add hl,bc			;5213
	ld (0efd4h),hl		;5214
L_5217:
	ld hl,(0efd2h)		;5217   ; un sprite: sus 32 bytes a 0xEF80
	ld de,0ef80h		;521a   ; apunta a el bufer de un caracter o un sprite
	ld bc,00020h		;521d
	call L_4DFC		;5220   ; lee B C bytes de la VRAM (LDIRMV) sin tocar registros
	call L_524B		;5223   ; al reves
	ld de,(0efd4h)		;5226
	ld hl,0efa0h		;522a
	ld bc,00020h		;522d
	call L_4E06		;5230   ; y a la VRAM
	ld bc,00020h		;5233   ; los 32 bytes siguientes
	ld hl,(0efd2h)		;5236
	add hl,bc			;5239
	ld (0efd2h),hl		;523a
	ld hl,(0efd4h)		;523d
	add hl,bc			;5240
	ld (0efd4h),hl		;5241
	ld hl,0efd0h		;5244   ; hasta n
	dec (hl)			;5247
	jr nz,L_5217		;5248
	ret			;524a
L_524B:
	ld hl,0ef80h		;524b   ; da la vuelta a las 16 filas de cada mitad del sprite (0xEF80 -> 0xEFA0)
	ld de,0efafh		;524e
	call L_525A		;5251
	ld hl,0ef90h		;5254
	ld de,0efbfh		;5257
L_525A:
	ld b,010h		;525a
L_525C:
	ld a,(hl)			;525c   ; un byte al reves
	ld (de),a			;525d
	inc hl			;525e
	dec de			;525f
	djnz L_525C		;5260
	ret			;5262
L_5263:
	ld a,(ix+001h)		;5263   ; n sprites de izquierda a derecha (p00:4E61)
	or a			;5266
	ret z			;5267
	ld l,(ix+003h)		;5268   ; a donde: el dibujo x 8...
	ld h,000h		;526b
	add hl,hl			;526d
	add hl,hl			;526e
	add hl,hl			;526f
	add hl,bc			;5270
	ld a,010h		;5271   ; ...+ 16
	call L_4094		;5273   ; suma A a HL (HL = HL + A)
	ex de,hl			;5276
	ld l,(ix+002h)		;5277   ; de donde: el dibujo x 8
	ld h,000h		;527a
	add hl,hl			;527c
	add hl,hl			;527d
	add hl,hl			;527e
	add hl,bc			;527f
	ld c,(ix+001h)		;5280   ; C = cuantos
	jp L_4E61		;5283
L_5286:
	call L_41B3		;5286   ; la presentacion de MSX1: dos rachas a los tres tercios y el titulo
	ld de,08934h		;5289
	ld hl,022c0h		;528c
	call L_4EB7		;528f   ; rachas de DE a la VRAM de HL en los tres tercios (las mismas tres veces)
	ld de,08baah		;5292
	ld hl,002c0h		;5295
	call L_4EB7		;5298   ; rachas de DE a la VRAM de HL en los tres tercios (las mismas tres veces)
	ld de,09625h		;529b
	ld a,(0002bh)		;529e   ; el titulo segun la BIOS: con 0x002B (el juego de caracteres) japones, 0x9438; si no, 0x9625
	and 00fh		;52a1
	jr nz,L_52A8		;52a3
	ld de,09438h		;52a5
L_52A8:
	ld hl,02008h		;52a8
	call L_4EB7		;52ab   ; rachas de DE a la VRAM de HL en los tres tercios (las mismas tres veces)
	ld de,098ffh		;52ae   ; y sus colores: 0x9756 (japones) o 0x98FF
	ld a,(0002bh)		;52b1
	and 00fh		;52b4
	jr nz,L_52BB		;52b6
	ld de,09756h		;52b8
L_52BB:
	ld hl,00008h		;52bb
	call L_4EB7		;52be   ; rachas de DE a la VRAM de HL en los tres tercios (las mismas tres veces)
	call L_4192		;52c1   ; pone los bancos 1-2-3 (el juego)
	ld a,(0002bh)		;52c4   ; en el japones, ademas las rachas de 0xBB21 (bancos 14-15)
	and 00fh		;52c7
	jr nz,L_52D7		;52c9
	call L_41D4		;52cb   ; pone los bancos 14-15 en 0x8000-0xBFFF
	ld de,0bb21h		;52ce
	call L_4E20		;52d1   ; rachas a la VRAM: [destino] y rachas; [n < 0x80] repite el byte siguiente n veces; [0x80 + n] copia n; [0x80] trae otro destino; 0 acaba
	call L_4192		;52d4   ; pone los bancos 1-2-3 (el juego)
L_52D7:
	xor a			;52d7   ; 32 columnas de caracteres
	call L_5758		;52d8   ; 32 columnas de 23 caracteres de la tabla 0xABE7, desde la entrada A
	call L_41B3		;52db   ; el letrero: 0x99E9 (japones) o 0x9A54
	ld hl,09a54h		;52de
	ld a,(0002bh)		;52e1
	and 00fh		;52e4
	jr nz,L_52EB		;52e6
	ld hl,099e9h		;52e8
L_52EB:
	call L_4F0B		;52eb   ; pinta un letrero: [D][E] y caracteres; 0xFE trae otra posicion; 0xFF acaba
	jp L_4192		;52ee
L_52F1:
	call L_41B3		;52f1   ; rachas de DE a 0x0008 en los tres tercios, con los bancos 7-8-9
	ld hl,00008h		;52f4
	call L_4EB7		;52f7   ; rachas de DE a la VRAM de HL en los tres tercios (las mismas tres veces)
	jp L_4192		;52fa
L_52FD:
	call L_41B3		;52fd   ; los graficos de la piramide: su lista y la comun
	call L_5309		;5300   ; la lista de la piramide 0xE241 (tabla 0x6005, desde la entrada 1)
	call L_5318		;5303   ; la lista comun (0x6000)
	jp L_4192		;5306
L_5309:
	ld a,(0e241h)		;5309   ; la lista de la piramide 0xE241 (tabla 0x6005, desde la entrada 1)
	ld hl,06005h		;530c
	call L_4D4D		;530f   ; HL = la palabra A de la tabla de HL
	push hl			;5312
	pop ix		;5313
	jp L_5033		;5315
L_5318:
	ld ix,06000h		;5318   ; la lista comun (0x6000)
	jp L_5033		;531c
L_531F:
	call L_41D4		;531f   ; los dibujos de los sprites: rachas de 0xB61D a 0x1800
	ld hl,01800h		;5322
	ld de,0b61dh		;5325
	call L_4E55		;5328   ; lo mismo con el destino en HL
	jp L_4192		;532b
L_532E:
	call L_41D4		;532e   ; los sprites de las listas 0xA799 y 0xA7BA
	ld ix,0a799h		;5331
	call L_519E		;5335   ; copia sprites a la VRAM: [n x 32 bytes][dibujo][puntero], 0 acaba
	ld ix,0a7bah		;5338
	call L_51D3		;533c   ; copia sprites dados la vuelta: [tipo][n][de][a]; un 0 acaba
	jp L_4192		;533f
L_5342:
	call L_41B8		;5342   ; la fuente: 424 bytes de 0xAFDD a 0x2008 de los tres tercios, de color 0xF1
	ld bc,00d07h		;5345   ; R#7 = 0x0D
	call 00047h		;5348   ; BIOS WRTVDP - Writes data in the VDP-register
	ld hl,0afddh		;534b
	ld de,02008h		;534e
	ld bc,001a8h		;5351
	call L_4E99		;5354   ; escribe BC bytes de HL en la VRAM de DE en los tres tercios (DE, DE + 0x800, DE + 0x1000)
	ld hl,00008h		;5357
	ld a,0f1h		;535a
	ld bc,001a8h		;535c
	call L_4EA8		;535f   ; llena BC bytes de la VRAM de HL con A en los tres tercios
	call L_4192		;5362   ; pone los bancos 1-2-3 (el juego)
	jp L_41BD		;5365
L_5368:
	ld hl,0ef13h		;5368   ; el dibujo de 2 x 2 caracteres del sitio escondido (0x5377) en la posicion de 0xEF13
	ld e,(hl)			;536b   ; E = 0xEF13...
	inc l			;536c
	ld d,(hl)			;536d   ; ...D = 0xEF14
	ld hl,05377h		;536e
	ld bc,00202h		;5371
	jp L_53D6		;5374

; ----------------------------------------------------------------------
; DATOS resto_5377: lo apuntan con el banco puesto p00:536E (0x5377); el
;   tamano es lo que hay hasta lo siguiente, no sale de recorrerlo; lo leen
;   p00:536E (4 bytes)
;   0x5377..0x537b  (4 bytes)
DATA_resto_5377:
	defb 05dh,05eh,05fh,08ch	; 5377

; ======================================================================
; CODIGO 0x537b..0x56cf  (852 bytes)
; ======================================================================


L_537B:
	ld c,002h		;537b   ; una cosa de 2 x B caracteres de la piramide en (D, E)
L_537D:
	call L_41D4		;537d   ; pone los bancos 14-15 en 0x8000-0xBFFF
L_5380:
	push bc			;5380   ; C columnas...
	push de			;5381
	ld b,c			;5382
L_5383:
	call L_5397		;5383   ; ...de B caracteres
	ld a,d			;5386   ; 8 pixeles a la derecha
	add a,008h		;5387
	ld d,a			;5389
	djnz L_5383		;538a
	pop de			;538c
	ld a,e			;538d   ; la fila siguiente
	add a,008h		;538e
	ld e,a			;5390
	pop bc			;5391
	djnz L_5380		;5392
	jp L_4192		;5394
L_5397:
	ld a,(0e241h)		;5397   ; pinta un caracter de los grabados de la piramide (tabla de 0x7FFE)
	ld hl,07ffeh		;539a
	call L_4D4D		;539d   ; HL = la palabra A de la tabla de HL
	ld a,(0e242h)		;53a0   ; fases impares y pares: la segunda mitad de la tabla (+0x20)
	rra			;53a3
	ld a,020h		;53a4
	jr c,L_53A9		;53a6
	xor a			;53a8
L_53A9:
	call L_4094		;53a9   ; suma A a HL (HL = HL + A)
	ld a,e			;53ac   ; la fila del caracter dentro del bloque de 4 x 4 (y & 0x18)
	and 018h		;53ad
	ld c,a			;53af
	ld a,d			;53b0   ; y la columna (x / 8 & 7)
	srl a		;53b1
	srl a		;53b3
	srl a		;53b5
	and 007h		;53b7
	add a,c			;53b9
	call L_4094		;53ba   ; suma A a HL (HL = HL + A)
	ld a,(hl)			;53bd   ; el caracter, pintado
	jp L_53EF		;53be
L_53C1:
	ld b,002h		;53c1   ; lee 2 x 2 bytes de la VRAM de HL a DE (NRDVRM)
L_53C3:
	call 0004ah		;53c3   ; BIOS RDVRM - Reads the content of VRAM
	ld (de),a			;53c6
	inc hl			;53c7
	inc de			;53c8
	call 0004ah		;53c9   ; BIOS RDVRM - Reads the content of VRAM
	ld (de),a			;53cc
	ld a,01fh		;53cd   ; la fila siguiente de la VRAM (32 - 1)
	call L_4094		;53cf   ; suma A a HL (HL = HL + A)
	inc de			;53d2
	djnz L_53C3		;53d3
	ret			;53d5
L_53D6:
	push bc			;53d6   ; un rectangulo de caracteres de HL: B filas de C, en la tabla de nombres
	push de			;53d7
	ld b,c			;53d8
L_53D9:
	ld a,(hl)			;53d9   ; una fila
	push hl			;53da
	call L_53EF		;53db   ; escribe el caracter A en la posicion D, E de la tabla de nombres
	pop hl			;53de
	ld a,d			;53df   ; 8 pixeles a la derecha
	add a,008h		;53e0
	ld d,a			;53e2
	inc hl			;53e3   ; el caracter siguiente
	djnz L_53D9		;53e4
	pop de			;53e6
	ld a,e			;53e7   ; la fila siguiente, 8 pixeles mas abajo
	add a,008h		;53e8
	ld e,a			;53ea
	pop bc			;53eb
	djnz L_53D6		;53ec
L_53EE:
	ret			;53ee
L_53EF:
	push af			;53ef   ; escribe el caracter A en la posicion D, E de la tabla de nombres
	ld l,e			;53f0
	ld h,d			;53f1
	call L_4D7C		;53f2   ; pasa la posicion de caracter de HL a direccion de la VRAM
	pop af			;53f5
	jp 0004dh		;53f6   ; BIOS WRTVRM - Writes data in VRAM
L_53F9:
	call L_41B3		;53f9   ; prepara un fundido: la lista 0x9422 + 5 x A
	ld hl,09422h		;53fc
	ld b,a			;53ff
	add a,a			;5400
	add a,a			;5401
	add a,b			;5402
	call L_4094		;5403   ; suma A a HL (HL = HL + A)
L_5406:
	ld (0edd0h),hl		;5406   ; 0xEDD0 = la lista, 0xEDD2 = 0 (el paso)
	xor a			;5409
	ld (0edd2h),a		;540a
	jp L_4192		;540d
L_5410:
	call L_41B3		;5410   ; prepara un fundido de la tabla 0x9432
	ld hl,09432h		;5413
	call L_4D4D		;5416   ; HL = la palabra A de la tabla de HL
	jr L_5406		;5419
L_541B:
	call L_41B3		;541b   ; un cuadro del fundido de entrada, por pasos (0xEDD2)
	call L_5424		;541e   ; paso 0: patrones a 0 y colores 0xF0; paso 1: los patrones aparecen poco a poco; paso 2: los colores
	jp L_4192		;5421
L_5424:
	ld a,(0edd2h)		;5424   ; paso 0: patrones a 0 y colores 0xF0; paso 1: los patrones aparecen poco a poco; paso 2: los colores
	dec a			;5427
	jr z,L_544D		;5428
	dec a			;542a
	jr z,L_5467		;542b
	xor a			;542d   ; primero los patrones a cero...
	ld (0edd3h),a		;542e
	ld c,000h		;5431
	call L_547C		;5433   ; pasa la lista 0xEDD0 por la mascara C (patrones o colores segun 0xEDD3)
	ld a,001h		;5436   ; ...y los colores a 0xF0
	ld (0edd3h),a		;5438
	ld c,0f0h		;543b
	call L_547C		;543d   ; pasa la lista 0xEDD0 por la mascara C (patrones o colores segun 0xEDD3)
	ld a,001h		;5440
	ld (0edd5h),a		;5442
	ld (0edd4h),a		;5445
L_5448:
	ld hl,0edd2h		;5448
	inc (hl)			;544b
	ret			;544c
L_544D:
	xor a			;544d   ; paso 1: los patrones con una mascara que crece (0xEDD5: 1, 0x09, 0x49... hasta 0xFF)
	ld (0edd3h),a		;544e
	ld a,(0edd5h)		;5451   ; la mascara de 0xEDD5
	ld c,a			;5454
	call L_547C		;5455   ; pasa la lista 0xEDD0 por la mascara C (patrones o colores segun 0xEDD3)
	ld hl,0edd5h		;5458
	ld a,(hl)			;545b
	cp 0ffh		;545c   ; a 0xFF: aparte
	jr z,L_5448		;545e
	rlca			;5460   ; girada 3 bits...
	rlca			;5461
	rlca			;5462
	or 001h		;5463   ; ...con el bit 0
	ld (hl),a			;5465
	ret			;5466
L_5467:
	ld a,001h		;5467   ; paso 2: los colores de verdad, y se acaba
	ld (0edd3h),a		;5469
	ld c,0ffh		;546c
	call L_547C		;546e   ; pasa la lista 0xEDD0 por la mascara C (patrones o colores segun 0xEDD3)
	xor a			;5471
	ld (0edd4h),a		;5472
	ld (0edd5h),a		;5475
	ld (0edd2h),a		;5478
	ret			;547b
L_547C:
	ld ix,(0edd0h)		;547c   ; pasa la lista 0xEDD0 por la mascara C (patrones o colores segun 0xEDD3)
L_5480:
	ld a,(ix+000h)		;5480
	and a			;5483
	ret z			;5484
	rra			;5485
	ld de,01000h		;5486
	call c,L_54A7		;5489   ; un tercio con la mascara
	bit 1,(ix+000h)		;548c
	ld de,00800h		;5490
	call nz,L_54A7		;5493   ; un tercio con la mascara
	bit 2,(ix+000h)		;5496
	ld de,00000h		;549a
	call nz,L_54A7		;549d   ; un tercio con la mascara
	ld de,00006h		;54a0
	add ix,de		;54a3
	jr L_5480		;54a5
L_54A7:
	ld l,(ix+003h)		;54a7   ; un tercio con la mascara
	ld h,000h		;54aa   ; el caracter x 8
	add hl,hl			;54ac
	add hl,hl			;54ad
	add hl,hl			;54ae
	add hl,de			;54af
	ld a,(0edd3h)		;54b0   ; 0xEDD3 = 1: los patrones
	dec a			;54b3
	jr z,L_54C3		;54b4
	ld de,02000h		;54b6   ; si no: los colores (+0x2000)
	add hl,de			;54b9
	ld e,(ix+001h)		;54ba
	ld d,(ix+002h)		;54bd
	jp L_54CD		;54c0
L_54C3:
	ld de,00000h		;54c3
	add hl,de			;54c6
	ld e,(ix+004h)		;54c7
	ld d,(ix+005h)		;54ca
L_54CD:
	call L_5611		;54cd   ; SETWRT con HL, C' = el puerto de datos del VDP, sin tocar A
L_54D0:
	ld a,(de)			;54d0   ; las rachas con la mascara: cada byte AND C
	and a			;54d1
	ret z			;54d2
	inc de			;54d3
	ld b,a			;54d4
	and 07fh		;54d5
	cp b			;54d7
	jr z,L_54F2		;54d8
	ld b,a			;54da
L_54DB:
	ld a,(de)			;54db
	and c			;54dc   ; con la mascara
	inc de			;54dd
	exx			;54de
	out (c),a		;54df   ; a la VRAM
	exx			;54e1
	ld a,(0edd3h)		;54e2   ; en los colores no gira
	and a			;54e5
	jr nz,L_54EE		;54e6
	rrc c		;54e8   ; en los patrones, la mascara gira 3 bits por byte (asi se ve como puntos sueltos)
	rrc c		;54ea
	rrc c		;54ec
L_54EE:
	djnz L_54DB		;54ee
	jr L_54D0		;54f0
L_54F2:
	ld a,(de)			;54f2
	inc de			;54f3
L_54F4:
	push af			;54f4
	and c			;54f5   ; con la mascara
	exx			;54f6
	out (c),a		;54f7   ; a la VRAM
	exx			;54f9
	ld a,(0edd3h)		;54fa   ; en los colores no gira
	and a			;54fd
	jr nz,L_5506		;54fe
	rrc c		;5500   ; en los patrones gira 3 bits
	rrc c		;5502
	rrc c		;5504
L_5506:
	pop af			;5506
	djnz L_54F4		;5507
	jr L_54D0		;5509
L_550B:
	call L_41B3		;550b   ; un cuadro del fundido de salida, por pasos
	call L_5514		;550e   ; paso 0: los patrones se borran poco a poco con la mascara de 0xEDD5
	jp L_4192		;5511
L_5514:
	ld a,(0edd2h)		;5514   ; paso 0: los patrones se borran poco a poco con la mascara de 0xEDD5
	dec a			;5517   ; 1: aparte
	jr z,L_553F		;5518
	dec a			;551a   ; 2: aparte
	jr z,L_5558		;551b
	xor a			;551d   ; los patrones (0xEDD3 = 0) con la mascara 0xFF
	ld (0edd3h),a		;551e
	ld c,0ffh		;5521
	call L_556D		;5523   ; borra con la mascara C los bytes de la lista de fundido (fichas de 4 bytes)
	ld a,001h		;5526   ; los colores (0xEDD3 = 1) con la mascara 0xF0
	ld (0edd3h),a		;5528
	ld c,0f0h		;552b
	call L_556D		;552d   ; borra con la mascara C los bytes de la lista de fundido (fichas de 4 bytes)
	ld a,0ffh		;5530   ; 0xEDD5 = 0xFF
	ld (0edd5h),a		;5532
	ld a,001h		;5535   ; el paso 1
	ld (0edd4h),a		;5537
L_553A:
	ld hl,0edd2h		;553a
	inc (hl)			;553d
	ret			;553e
L_553F:
	xor a			;553f   ; 0xEDD3 = 0
	ld (0edd3h),a		;5540
	ld a,(0edd5h)		;5543   ; la mascara de 0xEDD5
	ld c,a			;5546
	call L_556D		;5547   ; borra con la mascara C los bytes de la lista de fundido (fichas de 4 bytes)
	ld hl,0edd5h		;554a
	ld a,(hl)			;554d   ; a 0: se acaba
	and a			;554e
	jr z,L_553A		;554f
	rlca			;5551   ; la mascara, 3 bits girada...
	rlca			;5552
	rlca			;5553
	res 0,a		;5554   ; ...sin el bit 0
	ld (hl),a			;5556
	ret			;5557
L_5558:
	ld a,001h		;5558   ; paso 2: todo a cero, y se acaba
	ld (0edd3h),a		;555a
	ld c,000h		;555d
	call L_556D		;555f   ; borra con la mascara C los bytes de la lista de fundido (fichas de 4 bytes)
	xor a			;5562
	ld (0edd4h),a		;5563
	ld (0edd5h),a		;5566
	ld (0edd2h),a		;5569
	ret			;556c
L_556D:
	ld ix,(0edd0h)		;556d   ; borra con la mascara C los bytes de la lista de fundido (fichas de 4 bytes)
L_5571:
	ld a,(ix+000h)		;5571
	and a			;5574
	ret z			;5575
	rra			;5576
	ld de,01000h		;5577
	call c,L_5598		;557a   ; un tercio: [tercios][caracter][cuantos bytes]
	bit 1,(ix+000h)		;557d
	ld de,00800h		;5581
	call nz,L_5598		;5584   ; un tercio: [tercios][caracter][cuantos bytes]
	bit 2,(ix+000h)		;5587
	ld de,00000h		;558b
	call nz,L_5598		;558e   ; un tercio: [tercios][caracter][cuantos bytes]
	ld de,00004h		;5591
	add ix,de		;5594
	jr L_5571		;5596
L_5598:
	ld l,(ix+001h)		;5598   ; un tercio: [tercios][caracter][cuantos bytes]
	ld h,000h		;559b   ; el caracter x 8
	add hl,hl			;559d
	add hl,hl			;559e
	add hl,hl			;559f
	add hl,de			;55a0
	ld a,(0edd3h)		;55a1   ; 0xEDD3 = 1: los patrones (0x0000)...
	dec a			;55a4
	ld de,00000h		;55a5
	jr z,L_55AD		;55a8
	ld de,02000h		;55aa   ; ...si no: los colores (0x2000)
L_55AD:
	add hl,de			;55ad
	ld e,(ix+002h)		;55ae
	ld d,(ix+003h)		;55b1
L_55B4:
	push hl			;55b4   ; cada byte de la VRAM AND C
	push hl			;55b5
	call 0004ah		;55b6   ; BIOS RDVRM - Reads the content of VRAM
	and c			;55b9
	pop hl			;55ba
	call 0004dh		;55bb   ; BIOS WRTVRM - Writes data in VRAM
	ld a,(0edd3h)		;55be
	and a			;55c1
	jr nz,L_55CA		;55c2
	rrc c		;55c4
	rrc c		;55c6
	rrc c		;55c8
L_55CA:
	pop hl			;55ca
	inc hl			;55cb   ; el siguiente
	dec de			;55cc   ; hasta DE
	ld a,e			;55cd
	or d			;55ce
	jr nz,L_55B4		;55cf
	ret			;55d1
L_55D2:
	call L_41B3		;55d2   ; rachas de 0x9A8F a la tabla de nombres (0x38C3)
	ld hl,038c3h		;55d5
	ld de,09a8fh		;55d8
	call L_4E55		;55db   ; lo mismo con el destino en HL
	call L_4192		;55de   ; pone los bancos 1-2-3 (el juego)
	jp L_41BD		;55e1
L_55E4:
	call L_41B3		;55e4   ; los graficos de las musicas: rachas de 0x926A y 0x93C3 a los tres tercios
	ld de,0926ah		;55e7
	ld hl,02008h		;55ea
	call L_4EB7		;55ed   ; rachas de DE a la VRAM de HL en los tres tercios (las mismas tres veces)
	ld de,093c3h		;55f0
	ld hl,00008h		;55f3
	call L_4EB7		;55f6   ; rachas de DE a la VRAM de HL en los tres tercios (las mismas tres veces)
	call L_4192		;55f9   ; vuelven los bancos 1-2-3 y el 12 en 0xA000
	jp L_41BD		;55fc
L_55FF:
	call L_41D4		;55ff   ; los dibujos de los sprites: rachas de 0xBA96 a 0x1800
	ld hl,01800h		;5602
	ld de,0ba96h		;5605
	call L_4E55		;5608   ; lo mismo con el destino en HL
	call L_4192		;560b   ; pone los bancos 1-2-3 (el juego)
	jp L_41BD		;560e
L_5611:
	ex af,af'			;5611   ; SETWRT con HL, C' = el puerto de datos del VDP, sin tocar A
	call 00053h		;5612   ; BIOS SETWRT - Enables VDP to write
	exx			;5615
	ld a,(00007h)		;5616
	ld c,a			;5619
	exx			;561a
	ex af,af'			;561b
	ret			;561c
L_561D:
	ld hl,03b00h		;561d   ; copia a la VRAM los 32 sprites en otro orden cada cuadro (asi parpadean en vez de desaparecer)
	call 00053h		;5620   ; BIOS SETWRT - Enables VDP to write
	ld a,(00007h)		;5623
	ld c,a			;5626
	ld hl,0e20bh		;5627   ; 0xE20B: por donde se empieza, + 0x1C cada cuadro
	ld a,(hl)			;562a
	add a,01ch		;562b
	and 07ch		;562d
	ld (hl),a			;562f
	ld e,a			;5630
	ld d,020h		;5631
L_5633:
	ld a,e			;5633   ; un sprite: sus 4 bytes de atributos de 0xE800
	ld hl,0e800h		;5634   ; apunta a los atributos de los sprites (y, x, dibujo, color); al cargar graficos, su bufer
	add a,l			;5637
	ld l,a			;5638
	ld b,004h		;5639
L_563B:
	outi		;563b
	jp nz,L_563B		;563d
	ld a,e			;5640   ; el siguiente, 12 bytes mas alla
	add a,00ch		;5641
	and 07ch		;5643
	ld e,a			;5645
	dec d			;5646
	jr nz,L_5633		;5647
L_5649:
	ret			;5649
L_564A:
	ld hl,03b00h		;564a   ; copia los 128 bytes de atributos de 0xE800 a 0x3B00 sin cambiar el orden
	call 00053h		;564d   ; BIOS SETWRT - Enables VDP to write
	ld a,(00007h)		;5650
	ld c,a			;5653
	ld hl,0e800h		;5654   ; apunta a los atributos de los sprites (y, x, dibujo, color); al cargar graficos, su bufer
	ld b,080h		;5657
L_5659:
	outi		;5659
	jp nz,L_5659		;565b
	ret			;565e
L_565F:
	call L_41D4		;565f   ; los dibujos del personaje (bancos 14-15)
	call L_5668		;5662   ; segun lo que lleva (tabla 0x84D7) y hacia donde mira, sus rachas a 0x1800
	jp L_4192		;5665
L_5668:
	ld a,(0e24ch)		;5668   ; segun lo que lleva (tabla 0x84D7) y hacia donde mira, sus rachas a 0x1800
	or a			;566b
	jr nz,L_56A0		;566c
	ld a,(0e298h)		;566e   ; lee la marca de personaje muerto
	or a			;5671
	jr nz,L_5690		;5672
	ld hl,084d7h		;5674
	ld a,(0e287h)		;5677   ; lee la postura del personaje
	call L_4D4D		;567a   ; HL = la palabra A de la tabla de HL
	ld a,(0e285h)		;567d   ; lee el dibujo del personaje (direccion y paso)
	cp 00ah		;5680   ; las direcciones 10 y 11 usan las de la 8 y la 9
	jr c,L_5686		;5682
	sub 002h		;5684
L_5686:
	call L_4D4D		;5686   ; HL = la palabra A de la tabla de HL
	ld de,01800h		;5689
	ex de,hl			;568c
	jp L_4E55		;568d
L_5690:
	ld a,(0e285h)		;5690   ; muerto: la tabla 0x8589 por la direccion
	ld hl,08589h		;5693
	call L_4D4D		;5696   ; HL = la palabra A de la tabla de HL
	ld de,01800h		;5699
	ex de,hl			;569c
	jp L_4E55		;569d
L_56A0:
	ld a,(0e2b3h)		;56a0   ; en pausa: la tabla 0x8597 por 0xE2B3
	ld hl,08597h		;56a3
	call L_4D4D		;56a6   ; HL = la palabra A de la tabla de HL
	ld de,01800h		;56a9
	ex de,hl			;56ac
	jp L_4E55		;56ad
L_56B0:
	call L_41D4		;56b0   ; rachas de 0xA6D8 a 0x1880 (sprites)
	call L_56B9		;56b3
	jp L_4192		;56b6
L_56B9:
	ld hl,01880h		;56b9
	ld de,0a6d8h		;56bc
	jp L_4E55		;56bf
L_56C2:
	call L_41B3		;56c2   ; los graficos de la lista 0x814B (la entrada)
	ld ix,0814bh		;56c5
L_56C9:
	call L_5033		;56c9   ; carga graficos: fichas de 6 bytes [tercios][colores][caracter][patrones], un 0 acaba
	jp L_4192		;56cc

; ----------------------------------------------------------------------
; DATOS sin identificar  0x56cf..0x56d8  (9 bytes)
DATA_56CF:
	defb 0cdh,0b3h,041h,0ddh,021h,066h,081h,018h,0f1h	; 56cf  ..A.!f...

; ======================================================================
; CODIGO 0x56d8..0x5930  (600 bytes)
; ======================================================================


L_56D8:
	call L_41B3		;56d8   ; los de la lista 0x8175
	ld ix,08175h		;56db
	jr $-22		;56df
L_56E1:
	call L_41B3		;56e1   ; los de la lista 0x815F
	ld ix,0815fh		;56e4
	jr $-31		;56e8
L_56EA:
	ld de,01818h		;56ea   ; 12 x 12 caracteres de 0xAB57 en (0x18, 0x18)
L_56ED:
	call L_41D4		;56ed   ; 12 x 12 caracteres de 0xAB57 en (D, E)
	ld hl,0ab57h		;56f0
	ld bc,00c0ch		;56f3
	call L_53D6		;56f6   ; un rectangulo de caracteres de HL: B filas de C, en la tabla de nombres
	jp L_4192		;56f9
L_56FC:
	call L_41D4		;56fc   ; 12 x 12 de 0xAAC7
	ld hl,0aac7h		;56ff
L_5702:
	ld de,05020h		;5702
	ld bc,00c0ch		;5705
	call L_53D6		;5708   ; un rectangulo de caracteres de HL: B filas de C, en la tabla de nombres
	jp L_4192		;570b
L_570E:
	call L_41D4		;570e   ; 12 x 12 de 0xB0DC
	ld hl,0b0dch		;5711
	jr L_5702		;5714
L_5716:
	call L_41D4		;5716   ; 7 x 3 de 0xB0C7
	ld hl,0b0c7h		;5719
	ld de,08838h		;571c
	ld bc,00703h		;571f
	call L_53D6		;5722   ; un rectangulo de caracteres de HL: B filas de C, en la tabla de nombres
	jp L_4192		;5725
L_5728:
	call L_41D4		;5728   ; 2 x 3 de 0xB16C o 0xB172 (segun A)
	or a			;572b
	ld hl,0b16ch		;572c
	jr z,L_5734		;572f
	ld hl,0b172h		;5731
L_5734:
	ld de,06058h		;5734
	ld bc,00203h		;5737
	call L_53D6		;573a   ; un rectangulo de caracteres de HL: B filas de C, en la tabla de nombres
	jp L_4192		;573d
L_5740:
	call L_41D4		;5740   ; 2 x 3 de 0xB178 o 0xB17E
	or a			;5743
	ld hl,0b178h		;5744
	jr z,L_574C		;5747
	ld hl,0b17eh		;5749
L_574C:
	ld de,06038h		;574c
	ld bc,00203h		;574f
	call L_53D6		;5752   ; un rectangulo de caracteres de HL: B filas de C, en la tabla de nombres
	jp L_4192		;5755
L_5758:
	call L_41D4		;5758   ; 32 columnas de 23 caracteres de la tabla 0xABE7, desde la entrada A
	ld de,00008h		;575b
	ld b,020h		;575e
L_5760:
	push bc			;5760
	push af			;5761
	ld hl,0abe7h		;5762   ; la columna A de la tabla 0xABE7
	add a,a			;5765   ; A x 2
	ld c,a			;5766
	ld b,000h		;5767
	add hl,bc			;5769
	ld a,(hl)			;576a   ; HL = la columna
	inc hl			;576b
	ld h,(hl)			;576c
	ld l,a			;576d
	push de			;576e
	ld bc,01701h		;576f   ; 23 filas de 1 caracter
	call L_53D6		;5772   ; un rectangulo de caracteres de HL: B filas de C, en la tabla de nombres
	pop de			;5775
	ld a,d			;5776   ; 8 pixeles a la derecha
	add a,008h		;5777
	ld d,a			;5779
	pop af			;577a
	inc a			;577b   ; la columna siguiente
	pop bc			;577c
	djnz L_5760		;577d
	jp L_4192		;577f
L_5782:
	call L_41D4		;5782   ; 16 x 12 de 0xB184 o 0xB244
	ld hl,0b184h		;5785
	or a			;5788
	jr z,L_578E		;5789
	ld hl,0b244h		;578b
L_578E:
	ld de,08828h		;578e
	ld bc,0100ch		;5791
	call L_53D6		;5794   ; un rectangulo de caracteres de HL: B filas de C, en la tabla de nombres
	jp L_4192		;5797
L_579A:
	call L_41D4		;579a   ; 12 x 2 de 0xB304
	ld hl,0b304h		;579d
	ld de,0b038h		;57a0
	ld bc,00c02h		;57a3
	call L_53D6		;57a6   ; un rectangulo de caracteres de HL: B filas de C, en la tabla de nombres
	jp L_4192		;57a9
L_57AC:
	call L_41D4		;57ac   ; 12 x 4 de 0xB31C
	ld hl,0b31ch		;57af
	ld de,0a838h		;57b2
	ld bc,00c04h		;57b5
	call L_53D6		;57b8   ; un rectangulo de caracteres de HL: B filas de C, en la tabla de nombres
	jp L_4192		;57bb
L_57BE:
	call L_41D4		;57be   ; 14 x 6 de 0xB34C
	ld hl,0b34ch		;57c1
	ld de,0a030h		;57c4
	ld bc,00e06h		;57c7
	call L_53D6		;57ca   ; un rectangulo de caracteres de HL: B filas de C, en la tabla de nombres
	jp L_4192		;57cd
L_57D0:
	push af			;57d0   ; 6 x 6 de 0xB3A0 en la columna que diga A
	call L_57EE		;57d1   ; 14 x 6 de 0xB3C4
	pop af			;57d4
	call L_41D4		;57d5   ; pone los bancos 14-15 en 0x8000-0xBFFF
	ld hl,0b3a0h		;57d8   ; desde (0x90, 0x40) de la pagina 1
	rla			;57db
	rla			;57dc
	rla			;57dd
	and 0f8h		;57de
	add a,040h		;57e0
	ld e,a			;57e2
	ld d,0a0h		;57e3   ; a (0xA0, 0x40 + A x 8)
	ld bc,00606h		;57e5
	call L_53D6		;57e8   ; un rectangulo de caracteres de HL: B filas de C, en la tabla de nombres
	jp L_4192		;57eb
L_57EE:
	call L_41D4		;57ee   ; 14 x 6 de 0xB3C4
	ld hl,0b3c4h		;57f1
	ld de,0a030h		;57f4
	ld bc,00e06h		;57f7
	call L_53D6		;57fa   ; un rectangulo de caracteres de HL: B filas de C, en la tabla de nombres
	jp L_4192		;57fd
L_5800:
	call L_41D4		;5800   ; rachas de 0xB851 a 0x1820 y de 0xB41D a 0x1E80 (sprites)
	ld de,0b851h		;5803
	ld hl,01820h		;5806
	call L_4E55		;5809   ; lo mismo con el destino en HL
	ld de,0b41dh		;580c
	ld hl,01e80h		;580f
	call L_4E55		;5812   ; lo mismo con el destino en HL
	jp L_4192		;5815
L_5818:
	call L_41D4		;5818   ; los sprites del final: rachas de 0xB5B7, 0x85A5, 0x8604, 0x8662, 0xB963 y 0xB418
	ld de,0b5b7h		;581b   ; 0xB5B7 a 0x1800
	ld hl,01800h		;581e
	call L_4E55		;5821   ; lo mismo con el destino en HL
	ld de,085a5h		;5824   ; 0x85A5 a 0x1880
	ld hl,01880h		;5827
	call L_4E55		;582a   ; lo mismo con el destino en HL
	ld de,08604h		;582d   ; 0x8604 a 0x1900
	ld hl,01900h		;5830
	call L_4E55		;5833   ; lo mismo con el destino en HL
	ld de,08662h		;5836   ; 0x8662 a 0x1980
	ld hl,01980h		;5839
	call L_4E55		;583c   ; lo mismo con el destino en HL
	ld de,0b963h		;583f   ; 0xB963 a 0x1A00
	ld hl,01a00h		;5842
	call L_4E55		;5845   ; lo mismo con el destino en HL
	ld de,0b418h		;5848   ; 0xB418 a 0xFE80
	ld hl,0fe80h		;584b
	call L_4E55		;584e   ; lo mismo con el destino en HL
	jp L_4192		;5851
L_5854:
	call L_41D4		;5854   ; los mismos con 0x86BC, 0x871B y 0x8778
	ld de,0b5b7h		;5857
	ld hl,01800h		;585a
	call L_4E55		;585d   ; lo mismo con el destino en HL
	ld de,086bch		;5860
	ld hl,01880h		;5863
	call L_4E55		;5866   ; lo mismo con el destino en HL
	ld de,0871bh		;5869
	ld hl,01900h		;586c
	call L_4E55		;586f   ; lo mismo con el destino en HL
	ld de,08778h		;5872
	ld hl,01980h		;5875
	call L_4E55		;5878   ; lo mismo con el destino en HL
	ld de,0b963h		;587b
	ld hl,01a00h		;587e
	call L_4E55		;5881   ; lo mismo con el destino en HL
	ld de,0b41dh		;5884
	ld hl,01e80h		;5887
	call L_4E55		;588a   ; lo mismo con el destino en HL
	jp L_4192		;588d
L_5890:
	call L_41B8		;5890   ; las fuentes del marcador: 0xAA29, 0xAA89 y 0xAB79 a los tres tercios, con color 0xF0
	ld hl,0aa29h		;5893   ; 0x60 bytes de 0xAA29 a 0x2680
	ld de,02680h		;5896
	ld bc,00060h		;5899
	call L_4E99		;589c   ; escribe BC bytes de HL en la VRAM de DE en los tres tercios (DE, DE + 0x800, DE + 0x1000)
	ld hl,0aa89h		;589f   ; 0xD8 bytes de 0xAA89 a 0x26E0
	ld de,026e0h		;58a2
	ld bc,000d8h		;58a5
	call L_4E99		;58a8   ; escribe BC bytes de HL en la VRAM de DE en los tres tercios (DE, DE + 0x800, DE + 0x1000)
	ld hl,0ab79h		;58ab   ; 0x28 bytes de 0xAB79 a 0x27B8
	ld de,027b8h		;58ae
	ld bc,00028h		;58b1
	call L_4E99		;58b4   ; escribe BC bytes de HL en la VRAM de DE en los tres tercios (DE, DE + 0x800, DE + 0x1000)
	ld a,0f0h		;58b7   ; sus colores: 0xF0, 0x180 bytes
	ld hl,00680h		;58b9
	ld bc,00180h		;58bc
	call L_4EA8		;58bf   ; llena BC bytes de la VRAM de HL con A en los tres tercios
	jp L_4192		;58c2
L_58C5:
	call L_5915		;58c5   ; los caracteres animados de la piramide (cada uno de su tabla 0x5936 + 10 x piramide)
	ld a,(0e241h)		;58c8   ; lee la piramide (1-6)
	add a,a			;58cb   ; piramide x 10
	ld b,a			;58cc
	add a,a			;58cd   ; x 8 + x 2: x 10
	add a,a			;58ce
	add a,b			;58cf
	ld hl,05936h		;58d0
	call L_4094		;58d3   ; suma A a HL (HL = HL + A)
	ld b,(hl)			;58d6   ; B = el primer byte de la entrada
	inc hl			;58d7   ; C = cada cuantos cuadros
	ld c,(hl)			;58d8
	inc hl			;58d9   ; DE = los caracteres
	ex de,hl			;58da
	ld hl,0ef00h		;58db   ; su cuenta en 0xEF00
	inc (hl)			;58de
	ld a,(hl)			;58df
	cp c			;58e0
	ret c			;58e1   ; aun no toca
	ld (hl),000h		;58e2   ; la cuenta a cero
	inc hl			;58e4
	ld a,(hl)			;58e5   ; el paso sube hasta 3 y baja hasta 0
	and a			;58e6
	inc hl			;58e7
	jr nz,L_58F2		;58e8   ; bajando: aparte
	inc (hl)			;58ea
	ld a,(hl)			;58eb
	cp 003h		;58ec   ; hasta 3
	jr c,L_58FA		;58ee
	jr L_58F5		;58f0
L_58F2:
	dec (hl)			;58f2
	jr nz,L_58FA		;58f3
L_58F5:
	dec hl			;58f5   ; y da la vuelta
	ld a,(hl)			;58f6
	xor 001h		;58f7
	ld (hl),a			;58f9
L_58FA:
	ld h,000h		;58fa   ; el paso 0xEF02: sus rachas al caracter B de los tres tercios
	ld l,b			;58fc
	add hl,hl			;58fd
	add hl,hl			;58fe
	add hl,hl			;58ff
	ld bc,00000h		;5900
	add hl,bc			;5903
	ex de,hl			;5904
	ld a,(0ef02h)		;5905
	call L_4D4D		;5908   ; HL = la palabra A de la tabla de HL
	ex de,hl			;590b
L_590C:
	call L_41B3		;590c   ; pone los bancos 7-8-9
	call L_4EB7		;590f   ; rachas de DE a la VRAM de HL en los tres tercios (las mismas tres veces)
	jp L_4192		;5912
L_5915:
	ld hl,0ef05h		;5915   ; los caracteres animados comunes: cada 4 cuadros el paso siguiente de 8 (tabla 0x5930)
	inc (hl)			;5918   ; un cuadro mas
	ld a,(hl)			;5919
	and 003h		;591a   ; cada 4
	ret nz			;591c
	inc hl			;591d
	inc (hl)			;591e   ; el paso siguiente, de 8
	ld a,(hl)			;591f
	and 007h		;5920
	ld (hl),a			;5922
	ld hl,05930h		;5923
	call L_4D4D		;5926   ; HL = la palabra A de la tabla de HL
	ex de,hl			;5929
	ld hl,004c0h		;592a   ; a 0x04C0
	jp L_590C		;592d

; ----------------------------------------------------------------------
; DATOS animados_comunes: 8 punteros (por 0xEF06 & 7): rachas de patrones que
;   van a los caracteres 0x98-0x9F de los tres tercios; lo leen p00:5926 (16
;   bytes)
;   0x5930..0x5940  (16 bytes)
DATA_animados_comunes:
	defw 0657ah,06594h,065ach,065c3h,065deh,065f8h,06610h,06627h	; 5930

; ----------------------------------------------------------------------
; DATOS animados_piramides: 10 bytes por piramide (desde 0x5936 + 10 x
;   piramide): [caracter][cada cuantos cuadros] y 4 punteros a los pasos; lo
;   leen p00:58D3 (60 bytes)
;   0x5940..0x597c  (60 bytes)
DATA_animados_piramides:
	defb 04fh,00ch,0d9h,06ah,0f9h,06ah,0d9h,06ah,0f9h,06ah	; 5940  O..j.j.j.j
	defb 04ch,012h,00ah,070h,026h,070h,00ah,070h,026h,070h	; 594a  L..p&p.p&p
	defb 049h,010h,014h,074h,038h,074h,014h,074h,038h,074h	; 5954  I..t8t.t8t
	defb 036h,005h,07ch,077h,08bh,077h,07ch,077h,08bh,077h	; 595e  6.|w.w|w.w
	defb 05bh,00ch,09bh,07ch,089h,07ch,09bh,07ch,089h,07ch	; 5968  [..|.|.|.|
	defb 04ch,004h,0b3h,080h,0d9h,080h,0ffh,080h,025h,081h	; 5972  L.......%.

; ======================================================================
; CODIGO 0x597c..0x5c3a  (702 bytes)
; ======================================================================


L_597C:
	call L_4EC7		;597c   ; la presentacion (estado 0, paso 0): borra, R#7 = 0x0F y las rachas de 0x9BF2
	ld b,00fh		;597f
	ld c,007h		;5981
	call 00047h		;5983   ; BIOS WRTVDP - Writes data in the VDP-register
	ld hl,00000h		;5986
	ld (0e20eh),hl		;5989
	call L_41B3		;598c   ; pone los bancos 7-8-9
	ld de,09bf2h		;598f
	call L_4E20		;5992   ; rachas a la VRAM: [destino] y rachas; [n < 0x80] repite el byte siguiente n veces; [0x80 + n] copia n; [0x80] trae otro destino; 0 acaba
	call L_4192		;5995   ; pone los bancos 1-2-3 (el juego)
	ld hl,00a00h		;5998
	ld bc,003f0h		;599b
	xor a			;599e   ; los patrones de 0x0A00 (0x3F0 bytes) a cero
	call L_4E10		;599f   ; llena BC bytes de la VRAM con A (BIGFIL)
	ld hl,03907h		;59a2   ; la tabla de nombres del dibujo: 6 filas de 21 caracteres seguidos desde 0x40
	ld a,040h		;59a5
	ld c,006h		;59a7
	ld de,0000bh		;59a9
L_59AC:
	ld b,015h		;59ac
L_59AE:
	call 0004dh		;59ae   ; BIOS WRTVRM - Writes data in VRAM
	inc hl			;59b1
	inc a			;59b2
	djnz L_59AE		;59b3
	add hl,de			;59b5
	dec c			;59b6
	jr nz,L_59AC		;59b7
	ret			;59b9
L_59BA:
	ld a,(0e20fh)		;59ba   ; un cuadro de la presentacion: una columna de 21 bytes de patrones cada vez (NZ mientras queden)
	cp 006h		;59bd   ; hasta la columna 6
	ld c,a			;59bf
	ret z			;59c0
	ld a,(0e20eh)		;59c1   ; cada 8 (0xE20E & 7 = 0)...
	and 007h		;59c4
	ld a,c			;59c6
	push af			;59c7
	call z,L_5A0B		;59c8   ; cada 8 columnas, el trozo siguiente del dibujo se desempaqueta en 0xE900 (0x5A0B), libre fuera de la partida
	pop af			;59cb
	call L_41B3		;59cc   ; pone los bancos 7-8-9
	ld hl,09be6h		;59cf   ; el sitio del trozo en la VRAM (tabla 0x9BE6)
	call L_4D4D		;59d2   ; HL = la palabra A de la tabla de HL
	ex de,hl			;59d5
	ld hl,0e20eh		;59d6   ; 0xE20E & 7
	ld a,(hl)			;59d9
	and 007h		;59da
	ld c,a			;59dc
	cp 007h		;59dd   ; ...al llegar a 7, 0xE20F sube
	jr nz,L_59E3		;59df
	inc hl			;59e1
	inc (hl)			;59e2
L_59E3:
	inc a			;59e3
	and 007h		;59e4
	ld (0e20eh),a		;59e6
	ld a,c			;59e9
	call L_4099		;59ea   ; suma A a DE (DE = DE + A)
	ld a,c			;59ed
	ld hl,0e900h		;59ee   ; apunta a el mapa de la fase: 0xC0 bytes por pantalla, 4 casillas por byte
	call L_4094		;59f1   ; suma A a HL (HL = HL + A)
	ex de,hl			;59f4
	ld b,015h		;59f5
L_59F7:
	ld a,(de)			;59f7   ; 21 bytes, de 8 en 8, a la VRAM
	call 0004dh		;59f8   ; BIOS WRTVRM - Writes data in VRAM
	ld a,008h		;59fb
	call L_4099		;59fd   ; suma A a DE (DE = DE + A)
	ld a,008h		;5a00
	call L_4094		;5a02   ; suma A a HL (HL = HL + A)
	djnz L_59F7		;5a05
	inc b			;5a07
	jp L_4192		;5a08
L_5A0B:
	call L_41B3		;5a0b   ; desempaqueta el trozo A del dibujo de la presentacion (tabla 0x9BDA) en 0xE900
	ld hl,09bdah		;5a0e
	call L_4D4D		;5a11   ; HL = la palabra A de la tabla de HL
	ld de,0e900h		;5a14   ; apunta a el mapa de la fase: 0xC0 bytes por pantalla, 4 casillas por byte
	call L_5A21		;5a17   ; 0 acaba
	jp L_4192		;5a1a
L_5A1D:
	ld e,(hl)			;5a1d   ; rachas a la RAM: [destino], [n < 0x80] repite, [0x80 + n] copia, [0x80] otro destino, 0 acaba
	inc hl			;5a1e
	ld d,(hl)			;5a1f
	inc hl			;5a20
L_5A21:
	ld a,(hl)			;5a21   ; 0 acaba
	and a			;5a22
	ret z			;5a23
	inc hl			;5a24
	ld b,a			;5a25
	and 07fh		;5a26   ; bit 7 a cero: aparte
	cp b			;5a28
	jr z,L_5A35		;5a29
	and a			;5a2b   ; 0x80: otro destino
	jr z,L_5A1D		;5a2c
	ld c,a			;5a2e   ; con el bit 7: C bytes...
	ld b,000h		;5a2f
	ldir		;5a31   ; ...copiados
	jr L_5A21		;5a33
L_5A35:
	ld a,(hl)			;5a35
	inc hl			;5a36
L_5A37:
	ld (de),a			;5a37
	inc de			;5a38
	djnz L_5A37		;5a39
	jr L_5A21		;5a3b
L_5A3D:
	call L_41B8		;5a3d   ; las fuentes del marcador (otra forma): 0xAA29, 0xAA89, 0xABA1 y 0xABB1, con color 0xF0
	ld hl,0aa29h		;5a40   ; 0x60 bytes de 0xAA29 a 0x2680
	ld de,02680h		;5a43
	ld bc,00060h		;5a46
	call L_4E99		;5a49   ; escribe BC bytes de HL en la VRAM de DE en los tres tercios (DE, DE + 0x800, DE + 0x1000)
	ld hl,0aa89h		;5a4c   ; 0xF0 bytes de 0xAA89 a 0x2700
	ld de,02700h		;5a4f
	ld bc,000f0h		;5a52
	call L_4E99		;5a55   ; escribe BC bytes de HL en la VRAM de DE en los tres tercios (DE, DE + 0x800, DE + 0x1000)
	ld hl,0aba1h		;5a58   ; 0x10 bytes de 0xABA1 a 0x26E0
	ld de,026e0h		;5a5b
	ld bc,00010h		;5a5e
	call L_4E99		;5a61   ; escribe BC bytes de HL en la VRAM de DE en los tres tercios (DE, DE + 0x800, DE + 0x1000)
	ld a,0f0h		;5a64   ; sus colores: 0xF0
	ld hl,00680h		;5a66
	ld bc,00060h		;5a69
	call L_4EA8		;5a6c   ; llena BC bytes de la VRAM de HL con A en los tres tercios
	ld a,0f0h		;5a6f   ; sus colores: 0xF0
	ld hl,00700h		;5a71
	ld bc,000f0h		;5a74
	call L_4EA8		;5a77   ; llena BC bytes de la VRAM de HL con A en los tres tercios
	ld hl,0abb1h		;5a7a   ; y los colores de 0xABB1 a 0x06E0
	ld de,006e0h		;5a7d
	ld bc,00010h		;5a80
	call L_4E99		;5a83   ; escribe BC bytes de HL en la VRAM de DE en los tres tercios (DE, DE + 0x800, DE + 0x1000)
	call L_4192		;5a86   ; pone los bancos 1-2-3 (el juego)
	ret			;5a89
L_5A8A:
	ld a,(0e254h)		;5a8a   ; prepara la fase 0xE242 (con el editor, solo la pantalla)
	and a			;5a8d
	jp nz,L_5AEC		;5a8e
	ld a,(0e242h)		;5a91   ; la piramide sale de la fase: (fase - 1) / 10 + 1
	dec a			;5a94
	ld b,001h		;5a95
L_5A97:
	sub 00ah		;5a97
	jr c,L_5A9E		;5a99
	inc b			;5a9b
	jr L_5A97		;5a9c
L_5A9E:
	ld a,b			;5a9e
	ld (0e241h),a		;5a9f   ; 0xE241: la piramide (1-6)
	call L_52FD		;5aa2   ; sus graficos
	call L_532E		;5aa5   ; los sprites
	call L_56B0		;5aa8   ; rachas de 0xA6D8 a 0x1880 (sprites)
	ld hl,0e2c0h		;5aab   ; la RAM de 0xE2C0 a 0xEFFF a cero
	ld de,0e2c1h		;5aae
	ld bc,00d3fh		;5ab1
	ld (hl),000h		;5ab4
	ldir		;5ab6
	call L_5B38		;5ab8   ; sin sprites
	call 08fb6h		;5abb   ; el personaje al empezar la fase: la tabla 0xB844 (banco 13), 3 bytes por fase
	call 06559h		;5abe   ; lee los sitios de salida de la fase (tabla 0xB7CD del banco 13) a 0xE2C0
	call 062edh		;5ac1   ; lee las cosas de 2 x 2 de la fase (tabla 0xA75D del banco 13) a 0xE700
	call 08b9ah		;5ac4   ; la salida de la fase: 3 bytes de la tabla 0xB8F8 (banco 13) a 0xE2F1-0xE2F3
	call L_5BA3		;5ac7   ; la rejilla de pantallas de la fase
	call L_5CAC		;5aca   ; los saltos entre pantallas
	call L_5BDD		;5acd   ; la casilla de la pantalla 0xE243
	call L_43C3		;5ad0   ; el mapa de la fase
	call 06137h		;5ad3   ; lee las cosas de la fase (tabla 0xAAE0 del banco 13) a 0xE600
	call 09e16h		;5ad6   ; las cosas que se cogen de la fase (tabla 0xAFB1 del banco 13) a 0xE300
	call 08f34h		;5ad9   ; la lista 0xEE50: el numero (desde 1) de cada cosa de 0xE300 que hay, y un 0
	call L_41BD		;5adc   ; pone el banco 12 en 0xA000
	call 0b400h		;5adf   ; el sitio escondido de la fase, si lo tiene: tabla 0xB544, 5 bytes [fase][tipo][pantalla][y][x], un 0 acaba
	call L_4192		;5ae2   ; pone los bancos 1-2-3 (el juego)
	xor a			;5ae5
	ld (0e287h),a		;5ae6   ; el personaje en su primera postura
	ld (0edcdh),a		;5ae9   ; y 0xEDCD a cero
L_5AEC:
	call L_4EC7		;5aec   ; pinta la pantalla en la que se esta: apaga, pinta y enciende
	call L_4EEA		;5aef   ; los atributos de los sprites (0x3B00, 0x80 bytes) a 0xE0: fuera de la pantalla
	call L_4EDF		;5af2   ; apaga la pantalla (bit 6 de R#1 a cero)
	call 061a6h		;5af5   ; las borra del mapa (valor 0)
	call L_44DC		;5af8   ; los ladrillos, las puertas y lo de 0xE2C0
	call L_41BD		;5afb   ; pone el banco 12 en 0xA000
	call 0b518h		;5afe   ; al pintar la pantalla, el sitio si ya ha aparecido
	call L_4192		;5b01   ; pone los bancos 1-2-3 (el juego)
	call 08c14h		;5b04   ; pinta la salida si es de esta pantalla: 4 x 4 caracteres de 0x9059 + 16 x 0xE2F6
	call 090d7h		;5b07   ; al entrar en la pantalla por un lado: los bloques del borde se apartan
	call 06254h		;5b0a   ; pinta las cosas de 0xE600 de esta pantalla (tabla 0x62E3 por tipo)
	call 08e74h		;5b0d   ; las de la lista, al reves: guarda el fondo y pinta la cosa
	call 0626bh		;5b10   ; las del tipo 5 de esta pantalla: 0x937A
	call 061a2h		;5b13   ; marca en el mapa las cosas de 0xE600 con el valor 3
	call L_4C8B		;5b16   ; el marcador
	call L_4ED4		;5b19   ; se enciende
	ld hl,(0e243h)		;5b1c   ; 0xE250 = el mapa de la pantalla 0xE243
	dec l			;5b1f
	ld h,000h		;5b20
	call L_5B29		;5b22   ; HL = 0xE900 + HL x 0xC0: el mapa de la pantalla HL (0-5)
	ld (0e250h),hl		;5b25   ; guarda el mapa de la pantalla en la que se esta (16 bits)
	ret			;5b28
L_5B29:
	add hl,hl			;5b29   ; HL = 0xE900 + HL x 0xC0: el mapa de la pantalla HL (0-5)
	add hl,hl			;5b2a
	add hl,hl			;5b2b
	add hl,hl			;5b2c
	add hl,hl			;5b2d
	add hl,hl			;5b2e
	ld d,h			;5b2f
	ld e,l			;5b30
	add hl,hl			;5b31   ; x 3: HL x 0xC0
	add hl,de			;5b32
	ld de,0e900h		;5b33   ; apunta a el mapa de la fase: 0xC0 bytes por pantalla, 4 casillas por byte
	add hl,de			;5b36
	ret			;5b37
L_5B38:
	ld hl,0e800h		;5b38   ; los atributos de los sprites (0xE800, 0x80 bytes) a 0xE0: fuera de la pantalla
	ld de,0e801h		;5b3b
	ld bc,0007fh		;5b3e
	ld (hl),0e0h		;5b41
	ldir		;5b43
	ret			;5b45
L_5B46:
	ld hl,0e21bh		;5b46   ; 0xE21B: cuenta de cuadros con el borde parpadeando (color 11 / 0)
	ld a,(hl)			;5b49
	and a			;5b4a
	ret z			;5b4b
	dec (hl)			;5b4c   ; un cuadro menos
	ld a,(hl)			;5b4d
	rra			;5b4e   ; color 0 o 11, uno si y otro no
	ld b,000h		;5b4f
	jr nc,L_5B55		;5b51
	ld b,00fh		;5b53
L_5B55:
	ld c,007h		;5b55
	jp 00047h		;5b57   ; BIOS WRTVDP - Writes data in the VDP-register
L_5B5A:
	call L_561D		;5b5a   ; un cuadro de la partida: sprites, todo lo que se mueve y los sprites a la VRAM
	call L_5B64		;5b5d   ; lo que pasa en un cuadro, en este orden
	call L_5649		;5b60
	ret			;5b63
L_5B64:
	call L_5B46		;5b64   ; lo que pasa en un cuadro, en este orden
	call 09445h		;5b67   ; un cuadro del personaje: lo de su estado y sus dibujos
	call L_565F		;5b6a   ; los dibujos del personaje
	call 09ca3h		;5b6d   ; los sprites del personaje; en el estado 0x0E, uno de cada dos cuadros no se ve (parpadea)
	call 0a23dh		;5b70   ; un cuadro de las 64 cosas de 0xE300: cada tipo, su rutina (tabla detras)
	call 08ecah		;5b73   ; los sprites de las cosas de 0xE300 que brillan (tipo 2 o mas, estado < 3)
	call 0a864h		;5b76   ; coger una cosa de 0xE300 del suelo (si no lleva otra y no esta saliendo)
	call 0a7edh		;5b79   ; coger las cosas de 2 x 2 de esta pantalla que esten a menos de 12 pixeles del personaje
	call 06527h		;5b7c   ; cada 4 cuadros, los 8 sitios de salida de 0xE2C0
	call 06356h		;5b7f   ; un cuadro de los 8 enemigos de 0xE500 (32 bytes cada uno)
	call 0644fh		;5b82   ; los sprites de los enemigos de esta pantalla; en MSX2, sus colores a 0xD300
	call 08bc2h		;5b85   ; el personaje en la salida: si esta en su pantalla y no queda nada por coger (0xE2F5)...
	call 0628dh		;5b88
	call 0bb90h		;5b8b   ; las columnas de 0xE7C0 de esta pantalla
	call L_41BD		;5b8e   ; pone el banco 12 en 0xA000
	call 0b422h		;5b91   ; un cuadro del sitio escondido, por pasos (0xEF11)
	call L_4192		;5b94   ; pone los bancos 1-2-3 (el juego)
	call 0a901h		;5b97   ; un enemigo de esta pantalla toca al personaje: muere (salvo con FESTIVAL o ya muerto)
	call 0a94eh		;5b9a   ; las cosas lanzadas (tipo 1-3 de 0xE300 en vuelo) que dan a un enemigo
	call L_4379		;5b9d   ; la tecla de la musica
	jp L_58C5		;5ba0   ; y los colores que cambian solos
L_5BA3:
	call L_41C7		;5ba3   ; la rejilla de pantallas de la fase: 8 bytes de la tabla 0xAB5A (banco 13), un bit por casilla
	ld hl,0e780h		;5ba6   ; 0xE780-0xE7BF a cero
	ld de,0e781h		;5ba9
	ld bc,0003fh		;5bac   ; 64 bytes
	ld (hl),000h		;5baf
	ldir		;5bb1
	ld de,0ab5ah		;5bb3
	ld a,(0e242h)		;5bb6   ; (fase - 1) x 8
	dec a			;5bb9
	ld l,a			;5bba
	ld h,000h		;5bbb
	add hl,hl			;5bbd
	add hl,hl			;5bbe
	add hl,hl			;5bbf
	add hl,de			;5bc0
	ex de,hl			;5bc1
	ld hl,0e788h		;5bc2   ; las casillas, desde 0xE788
	ld bc,00801h		;5bc5   ; 8 bytes, y C numera las pantallas desde 1
L_5BC8:
	push bc			;5bc8
	ld a,(de)			;5bc9
	ld b,008h		;5bca
L_5BCC:
	rla			;5bcc   ; con el bit a 1 la casilla es la pantalla C
	jr nc,L_5BD1		;5bcd
	ld (hl),c			;5bcf
	inc c			;5bd0
L_5BD1:
	inc hl			;5bd1   ; la casilla siguiente
	djnz L_5BCC		;5bd2
	inc de			;5bd4   ; el byte siguiente
	ld a,c			;5bd5
	pop bc			;5bd6
	ld c,a			;5bd7
	djnz L_5BC8		;5bd8
	jp L_4192		;5bda
L_5BDD:
	ld a,(0e243h)		;5bdd   ; 0xE244 = la casilla de la pantalla 0xE243
	call L_5BE7		;5be0   ; C = la casilla de la rejilla en la que esta la pantalla A
	ld (0e244h),a		;5be3   ; guarda la casilla de la rejilla de la pantalla
	ret			;5be6
L_5BE7:
	ld hl,0e788h		;5be7   ; C = la casilla de la rejilla en la que esta la pantalla A
	ld c,000h		;5bea
L_5BEC:
	cp (hl)			;5bec
	jr z,L_5BF3		;5bed
	inc hl			;5bef
	inc c			;5bf0
	jr L_5BEC		;5bf1
L_5BF3:
	ld a,c			;5bf3
	ret			;5bf4
L_5BF5:
	ld a,(0e244h)		;5bf5   ; pasa a la pantalla de al lado al salir por el borde 0xE248 (1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ld b,a			;5bf8
	ld hl,0e248h		;5bf9   ; apunta a el borde por el que se sale de la pantalla (1 arriba, 2 abajo, 3 izquierda, 4 derecha)
	ld a,(hl)			;5bfc
	ld (0e2f9h),a		;5bfd   ; 0xE2F9 = por donde se ha salido
	ld (hl),000h		;5c00
	ld c,a			;5c02
	call L_5C0E		;5c03   ; donde aparece el personaje en la pantalla nueva
	ld a,c			;5c06
	call L_5C2F		;5c07   ; y cual es la pantalla nueva
	ld (0e243h),hl		;5c0a   ; 0xE243 = la pantalla, 0xE244 = su casilla
	ret			;5c0d
L_5C0E:
	dec a			;5c0e   ; por arriba: aparece abajo (y = 0xAD)
	jr z,L_5C23		;5c0f
	dec a			;5c11
	jr z,L_5C29		;5c12
	dec a			;5c14
	jr z,L_5C1D		;5c15
	ld a,003h		;5c17   ; por la derecha: aparece a la izquierda (x = 3)
	ld (0e284h),a		;5c19   ; guarda la x del personaje
	ret			;5c1c
L_5C1D:
	ld a,0f2h		;5c1d   ; por la izquierda: aparece a la derecha (x = 0xF2)
	ld (0e284h),a		;5c1f   ; guarda la x del personaje
	ret			;5c22
L_5C23:
	ld a,0adh		;5c23
	ld (0e282h),a		;5c25   ; guarda la y del personaje
	ret			;5c28
L_5C29:
	ld a,003h		;5c29   ; por abajo: aparece arriba (y = 3)
	ld (0e282h),a		;5c2b   ; guarda la y del personaje
	ret			;5c2e
L_5C2F:
	call L_5C36		;5c2f   ; la casilla vecina segun el borde (tabla detras)
	ld hl,(0efc0h)		;5c32   ; lee un dato de paso de la rutina en curso y el byte siguiente (16 bits)
	ret			;5c35
L_5C36:
	dec a			;5c36   ; la casilla vecina segun el borde (tabla detras)
	call L_409E		;5c37   ; el despachador de Konami: la tabla va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_5C3A: 4 destinos del despachador p00:409E (call en p00:5C37, el
;   indice en A): 5C42, 5C4E, 5C5C, 5C6A; lo leen p00:5C37 (8 bytes)
;   0x5c3a..0x5c42  (8 bytes)
DATA_tabla_5C3A:
	defw 05c42h,05c4eh,05c5ch,05c6ah	; 5c3a  -> L_5C42 L_5C4E L_5C5C L_5C6A

; ======================================================================
; CODIGO 0x5c42..0x5ce9  (167 bytes)
; ======================================================================


L_5C42:
	ld a,b			;5c42   ; arriba: la casilla - 8 (de la ultima fila se pasa a la primera)
	sub 008h		;5c43
	jr nc,L_5C49		;5c45
	add a,030h		;5c47
L_5C49:
	ld hl,0ed80h		;5c49   ; apunta a los saltos entre pantallas al salir por arriba
	jr L_5C76		;5c4c
L_5C4E:
	ld a,b			;5c4e   ; abajo: + 8 (6 filas de 8: 0x30 da la vuelta)
	add a,008h		;5c4f
	cp 030h		;5c51
	jr c,L_5C57		;5c53
	sub 030h		;5c55
L_5C57:
	ld hl,0ed90h		;5c57   ; apunta a los saltos al salir por abajo
	jr L_5C76		;5c5a
L_5C5C:
	ld a,b			;5c5c   ; izquierda: - 1 en la misma fila
	dec a			;5c5d
	and 007h		;5c5e
	ld c,a			;5c60
	ld a,b			;5c61
	and 0f8h		;5c62
	or c			;5c64
	ld hl,0eda0h		;5c65   ; apunta a los saltos al salir por la izquierda
	jr L_5C76		;5c68
L_5C6A:
	ld a,b			;5c6a   ; derecha: + 1 en la misma fila
	inc a			;5c6b
	and 007h		;5c6c
	ld c,a			;5c6e
	ld a,b			;5c6f
	and 0f8h		;5c70
	or c			;5c72
	ld hl,0edb0h		;5c73   ; apunta a los saltos al salir por la derecha
L_5C76:
	ld (0efc1h),a		;5c76   ; con una pantalla en la casilla vecina, esa
	ld de,0e788h		;5c79
	call L_4099		;5c7c   ; suma A a DE (DE = DE + A)
	ld a,(de)			;5c7f
	and a			;5c80
	jr z,L_5C87		;5c81
	ld (0efc0h),a		;5c83   ; guarda un dato de paso de la rutina en curso
	ret			;5c86
L_5C87:
	ld a,(hl)			;5c87   ; si no, la lista de saltos de ese borde: [de][a], 0xFF acaba
	cp 0ffh		;5c88
	jr z,L_5CA6		;5c8a
	cp b			;5c8c
	inc hl			;5c8d
	jr z,L_5C93		;5c8e
	inc hl			;5c90
	jr L_5C87		;5c91
L_5C93:
	ld a,(hl)			;5c93
	cp b			;5c94
	call z,L_5CA6		;5c95   ; ni vecina ni salto: 0xE24D = 1
	ld (0efc1h),a		;5c98
	ld hl,0e788h		;5c9b
	call L_4094		;5c9e   ; suma A a HL (HL = HL + A)
	ld a,(hl)			;5ca1
	ld (0efc0h),a		;5ca2   ; guarda un dato de paso de la rutina en curso
	ret			;5ca5
L_5CA6:
	ld hl,0e24dh		;5ca6   ; ni vecina ni salto: 0xE24D = 1
	ld (hl),001h		;5ca9
	ret			;5cab
L_5CAC:
	call L_41C7		;5cac   ; copia las cuatro listas de saltos de la fase (banco 13) a 0xED80-0xEDBF
	ld hl,0adcfh		;5caf
	ld de,0ed80h		;5cb2   ; apunta a los saltos entre pantallas al salir por arriba
	call L_5CD6		;5cb5   ; la lista de la fase: parejas hasta un 0xFF
	ld hl,0ae47h		;5cb8
	ld de,0ed90h		;5cbb   ; apunta a los saltos al salir por abajo
	call L_5CD6		;5cbe   ; la lista de la fase: parejas hasta un 0xFF
	ld hl,0aebfh		;5cc1
	ld de,0eda0h		;5cc4   ; apunta a los saltos al salir por la izquierda
	call L_5CD6		;5cc7   ; la lista de la fase: parejas hasta un 0xFF
	ld hl,0af37h		;5cca
	ld de,0edb0h		;5ccd   ; apunta a los saltos al salir por la derecha
	call L_5CD6		;5cd0   ; la lista de la fase: parejas hasta un 0xFF
	jp L_4192		;5cd3
L_5CD6:
	ld a,(0e242h)		;5cd6   ; la lista de la fase: parejas hasta un 0xFF
	call L_4D4D		;5cd9   ; HL = la palabra A de la tabla de HL
L_5CDC:
	ld a,(hl)			;5cdc   ; 0xFF acaba
	inc a			;5cdd
	jr z,L_5CE6		;5cde
	ldi		;5ce0   ; la pareja
	ldi		;5ce2
	jr L_5CDC		;5ce4
L_5CE6:
	ldi		;5ce6
	ret			;5ce8

; ----------------------------------------------------------------------
; DATOS resto_5CE9: lo apuntan con el banco puesto p00:4C9B (0x5CE9), p02:8DCE
;   (0x5D05), p00:48C4 (0x5D0A), p00:4908 (0x5D1F), p00:5E0B (0x5D26),
;   p00:47EF (0x5D35); el tamano es lo que hay hasta lo siguiente, no sale de
;   recorrerlo; lo leen p00:4C9B, p02:8DCE, p00:48C4, p00:4908, p00:5E0B,
;   p00:47EF (155 bytes)
;   0x5ce9..0x5d84  (155 bytes)
DATA_resto_5CE9:
	defb 010h,0c2h,0e8h,0e9h,0f3h,0e3h,0efh,0f2h,0e5h,0feh,060h,0c2h,0f3h,0e3h,0efh,0f2h	; 5ce9  ..........`.....
	defb 0e5h,0feh,098h,0c2h,0f3h,0f4h,0e1h,0e7h,0e5h,0feh,0d0h,0c2h,0f2h,0e5h,0f3h,0f4h	; 5cf9  ................
	defb 0ffh,060h,048h,0f3h,0f4h,0e1h,0e7h,0e5h,0feh,048h,068h,0f3h,0efh,0f5h,0ech,000h	; 5d09  .`H......Hh.....
	defb 0f3h,0f4h,0efh,0eeh,0e5h,0ffh,060h,048h,0e6h,0e9h,0ech,0e5h,0ffh,038h,050h,0dah	; 5d19  ......`H.....8P.
	defb 0ebh,0efh,0eeh,0e1h,0edh,0e9h,000h,0d1h,0d9h,0d8h,0d8h,0feh,050h,08ch,0e7h,0e1h	; 5d29  ............P...
	defb 0edh,0e5h,0ffh,050h,09ch,0e5h,0e4h,0e9h,0f4h,0ffh,058h,058h,0e7h,0e1h,0edh,0e5h	; 5d39  ...P......XX....
	defb 000h,000h,0efh,0f6h,0e5h,0f2h,0ffh,050h,068h,0e6h,0d5h,000h,000h,0e3h,0efh,0eeh	; 5d49  .......Ph.......
	defb 0f4h,0e9h,0eeh,0f5h,0e5h,0ffh,0dch,0ddh,0ffh,048h,048h,0e8h,0e9h,0f3h,0e3h,0efh	; 5d59  .........HH.....
	defb 0f2h,0e5h,000h,0feh,050h,068h,0f3h,0f4h,000h,0feh,080h,068h,0f2h,0e5h,0f3h,0f4h	; 5d69  ....Ph.....h....
	defb 000h,0feh,058h,058h,0f3h,0e3h,0efh,0f2h,0e5h,000h,0ffh	; 5d79  ..XX.......

; ======================================================================
; CODIGO 0x5d84..0x5dd1  (77 bytes)
; ======================================================================


L_5D84:
	call L_4EDF		;5d84   ; el menu: borra, R#7 = 0 y la presentacion
	call L_4EC7		;5d87   ; borra los sprites y la tabla de nombres (0x3800, 0x300 bytes)
	ld bc,00007h		;5d8a   ; R#7 = 0x00
	call 00047h		;5d8d   ; BIOS WRTVDP - Writes data in the VDP-register
	call L_4EEA		;5d90   ; los atributos de los sprites (0x3B00, 0x80 bytes) a 0xE0: fuera de la pantalla
	call L_5286		;5d93   ; la presentacion de MSX1: dos rachas a los tres tercios y el titulo
	xor a			;5d96
	ld (0e2c2h),a		;5d97
	ld (0e214h),a		;5d9a   ; guarda la cuenta del telon del menu
	call L_4ED4		;5d9d   ; enciende la pantalla (bit 6 de R#1)
	ret			;5da0
L_5DA1:
	call L_5DB3		;5da1
	ld a,(0002bh)		;5da4
	and 00fh		;5da7
	jr nz,$+89		;5da9
	ld de,098aah		;5dab
	call L_52F1		;5dae   ; rachas de DE a 0x0008 en los tres tercios, con los bancos 7-8-9
	jr $+81		;5db1
L_5DB3:
	ld a,(0002bh)		;5db3
	and 00fh		;5db6
	ret nz			;5db8
	call L_5B38		;5db9   ; los atributos de los sprites (0xE800, 0x80 bytes) a 0xE0: fuera de la pantalla
	ld de,0e800h		;5dbc   ; apunta a los atributos de los sprites (y, x, dibujo, color); al cargar graficos, su bufer
	ld hl,05e24h		;5dbf
	ld bc,00010h		;5dc2
	ldir		;5dc5
	call L_561D		;5dc7   ; copia a la VRAM los 32 sprites en otro orden cada cuadro (asi parpadean en vez de desaparecer)
	ret			;5dca
L_5DCB:
	ld a,(0e214h)		;5dcb   ; lee la cuenta del telon del menu
	call L_409E		;5dce   ; el despachador de Konami: la tabla va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_5DD1: 2 destinos del despachador p00:409E (call en p00:5DCE, el
;   indice en A): 5DD5, 5DE7; lo leen p00:5DCE (4 bytes)
;   0x5dd1..0x5dd5  (4 bytes)
DATA_tabla_5DD1:
	defw 05dd5h,05de7h	; 5dd1  -> L_5DD5 L_5DE7

; ======================================================================
; CODIGO 0x5dd5..0x5e1c  (71 bytes)
; ======================================================================


L_5DD5:
	ld a,(0002bh)		;5dd5   ; 0x002B de la BIOS, cifra baja: el juego de caracteres (0 japones)
	and 00fh		;5dd8
	jr nz,L_5E02		;5dda   ; no es 0: aparte
	ld hl,0e216h		;5ddc   ; 0xE216 = 4
	ld (hl),004h		;5ddf
	dec hl			;5de1
	ld (hl),030h		;5de2   ; 0xE215 = 0x30
	dec hl			;5de4
	inc (hl)			;5de5   ; y 0xE214 sube
	ret			;5de6
L_5DE7:
	ld hl,0e215h		;5de7   ; apunta a la cuenta para volver a poner la musica
	dec (hl)			;5dea   ; se acaba la espera?
	ret nz			;5deb
	inc hl			;5dec
	dec (hl)			;5ded   ; 0xE216 baja; a 0, aparte
	jr z,L_5E02		;5dee
	ld a,(hl)			;5df0
	dec hl			;5df1
	ld (hl),030h		;5df2   ; otra vez 0x30 cuadros
	dec a			;5df4
	add a,a			;5df5   ; (0xE216 - 1) x 2: su entrada en la tabla 0x5E1C
	ld hl,05e1ch		;5df6
	call L_4094		;5df9   ; suma A a HL (HL = HL + A)
	ld e,(hl)			;5dfc
	inc hl			;5dfd
	ld d,(hl)			;5dfe
	jp L_52F1		;5dff
L_5E02:
	call L_5DB3		;5e02
	ld hl,05e34h		;5e05
	call L_4F0B		;5e08   ; pinta un letrero: [D][E] y caracteres; 0xFE trae otra posicion; 0xFF acaba
	ld hl,05d26h		;5e0b
	call L_4F0B		;5e0e   ; pinta un letrero: [D][E] y caracteres; 0xFE trae otra posicion; 0xFF acaba
	call L_4F0B		;5e11   ; pinta un letrero: [D][E] y caracteres; 0xFE trae otra posicion; 0xFF acaba
	ld a,001h		;5e14   ; 0xE2C2 = 1
	ld (0e2c2h),a		;5e16
	ld b,0b4h		;5e19   ; B = 0xB4
	ret			;5e1b

; ----------------------------------------------------------------------
; DATOS resto_5E1C: lo apuntan con el banco puesto p00:5DF6 (0x5E1C), p00:5DBF
;   (0x5E24), p00:5E05 (0x5E34); el tamano es lo que hay hasta lo siguiente,
;   no sale de recorrerlo; lo leen p00:5DF6, p00:5DBF, p00:5E05 (84 bytes)
;   0x5e1c..0x5e70  (84 bytes)
DATA_resto_5E1C:
	defb 0aah,098h,055h,098h,000h,098h,0abh,097h,014h,048h,000h,00ah,014h,058h,004h,00ah	; 5e1c  ..U......H...X..
	defb 014h,068h,008h,00ah,014h,078h,00ch,00ah,030h,080h,0b0h,0b1h,0b1h,0b1h,0b1h,0b1h	; 5e2c  .h...x..0.......
	defb 0b1h,0b1h,0b2h,0feh,030h,088h,0b7h,000h,000h,000h,000h,000h,000h,000h,0b3h,0feh	; 5e3c  ....0...........
	defb 030h,090h,0b7h,000h,000h,000h,000h,000h,000h,000h,0b3h,0feh,030h,098h,0b7h,000h	; 5e4c  0...........0...
	defb 000h,000h,000h,000h,000h,000h,0b3h,0feh,030h,0a0h,0b6h,0b5h,0b5h,0b5h,0b5h,0b5h	; 5e5c  ........0.......
	defb 0b5h,0b5h,0b4h,0ffh	; 5e6c

; ======================================================================
; CODIGO 0x5e70..0x5e76  (6 bytes)
; ======================================================================


L_5E70:
	ld a,(0edc0h)		;5e70   ; un cuadro de la pausa, por pasos (0xEDC0)
	call L_409E		;5e73   ; el despachador de Konami: la tabla va detras del call

; ----------------------------------------------------------------------
; DATOS tabla_5E76: 4 destinos del despachador p00:409E (call en p00:5E73, el
;   indice en A): 5E7E, 5EC0, 5EDE, 5EFB; lo leen p00:5E73 (8 bytes)
;   0x5e76..0x5e7e  (8 bytes)
DATA_tabla_5E76:
	defw 05e7eh,05ec0h,05edeh,05efbh	; 5e76  -> L_5E7E L_5EC0 L_5EDE L_5EFB

; ======================================================================
; CODIGO 0x5e7e..0x5ff5  (375 bytes)
; ======================================================================


L_5E7E:
	ld a,(0e20ch)		;5e7e   ; paso 0: con la tecla del plano (bit 1), se pinta el plano de la fase
	rra			;5e81
	rra			;5e82
	ret nc			;5e83
	call L_4EC7		;5e84   ; borra los sprites y la tabla de nombres (0x3800, 0x300 bytes)
	call L_5E8F		;5e87
L_5E8A:
	ld hl,0edc0h		;5e8a   ; el paso siguiente
	inc (hl)			;5e8d
	ret			;5e8e
L_5E8F:
	call L_41C7		;5e8f   ; pone el banco 13 en 0xA000
	ld de,02708h		;5e92
	ld hl,0bf36h		;5e95
	ld bc,000c0h		;5e98
	call L_4E99		;5e9b   ; escribe BC bytes de HL en la VRAM de DE en los tres tercios (DE, DE + 0x800, DE + 0x1000)
	ld hl,00708h		;5e9e
	ld bc,00090h		;5ea1
	ld a,0f5h		;5ea4
	call L_4EA8		;5ea6   ; llena BC bytes de la VRAM de HL con A en los tres tercios
	ld hl,00798h		;5ea9
	ld bc,00030h		;5eac
	ld a,060h		;5eaf
	call L_4EA8		;5eb1   ; llena BC bytes de la VRAM de HL con A en los tres tercios
	ld de,0bf29h		;5eb4
	ld hl,01800h		;5eb7
	call L_4E55		;5eba   ; lo mismo con el destino en HL
	jp L_4192		;5ebd
L_5EC0:
	call 060e1h		;5ec0   ; paso 1: el plano de la fase
	call L_5EFC		;5ec3   ; las rejillas, los saltos, las cosas, el personaje...
	call 0606bh		;5ec6   ; pinta en el plano las 16 cosas de 0xE700 que haya (8 bytes cada una)
	call 06041h		;5ec9   ; la otra marca del plano: la casilla de la pantalla 0xE2F3 y el sitio de 0xE2F1
	call L_5FFF		;5ecc
	ld de,03b00h		;5ecf
	ld hl,0e800h		;5ed2   ; apunta a los atributos de los sprites (y, x, dibujo, color); al cargar graficos, su bufer
	ld bc,00008h		;5ed5
	call L_4E06		;5ed8   ; escribe BC bytes en la VRAM (LDIRVM) sin tocar registros
	jp L_5E8A		;5edb
L_5EDE:
	ld a,(0e20ch)		;5ede   ; paso 2: con la misma tecla se vuelve a la partida
	rra			;5ee1
	rra			;5ee2
	ret nc			;5ee3
	call L_4EC7		;5ee4   ; borra los sprites y la tabla de nombres (0x3800, 0x300 bytes)
	call L_5A3D		;5ee7   ; las fuentes del marcador (otra forma): 0xAA29, 0xAA89, 0xABA1 y 0xABB1, con color 0xF0
	call L_5AEC		;5eea   ; se repinta la pantalla
	call L_565F		;5eed   ; los dibujos del personaje (bancos 14-15)
	call 09ca3h		;5ef0
	call 0644fh		;5ef3
	xor a			;5ef6   ; y la pausa sigue en el paso 0
	ld (0edc0h),a		;5ef7
	ret			;5efa
L_5EFB:
	ret			;5efb
L_5EFC:
	call L_5F09		;5efc   ; los saltos de arriba: una marca encima de su casilla
	call L_5F44		;5eff   ; los saltos de abajo, marca debajo de su casilla (0x5FF8)
	call L_5F7F		;5f02   ; los de la izquierda, marca a la izquierda (0x5FFB)
	call L_5FBA		;5f05   ; los de la derecha, marca a la derecha (0x5FFD)
	ret			;5f08
L_5F09:
	ld de,0ed80h		;5f09   ; los saltos de arriba: una marca encima de su casilla
	ld b,008h		;5f0c
L_5F0E:
	ld a,(de)			;5f0e   ; hasta 8, 0xFF acaba
	inc a			;5f0f
	ret z			;5f10
	dec a			;5f11
	call L_5F1A		;5f12   ; la marca de la casilla A del plano: fila (A / 8) y columna (A & 7)
	inc de			;5f15   ; la pareja siguiente
	inc de			;5f16
	djnz L_5F0E		;5f17
	ret			;5f19
L_5F1A:
	push bc			;5f1a   ; la marca de la casilla A del plano: fila (A / 8) y columna (A & 7)
	push de			;5f1b
	ld c,a			;5f1c
	and 0f8h		;5f1d
	rra			;5f1f
	rra			;5f20
	rra			;5f21
	ld b,a			;5f22
	inc b			;5f23   ; B = la fila + 1
	ld a,0f8h		;5f24   ; y = fila x 0x18 - 8
	ld e,018h		;5f26   ; 0x18 por fila
L_5F28:
	add a,e			;5f28
	djnz L_5F28		;5f29
	ld e,a			;5f2b   ; E = la y
	ld a,c			;5f2c
	and 007h		;5f2d
	ld b,a			;5f2f   ; B = la columna + 1
	inc b			;5f30
	ld a,008h		;5f31   ; x = columna x 0x20 + 8
	ld d,020h		;5f33
L_5F35:
	add a,d			;5f35
	djnz L_5F35		;5f36
	ld d,a			;5f38   ; D = la x
	ld hl,05ff5h		;5f39   ; el dibujo de 0x5FF5
	ld c,0ffh		;5f3c   ; la mascara 0xFF: tal cual
	call L_4F15		;5f3e
	pop de			;5f41
	pop bc			;5f42
	ret			;5f43
L_5F44:
	ld de,0ed90h		;5f44   ; los saltos de abajo, marca debajo de su casilla (0x5FF8)
	ld b,008h		;5f47
L_5F49:
	ld a,(de)			;5f49   ; cada salto de abajo, hasta 8: 0xFF acaba
	inc a			;5f4a
	ret z			;5f4b
	dec a			;5f4c   ; la casilla
	call L_5F55		;5f4d   ; su marca
	inc de			;5f50   ; la pareja siguiente
	inc de			;5f51
	djnz L_5F49		;5f52
	ret			;5f54
L_5F55:
	push bc			;5f55   ; la marca debajo de la casilla A del plano
	push de			;5f56
	ld c,a			;5f57
	and 0f8h		;5f58   ; la fila (A / 8)...
	rra			;5f5a
	rra			;5f5b
	rra			;5f5c
	ld b,a			;5f5d
	inc b			;5f5e   ; B = la fila + 1
	ld a,018h		;5f5f   ; ...y = fila x 0x18 + 0x18
	ld e,018h		;5f61   ; 0x18 por fila
L_5F63:
	add a,e			;5f63   ; x 0x18
	djnz L_5F63		;5f64
	ld e,a			;5f66   ; E = la y
	ld a,c			;5f67   ; la columna (A & 7)...
	and 007h		;5f68
	ld b,a			;5f6a
	inc b			;5f6b
	ld a,008h		;5f6c   ; ...x = columna x 0x20 + 8
	ld d,020h		;5f6e
L_5F70:
	add a,d			;5f70
	djnz L_5F70		;5f71
	ld d,a			;5f73   ; D = la x
	ld hl,05ff8h		;5f74   ; el dibujo de 0x5FF8
	ld c,0ffh		;5f77   ; la mascara 0xFF: tal cual
	call L_4F15		;5f79
	pop de			;5f7c
	pop bc			;5f7d
	ret			;5f7e
L_5F7F:
	ld de,0eda0h		;5f7f   ; los de la izquierda, marca a la izquierda (0x5FFB)
	ld b,008h		;5f82
L_5F84:
	ld a,(de)			;5f84   ; cada salto de la izquierda, hasta 8: 0xFF acaba
	inc a			;5f85
	ret z			;5f86
	dec a			;5f87
	call L_5F90		;5f88   ; su marca
	inc de			;5f8b   ; la pareja siguiente
	inc de			;5f8c
	djnz L_5F84		;5f8d
	ret			;5f8f
L_5F90:
	push bc			;5f90   ; la marca a la izquierda de la casilla A
	push de			;5f91
	ld c,a			;5f92
	and 0f8h		;5f93
	rra			;5f95
	rra			;5f96
	rra			;5f97
	ld b,a			;5f98
	inc b			;5f99   ; B = la fila + 1
	ld a,008h		;5f9a   ; y = fila x 0x18 + 8
	ld e,018h		;5f9c   ; 0x18 por fila
L_5F9E:
	add a,e			;5f9e
	djnz L_5F9E		;5f9f
	ld e,a			;5fa1   ; E = la y
	ld a,c			;5fa2   ; x = columna x 0x20 - 8
	and 007h		;5fa3
	ld b,a			;5fa5   ; B = la columna + 1
	inc b			;5fa6
	ld a,0f8h		;5fa7
	ld d,020h		;5fa9
L_5FAB:
	add a,d			;5fab
	djnz L_5FAB		;5fac
	ld d,a			;5fae   ; D = la x
	ld hl,05ffbh		;5faf   ; el dibujo de 0x5FFB
	ld c,0ffh		;5fb2   ; la mascara 0xFF: tal cual
	call L_4F15		;5fb4
	pop de			;5fb7
	pop bc			;5fb8
	ret			;5fb9
L_5FBA:
	ld de,0edb0h		;5fba   ; los de la derecha, marca a la derecha (0x5FFD)
	ld b,008h		;5fbd
L_5FBF:
	ld a,(de)			;5fbf   ; cada salto de la derecha, hasta 8: 0xFF acaba
	inc a			;5fc0
	ret z			;5fc1
	dec a			;5fc2
	call L_5FCB		;5fc3   ; su marca
	inc de			;5fc6   ; la pareja siguiente
	inc de			;5fc7
	djnz L_5FBF		;5fc8
	ret			;5fca
L_5FCB:
	push bc			;5fcb   ; la marca a la derecha de la casilla A
	push de			;5fcc
	ld c,a			;5fcd
	and 0f8h		;5fce
	rra			;5fd0
	rra			;5fd1
	rra			;5fd2
	ld b,a			;5fd3
	inc b			;5fd4   ; B = la fila + 1
	ld a,008h		;5fd5   ; y = fila x 0x18 + 8
	ld e,018h		;5fd7   ; 0x18 por fila
L_5FD9:
	add a,e			;5fd9
	djnz L_5FD9		;5fda
	ld e,a			;5fdc   ; E = la y
	ld a,c			;5fdd   ; x = columna x 0x20 + 0x20
	and 007h		;5fde
	ld b,a			;5fe0   ; B = la columna + 1
	inc b			;5fe1
	ld a,020h		;5fe2
	ld d,020h		;5fe4
L_5FE6:
	add a,d			;5fe6
	djnz L_5FE6		;5fe7
	ld d,a			;5fe9   ; D = la x
	ld hl,05ffdh		;5fea   ; el dibujo de 0x5FFD
	ld c,0ffh		;5fed   ; la mascara 0xFF: tal cual
	call L_4F15		;5fef
	pop de			;5ff2
	pop bc			;5ff3
	ret			;5ff4

; ----------------------------------------------------------------------
; DATOS resto_5FF5: lo apuntan con el banco puesto p00:5F39 (0x5FF5), p00:5F74
;   (0x5FF8), p00:5FAF (0x5FFB), p00:5FEA (0x5FFD); el tamano es lo que hay
;   hasta lo siguiente, no sale de recorrerlo; lo leen p00:5F39, p00:5F74,
;   p00:5FAF, p00:5FEA (10 bytes)
;   0x5ff5..0x5fff  (10 bytes)
DATA_resto_5FF5:
	defb 0f3h,0f4h,0ffh,0f5h,0f6h,0ffh,0f7h,0ffh,0f8h,0ffh	; 5ff5  ..........

; ----------------------------------------------------------------------
; DATOS partida_5FFF: los 1 primeros bytes de una instruccion de 3 (3A 43 E2)
;   que sigue en el banco 1: el trazador de un solo banco no puede verla
;   entera (tools/bancos.py); lo leen p00:5FFF (1 bytes)
;   0x5fff..0x6000  (1 bytes)
L_5FFF:
	defb 03ah	; 5fff
