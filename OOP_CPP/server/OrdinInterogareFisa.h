#pragma once
#include "OrdinInterogare.h"
class OrdinInterogareFisa :
    public OrdinInterogare
{
protected:
    std::string profesor;
public:
    OrdinInterogareFisa();
    virtual~OrdinInterogareFisa();
    virtual std::string getProfesor() override;

private:
    virtual std::string getGrupa() override;
};

