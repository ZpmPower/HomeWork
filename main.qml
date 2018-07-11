import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import "./"

Window {
    visible: true
    width: 640
    height: 480
//    title: qsTr("Hello World")

    ColumnLayout
    {
        id:columnL
        property real globalPadding: 10

        anchors.fill:parent
        anchors.margins: globalPadding

        ListModel {
            id: myModel
            ListElement {
                label: "Login"
                isErrorSupport: true
            }

            ListElement {
                label: "Password"
                isErrorSupport: true
            }

            ListElement {
                label: "E-Mail"
                isErrorSupport: false
            }
        }

        Component {
            id:textFieldComponent

            TextField {
                property int myIndex: 0
                Layout.fillWidth: true

                Component.onCompleted: {
                    console.log("fields" + textFieldComponent.myIndex);
                }
            }
        }

        Component {
            id:myComponent

             MyComponent {

             }
        }


        GridLayout {

            id:gridLayout
            Layout.fillWidth: true
            flow: GridLayout.TopToBottom
            Layout.alignment: Qt.AlignTop

            rows: myModel.count

            Repeater {
                id: textrep
                model: myModel
                Text {
                    text: label
                    Layout.alignment: Qt.AlignTop
                    Component.onCompleted: {
                        console.log("label " + index + " completed");
                    }
                }
            }

            Repeater {
                id:fieldsrep
                model:myModel

                Loader {
                    Layout.fillWidth:true

                    sourceComponent: {
                        if(isErrorSupport)
                        {
                            myComponent
                        }
                        else
                        {
                            textFieldComponent
                        }
                    }

                    onLoaded: {
                        item.myIndex = index
                        item.placeholderText = label
                        console.log(label + " input loaded")
                    }
                }
            }

        }

        GroupBox {
            title: "Comments"
            Layout.fillWidth: true
            Layout.fillHeight: true

            TextArea {
                Layout.fillWidth: true
                Layout.fillHeight: true
            }
        }

        Button {
            id: myButton
            Layout.alignment: Qt.AlignRight
            text: "Save"

            onClicked: {
//                for(var i = 0;i < myModel.count; i++)
//                {
//                    var modelItem = myModel.get(i);
//                    if(modelItem.isErrorSupport)
//                    {
//                        var loader = fieldsrep.itemAt(i);
//                        switch(modelItem.label)
//                        {
//                            case "Login":

//                                if(loader.item.fieldLength > 0 && loader.item.fieldLength < 4)
//                                {
//                                    loader.item.error = "%1 is busy !!!".arg(modelItem.label)
//                                    loader.item.state = "busyLogin"

//                                }
//                                if(loader.item.fieldLength >= 4)
//                                {
//                                    loader.item.error = "%1 is new !!!".arg(modelItem.label)
//                                    loader.item.state = "newLogin"

//                                }

//                                break;

//                            case "Password":

//                                if(loader.item.fieldLength > 0 && loader.item.fieldLength < 8)
//                                {
//                                    loader.item.error = "%1 is unsafe".arg(modelItem.label)
//                                    loader.item.state = "unsafePassword"

//                                }
//                                if(loader.item.fieldLength >= 8  && loader.item.fieldLength < 12)
//                                {
//                                    loader.item.error = "%1 is norm".arg(modelItem.label)
//                                    loader.item.state = "normPassword"

//                                }
//                                if(loader.item.fieldLength >= 12)
//                                {
//                                    loader.item.error = "%1 is safe".arg(modelItem.label)
//                                    loader.item.state = "safePassword"

//                                }
//                                break;

//                        }

////                        if(loader.item.fieldLength == 0)
////                        {
////                            loader.item.state == "normal" ? loader.item.state = "error" : loader.item.state = "normal"
////                        }
////                        else loader.item.error = ""


//                    }
//                    console.log(loader.item.text)
//                }
            }
        }


    }




}
