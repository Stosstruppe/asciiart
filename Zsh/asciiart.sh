# asciiart Z shell

for y in {-12..12}; do
	for x in {-39..39}; do
		ca=$(($x * 0.0458))
		cb=$(($y * 0.08333))
		a=$ca
		b=$cb
		s=" "
		for i in {0..15}; do
			t=$(($a * $a - $b * $b + $ca))
			b=$((2 * $a * $b + $cb))
			a=$t
			if [[ $(($a * $a + $b * $b)) -gt 4 ]]; then
				s=`printf "%X" $i`
				break
			fi
		done
		echo -n $s
	done
	echo
done
