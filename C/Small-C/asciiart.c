/*
zcc +pc88 -create-app -subtype=disk -lm asciiart.c
*/
#include <stdio.h>

void main()
{
	int i, x, y;
	float a, b, ca, cb, t;

	for (y = -12; y <= 12; y++) {
		putchar('\n');
		for (x = -39; x <= 39; x++) {
			ca = x * 0.0458;
			cb = y * 0.08333;
			a = ca;
			b = cb;
			for (i = 0; i <= 15; i++) {
				t = a * a - b * b + ca;
				b = 2 * a * b + cb;
				a = t;
				if ((a * a + b * b) > 4) {
					break;
				}
			}
			putchar("0123456789ABCDEF "[i]);
		}
	}
}
