// asciiart Groovy
for (y = -12; y <= 12; y++) {
    for (x = -39; x <= 39; x++) {
        float ca = x * 0.0458
        float cb = y * 0.08333
        a = ca
        b = cb
        s = " "
        for (i = 0; i <= 15; i++) {
            t = a * a - b * b + ca
            b = 2 * a * b + cb
            a = t
            if ((a * a + b * b) > 4) {
                s = Integer.toHexString(i).toUpperCase()
                break
            }
        }
        print s
    }
    println()
}
