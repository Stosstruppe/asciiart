// asciiart Fantom
class Asciiart {
    Void main() {
        hex := "0123456789ABCDEF"
        for (y := -12; y <= 12; y++) {
            line := [,]
            for (x := -39; x <= 39; x++) {
                ca := x * 0.0458f
                cb := y * 0.08333f
                a := ca
                b := cb
                s := " "
                for (i := 0; i <= 15; i++) {
                    t := a * a - b * b + ca
                    b = 2 * a * b + cb
                    a = t
                    if ((a * a + b * b) > 4f) {
                        s = hex[i..i]
                        break
                    }
                }
                line.add(s)
            }
            echo(line.join())
        }
    }
}
