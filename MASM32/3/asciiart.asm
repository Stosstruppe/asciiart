comment *
ml /c /coff asciiart.asm
link /subsystem:console asciiart
*
includelib kernel32

.386
.model flat, stdcall
option casemap:none

include windows.inc
include kernel32.inc

.const
hex	db	'0123456789ABCDEF '
star	db	'*'
crlf	db	0dh,0ah

f_0458	dd	0.0458
f_08333	dd	0.08333
f2_0	dd	2.0
f4_0	dd	4.0

.data?
hConOut	dd	?	; HANDLE

i$	dd	?	; int
x$	dd	?
y$	dd	?

a$	dd	?	; float
b$	dd	?
ca$	dd	?
cb$	dd	?
t$	dd	?

.code
start:
	invoke	GetStdHandle, STD_OUTPUT_HANDLE
	mov	hConOut, eax

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
	fnstsw	ax
	test	ah, 41h
	je	Lie

	inc	i$
	cmp	i$, 15
	jle	Li
Lie:
	lea	eax, hex
	add	eax, i$
	invoke	WriteConsole, hConOut, eax, 1, NULL, NULL
	inc	x$
	cmp	x$, 39
	jle	Lx

	invoke	WriteConsole, hConOut, addr crlf, 2, NULL, NULL
	inc	y$
	cmp	y$, 12
	jle	Ly

	invoke	ExitProcess, 0

end start
