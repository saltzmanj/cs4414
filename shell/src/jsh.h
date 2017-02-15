#ifndef __JSH_H
#define __JSH_H

#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <regex.h>

// Parameters 
#define MAX_CHARS_PER_LINE 80
#define STAT_MESSAGE_MAX_CHARS 64
#define PROMPT_STRING "jsh$ "
#define ALLOWED_CHARS_REGEX (const char*) "^[A-Za-z0-9[:space:]\\.\\_\\-]+([<|>]?[[:space:]]* [A-Za-z0-9\\._]+[A-Za-z0-9[:space:]\\.\\_\\-]*)*$"

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


// Struct for passing around errors
typedef struct {
	int eflag; // 1 if error, 0 otherwise
	int ecode; // Error code if applicable
	char msg[STAT_MESSAGE_MAX_CHARS]; // Error message
	int xflag; // 1 if exit, 0 elsewise
} msg_t;

char* stdinbuf_global;
regex_t pregex;

msg_t InitJsh();
msg_t RunJsh();
msg_t GrabLine(char* targetbuf);
void ExitJsh();
msg_t ParseLine(char* srcbuf);
msg_t CheckSyntax(char* srcbuf);
void HandleError(msg_t errorin);
#endif