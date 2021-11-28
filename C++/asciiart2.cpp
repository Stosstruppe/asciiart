// asciiart C++14 (gcc 8.3)

#include <complex>
#include <iostream>
#include <sstream>
using namespace std;

int main()
{
	for (auto y = -12; y <= 12; y++) {
		for (auto x = -39; x <= 39; x++) {
			auto c = complex<float>(x * 0.0458, y * 0.08333);
			auto z = c;
			string s = " ";
			for (auto i = 0; i <= 15; i++) {
				z = z * z + c;
				if (abs(z) > 2) {
					// s = format("{:X}", i);  // C++20
					stringstream ss;
					ss << hex << uppercase << i;
					s = ss.str();
					break;
				}
			}
			cout << s;
		}
		cout << endl;
	}
}
