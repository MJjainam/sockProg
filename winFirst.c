#include<stdio.h>
#include<winsock2.h>
#include<string.h>

#pragma comment(lib,"ws2_32.lib");


int main(int atgc, char *argv[]) {
	WSADATA wsa;
	SOCKET s;
	struct sockaddr_in server;

	printf("\nIntializing winsock");
	if (WSAStartup(MAKEWORD(2,2),&wsa) != 0) {
		printf("\nFailed. Error Code: %d", WSAGetLastError());
		return 1;
	}
	printf("\nINtialized");
	
	if((s = socket(AF_INET,SOCK_STREAM,0))==INVALID_SOCKET){
		printf("Could not create socket: %d", WSAGetLastError());
	}
	printf("\nSocket created");

	server.sin_addr.s_addr = inet_addr("10.106.132.64");
	 
	//printf("%s",&server.sin_addr.s_addr);
	server.sin_family = AF_INET;
	server.sin_port = htons(2222);

	//Connect to remote server
	if (connect(s, (struct sockaddr *)&server, sizeof(server)) < 0) {
		puts("Connect error");
		return 1;
	}
	puts("Connected");
	
	char buffer[256];
	char quitString[5] = "quit";
	while(1){

		memset(buffer,0,256);
		
		fgets(buffer,255,stdin);
		printf("%d",strncmp(buffer,quitString,4));
		send(s,buffer,255,0);
		
		if(strncmp(buffer,quitString,4)==0){
			//close(s);
			//return 0;
			break;
		}


	}
	//close(s);
	closesocket(s);
	return 0;

	
}