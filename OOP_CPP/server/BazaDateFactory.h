#pragma once
#include"IBazaDate.h"
#include"BazaDateOrar.h"
#include"BazaDateUseri.h"
#include"IOrdin.h"


class BazaDateFactory
{
public:
	static IBazaDate* genereazaBazaPotrivita(IOrdin* o);
};

