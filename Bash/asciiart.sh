#!/bin/bash

for y in {-12..12}; do
	for x in {-39..39}; do
		ca=`bc <<< "scale=5; $x * 0.0458"`
		cb=`bc <<< "scale=5; $y * 0.08333"`
		a=$ca
		b=$cb
		chr="."
		for i in {0..15}; do
			t=`bc <<< "scale=10; $a*$a - $b*$b + $ca"`
			b=`bc <<< "scale=10; 2 * $a * $b + $cb"`
			a=$t
			t=`bc <<< "scale=10; $a*$a + $b*$b > 4"`
			if [ $t == 1 ]; then
				chr=`bc <<< "ibase=10; obase=16; $i"`
				break
			fi
		done
		echo -n $chr
	done
	echo
done
