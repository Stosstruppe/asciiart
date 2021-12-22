// asciiart Q#
namespace qsharp {
	open Microsoft.Quantum.Canon;
	open Microsoft.Quantum.Convert;
	open Microsoft.Quantum.Intrinsic;
	
	function Asciiart () : Unit {
		for (y in -12 .. 12) {
			mutable line = "";
			for (x in -39 .. 39) {
				let ca = IntAsDouble(x) * 0.0458;
				let cb = IntAsDouble(y) * 0.08333;
				mutable a = ca;
				mutable b = cb;
				mutable s = " ";
				mutable i = 0;
				while (i <= 15) {
					let t = a * a - b * b + ca;
					set b = 2.0 * a * b + cb;
					set a = t;
					if ((a * a + b * b) > 4.0) {
						set s = IntAsStringWithFormat(i, "X");
						set i = 15;
					}
					set i += 1;
				}
				set line += s;
			}
			Message(line);
		}
	}
}
