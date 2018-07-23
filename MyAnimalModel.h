#ifndef MYANIMALMODEL_H
#define MYANIMALMODEL_H

#include <QAbstractListModel>

class MyAnimalModel : public QAbstractListModel
{
    Q_OBJECT

public:

    enum Roles {
        NameRole = Qt::UserRole + 1,
        IconRole
    };
    explicit MyAnimalModel(QObject *parent = nullptr);

    // Header:
    QVariant headerData(int section, Qt::Orientation orientation, int role = Qt::DisplayRole) const override;

    // Basic functionality:
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;

    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;

    QHash<int, QByteArray> roleNames() const;
private:
    QList<QString> m_data;
};

#endif // MYANIMALMODEL_H
