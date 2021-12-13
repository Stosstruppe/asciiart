/* asciiart B ybc */
base 10000;
main() {
	extrn base;
	auto a, b, t, ca, cb;
	auto i, x, y, s;

	y = -12;
	while (y <= 12) {
		x = -39;
		while (x <= 39) {
			ca = x * 458;
			cb = y * 833;
			a = ca;
			b = cb;
			s = ' ';
			i = 0;
			while (i <= 15) {
				t = (a * a - b * b) / base + ca;
				b = (2 * a * b) / base + cb;
				a = t;
				if ((a * a + b * b) / base > 4 * base) {
					s = (i < 10 ? 48 : 55) + i;
					break;
				}
				i++;
			}
			putchar(s);
			x++;
		}
		putchar('*n');
		y++;
	}
}
