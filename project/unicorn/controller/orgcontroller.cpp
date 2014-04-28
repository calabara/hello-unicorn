#include "orgcontroller.h"

OrgController::OrgController(QQmlContext * context) :
    mContext(context) {
    DBaseConnector::Instance()->initConnection();
    model = new OrgSqlModel();
    mContext->setContextProperty("dealModel", model);
}

OrgController::~OrgController() {
    DBaseConnector::Instance()->closeConnection();
    delete model;
}

bool OrgController::getAllDeals() {
    model->setQuery("select * from deal");
    if (model->lastError().isValid()) {
        return false;
    }
    return true;
}


// INSERT INTO "main"."deal" ("min_price","price","max_price","state_key","flatAdress","dateTrade") VALUES (?1,?2,?3,?4,?5,?6)
bool OrgController::addDeal(int min_price, int price, int max_price, int state_key, QString flatAdress, QDate dateTrade) const {
    static const QString qstr = "INSERT INTO deal (min_price,price,max_price,state_key,flatAdress,dateTrade) VALUES (?,?,?,?,?,?)";
    QSqlQuery q;

    q.prepare(qstr);
    q.addBindValue(min_price);
    q.addBindValue(price);
    q.addBindValue(max_price);
    q.addBindValue(state_key);
    q.addBindValue(flatAdress);
    q.addBindValue(dateTrade);
    
    bool saccess = q.exec();
    if (!saccess) {
        qDebug() << q.lastError();
    }

    return saccess;
}
