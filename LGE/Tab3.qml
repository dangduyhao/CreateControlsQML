import QtQuick 2.6

Rectangle {
    width: 480
    height: 580
    color: "#bdc3c7"

    DateTimePicker {
        id: dateScroll
        anchors.right: monthScroll.left; anchors.rightMargin: 5
        y: 50
        modelPicker: 31
        currentTime: 23
    }

    DateTimePicker {
        id: monthScroll
        anchors.horizontalCenter: parent.horizontalCenter
        y: 50
        modelPicker: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        currentTime: 8
    }

    DateTimePicker {
        id: yearScroll
        anchors.left: monthScroll.right; anchors.leftMargin: 5
        y: 50
        modelPicker: 2100
        offsetTime: 1970
        currentTime: 2017
    }


}
