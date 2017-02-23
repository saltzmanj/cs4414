#ifndef __SPP_H_
#define __SPP_H_

#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <regex.h>
#include <unistd.h>
#include <sys/wait.h>
#include <fcntl.h>
#include <sys/stat.h>

// ---------------------------------------------------- Parameters 
#define MAX_CHARS_PER_LINE 80
#define STAT_MESSAGE_MAX_CHARS 64
#define PROMPT_STRING "spp$ "
#define ALLOWED_CHARS_REGEX (const char*) "^[A-Za-z0-9[:space:]\\.\\_\\-]+([<|>]?[[:space:]]* [A-Za-z0-9\\._]+[A-Za-z0-9[:space:]\\.\\_\\-]*)*$"
#define WORD_DELIM " "
#define PIPE_CHAR "|"
#define STARTUP_STRING "shell++\nJake Saltzman\nCS4414 Spring 2017\n\n"
#define MAX_ARGS 8
#define MAX_PIPED_CMDS 4
// ---------------------------------------------------- Debugging stuff
#define DEBUG 1
#define debug_print(...) \
	do { if (DEBUG) fprintf(stdout, __VA_ARGS__); } while(0)

// ----------------------------------------------------- Shell specific commands
#define EXIT_CMD "exit"

// ------------------------------------------------------ Constants related to error handling

#define NO_ERROR (error_t) {0, 0, "OK", 0, 0}

#define TOO_MANY_CHARS_MSG "Line character limit exceeded."
#define TOO_MANY_CHARS_ERROR (error_t) {1, 101, TOO_MANY_CHARS_MSG, 0, 0}

#define SYNTAX_ERR_MSG "Syntax Error."
#define SYNTAX_ERR_ERROR (error_t) {1, 102, SYNTAX_ERR_MSG, 0, 0}

#define SYNTAX_ERR_DBLREDIR_MSG "Syntax Error - Double Redirect."
#define SYNTAX_ERR_DBLREDIR_ERROR (error_t) {1, 112, SYNTAX_ERR_DBLREDIR_MSG, 0, 0}

// #define EXIT_MSG "Goodbye!"
// #define EXIT_ERROR (error_t) {0, 0, EXIT_MSG, 1, 0}

#define FORK_FAILED_MSG "Fork failed."
#define FORK_FAILED_ERROR (error_t) {1, 201, FORK_FAILED_MSG, 0, 0}

#define EXEC_FAILED_MSG "Target function failed to execute."
#define EXEC_FAILED_ERROR (error_t) {1, 202, EXEC_FAILED_MSG, 0, 0}

#define UNKNOWN_MSG "An unknown error occurred."
#define UNKNOWN_ERROR (error_t) {1, 999, UNKNOWN_MSG, 0, 0}

#define REGEX_MSG "Regex failed to compile."
#define REGEX_ERROR (error_t) {1, 301, REGEX_MSG, 0, 1}

#define REDIR_ERR_MSG "Error redirecting to file."
#define REDIR_ERROR (error_t) {1, 401, REDIR_ERR_MSG, 0, 0}

// -------------------------------------------------- Global Variables
regex_t pregex;

// -------------------------------------------------- Tyepdefs

typedef enum {
	INITIALIZE,
	GETLINE,
	CHECK_SYNTAX,
	EXTRACT_CMDS,
	EXECUTE,
	HANDLE_ERROR,
	CLEANUP,
	SHUTDOWN,
} sppstate_t;

typedef enum {
	INITIALIZE_PS,
	GETWORD_PS,
	SET_HASSTDOUT,
	SET_HASSTDIN,
	SET_STDOUTFN,
	SET_STDINFN,
	SET_ARGS,
	CLEANUP_PS,
	SHUTDOWN_PS
} parserstate_t;

typedef enum {
	OK,
	BLANK,
	ERR
} syntax_t;

typedef struct {
	char* buffin;
	char** args;
	int argsct;

	int has_stdout_redir;
	int has_stdin_redir;

	char* stdout_redir_fn;
	char* stdin_redir_fn;
} cmd_t;

typedef struct {
	char* stdin_buffer;
	
	cmd_t* cmds;
	int cmdscount;
} sdata_t;


typedef struct {
	int eflag; // 1 if error, 0 otherwise
	int ecode; // Error code if applicable
	char msg[STAT_MESSAGE_MAX_CHARS]; // Error message
	int xflag; // 1 if exit, 0 elsewise
	int fatal; // 1 if the error is fatal, 0 otherwise
} error_t;



#define SDATA_INIT (sdata_t) {}

// -------------------------------------------------- State Machine Mechanics
void SppRun();
sppstate_t SppIterate(sppstate_t statein, sdata_t* sdata, error_t* serror);

// -------------------------------------------------- Key Functions
void GrabLine(char* targetbuf, error_t* serror);
void CheckSyntax(char* srcbuf, syntax_t* syntaxstatus, error_t* serror);
void HandleError(error_t *errorin);

// -------------------------------------------------- Utility Functions

int CountWords(char* string);
void FreeBuffer(char** args[], error_t* errorin);
void DebugPrintCommands(sdata_t* sdata);

// -------------------------------------------------- Command Extractor State Machine Mechanics
void ExtractCmds(sdata_t* sdata, error_t* serror);
parserstate_t RunExtractor(parserstate_t statein, char** strptr, cmd_t* sdata, error_t* serror);

#endif