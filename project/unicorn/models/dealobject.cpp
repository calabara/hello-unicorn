#include "dealobject.h"

#include <QtCore/QVariant>
#include <QtCore/QDebug>
#include <QtSql/QSql>
#include <QtSql/QSqlError>
#include <QtSql/QSqlQuery>


void DealObject::save() const {
    const QString queryStr = "update deal set flatAdress = ?, min_price = ?, \
        max_price = ?, dateTrade = ?, price = ? where id_deal = ? ";
    QSqlQuery q;
    q.prepare(queryStr);
    q.addBindValue(flatAdress());
    q.addBindValue(min_price());
    q.addBindValue(max_price());
    q.addBindValue(dateTrade());
    q.addBindValue(price());

    q.exec();

    if (q.lastError().isValid())
        qDebug() << q.lastError();
}
