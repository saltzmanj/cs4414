/*
	Jake Saltzman
	jss7kj@virginia.edu

	quicksort.c
*/

#include "quicksort.h"

int main(int argc, char* argv[]) {
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

	switch(*currentstate) {
		case(INITIALIZE_Q) 		: {
			sdata->numarray_size = 0;
			nextstate = READ_FILE_Q;
		} break;
		case(READ_FILE_Q) 		: {
			ReadIntsFromFile(currentstate, sdata, serror);
			PrintInts(currentstate, sdata, serror);
			nextstate = SHUTDOWN_Q;
		} break;
		case(SHUTDOWN_Q) 		: {
			nextstate = EXIT_Q;
		} break;
		case(HANDLE_ERROR_Q) 	: {
			nextstate = EXIT_Q;
			if(serror->xflag) {
				printf("Fatal Error: %s", serror->emsg);
				nextstate = EXIT_Q;
			} else if (serror->eflag) {
				printf("Error: %s", serror->emsg);
				nextstate = serror->enextstate;
				*serror = NO_ERROR;
			}
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
	char charbuf[16];
	debug_print("Reading File: %s\n",inputfn);
	fileptr = fopen(inputfn, "r");

	if(!fileptr) {
		*serror = FILE_DNE_ERROR;
		return;
	}

	while(fgets(charbuf, 16, fileptr) != NULL) {
		if(strcmp(charbuf, "") == 0) {
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

	fclose(fileptr);
}

void PrintInts(STD_PARAMS) {
	int i;
	for(i = 0; i < sdata->numarray_size; i++) {
		debug_print("\tEntered: %d\n", sdata->numarray[i]);
	}
}