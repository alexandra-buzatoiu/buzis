#include "OrdinInterogareOrarGrupa.h"
#include<fstream>

std::string OrdinInterogareOrarGrupa::getProfesor()
{
	return std::string();
}

OrdinInterogareOrarGrupa::OrdinInterogareOrarGrupa():OrdinInterogareOrar()
{
}

OrdinInterogareOrarGrupa::~OrdinInterogareOrarGrupa()
{
}

void OrdinInterogareOrarGrupa::PopuleazaOrdin(std::string buffer)
{
    std::ofstream f2;
    f2.open("in.txt");
    f2 << buffer;
    f2.close();
    std::ifstream f;
    f.open("in.txt");
    f.seekg(0);
    f >> this->index;
    //f >> this->nume;
    f >> this->user;
    f >> this->grupa;
    f.close();
}

std::string OrdinInterogareOrarGrupa::getGrupa()
{
	return this->grupa;
}
