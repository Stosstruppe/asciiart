comment *
ml /c /Fl asciiart.asm
link16 /t asciiart;
*
	.model	tiny
	.code
	org	100h
start:
	mov	bx, offset _HEX
	mov	cx, -12
Ly:
	mov	_y, cx
	mov	di, offset _buf
	cld
	mov	cx, -39
Lx:
	mov	_x, cx
	; ca = x * 0.0458;
	fild	_x
	fmul	_CX
	fst	_ca
	fstp	_a
	; cb = y * 0.08333;
	fild	_y
	fmul	_CY
	fst	_cb
	fstp	_b
	xor	cx, cx
Li:
	; t = a * a - b * b + ca
	fld	_a
	fmul	st, st
	fld	_b
	fmul	st, st
	fsubp	st(1), st
	fadd	_ca
	; b = 2 * a * b + cb
	fld	_a
	fmul	_b
	fadd	st, st
	fadd	_cb
	fstp	_b
	fstp	_a
	; if ((a * a + b * b) > 4) break;
	fld	_a
	fmul	st, st
	fld	_b
	fmul	st, st
	faddp	st(1), st
	fcomp	_4
	fstsw	_sw	; .286 ax ok
	mov	ax, _sw
	sahf
	ja	Librk

	inc	cx
	cmp	cx, 15
	jle	Li
Librk:
	mov	al, cl
	xlat
	stosb

	mov	cx, _x
	inc	cx
	cmp	cx, 39
	jle	Lx

	mov	ah, 09h
	mov	dx, offset _buf
	int	21h

	mov	cx, _y
	inc	cx
	cmp	cx, 12
	jle	Ly
	ret

_CX	real8	0.0458
_CY	real8	0.08333
_4	real8	4.0
_HEX	db	'0123456789ABCDEF '
_buf	db	79 dup (?),0dh,0ah,'$'
_a	real8	?
_b	real8	?
_ca	real8	?
_cb	real8	?
_x	dw	?
_y	dw	?
_sw	dw	?

	end	start
