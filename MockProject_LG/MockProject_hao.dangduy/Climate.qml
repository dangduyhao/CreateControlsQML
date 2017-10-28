import QtQuick 2.6
import "Constants.js" as Constants


Item {
    width: Constants.screen_width
    height: Constants.screen_height

    property bool hasStatusBar: true

    property var fanValue: 0.5
    property var tempLeftValue: 50
    property var tempRightValue: 50

    function pressObject(obj) {
        if (obj.opacity === 0)
            obj.opacity = 1
        else
            obj.opacity = 0
    }

//    function controlValue(n, min, max, step) {
//        var n, min, max, step;
//        if (n > min && n < max)
//        {

//        }
//    }

    Image {
        id: topArea
        source: "images/climate_non_nav_bg.png"
        x: 0; y: 0

        Image {
            source: "images/function_separator_climate.png"
            anchors.left: parent.left
            anchors.bottom: parent.bottom
        }

        Item {
            anchors.fill: parent

            Loader {
                id: climateLoader
                source: "ClimateFront.qml"
            }
        }

        Image {
            id: bgFront
            source: "images/climate_tab_active.png"
            anchors.left: parent.left
            anchors.top: parent.top
            opacity: frontClick.containsMouse ? 1 : 0

            MouseArea {
                id: frontClick
                anchors.fill: parent
                onClicked:  {
                    climateLoader.source = "ClimateFront.qml"
                }
            }
        }

        Text {
            anchors.fill: bgFront
            font.pixelSize: 25
            font.bold: true
            text: "Front"
            color: "white"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        Image {
            id: bgRear
            source: "images/climate_tab_active.png"
            anchors.right: parent.right
            anchors.top: parent.top
            opacity: rearClick.containsMouse ? 1 : 0

            MouseArea {
                id: rearClick
                anchors.fill: parent
                onClicked:  {
                    climateLoader.source = "ClimateRear.qml"
                }
            }
        }

        Text {
            anchors.fill: bgRear
            font.pixelSize: 25
            font.bold: true
            text: "Rear"
            color: "white"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }

    Item {
        id: temp
        anchors.top: parent.top; anchors.topMargin: 80
        anchors.left: parent.left
        width: parent.width
        height: parent.height - parent.height - Constants.status_bar_height

        Text {
            id: tempLeft
            font.pixelSize: 50
            text: tempLeftValue + "°"
            color: "white"
            anchors.left: parent.left; anchors.leftMargin: 50
            anchors.top: parent.top; anchors.topMargin: 10
        }

        Image {
            id: tempUpLeft
            anchors.right: tempLeft.right
            anchors.top: tempLeft.bottom; anchors.topMargin: 0
            source: tempUpLeftClick.containsMouse ? "images/temp_up_highlight.png" : "images/temp_up_normal.png"

            MouseArea {
                id: tempUpLeftClick
                anchors.fill: parent
                onClicked: {
                    tempLeftValue +=  1
                }
            }
        }

        Image {
            id: tempDividerLeft
            anchors.right: tempUpLeft.right; anchors.rightMargin: 20
            anchors.top: tempUpLeft.bottom; anchors.topMargin: 3
            source: "images/climate_temp_divider.png"
        }

        Image {
            id: tempDownLeft
            anchors.right: tempLeft.right
            anchors.top: tempDividerLeft.bottom; anchors.topMargin: 0
            source: tempDownLeftClick.containsMouse ? "images/temp_down_highlight.png" : "images/temp_down_normal.png"

            MouseArea {
                id: tempDownLeftClick
                anchors.fill: parent
                onClicked: {
                    tempLeftValue -=  1
                }
            }
        }

        Text {
            id: tempRight
            font.pixelSize: 50
            text: tempRightValue + "°"
            color: "white"
            anchors.right: parent.right; anchors.rightMargin: 50
            anchors.top: parent.top; anchors.topMargin: 10
        }

        Image {
            id: tempUpRight
            anchors.left: tempRight.left
            anchors.top: tempRight.bottom; anchors.topMargin: 0
            source: tempUpRightClick.containsMouse ? "images/temp_up_highlight.png" : "images/temp_up_normal.png"

            MouseArea {
                id: tempUpRightClick
                anchors.fill: parent
                onClicked: {
                    tempRightValue +=  1
                }
            }
        }

        Image {
            id: tempDividerRight
            anchors.right: tempUpRight.right; anchors.rightMargin: 20
            anchors.top: tempUpRight.bottom; anchors.topMargin: 3
            source: "images/climate_temp_divider.png"
        }

        Image {
            id: tempDownRight
            anchors.left: tempRight.left
            anchors.top: tempDividerRight.bottom; anchors.topMargin: 0
            source: tempDownRightClick.containsMouse ? "images/temp_down_highlight.png" : "images/temp_down_normal.png"

            MouseArea {
                id: tempDownRightClick
                anchors.fill: parent
                onClicked: {
                    tempRightValue -=  1
                }
            }
        }
    }

    Item {
        id: fan
        anchors.top: parent.top; anchors.topMargin: 100
        width: parent.width
        height: parent.height - parent.height - Constants.status_bar_height

        Image {
            id: fanDown
            anchors.left: parent.left; anchors.leftMargin: 200
            source: fanDownClick.containsMouse ? "images/fan_indicator_down_active.png" : "images/fan_indicator_down_inactive.png"

            MouseArea {
                id: fanDownClick
                anchors.fill: parent
                onClicked: {
                    fanValue += 0.05
                }
            }
        }

        Image {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: fanDown.verticalCenter
            source: "images/climate_progress_track.png"
            clip: true

            Image {
                anchors.fill: parent
                anchors.right: parent.right; anchors.rightMargin: parent.width * fanValue
                source: "images/climate_progress_fill.png"
            }
        }

        Image {
            id: fanUp
            anchors.right: parent.right; anchors.rightMargin: 200
            source: fanUpClick.containsMouse ? "images/fan_indicator_up_active.png" : "images/fan_indicator_up_inactive.png"

            MouseArea {
                id: fanUpClick
                anchors.fill: parent
                onClicked: {
                    fanValue -= 0.05
                }
            }
        }
    }
}
