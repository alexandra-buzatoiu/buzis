#include "OrdinLog.h"
#include<fstream>

OrdinLog::OrdinLog():Ordin()
{
}

OrdinLog::~OrdinLog()
{
}

void OrdinLog::PopuleazaOrdin(std::string buffer)
{
    std::ofstream f;
    f.open("in.txt");
    f << buffer;
    f.close();
    std::ifstream f2;
    f2.open("in.txt");
    f2.seekg(0);
    f2 >> this->index;
    //f >> this->nume;
    f2 >> this->user;
    f2 >> this->password;
    f2.close();
}

std::string OrdinLog::getPassword()
{
    return this->password;
}

std::string OrdinLog::getProfesor()
{
    return std::string();
}

std::string OrdinLog::getGrupa()
{
    return std::string();
}

std::string OrdinLog::getTipActivitate()
{
    return std::string();
}

int OrdinLog::getModul()
{
    return 0;
}

int OrdinLog::getZi()
{
    return 0;
}

int OrdinLog::getLuna()
{
    return 0;
}

std::string OrdinLog::getTipModul()
{
    return "";
}
