import QtQuick 2.6

QtObject {
    id: style

    property string orientationString: "portrait"
    property string backgroundImage: "image://theme/meegotouch-calendar-monthgrid-background-" + orientationString
    property string currentDayImage: "image://theme/meegotouch-monthgrid-daycell-current-day-" + orientationString
    property string selectedDayImage: "image://theme/meegotouch-monthgrid-daycell-selected-day-" + orientationString
    property string currentSelectedDayImage: "image://theme/meegotouch-monthgrid-daycell-selected-day-current-" + orientationString

    property string leftArrowImage: "image://theme/meegotouch-calendar-monthgrid-previousbutton"
    property string leftArrowPressedImage: "image://theme/meegotouch-calendar-monthgrid-previousbutton-pressed"
    property string rightArrowImage: "image://theme/meegotouch-calendar-monthgrid-nextbutton"
    property string rightArrowPressedImage: "image://theme/meegotouch-calendar-monthgrid-nextbutton-pressed"


    property string eventImage: "image://theme/meegotouch-monthgrid-daycell-regular-day-eventindicator"
    property string weekEndEventImage: "image://theme/meegotouch-monthgrid-daycell-regular-weekend-day-eventindicator"
    property string currentDayEventImage: "image://theme/meegotouch-monthgrid-daycell-current-day-eventindicator"
    property string selectedDayEventImage: "image://theme/meegotouch-monthgrid-daycell-selected-day-eventindicator"
    property string otherMonthEventImage: "image://theme/meegotouch-monthgrid-daycell-othermonth-day-eventindicator"

    property color weekEndColor: "#EF5500"
    property color weekDayColor: "#8C8C8C"
    property color otherMonthDayColor: "#8C8C8C"
    property color dayColor: "#000000"
    property color monthColor: "#000000"
    property color currentDayColor: "#EF5500"
    property color selectedDayColor: "#FFFFFF"

    property int monthFontSize: 32
    property int dayNameFontSize: 18
    property int dayFontSize: 26
}
