#ifndef __JSH_H
#define __JSH_H

#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <regex.h>

// Parameters 
#define MAX_CHARS_PER_LINE 64
#define STAT_MESSAGE_MAX_CHARS 64
#define PROMPT_STRING "jsh$ "
#define ALLOWED_CHARS_REGEX (const char*) "^[A-Za-z0-9[:space:]\\.\\-\\_]*([<|>[:space:]]*[A-Za-z0-9\\._]+[A-Za-z0-9\\.\\-_[:space:]]*)*$"

// Shell specific commands
#define EXIT_CMD "exit"

// Constants related to error handling
#define INIT_STATUS (error_t) {0, 0, "OK", 0}

#define TOO_MANY_CHARS_MSG "Line character limit exceeded."
#define TOO_MANY_CHARS_ERROR (error_t) {1, 101, TOO_MANY_CHARS_MSG, 0}

#define SYNTAX_ERR_MSG "Syntax Error."
#define SYNTAX_ERR_ERROR (error_t) {1, 102, SYNTAX_ERR_MSG, 0}

#define EXIT_MSG "Goodbye!"
#define EXIT_ERROR (error_t) {0, 0, EXIT_MSG, 1}


// Struct for passing around errors
typedef struct {
	int eflag; // 1 if error, 0 otherwise
	int ecode; // Error code
	char msg[STAT_MESSAGE_MAX_CHARS]; // Error message
	int xflag; // 1 if exit, 0 elsewise
} error_t;

char* stdinbuf_global;
regex_t pregex;

error_t InitJsh();
error_t RunJsh();
error_t GrabLine(char* targetbuf);
void ExitJsh();
error_t ParseLine(char* srcbuf);
void HandleError(error_t errorin);
#endif