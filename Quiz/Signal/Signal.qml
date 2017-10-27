import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Signal")

    Rectangle {
        id: submit
        width: 100; height: 30
        x: (parent.width - width)/2; y: 300
        color: "#2c3e50"
        visible: false

        Text {
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.family: Ubuntu
            font.pixelSize: 20
            font.bold: true
            text: "Submit"
            color: "#ecf0f1"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                Qt.quit()
            }
        }
    }

    Rectangle {
        anchors.left: parent.left; anchors.leftMargin: 100
        anchors.right: parent.right; anchors.rightMargin: 100
        anchors.top: parent.top; anchors.topMargin: 100
        height: 50
        color: "white"

        TText {
            id: input
            width: parent.width
            focus: true
            Component.onCompleted: {
                input.onTextChanged.connect(enableSubmit)
            }
        }
    }

    function enableSubmit() {
        if (input.text.length >= 3 && input.text.length <= 8)
        {
            submit.visible = true
        }
        else
        {
            submit.visible = false
        }
    }

}
