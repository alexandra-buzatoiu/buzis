#pragma once
#include"IException.h"

class Exceptie :
    public IException

{
protected:
    int code;
    std::string message;
public:
    Exceptie(int code, std::string message);
    virtual ~Exceptie() {};
};

