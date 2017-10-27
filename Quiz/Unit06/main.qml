import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    id: app
    visible: true
    width: 1200
    height: 600
    title: qsTr("Unit 06")

    function autoHide() {
        if (touch.visible === true)
        {
            touch.visible = false
        }
        else
        {
            touch.visible = true
        }
    }

    Loader {
        id: mainComponent
        source: "qrc:/HomeScreen.qml"
    }

    Rectangle {
        x: 0; y: 500
        width: 1200
        height: 100
        color: "#34495e"
        opacity: 0.8

        Image {
            id: btHome
            anchors.left: parent.left; anchors.leftMargin: 100
            anchors.verticalCenter: parent.verticalCenter
            source: "images/home.png"

            MouseArea {
                anchors.fill: parent
                onClicked:  {
                    touch.visible = false
                    mainComponent.source = "qrc:/HomeScreen.qml"
                }
            }
        }

        Image {
            id: btList
            x: (parent.width - width)/2
            anchors.verticalCenter: parent.verticalCenter
            source: "images/settings.png"

            MouseArea {
                anchors.fill: parent
                onClicked: autoHide()
            }
        }

        Image {
            id: btQuit
            anchors.right: parent.right; anchors.rightMargin: 100
            anchors.verticalCenter: parent.verticalCenter
            source: "images/exit.png"

            MouseArea {
                anchors.fill: parent
                onClicked: Qt.quit()
            }
        }
    }

    Rectangle {
        id: touch
        x: (app.width - width)/2; y: (app.height - height)/2
        width: 300; height: 300; radius: 10
        color: "#2c3e50"
        opacity: 0.8
        visible: false

        ListModel {
            id: modelButton
            ListElement {name: "Log in"; urlImage: "images/lock.png"; urlQml: "qrc:/Signal.qml"}
            ListElement {name: "Student mark"; urlImage: "images/tasks.png"; urlQml: "qrc:/Student.qml"}
            ListElement {name: "World clock"; urlImage: "images/alarm.png"; urlQml: "qrc:/Clocks.qml"}
        }

        ListView {
            anchors.fill: parent
            anchors.margins: 20
            clip: true
            model: modelButton
            spacing: 80

            delegate: Item {
                Image {
                    id: image
                    anchors.left: parent.left; anchors.leftMargin: 20
                    source: urlImage

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            mainComponent.source = urlQml
                            touch.visible = false
                        }
                    }
                }

                Text {
                    anchors.left: image.right; anchors.leftMargin: 20
                    anchors.bottom: image.bottom; anchors.bottomMargin: 20
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Ubuntu"
                    font.bold: true
                    font.pixelSize: 18
                    color: "white"
                    text: name

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            mainComponent.source = urlQml
                            touch.visible = false
                        }
                    }
                }
            }
        }
    }
}
