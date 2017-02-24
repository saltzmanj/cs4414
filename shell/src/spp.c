#include "spp.h"
// ----------------------------------- Main

int main() {
	printf(STARTUP_STRING);
	SppRun();

	return 0;
}
// ----------------------------------- Top Level State Machine

void SppRun() {
	// Initialize the necessary data structures for the state machine, e.g
	//	 Current State
	//	 Persistent data struct
	//   Persistent error cluster
	sppstate_t currentstate = INITIALIZE;
	sdata_t sdata = SDATA_INIT;
	error_t serror = NO_ERROR;

	while(1) {
		currentstate = SppIterate(currentstate, &sdata, &serror);

		// Break on shutdown
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
		// Perform Initialization steps
		// 		1. malloc() stdin_buffer
		//   		- null terminate the buffer for safety 
		//     	2. Compile the syntax checking regex

		case(INITIALIZE): {
			debug_print("Initializing...\n");
			// int status;
			
			sdata->stdin_buffer = (char*) malloc(sizeof(char)*MAX_CHARS_PER_LINE + 1);
			sdata->stdin_buffer[MAX_CHARS_PER_LINE] = '\0';
		

			// Transition to GETLINE
			nextstate = GETLINE;
		} break;

		// Handle Errors
		// 		1. If the error is fatal, shutdown
		//   	   Otherwise, go to get line
		//      2. Clear the error
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

		// Get a line from stdin
		// 		1. Print the prompt string	
		//   	2. Call GrabLine() to get the characters
		case(GETLINE): {
			// debug_print("Getting a line... ");
			printf("%s", PROMPT_STRING);
			GrabLine(sdata->stdin_buffer, serror);
			debug_print("\tDEBUGGING INFO\n\t------------\n");
			debug_print("\tLine Entered: %s\n", sdata->stdin_buffer);
			
			nextstate = CHECK_SYNTAX;
		} break;


		// Check the syntax of the grabbed line
		// 		1. Call CheckSyntax()
		//   	2. If the syntax is incorrect, throw an error and set proceed to HANDLE_ERROR state
		//    		- This isn't strictly necessary since errors rudely interrupt
		//      3. If a blank line is entered, go back to getline
		//      	- This prevents creating an unecessary fork()
		case(CHECK_SYNTAX): {
			syntax_t syntaxstatus = OK;
			CheckSyntax(sdata->stdin_buffer, &syntaxstatus, serror);

			if(syntaxstatus == OK){
				nextstate = EXTRACT_CMDS;
				// debug_print("\tSyntax OK");
			} else if (syntaxstatus == BLANK) {
				nextstate = GETLINE;
				// debug_print("\tBlank Line Entered");
			} else {
				nextstate = HANDLE_ERROR;
				debug_print("\tSyntax error\n");
			}
		} break;

		// Extract commands from the buffer
		// 		1. Check if the command entered was exit. If so, go to SHUTDOWN
		//   	2. Count the number of words in the buffer. This will be the size of the args[] array passed to exec()
		//    	3. malloc() args[]
		//      4. Use strtok to populate args[], ignoring whitespace
		case(EXTRACT_CMDS): {
			if(!strcmp(sdata->stdin_buffer, EXIT_CMD)) {
				nextstate = SHUTDOWN;
			} else {
				char* tok;
				int j = 0;
				int k = 0;

				sdata->cmds = (cmd_t*) calloc(MAX_PIPED_CMDS + 1, sizeof(cmd_t));
				for(k = 0; k < MAX_PIPED_CMDS; k++) {
					sdata->cmds[k].stdin_redir_fn = (char*) calloc(MAX_CHARS_PER_LINE + 1,sizeof(char));
					sdata->cmds[k].stdout_redir_fn = (char*) calloc(MAX_CHARS_PER_LINE + 1,sizeof(char));
					sdata->cmds[k].buffin = (char*) malloc(sizeof(char) * MAX_CHARS_PER_LINE + 1);
					sdata->cmds[k].args = (char**) malloc(sizeof(char*)*MAX_ARGS + 1);
				}

				tok = strtok(sdata->stdin_buffer, PIPE_CHAR);
				j = 0;
				while(tok) {
					strcpy(sdata->cmds[j].buffin, tok);
					j += 1;
					tok = strtok(NULL, PIPE_CHAR);
				}

				sdata->cmdscount = j;

				ExtractCmds(sdata, serror);
				DebugPrintCommands(sdata);
				nextstate = EXECUTE;
			}

		} break;
	
		// Free all dynamically allocated memory
		case(CLEANUP):{
			debug_print("\tCleaning up...\n");

			int j;
			int i;

			for(j = 0; j < sdata->cmdscount; j++){
				for(i = 0; i < sdata->cmds[j].argsct; i++) {
					free(sdata->cmds[j].args[i]);
				}			
				sdata->cmds[j].has_stdout_redir = 0;
				sdata->cmds[j].has_stdin_redir = 0;
			}

			j = 0;
			for(j = 0; j < MAX_PIPED_CMDS + 1; j++){
				free(sdata->cmds[j].stdin_redir_fn);
				free(sdata->cmds[j].stdout_redir_fn);
				free(sdata->cmds[j].buffin);
				free(sdata->cmds[j].args);
			}
			sdata->cmdscount = 0;
			free(sdata->cmds);
			nextstate = GETLINE;
		} break;

		// Execute
		// 		1. fork() the current process
		//   	
		//    	Parent:
		//     		1. waitpid()
		//       
		case(EXECUTE):{
			debug_print("Executing...\n");
			int pid;
			int status;
			

			pid = fork();

			if(pid != 0) {
				// Parent
				waitpid(pid, &status, 0);
			} else if (pid < 0) {
				*serror = FORK_FAILED_ERROR;
			} else {
				// Child
				
				SetRedirs(sdata, serror, 0);
				execvp((sdata->cmds[0].args)[0], sdata->cmds[0].args);
				*serror = EXEC_FAILED_ERROR;
				exit(EXIT_FAILURE);
			}

			nextstate = CLEANUP;
		} break;
		case(SHUTDOWN): { 
			debug_print("\nShutting Down...\n");
			free(sdata->stdin_buffer);
		} break;
	}

	return nextstate;
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
	status = regcomp(&pregex, ALLOWED_CHARS_REGEX, REG_EXTENDED|REG_NOSUB);
			
	// Throw a regex error if compilation fails
	if(status != 0) {
		*serror = REGEX_ERROR;
	}

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

		*syntaxstatus = OK;

	}
}

