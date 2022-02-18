#pragma once
#include<string>
class IException
{
public:
	virtual std::string exceptie() = 0;
	IException() {};
	virtual ~IException() {};
};

