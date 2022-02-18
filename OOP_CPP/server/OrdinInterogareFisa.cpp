#include "OrdinInterogareFisa.h"

OrdinInterogareFisa::OrdinInterogareFisa():OrdinInterogare()
{
}

OrdinInterogareFisa::~OrdinInterogareFisa()
{
}

std::string OrdinInterogareFisa::getProfesor()
{
	return this->profesor;
}

std::string OrdinInterogareFisa::getGrupa()
{
	return std::string();
}
