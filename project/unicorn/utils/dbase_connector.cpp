#include "dbase_connector.h"

#include <iostream>

DBaseConnector* DBaseConnector::inst = 0; // не знаю, как тут добавить опцию -std=c++11

DBaseConnector* DBaseConnector::Instance(){
    if( inst == 0 ){
        inst = new DBaseConnector();
    }

    return inst;
}

void DBaseConnector::DestroyInstance(){
    if( inst != 0 ){
        delete inst;
        inst = 0;
    }
}

DBaseConnector::Status DBaseConnector::getStatus(){
    return status;
}


void DBaseConnector::initConnection(){

    mDb = QSqlDatabase::addDatabase("QSQLITE");

    mDb.setDatabaseName("data_base/data_base.db");
    mDb.open();

    if( !mDb.isOpen() ){
        status = StatusFail;
        return;
    }

    status = StatusSuccess;
}
