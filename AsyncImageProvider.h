#ifndef ASYNCIMAGEPROVIDER_H
#define ASYNCIMAGEPROVIDER_H


#include <QImage>
#include <QThreadPool>
#include <QQuickImageResponse>
#include <QNetworkAccessManager>
#include <QEventLoop>
#include <QNetworkReply>
#include <QDebug>

class AsyncImageResponse : public QQuickImageResponse, public QRunnable
{
    public:
        AsyncImageResponse(const QString &id, const QSize &requestedSize)
         : m_id(id), m_requestedSize(requestedSize)
        {
            manager = new QNetworkAccessManager();
            setAutoDelete(false);
        }

        QQuickTextureFactory *textureFactory() const override
        {
            return QQuickTextureFactory::textureFactoryForImage(m_image);
        }

        void run() override
        {
            m_image = QImage(50, 50, QImage::Format_RGB32);
            QUrl url = QUrl("http://" + m_id);
            QNetworkReply* reply = manager->get(QNetworkRequest(url));
            QEventLoop eventLoop;
            QObject::connect(reply, &QNetworkReply::finished, &eventLoop, &QEventLoop::quit);
            eventLoop.exec();
            if (reply->error() != QNetworkReply::NoError)
            {
                qDebug() << "error: " << reply->error() << " url: " << reply->url();
                reply->deleteLater();
            }
            m_image = QImage::fromData(reply->readAll());
            reply->deleteLater();
            reply = nullptr;
            if (m_requestedSize.isValid())
                m_image = m_image.scaled(m_requestedSize);

            emit finished();
        }

   private:
        QNetworkAccessManager *manager;
        QString m_id;
        QSize m_requestedSize;
        QImage m_image;
};

class AsyncImageProvider : public QQuickAsyncImageProvider
{
public:
    QQuickImageResponse *requestImageResponse(const QString &id, const QSize &requestedSize) override
    {
        AsyncImageResponse *response = new AsyncImageResponse(id, requestedSize);
        pool.start(response);
        return response;
    }

private:
    QThreadPool pool;
};
#endif // ASYNCIMAGEPROVIDER_H
