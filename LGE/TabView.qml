import QtQuick 2.8

Item {
    width: 480
    height: 640

    Item {
        id: screenArea
        width: 480
        height: 580

        ListModel {
            id: screenModel
            ListElement { url: "Tab1.qml" }
            ListElement { url: "Tab2.qml" }
            ListElement { url: "Tab3.qml" }
        }

        ListView {
            id: screenList
            anchors.fill: parent
            snapMode: ListView.SnapToItem
            orientation: ListView.Horizontal
            highlightRangeMode: ListView.StrictlyEnforceRange
            highlightMoveVelocity : 2000

            onCurrentIndexChanged: {
                tabList.currentIndex = screenList.currentIndex
            }

            model: screenModel
            delegate: Item {
                width: 480
                height: 580
                clip: true

                Loader {
                    source: url
                }
            }
        }
    }

    Rectangle {
        id: tabArea
        width: 480
        height: 60
        anchors.top: screenArea.bottom
        color: "#bdc3c7"

        Rectangle {
            id: tabBeam
            z: 2
            width: parent.width
            height: 5
            anchors.top: parent.top
            color: "#3498db"
        }

        ListModel {
            id: tabModel
            ListElement { name: "Combo Box" }
            ListElement { name: "Calendar" }
            ListElement { name: "A-Z Listview" }
        }

        ListView {
            id: tabList
            anchors.fill: parent
            anchors.left: tabBeam.left; anchors.leftMargin: 20
            anchors.top: tabBeam.top
            spacing: 10
            orientation: ListView.Horizontal
            interactive: false

            onCurrentIndexChanged: {
                screenList.currentIndex = tabList.currentIndex
            }

            model: tabModel
            delegate: Rectangle {
                width: 140
                height: parent.height - 10
                radius: tabBeam.height
                color: ListView.isCurrentItem ? tabBeam.color : "#95a5a6"

                Text {
                    anchors.centerIn: parent
                    font.family: "Ubuntu"
                    font.bold: true
                    font.pixelSize: 18
                    color: "White"
                    text: name
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        tabList.currentIndex = index
                    }
                }
            }
        }
    }
}
