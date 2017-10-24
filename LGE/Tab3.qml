import QtQuick 2.6

Rectangle {
    width: 480
    height: 580
    color: "#bdc3c7"

    property int dates
    property int months
    property int years

    function timeChanged() {
        var date = new Date
        dates = date.getUTCDate()
        months = date.getUTCMonth()
        years = date.getUTCFullYear()
    }

    Timer {
        interval: 1000; running: true; repeat: true
        onTriggered: {
            timeChanged()
        }
    }

    Item {
        id: timePicker
        anchors.horizontalCenter: parent.horizontalCenter
        y: 20
        DateTimePicker {
            id: dateScroll
            anchors.right: monthScroll.left; anchors.rightMargin: 5
            modelPicker: 31
            currentTime: dates
        }

        DateTimePicker {
            id: monthScroll
            anchors.horizontalCenter: parent.horizontalCenter
            modelPicker: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
            currentTime: months
        }

        DateTimePicker {
            id: yearScroll
            anchors.left: monthScroll.right; anchors.leftMargin: 5
            modelPicker: 2100
            offsetTime: 1970
            currentTime: years
        }
    }

    Item {
        id: calendarPicker
        anchors.horizontalCenter: parent.horizontalCenter
        y: 240

        Calendar {
            anchors.horizontalCenter: parent.horizontalCenter
            month: months
            year: years
        }
    }
}
