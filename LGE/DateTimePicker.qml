import QtQuick 2.6

Rectangle {
    id: pickerArea
    width: 100
    height: 200
    color: "#ecf0f1"
    opacity: 0.8

    property var modelPicker: 10

    Rectangle {
        width: parent.width * 0.8
        height: parent.height * 0.01
        anchors.horizontalCenter: parent.horizontalCenter
        y: parent.height / 3 - height / 2
        color: "#1abc9c"
    }

    Rectangle {
        width: parent.width * 0.8
        height: parent.height * 0.01
        anchors.horizontalCenter: parent.horizontalCenter
        y: 2 * parent.height / 3 - height / 2
        color: "#1abc9c"
    }

    ListView {
        id: dateScroll
        anchors.horizontalCenter: pickerArea.horizontalCenter
        anchors.verticalCenter: pickerArea.verticalCenter
        width: pickerArea.width
        height: pickerArea.height / 3
        snapMode: ListView.SnapToItem

        model: modelPicker

        delegate: Rectangle {
            width: pickerArea.width
            height: pickerArea.height / 3
            color: "Transparent"

            Text {
                anchors.centerIn: parent
                font.family: "Ubuntu"
                font.bold: true
                font.pixelSize: 18
                color: "#2c3e50"
                text: isNumber(modelData) ? modelData + 1 : modelData
            }
        }
    }
}
