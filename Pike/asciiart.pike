// asciiart Pike
int main() {
    for (int y = -12; y <= 12; y++) {
        for (int x = -39; x <= 39; x++) {
            float ca = x * 0.0458;
            float cb = y * 0.08333;
            float a = ca;
            float b = cb;
            int i;
            for (i = 0; i <= 15; i++) {
                float t = a * a - b * b + ca;
                b = 2 * a * b + cb;
                a = t;
                if ((a * a + b * b) > 4) {
                    write("%X", i);
                    break;
                }
            }
            if (i > 15) write(" ");
        }
        write("\n");
    }
}
