#pragma once
#include "Ordin.h"
class OrdinModificare :
    public Ordin
{
private:
    virtual std::string getPassword() override;
protected:
    std::string profesor;
    std::string grupa;
    int modul; 
    int zi;
    int luna;
    std::string tip_modul;
    std::string tip_activitate;
public:
    OrdinModificare();
    virtual~OrdinModificare();
    virtual std::string getProfesor() override;
    virtual std::string getGrupa() override;
    virtual std::string getTipActivitate() override;
    virtual int getModul() override;
    virtual int getZi() override;
    virtual int getLuna() override;
    virtual std::string getTipModul() override;
    virtual void PopuleazaOrdin(std::string buffer) override;
    
};

