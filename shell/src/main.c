#include <stdio.h>
#include <stdlib.h>
#include "jsh.h"

int main() {
	error_t shellstatus = INIT_STATUS;
	InitJsh();
	
	while(shellstatus.xflag != 1) {
		shellstatus = RunJsh();

		if (shellstatus.eflag == 1) {
			printf("ERROR: %s\n", shellstatus.msg);
		}
	}
	
	ExitJsh();
	
	return 0;
}
