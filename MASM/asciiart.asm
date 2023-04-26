comment *
ml /c asciiart.asm
link /subsystem:console asciiart
*
includelib kernel32

NULL equ 0
STD_OUTPUT_HANDLE equ -11

BASEBIT equ 12
BASE equ (1 shl BASEBIT)

.model flat

ExitProcess proto stdcall :dword
GetStdHandle proto stdcall :dword
WriteConsoleA proto stdcall :dword,:dword,:dword,:dword,:dword

.const
hex$	db	'0123456789ABCDEF '
crlf	db	0dh,0ah

.data?
hOut	dd	?
i$	dd	?
x$	dd	?
y$	dd	?
ca$	dd	?
cb$	dd	?
a$	dd	?
b$	dd	?
aa$	dd	?
bb$	dd	?

.code

start proc c
	invoke	GetStdHandle, STD_OUTPUT_HANDLE
	mov	hOut, eax
				; for (y = -12; y <= 12; y++)
	mov	y$, -12
L10:
	mov	eax, 341	; 0.08333 * BASE
	imul	y$
	mov	cb$, eax
				; for (x = -39; x <= 39; x++)
	mov	x$, -39
L20:
	mov	eax, 188	; 0.0458 * BASE
	imul	x$
	mov	ca$, eax

	mov	eax, ca$
	mov	a$, eax
	mov	eax, cb$
	mov	b$, eax
				; for (i = 0; i <= 15; i++)
	mov	i$, 0
L30:
	call	power
				; b = 2 * a * b + cb
	mov	eax, a$
	imul	b$
	sar	eax, (BASEBIT - 1)
	add	eax, cb$
	mov	b$, eax
				; a = aa - bb + ca
	mov	eax, aa$
	sub	eax, bb$
	add	eax, ca$
	mov	a$, eax
				; if ((aa + bb) > 4) break
	call	power
	mov	eax, aa$
	add	eax, bb$
	cmp	eax, (4 * BASE)
	jg	L40

	inc	i$
	cmp	i$, 15
	jle	L30
L40:
				; putchar(hex[i])
	mov	esi, offset hex$
	add	esi, i$
	invoke	WriteConsoleA, hOut, esi, 1, NULL, NULL
	inc	x$
	cmp	x$, 39
	jle	L20

	invoke	WriteConsoleA, hOut, addr crlf, 2, NULL, NULL
	inc	y$
	cmp	y$, 12
	jle	L10

	invoke	ExitProcess, 0
start endp

power proc c
				; aa = a * a
	mov	eax, a$
	imul	eax
	sar	eax, BASEBIT
	mov	aa$, eax
				; bb = b * b
	mov	eax, b$
	imul	eax
	sar	eax, BASEBIT
	mov	bb$, eax
	ret
power endp

end start
