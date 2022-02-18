#pragma once
#include "Ordin.h"
class OrdinInterogareProfesori :
    public Ordin
{

private:
    virtual std::string getProfesor() override;
    virtual std::string getGrupa() override;
    virtual std::string getTipActivitate() override;
    virtual int getModul() override;
    virtual int getZi() override;
    virtual int getLuna() override;
    virtual std::string getTipModul() override;
    virtual std::string getPassword() override;
    

   
public:
    OrdinInterogareProfesori();
    virtual ~OrdinInterogareProfesori();
    void PopuleazaOrdin(std::string buffer) override;

};

