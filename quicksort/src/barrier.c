#include "barrier.h"

void ResetBarrier(barrier_t* b, int max_count) {
	b->barrier_active = 1;
	b->barrier_counter = 0;
	b->barrier_max = max_count;
}

void DecrementBarrier(barrier_t* b) {
	
	pthread_mutex_lock(&(b->barrier_mutex));
	b->barrier_counter += 1;
	pthread_mutex_unlock(&(b->barrier_mutex));

	if(b->barrier_counter == b->barrier_max) {
		b->barrier_active = 0;
	}
}

int PollBarrier(barrier_t* b) {
	return b->barrier_active;
}
