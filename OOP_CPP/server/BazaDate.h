#pragma once
#include "IBazaDate.h"
#include <iostream>
#include <windows.h>
#include <sqltypes.h>
#include <sql.h>
#include <sqlext.h>
#define SQL_RESULT_LEN 240
#define SQL_RETURN_CODE_LEN 1000

class BazaDate :
    public IBazaDate
{
protected:
    //MYSQL* pointer spre baza de date
    std::string dateExtrase;
    std::string username;
    int watdoink = 0;
    SQLHANDLE sqlConnHandle;
    SQLHANDLE sqlStmtHandle;
    SQLHANDLE sqlEnvHandle;
    SQLWCHAR retconstring[SQL_RETURN_CODE_LEN];
public:
    BazaDate();
    virtual~BazaDate();
    void connect()override;
    void disconnect() override;
};

