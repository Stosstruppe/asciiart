"Smalltalk"
| a b t ca cb s |
hex := #('0' '1' '2' '3' '4' '5' '6' '7' '8' '9' 'A' 'B' 'C' 'D' 'E' 'F').
-12 to: 12 do: [ :y |
	-39 to: 39 do: [ :x |
        ca := x * 0.0458.
        cb := y * 0.08333.
        a := ca.
        b := cb.
		s := ' '.
        i := 0.
        [ i <= 15 ] whileTrue: [
            t := (a * a) - (b * b) + ca.
            b := (2 * a * b) + cb.
            a := t.
            ((a * a) + (b * b)) > 4 ifTrue: [
                s := hex at: i+1.
                i := 15.
            ].
            i := i + 1.
        ].
		Transcript show: s.
	].
	Transcript cr.
]
