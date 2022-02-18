#include "ExceptieSocket.h"

ExceptieSocket::ExceptieSocket(int code, std::string message):Exceptie(code, message)
{
   
}

std::string ExceptieSocket::exceptie()
{
    return "Exceptie la conectarea cu clientul---SOCKET ISSUE " + std::to_string(this->code) +this->message;
}
