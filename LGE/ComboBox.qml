import QtQuick 2.6

Item {
    id: comboArea
    height: 50

    // Create number of selection line showing on drop list area
    property int selectionLine: 3


    // Create function of show/hide drop list when click to down arrow
    function showDropList() {
        if (dropList.visible === false)
            dropList.visible = true
        else
            dropList.visible = false
    }

    // Create combo box with text
    Rectangle {
        id: comboBox
        width: parent.width
        height: parent.height
        radius: 0
        color: "#1abc9c"

        Text {
            id: selectionText
            anchors.left: parent.left; anchors.leftMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            font.family: "Ubuntu"
            font.pixelSize: 18
            color: "#ecf0f1"
            text: "Choose selection..."
        }

        // Create down arrow
        Rectangle {
            id: downArrowArea
            width: downArrow.width + 20
            height: parent.height
            anchors.right: parent.right
            anchors.top: parent.top
//            color: "Transparent"
            color: "#16a085"

            Image {
                id: downArrow
                source: "images/down-arrow.png"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    showDropList()
                }
            }
        }
    }

    // Create drop list
    Rectangle {
        id: dropList
        z: 2
        anchors.top: comboBox.bottom; anchors.topMargin: 15
        anchors.left: comboBox.left
        width: comboBox.width
        height: comboBox.height * selectionLine
        radius: comboBox.radius
        color: comboBox.color
        visible: false

        Image {
            anchors.bottom: dropList.top
            anchors.right: dropList.right; anchors.rightMargin: (downArrowArea.width - downArrow.width) / 2
            source: "images/up-arrow.png"
        }

        ListModel {
            id: boxModel
            ListElement { name: "Selection 1" }
            ListElement { name: "Selection 2" }
            ListElement { name: "Selection 3" }
            ListElement { name: "Selection 4" }
            ListElement { name: "Selection 5" }
            ListElement { name: "Selection 6" }
            ListElement { name: "Selection 7" }
            ListElement { name: "Selection 8" }
        }

        ListView {
            id: boxList
            anchors.fill: parent
            spacing: 0
            snapMode: ListView.SnapToItem
            clip: true
            focus: true
            interactive: true

            model: boxModel

            delegate: Rectangle {
                id: itemList
                width: comboBox.width
                height: comboBox.height
                color: ListView.isCurrentItem ? "#16a085" : dropList.color

                Text {
                    id: dropListText
                    anchors.left: parent.left; anchors.leftMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    font.family: "Ubuntu"
                    font.pixelSize: 18
                    color: "#ecf0f1"
                    text: name
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: {
                        boxList.currentIndex = index
                    }

                    onClicked: {
                        selectionText.text = dropListText.text
                        dropList.visible = false
                    }
                }
            }
        }

        // Create scroll bar for drop list
        ScrollBar {
            id: dropListScrollBar
            width: 6
            height: dropList.height
            scrollArea: boxList
            anchors.right: parent.right
        }
    }
}

