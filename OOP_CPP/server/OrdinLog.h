#pragma once
#include "Ordin.h"
class OrdinLog :
    public Ordin
{
protected:
    std::string password;
    //std::string nume;
public:
    OrdinLog();
    virtual~OrdinLog();
    virtual void PopuleazaOrdin(std::string buffer);//din stringul primit populam ordinele
    std::string getPassword();
    virtual std::string getProfesor() override;

private:
    
    virtual std::string getGrupa() override;
    virtual std::string getTipActivitate() override;
    virtual int getModul() override;
    virtual int getZi() override;
    virtual int getLuna() override;
    virtual std::string getTipModul() override;
};

