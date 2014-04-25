#ifndef DBASE_CONNECTOR_H
#define DBASE_CONNECTOR_H

#include <QtSql>

class DBaseConnector {
public:
    enum Status {
        StatusUninitialized,
        StatusSuccess,
        StatusFail
    };

private:
    static DBaseConnector *inst;

    Status status;

    QSqlDatabase db;

private:
    DBaseConnector(){
        status = StatusUninitialized;
    }

public:

    static DBaseConnector* Instance();
    static void DestroyInstance();

    Status getStatus();

    void initConnection();

    void closeConnection(){
        if( db.isOpen() ) db.close();
    }

    ~DBaseConnector(){
        closeConnection();
    }

};

#endif
