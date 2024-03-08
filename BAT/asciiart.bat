@echo off
setlocal enabledelayedexpansion
set hex=0123456789ABCDEF

for /l %%y in (-12, 1, 12) do (
	set s=
	for /l %%x in (-39, 1, 39) do (
		set /a ca = %%x * 458
		set /a cb = %%y * 833
		set /a a = ca
		set /a b = cb
		set c=.
		set brk=0
		for /l %%i in (0, 1, 15) do if !brk!==0 (
			set /a t = a * a / 10000 - b * b / 10000 + ca
			set /a b = 2 * a * b / 10000 + cb
			set /a a = t
			set /a t = a * a / 10000 + b * b / 10000
			if !t! gtr 40000 (
				set c=!hex:~%%i,1!
				set brk=1
			)
		)
		set s=!s!!c!
	)
	echo !s!
)
