; Linux 32bit (nasm 2.14)

global _start

section .const

hex	db	'0123456789ABCDEF '
f_0458	dd	0.0458
f_08333	dd	0.08333
f2_0	dd	2.0
f4_0	dd	4.0

section .bss
_a	resd	1
_b	resd	1
_ca	resd	1
_cb	resd	1
_i	resd	1
_t	resd	1
_x	resd	1
_y	resd	1
chr	resb	1

section .text

_start:
	mov	dword [_y], -12
Ly:
	mov	dword [_x], -39
Lx:
	; ca = x * 0.0458f
	fild	dword [_x]
	fmul	dword [f_0458]
	fstp	dword [_ca]

	; cb = y * 0.08333f
	fild	dword [_y]
	fmul	dword [f_08333]
	fstp	dword [_cb]

	; a = ca
	fld	dword [_ca]
	fstp	dword [_a]

	; b = cb
	fld	dword [_cb]
	fstp	dword [_b]

	mov	dword [_i], 0
Li:
	; t = a * a - b * b + ca
	fld	dword [_a]
	fmul	dword [_a]
	fld	dword [_b]
	fmul	dword [_b]
	fsubp	st1, st0
	fadd	dword [_ca]
	fstp	dword [_t]

	; b = 2 * a * b + cb
	fld	dword [f2_0]
	fmul	dword [_a]
	fmul	dword [_b]
	fadd	dword [_cb]
	fstp	dword [_b]

	; a = t
	fld	dword [_t]
	fstp	dword [_a]

	; if (a * a + b * b > 4.0f)
	fld	dword [_a]
	fmul	dword [_a]
	fld	dword [_b]
	fmul	dword [_b]
	faddp	st1, st0
	fcomp	dword [f4_0]
	fnstsw	ax
	test	ah, 41h
	je	LiE

	inc	dword [_i]
	cmp	dword [_i], 15
	jle	Li

LiE:
	mov	ebx, [_i]
	mov	al, [ebx + hex]
	mov	[chr], al
	mov	eax, 04h	; write
	mov	ebx, 1
	mov	ecx, chr
	mov	edx, 1
	int	80h

	inc	dword [_x]
	cmp	dword [_x], 39
	jle	Lx

	mov	byte [chr], 0ah
	mov	eax, 04h	; write
	mov	ebx, 1
	mov	ecx, chr
	mov	edx, 1
	int	80h

	inc	dword [_y]
	cmp	dword [_y], 12
	jle	Ly

	mov	eax, 01h	; exit
	mov	ebx, 0
	int	80h
