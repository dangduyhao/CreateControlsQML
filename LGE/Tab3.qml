import QtQuick 2.6

Rectangle {
    width: 480
    height: 580
    color: "#bdc3c7"

    DateTimePicker {
        id: datePicker
        anchors.right: monthPicker.left; anchors.rightMargin: 5
        y: 100
        //        modelPicker:
    }



    DateTimePicker {
        id: monthPicker
        anchors.horizontalCenter: parent.horizontalCenter
        y: 100
        modelPicker: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    }

    DateTimePicker {
        id: yearPicker
        anchors.left: monthPicker.right; anchors.leftMargin: 5
        y: 100
    }
}
