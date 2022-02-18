#pragma once

#define _CRT_SECURE_NO_WARNINGS
#include"IBazaDate.h"
#include"IOrdin.h"
#include"BazaDateFactory.h"
#include"OrdinFactory.h"
#include <stdio.h>
//#include <stdio.h>
#include<Windows.h>  //in linker includem ws2_32.lib;wsock32.lib; ALTFEL IN VECI NU O SA MEARGAAAAA
#include<winsock.h>
#include <stdlib.h>
#include <string.h>
#include<iostream>
#define MAX 80
#define PORT 8080
#define SA struct sockaddr


class CommunicateS
{

public:

    int sockfd, connfd, len;
    struct sockaddr_in servaddr, cli;


    WSADATA wsData;
    WORD ver = MAKEWORD(2, 2);
    int wsOK = WSAStartup(ver, &wsData);
 

	void func(int sockfd);
	void createS();
    void talk();

};

