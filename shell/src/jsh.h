#ifndef __JSH_H
#define __JSH_H

#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <regex.h>
#include <unistd.h>
#include <sys/wait.h>

// Parameters 
#define MAX_CHARS_PER_LINE 80
#define STAT_MESSAGE_MAX_CHARS 64
#define PROMPT_STRING "jsh$ "
#define ALLOWED_CHARS_REGEX (const char*) "^[A-Za-z0-9[:space:]\\.\\_\\-]+([<|>]?[[:space:]]* [A-Za-z0-9\\._]+[A-Za-z0-9[:space:]\\.\\_\\-]*)*$"
#define WORD_DELIM " "
// Debugging stuff

#define DEBUG 1
#define debug_print(...) \
	do { if (DEBUG) fprintf(stdout, __VA_ARGS__); } while(0)

// Shell specific commands
#define EXIT_CMD "exit"

// Constants related to error handling
#define INIT_STATUS (msg_t) {0, 0, "OK", 0}

#define TOO_MANY_CHARS_MSG "Line character limit exceeded."
#define TOO_MANY_CHARS_ERROR (msg_t) {1, 101, TOO_MANY_CHARS_MSG, 0}

#define SYNTAX_ERR_MSG "Syntax Error."
#define SYNTAX_ERR_ERROR (msg_t) {1, 102, SYNTAX_ERR_MSG, 0}

#define SYNTAX_ERR_DBLREDIR_MSG "Syntax Error - Double Redirect."
#define SYNTAX_ERR_DBLREDIR_ERROR (msg_t) {1, 112, SYNTAX_ERR_DBLREDIR_MSG, 0}

#define EXIT_MSG "Goodbye!"
#define EXIT_ERROR (msg_t) {0, 0, EXIT_MSG, 1}

#define FORK_FAILED_MSG "Fork failed."
#define FORK_FAILED_ERROR (msg_t) {1, 201, FORK_FAILED_MSG, 0}

#define EXEC_FAILED_MSG "Target function failed to execute."
#define EXEC_FAILED_ERROR (msg_t) {1, 202, EXEC_FAILED_MSG, 0}

#define UNKNOWN_MSG "An unknown error occurred."
#define UNKNOWN_ERROR (msg_t) {1, 999, UNKNOWN_MSG, 0}

// #define TEST_CMD (cmd_t) {"ls", {"-al"}}

// Struct for passing around errors
typedef struct {
	int eflag; // 1 if error, 0 otherwise
	int ecode; // Error code if applicable
	char msg[STAT_MESSAGE_MAX_CHARS]; // Error message
	int xflag; // 1 if exit, 0 elsewise
} msg_t;

char* stdinbuf_global;
regex_t pregex;

msg_t InitJsh(); // Initializes globals, compiles regex
msg_t RunJsh(); // Main Grab, Parse, Execute loop
msg_t GrabLine(char* targetbuf); // Get a line from stdin
void ExitJsh(); // Cleanup and exit

/*
	Parse a Line.
	char* srcbuf
		Buffer holding the line to be parsed
	char* args[]
		Note: should be passed in UNINITIALIZED
		List of output arguments with the following format:
			{"CMD", "arg1", "arg2" ..., "argn", "\0"}
*/
msg_t ParseLine(char* srcbuf, char** args[]);

/*
	Check the syntax of a line
*/
msg_t CheckSyntax(char* srcbuf);
msg_t ExtractCommands(char* cmdbuf, char** args[]);

void HandleError(msg_t errorin);
msg_t ExecCmd();

// Utility functions
int CountWords(char* string);
void FreeBuffer(char** args[], msg_t errorin);
void debug_print_args(char** args[]);
#endif