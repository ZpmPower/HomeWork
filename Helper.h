#ifndef HELPER_H
#define HELPER_H

#include <QList>

class Helper
{
public:
    Helper();
    static void getBytesArray(QList<QByteArray> &bytes, std::string emojies);
};

#endif // HELPER_H
