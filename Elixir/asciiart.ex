# asciiart Elixir

defmodule Mandel do
    def point(i, a, b, ca, cb) do
        t = a * a - b * b + ca
        b = 2 * a * b + cb
        a = t
        if (a * a + b * b) > 4 do
            IO.write Integer.to_string(i, 16)
        else
            if i >= 15 do
                IO.write " "
            else
                point(i+1, a, b, ca, cb)
            end
        end
    end
end

for y <- -12..12 do
    for x <- -39..39 do
        ca = x * 0.0458
        cb = y * 0.08333
        Mandel.point(0, ca, cb, ca, cb)
    end
    IO.puts ""
end
