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
