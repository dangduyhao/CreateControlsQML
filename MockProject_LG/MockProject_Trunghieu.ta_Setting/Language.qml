import QtQuick 2.6
import "Constants.js" as Constants
Item {
    id: root
    //70

    Image { id: arrLeft; source: "images/back_normal.png";
        MouseArea{
            anchors.fill: parent
            onClicked: app.screenChange("SettingSystem.qml")
        }
    }
    Image { id: backSetDate; anchors.right: parent.right; source: "images/close_normal.png"
        MouseArea{
            anchors.fill: parent
            onClicked: app.screenChange("SettingSystem.qml")
        }
    }

    Rectangle {
        height: 40; width: 2; anchors.left: arrLeft.right
        color: "gray"; y: 15
    }
    Rectangle {
        height: 40; width: 2; anchors.right: backSetDate.left;
        color: "gray"; y: 15
    }

    Rectangle {id: rectRow; height: 1;  width: 800;  color: "blue";  y: 68}

    Text {
        id: textID
        text: "Language"
        anchors.horizontalCenter: root.horizontalCenter
        y: 15
        font.pointSize: 20
        color: "white"
    }
    // -------------------- main ----------------
    Rectangle {
        id: rectMain
        width: 800
        height: 340
        color: "black"
        anchors.verticalCenter: root.verticalCenter
        ListModel {
            id: listSelect
            ListElement {name: "Denmark"}
            ListElement {name: "England"}
            ListElement {name: "Estonia"}
            ListElement {name: "Finland"}
            ListElement {name: "Iceland"}
            ListElement {name: "Lithuania"}
            ListElement {name: "Norway"}
            ListElement {name: "Scotland"}
            ListElement {name: "Sweden"}
            ListElement {name: "Wales"}
            ListElement {name: "Belgium"}
            ListElement {name: "Germany"}
            ListElement {name: "Netherlands"}
        }

        Component {
            id: componentRect
            Rectangle {
                id: rect
                height: 69
                width: 400
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
                    width: 400
                    color: "gray"
                    anchors.bottom: rect.bottom
                }

                Rectangle {
                    id: circle
                    height: 40
                    width: 40
                    radius: 20
                    color: "black"
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    anchors.rightMargin: 20
                    border.color: "gray"
                    border.width: 2

                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: circle.color = "green"
                    onExited: circle.color = "black"
                    onClicked: app.screenChange("SettingSystem.qml")
                }
            }
        }

        ListView {
            id: listView
            height: 340
            width: 400
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


        Text {
            id: nameText
            height: 340
            width: 260
            anchors.left: listView.right
            anchors.top: rectRow.bottom
            //            anchors.topMargin: 10
            text: qsTr("Trong bảng dưới đây, cột Nước có chứa tên của từng nước thường được gọi trong tiếng Anh, ví dụ South Korea
Cột Tính từ có chứa từ dùng để mô tả thứ gì đó đến từ đất nước đó, ví dụ French cheese")
            font.pointSize: 13; color: "white"; wrapMode: Text.WordWrap

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
                listView.contentY = (listView.contentY >= 550)? listView.contentY : listView.contentY + 70
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
