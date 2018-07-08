import QtQuick 2.11
import QtQuick.Window 2.11
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Window {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Column {
        id: column
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.rightMargin: 10
        anchors.leftMargin: 10
        anchors.bottomMargin: 10
        anchors.bottom: parent.bottom
        spacing: 10

        Repeater{
            id: repeater
            model: ["Title","Type","Authors","Info"]
            property double myHeight: 0
            Row {
                id: row
                spacing: 10
                width: column.width
                height: textField.height

                Text {
                    id: text1
                    text: modelData + ":"
                    anchors.top: parent.top
                    anchors.topMargin: 5
                    transformOrigin: Item.Center
                    font.pixelSize: 12
                    horizontalAlignment: Text.AlignHCenter
                }

                TextField {
                    id: textField
                    height: 25
                    width: parent.width-text1.width - row.spacing
                }
            }
            Component.onCompleted: {
                for (var i = 0; i< repeater.count; i++){
                    repeater.myHeight+= repeater.itemAt(i).height + column.spacing
                }
                repeater.myHeight+=  column.spacing
                console.log(repeater.myHeight)
            }
        }

        Column {
            id: column1
            spacing: 5
            width: parent.width
            height: parent.height- repeater.myHeight - button.height
            Text {
                id: text2
                text: qsTr("Comments:")
                font.pixelSize: 12
            }

            TextArea {
                id: textArea
                height: parent.height - text2.height - column1.spacing
                width: parent.width

                style: TextAreaStyle { backgroundColor : "yellow"}
            }

            Component.onCompleted: {
                console.log("Hello"+ height)
            }
        }
        Button {
            id: button
            width: 90
            text: qsTr("Save")
            anchors.right: column1.right
        }





    }


}
