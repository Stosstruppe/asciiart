NB. asciiart J
c =: ((i: 12) * 0j0.08333) +/ ((i: 39) * 0.0458)
verb : 0 ''
	z =. c
	s =. c * 0
	for. i. 16 do.
		z =. (z * z) + c
		b =. (| z) > 2
		s =. s + b
		z =. (z * (-. b)) + (b * 10)
	end.
	echo '0123456789ABCDEF ' {~ 16 - s
)
