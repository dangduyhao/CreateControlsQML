import QtQuick 2.6

Rectangle {
    width: 1200
    height: 500
    color: "#95a5a6"

    Image {
        source: "images/bg.jpg"
        fillMode: Image.PreserveAspectFit
    }

    Rectangle {
        id: submit
        width: 100; height: 30
        x: 550; y: 250
        color: "#2c3e50"
        visible: false

        Text {
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.family: "Ubuntu"
            font.pixelSize: 20
            font.bold: true
            text: "Submit"
            color: "#ecf0f1"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                checkSecurity()
            }
        }
    }

    Rectangle {
        id: boxInput
        anchors.left: parent.left; anchors.leftMargin: 100
        anchors.right: parent.right; anchors.rightMargin: 100
        anchors.top: parent.top; anchors.topMargin: 100
        height: 100
        color: "white"
        opacity: 0.9

        TText {
            id: input
            anchors.fill: parent
            focus: true
            Component.onCompleted: {
                input.onTextChanged.connect(enableSubmit)
            }
        }
    }
        Text {
            anchors.top: boxInput.bottom; anchors.topMargin: 100
            anchors.horizontalCenter: boxInput.horizontalCenter
            font.family: "Ubuntu"
            font.pixelSize: 24
            font.bold: true
            style: Text.Outline; styleColor: "#34495e"
            color: "#ecf0f1"
            text: qsTr("----------------------------------------\nNhập '12345678' rồi ấn Submit để sang mục tra điểm sinh viên")
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

    function enableSubmit() {
        if (input.text.length < 20)
        {
            input.focus = true
            if (input.text.length >= 3 && input.text.length <= 8)
            {
                submit.visible = true
            }
            else
            {
                submit.visible = false
            }
        }
        else
        {
            input.focus = false
        }
    }

    function checkSecurity() {
        if (input.text === "12345678")
            mainComponent.source = "qrc:/Student.qml"
    }


}
