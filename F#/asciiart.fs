for y in -12 .. 12 do
    for x in -39 .. 39 do
        let ca = (float x) * 0.0458
        let cb = (float y) * 0.08333
        let mutable a = ca
        let mutable b = cb
        let mutable s = " "
        let mutable i = 0
        while i <= 15 do
            let t = a * a - b * b + ca
            b <- 2. * a * b + cb
            a <- t
            if a * a + b * b > 4. then
                s <- sprintf "%X" i
                i <- 15
            i <- i + 1
        printf "%s" s
    printfn ""
