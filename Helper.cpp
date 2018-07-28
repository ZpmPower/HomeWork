#include "Helper.h"

void Helper::getBytesArray(QList<QByteArray>& bytes, std::string emojies)
{
    for(size_t i=0; i< emojies.size(); i+=4)
    {
        std::string tmp;
        tmp+= emojies.substr(i,4);
        bytes << QByteArray(tmp.c_str());
    }
}
