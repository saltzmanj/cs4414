#include "spp.h"
// ----------------------------------- Main

int main() {
	printf(STARTUP_STRING);
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

	// If an error is raised, rudely interrupt and move to error handler state
	if(serror->eflag) {
		nextstate = HANDLE_ERROR;
	}

	switch(statein){
		case(INITIALIZE): {
			debug_print("Initializing...\n");
			int status;
			// Initialize the stdin buffer			
			sdata->stdin_buffer = (char*) malloc(sizeof(char)*MAX_CHARS_PER_LINE + 1);
			sdata->stdin_buffer[MAX_CHARS_PER_LINE] = '\0';
			status = regcomp(&pregex, ALLOWED_CHARS_REGEX, REG_EXTENDED|REG_NOSUB);
			
			if(status != 0) {
				*serror = REGEX_ERROR;
			}
			nextstate = GETLINE;
		} break;

		case(HANDLE_ERROR): {
			// debug_print("\tHandling an error...\n");
			HandleError(serror);
			if(serror->fatal) {
				nextstate = SHUTDOWN;
			} else {
				nextstate = GETLINE;
			}

			*serror = NO_ERROR;

		} break;
		case(GETLINE): {
			// debug_print("Getting a line... ");
			printf("%s", PROMPT_STRING);
			GrabLine(sdata->stdin_buffer, serror);
			debug_print("\tDEBUGGING INFO\n\t------------\n");
			debug_print("\tLine Entered: %s\n", sdata->stdin_buffer);
			
			nextstate = CHECK_SYNTAX;
		} break;
		case(CHECK_SYNTAX): {
			syntax_t syntaxstatus = ERR;
			CheckSyntax(sdata->stdin_buffer, &syntaxstatus, serror);

			if(syntaxstatus == OK){
				nextstate = EXTRACT_CMDS;
				// debug_print("\tSyntax OK");
			} else if (syntaxstatus == BLANK) {
				nextstate = GETLINE;
				// debug_print("\tBlank Line Entered");
			} else {
				nextstate = HANDLE_ERROR;
				debug_print("\tSyntax error");
			}
		} break;
		case(EXTRACT_CMDS): {
			debug_print("\nExtracting commands...\n");
			nextstate = EXECUTE;
		} break;
		case(EXECUTE):{
			debug_print("\nExecuting Commands...\n");
			nextstate = GETLINE;
		} break;
		case(SHUTDOWN): { 
			debug_print("\nShutting Down...\n");
			free(sdata->stdin_buffer);
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

void GrabLine(char* targetbuf, error_t* serror) {
	if(serror->eflag) {
		return;
	}

	char current_char; // Buffer space for last char from command line
	char* char_ptr = targetbuf; //Create a pointer so we can insert into the buffer
	int strsize = 0; 
	int extra_chars_flag = 0;
	int sflag = 0;

	while(1) {
		current_char = fgetc(stdin);
		// putchar(current_char);
		if (current_char != '\n') {
			*char_ptr = current_char;
			char_ptr += sizeof(char);
			strsize += 1;
		} else {
			*char_ptr = '\0';
			break;
		}

		if (strsize > MAX_CHARS_PER_LINE) {
			extra_chars_flag = 1;
			*serror = TOO_MANY_CHARS_ERROR;
			// printf("%d", strsize);
			int c;
			while ((c = getchar()) != EOF && c != '\n')
            	continue;
			break;
		}
	}

}

void CheckSyntax(char* srcbuf, syntax_t* syntaxstatus, error_t* serror) {
	if(serror->eflag){
		return;
	}

	char* strptr = srcbuf;
	int regmatch = 0;
	int status = 0;
	int redirchar = -1;
	regmatch = regexec(&pregex, srcbuf, (size_t) 0, NULL, 0);

	if(srcbuf[0] == '\0'){
		*syntaxstatus = BLANK;
		return;
	} 

	if(regmatch != 0) {
		*serror = SYNTAX_ERR_ERROR;
		*syntaxstatus = ERR;
		return;
	}


	while(*strptr != '\0') {
		if (*strptr == '>') {
			redirchar = '>';
			strptr += sizeof(char);
			continue;
		} else if(*strptr == '<') {
			redirchar == '<';
			strptr += sizeof(char);
			continue;
		} else {
			strptr += sizeof(char);
		}

		if (*strptr==redirchar) {
			*serror = SYNTAX_ERR_DBLREDIR_ERROR;
			*syntaxstatus = ERR;
			return;
		}

	syntaxstatus = OK;

}

void HandleError(error_t *errorin) {
	if (errorin->eflag == 1) {
		printf("ERROR: %s\n", errorin->msg);
	}
}