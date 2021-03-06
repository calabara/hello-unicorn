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
    bool getActualDeals();
    Q_INVOKABLE
    bool addDeal(int min_price, int price, int max_price, int state_key, QString flatAdress, QDateTime dateTrade) const;
    Q_INVOKABLE
    bool getAllMembers(int id_deal);
    Q_INVOKABLE
    bool addMemberToDeal(int id_deal, int id_contact, int id_role) const;
    Q_INVOKABLE
    bool getAllRoles() const;
    Q_INVOKABLE
    void getDeal(int id_deal);

    Q_INVOKABLE
    void getAllActiveDealsAsList();

    // contacts
    Q_INVOKABLE
    bool getAllContacts(int id_type);

    // events
    Q_INVOKABLE
    bool getAllEvents();
    Q_INVOKABLE
    bool getEvents(int id_deal, QString order);

    // actors
    Q_INVOKABLE
    bool getDealActors(int id_deal);
    Q_INVOKABLE
    bool getEventActors(int id_event);

private:
    QQmlContext * mContext;

    OrgSqlModel * dealModel = nullptr;
    OrgSqlModel * dealMembersModel = nullptr;
    OrgSqlModel * rolesModel = nullptr;
    OrgSqlModel * contactModel = nullptr;
    OrgSqlModel * eventsModel = nullptr;
    OrgSqlModel * actorsModel = nullptr;
    DealObject * curDeal = nullptr;
};
