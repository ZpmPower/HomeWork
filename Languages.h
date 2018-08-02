#ifndef LANGUAGES_H
#define LANGUAGES_H

#include <QObject>
#include <QDebug>
#include <QQmlApplicationEngine>
#include <QQmlComponent>

class Languages : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString textSize READ textSize WRITE setTextSize NOTIFY textSizeChanged)
    Q_PROPERTY(QString previewBox READ previewBox WRITE setpreviewBox NOTIFY previewBoxChanged)
    Q_PROPERTY(QString textColor READ textColor WRITE setTextColor NOTIFY textColorChanged)
    Q_PROPERTY(QString applyBtn READ applyBtn WRITE setApplyBtn NOTIFY applyBtnChanged)
    Q_PROPERTY(QString bgColor READ bgColor WRITE setBgColor NOTIFY bgColorChanged)
    Q_PROPERTY(QString language READ language WRITE setLanguage NOTIFY languageChanged)
    Q_PROPERTY(QString settings READ settings WRITE setSettings NOTIFY settingsChanged)
    Q_PROPERTY(QString message READ message WRITE setMessage NOTIFY messageChanged)

    Q_PROPERTY(QString typeText READ typeText WRITE settypeText NOTIFY typeTextChanged)
    Q_PROPERTY(QString sendText READ sendText WRITE setsendText NOTIFY sendTextChanged)
    Q_PROPERTY(QString greetingsText READ greetingsText WRITE setgreetingsText NOTIFY greetingsTextChanged)


public:

    Q_INVOKABLE void setLanguage(QString s) {

        switch (convertToEnum(s)) {
        case LanguagesTypes::RU:
            setgreetingsText("Приветствую в моем тестовом чате!");
            settypeText("Напиши сообщение:");
            setsendText("Отправить");
            setTextSize("Размер шрифта:");
            setpreviewBox("Предварительный просмотр:");
            settextColor("Цвет текста:");
            setapplyBtn("Применить");
            setbgColor("Цвет фона:");
            setlanguage("Язык:");
            setsettings("Настройки");
            setMessage("Сообщение:");
            break;
        case LanguagesTypes::EN:
            setgreetingsText("Welcome to my Test Chat!");
            settypeText("Type text:");
            setsendText("Send");
            setTextSize("Text Size:");
            setpreviewBox("Preview Box:");
            settextColor("Text Color:");
            setapplyBtn("Apply");
            setbgColor("Background Color:");
            setlanguage("Language:");
            setsettings("Settings");
            setMessage("Message:");
            break;
        default:
            break;
        }
    }

    enum LanguagesTypes {
      RU, EN
    };

    Languages();
    LanguagesTypes convertToEnum(QString s);

    QString textSize() const
    {
        return m_textSize;
    }

    QString typeText() const
    {
        return m_typeText;
    }

    QString sendText() const
    {
        return m_sendText;
    }

    QString greetingsText() const
    {
        return m_greetingsText;
    }

    QString previewBox() const
    {
        return m_previewBox;
    }

    QString textColor() const
    {
        return m_textColor;
    }

    QString applyBtn() const
    {
        return m_applyBtn;
    }

    QString bgColor() const
    {
        return m_bgColor;
    }

    QString language() const
    {
        return m_language;
    }

    QString settings() const
    {
        return m_settings;
    }

    QString message() const
    {
        return m_message;
    }

public slots:
    void setTextSize(QString textSize)
    {
        if (m_textSize == textSize)
            return;

        m_textSize = textSize;
        emit textSizeChanged(m_textSize);
    }

    void settypeText(QString typeText)
    {
        if (m_typeText == typeText)
            return;

        m_typeText = typeText;
        emit typeTextChanged(m_typeText);
    }

    void setsendText(QString sendText)
    {
        if (m_sendText == sendText)
            return;

        m_sendText = sendText;
        emit sendTextChanged(m_sendText);
    }

    void setgreetingsText(QString greetingsText)
    {
        if (m_greetingsText == greetingsText)
            return;

        m_greetingsText = greetingsText;
        emit greetingsTextChanged(m_greetingsText);
    }

    void setpreviewBox(QString previewBox)
    {
        if (m_previewBox == previewBox)
            return;

        m_previewBox = previewBox;
        emit previewBoxChanged(m_previewBox);
    }

    void settextColor(QString textColor)
    {
        if (m_textColor == textColor)
            return;

        m_textColor = textColor;
        emit textColorChanged(m_textColor);
    }

    void setapplyBtn(QString applyBtn)
    {
        if (m_applyBtn == applyBtn)
            return;

        m_applyBtn = applyBtn;
        emit applyBtnChanged(m_applyBtn);
    }

    void setbgColor(QString bgColor)
    {
        if (m_bgColor == bgColor)
            return;

        m_bgColor = bgColor;
        emit bgColorChanged(m_bgColor);
    }

    void setlanguage(QString language)
    {
        if (m_language == language)
            return;

        m_language = language;
        emit languageChanged(m_language);
    }

    void setBgColor(QString bgColor)
    {
        if (m_bgColor == bgColor)
            return;

        m_bgColor = bgColor;
        emit bgColorChanged(m_bgColor);
    }

    void setApplyBtn(QString applyBtn)
    {
        if (m_applyBtn == applyBtn)
            return;

        m_applyBtn = applyBtn;
        emit applyBtnChanged(m_applyBtn);
    }

    void setTextColor(QString textColor)
    {
        if (m_textColor == textColor)
            return;

        m_textColor = textColor;
        emit textColorChanged(m_textColor);
    }

    void setsettings(QString settings)
    {
        if (m_settings == settings)
            return;

        m_settings = settings;
        emit settingsChanged(m_settings);
    }

    void setSettings(QString settings)
    {
        if (m_settings == settings)
            return;

        m_settings = settings;
        emit settingsChanged(m_settings);
    }

    void setmessage(QString message)
    {
        if (m_message == message)
            return;

        m_message = message;
        emit messageChanged(m_message);
    }

    void setMessage(QString message)
    {
        if (m_message == message)
            return;

        m_message = message;
        emit messageChanged(m_message);
    }

signals:
    void textSizeChanged(QString textSize);

    void typeTextChanged(QString typeText);

    void sendTextChanged(QString sendText);

    void greetingsTextChanged(QString greetingsText);

    void previewBoxChanged(QString previewBox);

    void textColorChanged(QString textColor);

    void applyBtnChanged(QString applyBtn);

    void bgColorChanged(QString bgColor);

    void languageChanged(QString language);

    void settingsChanged(QString settings);

    void messageChanged(QString message);

private:

    QString m_textSize;
    QString m_typeText;
    QString m_sendText;
    QString m_greetingsText = "Hello";
    QString m_previewBox;
    QString m_textColor;
    QString m_applyBtn;
    QString m_bgColor;
    QString m_language;
    QString m_settings;
    QString m_message;
};

#endif // LANGUAGES_H
