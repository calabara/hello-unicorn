#ifndef ORGSQLMODEL_H
#define ORGSQLMODEL_H
#include <QtSql/QSqlQueryModel>


class OrgSqlModel : public QSqlQueryModel {
    Q_OBJECT
public:
    explicit OrgSqlModel(QObject * parent = NULL);
    
    virtual QHash<int, QByteArray> roleNames() const override;
    virtual QVariant data(const QModelIndex & index, int role) const override;
private:

};
#endif
