# asciiart Nim
import strformat
for y in -12 .. 12:
    for x in -39 .. 39:
        let ca = x.float * 0.0458
        let cb = y.float * 0.08333
        var a = ca
        var b = cb
        var s = " "
        for i in 0 .. 15:
            let t = a * a - b * b + ca
            b = 2 * a * b + cb
            a = t
            if (a * a + b * b) > 4:
                s = fmt"{i:X}"
                break
        stdout.write s
    echo()
