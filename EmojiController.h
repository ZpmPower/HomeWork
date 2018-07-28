#ifndef EMOJICONTROLLER_H
#define EMOJICONTROLLER_H

#include <string>

enum EmojiTypes{ SMILES, ANIMALS, FOOD, SIZE};

class EmojiController
{
public:
    EmojiController();
    std::string getEmojies(EmojiTypes type);

private:
    std::string emojiesAnimalStr = "🐶🐱🐭🐹🐰🦊🐻🐼🐨🐯🦁🐮🐷🐽🐸🐵🙈🙉🙊🐒🐔🐧🐦🐤🐣🐥🦆🦅🦉🦇🐺🐗🐴🦄🐝🐛🦋🐌🐚🐞🐜🕷🕸🦂🐢🐍🦎🐙🦑🦐🦀🐡🐠🐟🐬🐳🐋🦈🐊🐅🐆🦍🐘🦏🐪🐫🐃🐂🐄🐎🐖🐏🐑🐐🦌🐕🐩🐈🐓🦃🕊🐇🐁🐀🐿";
    std::string emojiesSmileysStr = "😁😂🤣😃😄😅😆😉😊😋😎😍😘😗😙😚🙂🤗🤔😐😑😶🙄😏😣😥😮🤐😯😪😫😴😌😛😜😝🤤😒😓😔😕🙃🤑😲🙁😖😞😟😤😢😭😦😧😨😩😬😰😱😳😵😡😠😷🤒🤕🤢🤧😇🤠🤡🤥🤓😈👿👹👺💀👻👽😺😸😹😻😼😽🙀😿😾";
    std::string emojiesFoodStr = "🍏🍎🍐🍊🍋🍌🍉🍇🍓🍈🍒🍑🍍🥥🥝🍅🍆🥑🥒🌶🌽🥕🥔🍠🥐🍞🥖🧀🥚🍳🥞🥓🍗🍖🌭🍔🍟🍕🥙🌮🌯🥗🥘🍝🍜🍲🍛🍣🍱🍤🍙🍚🍘🍥🍢🍡🍧🍨🍦🍰🎂🍮🍭🍬🍫🍿🍩🍪🌰🥜🍯🥛🍼☕️🍵🍶🍺🍻🥂🍷🥃🍸🍹🍾🥄🍴🍽";
};

#endif // EMOJICONTROLLER_H
