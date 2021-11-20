comment *
ml /c /coff /Fl /Sa asciiart2.asm
link /subsystem:console asciiart2
*

includelib kernel32

.386
.model flat, c

include kernel32.inc

NULL equ 0
STD_OUTPUT_HANDLE equ -11

.const
hex	db	'0123456789ABCDEF '
f_0458	dd	0.0458
f_08333	dd	0.08333
f2_0	dd	2.0
f4_0	dd	4.0

.data?
hStdOut	dd	?
_a	dd	?
_b	dd	?
_ca	dd	?
_cb	dd	?
_i	dd	?
_t	dd	?
_x	dd	?
_y	dd	?
chr	db	?

.code

start:
	invoke	GetStdHandle, STD_OUTPUT_HANDLE
	mov	hStdOut, eax

	mov	_y, -12
Ly:
	mov	_x, -39
Lx:
	; ca = x * 0.0458f
	fild	dword ptr _x
	fmul	dword ptr f_0458
	fstp	dword ptr _ca

	; cb = y * 0.08333f
	fild	dword ptr _y
	fmul	dword ptr f_08333
	fstp	dword ptr _cb

	; a = ca
	fld	dword ptr _ca
	fstp	dword ptr _a

	; b = cb
	fld	dword ptr _cb
	fstp	dword ptr _b

	mov	_i, 0
Li:
	; t = a * a - b * b + ca
	fld	dword ptr _a
	fmul	dword ptr _a
	fld	dword ptr _b
	fmul	dword ptr _b
	fsubp	st(1), st(0)
	fadd	dword ptr _ca
	fstp	dword ptr _t

	; b = 2 * a * b + cb
	fld	dword ptr f2_0
	fmul	dword ptr _a
	fmul	dword ptr _b
	fadd	dword ptr _cb
	fstp	dword ptr _b

	; a = t
	fld	dword ptr _t
	fstp	dword ptr _a

	; if (a * a + b * b > 4.0f)
	fld	dword ptr _a
	fmul	dword ptr _a
	fld	dword ptr _b
	fmul	dword ptr _b
	faddp	st(1), st(0)
	fcomp	dword ptr f4_0
	fnstsw	ax
	test	ah, 41h
	je	LiE

	inc	_i
	cmp	_i, 15
	jle	Li

LiE:
	mov	edx, _i
	movsx	eax, byte ptr hex[edx]
	mov	chr, al
	invoke	WriteConsole, hStdOut, addr chr, 1, NULL, NULL

	inc	_x
	cmp	_x, 39
	jle	Lx

	mov	chr, 0ah
	invoke	WriteConsole, hStdOut, addr chr, 1, NULL, NULL
	inc	_y
	cmp	_y, 12
	jle	Ly

	invoke	ExitProcess, 0

end start
