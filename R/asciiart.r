# asciiart R 3.5.2
for (y in -12:12) {
	for (x in -39:39) {
		ca <- x * 0.0458
		cb <- y * 0.08333
		a <- ca
		b <- cb
		s <- " "
		for (i in 0:15) {
			t <- a * a - b * b + ca
			b <- 2 * a * b + cb
			a <- t
			if ((a * a + b * b) > 4) {
				s = sprintf("%X", i)
				break
			}
		}
		cat(s)
	}
	cat("\n")
}
