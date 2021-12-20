NB. asciiart J
monad define ''
	for_k. i:12 do.
		for_j. i:39 do.
			c =. (j * 0.0458) j. (k * 0.08333)
			z =. c
			s =. ' '
			for_i. i.16 do.
				z =. (z * z) + c
				if. (|z) > 2 do.
					s =. toupper hfd i
					break.
				end.
			end.
			tmoutput s
		end.
		echo ''
	end.
)
