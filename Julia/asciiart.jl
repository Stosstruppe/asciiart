# asciiart Julia 1.6.0
for y in -12:12
    for x in -39:39
        ca = x * 0.0458
        cb = y * 0.08333
        a = ca
        b = cb
        s = " "
        for i in 0:15
            t = a * a - b * b  + ca
            b = 2 * a * b + cb
            a = t
            if a * a + b * b > 4
                s = uppercase(string(i, base=16))
                break
            end
        end
        print(s)
    end
    println()
end
