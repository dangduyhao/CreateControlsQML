import QtQuick 2.6

Item {
    id: root
    height: 410
    width: 800
    Rectangle {
        id: recID
        height: 410
        width: 800
        color: "black"
        Image { id: arrLeft; source: "images/back_normal.png"
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

        Rectangle {
            id: rectRoot; height: 340; width: 2; color: "gray"
            y: 70;  x: 340*1.6
        }

        Rectangle {id: rectRow; height: 1;  width: 800;  color: "blue";  y: 68}

        Text {
            id: textID
            text: "Set Time"
            anchors.horizontalCenter: recID.horizontalCenter
            y: 15
            font.pointSize: 20
            color: "white"
        }

        Text {
            id: note
            width: 250
            text: "Set Date allows you to Set Date allows you to"
            anchors.left: rectRoot.right; anchors.top: rectRow.bottom
            anchors.margins: 5
            color: "white"; font.pointSize: 13
            wrapMode: Text.WordWrap
        }

        //-------------main -----------------
        //------hourTop------
        Image {
            id: monthTop
            source: "images/scroll_up_normal.png"
            anchors.bottom: pathV1.top
            anchors.left: pathV1.left
            anchors.margins: 13
            MouseArea {
                anchors.fill: parent
                onClicked: {(pathV1.currentIndex) == 11 ? pathV1.currentIndex = 0 : pathV1.currentIndex++}
            }
        }

        //------hourBot------
        Image {
            id: monthBot
            source: "images/scroll_down_normal.png"
            anchors.top: pathV1.bottom
            anchors.left: pathV1.left
            anchors.margins: 13
            MouseArea {
                anchors.fill: parent
                onClicked: {(pathV1.currentIndex) == 0 ? pathV1.currentIndex = 11 : pathV1.currentIndex--}
            }
        }

        //-------------------------

        ListModel {
            id: listModel
            ListElement {name: "AM"}
            ListElement {name: "PM"}
//            ListElement {name: "Mar"}
//            ListElement {name: "Apr"}
//            ListElement {name: "May"}
//            ListElement {name: "June"}
//            ListElement {name: "July"}
//            ListElement {name: "Aug"}
//            ListElement {name: "Sept"}
//            ListElement {name: "Oct"}
//            ListElement {name: "Nov"}
//            ListElement {name: "Dec"}
        }


        // ----------- hour-----------
        Component {
            id: component
            Rectangle {
                height: 60
                width: 100
                color: "black"
                Text {
                    text: index + 1
                    color: "white"
                    font.pointSize: 23
                    anchors.centerIn: parent
                }
            }
        }

        ListView {
            id: pathV1
            height: 60
            width: 110
            model: 12
            anchors.top: rectRow.bottom
            //anchors.left: recID.left
            x: 70
            anchors.topMargin: 120
            delegate: component
            clip: true
            snapMode: ListView.SnapToItem
        }

      //----------------- minute --------------
        //------minuteTop------
        Image {
            id: dayTop
            source: "images/scroll_up_normal.png"
            anchors.bottom: pathV2.top
            anchors.left: pathV2.left
            anchors.margins: 13
            MouseArea {
                anchors.fill: parent
                onClicked: {(pathV2.currentIndex) == 29 ? pathV2.currentIndex = 0 : pathV2.currentIndex++}
            }
        }

        //------minuteBot------
        Image {
            id: dayBot
            source: "images/scroll_down_normal.png"
            anchors.top: pathV2.bottom
            anchors.left: pathV2.left
            anchors.margins: 13
            MouseArea {
                anchors.fill: parent
                onClicked: {(pathV2.currentIndex) == 0 ? pathV2.currentIndex = 29 : pathV2.currentIndex--}
            }
        }

        Component {
            id: componentDay
            Rectangle {
                height: 60
                width: 100
                color: "black"
                Text {
                    text: (index < 9) ? '0' + (index + 1) : index + 1
                    color: "white"
                    font.pointSize: 23
                    anchors.centerIn: parent
                }
            }
        }

        ListView {
            id: pathV2
            height: 60
            width: 110
            model: 60
            anchors.left: pathV1.right
            anchors.top: pathV1.top
            x: 90
            delegate: componentDay
            clip: true
            snapMode: ListView.SnapToItem
        }

        //----------AM - PM-----------

        //------AM - PMTop------
        Image {
            id: yearTop
            source: "images/scroll_up_normal.png"
            anchors.bottom: pathYear.top
            anchors.left: pathYear.left
            anchors.margins: 13
            MouseArea {
                anchors.fill: parent
                onClicked: {(pathYear.currentIndex) == 1 ? pathYear.currentIndex = 0 : pathYear.currentIndex++}
            }
        }

        //------AM - PMBot------
        Image {
            id: yearBot
            source: "images/scroll_down_normal.png"
            anchors.top: pathYear.bottom
            anchors.left: pathYear.left
            anchors.margins: 13
            MouseArea {
                anchors.fill: parent
                onClicked: {(pathYear.currentIndex) == 0 ? pathYear.currentIndex = 1 : pathYear.currentIndex--}
            }
        }

        Component {
            id: componentYear
            Rectangle {
                height: 60
                width: 100
                color: "black"
                Text {
                    text: name
                    color: "white"
                    font.pointSize: 23
                    anchors.centerIn: parent
                }
            }
        }

        ListView {
            id: pathYear
            height: 60
            width: 110
            model: listModel
            anchors.left: pathV2.right
            anchors.top: pathV2.top
            x: 90
            delegate: componentYear
            clip: true
            snapMode: ListView.SnapToItem
        }
    }
}
