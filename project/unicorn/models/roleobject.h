#ifndef ROLEOBJECT_H
#define ROLEOBJECT_H

#include <QObject>

class RoleObject : public QObject
{
    Q_OBJECT
    QString m_title;

    int m_id_role;

public:
    explicit RoleObject(QObject *parent = 0);

    Q_PROPERTY(int id_role READ id_role WRITE setId_role NOTIFY id_roleChanged)
    Q_PROPERTY(QString title READ title WRITE setTitle NOTIFY titleChanged)

    QString title() const
    {
        return m_title;
    }

    int id_role() const
    {
        return m_id_role;
    }

signals:

    void titleChanged(QString arg);

    void id_roleChanged(int arg);

public slots:

    void setTitle(QString arg)
    {
        if (m_title != arg) {
            m_title = arg;
            emit titleChanged(arg);
        }
    }
    void setId_role(int arg)
    {
        if (m_id_role != arg) {
            m_id_role = arg;
            emit id_roleChanged(arg);
        }
    }
};

#endif // ROLEOBJECT_H
