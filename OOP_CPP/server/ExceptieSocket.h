#pragma once
#include "Exceptie.h"
class ExceptieSocket :
    public Exceptie
{
public:
    ExceptieSocket(int code, std::string message);
    virtual ~ExceptieSocket() {};
    std::string exceptie() override;
};

