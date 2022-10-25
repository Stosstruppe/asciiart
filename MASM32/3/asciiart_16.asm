comment *
ml /c asciiart.asm
link16 /t asciiart;
msdos asciiart
*
.model tiny

.code
	org	0100h
start:
	mov	y$, -12
Ly:
	mov	x$, -39
Lx:
	fild	x$
	fmul	f_0458
	fstp	ca$
	fild	y$
	fmul	f_08333
	fstp	cb$
	fld	ca$
	fstp	a$
	fld	cb$
	fstp	b$

	mov	i$, 0
Li:
			; t = a * a - b * b + ca;
	fld	a$
	fmul	a$
	fld	b$
	fmul	b$
	fsubp	st(1), st(0)
	fadd	ca$
	fstp	t$
			; b = 2.0 * a * b + cb;
	fld	a$
	fmul	f2_0
	fmul	b$
	fadd	cb$
	fstp	b$
			; a = t;
	fld	t$
	fstp	a$
			; if ((a * a + b * b) > 4.0) break;
	fld	a$
	fmul	a$
	fld	b$
	fmul	b$
	faddp	st(1), st(0)
	fcomp	f4_0
	fnstsw	stat$
	mov	ax, stat$
	test	ah, 41h
	je	LiE

	inc	i$
	cmp	i$, 15
	jle	Li
LiE:
	mov	si, i$
	mov	dl, [si + hex]
	mov	ah, 02h
	int	21h

	inc	x$
	cmp	x$, 39
	jle	Lx

	mov	ah, 02h
	mov	dl, 0dh
	int	21h
	mov	dl, 0ah
	int	21h

	inc	y$
	cmp	y$, 12
	jle	Ly

	mov	ax, 4c00h
	int	21h

hex	db	'0123456789ABCDEF '
f_0458	dd	0.0458
f_08333	dd	0.08333
f2_0	dd	2.0
f4_0	dd	4.0

i$	dw	?	; int
stat$	dw	?
x$	dw	?
y$	dw	?

a$	dd	?	; float
b$	dd	?
ca$	dd	?
cb$	dd	?
t$	dd	?

end start
