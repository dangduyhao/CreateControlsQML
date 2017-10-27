import QtQuick 2.6

FocusScope {
    property alias text: input.text
    property alias input: input

    Rectangle {
        anchors.fill: parent
        color: "white"
    }

    TextEdit {
        id: input
        anchors.fill: parent
        font.family: Ubuntu
        font.pixelSize: 18
        color: "#7f8c8d"
        focus: true
        wrapMode: Text.Wrap
    }
}
