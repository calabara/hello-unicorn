#include "orgsqlmodel.h"

#include <QtSql/QSqlRecord>
#include <QtCore/QDebug>

OrgSqlModel::OrgSqlModel(QObject * parent) :
    QSqlQueryModel(parent)
{
}

QVariant OrgSqlModel::data(const QModelIndex & index, int role) const {
    QVariant value = QSqlQueryModel::data(index, role);
    if (role < Qt::UserRole)
    {
        value = QSqlQueryModel::data(index, role);
    }
    else
    {
        int columnIdx = role - Qt::UserRole - 1;
        QModelIndex modelIndex = this->index(index.row(), columnIdx);
        value = QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
    }
    return value;
}

QHash<int, QByteArray> OrgSqlModel::roleNames() const {
    QHash<int, QByteArray> r;
    int index = 1;
    for( int i = 0; i < rowCount(); i++) {
        for (int j = 0 ; j < record(i).count(); j++) {
            r[Qt::UserRole + index ] = record(i).fieldName(j).toUtf8();
            index += 1;
        }
        break;
    }
    return r;
}

