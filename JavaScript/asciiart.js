// SMonkey

"use strict";

for (let y = -12; y <= 12; y++) {
	for (let x = -39; x <= 39; x++) {
		let ca = x * 0.0458;
		let cb = y * 0.08333;
		let a = ca;
		let b = cb;
		let s = " ";
		for (let i = 0; i <= 15; i++) {
			let t = a * a - b * b + ca;
			b = 2 * a * b + cb;
			a = t;
			if ((a * a + b * b) > 4) {
				s = i.toString(16).toUpperCase();
				break;
			}
		}
		putstr(s);
	}
	print();
}
