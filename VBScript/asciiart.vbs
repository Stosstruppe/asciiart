' cscript asciiart.vbs

For y = -12 To 12
	line = ""
	For x = -39 To 39
		ca = x * 0.0458
		cb = y * 0.08333
		a = ca
		b = cb
		s = " "
		For i = 0 To 15
			t = a * a - b * b + ca
			b = 2 * a * b + cb
			a = t
			If (a * a + b * b) > 4 Then
				s = Hex(i)
				Exit For
			End If
		Next
		line = line & s
	Next
	WScript.Echo line
Next
