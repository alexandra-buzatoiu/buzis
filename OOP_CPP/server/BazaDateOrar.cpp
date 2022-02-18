#include "BazaDateOrar.h"
#include"IOrdin.h"

BazaDateOrar* BazaDateOrar::instance = nullptr;

BazaDateOrar* BazaDateOrar::getInstanece()
{
	if (instance == nullptr)
		instance = new BazaDateOrar;
	return instance;
}

void BazaDateOrar::primesteOrdin(IOrdin* ordin)
{
	this->watdoink = ordin->getIndex();
	this->username = ordin->getUser();
	this->grupa = ordin->getGrupa();
	this->luna = ordin->getLuna();
	this->modul = ordin->getModul();
	this->profesor = ordin->getProfesor();
	this->tip_activitate = ordin->getTipActivitate();
	this->tip_modul = ordin->getTipModul();
	this->zi = ordin->getZi();
}



void BazaDateOrar::modifica()
{
	//daca indexul este de stergere se sterge
	if (this->watdoink == 7)
	{
		this->dateExtrase = this->adaugareModul();
	}
	else if (this->watdoink == 6)
	{
		this->dateExtrase = this->stergereModul();
	}
	else if (this->watdoink == 2)
	{
		this->dateExtrase = this->orarGrupa();
	}
	else if (this->watdoink == 4)
	{
		this->dateExtrase = this->fisaPO();
	}
	else if (this->watdoink == 8)
	{
		this->dateExtrase = this->adaugareProiect();
	}
	else if (this->watdoink == 3)
	{
		this->dateExtrase = this->orarProfesor();
	}
	else if (this->watdoink == 5)
	{
		this->dateExtrase = this->fisaActivitate();
	}
	else
		std::cout << "Nu exista asemenea actiune.\n";
	//daca indexul este de adaugare se adauga
}

void BazaDateOrar::extrage()
{
	//orar prof
	//orar grupa
	//fisa activitate
	//fisa PO
	//daca indexul este de stergere se sterge
	if (this->watdoink == 7)
	{
		this->dateExtrase = this->adaugareModul();
	}
	else if (this->watdoink == 6)
	{
		this->dateExtrase = this->stergereModul();
	}
	else if (this->watdoink == 2)
	{
		this->dateExtrase = this->orarGrupa();
	}
	else if (this->watdoink == 4)
	{
		this->dateExtrase = this->fisaPO();
	}
	else if (this->watdoink == 8)
	{
		this->dateExtrase = this->adaugareProiect();
	}
	else if (this->watdoink == 3)
	{
		this->dateExtrase = this->orarProfesor();
	}
	else if (this->watdoink == 5)
	{
		this->dateExtrase = this->fisaActivitate();
	}
	else
		std::cout << "Nu exista asemenea actiune.\n";
	//daca indexul este de adaugare se adauga
}

std::string BazaDateOrar::deTrimis()
{
	return this->dateExtrase;
}

