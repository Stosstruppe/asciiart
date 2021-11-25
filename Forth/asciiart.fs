\ asciiart Forth (gforth 0.7.3)

fvariable a
fvariable b
fvariable t
fvariable ca
fvariable cb
variable s

: mandel { x y -- }
    x s>f 4.58e-2 f* ca f!
    y s>f 8.333e-2 f* cb f!
    ca f@ a f!
    cb f@ b f!
    -1 s !
    16 0 do
        \ t = a * a - b * b + ca;
        a f@ a f@ f* b f@ b f@ f* f- ca f@ f+ t f!
        \ b = 2 * a * b + cb;
        2e a f@ b f@ f* f* cb f@ f+ b f!
        \ a = t;
        t f@ a f!
        \ if ((a * a + b * b) > 4)
        a f@ a f@ f* b f@ b f@ f* f+ 4e f> if
            i s !  \ s = i;
            leave
        then
    loop
    s @ 0< if
        ."  "
    else
        s @ '0' + dup '9' > if 7 + then emit
    then
;

: canvas
    13 -12 do
        40 -39 do
            i j mandel
        loop
        cr
    loop
;

canvas
