#include <stdio.h>

int main()
{
	for (int y = -12; y <= 12; y++) {
		for (int x = -39; x <= 39; x++) {
			float ca = x * 0.0458f;
			float cb = y * 0.08333f;
			float a = ca;
			float b = cb;
			int i;
			for (i = 0; i <= 15; i++) {
				float t = a * a - b * b + ca;
				b = 2 * a * b + cb;
				a = t;
				if (a * a + b * b > 4) {
					printf("%X", i);
					break;
				}
			}
			if (i > 15) printf(" ");
		}
		printf("\n");
	}
}
