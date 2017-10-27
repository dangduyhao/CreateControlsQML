import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    visible: true
    width: 320
    height: 320
    title: qsTr("Hello World")

    Rectangle{
        id: screen
        width: 320
        height: 320
        color: "#ffffff"

        MouseArea{
            id: mouseShake
            anchors.fill: parent
        }
    }

    Image {
        id: btExit
        source: "images/exit.png"
        x: 285; anchors.bottom: screen.bottom; anchors.bottomMargin: 5;

        MouseArea{
            anchors.fill: parent
            onClicked: {
                Qt.quit();
            }
        }
    }

    Text {
        id: helloText
        text: qsTr("Hello World!")
        anchors.horizontalCenter: screen.horizontalCenter
        y: 100
        font.bold: true
        font.family: Ubuntu
        font.pixelSize: 30
        color: Qt.rgba(Math.random(),Math.random(),Math.random(),1)

        states: [
            State {
                name: "shake"; when: mouseShake.pressed === true
                PropertyChanges {
                    target: helloText; rotation: 100
                }
            }
        ]

        transitions: [
            Transition {
                from: ""; to: "shake"; reversible: true
                ParallelAnimation{
                    NumberAnimation{
                        properties: "y,rotation"; duration: 100
                    }
                }
            }
        ]
    }

    Grid{
        id: colorPicker
        x: 5; anchors.bottom: screen.bottom; anchors.bottomMargin: 5
        rows: 2; columns: 3; spacing: 3

        Cell {cellColor: "#16a085"; onClicked: helloText.color = cellColor}
        Cell {cellColor: "#d35400"; onClicked: helloText.color = cellColor}
        Cell {cellColor: "#8e44ad"; onClicked: helloText.color = cellColor}
        Cell {cellColor: "#e74c3c"; onClicked: helloText.color = cellColor}
        Cell {cellColor: "#27ae60"; onClicked: helloText.color = cellColor}
        Cell {cellColor: "#34495e"; onClicked: helloText.color = cellColor}
    }

}
