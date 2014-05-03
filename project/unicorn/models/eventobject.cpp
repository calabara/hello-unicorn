#include "eventobject.h"

#include <QtSql/QSqlQuery>
#include <QtCore/QVariant>
#include <QtSql/QSqlError>
#include <QtCore/QDebug>

#include "utils/dbutils.h"

EventObject::EventObject(QObject *parent) :
    QObject(parent)
{
}


bool EventObject::save() {
    QSqlQuery q;
    if (idEvent() == -1) {
        q.prepare("insert into event (title,date,place,deal_id,type_id) values (?,?,?,?,?)");
    } else {
        q.prepare(QString("update event set title = ?, date = ?, place = ?, \
                    deal_id = ?, type_id = ? where id = %1").arg(idEvent()));
    }

    QString date = dateEvent().toString(DbUtils::dateFormat());
    q.addBindValue(title());
    q.addBindValue(date);
    q.addBindValue(place());
    q.addBindValue(deal_id());
    q.addBindValue(type_id());

    q.exec();

    if (q.lastError().isValid()) {
        qDebug() << q.lastError();
        return false;
    }

    if (idEvent() == -1) {
        q.exec("SELECT last_insert_rowid()");
        q.next();
        setIdEvent(q.value(0).toInt());
    }

    return true;
}

void EventObject::empty() {
    setTitle("");
    setType_id(1);

    QDateTime date = QDateTime::currentDateTime();
    QString dateStr = date.toString(DbUtils::dateFormat());
    setDateEvent(QDateTime::fromString(dateStr, DbUtils::dateFormat()));

    setDateEvent(QDateTime::currentDateTime());

    setIdEvent(-1);
    setPlace("");
    setDeal_id(1);
}
