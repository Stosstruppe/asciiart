# asciiart Python 3
for y in range(-12, 13):
	for x in range(-39, 40):
		c = complex(x * 0.0458, y * 0.08333)
		z = c
		for i in range(16):
			z = z**2 + c
			if abs(z) > 2:
				print(f"{i:X}", end="")
				break
		else:
			print(" ", end="")
	print()
