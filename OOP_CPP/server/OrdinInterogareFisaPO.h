#pragma once
#include "OrdinInterogareFisa.h"
class OrdinInterogareFisaPO :
    public OrdinInterogareFisa
{
public:
    OrdinInterogareFisaPO();
    virtual~OrdinInterogareFisaPO();
    void PopuleazaOrdin(std::string buffer);
};

