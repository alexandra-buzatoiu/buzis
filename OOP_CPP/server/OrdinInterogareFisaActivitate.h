#pragma once
#include "OrdinInterogareFisa.h"
class OrdinInterogareFisaActivitate :
    public OrdinInterogareFisa
{
public:
    OrdinInterogareFisaActivitate();
    virtual~OrdinInterogareFisaActivitate();
    void PopuleazaOrdin(std::string buffer) override;
};

