#pragma once
#include "BazaDate.h"
#include<vector>

class BazaDateUseri :
    public BazaDate
{
public:
    struct extrasDB {
        char password[100];
        char username[100];
       // char profesor[100];
    };

private:
    //DIN ORDIN
    std::string password;
    //std::string profesor;
    //EXTRASE DIN DB
    std::vector<extrasDB> DateExtraseQuery;
    
    BazaDateUseri() {};
    BazaDateUseri(const BazaDateUseri&) {};
    ~BazaDateUseri();
    static BazaDateUseri* instance;
    virtual void modifica() override;
public:
   // BazaDateUseri() {};
    void printStatus(std::string);
    /*BazaDateUseri(const BazaDateUseri&) {};
    ~BazaDateUseri();*/
    std::string verificareUser();
    std::string extractProfi();
    void setUser(std::string s);
    void setName(std::string s);
    void setPassword(std::string s);
    static BazaDateUseri* getInstanece();
    virtual void primesteOrdin(IOrdin* ordin) override;
    virtual void extrage() override;
    virtual std::string deTrimis() override;
};

