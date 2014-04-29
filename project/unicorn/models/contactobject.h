#ifndef CONTACTOBJECT_H
#define CONTACTOBJECT_H

#include <QtCore/QObject>

class ContactObject : public QObject
{
    Q_OBJECT

    QString m_name;
    QString m_surname;
    int m_id = -1;
    QString m_phone_nunmber;
    int m_type_id;
    QString m_additional_info;

public:
    explicit ContactObject(QObject *parent = 0);

    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
    Q_PROPERTY(QString surname READ surname WRITE setSurname NOTIFY surnameChanged)
    Q_PROPERTY(int id READ id WRITE setId NOTIFY idChanged)
    Q_PROPERTY(QString phone_nunmber READ phone_nunmber WRITE setPhone_nunmber NOTIFY phone_nunmberChanged)
    Q_PROPERTY(int type_id READ type_id WRITE setType_id NOTIFY type_idChanged)
    Q_PROPERTY(QString additional_info READ additional_info WRITE setAdditional_info NOTIFY additional_infoChanged)

    QString name() const
    {
        return m_name;
    }

    QString surname() const
    {
        return m_surname;
    }

    int id() const
    {
        return m_id;
    }

    QString phone_nunmber() const
    {
        return m_phone_nunmber;
    }

    int type_id() const
    {
        return m_type_id;
    }

    QString additional_info() const
    {
        return m_additional_info;
    }

signals:

    void nameChanged(QString arg);

    void surnameChanged(QString arg);

    void idChanged(int arg);

    void phone_nunmberChanged(QString arg);

    void type_idChanged(int arg);

    void additional_infoChanged(QString arg);

public slots:
    void setName(QString arg)
    {
        if (m_name != arg) {
            m_name = arg;
            emit nameChanged(arg);
        }
    }
    void setSurname(QString arg)
    {
        if (m_surname != arg) {
            m_surname = arg;
            emit surnameChanged(arg);
        }
    }
    void setId(int arg)
    {
        if (m_id != arg) {
            m_id = arg;
            emit idChanged(arg);
        }
    }
    void setPhone_nunmber(QString arg)
    {
        if (m_phone_nunmber != arg) {
            m_phone_nunmber = arg;
            emit phone_nunmberChanged(arg);
        }
    }
    void setType_id(int arg)
    {
        if (m_type_id != arg) {
            m_type_id = arg;
            emit type_idChanged(arg);
        }
    }
    void setAdditional_info(QString arg)
    {
        if (m_additional_info != arg) {
            m_additional_info = arg;
            emit additional_infoChanged(arg);
        }
    }

    bool save();
};

#endif // CONTACTOBJECT_H
