import QtQuick 2.8

Item {
    id: container

    property variant scrollArea

    opacity: 0

    function position() {
        var y = 0;
        y = scrollArea.visibleArea.yPosition * container.height;
        return y;
    }

    function size() {
        var height = 0;
        height = scrollArea.visibleArea.heightRatio * container.height;
        return height;
    }

    Rectangle {
        anchors.fill: parent
        color: "Black"
        opacity: 0.3
    }

    Rectangle {
        x: 2
        y: position()
        width: container.width - 4
        height: size()
        radius: width/2
        color: "White"
    }

    states: State {
        name: "visible"
        when: scrollArea.moving
        PropertyChanges { target: container; opacity: 1.0 }
    }

    transitions: Transition {
        from: "visible"; to: ""
        NumberAnimation { properties: "opacity"; duration: 1000 }
    }
}
