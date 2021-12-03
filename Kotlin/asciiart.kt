// asciiart Kotlin
fun main() {
    for (y in -12..12) {
        for (x in -39..39) {
            val ca = x * 0.0458
            val cb = y * 0.08333
            var a = ca
            var b = cb
            var s = " "
            for (i in 0..15) {
                val t = a * a - b * b + ca
                b = 2 * a * b + cb
                a = t
                if ((a * a + b * b) > 4) {
                    s = "%X".format(i)
                    break
                }
            }
            print(s)
        }
        println()
    }
}
