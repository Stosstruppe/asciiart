identification division.
program-id. asciiart.

data division.
working-storage section.
77 hex pic x(16) value "0123456789ABCDEF".
77 ca pic s99v9(5).
77 cb pic s99v9(5).
77 a pic s99v9(10).
77 b pic s99v9(10).
77 t pic s99v9(10).
77 x pic s99.
77 y pic s99.
77 i pic 99.
77 d pic x.

procedure division.
	perform varying y from -12 by 1 until y > 12
		perform varying x from -39 by 1 until x > 39
			compute ca = x * 0.0458
			compute cb = y * 0.08333
			move ca to a
			move cb to b
			move " " to d
			perform varying i from 1 by 1 until i > 16
				compute t = a * a - b * b + ca
				compute b = 2 * a * b + cb
				move t to a
				compute t = a * a + b * b
				if t > 4
					move hex(i:1) to d
					move 16 to i
				end-if
			end-perform
			display d with no advancing
		end-perform
		display ""
	end-perform.
	stop run.
