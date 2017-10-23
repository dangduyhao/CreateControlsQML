import QtQuick 2.6
import "Constants.js" as Constant

Item {
    width: 480
    height: 640

    Rectangle {
        id: textArea
        width: parent.width
        height: parent.height - controlArea.height
        color: "#ecf0f1"

        // Create Flickable to load long text
        Flickable {
            id: flickable
            anchors.fill: parent
            contentHeight: longText.implicitHeight
            smooth: true

            // Load long text
            Text {
                id: longText
                anchors.fill: parent
                anchors.left: parent.left; anchors.leftMargin: 20
                anchors.right: parent.right; anchors.rightMargin: 30
                font.family: "Ubuntu"
                font.pixelSize: 18
                color: "#34495e"

                wrapMode: Text.Wrap

                text: Constant.longText

            }
        }

        // Scroll bar from ScrollBar.qml
        ScrollBar {
            id: textScrollBar
            width: 10
            height: flickable.height
            scrollArea: flickable
            anchors.right: parent.right
        }
    }

    Rectangle {
        id: controlArea
        width: parent.width
        height: 80
        anchors.top: textArea.bottom
        color: "#bdc3c7"

        // Create Decline button, click to quit
        Rectangle {
            width: 120
            height: 50
            radius: width/2
            anchors.left: parent.left; anchors.leftMargin: 80
            anchors.verticalCenter: parent.verticalCenter
            color: "#e74c3c"

            Text {
                anchors.centerIn: parent
                font.family: "Ubuntu"
                font.bold: true
                font.pixelSize: 20
                color: "#ecf0f1"
                text: "EXIT"
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    Qt.quit()
                }
            }
        }

        // Create Accept button, click to load TabView.qml
        Rectangle {
            width: 120
            height: 50
            radius: width/2
            anchors.right: parent.right; anchors.rightMargin: 80
            anchors.verticalCenter: parent.verticalCenter
            color: "#1abc9c"

            Text {
                anchors.centerIn: parent
                font.family: "Ubuntu"
                font.bold: true
                font.pixelSize: 20
                color: "#ecf0f1"
                text: "ENTER"
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    mainLoader.source = "TabView.qml"
                }
            }
        }
    }
}



