import QtQuick 2.6
import "Constants.js" as Constants

Item {
    width: Constants.screen_width
    height: Constants.screen_height

    Rectangle {
        width: airFoot.width + 10
        height: airFoot.height
        radius: 2
        anchors.centerIn: airFoot
        color: "Transparent"
        border.width: 2
        border.color: "Gray"
    }

    Row {
        id: airFoot
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top; anchors.topMargin: 200
        spacing: 0



        Image {
            source: airFootDownLeft.containsMouse ? "images/climate_airfoot_inactive_press_down.png" : "images/climate_airfoot_inactive_down.png"

            Image {
                source: airFootDownLeft.containsMouse ? "images/climate_airfoot_active_press_down.png" : "images/climate_airfoot_activated_down.png"
                opacity: 0

                MouseArea {
                    id: airFootDownLeft
                    anchors.fill: parent
                    onClicked: {
                        pressObject(parent)
                    }
                }
            }
        }

        Image {
            source: airFaceLeft.containsMouse ? "images/climate_airface_inactive_press_left.png" : "images/climate_airface_inactive_left.png"

            Image {
                source: airFaceLeft.containsMouse ? "images/climate_airface_active_press_left.png" : "images/climate_airface_activated_left.png"
                opacity: 0

                MouseArea {
                    id: airFaceLeft
                    anchors.fill: parent
                    onClicked: {
                        pressObject(parent)
                    }
                }
            }
        }

        Image {
            source: windShield.containsMouse ? "images/climate_windshield_inactive_press.png" : "images/climate_windshield_inactive.png"

            Image {
                source: windShield.containsMouse ? "images/climate_windshield_active_press.png" : "images/climate_windshield_activated.png"
                opacity: 0

                MouseArea {
                    id: windShield
                    anchors.fill: parent
                    onClicked: {
                        pressObject(parent)
                    }
                }
            }
        }

        Image {
            source: airFaceRight.containsMouse ? "images/climate_airface_inactive_press.png" : "images/climate_airface_inactive.png"

            Image {
                source: airFaceRight.containsMouse ? "images/climate_airface_active_press.png" : "images/climate_airface_activated.png"
                opacity: 0

                MouseArea {
                    id: airFaceRight
                    anchors.fill: parent
                    onClicked: {
                        pressObject(parent)
                    }
                }
            }
        }

        Image {
            source: airFootRight.containsMouse ? "images/climate_airfoot_inactive_press.png" : "images/climate_airfoot_inactive.png"

            Image {
                source: airFootRight.containsMouse ? "images/climate_airfoot_active_press.png" : "images/climate_airfoot_activated.png"
                opacity: 0

                MouseArea {
                    id: airFootRight
                    anchors.fill: parent
                    onClicked: {
                        pressObject(parent)
                    }
                }
            }
        }
    }


    Row {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top; anchors.topMargin: 320
        spacing: 0

        Image {
            source: btOnOff.containsMouse ? "images/climate_button_inactive_press.png" : "images/climate_button_inactive.png"

            Image {
                source: btOnOff.containsMouse ? "images/climate_button_active_press.png" : "images/climate_button_active.png"
                opacity: 0

                MouseArea {
                    id: btOnOff
                    anchors.fill: parent
                    onClicked: {
                        pressObject(parent)
                    }
                }
            }

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top; anchors.topMargin: 40
                font.pixelSize: 25
                color: "white"
                text: "On/Off"
            }
        }

        Image {
            source: btAC.containsMouse ? "images/climate_button_inactive_press.png" : "images/climate_button_inactive.png"

            Image {
                source: btAC.containsMouse ? "images/climate_button_active_press.png" : "images/climate_button_active.png"
                opacity: 0

                MouseArea {
                    id: btAC
                    anchors.fill: parent
                    onClicked: {
                        pressObject(parent)
                    }
                }
            }

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top; anchors.topMargin: 40
                font.pixelSize: 25
                color: "white"
                text: "A/C"
            }
        }

        Image {
            source: btAuto.containsMouse ? "images/climate_button_inactive_press.png" : "images/climate_button_inactive.png"

            Image {
                source: btAuto.containsMouse ? "images/climate_button_active_press.png" : "images/climate_button_active.png"
                opacity: 0

                MouseArea {
                    id: btAuto
                    anchors.fill: parent
                    onClicked: {
                        pressObject(parent)
                    }
                }
            }

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top; anchors.topMargin: 40
                font.pixelSize: 25
                color: "white"
                text: "Auto"
            }
        }

        Image {
            source: btCar.containsMouse ? "images/climate_button_inactive_press.png" : "images/climate_button_inactive.png"

            Image {
                source: btCar.containsMouse ? "images/climate_button_active_press.png" : "images/climate_button_active.png"
                opacity: 0

                MouseArea {
                    id: btCar
                    anchors.fill: parent
                    onClicked: {
                        pressObject(parent)
                    }
                }
            }

            Image {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top; anchors.topMargin: 44
                source: "images/recirculation_icon.png"
            }
        }

        Image {
            source: btSync.containsMouse ? "images/climate_button_inactive_press.png" : "images/climate_button_inactive.png"

            Image {
                source: btSync.containsMouse ? "images/climate_button_active_press.png" : "images/climate_button_active.png"
                opacity: 0

                MouseArea {
                    id: btSync
                    anchors.fill: parent
                    onClicked: {
                        pressObject(parent)
                    }
                }
            }

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top; anchors.topMargin: 40
                font.pixelSize: 25
                color: "white"
                text: "Sync"
            }
        }
    }
}
