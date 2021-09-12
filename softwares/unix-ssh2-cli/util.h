#include "pch.h"

const char *consoleIn(){
	#ifdef __linux
	fgets( commandbuf, BUFSIZ-2, stdin);	
	#endif
}
void consoleOut( const char *c ){
	#ifdef __linux
	printf("%s", c);
	//fflush(stdout);	
	#endif
}
