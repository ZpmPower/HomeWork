#include "Languages.h"

Languages::Languages(){}

Languages::LanguagesTypes Languages::convertToEnum(QString s)
{
    if (s == "EN") return LanguagesTypes::EN;
    if (s == "RU") return LanguagesTypes::RU;
}
