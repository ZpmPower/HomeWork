#include "MySmileysModel.h"
#include <qdebug.h>
#include <string>

MySmileysModel::MySmileysModel(QObject *parent)
    : QAbstractListModel(parent)
{
    QList<QByteArray> bytes;
    std::string emojies = "😁😂🤣😃😄😅😆😉😊😋😎😍😘😗😙😚🙂🤗🤔😐😑😶🙄😏😣😥😮🤐😯😪😫😴😌😛😜😝🤤😒😓😔😕🙃🤑😲🙁😖😞😟😤😢😭😦😧😨😩😬😰😱😳😵😡😠😷🤒🤕🤢🤧😇🤠🤡🤥🤓😈👿👹👺💀👻👽😺😸😹😻😼😽🙀😿😾";
    for(size_t i=0; i< emojies.size(); i+=4)
    {
        std::string tmp;
        tmp+= emojies.substr(i,4);
        bytes << QByteArray(tmp.c_str());
    }
    foreach (QByteArray binary, bytes)
    {
        QString str = QString::fromUtf8(binary);

        m_data.append(str);
    }
}

QVariant MySmileysModel::headerData(int section, Qt::Orientation orientation, int role) const
{
    // FIXME: Implement me!
}

int MySmileysModel::rowCount(const QModelIndex &parent) const
{
    // For list models only the root node (an invalid parent) should return the list's size. For all
    // other (valid) parents, rowCount() should return 0 so that it does not become a tree model.
    if (parent.isValid())
        return 0;

    // FIXME: Implement me!
    return m_data.size();
}

QVariant MySmileysModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
        return QVariant();

    switch (role) {
    case NameRole:
        break;
    case IconRole:
        return m_data.at(index.row());
        break;
    default:
        break;
    }
    // FIXME: Implement me!
    return QVariant();
}

QHash<int, QByteArray> MySmileysModel::roleNames() const
{
    QHash<int, QByteArray> roles = QAbstractListModel::roleNames();
    roles[NameRole] = "mName";
    roles[IconRole] = "mIcon";
    return roles;
}
