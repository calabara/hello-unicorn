#include "dealobject.h"

#include <QtCore/QVariant>
#include <QtCore/QDebug>
#include <QtSql/QSql>
#include <QtSql/QSqlError>
#include <QtSql/QSqlQuery>

#include "utils/dbutils.h"


void DealObject::save() const {
    const QString queryStr = "update deal set flatAdress = ?, min_price = ?, \
        max_price = ?, dateTrade = ?, price = ?, state_key = ? where id = ? ";

    QString date = dateTrade().toString(DbUtils::dateFormat());
    QSqlQuery q;
    q.prepare(queryStr);
    q.addBindValue(flatAdress());
    q.addBindValue(min_price());
    q.addBindValue(max_price());
    q.addBindValue(date);
    q.addBindValue(price());
    q.addBindValue(state_key());
    q.addBindValue(id_deal());

    q.exec();

    if (q.lastError().isValid())
        qDebug() << q.lastError();
}
