#include <QtCore/QObject>
#include <QtQml/QQmlContext>
#include "utils/dbase_connector.h"


#include "models/orgsqlmodel.h"

class OrgController : public QObject {
    Q_OBJECT
public:
    OrgController(QQmlContext * context);
    ~OrgController();

    // actions of controller
    Q_INVOKABLE
    bool getAllDeals();
private:
    QQmlContext * mContext;

    OrgSqlModel * model;
};
