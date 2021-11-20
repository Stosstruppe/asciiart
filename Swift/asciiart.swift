for y in -12...12 {
    for x in -39...39 {
        var ca = Float(x) * 0.0458;
        var cb = Float(y) * 0.08333;
        var a = ca;
        var b = cb;
        var s = " ";
        for i in 0...15 {
            var t = a * a - b * b + ca;
            b = 2 * a * b + cb;
            a = t;
            if a * a + b * b > 4 {
                s = String(i, radix:16).uppercased();
                break;
            }
        }
        print(s, terminator:"");
    }
    print();
}
