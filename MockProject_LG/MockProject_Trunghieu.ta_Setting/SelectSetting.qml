import QtQuick 2.6

Rectangle {
    id: rectSetting
    width: 267
    height: 69
    property alias text: nameSetting.text
    signal selectApp()
    color: "black"
    border.color: "gray"
    border.width: 1

    Text {
        id: nameSetting
        anchors.centerIn: parent
        font.pointSize: 15
        color: "white"
    }
    MouseArea {
        anchors.fill: parent
        onClicked: selectApp()
    }
}
