#include <stdio.h>

static int i, x, y;
static float a, b, ca, cb, t;

int main()
{
	for (y = -12; y <= 12; y++) {
		for (x = -39; x <= 39; x++) {
			ca = x * 0.0458f;
			cb = y * 0.08333f;
			a = ca;
			b = cb;
			for (i = 0; i <= 15; i++) {
				t = a * a - b * b + ca;
				b = 2.0f * a * b + cb;
				a = t;
				if ((a * a + b * b) > 4.0f) {
					break;
				}
			}
			putchar("0123456789ABCDEF "[i]);
		}
		putchar('\n');
	}
}