std::string BazaDateOrar::adaugareModul()
{
	if (SQL_SUCCESS != SQLAllocHandle(SQL_HANDLE_STMT, sqlConnHandle, &sqlStmtHandle))
	{
		std::cout << "Nu i bine";
		return "ERROR\n";
	}

	std::string out;
	//VERIFICARE USER
	std::string query = "SELECT * FROM Orar WHERE grupa = '" + this->grupa + "' AND luna = '" + std::to_string(this->luna) + "' AND zi = '" + std::to_string(this->zi) + "' AND modul = '" + std::to_string(this->modul) + "'";
	if (SQL_SUCCESS != SQLExecDirect(sqlStmtHandle, (SQLCHAR*)(query.c_str()), SQL_NTS)) {
		std::cout << query;
		std::cout << "Error querying SQL Server";
		std::cout << "\n";
		return "Error querying SQL Server";
	}
	else {
		this->DateExtraseQuery.clear();

		while (SQLFetch(sqlStmtHandle) == SQL_SUCCESS)
		{
			extrasDB ex;
			SQLGetData(sqlStmtHandle, 1, SQL_C_DEFAULT, ex.profesor, sizeof(ex.profesor), NULL);
			SQLGetData(sqlStmtHandle, 2, SQL_C_DEFAULT, ex.grupa, sizeof(ex.grupa), NULL);
			//SQLGetData(sqlStmtHandle, 3, SQL_C_DEFAULT, ex.profesor, sizeof(ex.profesor), NULL);
			this->DateExtraseQuery.push_back(ex);
		}
		if ((this->DateExtraseQuery).size() != 0) ///crapa fara asta in cazul in care nu avem user cu username ul introdus
		{
			out = "Grupa selectata nuuuuuu este disponibila la data si modulul selectate!\n" ;
			return out;
		}
	}

	

	if (SQL_SUCCESS != SQLAllocHandle(SQL_HANDLE_STMT, sqlConnHandle, &sqlStmtHandle))
	{
		std::cout << "Nu i bine";
		return "ERROR\n";
	}

	//VERIFICARE USER
	query = "SELECT * FROM Orar WHERE numeProf = '" + this->profesor + "' AND luna = '" + std::to_string(this->luna) + "' AND zi = '" + std::to_string(this->zi) + "' AND modul = '" + std::to_string(this->modul) + "'";
	if (SQL_SUCCESS != SQLExecDirect(sqlStmtHandle, (SQLCHAR*)(query.c_str()), SQL_NTS)) {
		std::cout << query;
		std::cout << "Error querying SQL Server";
		std::cout << "\n";
		return "Error querying SQL Server";
	}
	else {

		while (SQLFetch(sqlStmtHandle) == SQL_SUCCESS)
		{
			extrasDB ex;
			SQLGetData(sqlStmtHandle, 1, SQL_C_DEFAULT, ex.profesor, sizeof(ex.profesor), NULL);
			SQLGetData(sqlStmtHandle, 2, SQL_C_DEFAULT, ex.grupa, sizeof(ex.grupa), NULL);
			//SQLGetData(sqlStmtHandle, 3, SQL_C_DEFAULT, ex.profesor, sizeof(ex.profesor), NULL);
			this->DateExtraseQuery.push_back(ex);
		}
		if ((this->DateExtraseQuery).size() != 0) 
		{
			out = "Profesorul nuuuuuu este disponibil, nu se poate programa un modul atunci!!\n";
			return out;
		}
	}
	//verifica daca profu e liber! altfel iar nu putem insera



	if (SQL_SUCCESS != SQLAllocHandle(SQL_HANDLE_STMT, sqlConnHandle, &sqlStmtHandle))
	{
		std::cout << "Nu i bine";
		return "ERROR\n";
	}

	query = "INSERT INTO Orar (username, numeProf, grupa, modul, zi, luna, tip_modul, tip_activitate) VALUES ('"+ this->username+ "' , '" + this->profesor + "' , '" + this->grupa + "' , '" + std::to_string(this->modul) + "' , '" + std::to_string(this->zi) + "' , '" + std::to_string(this->luna) + "' , '" + this->tip_modul + "' , '" + this->tip_activitate  + "')";
	if (SQL_SUCCESS != SQLExecDirect(sqlStmtHandle, (SQLCHAR*)(query.c_str()), SQL_NTS)) {
		std::cout << query;
		std::cout << "Error querying SQL Server";
		std::cout << "\n";
		return "Error querying SQL Server";
	}

	return "Modul adaugat cu succes!\n";
}

std::string BazaDateOrar::stergereModul()
{
	if (SQL_SUCCESS != SQLAllocHandle(SQL_HANDLE_STMT, sqlConnHandle, &sqlStmtHandle))
	{
		std::cout << "Nu i bine";
		return "ERROR\n";
	}

	std::string query;

	query = "DELETE FROM Orar WHERE numeProf = '" + this->profesor + "' AND luna = '" + std::to_string(this->luna) + "' AND zi = '" + std::to_string(this->zi) + "' AND modul = '" + std::to_string(this->modul) + "'";
	if (SQL_SUCCESS != SQLExecDirect(sqlStmtHandle, (SQLCHAR*)(query.c_str()), SQL_NTS)) {
		std::cout << query;
		std::cout << "Error querying SQL Server";
		std::cout << "\n";
		return "Error querying SQL Server";
	}

	return "Eliminarea modulului din orar s-a finalizat cu succes!\n";
}

