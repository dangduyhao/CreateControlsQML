import QtQuick 2.6

Item {
    id: dayCell
    property QtObject platformStyle: DatePickerStyle {}
    property bool isOtherMonthDay: false
    property bool isCurrentDay: false
    property bool isSelectedDay: false
    property bool hasEventDay: false

    property date dateOfDay

    function color() {
        if (GridView.isCurrentItem)
            return platformStyle.selectedDayColor
        else if (isCurrentDay)
            return platformStyle.currentDayColor
        else if (isOtherMonthDay)
            return platformStyle.otherMonthDayColor
        return platformStyle.dayColor
    }

    function background() {
        if (GridView.isCurrentItem) {
            if (isCurrentDay)
                return platformStyle.currentSelectedDayImage
            return platformStyle.selectedDayImage
        }
        else if (isCurrentDay)
            return platformStyle.currentDayImage
        return ""
    }

    function eventImage() {
        if (GridView.isCurrentItem)
            return platformStyle.selectedDayEventImage
        else if (dateOfDay.getDay() === 0 || dateOfDay.getDay() === 6)
            return platformStyle.weekEndEventImage
        else if (isCurrentDay)
            return platformStyle.currentDayEventImage
        else if (isOtherMonthDay)
            return platformStyle.otherMonthEventImage
        return platformStyle.eventImage
    }

    Image {
        id: background
        anchors.centerIn: parent

        source: dayCell.background()
        Text {
            id: label
            anchors.centerIn: parent
            font.pixelSize: dayCell.platformStyle.dayFontSize
            color: dayCell.color()
            font.weight: (dayCell.isCurrentDay || dayCell.GridView.isCurrentItem) ? Font.Bold : Font.Light
            text: dayCell.dateOfDay.getDate()
        }
        Image {
            anchors {
                top: label.bottom
                topMargin: -5
                horizontalCenter: parent.horizontalCenter
            }

            visible: hasEventDay
            source: dayCell.eventImage()
        }
    }
}
