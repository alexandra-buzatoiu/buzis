#pragma once
#include<string>

class IOrdin;

class IBazaDate
{
public:
	IBazaDate();
	virtual ~IBazaDate();
	virtual void connect() = 0;
	virtual void disconnect() = 0;
	virtual void primesteOrdin(IOrdin* ordin) = 0;
	virtual void modifica() = 0;
	virtual void extrage() = 0;
	virtual std::string deTrimis() = 0;
	//vom avea o clasa factory DB care va avea o metoda administrareDB(IOrdin*) care in functie de nr ordinului ne va returna pointer catre o anumita baza de date

};

