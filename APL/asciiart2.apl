⍝ asciiart APL Dyalog Unicode
∇ res ← asciiart; c; z; s; line
	:For y :In (⍳ 25) - 13
		line ← ⍬
		:For x :In (⍳ 79) - 40
			c ← (x × 0.0458) + (y × 0j0.08333)
			z ← c
			s ← ' '
			:For i :In ⍳ 16
				z ← (z × z) + c
				:If (| z) > 2
					s ← i ⊃ '0123456789ABCDEF'
					:Leave
				:EndIf
			:EndFor
			line ,← s
		:EndFor
		⎕ ← line
	:EndFor
	res ← 0
∇
asciiart
