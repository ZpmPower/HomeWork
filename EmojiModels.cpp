#include "EmojiModels.h"
#include <QDebug>

EmojiModels::EmojiModels(QObject *parent)
    : QAbstractListModel(parent)
{
    for (int i=0; i< static_cast<int>(EmojiTypes::SIZE); i++)
    {
        std::pair<QList<QByteArray>, QString> pair = controller.getEmojies(static_cast<EmojiTypes>(i));
        m_models.append(new MyEmojiesModel(pair.first,pair.second));
    }
}

QVariant EmojiModels::headerData(int section, Qt::Orientation orientation, int role) const
{
    // FIXME: Implement me!
}

int EmojiModels::rowCount(const QModelIndex &parent) const
{
    // For list models only the root node (an invalid parent) should return the list's size. For all
    // other (valid) parents, rowCount() should return 0 so that it does not become a tree model.
    if (parent.isValid())
        return 0;

    // FIXME: Implement me!
    return m_models.size();
}

QVariant EmojiModels::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
        return QVariant();

    // FIXME: Implement me!
    switch (role) {
    case ModelRole:
        return QVariant::fromValue(m_models.at(index.row()));
        break;
    case NameRole:
        return QVariant::fromValue(m_models.at(index.row())->getName());
    default:
        break;
    }
    return QVariant();
    int i = index.row();
//    if (i < 0 || i >= m_models.size())
//        return QVariant(QVariant::Invalid);

//    return QVariant::fromValue(m_models[i]);
}

QHash<int, QByteArray> EmojiModels::roleNames() const
{
    QHash<int, QByteArray> roles = QAbstractListModel::roleNames();
    roles[ModelRole] = "mModel";
    roles[NameRole] = "mName";
    return roles;
}

MyEmojiesModel* EmojiModels::model(int idx)
{
    if (idx < 0 || idx >= m_models.size())
        return nullptr;

    return m_models[idx];
}
