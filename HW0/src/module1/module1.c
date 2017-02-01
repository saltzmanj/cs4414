#include <stdio.h>
#include <string.h>
#include <stdlib.h>

// #definitions -------------------------------
#define OPERATIONBUFSIZE 100
#define OPERANDCHARSIZE 20

// Data structures ----------------------------

typedef enum {
	AddOp,
	SubOp,
	MulOp,
	DivOp

} optype;

typedef enum {
	ScanningLH,
	ScanningOp,
	ScanningRH
} scanstate;

typedef struct {
	int lh;
	optype operation;
	int rh;
} operationcluster;

// Forward Declarations ----------------------
int scanop(char* string, operationcluster* thisop);
int execop(operationcluster* thisop);

// Main --------------------------------------
int main() {
	char* stdinbuf = (char*) malloc(sizeof(char) * OPERATIONBUFSIZE);
	operationcluster* thisop = (operationcluster*) malloc(sizeof(operationcluster));
	char current_char; // Buffer space for last char from command line
	char* char_ptr = stdinbuf; //Create a pointer so we can insert into the buffer
	int resultant; // Holds resultant int

	// Scan stdin for characters
	while(1){
		current_char = fgetc(stdin);
		
		if (current_char == '\n') {
			*char_ptr = '\0';
			break;
		} else {
			*char_ptr = current_char;
			char_ptr += sizeof(char);
		}

	}

	// Parse the operation
	scanop(stdinbuf, thisop);
	// printf("%d : %d : %d \n", thisop->lh, thisop->operation , thisop->rh);
	resultant = execop(thisop);

	printf("%d\n", resultant);

	free(stdinbuf);
	free(thisop);
	return 0;
}

int scanop(char* string_in, operationcluster* thisop) {


	// Pointers to the lh and rh strings
	char* lhstr = (char*) malloc(sizeof(char) * OPERANDCHARSIZE);
	char* rhstr = (char*) malloc(sizeof(char) * OPERANDCHARSIZE);
	
	char* strinptr = string_in; // Pointer for iterating over the input string
	char* strwriteptr = lhstr;  // Pointer used to write to lh/rh string buffers

	scanstate currentstate = ScanningLH; 

	while(*strinptr != '\0') {
		switch(currentstate) {
		case ScanningLH: {
			*strwriteptr = *strinptr;
			
			if(*(strinptr + sizeof(char)) == '+' || 
			   *(strinptr + sizeof(char)) == '-' || 
			   *(strinptr + sizeof(char)) == '/' || 
			   *(strinptr + sizeof(char)) == '*' 	) {

				currentstate = ScanningOp;
			} 

			strwriteptr += sizeof(char);
			break;
		};
		case ScanningOp: {
			if(*(strinptr) == '+') thisop->operation = AddOp;
			else if(*(strinptr) == '-') thisop->operation = SubOp;
			else if(*(strinptr) == '/') thisop->operation = DivOp;
			else if(*(strinptr) == '*') thisop->operation = MulOp;

			strwriteptr = rhstr;

			currentstate = ScanningRH;
			break;
		};
		case ScanningRH: {
			*strwriteptr = *strinptr;
			strwriteptr += sizeof(char);
			break;
		};
		}
		strinptr += sizeof(char);
	}


	thisop->lh = atoi(lhstr);
	thisop->rh = atoi(rhstr);
	free(lhstr);
	free(rhstr);
	return 0;

}

int execop(operationcluster* thisop) {
	int total = 0;

	switch(thisop->operation){
		case AddOp : {
			total = thisop->lh + thisop->rh;
			break;
		};
		case SubOp : {
			total = thisop->lh - thisop->rh;
			break;
		};
		case MulOp : {
			total = thisop->lh * thisop->rh;
			break;
		};
		case DivOp : {
			total = thisop->lh / thisop->rh;
			break;
		};
	}
	return total;
}