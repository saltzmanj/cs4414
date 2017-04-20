/*
	Jake Saltzman
	jss7kj@virginia.edu

	quicksort.c
*/

#include "quicksort.h"

int main(int argc, char* argv[]) {
	// Copy the command line argument to the global filename buffer.
	strcpy(inputfn, argv[1]);
	RunQsrtStateMachine();
	return 0;
}

void RunQsrtStateMachine(){ 
	qsrtstate_t currentstate = INITIALIZE_Q;
	qsrtdata_t 	sdata = DATA_INITIALIZER;
	error_t 	serror  = ERROR_INITIALIZER;

	while((currentstate = IterateQsrtStateMachine(&currentstate, &sdata, &serror)) != EXIT_Q);

}

qsrtstate_t IterateQsrtStateMachine(qsrtstate_t* currentstate, qsrtdata_t* sdata, error_t* serror) {
	qsrtstate_t nextstate = EXIT_Q;
	if(serror->eflag) *currentstate = HANDLE_ERROR_Q;

	switch(*currentstate) {
		case(INITIALIZE_Q) 		: {
			nextstate = InitializeStateTasks(currentstate, sdata, serror);
		} break;
		case(READ_FILE_Q) 		: {
			nextstate = ReadFileStateTasks(currentstate, sdata, serror);
		} break;
		case(PAD_ARRAY_Q)		: {
			nextstate = PadArrayTasks(currentstate, sdata, serror);
		} break;
		case(OUTPUT_ANSWER_Q)	: {
			nextstate = OutputAnswerTasks(currentstate, sdata, serror);
		} break;
		case(HANDLE_ERROR_Q) 	: {
			nextstate = HandleErrorStateTasks(currentstate, sdata, serror);
		} break;
		case(SHUTDOWN_Q) 		: {
			nextstate = EXIT_Q;
		} break;
		case (SPAWN_Q)			: {
			nextstate = SpawnTasks(currentstate, sdata, serror);
		} break;
		case(EXIT_Q) 			: {
			nextstate = EXIT_Q;
		} break;
	}

	return nextstate;
}

void ReadIntsFromFile(STD_PARAMS) {
	FILE *fileptr;
	int count = 0;
	char charbuf[INT_BUFFER_SIZE];
	debug_print("Reading File: %s\n",inputfn);
	fileptr = fopen(inputfn, "r");

	if(!fileptr) {
		*serror = FILE_DNE_ERROR;
		return;
	}

	if(FileIsEmpty(fileptr)) {
		*serror = FILE_EMPTY_ERR;
		return;
	}

	while(fgets(charbuf, INT_BUFFER_SIZE, fileptr) != NULL) {
		if(strcmp(charbuf, "") == 0 || strcmp(charbuf, "\n")==0) {
			count -= 1;
			continue;
		} else {
			count += 1;
		}
	}
	fclose(fileptr);

	if(count > MAX_INT_COUNT) {
		*serror = TOO_MANY_INTS_ERROR;
		return;
	} else if (count < 0) {
		*serror = PARSE_ERR;
		return;
	}

	sdata->numarray = (int*) malloc(sizeof(int) * count);
	fileptr = fopen(inputfn, "r");
	int i;
	int temp;

	for(i = 0; i < count; i++) {
		fgets(charbuf, 16, fileptr);
		
		temp = atoi(charbuf);
		sdata->numarray[i] = temp;
	}
	sdata->numarray_size = count;
	debug_print("Input size: %d\n",count);
	
	fclose(fileptr);
}

void PrintInts(STD_PARAMS) {
	int i;
	for(i = 0; i < sdata->numarray_size; i++) {
		debug_print("\tEntered: %d\n", sdata->numarray[i]);
	}
}

qsrtstate_t PadArrayTasks(STD_PARAMS) {
	qsrtstate_t nextstate = SPAWN_Q;
	int q = DistanceToPowerOfTwo(sdata->numarray_size);
	debug_print("Size to next power of two: %d\n", q);
	sdata->numarray = (int*) realloc(sdata->numarray, sizeof(int)*(sdata->numarray_size + q));
	sdata->totalthreads = (sdata->numarray_size+q)/2;
	sdata->currentthreads = (sdata->numarray_size+q)/2;
	
	debug_print("Total size: %d\n", sdata->numarray_size);
	int i;
	for(i = sdata->numarray_size; i < sdata->numarray_size + q; i++){
		sdata->numarray[i] = 0;
	}
	return nextstate;
}

