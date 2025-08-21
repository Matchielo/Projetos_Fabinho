st7/
; 
; short demonstration program
; program does nothing, the goal is only to show the assembler syntax
;

	.NOLIST
	#INCLUDE "ST72311N4.inc"
	.LIST

	BYTES				; define following addresses as short

c1	equ	1			; c1 is the immediate value 1
c2	cequ	2			; c2 may be redefined after this line
c3	equ	3			; but c3 may not be redefined
c2	cequ	{c2+2}			; here c2 is redefined

; here, we use ramrom0 area with rom
; we put constant datas and programs inside
	segment	'ramrom0'
					; addresses are still 8 bit long
.cd1:	DC.B	0			; 8 bit,  value=0
.cd2:	DC.W	proc16			; 16 bit, value=address of 'proc16'
.cd3:	DC.B	proc8			; 8 bit,  value=address of 'proc8'
.cd4:	DC.L	$12345678		; 32 bit, value=12345678 in hexa

; compare this code with code generated for 'proc16'
proc8:	nop				; here a program
	nop
proc8b:
	jrne	proc8b
	nop
	jp	proc8			; will use short address
	ret

; when locating the segments inside classes, the linker will verify if
; no variable overflows the end address specified in the 'segment' directives
; the start and end address of one class must be declared only once time
; (in a configuration file for example)
; segments may be named, used as many time as you want
; they may also be overlapped if you desired (common attributes)
; if an address exceeds the end address, an error is generated during link
; see description about 'segment' in assembler and linker documentations
	segment	'ram0'
					; addresses are still 8 bit long
.dd1:	DS.B	1			; reserve 1 x 8 bit
.dd2:	DS.W	1			; reserve 1 x 16 bit
.dd3:	DS.L	1			; reserve 1 x 32 bit
.dd4:	DS.B	5			; reserve 5 x 8 bit
LEN_DD4	equ	{*-dd4}			; len of dd4
.dd5:	DS.W	2			; reserve 2 x 16 bit

	WORDS				; define following addresses as long

; here, we use ramrom1 area with ram
; we put variables inside
	segment	'ram'
					; addresses are 16 bit long
.ddd1:	DS.B	1			; resrve 1 x 8 bit
.ddd2:	DS.W	2			; resrve 2 x 16 bit
LEN_DDD2 equ	{*-ddd2}		; len of ddd2
.ddd3:	DS.B	3			; resrve 3 x 8 bit

	segment 'rom'
					; addresses are 16 bit long
; compare this code with code generated for 'proc8'
proc16:
	nop
proc16b:
	jrne	proc16b
	nop
	jp	proc16			; will use 16 bit address
	ret

.main:
	ld	a,#1			; use immediate value 1
	ld	a,#c1			; use immediate value defined by c1
	ld	a,#c2			; use immediate value defined by c2
	ld	a,#c3			; use immediate value defined by c3

	ld	a,#14			; default is decimal
	ld	PADR,a
	ld	a,#$C4			; specify hexadecimal
	ld	PBDR,a
	ld	a,#%01101101		; specify binary
	ld	PCDR,a

	ld	a,dd2			; use a short address
	ld	a,ddd2			; use a long address

	call	proc8			; use a short address
	call	proc16			; use a long address

	jp	proc8			; use a short address
	jp	proc16			; use a long address

	jp	[cd3]			; cd3 is a byte address,
					; containing a 1 byte address
	jp	[cd2.w]			; cd2 is a byte address,
					; containing a 2 bytes address


; clear the area reserved for dd4 with 8 bit addresses
; program is not optimal, the goal is only to show the assembler syntax
; using LEN_DD4, declaration may be changed whithout changing the program
; in lot of case, such a writing will prevent a bug
	ld	a, #LEN_DD4		; len of dd4
	ld	x, #dd4			; use x as indice in dd4 array
clrdd4:
	clr	(x)
	inc	x			; increment indice
	dec	a			; decrement loop counter
	jrne	clrdd4

; clear the area reserved for ddd2 with 16 bit addresses
; array is cleared beginning by last element
; program is not optimal, the goal is only to show the assembler syntax
; using LEN_DDD2, declaration may be changed whithout changing the program
; in lot of case, such a writing will prevent a bug
	clr	a			; clear value
	ld	x, #{LEN_DDD2-1}	; use x as indice in ddd2 array
clrddd2:
	ld	(ddd2,x),a
	dec	x			; decrement indice
	jrmi	clrddd2


; see maximum values usuable in ADD instructions
	add	a,#255			; immediaite value
	add	a,255			; direct short
	add	a,65535			; direct long
	add	a,(x)			; indirect
	add	a,(255,x)		; indirect one byte offset
	add	a,(65535,x)		; indirect two bytes offset
	add	a,(y)			; indirect
	add	a,(255,y)		; indirect one byte offset
	add	a,(65535,y)		; indirect two bytes offset
	add	a,[255]			; indirect short
	add	a,[255.w]		; indirect long
	add	a,([255],x)		; short indirect indexed
	add	a,([255.w],x)		; long indirect indexed
	add	a,([255],y)		; short indirect indexed
	add	a,([255.w],y)		; long indirect indexed

; some examples with symbols
	add	a,#c1			; immediate value
	add	a,#cd1			; immediate value
	add	a,cd1			; direct short
	add	a,dd1			; direct short
	add	a,ddd1			; direct long
	add	a,(dd1,x)		; indexed one byte
	add	a,(ddd1,x)		; indexed two byte
	add	a,[cd3]			; indirect short
	add	a,[cd2.w]		; indirect long
	add	a,([cd3],x)		; short indirect indexed
	add	a,([cd2.w],x)		; long indirect indexed

; a relative call to a subroutine
	callr	dep

; loop here
	jp	*


dep:
; some bit access instructions
	bres	100,#2
	bres	[100],#2

	btjt	100,#2,dep
	btjt	100,#2,*

	ret

;
; an example for the interrupt vectors initializations
;
	segment 'vectors'

	DC.W	0
	DC.W	0
	DC.W	0
	DC.W	0
	DC.W	0
	DC.W	0
	DC.W	0
	DC.W	0
	DC.W	0
	DC.W	0
	DC.W	0
	DC.W	0
	DC.W	0
	DC.W	0
	DC.W	0
reset:	DC.W	main

	end

