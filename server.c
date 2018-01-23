//Server program:w

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <netinet/in.h>
#include <arpa/inet.h>


int main(int argc,char *argv[]){
	int sockfd,newsockfd,portno;
	socklen_t clilen;
	struct sockaddr_in cliaddr,servaddr;



	portno = atoi(argv[1]);
	sockfd = socket(AF_INET,SOCK_STREAM,0);

	servaddr.sin_family = AF_INET;
	servaddr.sin_addr.s_addr = INADDR_ANY;
	servaddr.sin_port = htons(portno);

	bind(sockfd,(const struct sockaddr *)&servaddr,sizeof(servaddr));

	listen(sockfd,3);
	clilen = sizeof(cliaddr);
	char quitString[5] = "quit";
	while(1){
		newsockfd = accept(sockfd,&cliaddr,&clilen);
		printf("in 10");
		char buffer[256];
		memset(buffer,0,256);
		while(1){

			read(newsockfd,buffer,255);
			if(strncmp(quitString,buffer,4)==0){
				break;
			}
			printf("Message recieved %s",buffer);
			memset(buffer,0,256);
		}
		close(newsockfd);
	}
	close(sockfd);
}
