#include "pch.h"

int main(int argc, char *argv[]){
	
	switch(establishConnexion(argv)){
		default:
			break;
		case USAGE_ERROR:
			consoleOut("Usage error\n");
			return EXIT_FAILURE;
			break;
		case CONNEXION_FAILED:
			consoleOut("Failed to connect\n");	
			return EXIT_FAILURE;
			break;
		case AUTH_FAILED:
			consoleOut("Failed to authentificate\n");
			return EXIT_FAILURE;
			break;
	}

	while(1) update();
	cleanup();
	
	return 0;
}
