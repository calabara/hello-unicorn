#include "orgcontroller.h"

#include "utils/dbutils.h"

OrgController::OrgController(QQmlContext * context) :
    mContext(context){
    DBaseConnector::Instance()->initConnection();

    dealModel = new OrgSqlModel();
    mContext->setContextProperty("dealModel", dealModel);

    dealMembersModel = new OrgSqlModel();
    mContext->setContextProperty("dealMembers", dealMembersModel);

    rolesModel = new OrgSqlModel();
    mContext->setContextProperty("rolesModel", rolesModel);

    curDeal = new DealObject();
    mContext->setContextProperty("curDeal", curDeal);

    contactModel = new OrgSqlModel();
    mContext->setContextProperty("contactModel", contactModel);
    
    eventsModel = new OrgSqlModel();
    mContext->setContextProperty("eventsModel", eventsModel);
    
    // oneDealModel = new OrgSqlModel();
    //
    // mContext->setContextProperty("oneDeal", oneDealModel);
}

OrgController::~OrgController() {
    DBaseConnector::Instance()->closeConnection();

    delete dealModel;
    delete rolesModel;
    delete dealMembersModel;
    delete contactModel;
    delete curDeal;
    delete eventsModel;
}

bool OrgController::getAllDeals() {
    // TODO: status Title
    dealModel->setQuery("select * from deal");
    if (dealModel->lastError().isValid()) {
        return false;
    }
    return true;
}

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

    bool success = q.exec();
    if (!success) {
        qDebug() << q.lastError();
    }

    return success;
}

bool OrgController::getAllMembers(int id_deal) {
    const QString qstr = QString("select c.id, c.name, c.surname, c.additional_info, c.phone_number, r.title"
        " from deal_contact_mult dc, contact c, role r where dc.id_deal = %1 and dc.id_role = r.id").arg(id_deal);
    // QSqlQuery q;
    // q.prepare(qstr);
    // q.addBindValue(id_deal);
    dealMembersModel->setQuery(qstr);

    if (dealMembersModel->lastError().isValid()) {
        qDebug() << dealMembersModel->lastError();
        return false;
    }

    return true;
}

bool OrgController::addMemberToDeal(int id_deal, int id_contact, int id_role) const {
    static const QString qstr = "insert into contact_deal_mult (id_contact, id_role, id_deal) values(?,?,?)";
    QSqlQuery q;
    q.prepare(qstr);

    q.addBindValue(id_contact);
    q.addBindValue(id_role);
    q.addBindValue(id_deal);

    bool success = q.exec();
    if (!success) {
        qDebug() << q.lastError();
    }
    return success;
}

bool OrgController::getAllRoles() const {
    static const QString qstr = "select * from role";
    // QSqlQuery q;
    // q.prepare(qstr);
    // q.addBindValue(id_deal);
    rolesModel->setQuery(qstr);

    if (rolesModel->lastError().isValid()) {
        qDebug() << rolesModel->lastError();
        return false;
    }

    return true;
}

// TODO: rewrite this shit
void OrgController::getDeal(int id_deal) {
    (void)id_deal;
    QSqlQuery q;
    q.exec(QString("select * from deal where id = %1").arg(id_deal));
    if (q.lastError().isValid())
        return;
    q.next();

    curDeal->setFlatAdress(q.value("flatAdress").toString());
    curDeal->setMax_price(q.value("max_price").toInt());
    curDeal->setMin_price(q.value("min_price").toInt());
    QDateTime date = QDateTime::fromString(q.value("dateTrade").toString(), DbUtils::dateFormat());
    curDeal->setDateTrade(date);

    curDeal->setPrice(q.value("price").toInt());
    curDeal->setId_deal(id_deal);
    curDeal->setState_key(q.value("state_key").toInt());
}

bool OrgController::getAllContacts(int id_type) {
    contactModel->setQuery(QString("select * from contact where type_id = %1").arg(id_type));;
    return !contactModel->lastError().isValid();
}

bool OrgController::getAllEvents() {
    eventsModel->setQuery("select e.id, e.date, e.place, e.deal_id, et.title \
            from event e, event_type et where e.type_id = et.id");

    return !eventsModel->lastError().isValid();
}

bool OrgController::getEvents(int id_deal) {
    const QString patternQuery = "select e.id, e.title as eventTitle, e.date, e.place, e.deal_id, e.type_id, et.title etitle\
    from event e, event_type et where %1 e.type_id = et.id";
    if (id_deal != -1) {
        QString query = patternQuery.arg(QString("e.id = %1 and").arg(id_deal));
        eventsModel->setQuery(query);
    } else {
        QString query = patternQuery.arg("");
        eventsModel->setQuery(query);
    }
    return !eventsModel->lastError().isValid();
}

