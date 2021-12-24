(* asciiart Wolfram *)
For[y = -12, y <= 12, y++,
	line = "";
	For[x = -39, x <= 39, x++,
		c = 0.0458 x + 0.08333 y I;
		z = c;
		s = " ";
		For[i = 0, i <= 15, i++,
			z = z z + c;
			If[Abs[z] > 2,
				s = ToUpperCase[IntegerString[i, 16]];
				Break[]
			]
		];
		line = line <> s
	];
	Print[line]
]
