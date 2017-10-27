import QtQuick 2.6

Item {
    id: clock
    width: 200; height: 200

    property alias cityName: cityLable.text
    property int hours
    property int minutes
    property int seconds
    property int shift
    property bool night

    function timeChanged() {
        var date = new Date
        hours = date.getUTCHours() + shift
        minutes = date.getUTCMinutes()
        seconds = date.getUTCSeconds()
        night = (hours < 7 || hours > 19)
    }

    Timer {
        interval: 100; running: true; repeat: true
        onTriggered: clock.timeChanged()
    }

    Item {
        anchors.centerIn: parent
        width: clock.width; height: clock.height

        Image {
            id: clockFace
            x: (clock.width - width)/2; y: (clock.height - height)/2
            source: "images/clock.png"
            visible: clock.night == false
        }

        Image {
            x: (clock.width - width)/2; y: (clock.height - height)/2
            source: "images/clock_night.png"
            visible: clock.night == true
        }

        Image {
            id: hourHand
            x: (clock.width - width)/2 - 1; y: (clock.height - height)/2 - 1
            source: "images/hour.png"
            scale: 0.65
            transform: Rotation {
                id: hourRot
                origin.x: hourHand.width/2; origin.y: hourHand.height/2
                angle: clock.hours*30 + clock.minutes*0.5
                Behavior on angle {
                    SpringAnimation {
                        spring: 2
                        damping: 0.2
                        modulus: 360
                    }
                }
            }
        }

        Image {
            id: minHand
            x: (clock.width - width)/2 - 1; y: (clock.height - height)/2 - 1
            source: "images/minute.png"
            scale: 0.8
            transform: Rotation {
                id: minRot
                origin.x: minHand.width/2; origin.y: minHand.height/2
                angle: clock.minutes*6
                Behavior on angle {
                    SpringAnimation {
                        spring: 2
                        damping: 0.2
                        modulus: 360
                    }
                }
            }
        }

        Image {
            id: secHand
            x: (clock.width - width)/2 - 1; y: (clock.height - height)/2 - 1
            source: "images/second.png"
            scale: 0.8
            transform: Rotation {
                id: secRot
                origin.x: secHand.width/2; origin.y: secHand.height/2
                angle: clock.seconds*6
                Behavior on angle {
                    SpringAnimation {
                        spring: 2
                        damping: 0.2
                        modulus: 360
                    }
                }
            }
        }


        Text {
            id: cityLable
            anchors.top: clockFace.bottom; anchors.topMargin: 30
            anchors.horizontalCenter: clockFace.horizontalCenter
            font.family: "Ubuntu"
            font.bold: true
            font.pixelSize: 24
            color: "#ecf0f1"
        }
    }
}
