#pragma once
#include<string>
class IOrdin;

class AdministrareServer
{
private:
	std::string bufferFromClient;
	std::string bufferTOClient;
	IOrdin* ordin;
	AdministrareServer() {};
	AdministrareServer(const AdministrareServer&) {};
	virtual ~AdministrareServer() {};
	static AdministrareServer* instance;
public:
	static AdministrareServer*getInstance();
	void setString(std::string primit);
	std::string get_string(std::string deTrimis);
	void emiteOrdin();
	void administrareBazaDate();


};

