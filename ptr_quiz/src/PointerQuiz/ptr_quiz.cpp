#include "ptr_quiz.h"
using namespace std;

PointerTests::PointerTests() {
}

PointerTests::~PointerTests() {
}

void PointerTests::q1() {
	cout << "Starting Test 1 \n";
	double *dptr;
	int i;

	dptr = (double*) malloc(sizeof(double) * 10);
	for(i = 0; i < 10; i++) {
		dptr[i] = i * 10.0;
	}

	for(i = 0; i < 10; i++) {
		printf("%f", dptr[i]);
		printf("\n");
	}

	printf("\n");


}

void PointerTests::q2() {
	typedef struct {
		int a;
		float b;
		char c[2];
	} Collection;

	unsigned long sdiff;
	int PTRADD = 12;


	cout << "Starting Test 2 \n";


	Collection arr[10];
	Collection *ptr = arr + PTRADD;

	sdiff = ((unsigned long) ptr - (unsigned long) arr)/sizeof(Collection);

	printf("Old address: %d \n", (unsigned long) arr);
	printf("New address: %d \n", (unsigned long) ptr);
	printf("Difference: %d \n", (unsigned long) sdiff);

}

void PointerTests::q3() {
	printf("Starting Test 3 \n");
	int i;
	int fileCount = 4;


	char **fileNames;
	fileNames = (char**) malloc(fileCount * sizeof(char*));

	for (i = 0; i < fileCount; i++) {
		printf("Enter file name no %d\n", i);
		// scanf("%*[^\n]", fileNames[i]);
	}

	for (i = 0; i < fileCount; i++) {
		printf("%s \n", fileNames[i]);
	}
}

void initialize(int *array, int length) {
	int *ptr = &array[length - 1];
	for(int i = 0; i < length; i++) {
		ptr[-i] = i;
	}
}

void PointerTests::q4() {
	printf("\nStarting Test 4 \n");
	int l = 10;
	int a[l];
	int i;
	initialize(a, l);

	for(i = 0; i < l; i++) {
		printf("%d \n", a[i]);
	}

}


void PointerTests::q5() {
	const char *origStr = "Operating Systems";
	char *copyStr;
	int strLength = strlen(origStr);
	copyStr = (char*) malloc(strLength);
	for (int i = 0; i < strLength; i++) {
		copyStr[i] = origStr[i];
	}
	printf("Original String: %s \n", origStr);
	printf("Copied String:   %s \n", copyStr);
}

int getSquare1(int a) {
	a = a * a;
	return a;
}

int getSquare2(int *a) {
	*a = *a * *a;
	return *a;
}

void PointerTests::q6() {
	int a = 2;
	int b = 3;
	printf("%d, ", getSquare1(a));
	printf("%d, ", a);
	printf("%d, ", getSquare2(&b));
	printf("%d\n", b);
}