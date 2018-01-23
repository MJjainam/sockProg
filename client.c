// Client program
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>


int main(int argc,char *argv[]){
	int sockfd,portno;
	struct hostent *server;
	struct sockaddr_in servaddr,cliaddr;

	sockfd = socket(AF_INET,SOCK_STREAM,0);

	portno = atoi(argv[2]);

	server = gethostbyname("10.252.249.119");
	if(server==NULL){
		printf("Server is null\n");
		return 0;
	}

	printf("%s\n", server->h_name);

	
		

	servaddr.sin_family = AF_INET;
	bcopy((char *)(server->h_addr),(char *)&servaddr.sin_addr.s_addr,server->h_length); 
	printf("after gethiostbyname\n");
	servaddr.sin_port = htons(portno);
	// printf("%d server port address\n",portno);

	connect(sockfd,(struct sockaddr *)&servaddr,sizeof(servaddr));

	printf("Please enter the message \n");

	char buffer[256];
	bzero(buffer,256);
	fgets(buffer,255,stdin);
	int n = write(sockfd,buffer,255);

	close(sockfd);
	



	return 0;
}
