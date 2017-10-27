import QtQuick 2.0

Item {
    id: boxColor
    property alias cellColor: box.color
    signal clicked(color cellcolor)
    width: 25; height: 25

    Rectangle{
        id: box
        radius: 12.5
        border.color: "white"
        anchors.fill: parent
    }

    MouseArea{
        anchors.fill: parent
        onClicked: boxColor.clicked(boxColor.cellColor)
    }
}
