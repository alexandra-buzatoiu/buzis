#include "OrdinModificareAdaugareProiect.h"
#include<fstream>

OrdinModificareAdaugareProiect::OrdinModificareAdaugareProiect():OrdinModificare()
{
}

OrdinModificareAdaugareProiect::~OrdinModificareAdaugareProiect()
{
}

void OrdinModificareAdaugareProiect::PopuleazaOrdin(std::string s)
{
	
		std::ofstream f1;
		f1.open("in.txt");
		f1 << s;
		f1.close();
		std::ifstream f;
		f.open("in.txt");
		f.seekg(0);
		f >> this->index;
		f >> this->user;
		f >> this->profesor;
		std::string aux;
		f >> aux;
		this->profesor += " ";
		this->profesor += aux;
		this->grupa="-";
		f >> this->modul;
		f >> this->zi;
		f >> this->luna;
		this->tip_modul = "-";
		this->tip_activitate="PROIECT";

		f.close();
	
}


