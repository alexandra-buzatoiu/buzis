#include "BazaDateFactory.h"
#include"IBazaDate.h"
#include"IOrdin.h"

IBazaDate* BazaDateFactory::genereazaBazaPotrivita(IOrdin* o)
{
    IBazaDate* idb;
    if ((o->getIndex() == 1)|| (o->getIndex() == 9))
        idb = BazaDateUseri::getInstanece();
    else 
        idb = BazaDateOrar::getInstanece();

    return idb;

}
