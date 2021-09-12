#include	"pch.h"

#define	USAGE_ERROR		2
#define	CONNEXION_FAILED	3
#define AUTH_FAILED		4

const char *username;
const char *password;
const char *hostaddr;

int rc;
int sock;
int written;

LIBSSH2_SESSION *session;
LIBSSH2_CHANNEL *channel;

char commandbuf[BUFSIZ];
char inputbuf[BUFSIZ];

const char numfds = 2;

struct pollfd pfds[2];
