#ifndef __QUICKSORT_H_
#define __QUICKSORT_H_

/**
 *
 * Jake Saltzman
 * CS 4414 Spring 2017
 * 
 * quicksort.h
 */

/*----------  #include Directives  ----------*/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <pthread.h>

/*----------  Parameters  ----------*/
#define MAX_INT_COUNT 4096

// This is the max size of the character vector representing each integer
#define INT_BUFFER_SIZE 16

/*----------  Debugging  ----------*/

#define DEBUG 0
#define debug_print(...) \
	do { if (DEBUG) fprintf(stdout, __VA_ARGS__); } while(0)

/*----------  Global Variables ----------*/

char inputfn[256];
pthread_mutex_t sortmutex = PTHREAD_MUTEX_INITIALIZER;
int completed_threads;

/*---------- State Machine Fundamentals  ----------*/

typedef struct {
	int* numarray;
	int numarray_size;
	int totalthreads;
	int currentthreads;
	int answer;
	pthread_t* tids;
} qsrtdata_t;

#define DATA_INITIALIZER (qsrtdata_t) {NULL}

typedef enum {
	// Main Flow states
	INITIALIZE_Q,
	READ_FILE_Q,
	PAD_ARRAY_Q,
	SPAWN_Q,
	OUTPUT_ANSWER_Q,

	// Setup/teardown/error states
	SHUTDOWN_Q,
	HANDLE_ERROR_Q,
	EXIT_Q
} qsrtstate_t;

typedef struct {
	int eflag;
	char emsg[64];
	int xflag;
	qsrtstate_t enextstate;

} error_t;

#define ERROR_INITIALIZER (error_t) {0, "No error.", 0, EXIT_Q}

void RunQsrtStateMachine();
qsrtstate_t IterateQsrtStateMachine(qsrtstate_t* currentstate, qsrtdata_t* sdata, error_t* serror);


/*----------  State Functions  ----------*/
#define STD_PARAMS qsrtstate_t* currentstate, qsrtdata_t* sdata, error_t* serror

qsrtstate_t InitializeStateTasks(STD_PARAMS);
qsrtstate_t ReadFileStateTasks(STD_PARAMS);
qsrtstate_t HandleErrorStateTasks(STD_PARAMS);
qsrtstate_t OutputAnswerTasks(STD_PARAMS);
qsrtstate_t SpawnTasks(STD_PARAMS);
qsrtstate_t PadArrayTasks(STD_PARAMS); 

/*----------  Helper functions  ----------*/

void ReadIntsFromFile(STD_PARAMS);
void PrintInts(STD_PARAMS);
void IncrementCompletedThreads();
int DistanceToPowerOfTwo(int n);
int FileIsEmpty(FILE* fileptr);
/*----------  Sort Kernel(s)  ----------*/

int (*kernel)(int, int);

typedef struct {
	int i1;
	int i2;
	int index;
	int* targetarray;
} LargerIntParams_t;

void* LargerInt(void* params);

/*----------  Errors  ----------*/
#define NO_ERROR (error_t) {0, "No error.", 0, EXIT_Q}
#define FILE_DNE_ERROR (error_t) {1, "File does not exist.", 1, EXIT_Q}
#define TOO_MANY_INTS_ERROR (error_t) {1, "Too many ints entered.", 1, EXIT_Q}
#define FILE_EMPTY_ERR (error_t) {1, "File is empty.", 1, EXIT_Q}
#define PARSE_ERR (error_t) {1, "A parsing error occurred.", 1, EXIT_Q}
#endif
