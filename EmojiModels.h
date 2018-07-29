#ifndef EMOJIMODELS_H
#define EMOJIMODELS_H

#include <QAbstractListModel>
#include <MyEmojiesModel.h>
#include "EmojiController.h"

Q_DECLARE_METATYPE(MyEmojiesModel*)

class EmojiModels : public QAbstractListModel
{
    Q_OBJECT
public:
    explicit EmojiModels(QObject *parent = nullptr);

    enum Roles {
        ModelRole = Qt::UserRole + 1,
        IconRole
    };

    // Header:
    QVariant headerData(int section, Qt::Orientation orientation, int role = Qt::DisplayRole) const override;

    // Basic functionality:
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;

    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;

    QHash<int, QByteArray> roleNames() const;
public slots:
    MyEmojiesModel* model(int idx);
private:
    QList<MyEmojiesModel*> m_models;
    EmojiController controller;
};

#endif // EMOJIMODELS_H
