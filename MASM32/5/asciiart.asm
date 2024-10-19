comment *
ml /c asciiart.asm
link16 /t asciiart;
*
	.286
	.model	tiny
	.code
	org	100h
start:
	mov	cx, -12
loop_y:
	push	cx	; [
				; cb = y * 0.08333
	mov	_tmp, cx
	fild	word ptr _tmp
	fmul	qword ptr _dy
	fstp	qword ptr _cb

	mov	cx, -39
loop_x:
	push	cx	; [[
				; ca = x * 0.0458
	mov	_tmp, cx
	fild	word ptr _tmp
	fmul	qword ptr _dx
	fstp	qword ptr _ca

	fld	qword ptr _ca
	fstp	qword ptr _a
	fld	qword ptr _cb
	fstp	qword ptr _b

	mov	cx, 0
loop_i:
				; t = a * a - b * b + ca
	fld	qword ptr _a
	fmul	qword ptr _a
	fld	qword ptr _b
	fmul	qword ptr _b
	fsub
	fadd	qword ptr _ca
				; b = 2 * a * b + cb
	fld	qword ptr _a
	fmul	qword ptr _b
	fadd	st(0), st(0)
	fadd	qword ptr _cb
	fstp	qword ptr _b
				; t = a
	fstp	qword ptr _a
				; (a * a + b * b) > 4
	fld	qword ptr _a
	fmul	qword ptr _a
	fld	qword ptr _b
	fmul	qword ptr _b
	fadd
	fcomp	qword ptr _4
	fstsw	ax
	sahf
	ja	break_i

	inc	cx
	cmp	cx, 15
	jle	loop_i
break_i:
	mov	al, cl
	mov	bx, offset _hex
	xlat
	mov	dl, al
	mov	ah, 02h
	int	21h

	pop	cx	; ]]
	inc	cx
	cmp	cx, 39
	jle	loop_x

	mov	dl, 0ah
	mov	ah, 02h
	int	21h

	pop	cx	; ]
	inc	cx
	cmp	cx, 12
	jle	loop_y
	ret

	.const
_dx	dq	0.0458
_dy	dq	0.08333
_4	dq	4.0
_hex	db	'0123456789ABCDEF '

	.data?
_a	dq	?
_b	dq	?
_ca	dq	?
_cb	dq	?
_tmp	dw	?

	end	start
