#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <ctype.h>

#define WORD_MULT 64
#define CHAR_MULT 64

int get_chars_from_stdin(char* targetbuf, int maxchars);
int isnumber(char* nstr) ;

int main() {
	char** linearr = (char**) malloc(sizeof(char*) * WORD_MULT);
	char* currentline = (char*) malloc(sizeof(char) * CHAR_MULT);

	int lsa = 0;
	int i;
	int realloc_count = 1;
	int charct;

	strcpy(currentline,"placeholder");
	
	while(!isnumber(currentline)) {
		
		charct = get_chars_from_stdin(currentline, CHAR_MULT);
		linearr[lsa] = (char*) malloc(sizeof(char*) * charct);
		strcpy(linearr[lsa], currentline);
		lsa += 1;

		if (lsa >= WORD_MULT*realloc_count) {
			realloc_count += 1;
			linearr = realloc(linearr, sizeof(char*)*WORD_MULT*realloc_count);
		}

	}

	printf("%s\n",linearr[atoi(currentline)]);
	
	// Free malloc'd memory
	for(i = 0; i <= lsa; i++) {
		free(linearr[lsa]);
	}

	free(currentline);
	free(linearr);


	return 0;
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