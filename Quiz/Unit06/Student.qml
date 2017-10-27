import QtQuick 2.6

Item {
    visible: true
    width: 1200
    height: 500

    Image {
        source: "images/bg.jpg"
        fillMode: Image.PreserveAspectFit
    }

    Item {
        Rectangle {
            id: header
            x: 5; y: 10
            width: 1180
            height: 80; radius: 5
            color: "#1abc9c"
            border.width: 1
            border.color: "#f1c40f"

            Text {
                anchors.centerIn: header
                font.family: "Ubuntu"
                font.bold: true
                font.pixelSize: 24
                color: "white"
                text: "Chương trình quản lý sinh viên"
            }
        }
    }

    Item {
        id: list
        anchors.horizontalCenter: header.horizontalCenter
        y: 100
        width: 860
        height: 400

        ListModel {
            id: modelList
            ListElement {name: "Nguyen Van A"; mark: "9"}
            ListElement {name: "Nguyen Van B"; mark: "10"}
            ListElement {name: "Nguyen Van C"; mark: "5"}
            ListElement {name: "Nguyen Van D"; mark: "4"}
            ListElement {name: "Nguyen Van E"; mark: "1"}
            ListElement {name: "Nguyen Van F"; mark: "8"}
            ListElement {name: "Nguyen Van G"; mark: "9"}
            ListElement {name: "Nguyen Van H"; mark: "9"}
            ListElement {name: "Nguyen Van I"; mark: "3"}
            ListElement {name: "Nguyen Van J"; mark: "7"}
        }

        ListView {
            anchors.fill: parent
            anchors.leftMargin: 30
            anchors.rightMargin: 30
            clip: true
            model: modelList
            spacing: 50

            delegate: Item {
                Rectangle {
                    id: recNumber
                    width: 80; height: 50; radius: 5
                    color: "#1abc9c"
                    border.width: 1
                    border.color: "#f1c40f"

                    Text {
                        id: textNumber
                        anchors.centerIn: recNumber
                        font.family: "Ubuntu"
                        font.bold: true
                        font.pixelSize: 18
                        color: "white"
                        text: index + 1
                    }
                }

                Rectangle {
                    id: recName
                    width: 500; height: 50; radius: 5
                    anchors.left: recNumber.right; anchors.leftMargin: 5
                    color: "#1abc9c"
                    border.width: 1
                    border.color: "#f1c40f"

                    Text {
                        id: textName
                        anchors.centerIn: recName
                        font.family: "Ubuntu"
                        font.bold: true
                        font.pixelSize: 18
                        color: "white"
                        text: name
                    }
                }

                Rectangle {
                    id: recMark
                    width: 80; height: 50; radius: 5
                    anchors.left: recName.right; anchors.leftMargin: 5
                    color: "#1abc9c"
                    border.width: 1
                    border.color: "#f1c40f"

                    Text {
                        id: textMark
                        anchors.centerIn: recMark
                        font.family: "Ubuntu"
                        font.bold: true
                        font.pixelSize: 18
                        color: "white"
                        text: mark
                    }
                }

                Rectangle {
                    id: recDel
                    width: 80; height: 50; radius: 5
                    anchors.left: recMark.right; anchors.leftMargin: 5
                    color: "#e74c3c"
                    border.width: 1
                    border.color: "#f1c40f"

                    Text {
                        anchors.centerIn: recDel
                        font.family: "Ubuntu"
                        font.bold: true
                        font.pixelSize: 18
                        color: "white"
                        text: "X"
                    }


                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            modelList.remove(model.index)
                        }
                    }
                }
            }
        }
    }

    Rectangle {
        x: list.width - 20
        y: list.y
        width: 320; height: 390; radius: 5
        color: "#ecf0f1"
        border.width: 1
        border.color: "#f1c40f"

        Text {
            anchors.left: parent.left; anchors.leftMargin: 20
            anchors.top: parent.top; anchors.topMargin: 35
            font.family: "Ubuntu"
            font.bold: true
            font.pixelSize: 18
            color: "#34495e"
            text: qsTr("Tên:")
        }

        Text {
            anchors.left: parent.left; anchors.leftMargin: 20
            anchors.top: parent.top; anchors.topMargin: 100
            font.family: "Ubuntu"
            font.bold: true
            font.pixelSize: 18
            color: "#34495e"
            text: qsTr("Điểm:")
        }

        Rectangle {
            id: boxName
            anchors.right: parent.right; anchors.rightMargin: 20
            anchors.top: parent.top; anchors.topMargin: 20
            width: 180; height: 50; radius: 5
            color: "#e74c3c"
            border.width: 1
            border.color: "#f1c40f"

            TextInput {
                id: addName
                anchors.fill: parent
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.family: "Ubuntu"
                font.pixelSize: 18
                color: "#ecf0f1"
                focus: true
            }
        }

        Rectangle {
            id: boxMark
            anchors.right: parent.right; anchors.rightMargin: 100
            anchors.top: boxName.bottom; anchors.topMargin: 20
            width: 100; height: 50; radius: 5
            color: "#e74c3c"
            border.width: 1
            border.color: "#f1c40f"

            TextInput {
                id: addMark
                anchors.fill: parent
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.family: "Ubuntu"
                font.pixelSize: 18
                color: "#ecf0f1"
            }
        }

        Rectangle {
            id: btAdd
            anchors.left: boxMark.left
            anchors.top: boxMark.bottom; anchors.topMargin: 20
            width: 100; height: 50; radius: 5
            color: "#e74c3c"
            border.width: 1
            border.color: "#f1c40f"

            Text {
                id: add
                anchors.centerIn: btAdd
                font.family: "Ubuntu"
                font.bold: true
                font.pixelSize: 24
                color: "#ecf0f1"
                text: "ADD"
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    modelList.append({name: addName.text, mark: addMark.text})
                }
            }
        }
    }
}
