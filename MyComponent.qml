import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

ColumnLayout {
    id:root
    state: "normal"
    property int myIndex: 0
    property alias placeholderText: field.placeholderText
    property alias fieldLength: field.length
    property alias textFieldObj: field
    property alias error: errorMsg.text


    TextField {
        id: field
        Layout.fillWidth: true
        onTextChanged:
        {
            for(var i = 0;i < myModel.count; i++)
            {
                var modelItem = myModel.get(i);
                if(modelItem.isErrorSupport)
                {
                    var loader = fieldsrep.itemAt(i)
                    if(loader.item.textFieldObj === this)
                    switch(modelItem.label)
                    {
                        case "Login":
                            if(length == 0) error = ""
                            if(length > 0 && length < 4)
                            {
                                error = "%1 is busy !!!".arg(modelItem.label)
                                root.state = "busyLogin"

                            }
                            if(length >= 4)
                            {
                                error = "%1 is new !!!".arg(modelItem.label)
                                root.state = "newLogin"

                            }
                            break

                        case "Password":
                            if(length == 0) error = ""
                            if(length > 0 && length < 8)
                            {
                                error = "%1 is unsafe".arg(modelItem.label)
                                root.state = "unsafePassword"

                            }
                            if(length >= 8  && length < 12)
                            {
                                error = "%1 is norm".arg(modelItem.label)
                                root.state = "normPassword"

                            }
                            if(length >= 12)
                            {
                                error = "%1 is safe".arg(modelItem.label)
                                root.state = "safePassword"

                            }
                            break
                    }
                }
            }
        }
    }

    Text {
        id: errorMsg
        visible: text.length > 0
        font.pixelSize: 20
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
        },

        State {
            name: "newLogin"
            PropertyChanges { target: errorMsg
                color: "#2eea16"
            }
        },
        State {
            name: "busyLogin"
            PropertyChanges { target: errorMsg
                color: "#ff0000"
            }
        },
        State {
            name: "unsafePassword"
            PropertyChanges {
                target: errorMsg
                color: "#ff0000"
            }
        },
        State {
            name: "normPassword"
            PropertyChanges {
                target: errorMsg
                color: "#f7862f"
            }
        },
        State {
            name: "safePassword"
            PropertyChanges {
                target: errorMsg
                color: "#2eea16"
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
