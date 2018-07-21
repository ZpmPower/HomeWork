import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("My Shop")
    color: "green"

    ListModel {
        id: myModel
        ListElement {
            title: "7Up"
            image: "images/7up"
            cost: "21.6"
        }

        ListElement {
            title: "Fanta"
            image: "images/Fanta"
            cost: "21.6"
        }

        ListElement {
            title: "Coca-Cola"
            image: "images/Coca-Cola"
            cost: "22.6"
        }

        ListElement {
            title: "Mirinda"
            image: "images/Mirinda"
            cost: "24.6"
        }

        ListElement {
            title: "Sprite"
            image: "images/Sprite"
            cost: "23.6"
        }

        ListElement {
            title: "Shweps"
            image: "images/Shweps"
            cost: "20.6"
        }

        ListElement {
            title: "Pepsi"
            image: "images/Pepsi"
            cost: "20.5"
        }

        ListElement {
            title: "Doctor Pepper"
            image: "image://async/www.marqafoods.com/media/catalog/product/cache/1/thumbnail/100x/9df78eab33525d08d6e5fb8d27136e95/c/a/can-dpv.png"
            cost: "25"
        }

        ListElement {
            title: "Lipton"
            image: "image://async/berger-steak.ru/wp-content/uploads/2017/05/lipton06-550x650-100x100.png"
            cost: "15"
        }

        ListElement {
            title: "Pepsi Lite"
            image: "image://async/cdn.shopify.com/s/files/1/2206/5873/products/Diet_Pepsi_2L_small.png?v=1524340930"
            cost: "19"
        }
    }
    RowLayout{
        id: row
        anchors.fill: parent
        anchors.margins: 10


        ColumnLayout{
            id:leftColumn
            spacing: 20
            height: parent.height
            width: parent.width/2

            Rectangle{
                id:rectangle
                anchors.fill: parent
                border.color: "black"
                border.width: 1
                GridView{
                    id:grid
                    anchors.bottom: parent.bottom
                    anchors.right: parent.right
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.bottomMargin: 0
                    focus: true
                    clip: true

                    model: myModel
                    cellWidth: 120
                    cellHeight: 120
                    highlight: Rectangle { width: 80; height: 80; color: "#d7dbff" }

                    delegate: Item {
                        width: grid.cellWidth
                        height: grid.cellHeight

                        MouseArea{
                            anchors.fill: parent
                            hoverEnabled: true
                            ColumnLayout {
                                id: column
                                anchors.centerIn: parent
                                spacing: 0

                                Image {
                                    width: 50
                                    height: 50
                                    fillMode: Image.PreserveAspectFit
                                    mipmap: true
                                    cache: true

                                    source: image
                                    onStateChanged: {
                                        console.log(state);
                                    }

                                }
                                Text {
                                    id: titletext
                                    text: title + " - " + cost
                                    Layout.alignment: Qt.AlignHCenter
                                }

                            }
                            onHoveredChanged: grid.currentIndex = index
                            onClicked:
                            {
                                var element = myModel.get(index)
                                var found = false
                                for(var i=0; i<appModel.count;i++)
                                {
                                    if(appModel.get(i).name == element.title)
                                    {
                                        found = true
                                        appModel.get(i).number++
                                    }
                                }
                                if(!found)
                                {

                                    appModel.append({"costOfOne": element.cost, "name": element.title, "number": 1, "wholePrice":0})
                                }
                            }
                        }
                    }
                }

            }
        }
        ListModel {
            id: appModel
        }
        ColumnLayout{
            id:rightColumn
            width: parent.width/2
            height: parent.height

            Rectangle{
                id: rectangle1
                border.color: "black"
                border.width: 1
                anchors.fill: parent

                GridLayout  {
                    id:gridLayout
                    anchors.right: parent.right
                    anchors.rightMargin: 10
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.top: parent.top
                    anchors.topMargin: 10
                    Layout.fillWidth: true
                    flow: GridLayout.TopToBottom
                    Layout.alignment: Qt.AlignTop

                    rows: appModel.count

                    Repeater {
                        id: textrep
                        model: appModel
                        Text {
                            id: product
                            text: name
                            Layout.alignment: Qt.AlignCenter
                        }
                    }
                    Repeater {
                        id: spinrep
                        model:appModel

                        SpinBox{
                            id: spin
                            property string productName: name

                            value: number
                            onValueChanged:
                            {
                                var summa = 0
                                var ind = null
                                for(var i=0; i<appModel.count;i++)
                                {
                                    if(appModel.get(i).name == productName)
                                    {
                                        if(value == 0)
                                        {
                                            appModel.get(i).wholePrice = 0
                                            ind = i
                                        }
                                        appModel.get(i).wholePrice = Math.ceil(appModel.get(i).costOfOne * value)
                                    }
                                    summa+= appModel.get(i).wholePrice
                                }
                                summ.summa = summa
                                if(ind != null) appModel.remove(ind)

                            }
                        }
                    }
                    Repeater {
                        id: costrep
                        model:appModel
                        Text {
                            text: "$"+ wholePrice
                            Layout.alignment: Qt.AlignCenter
                        }
                    }
                }

                Text {
                    id: summ
                    property double summa: 0
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    anchors.margins: 10

                    text: "$" + summa
                }
            }
        }
    }
}


