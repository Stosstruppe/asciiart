for y in -12..12
	for x in -39..39
		ca = x * 0.0458
		cb = y * 0.08333
		a = ca
		b = cb
		chr = " "
		for i in 0..15
			t = a * a - b * b + ca
			b = 2 * a * b + cb
			a = t
			if a * a + b * b > 4 then
				chr = "%X" % i
				break
			end
		end
		print(chr)
	end
	print("\n")
end
