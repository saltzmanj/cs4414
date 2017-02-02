#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#define STDINBUFSIZE 1024
#define INDEXBUFSIZE 8
#define SINGLEWORDBUFSIZE 32

int get_chars_from_stdin(char* targetbuf, int maxchars);
int isnumber(char* nstr);
void index_spaced_string(char* string, int index, char* outstr);

int main() {

	// Allocate space for the search string length (e.g. the first item to be inputted)
	char* stringlength_input = (char*) malloc(sizeof(char) * INDEXBUFSIZE);
	int stringlength;

	// Allocate space for the string id
	char* stringindex_input = (char*) malloc(sizeof(char) * INDEXBUFSIZE);
	int stringindex;

	char* inputstring = (char*) malloc(sizeof(char) * STDINBUFSIZE);
	char* resultant = (char*) malloc(sizeof(char) * SINGLEWORDBUFSIZE);

	get_chars_from_stdin(stringlength_input, INDEXBUFSIZE);
	
	if(isnumber(stringlength_input)) {
		stringlength = strtol(stringlength_input, NULL, 10);
	} else {
		printf("%s\n", "I/O Error"); return -1;
	}

	get_chars_from_stdin(inputstring, STDINBUFSIZE);
	get_chars_from_stdin(stringindex_input, INDEXBUFSIZE);

	if(isnumber(stringindex_input)) {
		stringindex = strtol(stringindex_input, NULL, 10);
	} else {
		printf("%s\n", "I/O Error"); return -1;
	}

	index_spaced_string(inputstring, stringindex, resultant);

	printf("%s\n", resultant);

	free(stringlength_input);
	free(stringindex_input);
	free(inputstring);
	free(resultant);

}

/* Get the character string from stdin. Takes maxchars argument to prevent buffer overflows

	Returned status codes: 
	-1: Error (string exceeds buffer)
	0+: length of the string.
*/

int get_chars_from_stdin(char* targetbuf, int maxchars) {
	char current_char; // Buffer space for last char from command line
	char* char_ptr = targetbuf; //Create a pointer so we can insert into the buffer
	int strsize = 0; 
	while(strsize < maxchars){
		current_char = fgetc(stdin);
		
		if (current_char == '\n') {
			*char_ptr = '\0';
			break;
		} else {
			*char_ptr = current_char;
			char_ptr += sizeof(char);
			strsize += 1;
		}

		if(strsize == STDINBUFSIZE-1) {
			strsize = -1;
			break;
		};

	}

	return strsize;

}

int isnumber(char* nstr) {
	char* sptr = nstr;
	int retval = 1;
	while(*sptr != '\0') {
		int id = isdigit(*sptr);
		if(id == 0) {
			retval = 0;
			break;
		}

		sptr += sizeof(char);
	}

	return retval;
}

/*
	Index a spaced-delimited string
*/
typedef enum {
	Find,
	Copy
} scanstate_t;

void index_spaced_string(char* string, int index, char* outstr) {
	char* strptr = string;
	char* outstrptr = outstr;
	scanstate_t scanstate = Find;
	int spacecount = 0;
	int cflag = 1;

	while(strptr != '\0' && cflag) {
		switch(scanstate){
		case Find: {

			if (*strptr == ' ') {
				spacecount += 1;
			}

			if (spacecount == index) {
				scanstate = Copy;
			}

		break;}
		case Copy: {
			
			if(*strptr == ' ' || *strptr == '\0') cflag = 0;

			*outstrptr = *strptr;
			outstrptr += sizeof(char);

		break;}
		}


		strptr += sizeof(char);
	}
	*(outstrptr + sizeof(char)) = '\0';

}
