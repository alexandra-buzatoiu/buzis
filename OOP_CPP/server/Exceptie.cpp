#include "Exceptie.h"

Exceptie::Exceptie(int code, std::string message)
{
	this->code = code;
	this->message = message;
}
