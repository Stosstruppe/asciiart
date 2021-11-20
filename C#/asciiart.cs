using System;

public class Asciiart
{
    public static void Main()
    {
        for (var y = -12; y <= 12; y++) {
            for (var x = -39; x <= 39; x++) {
                var ca = x * 0.0458;
                var cb = y * 0.08333;
                var a = ca;
                var b = cb;
                var s = " ";
                for (var i = 0; i <= 15; i++) {
                    var t = a * a - b * b + ca;
                    b = 2 * a * b + cb;
                    a = t;
                    if (a * a + b * b > 4) {
                        s = i.ToString("X");
                        break;
                    }
                }
                Console.Write(s);
            }
            Console.WriteLine();
        }
    }
}
