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
    
    // deal
    Q_INVOKABLE
    bool getAllDeals();
    // 
    
    Q_INVOKABLE
    bool addDeal(int min_price, int price, int max_price, int state_key, QString flatAdress, QDate dateTrade) const;

private:
    QQmlContext * mContext;

    OrgSqlModel * model;
};
