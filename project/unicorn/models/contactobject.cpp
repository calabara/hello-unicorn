#include "contactobject.h"

#include <QtSql/QSqlQuery>
#include <QtSql/QSqlError>
#include <QtCore/QVariant>
#include <QtCore/QDebug>

ContactObject::ContactObject(QObject *parent) :
    QObject(parent)
{
}

bool ContactObject::save() {
    QSqlQuery q;
    if (id() == -1) {
        // INSERT INTO "main"."contact" ("name","surname","additional_info","phone_number","type_id") 
        // VALUES (?1,?2,?3,?4,?5)
        q.prepare("insert into contact (name, surname, additional_info, phone_number, type_id) \
                values (?,?,?,?,?)");
    } else {
        // UPDATE "main"."contact" SET "name" = ?1, "surname" = ?2, 
        // "additional_info" = ?3, "phone_number" = ?4, "type_id" = ?5 WHERE  "id" = 1
        q.prepare(QString("update contact set name = ?, surname = ?, \
            additional_info = ?, phone_number = ?, type_id = ? where id = %1").arg(id()));
    }

    q.addBindValue(name());
    q.addBindValue(surname());
    q.addBindValue(additional_info());
    q.addBindValue(phone_nunmber());
    q.addBindValue(type_id());

    q.exec();
    if (q.lastError().isValid()) {
        qDebug() << q.lastError();
        return false;
    }

    return true;
}
