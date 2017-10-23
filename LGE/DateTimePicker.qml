import QtQuick 2.6

Rectangle {
    width: 100
    height: 200
    color: "#ecf0f1"
    opacity: 0.8

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


}
