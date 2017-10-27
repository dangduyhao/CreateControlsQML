import QtQuick 2.6

FocusScope {
    property alias text: input.text
    property alias input: input

    Rectangle {
        color: "white"
    }

    TextEdit {
        id: input
        anchors.fill: parent
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.family: "Ubuntu"
        font.pixelSize: 60
        color: "#7f8c8d"
        wrapMode: Text.Wrap
    }
}
