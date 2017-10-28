import QtQuick 2.6
import "Constants.js" as Constants
Item {
    id: root
    //70
    // -------------------- main ----------------
    Rectangle {
        id: rectMain
        width: 800
        height: 340
        color: "black"
        anchors.verticalCenter: root.verticalCenter
        ListModel {
            id: listSelect
            ListElement {name: "Time/Date"; source: "SetDate.qml"}
            ListElement {name: "Language"; source: "Language.qml"}
            ListElement {name: "Phone"; source: ""}
            ListElement {name: "Wi-Fi Networks"; source: ""}
            ListElement {name: "OnStar Vehicle Hotspot"; source: ""}
            ListElement {name: "Audio"; source: ""}
            ListElement {name: "Video"; source: ""}
            ListElement {name: "Apple CarPlay"; source: ""}
            ListElement {name: "Connected by USB Only"; source: ""}
        }

        Component {
            id: componentRect
            Rectangle {
                id: rect
                height: 69
                width: 700
                color: "black"
                Text {
                    id: nameText
                    text: name
                    font.pointSize: 15
                    color: "white"
                    anchors.verticalCenter: rect.verticalCenter
                }
                Rectangle {
                    height: 1
                    width: 700
                    color: "gray"
                    anchors.bottom: rect.bottom
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if(source != ""){
                            app.screenChange(source);
                        }
                    }
                }
            }
        }

        ListView {
            id: listView
            height: 340
            width: 700
            model: listSelect
            anchors.left: rectMain.left
            anchors.leftMargin: 100
            clip: true
            snapMode: ListView.SnapToItem//SnapOneItem
            delegate: componentRect
            //onContentYChanged: console.log(contentY)

        }
        Rectangle {
            id: rectScroll
            height: 160
            width: 10
            radius: 5
            color: "gray"
            x: 35
            y: 15
            Rectangle {
                id: scrollbar
                //visible: false
                anchors.right: rectScroll.right
                y: listView.visibleArea.yPosition * rectScroll.height
                width: 10
                height: listView.visibleArea.heightRatio * rectScroll.height
                color: "white"
                radius: 5
            }
        }
    }
    // -------- Arrow ---------

    Image {
        id: arrowDown
        source: "images/next_arrowbyH.png"
        anchors.bottom: rectMain.bottom
        anchors.left: rectMain.left
        anchors.margins: 8
        rotation: 90

        MouseArea {
            anchors.fill: parent
            onClicked: {
                listView.contentY = (listView.contentY >= 270)? listView.contentY : listView.contentY + 70
            }
        }
    }

    Image {
        id: arrowUp
        source: "images/next_arrowbyH.png"
        anchors.bottom: arrowDown.top
        anchors.bottomMargin: 10
        anchors.left: arrowDown.left
        rotation: -90
        MouseArea {
            anchors.fill: parent
            onClicked: {
                listView.contentY = (listView.contentY <= 10)? listView.contentY : listView.contentY - 70
            }
        }
    }
}
