#!/bin/bash

readonly HEX=(0 1 2 3 4 5 6 7 8 9 A B C D E F)
readonly BASE=10000
for y in $(seq -12 12); do
	line=''
	for x in $(seq -39 39); do
		ca=$(($x * 458))
		cb=$(($y * 833))
		a=$ca
		b=$cb
		s=' '
		for i in $(seq 0 15); do
			t=$(($a * $a / $BASE - $b * $b / $BASE + $ca))
			b=$((2 * $a * $b / $BASE + $cb))
			a=$t
			t=$(($a * $a / $BASE + $b * $b / $BASE))
			if [[ $t -gt 40000 ]]; then
				s=${HEX[$i]}
				break
			fi
		done
		line=$line$s
	done
	echo "${line}"
done
