import QtQuick 2.8

Rectangle {
    width: 480
    height: 580
    color: "#6C7A89"

    Text {
        anchors.left: parent.left; anchors.leftMargin: 50
        anchors.top: parent.top; anchors.topMargin: 55
        font.family: "Ubuntu"
        font.bold: true
        font.pixelSize: 18
        color: "#ecf0f1"
        text: "Combo Box 1"
    }

    ComboBox {
        id: comboBox1
        width: 200
        anchors.right: parent.right; anchors.rightMargin: 50
        anchors.top: parent.top; anchors.topMargin: 50
        selectionLine: 3
    }

    Text {
        anchors.fill: parent
        anchors.left: parent.left; anchors.leftMargin: 50
        anchors.right: parent.right; anchors.rightMargin: 50
        anchors.top: parent.top; anchors.topMargin: 150
        horizontalAlignment: Text.AlignHCenter
        font.family: "Ubuntu"
        font.bold: true
        font.pixelSize: 18
        color: "#ecf0f1"
        text: "Combo Box is choosed the " + dropListText.text
    }
}
