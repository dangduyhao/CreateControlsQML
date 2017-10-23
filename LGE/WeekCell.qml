import QtQuick 2.6

Item {
    id: weekCell
    property alias text: label.text
    property QtObject platformStyle: DatePickerStyle {}
    property bool isWeekEnd: false

    height: label.height
    width: parent.width / 7

    Text {
        id: label
        anchors.centerIn: parent
        font.pixelSize: weekCell.platformStyle.dayNameFontSize
        color: weekCell.isWeekEnd ? weekCell.platformStyle.weekEndColor : weekCell.platformStyle.weekDayColor
        font.bold: true
    }
}
