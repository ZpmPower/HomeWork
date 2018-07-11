import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

ColumnLayout {
    id:root
    state: "normal"
    property int myIndex: 0
    property alias placeholderText: field.placeholderText
    property alias fieldLength: field.length
    property alias error: errorMsg.text


    TextField {
        id: field
        Layout.fillWidth: true
    }

    Text {
        id: errorMsg
        visible: text.length > 0
        font.pixelSize: 25
        Layout.fillWidth: true
        color: "black"
    }
    states: [
        State {
            name: "error"
            PropertyChanges {
                target: errorMsg
                color: "#fb3232"
            }

        },
        State {
            name: "normal"
            PropertyChanges {
                target: errorMsg
                color: "#605858"
            }
        }

    ]
    transitions: [
    Transition {
        from: "normal"; to: "error"
        ColorAnimation { target: [errorMsg]
            property: "color"; duration: 1500}
    },
    Transition {
        from: "error"; to: "normal"
        ColorAnimation {target: [errorMsg]
            property: "color"; duration: 1500}
    }
]
}
