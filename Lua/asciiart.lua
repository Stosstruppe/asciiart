-- Lua
for y = -12, 12 do
    for x = -39, 39 do
        ca = x * 0.0458
        cb = y * 0.08333
        a = ca
        b = cb
        s = " "
        for i = 0, 15 do
            t = a * a - b * b + ca
            b = 2 * a * b + cb
            a = t
            if (a * a + b * b) > 4 then
                s = string.format("%X", i)
                break
            end
        end
        io.write(s)
    end
    print()
end
