import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    id: app
    visible: true
    width: 500
    height: 450
    title: qsTr("Assignment 3")

    Loader {
        id: homeScreen
        width: parent.width
        height: parent.height
    }

    Rectangle{
        id: screen
        width: parent.width
        height: parent.height - 150
        color: "#95a5a6"

        MouseArea{
            id: mouseShake
            anchors.fill: parent
        }

        Grid{
            id: colorPicker
            anchors.left: parent.left; anchors.leftMargin: 50
            anchors.top: parent.top; anchors.topMargin: 50
            rows: 2; columns: 3; spacing: 50

            Cell {
                cirColor: "#16a085"
                onPressAndHold: {
                    screen.color = cirColor
                    bar.color = cirColor
                }
            }
            Cell {
                cirColor: "#d35400"
                onPressAndHold: {
                    screen.color = cirColor
                    bar.color = cirColor
                }
            }
            Cell {
                cirColor: "#8e44ad"
                onPressAndHold: {
                    screen.color = cirColor
                    bar.color = cirColor
                }
            }
            Cell {
                cirColor: "#e74c3c"
                onPressAndHold: {
                    screen.color = cirColor
                    bar.color = cirColor
                }
            }
            Cell {
                cirColor: "#27ae60"
                onPressAndHold: {
                    screen.color = cirColor
                    bar.color = cirColor
                }
            }
            Cell {
                cirColor: "#34495e"
                onPressAndHold: {
                    screen.color = cirColor
                    bar.color = cirColor
                }
            }
        }

    }

    Rectangle {
        id: bar
        width: parent.width
        height: 150
        x: 0; y: screen.height
        color: "#95a5a6"

        Image {
            id: btRefresh
            source: "images/refresh.png"
            anchors.left: parent.left; anchors.leftMargin: 50
            anchors.top: parent.top; anchors.topMargin: 50

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    screen.color = "#95a5a6"
                    bar.color = "#95a5a6"
                }
            }
        }


        Image {
            id: btExit
            source: "images/exit.png"
            anchors.right: parent.right; anchors.rightMargin: 50
            anchors.top: parent.top; anchors.topMargin: 50

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    Qt.quit();
                }
            }
        }
    }
}
