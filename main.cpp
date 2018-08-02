#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <MyEmojiesModel.h>
#include <QQmlContext>
#include "QClipboardProxy.h"
#include <QQmlComponent>

#include "EmojiController.h"
#include "EmojiModels.h"
#include "Languages.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    qmlRegisterType<QClipboardProxy>("Clipboard", 1, 0, "Clipboard");
    qmlRegisterType<EmojiModels>("EmojiModels",1,0, "EmojiModels");

    QQmlApplicationEngine engine;

    Languages *ptrData = new Languages();

    QQmlEngine::setObjectOwnership(ptrData, QQmlEngine::JavaScriptOwnership);

    engine.rootContext()->setContextProperty("Language", ptrData);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
