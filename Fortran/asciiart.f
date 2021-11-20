program asciiart
    integer x, y
    do y = -12, 12
        do x = -39, 39
            ca = x * 0.0458
            cb = y * 0.08333
            a = ca
            b = cb
            do i = 0, 15
                t = a * a - b * b + ca
                b = 2 * a * b + cb
                a = t
                if (a * a + b * b > 4) then
                    write(*, "(z1)", advance="no") i
                    exit
                end if
            end do
            if (i > 15) then
                write(*, "(1x)", advance="no")
            end if
        end do
    print *
    end do
end
