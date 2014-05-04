#include "dbase_connector.h"

#include <QtCore/QFile>
#include <QtCore/QDir>
#include <QtCore/QTextStream>
#include <assert.h>

DBaseConnector * DBaseConnector::inst = nullptr;

DBaseConnector* DBaseConnector::Instance(){
    if( inst == nullptr ){
        inst = new DBaseConnector();
    }

    return inst;
}

void DBaseConnector::DestroyInstance(){
    delete inst;
    inst = nullptr;
}

DBaseConnector::Status DBaseConnector::getStatus(){
    return status;
}

void DBaseConnector::initConnection(){
    QFile dbFile(pathFile());
    bool success = false;
    if (!dbFile.exists()) {
        success = createDataBase();
    } else {
        success = openDataBase();
    }

    if( !success ){
        status = StatusFail;
        return;
    }

    status = StatusSuccess;
}

bool DBaseConnector::createDataBase() {
    QDir dir(pathDir());
    qDebug() << "CreateBase in:" << pathFile();

    if (!dir.exists()) {
        assert(dir.mkpath(pathDir()));
    }

    QFile file(":/data_base/db.sql");

    assert(file.open(QFile::ReadOnly));

    QTextStream in(&file);
    auto querys = in.readAll().split(";");
    qDebug() << querys;

    mDb = QSqlDatabase::addDatabase("QSQLITE");
    mDb.setDatabaseName(pathFile());
    mDb.open();

    QSqlQuery q;
    foreach (QString query, querys) {
        qDebug() << "run query: " << query;
        if (query.trimmed().isEmpty())
            continue;
        q.exec(query);
        if (q.lastError().isValid()) {
            QFile::remove(pathFile());
            qDebug() << query << q.lastError();
            assert(!q.lastError().isValid());
        }
    }

    return true;
}

bool DBaseConnector::openDataBase() {
    mDb = QSqlDatabase::addDatabase("QSQLITE");
    mDb.setDatabaseName(pathFile());
    mDb.open();
    return mDb.isOpen();
}

QString DBaseConnector::pathDir() {
    return QDir::homePath() + "/" + dirDB;
}

QString DBaseConnector::pathFile() {
    return pathDir() + "/" + fileDB;
}
