#pragma once
#include "Exceptie.h"
class ExceptieMySQL :
    public Exceptie
{
public:
    ExceptieMySQL(int code, std::string message);
    virtual ~ExceptieMySQL() {};
    std::string exceptie() override;
};

