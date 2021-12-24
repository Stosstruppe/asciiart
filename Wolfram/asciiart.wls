(* asciiart Wolfram *)
Do[
	line = "";
	Do[
		ca = x * 0.0458;
		cb = y * 0.08333;
		a = ca;
		b = cb;
		s = " ";
		Do[
			t = a * a - b * b + ca;
			b = 2 * a * b + cb;
			a = t;
			If[(a * a + b * b) > 4,
				s = ToUpperCase[IntegerString[i, 16]];
				Break[]
			]
		, {i, 0, 15}];
		line = line <> s
	, {x, -39, 39}];
	Print[line]
, {y, -12, 12}]
