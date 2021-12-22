NB. asciiart J
ne =: ~:
not =: -.
or =: +.
c =: ((i: 12) * 0j0.08333) +/ ((i: 39) * 0.0458)
z =: c
s =: c * 0
mandel =. monad define
	m =. s ne 0
	z =: ((z * z) + c) * (not m)
	s =: s + (m or (| z) > 2)
)
mandel ^:] 16
echo (16 - s) { '0123456789ABCDEF '
