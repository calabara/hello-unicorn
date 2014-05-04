#include "contactobject.h"

#include <QtSql/QSqlQuery>
#include <QtSql/QSqlError>
#include <QtSql/QSqlResult>
#include <QtCore/QVariant>
#include <QtCore/QDebug>

ContactObject::ContactObject(QObject *parent) :
    QObject(parent)
{
}

bool ContactObject::save() {
    QSqlQuery q;
    if (id_contact() == -1) {
        // INSERT INTO "main"."contact" ("name","surname","additional_info","phone_number","type_id") 
        // VALUES (?1,?2,?3,?4,?5)
        q.prepare("insert into contact (name, surname, additional_info, phone_number, type_id) \
                values (?,?,?,?,?)");
    } else {
        // UPDATE "main"."contact" SET "name" = ?1, "surname" = ?2, 
        // "additional_info" = ?3, "phone_number" = ?4, "type_id" = ?5 WHERE  "id" = 1
        q.prepare(QString("update contact set name = ?, surname = ?, \
            additional_info = ?, phone_number = ?, type_id = ? where id = %1").arg(id_contact()));
    }

    q.addBindValue(name());
    q.addBindValue(surname());
    q.addBindValue(additional_info());
    q.addBindValue(phone_number());
    q.addBindValue(type_id());

    q.exec();
    if (q.lastError().isValid()) {
        qDebug() << q.lastError();
        return false;
    }

    return true;
}

void ContactObject::empty() {
    this->setName("");
    this->setSurname("");
    this->setAdditional_info("");
    this->setPhone_number("");
    this->setType_id(1);
    this->setId_contact(-1);
}

bool ContactObject::isBeCanDelete() {
    QSqlQuery q;
    q.prepare("select * from event_contact_mult where id_contact = ?");
    q.addBindValue(id_contact());
    q.exec();

    int rowCount = 0;
    while (q.next()) {
        rowCount += 1;
    }

    if (rowCount > 0) {
        return false;
    }

    q.prepare("select * from deal_contact_mult where id_contact = ?");
    q.addBindValue(id_contact());
    q.exec();

    rowCount = 0;
    while (q.next()) {
        rowCount += 1;
    }

    if (rowCount > 0) {
        return false;
    }

    return true;
}

bool ContactObject::deleteContact() {
    QSqlQuery q;
    q.prepare("delete from contact where id = ?");
    q.addBindValue(id_contact());
    return q.exec();
}

