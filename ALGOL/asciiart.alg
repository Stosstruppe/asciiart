# asciiart Algol 68 Genie #
INT i, x, y;
REAL a, b, t, ca, cb;
CHAR s;
STRING hex = "0123456789ABCDEF";

FOR y FROM -12 TO 12 DO
    FOR x FROM -39 TO 39 DO
        ca := x * 0.0458;
        cb := y * 0.08333;
        a := ca;
        b := cb;
        s := " ";
        FOR i FROM 0 TO 15 DO
            t := a * a - b * b + ca;
            b := 2 * a * b + cb;
            a := t;
            IF (a * a + b * b) > 4 THEN
                s := hex[i+1]
            FI
        UNTIL s /= " " OD;
        print(s)
    OD;
    print(new line)
OD
