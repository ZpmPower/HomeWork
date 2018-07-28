#include "EmojiController.h"

EmojiController::EmojiController()
{

}

std::string EmojiController::getEmojies(EmojiTypes type)
{
    switch (type) {
    case EmojiTypes::ANIMALS:
        return emojiesAnimalStr;
        break;
    case EmojiTypes::SMILES:
        return emojiesSmileysStr;
        break;
    case EmojiTypes::FOOD:
        return emojiesFoodStr;
        break;
    default:
        break;
    }
}
