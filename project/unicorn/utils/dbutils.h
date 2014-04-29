#ifndef DBUTILS_H
#define DBUTILS_H
#include <QtCore/QObject>
#include "models/contactobject.h"

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
};

#endif
