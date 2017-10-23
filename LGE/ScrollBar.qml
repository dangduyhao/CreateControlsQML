import QtQuick 2.6

Item {
    id: container

    property variant scrollArea

    // Set opacity to 0
    opacity: 0

    // Position function of container
    function position() {
        var y = 0;
        y = scrollArea.visibleArea.yPosition * container.height;
        return y;
    }

    // Size function of container
    function size() {
        var height = 0;
        height = scrollArea.visibleArea.heightRatio * container.height;
        return height;
    }

    // Create a scroll bar
    Rectangle {
        anchors.fill: parent
        color: "Black"
        opacity: 0.3
    }

    // Create a scroll container
    Rectangle {
        x: 2
        y: position()
        width: container.width - 4
        height: size()
        radius: width/2
        color: "White"
    }

    // Create animation when scroll area moving
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
