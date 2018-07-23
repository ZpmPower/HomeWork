#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <MySmileysModel.h>
#include <MyAnimalModel.h>
#include <QQmlContext>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);


     qmlRegisterType<MySmileysModel>("MySmileysModel", 1, 0, "MySmileysModel");
     qmlRegisterType<MyAnimalModel>("MyAnimalModel", 1, 0, "MyAnimalModel");

    QQmlApplicationEngine engine;

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
