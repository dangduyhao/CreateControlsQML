import QtQuick 2.6

Rectangle {
    width: 480
    height: 580
    color: "#bdc3c7"

    DateTimePicker {
        id: datePicker
        anchors.right: monthPicker.left; anchors.rightMargin: 5
        y: 100
    }

    DateTimePicker {
        id: monthPicker
        anchors.horizontalCenter: parent.horizontalCenter
        y: 100
    }

    DateTimePicker {
        id: yearPicker
        anchors.left: monthPicker.right; anchors.leftMargin: 5
        y: 100
    }
}
