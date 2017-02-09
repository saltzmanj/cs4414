#include <stdio.h>

int main() {
	double a[] = {1.1, 2.1, 3.1, 4.1};
	double b[] = {0, 0, 0, 0};
	int i;
	for(i = 0; i < 4; i++) {
		b[i] = 1.1*a[i];
	}

	for(i = 0; i < 4; i++) {
		printf("%f\n",b[i]);
	}
	return 0;
}