#include "MyEmojiesModel.h"
#include <QDebug>
#include "Helper.h"


MyEmojiesModel::MyEmojiesModel(QList<QByteArray> emojiBytes, QString name,QObject *parent)
    : QAbstractListModel(parent)
{
    foreach (QByteArray binary, emojiBytes)
    {
        QString str = QString::fromUtf8(binary);
        m_data.append(str);
    }
    if(!name.isEmpty()) m_name = name;
}

QVariant MyEmojiesModel::headerData(int section, Qt::Orientation orientation, int role) const
{
    // FIXME: Implement me!
}

int MyEmojiesModel::rowCount(const QModelIndex &parent) const
{
    // For list models only the root node (an invalid parent) should return the list's size. For all
    // other (valid) parents, rowCount() should return 0 so that it does not become a tree model.
    if (parent.isValid())
        return 0;

    // FIXME: Implement me!
    return m_data.size();
}

QVariant MyEmojiesModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
        return QVariant();

    // FIXME: Implement me!
    switch (role) {
    case NameRole:
        return m_name;
        break;
    case IconRole:
        return m_data.at(index.row());
        break;
    default:
        break;
    }
    return QVariant();
}

QHash<int, QByteArray> MyEmojiesModel::roleNames() const
{
    QHash<int, QByteArray> roles = QAbstractListModel::roleNames();
    roles[NameRole] = "mName";
    roles[IconRole] = "mIcon";
    return roles;
}
