% asciiart Octave 4.4.1
for y = -12:12
    for x = -39:39
        ca = x * 0.0458;
        cb = y * 0.08333;
        a = ca;
        b = cb;
        s = " ";
        for i = 0:15
            t = a * a - b * b + ca;
            b = 2 * a * b + cb;
            a = t;
            if (a * a + b * b) > 4
                s = dec2hex(i);
                break;
            endif
        endfor
        printf(s);
    endfor
    printf("\n");
endfor