std::string BazaDateOrar::orarGrupa()
{

	if (SQL_SUCCESS != SQLAllocHandle(SQL_HANDLE_STMT, sqlConnHandle, &sqlStmtHandle))
	{
		std::cout << "Nu i bine";
		return "ERROR\n";
	}

	std::string out;
	//VERIFICARE USER
	std::string query = "SELECT * FROM Orar WHERE grupa = '" + this->grupa + "'";
	if (SQL_SUCCESS != SQLExecDirect(sqlStmtHandle, (SQLCHAR*)(query.c_str()), SQL_NTS)) {
		std::cout << query;
		std::cout << "Error querying SQL Server";
		std::cout << "\n";
		return "Error querying SQL Server";
	}
	else {

		while (SQLFetch(sqlStmtHandle) == SQL_SUCCESS)
		{
			extrasDB ex;
			SQLGetData(sqlStmtHandle, 1, SQL_C_DEFAULT, ex.profesor, sizeof(ex.profesor), NULL);
			SQLGetData(sqlStmtHandle, 2, SQL_C_DEFAULT, ex.grupa, sizeof(ex.grupa), NULL);
			SQLGetData(sqlStmtHandle, 3, SQL_C_DEFAULT, &ex.modul, sizeof(ex.modul), NULL);
			SQLGetData(sqlStmtHandle, 4, SQL_C_DEFAULT, &ex.zi, sizeof(ex.zi), NULL);
			SQLGetData(sqlStmtHandle, 5, SQL_C_DEFAULT, &ex.luna, sizeof(ex.luna), NULL);
			SQLGetData(sqlStmtHandle, 6, SQL_C_DEFAULT, ex.tip_modul, sizeof(ex.tip_modul), NULL);
			SQLGetData(sqlStmtHandle, 7, SQL_C_DEFAULT, ex.tip_activitate, sizeof(ex.tip_activitate), NULL);
			//SQLGetData(sqlStmtHandle, 3, SQL_C_DEFAULT, ex.profesor, sizeof(ex.profesor), NULL);
			this->DateExtraseQuery.push_back(ex);
			out += ex.strigifyFisa();
		}
		if ((this->DateExtraseQuery).size() == 0) ///crapa fara asta in cazul in care nu avem user cu username ul introdus
		{
			out = "Nuuuuu exista ore programate pt grupa selectata!\n";
			return out;
		}
	}
	return out;
}

std::string BazaDateOrar::fisaPO()
{
	if (SQL_SUCCESS != SQLAllocHandle(SQL_HANDLE_STMT, sqlConnHandle, &sqlStmtHandle))
	{
		std::cout << "Nuuuuu i bine";
		return "ERROR\n";
	}

	std::string out;

	std::string query = "SELECT * FROM Orar WHERE tip_activitate = 'PO' AND username ='" +this->username +"'";
	if (SQL_SUCCESS != SQLExecDirect(sqlStmtHandle, (SQLCHAR*)(query.c_str()), SQL_NTS)) {
		std::cout << query;
		std::cout << "Error querying SQL Server";
		std::cout << "\n";
		return "Error querying SQL Server";
	}
	else {

		while (SQLFetch(sqlStmtHandle) == SQL_SUCCESS)
		{
			extrasDB ex;
			SQLGetData(sqlStmtHandle, 1, SQL_C_DEFAULT, ex.profesor, sizeof(ex.profesor), NULL);
			SQLGetData(sqlStmtHandle, 2, SQL_C_DEFAULT, ex.grupa, sizeof(ex.grupa), NULL);
			SQLGetData(sqlStmtHandle, 3, SQL_C_DEFAULT, &ex.modul, sizeof(ex.modul), NULL);
			SQLGetData(sqlStmtHandle, 4, SQL_C_DEFAULT, &ex.zi, sizeof(ex.zi), NULL);
			SQLGetData(sqlStmtHandle, 5, SQL_C_DEFAULT, &ex.luna, sizeof(ex.luna), NULL);
			SQLGetData(sqlStmtHandle, 6, SQL_C_DEFAULT, ex.tip_modul, sizeof(ex.tip_modul), NULL);
			SQLGetData(sqlStmtHandle, 7, SQL_C_DEFAULT, ex.tip_activitate, sizeof(ex.tip_activitate), NULL);
			//SQLGetData(sqlStmtHandle, 3, SQL_C_DEFAULT, ex.profesor, sizeof(ex.profesor), NULL);
			this->DateExtraseQuery.push_back(ex);
			out += ex.strigifyFisa();
		}
		if ((this->DateExtraseQuery).size() == 0) ///crapa fara asta in cazul in care nu avem user cu username ul introdus
		{
			out = "Nuuuuu exista ore la plata cu ora!\n";
			return out;
		}
	}
	return out;
}

