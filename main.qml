import QtQuick 2.9
import QtQuick.Window 2.2

import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
import QtQuick.Controls 2.2 as QQ2
import QtGraphicalEffects 1.0
import QtQuick.Dialogs 1.3
import QtTest 1.0
import Clipboard 1.0

//import EmojiModels 1.0

Window {
    id: window
    visible: true
    width: 400
    height: 500
    minimumHeight: 500
    minimumWidth: 400
    title: qsTr("Test Messager")
    color: "orange"

    Clipboard{id: clipboard}

    Rectangle {
        id: rectangle
        width: 200
        height: 200
        color: "#ffffff"
        anchors.fill: parent
        anchors.margins: 10
        border.color: "black"
        border.width: 3
        radius: 10

        Item {
            focus: true
            Keys.onEscapePressed: {
              window.close()
            }
        }


        ColumnLayout {
            id: mainColumn
            anchors.fill: parent
            Rectangle{
                id: messageRect
                width: parent.width
                height: window.height/2
                anchors
                {
                    top: parent.top
                    left: parent.left
                    right: parent.right
                }

                border.width: 1.5
                border.color: "#b37400"
                radius: 5

                anchors {left: parent.left; right: parent.right; top: parent.top;
                    leftMargin: 5;rightMargin: 5;topMargin: 5}
                ListView {
                    id: listView
                    anchors.fill: parent
                    anchors.margins: 5
                    model: ListModel
                    {
                        id: messageModel
                    }
                    highlight: Rectangle { color: "#ffedcc"; radius: 5 }
                    clip: true
                    focus: true
                    spacing: 5
                    delegate: Item {
                        id: itemMessage
                        property string mess_text: messText.message
                        implicitWidth: parent.width
                        implicitHeight: dateMsg.implicitHeight+messText.implicitHeight+ messImage.height
                        MouseArea {
                            id: messageArea
                            anchors.fill: parent
                            hoverEnabled: true
                            acceptedButtons: Qt.LeftButton | Qt.RightButton
                            onHoveredChanged: listView.currentIndex = index
                            onClicked: if (mouse.button === Qt.RightButton)contextMenu.popup()


                            Menu {
                                    id: contextMenu
                                    MenuItem { text: "Copy"; shortcut: StandardKey.Copy
                                    onTriggered: {
                                        clipboard.text = listView.currentItem.mess_text
                                    }}
                                    MenuItem { text: "Delete"; shortcut: "delete"}
                                }

                            Column {
                                id: messageLine
                                anchors.fill: parent
                                Text {
                                    id: messText
                                    property string message: name
                                    text: '<b>Message:</b> ' + name
                                    wrapMode: Text.Wrap
                                    width: parent.width
                                    height: paintedHeight
                                    focus: true
                                }
                                Image {
                                    id: messImage
                                    width: 0
                                    height: 0
                                    source: pathImage

                                    Component.onCompleted: { if(pathImage != "none") height = 50; width = 50}
                                }

                                Text { id: dateMsg; text: date }
                            }
                        }
                        QQ2.ScrollBar.vertical: QQ2.ScrollBar {}
                    }


                }
            }
            Text {
                id: text1
                text: qsTr("Type text:")
                font.pixelSize: 12
                anchors.left: parent.left
                anchors.leftMargin: 5
                anchors.bottom: rowFieldBtn.top
                anchors.bottomMargin: 5
            }
            Row {
                id: rowFieldBtn
                anchors.left: parent.left
                anchors.right: parent.right
                height: 50
                anchors.margins: 5
                Rectangle{
                    width: parent.width  - sendBtn.width - 5
                    implicitHeight: parent.height
                    anchors.right: sendBtn.left
                    anchors.rightMargin: 5
                    anchors.left: parent.left
                    border.color: "orange"
                    border.width: 1

                    TextArea {
                        id: textArea
                        focus: true
                        anchors.fill: parent
                        anchors.margins: 1
                        wrapMode: TextEdit.Wrap
                        Keys.onPressed: {
                                if ( event.key === Qt.Key_Return && event.key === Qt.Key_Shift) console.log("hhhhhhhhhhh")
                        }
                    }

                }
                Rectangle{
                    id: sendRect
                    height: parent.height
                    width: parent.width/6
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom

                    Row {
                        id: rowLayout
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: sendBtn.top

                        Rectangle
                        {
                            id: smileRectangle
                            anchors.left: parent.left
                            anchors.top: parent.top
                            anchors.bottom: parent.bottom
                            width: parent.width/2

                            MouseArea{
                                anchors.fill: parent
                                hoverEnabled: true
                                property bool openEmoji: false
                                Image {
                                    id: emojiImage
                                    fillMode: Image.PreserveAspectFit
                                    width: parent.width
                                    height: parent.height
                                    source: "smile.png"
                                }
                                Colorize {
                                    id: colorizeSmile
                                    anchors.fill: emojiImage
                                    source: emojiImage
                                    hue: 0.0
                                    saturation: 0.0
                                    lightness: 0.0

                                    NumberAnimation{id: opacTo1; target: colorizeSmile; property: "opacity";from: 0; to: 1; duration: 1000 }
                                    NumberAnimation{id: opacTo0; target: colorizeSmile;property: "opacity";from: 1; to: 0; duration: 1000 }
                                }
                                onClicked: {
                                    if(openEmoji) {
                                        tableView.visible = false
                                        messageRect.anchors.bottom = text1.top
                                        openEmoji = false
                                    }
                                    else {
                                        tableView.visible = true
                                        messageRect.height = window.height/2
                                        openEmoji = true
                                    }
                                    openEmoji ? opacTo0.start() : opacTo1.start()

                                    //console.log(messageRect.height)
                                }
                            }
                        }
                        Rectangle {
                            id: imageRectangle
                            anchors.left: smileRectangle.right
                            anchors.top: parent.top
                            anchors.bottom: parent.bottom
                            anchors.right: parent.right
                            anchors.bottomMargin: 4

                            MouseArea{
                                anchors.fill: parent
                                hoverEnabled: true
                                Image {
                                    id: imageIcon
                                    fillMode: Image.PreserveAspectFit
                                    anchors{
                                        horizontalCenter: parent.horizontalCenter
                                        verticalCenter: parent.verticalCenter
                                    }
                                    width: parent.width
                                    height: parent.height
                                    source: "imageIcon.png"

                                }

                                Colorize {
                                    id: colorizeImage
                                    anchors.fill: imageIcon
                                    source: imageIcon
                                    hue: 0.0
                                    saturation: 0.0
                                    lightness: 0.0

                                    NumberAnimation{id: opacTo1Image; target: colorizeImage; property: "opacity";from: 0; to: 1; duration: 1000 }
                                    NumberAnimation{id: opacTo0Image; target: colorizeImage; property: "opacity";from: 1; to: 0; duration: 1000 }
                                }
                                FileDialog {
                                        id: fileDialogLoad
                                        property string currentPath: ""
                                        folder: "."
                                        title: "Choose a file to open"
                                        selectMultiple: false
                                        nameFilters: [ "Image files (*.png *.jpg)", "All files (*)" ]
                                        onAccepted: {
                                            currentPath = fileUrl.toString()
                                            if(currentPath)
                                            {
                                                opacTo0Image.start()
                                            }
                                        }
                                    }
                                onClicked: {
                                    fileDialogLoad.open()
                                    //fileDialogLoad.currentPath.length ? opacTo1Image : opacTo0Image
                                }
                            }

                        }
                    }


                    Button {
                        id: sendBtn
                        anchors.bottom: parent.bottom
                        width: parent.width
                        text: qsTr("Send")
                        anchors.bottomMargin: 0
                        height: 20

                        onClicked:
                        {
                            var path = fileDialogLoad.currentPath
                            if(textArea.length || path.length)
                            {
                                if(path.length == 0)
                                {
                                    path = "none"
                                }

                                messageModel.append({name: textArea.text,
                                                     date: Qt.formatDateTime(new Date(), "hh:mm dd.MM.yy"),
                                                     pathImage: path})
                                if(path != "none") opacTo1Image.start()
                                textArea.text=""
                                fileDialogLoad.currentPath = ""
                                imageLoaded.text = ""
                            }
                        }
                    }

                }
            }
            TabView {
                id: tableView
                anchors.top: rowFieldBtn.bottom

                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.margins: 5

                Tab {
                    title: qsTr("Smileys")
                    id: tab
                    GridView {
                        id: gridView
                        height: 140
                        anchors.fill: parent
                        clip: true
                        cellWidth: 40
                        cellHeight: 40
                        highlight: Rectangle { color: "lightsteelblue"; radius: 5 }
                        focus: true

                        model: emojiSmileysModel

                        delegate: Item {
                            id: gridItem
                            width: gridView.cellWidth
                            height: gridView.cellHeight
                            MouseArea {
                                id: mouseArea
                                anchors.fill: parent
                                hoverEnabled: true

                                onHoveredChanged: gridView.currentIndex = index

                                onClicked:
                                {
                                    textArea.insert(textArea.length,smile.text)
                                    scaleAnimate.start()

                                }
                                SequentialAnimation {
                                    id: scaleAnimate
                                    NumberAnimation { target: gridItem; properties: "scale"; to: 1.5; duration: 250}
                                    NumberAnimation { target: gridItem; properties: "scale"; to: 1.0; duration: 250}
                                }
                            }
                            Text {
                                id: smile
                                text: mIcon
                                font.pixelSize: 18
                                font.bold: true
                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.verticalCenter: parent.verticalCenter
                            }
                        }
                    }
                }
                Tab {
                    title: qsTr("Animals")

                    GridView {
                        id: gridViewAnimals
                        height: 140
                        anchors.fill: parent
                        clip: true
                        cellWidth: 40
                        cellHeight: 40
                        highlight: Rectangle { color: "lightsteelblue"; radius: 5 }
                        focus: true

                        model: models.getModel(1)//emojiAnimalModel

                        delegate: Item {
                            id: gridItemAnimals
                            width: gridViewAnimals.cellWidth
                            height: gridViewAnimals.cellHeight
                            MouseArea {
                                id: mouseAreaAnimals
                                anchors.fill: parent
                                hoverEnabled: true

                                onHoveredChanged: gridViewAnimals.currentIndex = index

                                onClicked:
                                {
                                    textArea.insert(textArea.length,smileAnimals.text)
                                    scaleAnimate.start()

                                }
                                SequentialAnimation {
                                    id: scaleAnimateAnimals
                                    NumberAnimation { target: gridItemAnimals; properties: "scale"; to: 1.5; duration: 250}
                                    NumberAnimation { target: gridItemAnimals; properties: "scale"; to: 1.0; duration: 250}
                                }
                            }
                            Text {
                                id: smileAnimals
                                text: mIcon
                                font.pixelSize: 18
                                font.bold: true
                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.verticalCenter: parent.verticalCenter
                            }
                        }
                    }

                }
                Component.onCompleted:
                {
                    visible = false
                    messageRect.anchors.bottom = text1.top
                }
            }
        }
    }
}



