#pragma once
#include<string>

class IOrdin
{
public:
	virtual void PopuleazaOrdin(std::string buffer) = 0;
	virtual std::string getUser() = 0;
	virtual std::string getPassword() = 0;
	virtual std::string getProfesor() = 0;
	virtual std::string getGrupa() = 0;
	virtual std::string getTipActivitate() = 0;
	virtual int getModul() = 0;
	virtual int getZi() = 0;
	virtual int getLuna() = 0;
	virtual std::string getTipModul() = 0;
	virtual int getIndex() = 0;

	IOrdin();
	virtual~IOrdin();
};

