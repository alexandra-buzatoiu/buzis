#pragma once
#include "IOrdin.h"
class Ordin :
    public IOrdin
{
protected:
    std::string user;
    int index;
public:

    Ordin();
    virtual~Ordin();
    std::string getUser() override;
    int getIndex()override;
};

