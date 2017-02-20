#include "spp.h"
// ----------------------------------- Main

int main() {

	SppRun();

	return 0;
}
// ----------------------------------- Top Level State Machine

void SppRun() {
	sppstate_t currentstate = INITIALIZE;
	sdata_t sdata = SDATA_INIT;
	error_t serror = NO_ERROR;

	while(1) {
		currentstate = SppIterate(currentstate, &sdata, &serror);
		if(currentstate == SHUTDOWN) {
			SppIterate(SHUTDOWN, &sdata, &serror);
			break;
		}
	}
}

sppstate_t SppIterate(sppstate_t statein, sdata_t* sdata, error_t* serror) {
	sppstate_t nextstate = SHUTDOWN;

	switch(statein){
		case(INITIALIZE): {

		} break;
		
		case(SHUTDOWN): { 
		
		} break;
	}
	return nextstate;
}


// ----------------------------------- Utility Functions
int CountWords(char* string) {
	char* strptr = string;
	int wordcount = 0;
	int in_whitespace = 0;

	if(*strptr != '\0') {
		wordcount = 1;
	}
	while(*strptr != '\0') {
		if(*strptr == ' ') {
			in_whitespace = 1;
		} else {
			if(in_whitespace == 1) {
				wordcount += 1;
			}
			in_whitespace = 0;
		}
		strptr += sizeof(char);
	}
	return wordcount;
}

void FreeBuffer(char** args[], error_t* errorin) {
	if(errorin->eflag != 1) {
		int i = 0;
		while((*args)[i]) {
			free((*args)[i]);
			i += 1;
		}
	}
}