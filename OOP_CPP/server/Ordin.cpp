#include "Ordin.h"

Ordin::Ordin():IOrdin()
{

}

Ordin::~Ordin()
{
}

std::string Ordin::getUser()
{
    return this->user;
}

int Ordin::getIndex()
{
    return this->index;
}
