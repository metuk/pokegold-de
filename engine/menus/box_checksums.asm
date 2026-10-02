; The European releases protect each PC box with a checksum.
; A box whose checksum doesn't match sets its bit in sBoxChecksumErrors.

ClearBoxChecksumErrors:
	ld a, BANK(sBoxChecksumErrors)
	call OpenSRAM
	xor a
	ld hl, sBoxChecksumErrors
	ld [hli], a
	ld [hl], a
	call CloseSRAM
	ret

CheckBoxChecksums:
	xor a
	ld bc, 0
.loop
	srl b
	rr c
	push af
	push bc
	call GetBoxBankAndAddress
	call CalcBoxChecksum
	pop bc
	ld a, e
	cp [hl]
	jr nz, .bad
	inc hl
	ld a, d
	cp [hl]
	jr z, .ok
.bad
	set (NUM_BOXES - 1) - 8, b
.ok
	pop af
	inc a
	cp NUM_BOXES
	jr c, .loop
	ld a, BANK(sBoxChecksumErrors)
	call OpenSRAM
	ld hl, sBoxChecksumErrors
	ld a, [hl]
	or c
	ld [hli], a
	ld a, [hl]
	or b
	ld [hl], a
	call CloseSRAM
	ret

UpdateBoxChecksums:
	xor a
.loop
	push af
	call GetBoxBankAndAddress
	call CalcBoxChecksum
	ld [hl], e
	inc hl
	ld [hl], d
	pop af
	inc a
	cp NUM_BOXES
	jr c, .loop
	call CloseSRAM
	ret

CalcBoxChecksum:
; Sum the bytes of the box at hl in SRAM bank a into de.
; hl ends up pointing to the box's checksum.
	ld bc, BOX_LENGTH - 2
	ld de, 0
	call OpenSRAM
.loop
	ld a, [hli]
	add e
	ld e, a
	ld a, d
	adc 0
	ld d, a
	dec bc
	ld a, b
	or c
	jr nz, .loop
	ret

GetBoxBankAndAddress:
; Return the SRAM bank of box a in a, and its address in hl.
	push de
	ld h, a
	add a
	add h
	ld h, 0
	ld l, a
	ld de, .Boxes
	add hl, de
	ld a, [hli]
	push af
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop af
	pop de
	ret

.Boxes:
	table_width 3
for n, 1, NUM_BOXES + 1
	dba sBox{d:n}
endr
	assert_table_length NUM_BOXES
