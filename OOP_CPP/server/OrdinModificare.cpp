#include "OrdinModificare.h"
#include<fstream>

std::string OrdinModificare::getPassword()
{
	return std::string();
}

OrdinModificare::OrdinModificare():Ordin()
{
}

OrdinModificare::~OrdinModificare()
{
}

std::string OrdinModificare::getProfesor()
{
	return this->profesor;
}

std::string OrdinModificare::getGrupa()
{
	return this->grupa;
}

std::string OrdinModificare::getTipActivitate()
{
	return this->tip_activitate;
}

int OrdinModificare::getModul()
{
	return this->modul;
}

int OrdinModificare::getZi()
{
	return this->zi;
}

int OrdinModificare::getLuna()
{
	return this->luna;
}

std::string OrdinModificare::getTipModul()
{
	return this->tip_modul;
}

void OrdinModificare::PopuleazaOrdin(std::string buffer)
{
	std::ofstream f1;
	f1.open("in.txt");
	f1 << buffer;
	f1.close();
	std::ifstream f;
	f.open("in.txt");
	f.seekg(0);
	f >> this->index;
	//f >> this->nume;
	f >> this->user;
	f >> this->profesor;
	std::string aux;
	f >> aux;
	this->profesor += " " ;
	this->profesor += aux;
	f >> this->grupa;
	f >> this->modul;
	f >> this->zi;
	f >> this->luna;
	f >> this->tip_modul;
	f >> this->tip_activitate;

	f.close();
}


