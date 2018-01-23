#include<stdio.h>
#include<winsock2.h>
#include<string.h>

#pragma comment(lib,"ws2_32.lib")


int main(int atgc, char *argv[]) {
	WSADATA wsa;
	SOCKET servSock,newServSock;
	struct sockaddr_in servaddr,cliaddr;

	printf("\nIntializing winsock");
	if (WSAStartup(MAKEWORD(2, 2), &wsa) != 0) {
		printf("\nFailed. Error Code: %d", WSAGetLastError());
		return 1;
	}
	printf("\nINtialized");

	if ((servSock = socket(AF_INET, SOCK_STREAM, 0)) == INVALID_SOCKET) {
		printf("Could not create socket: %d", WSAGetLastError());
	}
	printf("\nSocket created");

	servaddr.sin_family = AF_INET;
	servaddr.sin_addr.s_addr = INADDR_ANY;
	servaddr.sin_port = htons(2222);

	if (bind(servSock, (const struct sockaddr *)&servaddr, sizeof(servaddr)) == SOCKET_ERROR) {
		printf("Bind failed with error %d", WSAGetLastError());
	}
	printf("\nBinding dones\n");
	listen(servSock, 3);

	int c = sizeof(struct sockaddr_in);
	newServSock = accept(servSock, (struct sockaddr *)&cliaddr, &c);
	
	if (newServSock == INVALID_SOCKET)
	{
		printf("accept failed with error code : %d", WSAGetLastError());
		//asd
	}

	char buffer[256];
	read(newServSock, buffer, 255);
	printf("\nGot this message: %s\n",buffer);



	
	

	//char buffer[256];
	//fgets(buffer)
	
	
	//close(s);
	closesocket(newServSock);
	closesocket(servSock);
	WSACleanup();

	return 0;


}