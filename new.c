#include <sys/socket.h>
#include <sys/types.h>
#include <netinet/in.h>

int main(int argc,char *argv[]){
	int sockfd,newsockfd,portno;
	socklen_t clilen;
	struct sockaddr_in cliaddr,servaddr;



	portno = atoi(argv[1]);
	sockfd = socket(AF_INET,SOCK_STREAM,0);

	servaddr.sin_family = AF_INET;
	servaddr.sin_addr.s_addr = INADDR_ANY;
	servaddr.sin_port = htons(portno);


	bind(sockfd,&servaddr,sizeof(servaddr));

	listen(sockfd,3);

	clilen = sizeof(cliaddr);
	while(1){
		newsockfd = accept(sockfd,&cliaddr,&clilen);

		char buffer[256];

		read(newsockfd,buffer,255);
		printf("Message recieved from %s : %s",inet_aton(cliaddr.sin_addr.s_addr),buffer);
	}


	close(sockfd);
}
