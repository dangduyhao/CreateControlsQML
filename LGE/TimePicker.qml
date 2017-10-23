import QtQuick 1.1

/*s
Usage:

    TimePicker {
        id: timePicker
        anchors.centerIn: parent

        function orientationSuffix() {
            if (screen.currentOrientation === Screen.Portrait || screen.currentOrientation === Screen.PortraitInverted )
                return "portrait"
            else
                return "landscape"
        }

        backgroundImage: "image://theme/meegotouch-timepicker-light-1-" + orientationSuffix()
        hourDotImage: "image://theme/meegotouch-timepicker-disc-hours-" + orientationSuffix()
        minutesDotImage: "image://theme/meegotouch-timepicker-disc-minutes-" + orientationSuffix()
    }
*/


Item {
    id: timePicker

    property int hours: 0
    property int minutes: 0

    property alias backgroundImage: bg.source
    property alias hourDotImage: hourDot.source
    property alias minutesDotImage: minuteDot.source

    property int minuteGradDelta: 6
    property int hourGradDelta: 30

    width: bg.sourceSize.width
    height: bg.sourceSize.height

    onHoursChanged: {
        if (hours == 24)
            hours = 0
    }

    onMinutesChanged: {
        if (minutes == 60)
            minutes = 0
    }

    Image {
        id: bg

        anchors.fill: parent

        property int centerX: parent.width / 2
        property int centerY: parent.height / 2

        Image {
            id: hourDot
            anchors.fill: parent
            rotation: timePicker.hours * 30
            smooth: true
        }

        Text {
            id: hourText
            property int hourRadius: parent.width * 0.055
            property int hourTrackRadius: parent.width * 0.16

            x: (parent.centerX - hourRadius) + hourTrackRadius
               * Math.cos(timePicker.hours * timePicker.hourGradDelta * (Math.PI / 180) - (Math.PI / 2));
            y: (parent.centerY - hourRadius) + hourTrackRadius
               * Math.sin(timePicker.hours * timePicker.hourGradDelta * (Math.PI / 180) - (Math.PI / 2));

            font.pixelSize: timePicker.width * 0.1

            text: (timePicker.hours < 10 ? "0" : "") + timePicker.hours
        }

        Image {
            id: minuteDot
            anchors.fill: parent
            rotation: timePicker.minutes * 6
            smooth: true
        }

        Text {
            id: minuteText
            property int minuteRadius: parent.width * 0.055
            property int minuteTrackRadius: parent.width * 0.38

            x: parent.centerX - minuteRadius + minuteTrackRadius
                * Math.cos(timePicker.minutes * timePicker.minuteGradDelta * (Math.PI / 180) - (Math.PI / 2));
            y: parent.centerY - minuteRadius + minuteTrackRadius
                * Math.sin(timePicker.minutes * timePicker.minuteGradDelta * (Math.PI / 180) - (Math.PI / 2));

            font.pixelSize: timePicker.width * 0.1
            color: "#CCCCCC"
            text: (timePicker.minutes < 10 ? "0" : "") + timePicker.minutes
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent

        property int currentHandler : -1 // 0 - hours, 1 - minutes
        property real previousAlpha: -1

        onPressed: {
            currentHandler = chooseHandler(mouseX, mouseY)
            previousAlpha = findAlpha(mouseX, mouseY)
        }

        onReleased: {
            currentHandler = -1
            previousAlpha = -1
        }

        onPositionChanged: {
            var newAlpha = 0;
            if (currentHandler < 0)
                return

            newAlpha = findAlpha(mouseX, mouseY)

            if (currentHandler > 0) {
                timePicker.minutes = getNewTime(timePicker.minutes, newAlpha, timePicker.minuteGradDelta, 1)
            }
            else
                timePicker.hours = getNewTime(timePicker.hours, newAlpha, timePicker.hourGradDelta, 2)
        }

        function sign(number) {
            return  number >= 0 ? 1 : -1;
        }

        function getNewTime(source, alpha, resolution, boundFactor) {
            var delta = alpha - previousAlpha

            if (Math.abs(delta) < resolution)
                return source

            if (Math.abs(delta) > 180) {
                delta = delta - sign(delta) * 360
            }

            var result = source * resolution

            var resdel = Math.round(result + delta)
            if (Math.round(result + delta) > 359 * boundFactor)
                result += delta - 360 * (source * resolution > 359 ? boundFactor : 1)
            else if (Math.round(result + delta) < 0 * boundFactor)
                result += delta + 360 * (source * resolution > 359 ? boundFactor : boundFactor)
            else
                result += delta

            previousAlpha = alpha
            return result / resolution
        }

        function findAlpha(x, y) {

            var alpha = (Math.atan((y - bg.centerY)/(x - bg.centerX)) * 180) / 3.14 + 90
            if (x < bg.centerX)
                alpha += 180

            return alpha
        }

        function chooseHandler(mouseX, mouseY) {
            var radius = Math.sqrt(Math.pow(bg.centerX - mouseX, 2) + Math.pow(bg.centerY - mouseY, 2));
            if (radius <= bg.width * 0.25)
                return 0
            else if(radius < bg.width * 0.5)
                return 1
            return -1
        }

    }
}
