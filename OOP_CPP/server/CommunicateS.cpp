#include "CommunicateS.h"

void CommunicateS::func(int sockfd)
{
        char buff[MAX];
        int n;
        // infinite loop for chat
        bool semafor = true;

        
            memset(buff, 0, MAX);

            // read the message from client and copy it in buffer
            recv(sockfd, buff, sizeof(buff), 0);
            if (strcmp(buff, "")==0)
                semafor = false;

            // print buffer which contains the client contents
            //printf("From client: %s\t To client : ", buff);
            std::cout << "From client: " << buff << "\t To client: " << std::endl;

            IOrdin* io2 = OrdinFactory::generare_ordincorect(buff);
            IBazaDate* idb2 = BazaDateFactory::genereazaBazaPotrivita(io2);
            idb2->primesteOrdin(io2);
            idb2->connect();
            idb2->extrage();
            std::string aux = idb2->deTrimis();
            std::cout << "Hello World!\n";
            idb2->disconnect();
            //std::string aux = idb2->deTrimis();

            memset(buff, 0, MAX);
            n = 0;
            // copy server message in the buffer
           // while ((buff[n++] = getchar()) != '\n')
             //   ;
            strcpy(buff, aux.c_str());
            // and send that buffer to client
            send(sockfd, buff, sizeof(buff), 1);

            // if msg contains "Exit" then server exit and chat ended.
            if (strncmp("exit", buff, 4) == 0) {
                //printf("Server Exit...\n");
                std::cout << "Server Exit...\n";

            }
        
        
}

void CommunicateS::createS()
{
    if (wsOK != 0)
    {
        //printf("Can't initialize winsock! Quit.");
        std::cout << "Can't initialize winsock! Quit.";
        exit(0);
    }
    // socket create and verification
    sockfd = socket(AF_INET, SOCK_STREAM, 0);
    if (sockfd == -1) {
        //printf("socket creation failed...\n");
        std::cout << "socket creation failed...\n";
        exit(0);
    }
    else
        printf("Socket successfully created..\n");
    memset(&servaddr, 0, sizeof(servaddr));
}

void CommunicateS::talk()
{
    std::string giver;
    int sockfd, connfd, len;
    struct sockaddr_in servaddr, cli;


    WSADATA wsData;
    WORD ver = MAKEWORD(2, 2);
    int wsOK = WSAStartup(ver, &wsData);
    if (wsOK != 0)
    {
        //printf("Can't initialize winsock! Quit.");
        std::cout << "Can't initialize winsock! Quit.";
        exit(0);
    }
    // socket create and verification
    sockfd = socket(AF_INET, SOCK_STREAM, 0);
    if (sockfd == -1) {
        //printf("socket creation failed...\n");
        std::cout << "socket creation failed...\n";
        exit(0);
    }
    else
        printf("Socket successfully created..\n");
    memset(&servaddr, 0, sizeof(servaddr));

    // assign IP, PORT
    servaddr.sin_family = AF_INET;
    servaddr.sin_addr.s_addr = htonl(INADDR_ANY);
    servaddr.sin_port = htons(PORT);

    // Binding newly created socket to given IP and verification
    if ((bind(sockfd, (SA*)&servaddr, sizeof(servaddr))) != 0) {
        // printf("socket bind failed...\n");
        std::cout << "socket bind failed...\n";
        exit(0);
    }
    else
        //printf("Socket successfully binded..\n");
        std::cout << "Socket successfully binded..\n";

    // Now server is ready to listen and verification
    if ((listen(sockfd, 5)) != 0) {
        // printf("Listen failed...\n");
        std::cout << "Listen failed...\n";
        exit(0);
    }
    else
        //printf("Server listening..\n");
        std::cout << "Server listening..\n";
    len = sizeof(cli);

    // Accept the data packet from client and verification
    connfd = accept(sockfd, (SA*)&cli, &len);
    if (connfd < 0) {
        // printf("server acccept failed...\n");
        std::cout << "server acccept failed...\n";
        exit(0);
    }
    else
        //printf("server acccept the client...\n");
        std::cout << "server acccept the client...\n";

    // Function for chatting between client and server
    func(connfd);

    // After chatting close the socket
    shutdown(sockfd, 2);
}
