import QtQuick 2.6

Rectangle { // size controlled by height
    id: root

    property bool checked: false;

    width: 100;  height: 50 // default size
    radius:       0.5  * root.height
    color:        checked? "#1abc9c": "#7f8c8d" // background color
    opacity:      enabled? 1: 0.3 // disabled state

    Text {
        font.family: "Ubuntu"
        text:  checked?    "On": "Off"
        color: "#ecf0f1"
        x:    (checked? 0: pill.width) + (parent.width - pill.width - width) / 2
        font.pixelSize: 0.5 * root.height
        anchors.verticalCenter: parent.verticalCenter
    }

    MouseArea {
        anchors.fill: parent
        onPressed:    parent.opacity = 0.5
        onReleased:   parent.opacity = 1
        onCanceled:   parent.opacity = 1
        onClicked:    checked = !checked
    }

    Rectangle {
        id: pill
        x: checked? root.width - pill.width: 0
        width: root.height;  height: width
        radius:       parent.radius

        MouseArea {
            anchors.fill: parent

            drag {
                target:   pill
                axis:     Drag.XAxis
                minimumX: 0
                maximumX: root.width - pill.width
            }

            onPressed:    parent.opacity = 0.5
            onReleased: {
                parent.opacity = 1
                if( checked  &&  pill.x < root.width - pill.width) checked = false // right to left
                if(!checked  &&  pill.x) checked = true  // left  to right
            }
            onCanceled:   parent.opacity = 1
            onClicked:  checked = !checked
        }
    }
}
