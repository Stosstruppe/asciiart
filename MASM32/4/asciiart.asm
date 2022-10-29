comment *
ml /c /Fl /Sa asciiart.asm
link16 /t asciiart;
msdos asciiart
*
.model tiny

mul32 proto c :word, :word, :word
add32 proto c :word, :word, :word
sub32 proto c :word, :word, :word

.data
hex	db	'0123456789ABCDEF '

i$	dw	?
x$	dw	?
y$	dw	?

a$	dd	?
b$	dd	?
ca$	dd	?
cb$	dd	?
t$	dd	?
w$	dd	?

.code
	org	0100h
start:
	mov	ax, ds
	mov	es, ax

	mov	y$, -12
Ly:
	mov	x$, -39
Lx:
			; ca = x * 0.0458;
	mov	ax, x$
	mov	cx, 375
	mul	cx
	cwd
	mov	word ptr ca$, ax
	mov	word ptr ca$+2, dx
	mov	word ptr a$, ax
	mov	word ptr a$+2, dx
			; cb = y * 0.08333;
	mov	ax, y$
	mov	cx, 683
	mul	cx
	cwd
	mov	word ptr cb$, ax
	mov	word ptr cb$+2, dx
	mov	word ptr b$, ax
	mov	word ptr b$+2, dx

	mov	i$, 0
Li:
			; t = a * a - b * b + ca;
	invoke	mul32, addr t$, addr a$, addr a$
	invoke	mul32, addr w$, addr b$, addr b$
	invoke	sub32, addr t$, addr t$, addr w$
	invoke	add32, addr t$, addr t$, addr ca$
			; b = 2.0 * a * b + cb;
	invoke	mul32, addr b$, addr a$, addr b$
	invoke	add32, addr b$, addr b$, addr b$
	invoke	add32, addr b$, addr b$, addr cb$
			; a = t;
	mov	ax, word ptr t$
	mov	dx, word ptr t$+2
	mov	word ptr a$, ax
	mov	word ptr a$+2, dx
			; if ((a * a + b * b) > 4.0) break;
	invoke	mul32, addr t$, addr a$, addr a$
	invoke	mul32, addr w$, addr b$, addr b$
	invoke	add32, addr t$, addr t$, addr w$
	cmp	word ptr t$+2, 0
	ja	LiE
	cmp	word ptr t$, 32768
	ja	LiE

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

mul32 proc c pc$:word, pa$:word, pb$:word
	push	si
	push	di

	mov	si, pa$
	mov	di, pb$
				; a[0] * b[1]
	mov	ax, [si]
	mov	cx, [di+2]
	mul	cx
	push	ax
				; a[1] * b[0]
	mov	ax, [si+2]
	mov	cx, [di]
	mul	cx
	push	ax
				; dx:ax = a[0] * b[0]
	mov	ax, [si]
	mov	cx, [di]
	mul	cx
	pop	cx
	add	dx, cx
	pop	cx
	add	dx, cx
				; dx:ax / 8192
	mov	cx, 13
@@:
	sar	dx, 1
	rcr	ax, 1
	loop	@b

	mov	di, pc$
	mov	[di], ax
	mov	[di+2], dx

	pop	di
	pop	si
	ret
mul32 endp

add32 proc c pc$:word, pa$:word, pb$:word
	push	si

	mov	si, pa$
	mov	ax, [si]
	mov	dx, [si+2]
	mov	si, pb$
	add	ax, [si]
	adc	dx, [si+2]
	mov	si, pc$
	mov	[si], ax
	mov	[si+2], dx

	pop	si
	ret
add32 endp

sub32 proc c pc$:word, pa$:word, pb$:word
	push	si

	mov	si, pa$
	mov	ax, [si]
	mov	dx, [si+2]
	mov	si, pb$
	sub	ax, [si]
	sbb	dx, [si+2]
	mov	si, pc$
	mov	[si], ax
	mov	[si+2], dx

	pop	si
	ret
sub32 endp

end start
