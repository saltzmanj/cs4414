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

/*----------  Parameters  ----------*/
#define MAX_INT_COUNT 4096
/*----------  Debugging  ----------*/

#define DEBUG 1
#define debug_print(...) \
	do { if (DEBUG) fprintf(stdout, __VA_ARGS__); } while(0)

/*----------  Global Variables ----------*/

char inputfn[256];

/*---------- State Machine Fundamentals  ----------*/

typedef struct {
	int* numarray;
	int numarray_size;
} qsrtdata_t;

#define DATA_INITIALIZER (qsrtdata_t) {NULL}

typedef enum {
	INITIALIZE_Q,
	READ_FILE_Q,
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

void RunQsrtStateMachine();
qsrtstate_t IterateQsrtStateMachine(qsrtstate_t* currentstate, qsrtdata_t* sdata, error_t* serror);

#define ERROR_INITIALIZER (error_t) {0, "No error.", 0, EXIT_Q}

/*----------  State Functions  ----------*/
#define STD_PARAMS qsrtstate_t* currentstate, qsrtdata_t* sdata, error_t* serror
void ReadIntsFromFile(STD_PARAMS);
void PrintInts(STD_PARAMS);
/*----------  Errors  ----------*/
#define NO_ERROR (error_t) {0, "No error.", 0, EXIT_Q}
#define FILE_DNE_ERROR (error_t) {1, "File does not exist.", 1, EXIT_Q}
#define TOO_MANY_INTS_ERROR (error_t) {1, "Too many ints entered.", 1, EXIT_Q}
#endif
