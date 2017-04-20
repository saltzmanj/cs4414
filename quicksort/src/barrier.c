#include "barrier.h"

void ResetBarrier(barrier_t* b, int max_count) {
	b->barrier_counter = 0;
	b->barrier_max = max_count;
	pthread_cond_init(&(b->barrier_active), NULL);
}

void IncrementBarrier(barrier_t* b) {
	
	pthread_mutex_lock(&(b->barrier_mutex));
	b->barrier_counter += 1;
	pthread_mutex_unlock(&(b->barrier_mutex));
}

int PollBarrier(barrier_t* b) {
	if(b->barrier_counter == b->barrier_max) {
		return 0;
	} else {
		return 1;
	}
}
