#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#define BUFSIZE 1024

int get_chars_from_stdin(char* targetbuf);

int main() {
	char* char_buffer = (char *) malloc(sizeof(char) * BUFSIZE); //Create a buffer for the input characters
	int status = 0;

	while(status != -1) {
		status = get_chars_from_stdin(char_buffer);
		if(status!=-1) printf("%d\n", status);
	}

	free(char_buffer);
	

	return 0;
}


/* Get the character string from stdin

	Returned status codes:
		-1: exit
		 0+: length of the string
*/

int get_chars_from_stdin(char* targetbuf) {
	char current_char; // Buffer space for last char from command line
	char* char_ptr = targetbuf; //Create a pointer so we can insert into the buffer
	int strsize = 0; 
	int retcode;
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

	}

	if(!strcmp(targetbuf, "exit")) {
		retcode = -1;
	} else {
		retcode = strsize;
	}

	return retcode;

}
