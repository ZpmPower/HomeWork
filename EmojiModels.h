#ifndef EMOJIMODELS_H
#define EMOJIMODELS_H

#include <QList>
#include <MyEmojiesModel.h>
#include <EmojiController.h>

class EmojiModels
{
public:
    EmojiModels();
    void getModel(int index);
private:
    QList<MyEmojiesModel> models;
    EmojiController controller;
};

#endif // EMOJIMODELS_H
