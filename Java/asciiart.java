class Asciiart
{
	public static void main (String[] args) throws java.lang.Exception
	{
		for (int y = -12; y <= 12; y++){
			for (int x = -39; x <= 39; x++){
				float ca = x * 0.0458f;
				float cb = y * 0.08333f;
				float a = ca;
				float b = cb;
				String chr = " ";
				for (int i = 0; i <= 15; i++) {
					float t = a * a - b * b + ca;
					b = 2 * a * b + cb;
					a = t;
					if (a * a + b * b > 4) {
						chr = String.format("%X", i);
						break;
					}
				}
				System.out.print(chr);
			}
			System.out.println();
		}
	}
}
