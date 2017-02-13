#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <ctype.h>

#define NUM_BUF_SIZE 		64
#define WORD_BUF_SIZE 		1024

int get_chars_from_stdin(char* targetbuf, int maxchars);
int isnumber(char* nstr) ;


int main() {
	char* numbuf = (char*) malloc(sizeof(char)*NUM_BUF_SIZE);
	char* linebuf = (char*) malloc(sizeof(char)*WORD_BUF_SIZE);
	char* wordbuf = (char*) malloc(sizeof(char)*WORD_BUF_SIZE);
	int linenum;
	int wordnum;
	char *itertok;
	int i;

	get_chars_from_stdin(numbuf, NUM_BUF_SIZE);
	linenum = atoi(numbuf);
	get_chars_from_stdin(linebuf, WORD_BUF_SIZE);
	get_chars_from_stdin(wordbuf, NUM_BUF_SIZE);
	wordnum = atoi(wordbuf);

	i = 0;
	itertok = strtok(linebuf, " ");

	while(itertok != NULL && i <= wordnum) {
		itertok = strtok(NULL, " ");
		i += 1;
	}

	printf("%s\n",itertok);
	


}	

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

		if(strsize == maxchars-1) {
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