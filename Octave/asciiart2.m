% asciiart Octave 4.4.1
for y = -12:12
    for x = -39:39
        c = (x * 0.0458) + (y * 0.08333)*i;
        z = c;
        s = " ";
        for n = 0:15
            z = z * z + c;
            if abs(z) > 2
                s = dec2hex(n);
                break;
            endif
        endfor
        printf(s);
    endfor
    printf("\n");
endfor
