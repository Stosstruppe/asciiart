package main
import "fmt"

func main() {
	for y := -12; y <= 12; y++ {
		for x := -39; x <= 39; x++ {
			ca := float32(x) * 0.0458
			cb := float32(y) * 0.08333
			a := ca
			b := cb
			s := " "
			for i := 0; i <= 15; i++ {
				t := a * a - b * b + ca
				b = 2 * a * b + cb
				a = t
				if (a * a + b * b) > 4 {
					s = fmt.Sprintf("%X", i)
					break
				}
			}
			fmt.Print(s)
		}
		fmt.Println()
	}
}