std::string BazaDateOrar::extrasDB::strigifyFisa()
{
	std::string out;
	out = extrasDB::profesor + std::string(" ") + extrasDB::grupa + std::string(" ") + std::to_string(extrasDB::modul) + std::string(" ") + std::to_string(extrasDB::zi) + std::string(" ") + std::to_string(extrasDB::luna) + std::string(" ") + extrasDB::tip_modul + std::string(" ") + extrasDB::tip_activitate + "\n";
	return out;
}

std::string BazaDateOrar::extrasDB::stringifyOrarGrupa()
{
	return std::string();
}

std::string BazaDateOrar::adaugareProiect()
{
	std::string query;
	std::string out;

	if (SQL_SUCCESS != SQLAllocHandle(SQL_HANDLE_STMT, sqlConnHandle, &sqlStmtHandle))
	{
		std::cout << "Nu i bine";
		return "ERROR\n";
	}


	query = "SELECT * FROM Orar WHERE numeProf = '" + this->profesor + "' AND luna = '" + std::to_string(this->luna) + "' AND zi = '" + std::to_string(this->zi) + "' AND modul = '" + std::to_string(this->modul) + "'";
	if (SQL_SUCCESS != SQLExecDirect(sqlStmtHandle, (SQLCHAR*)(query.c_str()), SQL_NTS)) {
		std::cout << query;
		std::cout << "Error querying SQL Server";
		std::cout << "\n";
		return "Error querying SQL Server";
	}
	else {
		this->DateExtraseQuery.clear();

		while (SQLFetch(sqlStmtHandle) == SQL_SUCCESS)
		{
			extrasDB ex;
			SQLGetData(sqlStmtHandle, 1, SQL_C_DEFAULT, ex.profesor, sizeof(ex.profesor), NULL);
			SQLGetData(sqlStmtHandle, 2, SQL_C_DEFAULT, ex.grupa, sizeof(ex.grupa), NULL);
			//SQLGetData(sqlStmtHandle, 3, SQL_C_DEFAULT, ex.profesor, sizeof(ex.profesor), NULL);
			this->DateExtraseQuery.push_back(ex);
		}
		if ((this->DateExtraseQuery).size() > 0)
		{
			out = "Profesorul nuuu este disponibil, nu se poate programa un modul atunci!!\n";
			return out;
		}
	}
	//verifica daca profu e liber! altfel iar nu putem insera



	if (SQL_SUCCESS != SQLAllocHandle(SQL_HANDLE_STMT, sqlConnHandle, &sqlStmtHandle))
	{
		std::cout << "Nu i bine";
		return "ERROR\n";
	}

	query = "INSERT INTO Orar (username, numeProf, grupa, modul, zi, luna, tip_modul, tip_activitate) VALUES ('" + this->username + "' , '" + this->profesor + "' , '" + this->grupa + "' , '" + std::to_string(this->modul) + "' , '" + std::to_string(this->zi) + "' , '" + std::to_string(this->luna) + "' , '" + this->tip_modul + "' , '" + this->tip_activitate + "')";
	if (SQL_SUCCESS != SQLExecDirect(sqlStmtHandle, (SQLCHAR*)(query.c_str()), SQL_NTS)) {
		std::cout << query;
		std::cout << "Error querying SQL Server";
		std::cout << "\n";
		return "Error querying SQL Server";
	}

	return "Modul de proiect adaugat cu succes!\n";
}

