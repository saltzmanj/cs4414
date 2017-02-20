#include <stdio.h>
#include <stdlib.h>
#include "jsh.h"

int main() {
	msg_t shellstatus = INIT_STATUS;
	InitJsh();
	
	while(shellstatus.xflag != 1) {
		shellstatus = RunJsh();
	}
	
	ExitJsh();
	
	return 0;
}
