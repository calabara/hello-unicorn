#ifndef DBASE_CONNECTOR_H
#define DBASE_CONNECTOR_H

#include <QtSql/QtSql>

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

    QSqlDatabase mDb;

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
        if( mDb.isOpen() ) mDb.close();
    }

    ~DBaseConnector(){
        closeConnection();
    }

    QSqlDatabase & db() {
        return mDb;
    }

};

#endif