std::string BazaDateOrar::orarProfesor()
{
	

		if (SQL_SUCCESS != SQLAllocHandle(SQL_HANDLE_STMT, sqlConnHandle, &sqlStmtHandle))
		{
			std::cout << "Nu i bine";
			return "ERROR\n";
		}

		std::string out;
		//VERIFICARE USER
		std::string query = "SELECT * FROM Orar WHERE numeProf = '" + this->profesor + "'";
		if (SQL_SUCCESS != SQLExecDirect(sqlStmtHandle, (SQLCHAR*)(query.c_str()), SQL_NTS)) {
			std::cout << query;
			std::cout << "Error querying SQL Server";
			std::cout << "\n";
			return "Error querying SQL Server";
		}
		else {

			this->DateExtraseQuery.clear();
			while (SQLFetch(sqlStmtHandle) == SQL_SUCCESS)
			{
				extrasDB ex;
				SQLGetData(sqlStmtHandle, 1, SQL_C_DEFAULT, ex.profesor, sizeof(ex.profesor), NULL);
				SQLGetData(sqlStmtHandle, 2, SQL_C_DEFAULT, ex.grupa, sizeof(ex.grupa), NULL);
				SQLGetData(sqlStmtHandle, 3, SQL_C_DEFAULT, &ex.modul, sizeof(ex.modul), NULL);
				SQLGetData(sqlStmtHandle, 4, SQL_C_DEFAULT, &ex.zi, sizeof(ex.zi), NULL);
				SQLGetData(sqlStmtHandle, 5, SQL_C_DEFAULT, &ex.luna, sizeof(ex.luna), NULL);
				SQLGetData(sqlStmtHandle, 6, SQL_C_DEFAULT, ex.tip_modul, sizeof(ex.tip_modul), NULL);
				SQLGetData(sqlStmtHandle, 7, SQL_C_DEFAULT, ex.tip_activitate, sizeof(ex.tip_activitate), NULL);
				//SQLGetData(sqlStmtHandle, 3, SQL_C_DEFAULT, ex.profesor, sizeof(ex.profesor), NULL);
				this->DateExtraseQuery.push_back(ex);
				out += ex.strigifyFisa();
			}
			if ((this->DateExtraseQuery).size() == 0) ///crapa fara asta in cazul in care nu avem user cu username ul introdus
			{
				out = "Nuuuuu nuuuu exista ore programate pt profesorul selectata!\n";
				return out;
			}
		}
		return out;
	
}

std::string BazaDateOrar::fisaActivitate()
{
	if (SQL_SUCCESS != SQLAllocHandle(SQL_HANDLE_STMT, sqlConnHandle, &sqlStmtHandle))
	{
		std::cout << "Nu i bine";
		return "ERROR\n";
	}

	std::string out;

	std::string query = "SELECT * FROM Orar WHERE (tip_activitate = 'PO' OR tip_activitate = 'PROIECT') AND username ='" + this->username + "'";
	if (SQL_SUCCESS != SQLExecDirect(sqlStmtHandle, (SQLCHAR*)(query.c_str()), SQL_NTS)) {
		std::cout << query;
		std::cout << "Error querying SQL Server";
		std::cout << "\n";
		return "Error querying SQL Server";
	}
	else {

		while (SQLFetch(sqlStmtHandle) == SQL_SUCCESS)
		{
			extrasDB ex;
			SQLGetData(sqlStmtHandle, 1, SQL_C_DEFAULT, ex.profesor, sizeof(ex.profesor), NULL);
			SQLGetData(sqlStmtHandle, 2, SQL_C_DEFAULT, ex.grupa, sizeof(ex.grupa), NULL);
			SQLGetData(sqlStmtHandle, 3, SQL_C_DEFAULT, &ex.modul, sizeof(ex.modul), NULL);
			SQLGetData(sqlStmtHandle, 4, SQL_C_DEFAULT, &ex.zi, sizeof(ex.zi), NULL);
			SQLGetData(sqlStmtHandle, 5, SQL_C_DEFAULT, &ex.luna, sizeof(ex.luna), NULL);
			SQLGetData(sqlStmtHandle, 6, SQL_C_DEFAULT, ex.tip_modul, sizeof(ex.tip_modul), NULL);
			SQLGetData(sqlStmtHandle, 7, SQL_C_DEFAULT, ex.tip_activitate, sizeof(ex.tip_activitate), NULL);
			//SQLGetData(sqlStmtHandle, 3, SQL_C_DEFAULT, ex.profesor, sizeof(ex.profesor), NULL);
			this->DateExtraseQuery.push_back(ex);
			out += ex.strigifyFisa();
		}
		if ((this->DateExtraseQuery).size() == 0) ///crapa fara asta in cazul in care nu avem user cu username ul introdus
		{
			out = "Nu nuuuu exista ore la plata cu ora!\n";
			return out;
		}
	}
	return out;
}


