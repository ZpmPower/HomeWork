import QtQuick 2.9
import QtQuick.Window 2.2

import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
import QtQuick.Controls 2.2 as QQ2

import MyListModel 1.0
import MyAnimalModel 1.0

Window {
    id: window
    visible: true
    width: 400
    height: 500
    minimumHeight: 500
    minimumWidth: 400
    title: qsTr("Test Messager")
    color: "orange"


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

        ColumnLayout {
            id: mainColumn
            anchors.fill: parent
            Rectangle{
                id: messageRect
                width: parent.width
                height: window.height/2
                border.width: 1.5
                border.color: "#b37400"
                radius: 5

                anchors {left: parent.left; right: parent.right; top: parent.top;
                    leftMargin: 5;rightMargin: 5;topMargin: 5}
                ListView {
                    id: listView
                    anchors.fill: parent
                    anchors.margins: 5
                    //clip: true
                    //flickableDirection: Flickable.VerticalFlick
                    model: ListModel
                    {id: messageModel}
                    delegate: Item {
                        width: 180; height: 40
                        Column {
                            Text { text: '<b>Message:</b> ' + name; wrapMode:Text.WordWrap }
                            Text { text: date }
                        }
                    }
                    QQ2.ScrollBar.vertical: QQ2.ScrollBar {}
                }


            }
            Text {
                id: text1
                text: qsTr("Type text:")
                font.pixelSize: 12
                anchors.left: parent.left
                anchors.leftMargin: 5
            }


            RowLayout {
                id: rowFieldBtn
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.margins: 5

                TextField {
                    id: textField
                    width: parent.width - sendBtn.width
                    height: 23
                    anchors.right: sendBtn.left
                    anchors.rightMargin: 5
                    anchors.left: parent.left

                }

                Button {
                    id: sendBtn
                    text: qsTr("Send")
                    anchors.right: parent.right
                    height: textField.height

                    onClicked:
                    {
                       messageModel.append({name: textField.text, date: Qt.formatDateTime(new Date(), "hh:mm dd.MM.yy")})
                       textField.text=""
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

                        model: MyListModel {}

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
                                    textField.insert(textField.length,smile.text)
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

                    PathView {
                        id: view1
                        anchors {left: parent.left; right: parent.right; top: parent.top}
                        width: parent.width/2
                        preferredHighlightBegin: 0.5
                        preferredHighlightEnd: 0.5
                        focus: true
                        clip: true

                        pathItemCount: 12
                        model: MyAnimalModel {}

                        path: Path {
                            startY: (2*parent.y+parent.height)/2
                            startX: parent.x

                            PathCubic {
                                x: parent.width
                                y: (2*parent.y+parent.height)/2
                                control2X: 591
                                control2Y: (2*parent.y+parent.height)/2
                                control1Y: (2*parent.y+parent.height)/2
                                control1X: 424.333
                            }
                        }
                        delegate: Rectangle {
                            id: delegateRect
                            width: view1.height/4
                            height: view1.height/4
                            MouseArea {
                                id: mouseAreaPath1
                                anchors.fill: parent
                                onClicked:
                                {

                                    textField.insert(textField.length,smilePath1.text)
                                }
                            }
                            Text {
                                id: smilePath1
                                text: mIcon
                                font.pixelSize: 18
                                font.bold: true
                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.verticalCenter: parent.verticalCenter
                            }
                        }


                    }

                }
            }
        }
    }
}



