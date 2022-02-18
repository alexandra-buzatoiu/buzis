#include "ExceptieMySQL.h"

ExceptieMySQL::ExceptieMySQL(int code, std::string message) :Exceptie(code, message)
{

}

std::string ExceptieMySQL::exceptie()
{
    return "Exceptie la conectarea cu Baza de Date---MySQL ISSUE " + std::to_string(this->code) + this->message;
}
