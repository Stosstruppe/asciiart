comment *
ml /c /Fl asciiart.asm
link16 /t asciiart;
*
BASE	equ	1024

	.model	tiny
	.code
	org	100h
start:
	mov	_y, -12
Ly:
	mov	di, offset buf
	cld
	mov	_x, -39
Lx:
	; ca = x * 0.0458
	mov	ax, 47
	imul	_x
	mov	_ca, ax
	mov	_a, ax
	; cb = y * 0.08333
	mov	ax, 85
	imul	_y
	mov	_cb, ax
	mov	_b, ax
	xor	cx, cx
Li:
	; t = a * a - b * b + ca
	mov	ax, _b
	mov	dx, _b
	call	bmul
	mov	bx, ax
	mov	ax, _a
	mov	dx, _a
	call	bmul
	sub	ax, bx
	add	ax, _ca
	push	ax	; [
	; b = 2 * a * b + cb
	mov	ax, _a
	mov	dx, _b
	call	bmul
	add	ax, ax
	add	ax, _cb
	mov	_b, ax
	pop	_a	; ]
	; if ((a * a + b * b) > 4) break
	mov	ax, _a
	mov	dx, _a
	call	bmul
	mov	bx, ax
	mov	ax, _b
	mov	dx, _b
	call	bmul
	add	ax, bx
	cmp	ax, 4 * BASE
	ja	Librk
	inc	cx
	cmp	cx, 15
	jle	Li
Librk:
	mov	al, cl
	mov	bx, offset hex
	xlat
	stosb
	inc	_x
	cmp	_x, 39
	jle	Lx

	mov	ah, 09h
	mov	dx, offset buf
	int	21h
	inc	_y
	cmp	_y, 12
	jle	Ly
	ret

; ax = (dx:ax + 512) >> 10
bmul:
	imul	dx
	add	ax, 512
	adc	dx, 0
	mov	al, ah
	mov	ah, dl
	mov	dl, dh
	rcr	dx, 1
	rcr	ax, 1
	rcr	dx, 1
	rcr	ax, 1
	ret

hex	db	'0123456789ABCDEF '
buf	db	79 dup (?),0dh,0ah,'$'
_a	dw	?
_b	dw	?
_ca	dw	?
_cb	dw	?
_t	dw	?
_x	dw	?
_y	dw	?

	end	start
