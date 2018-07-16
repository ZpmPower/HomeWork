#ifndef RANDOMIMAGEPROVIDER_H
#define RANDOMIMAGEPROVIDER_H


#include <QObject>
#include <QQuickImageProvider>
#include <QNetworkAccessManager>
#include <QEventLoop>
#include <QNetworkReply>
#include <QDebug>
#include <QThread>


class RandomImageProvider :  public QObject, public QQuickImageProvider
{
    Q_OBJECT
public:
    RandomImageProvider() : QQuickImageProvider(QQuickImageProvider::Image) {

        manager = new QNetworkAccessManager();
    }

    QImage requestImage(const QString &id, QSize *size, const QSize& requestedSize)
    {

        Q_UNUSED(requestedSize);
        try
        {
            QUrl url("https://" + id);
            QNetworkReply* reply = manager->get(QNetworkRequest(url));
            qDebug()<< url;
            QEventLoop eventLoop;

           // QObject::connect(reply, &QNetworkReply::finished, &eventLoop, &QEventLoop::quit);
            QObject::connect(reply, SIGNAL(finished()), &eventLoop, SLOT(quit()));
            eventLoop.exec();
            if (reply->error() != QNetworkReply::NoError)
            {
                qDebug() << "error: " << reply->error() << " url: " << reply->url();
                reply->deleteLater();
                return QImage();
            }
            QImage image = QImage::fromData(reply->readAll());

            reply->deleteLater();
            reply = nullptr;

            if(image.isNull())
            {
                return  QImage();
            }
            size->setWidth(image.width());
            size->setHeight(image.height());
            QThread::sleep(3);
            return image;

        }
        catch (int)
        {
            return  QImage();
        }

        return  QImage();
    }

    int propertyName() const
    {
        return m_propertyName;
    }

public slots:
    void setPropertyName(int propertyName)
    {
        if (m_propertyName == propertyName)
            return;

        m_propertyName = propertyName;
        emit propertyNameChanged(m_propertyName);
    }

signals:
    void propertyNameChanged(int propertyName);

private:
    QNetworkAccessManager *manager;


    int m_propertyName;
};

#endif // RANDOMIMAGEPROVIDER_H
