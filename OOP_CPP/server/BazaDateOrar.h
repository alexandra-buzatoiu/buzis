#pragma once
#include "BazaDate.h"
#include<vector>
class BazaDateOrar :
    public BazaDate
{

public:
    struct extrasDB {
        char username[100];
        char grupa[100];
        char profesor[100];
        char tip_modul[100];
        char tip_activitate[100];
        int zi;
        int modul;
        int luna;

        std::string strigifyFisa();
        std::string stringifyOrarGrupa();
        
    };

private:
    std::string profesor;
    std::string grupa;
    int modul;
    int zi;
    int luna;
    std::string tip_modul;
    std::string tip_activitate;
    std::vector<extrasDB> DateExtraseQuery;
    BazaDateOrar() {};
    BazaDateOrar(const BazaDateOrar&) {};
    ~BazaDateOrar() {};
    static BazaDateOrar* instance;
public:
     static BazaDateOrar* getInstanece();
    virtual void primesteOrdin(IOrdin* ordin) override;
    virtual void modifica() override;
    virtual void extrage() override;
    virtual std::string deTrimis() override;
    std::string adaugareModul();
    std::string stergereModul();
    std::string orarGrupa();
    std::string fisaPO();
    std::string adaugareProiect();
    std::string orarProfesor();
    std::string fisaActivitate();
};

