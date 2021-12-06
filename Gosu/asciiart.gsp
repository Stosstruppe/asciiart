// asciiart Gosu
var hex = "0123456789ABCDEF"
for (y in -12..12) {
    for (x in -39..39) {
        var ca = x * 0.0458
        var cb = y * 0.08333
        var a = ca
        var b = cb
        var s = " "
        for (i in 0..15) {
            var t = a * a - b * b + ca
            b = 2 * a * b + cb
            a = t
            if ((a * a + b * b) > 4) {
                s = hex.charAt(i)
                break
            }
        }
        System.out.print(s)
    }
    print("")
}
