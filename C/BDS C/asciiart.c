/*
cpm -a cc b:asciiart
cpm -a clink b:asciiart a:bcd
*/
#include <stdio.h>
#include <mconfig.h>

main()
{
	int i, x, y;
	FLOAT(a);
	FLOAT(b);
	FLOAT(ca);
	FLOAT(cb);
	FLOAT(t);
	FLOAT(w1);
	FLOAT(w2);

	for (y = -12; y <= 12; y++) {
		for (x = -39; x <= 39; x++) {
			fpmult(itof(w1, x), atof(w2, "0.0458"), ca);
			fpmult(itof(w1, y), atof(w2, "0.08333"), cb);
			assign(a, ca);
			assign(b, cb);
			for (i = 0; i <= 15; i++) {
				/* t = a * a - b * b + ca */
				fpmult(a, a, w1);
				fpmult(b, b, w2);
				fpsub(w1, w2, w1);
				fpadd(w1, ca, t);
				/* b = 2 * a * b + cb */
				fpmult(a, b, w1);
				fpmult(itof(w2, 2), w1, w1);
				fpadd(w1, cb, b);
				/* a = t */
				assign(a, t);

				/* (a * a + b * b) > 4 */
				fpmult(a, a, w1);
				fpmult(b, b, w2);
				fpadd(w1, w2, w1);
				if (fscmp(w1, itof(w2, 4)) < 0) {
					break;
				}
			}
			putchar("0123456789ABCDEF "[i]);
		}
		putchar('\n');
	}
}
