#pragma once
#include "OrdinInterogareOrar.h"
class OrdinInterogareOrarProfesor :
    public OrdinInterogareOrar
{
private:
    virtual std::string getGrupa() override;
protected:
    std::string profesor;
public:
    OrdinInterogareOrarProfesor();
    virtual ~OrdinInterogareOrarProfesor();
    void PopuleazaOrdin(std::string buffer) override;
    virtual std::string getProfesor() override;
};

