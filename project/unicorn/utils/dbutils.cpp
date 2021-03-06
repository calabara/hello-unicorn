#include "dbutils.h"

#include <QtSql/QtSql>
#include <QtSql/QSqlQuery>

#include "models/roleobject.h"
#include "models/dealstateobject.h"

QString DbUtils::dateFormat() {
    return "dd.MM.yyyy hh:mm";
}

QString DbUtils::statusAsString(int id_state) const {
    QSqlQuery q;
    q.exec(QString("select title from deal_state where id = %1").arg(id_state));
    q.next();
    return q.value(0).toString();
} 


QString DbUtils::typeAsString(int id_type) const {
    QSqlQuery q;
    q.exec(QString("select title from contact_type where id = %1").arg(id_type));
    q.next();
    return q.value(0).toString();
}

void DbUtils::readContact(int id_contact, ContactObject * contact) const {
    QSqlQuery q;
    q.exec(QString("select * from contact where id = %1 ").arg(id_contact));
    q.next();

    contact->setId_contact(id_contact);
    contact->setSurname(q.value("surname").toString());
    contact->setName(q.value("name").toString());
    contact->setPhone_number(q.value("phone_number").toString());
    contact->setAdditional_info(q.value("additional_info").toString());
    contact->setType_id(q.value("type_id").toInt());

    if (q.lastError().isValid()) {
        qDebug() << "readContact " << q.lastError();
    }
}

void DbUtils::readEvent(int id_event, EventObject * event) const {
    QSqlQuery q;
    q.exec(QString("select * from event where id = %1").arg(id_event));
    q.next();

    if (q.lastError().isValid()) {
        qDebug() << "readEvent: " << q.lastError();
        return;
    }

    event->setIdEvent(q.value("id").toInt());
    event->setTitle(q.value("title").toString());

    event->setDateEvent(QDateTime::fromString(q.value("date").toString(), DbUtils::dateFormat()));
    event->setType_id(q.value("type_id").toInt());
    event->setPlace(q.value("place").toString());
    event->setDeal_id(q.value("deal_id").toInt());
}

QString DbUtils::eventTypeAsString(int id_type) const {
    QSqlQuery q;
    q.prepare("select * from event_type where id = ?");
    q.addBindValue(id_type);
    q.exec();
    q.next();

    if (q.lastError().isValid()){ 
        qDebug() << "EventType: " << q.lastError();
        return "";
    }

    return q.value("title").toString();
}

QString DbUtils::dealAdress(int id_deal) const {
    QSqlQuery q;
    q.prepare("select * from deal where id = ?");
    q.addBindValue(id_deal);
    q.exec();
    q.next();

    if (q.lastError().isValid()){ 
        qDebug() << "dealAdress: " << q.lastError();
        return "";
    }

    return q.value("flatAdress").toString();
}

bool DbUtils::execQuery(const QString & query) {
    QSqlQuery q;
    q.exec(query);
    qDebug() << query;
    return !q.lastError().isValid();
}

QList<QObject*> DbUtils::getRoles() {
    QList<QObject*> list;
    QSqlQuery q("select * from role");
    q.exec();
    while (q.next()) {
        auto role = new RoleObject();
        role->setTitle(q.value("title").toString());
        role->setId_role(q.value("id").toInt());
        list << role;
    }

    return list;
}

QList<QObject*> DbUtils::getAllContactsAsList() {
    QList<QObject*> list;
    QSqlQuery q("select * from contact order by surname");
    q.exec();

    while (q.next()) {
        auto contact = new ContactObject();
        contact->setId_contact(q.value("id").toInt());
        contact->setSurname(q.value("surname").toString());
        contact->setName(q.value("name").toString());
        contact->setPhone_number(q.value("phone_number").toString());
        contact->setAdditional_info(q.value("additional_info").toString());
        contact->setType_id(q.value("type_id").toInt());
        list << contact;
    }
    return list;
}

bool DbUtils::deleteActorFromEvent(int id_event, int id_contact) {
    QSqlQuery q;
    q.exec("delete from event_contact_mult where id_event = ? and id_contact = ?");
    q.addBindValue(id_event);
    q.addBindValue(id_contact);
    return q.exec();
}

bool DbUtils::deleteActorFromDeal(int id_deal, int id_contact) {
    QSqlQuery q;
    q.exec("delete from deal_contact_mult where id_deal = ? and id_contact = ?");
    q.addBindValue(id_deal);
    q.addBindValue(id_contact);
    return q.exec();
}

QList<QObject*> DbUtils::getAllStatesDealAsList() {
    QList<QObject*> list;
    QSqlQuery q("select * from deal_state");
    q.exec();

    while (q.next()) {
        auto state = new DealStateObject();
        state->setTitle(q.value("title").toString());
        state->setIdState(q.value("id").toInt());
        list << state;
    }

    return list;
}

QList<QObject*> DbUtils::getAllDealsAsList() {
    QList<QObject*> list;
    QSqlQuery q("select * from deal");
    q.exec();

    while (q.next()) {
        auto curDeal = new DealObject();
        curDeal->setFlatAdress(q.value("flatAdress").toString());
        curDeal->setMax_price(q.value("max_price").toInt());
        curDeal->setMin_price(q.value("min_price").toInt());
        QDateTime date = QDateTime::fromString(q.value("dateTrade").toString(), DbUtils::dateFormat());
        curDeal->setDateTrade(date);

        curDeal->setPrice(q.value("price").toInt());
        curDeal->setId_deal(q.value("id").toInt());
        curDeal->setState_key(q.value("state_key").toInt());
        list << curDeal;
    }

    return list;
}
