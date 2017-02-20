#include "jsh.h"

int debuglinect = 0;



msg_t InitJsh() {
	int status;

	// create a buffer for std_in. Only "clean" commands will be held here.
	stdinbuf_global = (char*) malloc(sizeof(char) * (MAX_CHARS_PER_LINE+1));
	
	// compile the syntax checker regex
	status = regcomp(&pregex, ALLOWED_CHARS_REGEX, REG_EXTENDED|REG_NOSUB);

	if (status != 0) {
		printf("%s","pattern failed to compile");
	}
}

msg_t RunJsh() {
	msg_t runjsh_status = INIT_STATUS;
	
	char** args;

	debug_print("Statement %d: ", debuglinect);
	debuglinect += 1;
	printf(PROMPT_STRING);
	
	// Grab, parse, and execute

	runjsh_status = GrabLine(stdinbuf_global);
	HandleError(runjsh_status);

	if(runjsh_status.eflag != 1) {
		runjsh_status = ParseLine(stdinbuf_global, &args);
		HandleError(runjsh_status);
		
		debug_print_args(&args);

		if(runjsh_status.eflag != 1) {
			runjsh_status = ExecCmd(&args);
			HandleError(runjsh_status);
		}

		// FreeBuffer(&args, runjsh_status);
		
	}

	return runjsh_status;
}

void ExitJsh() {
	// Free any globals
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

msg_t ParseLine(char* srcbuf, char** args[]) {
	msg_t parse_status = INIT_STATUS;
	int regmatch = 0;
	int status = 0;
	char* tok;
	int i;
	int wordcount = 0;
	int k = 0;

	char* sptr = srcbuf;

	parse_status = CheckSyntax(srcbuf);
	// parse_status = INIT_STATUS;
	// If command is exit, pass the "EXIT_ERROR" upwards.
	//  Else if an error was detected from check syntax, pass the error upwards.
	//  If no errors, detected, extract the commands and return them.
	if (strcmp(srcbuf, EXIT_CMD) == 0) {
		parse_status = EXIT_ERROR;
		return parse_status;
	} else if (*srcbuf == '\0') {
		return parse_status;
	} else if (parse_status.eflag) {
		return parse_status;
	} else {
		// parse_status = ExtractCommands(srcbuf, args);
		wordcount = CountWords(srcbuf);
		tok = strtok(srcbuf, WORD_DELIM);
		*args = (char**) malloc(sizeof(char*) * wordcount + 1);
		
		for(i = 0; i < wordcount; i++) {
			(*args)[i] = (char*) malloc(sizeof(char) * MAX_CHARS_PER_LINE + 1);
		}
		(*args)[wordcount-1] = NULL;
		debug_print("Entered: %s\n", tok);

		while(tok) {
			tok = strtok(NULL, WORD_DELIM);
			if(tok != NULL && strcmp(tok, "\t") && strcmp(tok, " ")) {
				strcpy((*args)[k], tok);
				// debug_print("Entered: %s\n", (*args)[k]);
				k += 1;
			}
		}


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

	return syntax_status;

}

void HandleError(msg_t errorin) {
	if (errorin.eflag == 1) {
		printf("ERROR: %s\n", errorin.msg);
	}
}


msg_t ExecCmd(char** args[]) {
	int status;
	int pid;
	int vpstatus;
	msg_t exec_status = INIT_STATUS;

	pid = fork();
	if(pid != 0) {
		waitpid(pid, &status, 0);
	} else if (pid < 0) {
		debug_print("Process spawned with pid %d", pid);
		exec_status = FORK_FAILED_ERROR;
	} /* else if(arg[0] == '\0') {
		NULL;
	} */ else {
		vpstatus = execvp(*(args)[0],(*args));
		// vpstatus = execlp("/bin/ls","ls",NULL);

		debug_print("Tried calling: %s\n", *(args)[0]);
		exec_status = EXEC_FAILED_ERROR;
		exit(EXIT_FAILURE);

	}

	return exec_status;
}

void ClearError(msg_t* errorin) {
	*errorin = INIT_STATUS;
}

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

void FreeBuffer(char** args[], msg_t errorin) {
	if(errorin.eflag != 1) {
		int i = 0;
		while((*args)[i]) {
			free((*args)[i]);
			i += 1;
		}
	}
}

void debug_print_args(char** args[]) {
	int i = 0;
	while((*args)[i] != NULL) {
		debug_print("\tEntered: %s\n", (*args)[i]);
		i += 1;
	}
}