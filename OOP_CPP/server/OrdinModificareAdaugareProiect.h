#pragma once
#include "OrdinModificare.h"
class OrdinModificareAdaugareProiect :
    public OrdinModificare
{
public:
    OrdinModificareAdaugareProiect();
    virtual~OrdinModificareAdaugareProiect();
    void PopuleazaOrdin(std::string s) override;
    
};

