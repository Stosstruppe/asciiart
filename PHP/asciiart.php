<?php
for ($y = -12; $y <= 12; $y++) {
	for ($x = -39; $x <= 39; $x++) {
		$ca = $x * 0.0458;
		$cb = $y * 0.08333;
		$a = $ca;
		$b = $cb;
		$chr = " ";
		for ($i = 0; $i <= 15; $i++) {
			$t = $a*$a - $b*$b + $ca;
			$b = 2*$a*$b + $cb;
			$a = $t;
			if ($a*$a + $b*$b > 4) {
				$chr = sprintf("%X", $i);
				break;
			}
		}
		print $chr;
	}
	print "\n";
}
?>
