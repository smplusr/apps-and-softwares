#include "pch.h"

int update(){
	pfds[0].fd = sock;
	pfds[0].events = POLLIN;
	pfds[0].revents = 0;
	pfds[1].fd = STDIN_FILENO;
	pfds[1].events = POLLIN;
	pfds[1].revents = 0;

	poll(pfds, numfds, -1);

	if(pfds[0].revents & POLLIN) {
		do{
			rc = libssh2_channel_read(channel, inputbuf, BUFSIZ);
			consoleOut(inputbuf);
			fflush(stdout);
			memset(inputbuf, 0, BUFSIZ);
		}while(LIBSSH2_ERROR_EAGAIN != rc && rc > 0);

	}

	if(pfds[1].revents & POLLIN){	

		consoleIn();

		commandbuf[strlen(commandbuf) - 1] = '\r';
		commandbuf[strlen(commandbuf)] =   '\n';
		commandbuf[strlen(commandbuf) + 1] = '\0';
		
		written = 0;
		do{
			rc = libssh2_channel_write(channel, commandbuf, strlen(commandbuf));
			written += rc;
		}while(LIBSSH2_ERROR_EAGAIN != rc && rc > 0 && written != strlen(commandbuf));
		memset(commandbuf, 0, BUFSIZ);
	}
}

int establishConnexion( char *argv[] ){
	struct sockaddr_in sin;
	
	if(argv[1] != NULL && argv[2] != NULL && argv[3] != NULL){
		hostaddr = argv[1];
		username = argv[2];
		password = argv[3];
	}else return USAGE_ERROR;

	libssh2_init(0);

	sock = socket(AF_INET, SOCK_STREAM, 0);

	sin.sin_family = AF_INET;
	sin.sin_port = htons(22);
	sin.sin_addr.s_addr = inet_addr(hostaddr);
	
	if(connect(sock, (struct sockaddr*)(&sin), sizeof(struct sockaddr_in)) != 0)
		return CONNEXION_FAILED;

	fcntl(sock, F_SETFL, O_NONBLOCK);

	fcntl(STDIN_FILENO, F_SETFL, O_NONBLOCK);

	session = libssh2_session_init();
	libssh2_session_handshake(session, sock);
	
	rc = libssh2_userauth_password(session, username, password);
	
	if(rc) return AUTH_FAILED;

	channel = libssh2_channel_open_session(session);

	libssh2_channel_request_pty(channel, "vt100");

	libssh2_channel_shell(channel);
	libssh2_channel_set_blocking(channel, 0);
	memset(pfds, 0, sizeof(struct pollfd) * numfds);
}

void cleanup(){
	libssh2_session_disconnect(session, "Normal Shutdown");
	libssh2_session_free(session);
	close(sock);
	libssh2_exit();
}
