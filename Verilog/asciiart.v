// asciiart Verilog (Icarus v10.0)
module main;
    integer i, x, y, s;
    real a, b, t, ca, cb;
    initial begin
        for (y = -12; y <= 12; y++) begin
            for (x = -39; x <= 39; x++) begin
                ca = x * 0.0458;
                cb = y * 0.08333;
                a = ca;
                b = cb;
                s = 32;  // ' '
                for (i = 0; i <= 15; i++) begin
                    t = a * a - b * b + ca;
                    b = 2 * a * b + cb;
                    a = t;
                    if ((a * a + b * b) > 4) begin
                        if (i < 10) s = 48 + i;
                        else s = 55 + i;
                        i = 15;
                    end
                end
                $write("%c", s);
            end
            $write("\n");
        end
        $finish;
    end
endmodule
