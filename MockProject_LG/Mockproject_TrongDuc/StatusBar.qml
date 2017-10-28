import QtQuick 2.0
import "Constants.js" as Constants

Item {
    width: Constants.screen_width
    height: Constants.status_bar_height
    y: Constants.screen_height


    Image {
        source: Constants.statusbar_bg
    }
    Image {
        source: Constants.statusbar_separator
    }

    Image {
        source: home_icon_mousearea.containsMouse ?
                    Constants.home_active : Constants.home_inactive
        MouseArea {
            id: home_icon_mousearea
            anchors.fill: parent
            onClicked: {
                app.screenChange("Home.qml")
            }
        }
    }

    Image {
        x: 70
        y: 20
        source: Constants.statusbar_timetemp_separator
    }
    Row {
        x: 70

        Image {
            source: audio_icon_mousearea.containsMouse ?
                        Constants.audio_pressed : Constants.audio_normal
            MouseArea {
                id: audio_icon_mousearea
                anchors.fill: parent
                onClicked: {
                    app.screenChange("AudioNowPlaying.qml")
                }
            }
        }

        Image {
            source: phone_icon_mousearea.containsMouse ?
                        Constants.phone_pressed : Constants.phone_inactive
            MouseArea {
                id: phone_icon_mousearea
                anchors.fill: parent
                onClicked: {
                    app.screenChange("PhoneKeypad.qml")
                }
            }
        }

        Image {
            source: climate_icon_mousearea.containsMouse ?
                        Constants.climate_pressed : Constants.climate_inactive
            MouseArea {
                id: climate_icon_mousearea
                anchors.fill: parent
                onClicked: {
                    app.screenChange("ClimateFront.qml")
                }
            }
        }

        Image {
            source: onstar_icon_mousearea.containsMouse ?
                        Constants.onstar_pressed : Constants.onstar_inactive
            MouseArea {
                id: onstar_icon_mousearea
                anchors.fill: parent
                onClicked: {
                    app.screenChange("OnstarTBT.qml")
                }
            }
        }
    }

    Image {
        x: 708
        y: 20
        source: Constants.statusbar_timetemp_separator
    }
    Text {
        id: time_label
        x: 701
        y: 14
        width: 99
        height: 42
        font.pixelSize: 31
        color: "white"
        text: Qt.formatDateTime(new Date(), "hh:mm")
        horizontalAlignment: Text.AlignHCenter
    }

    Timer {
        interval: 1
        running: true
        repeat: true
        onTriggered: {
            time_label.text = Qt.formatDateTime(new Date(), "hh:mm")
        }
    }

    Behavior on y {
        SmoothedAnimation {
            duration: 2000
        }
    }
    Component.onCompleted: {
        y = Constants.status_bar_y
    }
}
