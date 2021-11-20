(* asciiart GNU Pascal *)
program asciiart;
const
    hex = '0123456789ABCDEF';
var
    i, x, y: integer;
    a, b, t, ca, cb: real;
    s: string[1];

begin
    for y := -12 to 12 do
    begin
        for x := -39 to 39 do
        begin
            ca := x * 0.0458;
            cb := y * 0.08333;
            a := ca;
            b := cb;
            s := ' ';
            for i := 0 to 15 do
            begin
                t := a * a - b * b + ca;
                b := 2 * a * b + cb;
                a := t;
                if (a * a + b * b) > 4 then
                begin
                    s := hex[i+1];
                    break;
                end;
            end;
            write(s);
        end;
        writeln;
    end;
end.
