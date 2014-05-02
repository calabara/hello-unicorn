#include <QtCore/QObject>
#include <QtQml/QQmlContext>
#include "utils/dbase_connector.h"


#include "models/orgsqlmodel.h"
#include "models/dealobject.h"

class OrgController : public QObject {
    Q_OBJECT

public:
    OrgController(QQmlContext * context);
    ~OrgController();

    // actions of controller
    
    // deal
    Q_INVOKABLE
    bool getAllDeals();
    Q_INVOKABLE
    bool addDeal(int min_price, int price, int max_price, int state_key, QString flatAdress, QDate dateTrade) const;
    Q_INVOKABLE
    bool getAllMembers(int id_deal);
    Q_INVOKABLE
    bool addMemberToDeal(int id_deal, int id_contact, int id_role) const;
    Q_INVOKABLE
    bool getAllRoles() const;
    Q_INVOKABLE
    void getDeal(int id_deal);

    // contacts
    Q_INVOKABLE
    bool getAllContacts(int id_type);

    // events
    Q_INVOKABLE
    bool getAllEvents();
    Q_INVOKABLE
    bool getEvents(int id_deal);

private:
    QQmlContext * mContext;

    OrgSqlModel * dealModel = nullptr;
    OrgSqlModel * dealMembersModel = nullptr;
    OrgSqlModel * rolesModel = nullptr;
    OrgSqlModel * contactModel = nullptr;
    OrgSqlModel * eventsModel = nullptr;
    DealObject * curDeal = nullptr;
};
