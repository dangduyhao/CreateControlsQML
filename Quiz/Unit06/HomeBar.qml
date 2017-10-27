import QtQuick 2.6

Item {
    width: 1200
    height: 100

    Image {
        id: btHome
        x: 100
        anchors.verticalCenter: parent.verticalCenter
        source: "images/home.png"

        MouseArea {
            anchors.fill: parent
            onClicked: touch.visible = true
        }
    }

    Rectangle {
        id: touch
        x: 500; y: 200
        width: 200; height: 200
        anchors.bottom: parent.bottom
        color: "#2c3e50"
        visible: false

        ListModel {
            id: modelButton
            ListElement {name: "1"; url: "qrc:/Signal.qml"}
            ListElement {name: "2"; url: "qrc:/Clocks.qml"}
            ListElement {name: "3"; url: "qrc:/Student.qml"}
        }

        ListView {
            anchors.fill: parent
            anchors.margins: 10
            clip: true
            model: modelButton
            spacing: 50
            ListView.Horizontal: true

            delegate: Item {
                Image {

                }

                Text {
                    font.family: "Ubuntu"
                    font.bold: true
                    font.pixelSize: 18
                    color: "white"
                    text: name

                    MouseArea {
                        anchors.fill: parent
                        onClicked: mainComponent.source = url

                    }
                }
            }
        }
    }
}
