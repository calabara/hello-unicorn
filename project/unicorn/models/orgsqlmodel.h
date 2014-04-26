#include <QtSql/QSqlQueryModel>


class OrgSqlModel : public QSqlQueryModel {
    Q_OBJECT
public:
    explicit OrgSqlModel(QObject * parent = NULL);
};
