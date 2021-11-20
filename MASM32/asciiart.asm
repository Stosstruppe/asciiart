comment *
ml /c /coff /Fl /Sa asciiart.asm
link /subsystem:console asciiart
*

includelib kernel32

.386
.model flat, c
; option casemap: none

include kernel32.inc

NULL equ 0
STD_OUTPUT_HANDLE equ -11

BASE equ 10000

.const
hex	db	'0123456789ABCDEF '

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
	; ca = x * 458
	mov	eax, _x
	mov	edx, 0
	mov	ecx, 458
	imul	ecx
	mov	_ca, eax

	; cb = y * 833
	mov	eax, _y
	mov	edx, 0
	mov	ecx, 833
	imul	ecx
	mov	_cb, eax

	; a = ca
	; b = cb
	mov	eax, _ca
	mov	_a, eax
	mov	eax, _cb
	mov	_b, eax

	mov	_i, 0
Li:
	; t = (a * a - b * b) / BASE + ca
	mov	eax, _a
	imul	eax, _a
	mov	ecx, _b
	imul	ecx, _b
	sub	eax, ecx
	cdq
	mov	ecx, BASE
	idiv	ecx
	add	eax, _ca
	mov	_t, eax

	; b = 2 * a * b / BASE + cb
	mov	eax, _a
	shl	eax, 1
	imul	eax, _b
	cdq
	mov	ecx, BASE
	idiv	ecx
	add	eax, _cb
	mov	_b, eax

	; a = t
	mov	eax, _t
	mov	_a, eax

	; if ((a * a + b * b) / BASE > 4 * BASE)
	mov	eax, _a
	imul	eax, _a
	mov	ecx, _b
	imul	ecx, _b
	add	eax, ecx
	cdq
	mov	ecx, BASE
	idiv	ecx
	cmp	eax, 4 * BASE
	jg	LiE

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
