#pragma once
#include"OrdinInterogareFisaActivitate.h"
#include"OrdinInterogareFisaPO.h"
#include"OrdinLog.h"
#include"OrdinInterogareOrarGrupa.h"
#include"OrdinInterogareOrarProfesor.h"
#include"OrdinModificareAdaugareProiect.h"
#include"OrdinModificareStergere.h"
#include"OrdinInterogareProfesori.h"
#include<string>

class OrdinFactory
{
public:
	static IOrdin* generare_ordincorect(std::string buffer);


};

