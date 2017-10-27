import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    id: app
    visible: true
    width: 860
    height: 500
    title: qsTr("Model View Delegate")
    color: "#ecf0f1"

    Item {
        Rectangle {
            id: header
            x: 5; y: 10
            width: app.width - 10
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
        y: 100
        width: app.width
        height: app.height - 100

        ListModel {
            id: modelList
            ListElement {number: "1"; name: "Nguyen Van A"; mark: "9"}
            ListElement {number: "2"; name: "Nguyen Van B"; mark: "10"}
            ListElement {number: "3"; name: "Nguyen Van C"; mark: "5"}
            ListElement {number: "4"; name: "Nguyen Van D"; mark: "4"}
            ListElement {number: "5"; name: "Nguyen Van E"; mark: "1"}
            ListElement {number: "6"; name: "Nguyen Van F"; mark: "8"}
            ListElement {number: "7"; name: "Nguyen Van G"; mark: "9"}
            ListElement {number: "8"; name: "Nguyen Van H"; mark: "9"}
            ListElement {number: "9"; name: "Nguyen Van I"; mark: "3"}
            ListElement {number: "10"; name: "Nguyen Van K"; mark: "7"}

        }
        ListView {
            id: list
            anchors.fill: parent
            anchors.leftMargin: 50
            anchors.rightMargin: 50
            clip: true
            model: modelList

            spacing: 50
            highlight: Rectangle {
                id: highlight
                z: 2
                color: "#f1c40f"; radius: 5
                opacity: 0.6
            }
            focus: true

            delegate: Item {
                Keys.onSpacePressed: modelList.remove(model.index)

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
                        text: number
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
}
