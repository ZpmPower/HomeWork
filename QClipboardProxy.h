#ifndef QCLIPBOARDPROXY_H
#define QCLIPBOARDPROXY_H

#include <QObject>

class QClipboardProxy : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString text READ dataText WRITE setDataText NOTIFY dataChanged)
    Q_PROPERTY(QString selectionText READ selectionText WRITE setSelectionText NOTIFY selectionChanged)
public:
    explicit QClipboardProxy(QObject *parent = 0);

    void setDataText(const QString &text);
    QString dataText() const;

    void setSelectionText(const QString &text);
    QString selectionText() const;

signals:
    void dataChanged();
    void selectionChanged();
};

#endif // QCLIPBOARDPROXY_H
