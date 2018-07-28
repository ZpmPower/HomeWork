#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <MyEmojiesModel.h>
#include <QQmlContext>
#include "QClipboardProxy.h"

#include "EmojiController.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    qmlRegisterType<QClipboardProxy>("Clipboard", 1, 0, "Clipboard");

    QQmlApplicationEngine engine;

    EmojiController emojiController;

    std::string smileys = emojiController.getEmojies(EmojiTypes::SMILES);
    std::string animals = emojiController.getEmojies(EmojiTypes::ANIMALS);

    MyEmojiesModel *smileysPtr = new MyEmojiesModel(smileys);
    MyEmojiesModel *emojiesAnimalPtr = new MyEmojiesModel(animals);

    QQmlEngine::setObjectOwnership(emojiesAnimalPtr, QQmlEngine::JavaScriptOwnership);
    QQmlEngine::setObjectOwnership(smileysPtr, QQmlEngine::JavaScriptOwnership);

    engine.rootContext()->setContextProperty("emojiAnimalModel",emojiesAnimalPtr);
    engine.rootContext()->setContextProperty("emojiSmileysModel",smileysPtr);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
