#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
int sum;
void* runner1(void* param);
void* runner2(void* param);

int main(int argc, char* argv[]){
	pthread_t tid1, tid2;
	pthread_attr_t attr1, attr2;

	if (argc != 2) {
		fprintf(stderr, "usage: a.out <integer value>\n");
		return -1;
	}
	if (atoi(argv[1]) < 0) {
		fprintf(stderr, "%d must be >= 0\n",atoi(argv[1]));
	}

	pthread_attr_init(&attr1);
	pthread_attr_init(&attr2);

	pthread_create(&tid1, &attr1, runner1, argv[1]);
	pthread_create(&tid2, &attr2, runner2, argv[1]);

	pthread_join(tid1, NULL);
	pthread_join(tid2, NULL);
}

void* runner1(void* param) {
	int i, upper = atoi(param);
	sum = 0;

	for(i = 1; i <= upper; i++) {
		sum += i;
		printf("r1: %d\n",sum);
	}

	pthread_exit(0);
}

void* runner2(void* param) {
	int i, upper = atoi(param);
	sum = 0;

	for(i = 1; i <= upper; i++) {
		sum += 2*i;
		printf("r2: %d\n",sum);
	}

	pthread_exit(0);
}