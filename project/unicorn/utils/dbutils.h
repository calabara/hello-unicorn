#ifndef DBUTILS_H
#define DBUTILS_H
#include <QtCore/QObject>
#include <QtCore/QList>

#include "models/contactobject.h"
#include "models/dealobject.h"
#include "models/eventobject.h"

class DbUtils : public QObject {
    Q_OBJECT
public:
    explicit DbUtils(QObject * parent = NULL)
        :QObject(parent) {}
    virtual ~DbUtils() {}

    Q_INVOKABLE
    QString statusAsString(int id_state) const;

    Q_INVOKABLE
    QString typeAsString(int id_type) const;

    Q_INVOKABLE
    void readContact(int id_contact, ContactObject * contact) const;

    Q_INVOKABLE
    void readEvent(int id_event, EventObject * event) const;

    Q_INVOKABLE
    QString eventTypeAsString(int id_type) const;

    Q_INVOKABLE
    QString dealAdress(int id_deal) const;

    Q_INVOKABLE
    static QString dateFormat();

    Q_INVOKABLE
    bool execQuery(const QString & query);

    Q_INVOKABLE
    QList<QObject*> getRoles();

    Q_INVOKABLE
    QList<QObject*> getAllContactsAsList();

    Q_INVOKABLE
    QList<QObject*> getAllStatesDealAsList();

    Q_INVOKABLE
    QList<QObject*> getAllDealsAsList();

    Q_INVOKABLE
    bool deleteActorFromDeal(int id_deal, int id_contact);

    Q_INVOKABLE
    bool deleteActorFromEvent(int id_event, int id_contact);
};

#endif
