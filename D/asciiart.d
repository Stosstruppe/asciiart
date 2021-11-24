// asciiart D (dmd 2.085.0)
import std.stdio;

void main() {
	for (auto y = -12; y <= 12; y++) {
		for (auto x = -39; x <= 39; x++) {
            auto ca = x * 0.0458;
            auto cb = y * 0.08333;
            auto a = ca;
            auto b = cb;
            auto s = ' ';
            for (auto i = 0; i <= 15; i++) {
                auto t = a * a - b * b + ca;
                b = 2 * a * b + cb;
                a = t;
                if ((a * a + b * b) > 4) {
                    s = "0123456789ABCDEF"[i];
                    break;
                }
            }
			write(s);
		}
		writeln();
	}
}
