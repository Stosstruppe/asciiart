/* Rexx (Regina) */
hex = "0123456789ABCDEF "
do y = -12 to 12
	line = ""
	do x = -39 to 39
		ca = x * 0.0458
		cb = y * 0.08333
		a = ca
		b = cb
		do i = 0 to 15
			t = a * a - b * b + ca
			b = 2 * a * b + cb
			a = t
			if a * a + b * b > 4 then do
				leave
			end
		end
		line = line || substr(hex, i + 1, 1)
	end
	say line
end
