#!/bin/bash

for y in {-12..12}; do
	for x in {-39..39}; do
		ca=$(($x * 4580))
		cb=$(($y * 8333))
		a=$ca
		b=$cb
		chr="."
		for i in {0..15}; do
			t=$(($a*$a/100000 - $b*$b/100000 + $ca))
			b=$((2*$a*$b/100000 + $cb))
			a=$t
			t=$(($a*$a/100000 + $b*$b/100000))
			if [ $t -gt 400000 ]; then
				chr=`printf "%X" $i`
				break
			fi
		done
		echo -n $chr
	done
	echo
done
