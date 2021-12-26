\\ asciiart PARI/GP
{
	c = matrix(25,79, y,x, (x-40)*0.0458+(y-13)*0.08333*I);
	z = c;
	s = c * 0;
	for (i = 0, 15,
		z = apply(x-> x*x, z) + c;
		\\z = apply(x-> if (abs(x)>2, 10, x), z);
		s = s + apply(x-> abs(x)>2, z);
	);

	hex = Vecsmall("0123456789ABCDEF ");
	for (y = 1, 25,
		for (x = 1, 79,
			print1(Strchr(hex[17-s[y,x]]));
		);
		print();
	);
}
