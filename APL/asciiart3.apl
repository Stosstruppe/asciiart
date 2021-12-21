⍝ asciiart APL Dyalog Unicode
∇ res ← asciiart ; z; s; m
	z ← c
	s ← c × 0
	:For i :In ⍳ 16
		m ← s ≠ 0
		z ← ((z × z) + c) × (~ m)
		s ← s + (m ∨ (| z) > 2)
	:EndFor
	⎕ ← '0123456789ABCDEF '[17 - s]
	res ← 0
∇
c ← (((⍳ 25) - 13) × 0j0.08333) ∘.+ (((⍳ 79) - 40) × 0.0458)
asciiart
