import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 480
    maximumWidth: width
    maximumHeight: height
    minimumWidth: width
    minimumHeight: height
    color: "#ecf0f1"
    title: qsTr("Quiz 2")

    Rectangle {
        id: screen
        width: parent.width
        height: parent.height - 50
        color: "#ecf0f1"
    }

    Image {
        id: btExit
        source: "images/exit.png"
        scale: 0.8
        anchors.right:  parent.right; anchors.rightMargin: 5
        anchors.bottom: parent.bottom; anchors.bottomMargin: 5


        MouseArea{
            anchors.fill: parent
            onClicked: {
                Qt.quit();
            }
        }
    }

    Text {
        id: screenText
        anchors.fill: screen
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors.horizontalCenter: screen.horizontalCenter
        text: qsTr("Quiz of lession 2!")
        font.bold: true
        font.family: Ubuntu
        font.pixelSize: 30
        color: "#95a5a6"
        wrapMode: Text.Wrap
    }

    Grid {
        id: colorPicker
        x: 5; anchors.bottom: parent.bottom; anchors.bottomMargin: 5
        rows: 2; columns: 3; spacing: 3

        Cell {cellColor: "#16a085"; onClicked: screenText.color = cellColor}
        Cell {cellColor: "#d35400"; onClicked: screenText.color = cellColor}
        Cell {cellColor: "#8e44ad"; onClicked: screenText.color = cellColor}
        Cell {cellColor: "#e74c3c"; onClicked: screenText.color = cellColor}
        Cell {cellColor: "#27ae60"; onClicked: screenText.color = cellColor}
        Cell {cellColor: "#34495e"; onClicked: screenText.color = cellColor}
    }

    Image {
        id: btEnter
        source: "images/enter.png"
        anchors.right:  btExit.left; anchors.rightMargin: 50
        anchors.bottom: parent.bottom; anchors.bottomMargin: 5

        MouseArea{
            id: enterPressed
            anchors.fill: parent
            onClicked: {
                if (input1.text != '')
                {
                screenText.text = input1.text;
                screenText.color = Qt.rgba(Math.random(),Math.random(),Math.random(),1)
                input1.text = ''
                }
            }
        }
    }

    Image {
        id: btErase
        source: "images/eraser.png"
        anchors.right:  btExit.left; anchors.rightMargin: 50
        anchors.bottom: btEnter.top; anchors.bottomMargin: 5

        MouseArea{
            id: erasePressed
            anchors.fill: parent
            onClicked: {
                input1.text = ''
            }
        }
    }

    Rectangle {
        anchors.left: colorPicker.right; anchors.leftMargin: 50
        anchors.right: btEnter.left; anchors.rightMargin: 10
        y: parent.height - colorPicker.height - 5
        width: parent.width - colorPicker.width - btExit.width - btEnter.width - 100
        height: 50
        color: "white"

        TTextInput {
            id: input1
            width: parent.width
            focus: true
        }
    }

}
