import QtQuick 2.6

ListModel {
    id: dateModel

    signal monthChanged()

    property int firstDayOffset: 0
    property date selectedDate: new Date()
    property date currentDate: new Date()

    //public:
    function setEvent(eventDate, enable) {
        if (eventDate.getMonth() !== selectedDate.getMonth() && eventDate.getFullYear() !== selectedDate.getFullYear())
            return
        setProperty(eventDate.getDate() + firstDayOffset, "hasEventDay", enable)
    }

    function getMonthYearString() {
        return Qt.formatDate(selectedDate, "MMMM yyyy")
    }

    function changeModel(_selectedDate) {
        clear()
        selectedDate = _selectedDate

        fillModel()
        monthChanged()
    }

    function showNext() {
        showOtherMonth(selectedDate.getMonth() + 1)
    }

    function showPrevious() {
        showOtherMonth(selectedDate.getMonth() - 1)
    }

    //private:
    function fillModel() {
        firstDayOffset = getFirstDayOffset(selectedDate)
        for(var i = 0; i < 6 * 7; ++i) {
            var objectDate = selectedDate;
            objectDate.setDate(selectedDate.getDate() - (selectedDate.getDate() - 1 + firstDayOffset - i))
            appendDayObject(objectDate)
        }
    }

    function appendDayObject(dateOfDay) {

        append({
                   "dateOfDay" : dateOfDay,
                   "isCurrentDay" : dateOfDay.getDate() === currentDate.getDate() &&
                                    dateOfDay.getMonth() === currentDate.getMonth() &&
                                    dateOfDay.getFullYear() === currentDate.getFullYear(),
                   "isOtherMonthDay" : dateOfDay.getMonth() !== selectedDate.getMonth(),
                   "hasEventDay" : false
               })
    }

    function showOtherMonth(month) {
        var newDate = selectedDate
        var currentDay = selectedDate.getDate()
        currentDay = getValidDayByMonthAndDay(month, currentDay, isLeapYear(selectedDate.getFullYear()));
        newDate.setMonth(month, currentDay)
        changeModel(newDate)
    }

    function getFirstDayOffset(currentDate) {
        var tmpDate = currentDate
        tmpDate.setDate(currentDate.getDate() - (currentDate.getDate() - 1))
        var firstDayWeekDay = tmpDate.getDay()
        if (firstDayWeekDay === 0)
            firstDayWeekDay = 6
        else
            firstDayWeekDay--
        return firstDayWeekDay
    }

    function getValidDayByMonthAndDay(month, day, leapYear) {
        if (month === 12)
            month = 0
        if (month === -1)
            month = 11

        if (month === 0 ||
                month === 2 ||
                month === 4 ||
                month === 6 ||
                month === 7 ||
                month === 9 ||
                month === 11)
            return day

        if (month !== 1) {
            if (day < 31)
                return day
            return 30
        }

        if (day < 29)
            return day

        if (leapYear)
            return 29
        return 28
    }

    function isLeapYear(year) {
        if(year % 4 === 0) {
            if(year % 100 === 0) {
                if(year % 400 === 0) {
                    return true;
                }
                else
                    return false;
            }
            else
                return true;
        }
        return false;
    }
}
