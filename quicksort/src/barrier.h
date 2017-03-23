#ifndef __BARRIER_H_
#define __BARRIER_H_
/**
 *
 * Jake Saltzman
 * CS 4414 Spring 2017
 * 
 * barrier.h
 */

#include <stdlib.h>
#include <pthread.h>

typedef struct {
	// Status variable: 1 if the barrier is "closed", and 0 if open
	int barrier_active;

	// Counter variable - signifies how many processes are left
	int barrier_counter;

	// User will set this: this is the number of 
	int barrier_max;

	pthread_mutex_t barrier_mutex;
} barrier_t;

void ResetBarrier(barrier_t* b, int max_count);
void DecrementBarrier(barrier_t* b);
int PollBarrier(barrier_t* b);

#endif