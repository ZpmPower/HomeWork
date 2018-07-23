#include "MyAnimalModel.h"
#include <QDebug>

MyAnimalModel::MyAnimalModel(QObject *parent)
    : QAbstractListModel(parent)
{
    QList<QByteArray> bytes;
    std::string emojies = "🐶🐱🐭🐹🐰🦊🐻🐼🐨🐯🦁🐮🐷🐽🐸🐵🙈🙉🙊🐒🐔🐧🐦🐤🐣🐥🦆🦅🦉🦇🐺🐗🐴🦄🐝🐛🦋🐌🐚🐞🐜🕷🕸🦂🐢🐍🦎🐙🦑🦐🦀🐡🐠🐟🐬🐳🐋🦈🐊🐅🐆🦍🐘🦏🐪🐫🐃🐂🐄🐎🐖🐏🐑🐐🦌🐕🐩🐈🐓🦃🕊🐇🐁🐀🐿";
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

QVariant MyAnimalModel::headerData(int section, Qt::Orientation orientation, int role) const
{
    // FIXME: Implement me!
}

int MyAnimalModel::rowCount(const QModelIndex &parent) const
{
    // For list models only the root node (an invalid parent) should return the list's size. For all
    // other (valid) parents, rowCount() should return 0 so that it does not become a tree model.
    if (parent.isValid())
        return 0;

    // FIXME: Implement me!
    return m_data.size();
}

QVariant MyAnimalModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
        return QVariant();

    // FIXME: Implement me!
    switch (role) {
    case NameRole:
        break;
    case IconRole:
        return m_data.at(index.row());
        break;
    default:
        break;
    }
    return QVariant();
}

QHash<int, QByteArray> MyAnimalModel::roleNames() const
{
    QHash<int, QByteArray> roles = QAbstractListModel::roleNames();
    roles[NameRole] = "mName";
    roles[IconRole] = "mIcon";
    return roles;
}
