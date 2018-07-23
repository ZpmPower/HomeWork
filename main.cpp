#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <MyListModel.h>
#include <MyAnimalModel.h>
#include <QQmlContext>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);


     qmlRegisterType<MyListModel>("MyListModel", 1, 0, "MyListModel");
     qmlRegisterType<MyAnimalModel>("MyAnimalModel", 1, 0, "MyAnimalModel");

    QQmlApplicationEngine engine;

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
