// asciiart Scala

import scala.util.control.Breaks._

object Main extends App {
	for (y <- -12 to 12) {
		for (x <- -39 to 39) {
			var ca = x * 0.0458;
			var cb = y * 0.08333;
			var a = ca;
			var b = cb;
			var s = " ";
			breakable {
				for (i <- 0 to 15) {
					var t = a * a - b * b + ca;
					b = 2 * a * b + cb;
					a = t;
					if ((a * a + b * b) > 4) {
						s = i.toHexString.toUpperCase();
						break;
					}
				}
			}
			print(s);
		}
		println();
	}
}
