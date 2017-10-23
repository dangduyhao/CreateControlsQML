import QtQuick 2.6

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
        selectionLine: 3 // Show number of selection line on drop list
    }

    Switch {
        id: switchChange
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top; anchors.topMargin: 400
        checked: true
//        onCheckedChanged: console.log("Switch changed " + checked)
    }

    Rectangle {
        anchors.fill: parent
        color: "Black"
        opacity: switchChange.checked ? 0 : 0.7
    }
}