void HandleError(error_t *errorin) {
	if (errorin->eflag == 1) {
		printf("ERROR: %s\n", errorin->msg);
	}
}

void ExtractCmds(sdata_t* sdata, error_t* serror){
	int i;
	for(i = 0; i < sdata->cmdscount; i++) {
		parserstate_t cstate = INITIALIZE;
		sdata->cmds[i].argsct = 0;
		char* strptr = sdata->cmds[i].buffin;
		while(1){
			cstate = RunExtractor(cstate, &strptr, &(sdata->cmds[i]), serror);
			if(cstate == SHUTDOWN_PS){
				break;
			}
		}
	}
}

parserstate_t RunExtractor(parserstate_t statein, char** strptr, cmd_t* cmddata, error_t* serror) {
	parserstate_t nextstate = SHUTDOWN_PS;

	switch(statein){
		case(INITIALIZE_PS):{
			cmddata->args = (char**) malloc(sizeof(char*)*MAX_ARGS + 1);
			*strptr = strtok(cmddata->buffin, WORD_DELIM);
			nextstate = SET_ARGS;
		} break;
		case(GETWORD_PS) :{
			*strptr = strtok(NULL, WORD_DELIM);
			if(!*strptr || **strptr == '\0') {
				nextstate = CLEANUP_PS;
			} else if(**strptr == '<') {
				nextstate = SET_HASSTDIN;
			} else if(**strptr == '>') {
				nextstate = SET_HASSTDOUT;
			} else {
				nextstate = SET_ARGS;
			}

		} break;
		case(SET_HASSTDOUT): {
			cmddata->has_stdout_redir = 1;
			nextstate = SET_STDOUTFN;
		} break;
		case(SET_STDOUTFN): {
			*strptr = strtok(NULL, WORD_DELIM);
			strcpy(cmddata->stdout_redir_fn, *strptr);
			nextstate = GETWORD_PS;
		} break;
		case(SET_HASSTDIN): {
			cmddata->has_stdin_redir = 1;
			nextstate = SET_STDINFN;
		} break;
		case(SET_STDINFN): {
			*strptr = strtok(NULL,WORD_DELIM);
			strcpy(cmddata->stdin_redir_fn, *strptr);
			nextstate = GETWORD_PS;
		} break;
		case(SET_ARGS): {
			int k = cmddata->argsct;
			cmddata->args[k] = (char*) malloc(sizeof(char)*strlen(*strptr) + 1);
			strcpy(cmddata->args[k], *strptr);
			cmddata->argsct += 1;
			nextstate = GETWORD_PS;
		} break;
		case(CLEANUP_PS): {
			cmddata->args[cmddata->argsct] = NULL;
			nextstate = SHUTDOWN_PS;
		} break;
		case(SHUTDOWN_PS):{
			nextstate = SHUTDOWN_PS;
		} break;
	}

	return nextstate;
}

void DebugPrintCommands(sdata_t* sdata) {
	int i;
	debug_print("\tThe following commands were entered:\n");

	for(i = 0; i < sdata->cmdscount; i++) {
		debug_print("\t\tCommand Group %d:\n", i);
		int j;
		for(j = 0; j < sdata->cmds[i].argsct; j++){
			debug_print("\t\t\tEntered Arg: %s\n", sdata->cmds[i].args[j]);
		}
		if(sdata->cmds[i].has_stdin_redir){
			debug_print("\t\t\tStdin Redir to: %s\n", sdata->cmds[i].stdin_redir_fn);
		}
		if(sdata->cmds[i].has_stdout_redir){
			debug_print("\t\t\tStdout Redir to: %s\n", sdata->cmds[i].stdout_redir_fn);
		}
	}
}

void SetRedirs(sdata_t* sdata, error_t* serror, int cmdnum){
// Stdout redirection
	if(sdata->cmds[cmdnum].has_stdout_redir) {
		debug_print("\tRedirecting stdout to: %s\n", sdata->cmds[cmdnum].stdout_redir_fn);
		int filedesc;
		filedesc = open(sdata->cmds[cmdnum].stdout_redir_fn, O_WRONLY |  O_CREAT, S_IRUSR | S_IRGRP | S_IWGRP | S_IWUSR);
		if (filedesc < 0) {
			*serror = REDIR_ERROR;
		}
		dup2(filedesc, 1); // stdout -> file
		close(filedesc);

	}

	// stdin redirection
	if(sdata->cmds[cmdnum].has_stdin_redir) {
		debug_print("\tRedirecting stdin to: %s\n", sdata->cmds[cmdnum].stdin_redir_fn);
		int filedesc;
		filedesc = open(sdata->cmds[cmdnum].stdin_redir_fn, O_RDONLY);
		if (filedesc < 0) {
			*serror = REDIR_ERROR;
		}
		dup2(filedesc, 0); // stdin -> file
		close(filedesc);
	}
}