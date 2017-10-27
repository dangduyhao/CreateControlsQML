import QtQuick 2.6

Item{
    id: icon
    property alias cirColor: circular.color
    signal pressAndHold(color cirColor)
    width: 100; height: 100

    Rectangle{
        id: circular
        radius: 50
        border.color: "#ecf0f1"
        border.width: 2
        anchors.fill: parent
    }

    MouseArea{
        anchors.fill: parent
        onPressAndHold: icon.pressAndHold(icon.cirColor)
    }
}
