#pragma once
#include "OrdinInterogareOrar.h"
class OrdinInterogareOrarGrupa :
    public OrdinInterogareOrar
{
private:
    virtual std::string getProfesor() override;
protected:
    std::string grupa;
public:
    OrdinInterogareOrarGrupa();
    virtual~OrdinInterogareOrarGrupa();
    void PopuleazaOrdin(std::string buffer);
    virtual std::string getGrupa() override;
};

