\\ asciiart PARI/GP
{
	for (y = -12, 12,
		for (x = -39, 39,
			c = x * 0.0458 + y * 0.08333 * I;
			z = c;
			s = " ";
			for (i = 0, 15,
				z = z * z + c;
				if (abs(z) > 2,
					s = Strprintf("%X", i);
					break
				)
			);
			print1(s)
		);
		print()
	)
}
