import QtQuick 2.11
import QtQuick.Window 2.2

import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
import QtQuick.Dialogs 1.1
import QtMultimedia 5.8

ApplicationWindow{
    id:root
    title: Language.settings

    property alias sliderValue: sliderHorizontal.value
    property alias dialogColor: colorDialog.color
    property color bgColor: "orange"


    signal fondInfo (int newSize, color newColor)

    minimumWidth: 300
    minimumHeight: 405
    maximumHeight: minimumHeight
    maximumWidth: minimumWidth

    Rectangle {
        id: mainRectangle
        anchors.fill: parent
        anchors.margins: 10
        border.color: bgColor
        border.width: 3

        Column {
            id: column
            anchors.fill: parent
            anchors.margins: 5
            spacing: 8


            Text {
                id: sizeText
                text: Language.textSize
                font.pixelSize: 12

            }
            Slider {
                id: sliderHorizontal
                maximumValue: 30
                minimumValue: 5
                stepSize: 1
                tickmarksEnabled: true
                anchors {left: parent.left; right: parent.right}
                Text {
                    text: "MIN"
                    font.pointSize: 5
                    anchors.bottom: sliderHorizontal.top
                    anchors.left: sliderHorizontal.left
                  }
                  Text {
                    text: "MAX"
                    font.pointSize: 5
                     anchors.bottom: sliderHorizontal.top
                    anchors.right: sliderHorizontal.right
                  }
            }
            ColorDialog {
                id: colorDialog
                modality: Qt.WindowModal
                title: "Choose a color"
                color: "green"
            }
            Row {
                anchors {right: parent.right; left: parent.left}
                spacing: 10
                Text {
                    id: colorText
                    text: Language.textColor
                    font.pixelSize: 12

                }
                Rectangle {
                    width: 15
                    height: 15
                    color: colorDialog.color
                    MouseArea {
                        anchors.fill: parent
                        onClicked: colorDialog.open()

                    }
                }
            }
            GroupBox {
                id: groupBox
                property int myHeight: 0
                anchors {left: parent.left; right: parent.right}
                height: previewText.height + 25
                title: Language.previewBox

                Text {
                    id: previewText
                    text: qsTr("text")
                    font.pointSize: sliderHorizontal.value
                    color: colorDialog.color

                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter

                }
            }
            RowLayout{
                id: btnRow
                anchors {left: parent.left; right: parent.right}
                Button {
                    id: applyBtn
                    text: Language.applyBtn
                    Layout.alignment: Qt.AlignHCenter;
                    onClicked: {
                        root.fondInfo(colorDialog.color,sliderHorizontal.value)
                        window.minimumHeight = 400
                        console.log(window.minimumHeight)
                    }
                }
            }
            Text {
                id: backgroundText
                text: Language.bgColor
                anchors.left: parent.left
                font.pixelSize: 12

            }
            GridLayout {
                id: gridColors
                anchors {left: parent.left; right: parent.right}
                columns: 4
                columnSpacing : 5

                Rectangle {id: redRectangle; Layout.alignment: Qt.AlignHCenter; color: "red"; width: 50; height: 50; radius: 7; border.color: "black"; border.width: 2; MouseArea{ anchors.fill:  parent; onClicked: bgColor = parent.color} }
                Rectangle {id: greenRectangle; Layout.alignment: Qt.AlignHCenter; color: "green"; width: 50; height: 50; radius: 7; border.color: "black"; border.width: 2; MouseArea{ anchors.fill:  parent; onClicked: bgColor = parent.color} }
                Rectangle {id: yellowRectangle; Layout.alignment: Qt.AlignHCenter; color: "yellow"; width: 50; height: 50; radius: 7; border.color: "black"; border.width: 2; MouseArea{ anchors.fill:  parent; onClicked: bgColor = parent.color} }
                Rectangle {id: blackRectangle; Layout.alignment: Qt.AlignHCenter; color: "black"; width: 50; height: 50; radius: 7; border.color: "black"; border.width: 2; MouseArea{ anchors.fill:  parent; onClicked: bgColor = parent.color} }
                Rectangle {id: orangeRectangle; Layout.alignment: Qt.AlignHCenter; color: "orange"; width: 50; height: 50; radius: 7; border.color: "black"; border.width: 2; MouseArea{ anchors.fill:  parent; onClicked: bgColor = parent.color} }
                Rectangle {id: blueRectangle; Layout.alignment: Qt.AlignHCenter; color: "blue"; width: 50; height: 50; radius: 7; border.color: "black"; border.width: 2; MouseArea{ anchors.fill:  parent; onClicked: bgColor = parent.color} }
                Rectangle {id: steelRectangle; Layout.alignment: Qt.AlignHCenter; color: "steelblue"; width: 50; height: 50; radius: 7; border.color: "black"; border.width: 2; MouseArea{ anchors.fill:  parent; onClicked: bgColor = parent.color} }
                Rectangle {id: brownRectangle; Layout.alignment: Qt.AlignHCenter; color: "#B45F04"; width: 50; height: 50; radius: 7; border.color: "black"; border.width: 2; MouseArea{ anchors.fill:  parent; onClicked: bgColor = parent.color} }
            }

            GroupBox {
                id: groupLanguage
                title: Language.language
                anchors.left: parent.left
                anchors.right: parent.right

                Row {
                    ExclusiveGroup { id: tabPositionGroup }
                    RadioButton {
                        text: checked ? "English" : "Английский"
                        checked: true
                        width: groupLanguage.width/2
                        exclusiveGroup: tabPositionGroup
                        onClicked: {
                            Language.setLanguage("EN")
                        }
                    }
                    RadioButton {
                        text: checked ? "Русский" : "Russian"
                        exclusiveGroup: tabPositionGroup
                        onClicked: {
                            Language.setLanguage("RU")
                        }
                    }
                }
            }


        }



    }
}
