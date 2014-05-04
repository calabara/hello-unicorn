#ifndef DBASE_CONNECTOR_H
#define DBASE_CONNECTOR_H

#include <QtSql/QtSql>
#include <QtCore/QString>

class DBaseConnector {
public:
    enum Status {
        StatusUninitialized,
        StatusSuccess,
        StatusFail
    };

private:
    static DBaseConnector *inst;
    const QString fileDB = "data_base.db";
    const QString dirDB = ".unicorn";

    Status status;

    QSqlDatabase mDb;

    bool createDataBase();
    bool openDataBase();

    QString pathDir();
    QString pathFile();
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
