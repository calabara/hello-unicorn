#include "dbutils.h"

#include <QtSql/QtSql>
#include <QtSql/QSqlQuery>

QString DbUtils::statusAsString(int id_state) {
    QSqlQuery q;
    qDebug() << id_state;
    q.exec(QString("select title from deal_state where id = %1").arg(id_state));
    q.next();
    return q.value(0).toString();
} 
