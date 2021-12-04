// asciiart Dart
void main() {
    for (int y = -12; y <= 12; y++) {
        var line = [];
        for (int x = -39; x <= 39; x++) {
            double ca = x * 0.0458;
            double cb = y * 0.08333;
            double a = ca;
            double b = cb;
            String s = " ";
            for (int i = 0; i <= 15; i++) {
                double t = a * a - b * b + ca;
                b = 2 * a * b + cb;
                a = t;
                if ((a * a + b * b) > 4) {
                    s = i.toRadixString(16).toUpperCase();
                    break;
                }
            }
            line.add(s);
        }
        print(line.join());
    }
}
