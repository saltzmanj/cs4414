#include "jsh.h"

int debuglinect = 0;

error_t InitJsh() {
	int status;

	stdinbuf_global = (char*) malloc(sizeof(char) * (MAX_CHARS_PER_LINE+1));
	status = regcomp(&pregex, ALLOWED_CHARS_REGEX, REG_EXTENDED|REG_NOSUB);

	if (status != 0) {
		printf("%s","pattern failed to compile");
	}
}

error_t RunJsh() {
	error_t runjsh_status = INIT_STATUS;
	printf("%d: ", debuglinect);
	debuglinect += 1;
	printf(PROMPT_STRING);
	
	runjsh_status = GrabLine(stdinbuf_global);
	HandleError(runjsh_status);

	runjsh_status = ParseLine(stdinbuf_global);
	return runjsh_status;
}

void ExitJsh() {
	free(stdinbuf_global);
}

error_t GrabLine(char* targetbuf) {
	error_t grabline_status = INIT_STATUS;
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
			grabline_status = TOO_MANY_CHARS_ERROR;
			// printf("%d", strsize);
			int c;
			while ((c = getchar()) != EOF && c != '\n')
            	continue;
			break;
		}
	}

	return grabline_status;
}

error_t ParseLine(char* srcbuf) {
	error_t parse_status = INIT_STATUS;
	int regmatch = 0;
	int status = 0;

	regmatch = regexec(&pregex, srcbuf, (size_t)0, NULL, 0);

	if(regmatch != 0) {
		parse_status = SYNTAX_ERR_ERROR;
	}

	if (strcmp(srcbuf, EXIT_CMD) == 0) {
		parse_status = EXIT_ERROR;
		return parse_status;
	}

	return parse_status;
}

void HandleError(error_t errorin) {
	if (errorin.eflag == 1) {
		printf("ERROR: %s\n", errorin.msg);
	}
}