#ifndef __JSH_
#define __JSH_

#include <string.h>
#include <stdlib.h>
#include <stdio.h>

// Parameters 
#define MAX_CHARS_PER_LINE 64
#define STAT_MESSAGE_MAX_CHARS 64
#define PROMPT_STRING "jsh$ "
#define EXIT_CMD "exit"

// Constants related to error handling
#define INIT_STATUS (error_t) {0, 0, "OK", 0}

#define TOO_MANY_CHARS_MSG "Line character limit exceeded."
#define TOO_MANY_CHARS_ERROR (error_t) {1, 101, TOO_MANY_CHARS_MSG, 0}

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

error_t InitJsh();
error_t RunJsh();
error_t GrabLine(char* targetbuf);
void ExitJsh();
error_t ParseLine(char* srcbuf);

#endif