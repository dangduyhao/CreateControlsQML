import QtQuick 2.6
import "Constants.js" as Constants
Item {
    id: root
    //property int valid: 0
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
            ListElement {name: "Apple CarPlay"; sw: 1; valid: 0}
            ListElement {name: "Connected by USB Only"; sw: 1; valid: 0}
            ListElement {name: "Time/Date"; sw: 0}
            ListElement {name: "Language"; sw: 0}
            ListElement {name: "Phone"; sw: 0}
            ListElement {name: "Wi-Fi Networks"; sw: 0}
            ListElement {name: "OnStar Vehicle Hotspot"; sw: 0}
            ListElement {name: "Audio"; sw: 0}
            ListElement {name: "Video"; sw: 0}
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

                Rectangle {
                    id: swRect
                    height: 30
                    width: 50
                    radius: 15
                    visible: (sw) ? true : false
                    border.color: "gray"
                    border.width: 2
                    anchors.verticalCenter: rect.verticalCenter
                    anchors.right: rect.right
                    anchors.rightMargin: 30
                    Rectangle {
                        id: rectSelect
                        height: 30
                        width: 30
                        radius: 15
                        border.color: "gray"
                        color: "#e8e6e3"
                        border.width: 2
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            //NumberAnimation on x {
                            valid = ~valid
                            rectSelect.x = (valid) ? (rectSelect.x + 20) : (rectSelect.x - 20)
                            if(valid == 0){
                                rectSelect.color = "#e8e6e3"
                                rectSelect.border.color = "gray"
                                swRect.border.color = "gray"
                            }
                            else {
                                rectSelect.border.color = "green"
                                rectSelect.border.width = 2
                                rectSelect.color = "white"
                                swRect.border.color = "green"
                            }


                            //}
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
