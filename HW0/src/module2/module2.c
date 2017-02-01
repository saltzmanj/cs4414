#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#define STDINBUFSIZE 1024
#define INDEXBUFSIZE 8
#define SINGLEWORDBUFSIZE 32

int get_chars_from_stdin(char* targetbuf);
int isnumber(char* nstr);

int main() {
	char* stringlength_input = (char*) malloc(sizeof(char) * INDEXBUFSIZE);
	int stringlength;

	char* stringindex_input = (char*) malloc(sizeof(char) * INDEXBUFSIZE);
	int stringindex;

	char* inputstring = (char*) malloc(sizeof(char) * STDINBUFSIZE);
	char* resultant = (char*) malloc(sizeof(char) * SINGLEWORDBUFSIZE);

	get_chars_from_stdin(stringlength_input);
	
	if(isnumber(stringlength_input)) {
		stringlength = strtol(stringlength_input, NULL, 10);
	} else {
		printf("%s\n", "I/O Error"); return -1;
	}

	get_chars_from_stdin(inputstring);
	get_chars_from_stdin(stringindex_input);

	if(isnumber(stringindex_input)) {
		stringindex = strtol(stringindex_input, NULL, 10);
	} else {
		printf("%s\n", "I/O Error"); return -1;
	}

	
	free(stringlength_input);
	free(stringindex_input);
	free(inputstring);
	free(resultant);

}

/* Get the character string from stdin

	Returned status codes: 
	-1: Error (string exceeds buffer)
	0+: length of the string.
*/

int get_chars_from_stdin(char* targetbuf) {
	char current_char; // Buffer space for last char from command line
	char* char_ptr = targetbuf; //Create a pointer so we can insert into the buffer
	int strsize = 0; 
	while(1){
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
