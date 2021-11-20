#include <stdio.h>

#define BASE 10000

int main()
{
	for (int y = -12; y <= 12; y++) {
		for (int x = -39; x <= 39; x++) {
			int ca = x * 458;
			int cb = y * 833;
			int a = ca;
			int b = cb;
			int i;
			for (i = 0; i <= 15; i++) {
				int t = (a * a - b * b) / BASE + ca;
				b = 2 * a * b / BASE + cb;
				a = t;
				if ((a * a + b * b) / BASE > 4 * BASE) {
					break;
				}
			}
			putchar("0123456789ABCDEF "[i]);
		}
		putchar('\n');
	}
}
