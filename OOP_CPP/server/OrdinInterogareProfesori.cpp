#include "OrdinInterogareProfesori.h"
#include<fstream>

OrdinInterogareProfesori::OrdinInterogareProfesori():Ordin()
{
}

OrdinInterogareProfesori::~OrdinInterogareProfesori()
{
}

void OrdinInterogareProfesori::PopuleazaOrdin(std::string buffer)
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
	f.close();

}

std::string OrdinInterogareProfesori::getProfesor()
{
	return std::string();
}

std::string OrdinInterogareProfesori::getGrupa()
{
	return std::string();
}

std::string OrdinInterogareProfesori::getTipActivitate()
{
	return std::string();
}

int OrdinInterogareProfesori::getModul()
{
	return 0;
}

int OrdinInterogareProfesori::getZi()
{
	return 0;
}

int OrdinInterogareProfesori::getLuna()
{
	return 0;
}

std::string OrdinInterogareProfesori::getTipModul()
{
	return std::string();
}

std::string OrdinInterogareProfesori::getPassword()
{
	return std::string();
}
