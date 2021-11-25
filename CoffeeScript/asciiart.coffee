# asciiart CoffeScript 1.12.7

for y in [-12..12]
    line = []
    for x in [-39..39]
        ca = x * 0.0458
        cb = y * 0.08333
        a = ca
        b = cb
        s = " "
        for i in [0..15]
            t = a * a - b * b + ca
            b = 2 * a * b + cb
            a = t
            if (a * a + b * b) > 4
                s = i.toString(16).toUpperCase()
                break
        line.push s
    console.log line.join ""
