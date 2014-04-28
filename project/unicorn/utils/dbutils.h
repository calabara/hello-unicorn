#ifndef DBUTILS_H
#define DBUTILS_H
#include <QtCore/QObject>

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
};

#endif
