"asciiart Smalltalk"

Object subclass: #Mandel.
Mandel methodsFor: 'accessing'
!
value: ca
value: cb
	| a b t |
	a := ca.
	b := cb.
	(0 to: 15) do: [ :i |
		t := (a * a) - (b * b) + ca.
		b := (2 * a * b) + cb.
		a := t.
		((a * a) + (b * b)) > 4 ifTrue: [ ^ i ].
	].
	^ -1
!!

mandel := Mandel new.
hex := #(' ' '0' '1' '2' '3' '4' '5' '6' '7' '8' '9' 'A' 'B' 'C' 'D' 'E' 'F').
(-12 to: 12) do: [ :y |
	(-39 to: 39) do: [ :x |
        ca := x * 0.0458.
        cb := y * 0.08333.
        i := mandel value: ca value: cb.
        s := hex at: i+2.
		Transcript show: s.
	].
	Transcript cr.
].
