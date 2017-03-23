#include <stdio.h>
int DistanceToPowerOfTwo(int n)
{
	int i = 1;
	if(n == 0) {
		return 1;
	}
	while(1) {
		if(n < i) {
			return i-n;
		} else if (n==i) {
			return 0;
		}
		i = 2*i;
	}
}

int main() {
	int i;
	for(i = 0; i < 100; i++) {
		printf("Test %d: distance %d\n",i,DistanceToPowerOfTwo(i));
	}
	return 0;
}