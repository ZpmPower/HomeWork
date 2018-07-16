#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <AsyncImageProvider.h>
#include <RandomImageProvider.h>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    engine.addImageProvider("async", new AsyncImageProvider);
    engine.addImageProvider("rand", new RandomImageProvider);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
