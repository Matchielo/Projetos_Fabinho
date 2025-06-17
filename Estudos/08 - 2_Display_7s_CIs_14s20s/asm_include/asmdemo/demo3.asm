st7/

	extern lab1,lab2.b

	segment 'rom'

	ld a,#{lab1+$227}.h
	ld a,#{lab1+$227}.l
	ld a,[lab2]
	ld a,[lab2.b]
	ld a,[lab2.w]
	ld a,([lab2],x)
	ld a,([lab2.b],x)
	ld a,([lab2.w],x)
	ld a,([lab2],y)
	ld a,([lab2.b],y)
	ld a,([lab2.w],y)
	nop
	end
