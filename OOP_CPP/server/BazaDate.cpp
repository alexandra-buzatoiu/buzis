#include "BazaDate.h"

BazaDate::BazaDate()
{
	sqlConnHandle = NULL;
	sqlStmtHandle = NULL;
}

BazaDate::~BazaDate()
{
    disconnect();
}

void BazaDate::connect()
{
    if (SQL_SUCCESS != SQLAllocHandle(SQL_HANDLE_ENV, SQL_NULL_HANDLE, &sqlEnvHandle))
        return;
    if (SQL_SUCCESS != SQLSetEnvAttr(sqlEnvHandle, SQL_ATTR_ODBC_VERSION, (SQLPOINTER)SQL_OV_ODBC3, 0))
        return;
    if (SQL_SUCCESS != SQLAllocHandle(SQL_HANDLE_DBC, sqlEnvHandle, &sqlConnHandle))
        return;
    //output
    std::cout << "Attempting connection to SQL Server...";
    std::cout << "\n";
    //connect to SQL Server  
    //I am using a trusted connection and port 14808
    //it does not matter if you are using default or named instance
    //just make sure you define the server name and the port
    //You have the option to use a username/password instead of a trusted     connection
    //but is more secure to use a trusted connection
    switch (SQLDriverConnectW(sqlConnHandle,
        NULL,
        //(SQLWCHAR*)L"DRIVER={SQL Server};SERVER=ServerAddress,     1433;DATABASE=DataBaseName;UID=DataBaseUserName;PWD=PassWord;",
        (SQLWCHAR*)L"DRIVER={SQL Server};SERVER=localhost, 1434;DATABASE=POO;Trusted=true;",
        SQL_NTS,
        retconstring,
        1024,
        NULL,
        SQL_DRIVER_NOPROMPT)) {
    case SQL_SUCCESS:
        std::cout << "Successfully connected to SQL Server";
        std::cout << "\n";
        break;
    case SQL_SUCCESS_WITH_INFO:
        std::cout << "Successfully connected to SQL Server";
        std::cout << "\n";
        break;
    case SQL_INVALID_HANDLE:
        std::cout << "Could not connect to SQL Server";
        std::cout << "\n";
        return;
    case SQL_ERROR:
        std::cout << "Could not connect to SQL Server";
        std::cout << "\n";
        return;
    default:
        break;
    }
}

void BazaDate::disconnect()
{
    SQLFreeHandle(SQL_HANDLE_STMT, sqlStmtHandle);
    SQLDisconnect(sqlConnHandle);
    SQLFreeHandle(SQL_HANDLE_DBC, sqlConnHandle);
    SQLFreeHandle(SQL_HANDLE_ENV, sqlEnvHandle);
    std::cout << "Deconenctat de la DB\n";
}
