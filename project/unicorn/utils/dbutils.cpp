#include "dbutils.h"

#include <QtSql/QtSql>
#include <QtSql/QSqlQuery>

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
        qDebug() << q.lastError();
    }
}
