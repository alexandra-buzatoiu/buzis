#pragma once
#include "Ordin.h"
class OrdinInterogare :
    public Ordin
{
private:
	virtual std::string getPassword() override;
	virtual std::string getTipActivitate() override;
	virtual int getModul() override;
	virtual int getZi() override;
	virtual int getLuna() override;
	virtual std::string getTipModul() override;
public:
    OrdinInterogare();
    virtual~OrdinInterogare();
};

