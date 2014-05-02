#ifndef DEALOBJECT_H
#define DEALOBJECT_H

#include <QtCore/QObject>
#include <QtCore/QDateTime>


class DealObject : public QObject {
    Q_OBJECT

    QString m_flatAdress;
    int m_min_price;
    int m_max_price;
    QDateTime m_dateTrade;
    int m_id_deal = -1;

    int m_price;

    int m_state_key;

public:
    Q_PROPERTY(QString flatAdress READ flatAdress WRITE setFlatAdress NOTIFY flatAdressChanged)
    Q_PROPERTY(int min_price READ min_price WRITE setMin_price NOTIFY min_priceChanged)
    Q_PROPERTY(int max_price READ min_price WRITE setMax_price NOTIFY min_priceChanged)
    Q_PROPERTY(int price READ price WRITE setPrice NOTIFY priceChanged)
    Q_PROPERTY(QDateTime dateTrade READ dateTrade WRITE setDateTrade NOTIFY dateTradeChanged)
    Q_PROPERTY(int id_deal READ id_deal WRITE setId_deal NOTIFY id_dealChanged)
    Q_PROPERTY(int state_key READ state_key WRITE setState_key NOTIFY state_keyChanged)

    QString flatAdress() const
    {
        return m_flatAdress;
    }

    int min_price() const
    {
        return m_min_price;
    }

    int max_price() const
    {
        return m_max_price;
    }

    QDateTime dateTrade() const
    {
        return m_dateTrade;
    }

    int id_deal() const
    {
        return m_id_deal;
    }

    int price() const
    {
        return m_price;
    }

public slots:
    void setFlatAdress(QString arg)
    {
        if (m_flatAdress != arg) {
            m_flatAdress = arg;
            emit flatAdressChanged(arg);
        }
    }

    void setMin_price(int arg)
    {
        if (m_min_price != arg) {
            m_min_price = arg;
            emit min_priceChanged(arg);
        }
    }

    void setMax_price(int arg)
    {
        if (m_max_price != arg) {
            m_max_price = arg;
            emit min_priceChanged(arg);
        }
    }

    void setDateTrade(QDateTime arg)
    {
        if (m_dateTrade != arg) {
            m_dateTrade = arg;
            emit dateTradeChanged(arg);
        }
    }

    int state_key() const
    {
        return m_state_key;
    }

    void setId_deal(int arg)
    {
        if (m_id_deal != arg) {
            m_id_deal = arg;
            emit id_dealChanged(arg);
        }
    }

    void setPrice(int arg)
    {
        if (m_price != arg) {
            m_price = arg;
            emit priceChanged(arg);
        }
    }

    void setState_key(int arg)
    {
        if (m_state_key != arg) {
            m_state_key = arg;
            emit state_keyChanged(arg);
        }
    }

signals:
    void flatAdressChanged(QString arg);
    void min_priceChanged(int arg);
    void dateTradeChanged(QDateTime arg);
    void id_dealChanged(int arg);
    void priceChanged(int arg);

    void state_keyChanged(int arg);

public:
    // save object to DataBase
    Q_INVOKABLE
    void save() const;
};

#endif
