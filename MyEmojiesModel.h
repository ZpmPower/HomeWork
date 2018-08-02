#ifndef MYEMOJIESMODEL_H
#define MYEMOJIESMODEL_H

#include <QAbstractListModel>

Q_DECLARE_METATYPE(std::string)

class MyEmojiesModel : public QAbstractListModel
{
    Q_OBJECT
public:

    enum Roles {
        NameRole = Qt::UserRole + 1,
        IconRole
    };
    Q_INVOKABLE QString getName() { return m_name;}
    explicit MyEmojiesModel(QList<QByteArray> emojiBytes, QString name, QObject *parent = nullptr);


    // Header:
    QVariant headerData(int section, Qt::Orientation orientation, int role = Qt::DisplayRole) const override;

    // Basic functionality:
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;

    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;

    QHash<int, QByteArray> roleNames() const;



private:
    QList<QString> m_data;
    QString m_name;
};

#endif // MYEMOJIESMODEL_H