qsrtstate_t InitializeStateTasks(STD_PARAMS) {
	sdata->numarray_size = 0;
	sdata->totalthreads = -1;
	sdata->currentthreads = -1;
	sdata->answer = -1;
	qsrtstate_t nextstate = READ_FILE_Q;
	return nextstate;
}

qsrtstate_t ReadFileStateTasks(STD_PARAMS) {
	ReadIntsFromFile(currentstate, sdata, serror);
	PrintInts(currentstate, sdata, serror);
	qsrtstate_t nextstate = PAD_ARRAY_Q;
	return nextstate;
}

qsrtstate_t HandleErrorStateTasks(STD_PARAMS) {
	qsrtstate_t nextstate = EXIT_Q;
	if(serror->xflag) {
		printf("Fatal Error: %s\n", serror->emsg);
		nextstate = EXIT_Q;
	} else if (serror->eflag) {
		printf("Error: %s\n", serror->emsg);
		nextstate = serror->enextstate;
		*serror = NO_ERROR;
	}
	return nextstate;
}

qsrtstate_t OutputAnswerTasks(STD_PARAMS) {
	qsrtstate_t nextstate = SHUTDOWN_Q;
	printf("Largest int in file: %d\n", sdata->answer);
	return nextstate;
}

qsrtstate_t SpawnTasks(STD_PARAMS) {
	// Create the threads
	qsrtstate_t nextstate = SPAWN_Q;
	sdata->tids = (pthread_t*) malloc(sizeof(pthread_t) * sdata->currentthreads);
	debug_print("Threads in this round: %d\n", sdata->currentthreads);
	// Set number of compelted threads to 0
	
	
	int* answersarray = (int*) malloc(sizeof(int) * sdata->currentthreads);
	ResetBarrier(&qbarrier, sdata->currentthreads);

	int i;
	LargerIntParams_t* params = (LargerIntParams_t*) malloc(sizeof(LargerIntParams_t) * sdata->currentthreads);
	for(i = 0; i < sdata->currentthreads; i++) {
		
		params[i].targetarray = answersarray;
		params[i].index = i;
		params[i].i1 = sdata->numarray[2*i];
		params[i].i2 = sdata->numarray[2*i + 1];

		pthread_create(&sdata->tids[i], NULL, LargerInt, &params[i]);
	}

	while(PollBarrier(&qbarrier));
	pthread_cond_broadcast(&(qbarrier.barrier_active));

	for(i = 0; i < sdata->currentthreads; i++) {
		sdata->numarray[i] = answersarray[i];
	}

	if(sdata->currentthreads == 1) {
		sdata->answer = sdata->numarray[0];
		nextstate = OUTPUT_ANSWER_Q;
	}
	sdata->currentthreads = (sdata->currentthreads)/2;
	
	free(sdata->tids);
	free(answersarray);
	free(params);

	return nextstate;
}

void* LargerInt(void* params) {

	LargerIntParams_t* params2 = (LargerIntParams_t*) params;
	if (params2->i1 > params2->i2)
		params2->targetarray[params2->index] = params2->i1;
	else
		params2->targetarray[params2->index] = params2->i2;
	IncrementBarrier(&qbarrier);

	debug_print("Largest Int of %d and %d was: %d\n", params2->i1, params2->i2, params2->targetarray[params2->index]);
	pthread_cond_wait(&(qbarrier.barrier_active), &(qbarrier.barrier_mutex));
	pthread_exit(0);
}	


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

int FileIsEmpty(FILE* fileptr) {
	int os = ftell(fileptr);
	fseek(fileptr,0,SEEK_END);
	if(ftell(fileptr) == 0) {
		return 1;
	} else {
		fseek(fileptr, os, SEEK_SET);
		return 0;
	}
}