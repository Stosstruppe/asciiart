for ($y = -13; $y <= 13; $y++) {
	for ($x = -39; $x <= 39; $x++) {
		$ca = $x * 0.0458;
		$cb = $y * 0.08333;
		$a = $ca;
		$b = $cb;
		for ($i = 0; $i <= 15; $i++) {
			$t = $a * $a - $b * $b + $ca;
			$b = 2 * $a * $b + $cb;
			$a = $t;
			if ($a * $a + $b * $b > 4) {
				printf("%X", $i);
				last;
			}
		}
		if ($i > 15) {
			print " ";
		}
	}
	print "\n";
}
