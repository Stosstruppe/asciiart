! asciiart Factor v8.21
USING: formatting io kernel locals math namespaces ;
IN: asciiart
SYMBOLS: ca cb a' b' ;

:: mandel_rec ( i a b -- )
    i 16 = [
        " " write
    ] [
        a a * b b * - ca get + a' set
        2 a b * * cb get + b' set
        a' get dup * b' get dup * + 4 > [
            i "%X" printf
        ] [
            i 1 + a' get b' get mandel_rec
        ] if
    ] if ;

-12 [
    dup 0.08333 * cb set
    -39 [
        dup 0.0458 * ca set
        0 ca get cb get mandel_rec
    1 + dup 39 <= ] loop drop
    nl
1 + dup 12 <= ] loop drop
