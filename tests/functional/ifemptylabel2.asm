	org 32768
__START_PROGRAM:
	di
	push ix
	push iy
	exx
	push hl
	exx
	ld hl, 0
	add hl, sp
	ld (__CALL_BACK__), hl
	ei
	ld hl, _a
	inc (hl)
	jp __LABEL1
__LABEL0:
__LABEL__Here:
	ld a, (_a)
	add a, 2
	ld (_a), a
__LABEL1:
	jp __LABEL__Here
__END_PROGRAM:
	di
	ld hl, (__CALL_BACK__)
	ld sp, hl
	exx
	pop hl
	exx
	pop iy
	pop ix
	ei
	ret
__CALL_BACK__:
	DEFW 0
ZXBASIC_USER_DATA:
_a:
	DEFB 00
; Defines DATA END --> HEAP size is 0
ZXBASIC_USER_DATA_END:
	; Defines USER DATA Length in bytes
ZXBASIC_USER_DATA_LEN EQU ZXBASIC_USER_DATA_END - ZXBASIC_USER_DATA
	END
