#include "jsh.h"

int debuglinect = 0;

msg_t InitJsh() {
	int status;

	stdinbuf_global = (char*) malloc(sizeof(char) * (MAX_CHARS_PER_LINE+1));
	status = regcomp(&pregex, ALLOWED_CHARS_REGEX, REG_EXTENDED|REG_NOSUB);

	if (status != 0) {
		printf("%s","pattern failed to compile");
	}
}

msg_t RunJsh() {
	msg_t runjsh_status = INIT_STATUS;
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

msg_t GrabLine(char* targetbuf) {
	msg_t grabline_status = INIT_STATUS;
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

msg_t ParseLine(char* srcbuf) {
	msg_t parse_status = INIT_STATUS;
	int regmatch = 0;
	int status = 0;

	parse_status = CheckSyntax(srcbuf);

	// If command is exit, exit
	if (strcmp(srcbuf, EXIT_CMD) == 0) {
		parse_status = EXIT_ERROR;
		return parse_status;
	}

	return parse_status;
}

msg_t CheckSyntax(char* srcbuf) {
	msg_t syntax_status = INIT_STATUS;
	char* strptr = srcbuf;
	int regmatch = 0;
	int status = 0;

	regmatch = regexec(&pregex, srcbuf, (size_t)0, NULL, 0);
	if(srcbuf[0] == '\0') return syntax_status;

	// Report parse failed if there is a syntax error
	if(regmatch != 0) {
		syntax_status = SYNTAX_ERR_ERROR;
		return syntax_status;
	}

	int redirchar = -1;
	// Check for double redirections
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
			return SYNTAX_ERR_DBLREDIR_ERROR;
		}

	}

}

void HandleError(msg_t errorin) {
	if (errorin.eflag == 1) {
		printf("ERROR: %s\n", errorin.msg);
	}
}