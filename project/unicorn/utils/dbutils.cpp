#include "dbutils.h"

#include <QtSql/QtSql>
#include <QtSql/QSqlQuery>

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
    return !q.lastError().isValid();
}
