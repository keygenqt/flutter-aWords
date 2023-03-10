#include "hello.h"

#include <stdio.h>
#include <string.h>
#include <sql.h>
#include <sqlext.h>
#include <string.h>

SQLHENV henv = NULL;
SQLHDBC hdbc = NULL;

int ODBCConnectDB(SQLCHAR *ds, SQLCHAR *user, SQLCHAR *pw)
{
    SQLRETURN rc;

    hdbc = NULL;
    henv = NULL;

    // Allocate environment handle
    rc = SQLAllocHandle(SQL_HANDLE_ENV, SQL_NULL_HANDLE, &henv);
    if (rc == SQL_SUCCESS || rc == SQL_SUCCESS_WITH_INFO)
    {

        //  Set the ODBC version environment attribute
        rc = SQLSetEnvAttr(henv, SQL_ATTR_ODBC_VERSION, (void *)SQL_OV_ODBC3, 0);

        if (rc == SQL_SUCCESS || rc == SQL_SUCCESS_WITH_INFO)
        {

            // Allocate connection handle
            rc = SQLAllocHandle(SQL_HANDLE_DBC, henv, &hdbc);

            if (rc == SQL_SUCCESS || rc == SQL_SUCCESS_WITH_INFO)
            {

                // Set login timeout to 5 seconds.
                SQLSetConnectAttr(hdbc, SQL_LOGIN_TIMEOUT, (SQLPOINTER)5, 0);

                // Connect to data source
                rc = SQLConnect(hdbc, ds, SQL_NTS, user, SQL_NTS, pw, SQL_NTS);

                // printf("%d", rc);

                if (rc == SQL_SUCCESS || rc == SQL_SUCCESS_WITH_INFO)
                {
                    return 1;
                }
                SQLDisconnect(hdbc);
            }
            SQLFreeHandle(SQL_HANDLE_DBC, hdbc);
        }
    }
    SQLFreeHandle(SQL_HANDLE_ENV, henv);

    hdbc = NULL;
    henv = NULL;

    return 0;
}

int ODBCDisconnectDB()
{
    if (hdbc)
    {
        SQLDisconnect(hdbc);
        SQLFreeHandle(SQL_HANDLE_DBC, hdbc);
    }
    if (henv)
        SQLFreeHandle(SQL_HANDLE_ENV, henv);
    hdbc = NULL;
    henv = NULL;
    return 1;
}

int db_exec_stmt(char *stmt_str)
{
    SQLHSTMT hstmt;
    SQLRETURN rc;

    if (henv == NULL || hdbc == NULL)
        return 0;

    /* Allocate statement handle */
    rc = SQLAllocHandle(SQL_HANDLE_STMT, hdbc, &hstmt);
    if (!(rc == SQL_SUCCESS || rc == SQL_SUCCESS_WITH_INFO))
        return 0;

    rc = SQLExecDirect(hstmt, stmt_str, SQL_NTS);
    SQLFreeHandle(SQL_HANDLE_STMT, hstmt);
    if (rc == SQL_SUCCESS || rc == SQL_SUCCESS_WITH_INFO)
        return 1;
    if (rc == SQL_NO_DATA)
        return 1;

    printf("sqlerr: %d\n", rc);
    return 0;
}

char *db_fetch()
{
    SQLRETURN r;
    SQLHSTMT hstmt;
    SQLCHAR sql[256];
    SQLLEN n;
    SQLINTEGER id;
    SQLCHAR message[250];
    SQLREAL age;
    SQL_DATE_STRUCT birthday;
    SQL_TIMESTAMP_STRUCT create_timestamp;

    SQLINTEGER id1 = 1;

    if (hdbc == NULL || henv == NULL)
        return 0;

    r = SQLAllocHandle(SQL_HANDLE_STMT, hdbc, &hstmt);
    if (!(r == SQL_SUCCESS || r == SQL_SUCCESS_WITH_INFO))
        return 0;

    strcpy(sql, "SELECT * FROM helloworld.my_first_table");
    r = SQLExecDirect(hstmt, sql, SQL_NTS);
    if (r != SQL_SUCCESS)
    {
        printf("cannot access [%s]\n", sql);
        SQLFreeHandle(SQL_HANDLE_STMT, hstmt);
        return 0;
    }

    char * result = "";

    while (1)
    {
        r = SQLFetch(hstmt);
        if (r == SQL_SUCCESS || r == SQL_SUCCESS_WITH_INFO)
        {
            r = SQLGetData(hstmt, 1, SQL_C_ULONG, &id, 0, &n);
            r = SQLGetData(hstmt, 2, SQL_C_CHAR, message, 250, &n);

            char * str;
            asprintf(&str, "%d, %s\n", id, message);

            size_t sizeA = strlen(result);
            size_t sizeB = strlen(str);
            size_t size = sizeof(char) * (sizeA + sizeB + 1);
                                                            
            char* c = malloc(size);                          
            memcpy(c, result, sizeA);
            memcpy(c + sizeA, str, sizeB);
            c[sizeA + sizeB] = '\0';       
            result = c;   
        }
        else if (SQL_NO_DATA == r)
            break;
        else
        {
            printf("%s\n", "fail to fetch data");
            break;
        }
    }
    SQLFreeHandle(SQL_HANDLE_STMT, hstmt);

    return result;
}

char *select()
{
    ODBCConnectDB("ClickHouse_ANSI", "default", "334400ddgg");

    return db_fetch();
}

char *hello_world()
{
    return "Hello World";
}