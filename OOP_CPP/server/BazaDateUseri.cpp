#include "BazaDateUseri.h"
#include"IOrdin.h"

BazaDateUseri* BazaDateUseri::instance = nullptr;

void BazaDateUseri::printStatus(std::string s)
{
	std::cout << s << std::endl;
}

BazaDateUseri::~BazaDateUseri()
{
}

std::string BazaDateUseri::verificareUser()
{
	if (SQL_SUCCESS != SQLAllocHandle(SQL_HANDLE_STMT, sqlConnHandle, &sqlStmtHandle))
	{
		std::cout << "Nu i bine";
		return "ERROR\n";
	}


	std::string out;
	//VERIFICARE USER
	std::string query = "SELECT username, password FROM Useri WHERE username = '" + this->username + "'";
	if (SQL_SUCCESS != SQLExecDirect(sqlStmtHandle, (SQLCHAR*)(query.c_str()), SQL_NTS)) {
		std::cout << query;
		std::cout << "Error querying SQL Server";
		std::cout << "\n";
		return "Error querying SQL Server";
	}
	else
	{
		

		while (SQLFetch(sqlStmtHandle) == SQL_SUCCESS)
		{
			extrasDB ex;
			SQLGetData(sqlStmtHandle, 1, SQL_C_DEFAULT, ex.username, sizeof(ex.username), NULL);
			SQLGetData(sqlStmtHandle, 2, SQL_C_DEFAULT, ex.password, sizeof(ex.password), NULL);
			//SQLGetData(sqlStmtHandle, 3, SQL_C_DEFAULT, ex.profesor, sizeof(ex.profesor), NULL);
			this->DateExtraseQuery.push_back(ex);
		}
		if ((this->DateExtraseQuery).size() == 0) ///crapa fara asta in cazul in care nu avem user cu username ul introdus
		{
			out = "Username sau parola incorecte nuuu se poate autentifica userul cu numele " + this->username + ".\n";
			return out;
		}
		if ((this->username == this->DateExtraseQuery[0].username) && (this->password == this->DateExtraseQuery[0].password))
			out = "Logare cu success a utilizatorului " + this->username + ".\n";
		else
			out = "Username sau parola incorecte, nuuu se poate autentifica userul cu numele " + this->username + ".\n";
	}
	return out;
}

std::string BazaDateUseri::extractProfi()
{
	if (SQL_SUCCESS != SQLAllocHandle(SQL_HANDLE_STMT, sqlConnHandle, &sqlStmtHandle))
	{
		std::cout << "Nu i bine";
		return "ERROR\n";
	}

	std::string aux;
	std::string out;
	int countt = 0;
	//VERIFICARE USER
	std::string query = "SELECT nume FROM Useri";
	if (SQL_SUCCESS != SQLExecDirect(sqlStmtHandle, (SQLCHAR*)(query.c_str()), SQL_NTS)) {
		std::cout << query;
		std::cout << "Error querying SQL Server";
		std::cout << "\n";
		return "Error querying SQL Server";
	}
	else
	{


		while (SQLFetch(sqlStmtHandle) == SQL_SUCCESS)
		{
			extrasDB ex;
			SQLGetData(sqlStmtHandle, 1, SQL_C_DEFAULT, ex.username, sizeof(ex.username), NULL);
			
			//SQLGetData(sqlStmtHandle, 3, SQL_C_DEFAULT, ex.profesor, sizeof(ex.profesor), NULL);
			this->DateExtraseQuery.push_back(ex);
			aux += "*";
			aux += ex.username;
			countt++;
			aux += "*";
		}
		if ((this->DateExtraseQuery).size() == 0) ///crapa fara asta in cazul in care nu avem user cu username ul introdus
		{
			out = "Nu sunt profesori de afisat!\n";
			return out;
		}
		std::cout << "Buna ziuna count este: " << countt << std::endl;
		out.erase();
		out += std::to_string(countt);
		out += aux;
		return out;
	}










	
}

void BazaDateUseri::setUser(std::string s)
{
	this->username = s;
}

void BazaDateUseri::setName(std::string s)
{
	//this->profesor = s;
}

void BazaDateUseri::setPassword(std::string s)
{
	this->password = s;
}

BazaDateUseri* BazaDateUseri::getInstanece()
{
	if (instance == nullptr)
		instance = new BazaDateUseri;
	return instance;
}

void BazaDateUseri::primesteOrdin(IOrdin* ordin)
{
	this->watdoink = ordin->getIndex();
	this->username = ordin->getUser();
	this->password = ordin->getPassword();
}

void BazaDateUseri::modifica()
{
	
}

void BazaDateUseri::extrage()
{
	//

	if (this->watdoink == 1)
		this->dateExtrase = this->verificareUser();
	else
		this->dateExtrase = this->extractProfi();
}

std::string BazaDateUseri::deTrimis()
{
	return this->dateExtrase;
}
