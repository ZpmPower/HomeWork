import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Window {
    id: window
    visible: true
    width: 640
    height: 490
    title: qsTr("Hello World")

    Column {
        id: column
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10

        Repeater{
            id: repeater
            model: ["Title","Type","Authors","Info"]
            property double myHeight: 0
            property double maxText: 1
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
                    width: parent.width - x
                }
            }
        onItemAdded: {
            maxText = Math.max(maxText,repeater.itemAt(index).children[0].width)
            for( var i=0; i<repeater.count; i++)
            {
                repeater.itemAt(i).children[0].width = maxText
            }
            console.log(repeater.itemAt(index).children[0].width)
        }
        }
        Item {
            id: test
            width: 1
            height: 5
        }
        TextArea{
            id:textAr
            width: parent.width
            height: parent.height - y - button.height - column.spacing
            wrapMode: Text.WordWrap

            style: TextAreaStyle {
                transientScrollBars: true
                scrollToClickedPosition: true
                selectionColor: "#fff"
                selectedTextColor: "#000"
            }


            Text{
                id: title
                text:"Comments:"
                anchors.bottom: parent.top
                anchors.bottomMargin: 5
            }
        }

    }

    Button {
        id: button
        text: qsTr("Save")
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
    }
}
