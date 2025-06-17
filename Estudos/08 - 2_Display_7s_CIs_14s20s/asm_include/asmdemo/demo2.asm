st7/

.lab2.b	equ $80

	segment 'rom'

	nop
.lab1	ld a,(x)
	ld a,(0,x)
	ld a,(127,x)
	ld a,(259,x)
	ld a,#lab1.h
	ld a,#lab1.l
	end
