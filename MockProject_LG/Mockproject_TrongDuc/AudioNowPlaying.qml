import QtQuick 2.6
import "Constants.js" as Constants

Item {
    property int currentSourceIndex: 0

    Image {
        y: {
            if (currentSourceIndex === 0)
                return 60
            else if (currentSourceIndex === 1)
                return 140
            else
                return 220
        }
        source: Constants.source_active
    }
    Column {
        x: 10
        y: 70
        spacing: 10
        Text {
            width: 60
            height: 60
            text: "AM"
            font.pixelSize: 25
            verticalAlignment:  Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            color: "white"
            MouseArea {
                anchors.fill: parent
                onClicked: currentSourceIndex = 0
            }
        }
        Image {
            source: Constants.sidebar_divider
        }
        Text {
            width: 60
            height: 60
            text: "FM"
            font.pixelSize: 25
            verticalAlignment:  Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            color: "white"
            MouseArea {
                anchors.fill: parent
                onClicked: currentSourceIndex = 1
            }
        }
        Image {
            source: Constants.sidebar_divider
        }
        Image {
            width: 60
            height: 60
            source: Constants.mymedia_source
            MouseArea {
                anchors.fill: parent
                onClicked: currentSourceIndex = 2
            }
        }
        Image {
            source: Constants.sidebar_divider
        }
    }
    Image {
        y: 300
        source: source_mousearea.containsMouse ? Constants.source_active : ""
        Image {
            source: Constants.chevron_inactive
            Text {
                anchors.fill: parent
                text: qsTr("More")
                font.pixelSize: 20
                verticalAlignment:  Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                color: "white"
                MouseArea {
                    id: source_mousearea
                    anchors.fill: parent
                }
            }
        }
    }
    Image {
        x: 666
        y: 76
        source: sound_mousearea.containsMouse ?
                    Constants.audio_add_device_active : Constants.audio_add_device_inactive
        Text {
            anchors.fill: parent
            text: "Sound"
            color: "white"
            font.pixelSize: 25
            verticalAlignment:  Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            MouseArea {
                id: sound_mousearea
                anchors.fill: parent
                onClicked: {
                    app.screenChange("AudioSoundEqualizer.qml")
                }
            }
        }
    }
}
