#include "AdministrareServer.h"
#include"IOrdin.h"
#include"IBazaDate.h"

AdministrareServer* AdministrareServer::instance = nullptr;

AdministrareServer* AdministrareServer::getInstance()
{
    if (instance == nullptr)
        instance = new AdministrareServer;
    return instance;
}

void AdministrareServer::setString(std::string primit)
{
    this->bufferFromClient = primit;
}

std::string AdministrareServer::get_string(std::string deTrimis)
{
    return this->bufferTOClient;
}

void AdministrareServer::emiteOrdin()
{
    //IOrdin* o si aici factory de ordine
   // o.populeaza(fromBuffer);
   // this->ordin = o;
}

void AdministrareServer::administrareBazaDate()
{
    //TODO
}
