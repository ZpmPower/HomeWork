#ifndef EMOJICONTROLLER_H
#define EMOJICONTROLLER_H

#include <QList>

enum EmojiTypes{ SMILES, ANIMALS, FOOD, AUTO, CLOCKS, CLOTHING,SIZE};

class EmojiController
{
public:
    EmojiController();
    std::pair<QList<QByteArray>, QString> getEmojies(EmojiTypes type);

private:
    QList<QByteArray> bytes;

    std::string emojiesAnimalStr = "🐶🐱🐭🐹🐰🦊🐻🐼🐨🐯🦁🐮🐷🐽🐸🐵🙈🙉🙊🐒🐔🐧🐦🐤🐣🐥🦆🦅🦉🦇🐺🐗🐴🦄🐝🐛🦋🐌🐚🐞🐜🕷🕸🦂🐢🐍🦎🐙🦑🦐🦀🐡🐠🐟🐬🐳🐋🦈🐊🐅🐆🦍🐘🦏🐪🐫🐃🐂🐄🐎🐖🐏🐑🐐🦌🐕🐩🐈🐓🦃🕊🐇🐁🐀🐿";
    std::string emojiesSmileysStr = "😁😂🤣😃😄😅😆😉😊😋😎😍😘😗😙😚🙂🤗🤔😐😑😶🙄😏😣😥😮🤐😯😪😫😴😌😛😜😝🤤😒😓😔😕🙃🤑😲🙁😖😞😟😤😢😭😦😧😨😩😬😰😱😳😵😡😠😷🤒🤕🤢🤧😇🤠🤡🤥🤓😈👿👹👺💀👻👽😺😸😹😻😼😽🙀😿😾";
    std::string emojiesFoodStr = "🍏🍎🍐🍊🍋🍌🍉🍇🍓🍈🍒🍑🍍🥝🍅🍆🥑🥒🌶🌽🥕🥔🍠🥐🍞🥖🧀🥚🍳🥞🥓🍗🍖🌭🍔🍟🍕🥙🌮🌯🥗🥘🍝🍜🍲🍛🍣🍱🍤🍙🍚🍘🍥🍢🍡🍧🍨🍦🍰🎂🍮🍭🍬🍫🍿🍩🍪🌰🥜🍯🥛🍼";
    std::string emojiesAutoStr = "🚗🚕🚙🚌🚎🏎🚓🚑🚒🚐🚚🚛🚜🛴🚲🛵🏍🚨🚔🚍🚘🚖🚡🚠🚟🚃🚋🚞🚝🚄🚅🚈🚂🚆🚇🚊🚉";
    std::string emojiesClocksStr ="🕐🕑🕒🕓🕔🕕🕖🕗🕘🕙🕚🕛🕜🕝🕞🕟🕠🕡🕢🕣🕤🕥🕦🕧";
    std::string emojiesClothingStr = "👚👕👖👔👗👙👘👠👡👢👞👟🎩👒🎓👑👝👛👜💼🎒👓🕶🌂";
};

#endif // EMOJICONTROLLER_H
