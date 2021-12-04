// asciiart Nice
void main(String[] args) {
    String hex = "0123456789ABCDEF";
    for (int y = -12; y <= 12; y++) {
        for (int x = -39; x <= 39; x++) {
            float ca = x * 0.0458f;
            float cb = y * 0.08333f;
            float a = ca;
            float b = cb;
            String s = " ";
            for (int i = 0; i <= 15; i++) {
                float t = a * a - b * b + ca;
                b = 2 * a * b + cb;
                a = t;
                if ((a * a + b * b) > 4) {
                    s = hex.substring(i, i + 1);
                    break;
                }
            }
            print(s);
        }
        println();
    }
}
