import QtQuick 2.0

import QtQuick 2.11
import QtQuick.Window 2.2
import QtQuick.Controls.Styles 1.4

import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
import QtQuick.Dialogs 1.1

ApplicationWindow{
    id:root
    title: "Settings"
    property int currentTextSize: 0
    property color currentTextColor: "red"
    minimumWidth: 300
    minimumHeight: 335

    signal fondInfo(string newFont, string newColor)

    maximumHeight: minimumHeight
    maximumWidth: minimumWidth

    onClosing: {

    }
    Rectangle {
        id: mainRectangle
        anchors.fill: parent
        anchors.margins: 10
        border.color: "red"
        border.width: 3
        Component.onCompleted: {
            console.log("Color"+currentTextColor)
            console.log("Size"+currentTextSize)
        }

        Column {
            id: column
            anchors.fill: parent
            anchors.margins: 5
            spacing: 5


            Text {
                id: sizeText
                text: qsTr("Text Size:")
                font.pixelSize: 12

            }
            Slider {
                id: sliderHorizontal
                maximumValue: 30
                minimumValue: 5
                stepSize: 1
                anchors {left: parent.left; right: parent.right}
                style: SliderStyle {

                }
                Component.onCompleted: {
                    value = currentTextSize
                }
                onValueChanged: {
                    console.log(buttonY)
                }
            }
            ColorDialog {
                id: colorDialog
                modality: Qt.WindowModal
                title: "Choose a color"
                color: "green"
                showAlphaChannel: colorDialogAlpha.checked
                onAccepted: { console.log("Accepted: " + color) }
                onRejected: { console.log("Rejected") }
                Component.onCompleted: {
                    color = currentTextColor
                }
            }
            Row {
                anchors {right: parent.right; left: parent.left}
                spacing: 10
                Text {
                    id: colorText
                    text: qsTr("Text Color:")
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
                title: qsTr("Preview Box")

                Text {
                    id: previewText
                    text: qsTr("text")
                    font.pointSize: sliderHorizontal.value
                    color: colorDialog.color

                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter

                }
                Component.onCompleted: {
                       myHeight = height
                }
            }
            Text {
                id: backgroundText
                text: qsTr("Background Color:")
                anchors.left: parent.left
                font.pixelSize: 12

            }
            GridLayout {
                id: gridColors
                anchors {left: parent.left; right: parent.right}
                columns: 4
                columnSpacing : 5

                Rectangle {Layout.alignment: Qt.AlignHCenter; color: "red"; width: 50; height: 50; radius: 7; border.color: black; border.width: 2}
                Rectangle {Layout.alignment: Qt.AlignHCenter; color: "green"; width: 50; height: 50; radius: 7; border.color: black; border.width: 2 }
                Rectangle {Layout.alignment: Qt.AlignHCenter; color: "yellow"; width: 50; height: 50; radius: 7; border.color: black; border.width: 2 }
                Rectangle {Layout.alignment: Qt.AlignHCenter; color: "black"; width: 50; height: 50; radius: 7; border.color: black; border.width: 2 }
                Rectangle {Layout.alignment: Qt.AlignHCenter; color: "orange"; width: 50; height: 50; radius: 7; border.color: black; border.width: 2 }
                Rectangle {Layout.alignment: Qt.AlignHCenter; color: "blue"; width: 50; height: 50; radius: 7; border.color: black; border.width: 2 }
                Rectangle {Layout.alignment: Qt.AlignHCenter; color: "steelblue"; width: 50; height: 50; radius: 7; border.color: black; border.width: 2 }
                Rectangle {Layout.alignment: Qt.AlignHCenter; color: "#B45F04"; width: 50; height: 50; radius: 7; border.color: black; border.width: 2 }
            }
            RowLayout{
                id: btnRow
                anchors {left: parent.left; right: parent.right; bottom: mainRectangle.top}
                Button {
                    id: applyBtn
                    text: "Apply"
                    Layout.alignment: Qt.AlignHCenter;
                    onClicked: {
                        currentTextColor = colorDialog.color
                        currentTextSize = sliderHorizontal.value

                        root.fondInfo(currentTextColor,currentTextSize)
                    }
                }
            }
        }



    }
}
