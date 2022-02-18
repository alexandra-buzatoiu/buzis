#include "OrdinInterogareFisaActivitate.h"
#include<fstream>



OrdinInterogareFisaActivitate::OrdinInterogareFisaActivitate():OrdinInterogareFisa()
{

}

OrdinInterogareFisaActivitate::~OrdinInterogareFisaActivitate()
{
}

void OrdinInterogareFisaActivitate::PopuleazaOrdin(std::string buffer)
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
    f >> this->profesor;
    std::string aux;
    f >> aux;
    this->profesor += aux;
    f.close();
}
