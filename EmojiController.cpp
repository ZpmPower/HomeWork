#include "EmojiController.h"
#include "Helper.h"

EmojiController::EmojiController()
{

}

std::pair<QList<QByteArray>, QString> EmojiController::getEmojies(EmojiTypes type)
{
    std::string currString;
    std::string name;
    switch (type) {
    case EmojiTypes::ANIMALS:
        currString = emojiesAnimalStr;
        name = "Animals";
        break;
    case EmojiTypes::SMILES:
        currString = emojiesSmileysStr;
        name = "Smiles";
        break;
    case EmojiTypes::FOOD:
        currString = emojiesFoodStr;
        name = "Food";
        break;
    case EmojiTypes::AUTO:
        currString = emojiesAutoStr;
        name = "Auto";
        break;
    case EmojiTypes::CLOCKS:
        currString  = emojiesClocksStr;
        name = "Clocks";
        break;
    case EmojiTypes::CLOTHING:
        currString  = emojiesClothingStr;
        name = "Clothing";
        break;
    default:
        break;
    }
    bytes.clear();
    Helper::getBytesArray(bytes,currString);
    return std::make_pair(bytes, QString::fromStdString(name));
}
