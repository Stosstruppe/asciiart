(* asciiart Wolfram *)
f[x_] := If[Abs[x] > 2, 1, 0]
Attributes[f] = {Listable}
c = Table[0.0458 x + 0.08333 y I, {y, -12, 12}, {x, -39, 39}]
z = c
s = Table[0, {25}, {79}]
Do[
	m = Sign[s];
	z = (z z + c)(1 - m);
	s = s + m + f[z]
, 16]

For[y = 1, y <= 25, y++,
	line = "";
	For[x = 1, x <= 79, x++,
		line = line <> StringPart["0123456789ABCDEF ", 17 - s[[y, x]]]
	];
	Print[line]
]
