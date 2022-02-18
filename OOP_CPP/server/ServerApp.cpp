/*
	Live Server on port 8888
*/
//de adaugat organizatii diferite!!
#define HAVE_STRUCT_TIMESPEC
#define _CRT_SECURE_NO_WARNINGS
#include<io.h>
#include<stdio.h>
#include<winsock2.h>
#include<Windows.h>

#define _CRT_SECURE_NO_WARNINGS
#include"IBazaDate.h"
#include"IOrdin.h"
#include"BazaDateFactory.h"
#include"OrdinFactory.h"
#include <stdlib.h>

#include<pthread.h>//for threading , link with lpthread
//#include <thread> //ar fi frumos sa ma mut pe thread fiind standard c++


#pragma comment(lib,"ws2_32.lib") //Winsock Library

void* connection_handler(void*);

int main(int argc, char* argv[])
{
	WSADATA wsa;
	SOCKET s, new_socket;
	struct sockaddr_in server, client;
	int c;
	char* message = new char[256];

	printf("\nInitialising Winsock...");
	if (WSAStartup(MAKEWORD(2, 2), &wsa) != 0)
	{
		printf("Failed. Error Code : %d", WSAGetLastError());
		return 1;
	}

	printf("Initialised.\n");

	//Creez socketul
	if ((s = socket(AF_INET, SOCK_STREAM, 0)) == INVALID_SOCKET)
	{
		printf("Could not create socket : %d", WSAGetLastError());
	}

	printf("Socket created.\n");

	//Pregatesc structura sockaddr_in
	server.sin_family = AF_INET;
	server.sin_addr.s_addr = INADDR_ANY;
	server.sin_port = htons(8888);

	//Bind
	if (bind(s, (struct sockaddr*)&server, sizeof(server)) == SOCKET_ERROR)
	{
		printf("Bind failed with error code : %d", WSAGetLastError());
		exit(EXIT_FAILURE);
	}

	puts("Bind done");

	//Listen 
	listen(s, 3);

	//Accept
	puts("Waiting for incoming connections...");

	c = sizeof(struct sockaddr_in);

	while ((new_socket = accept(s, (struct sockaddr*)&client, &c)) != INVALID_SOCKET)
	{
		puts("Connection accepted");

		pthread_t sniffer_thread;
		unsigned int* new_sock = (unsigned int*)malloc(sizeof(unsigned int));
		*new_sock = new_socket;

		if (pthread_create(&sniffer_thread, NULL, connection_handler, (void*)new_sock) < 0)
		{
			perror("could not create thread");
			return 1;
		}

		//pthread_join( sniffer_thread , NULL);
		puts("Handler assigned");
	}

	if (new_socket == INVALID_SOCKET)
	{
		printf("accept failed with error code : %d", WSAGetLastError());
		return 1;
	}

	closesocket(s);
	WSACleanup();

	return 0;
}

void* connection_handler(void* socket_desc)
{
	//Preluam descriptor socket
	int sock = *(int*)socket_desc;
	int read_size;
	char message[1000], client_message[2000];
	//
	//virtual_server server;
	//Receive
	while ((read_size = recv(sock, client_message, 2000, 0)) > 0)
	{
		//Send
		client_message[read_size] = '\0'; //terminatorul de sir
		puts(client_message);

		IOrdin* io2 = OrdinFactory::generare_ordincorect(client_message);
		IBazaDate* idb2 = BazaDateFactory::genereazaBazaPotrivita(io2);
		idb2->primesteOrdin(io2);
		idb2->connect();
		idb2->extrage();
		std::string aux = idb2->deTrimis();
		std::cout << aux << "\n";
		std::cout << "Hello World!\n";
		idb2->disconnect();

		strcpy(client_message, aux.c_str());
		send(sock, client_message, sizeof(client_message), 0);
	}

	if (read_size == 0)
	{
		puts("Client disconnected");
		fflush(stdout);
	}
	else if (read_size == -1)
	{
		perror("recv failed");
	}

	//Free the socket pointer
	free(socket_desc);

	return 0;
}