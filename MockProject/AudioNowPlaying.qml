import QtQuick 2.6
import QtQuick.Controls 2.2
import "Constants.js" as Constants

Item {
    property int currentSourceIndex: 0
    property bool hasStatusBar: true


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
    Rectangle
    {
        x:0
        y:0
        width:Constants.screen_width
        height:60
        color: "black"

        Image {

            x:0
            y:63
            source: "images/function_separator_audio.png"
        }
        Image {

            x: 760
            y:15
            source: "images/back_normal.png"
            transform: Rotation { origin.x: 25; origin.y: 25; angle: 180}


        }
        Image {
            x: 730
            y: 15
            source: Constants.statusbar_timetemp_separator
        }

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
    Image {
        x: 666
        y: 152
        source: sound_mousearea1.containsMouse ?
                    Constants.audio_add_device_active : Constants.audio_add_device_inactive
        Text {
            anchors.fill: parent
            text: "Browse"
            color: "white"
            font.pixelSize: 25
            verticalAlignment:  Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            MouseArea {
                id: sound_mousearea1
                anchors.fill: parent
                onClicked: {
                    app.screenChange("AudioStationList.qml")
                }
            }
        }
    }
    Rectangle
    {id:tuneBtn
        width:94
        height:94
        radius:47
        y:290
        color: "black"
        x:350
        border.color: "gray"
        border.width: 1
        Text {
            anchors.centerIn: parent

            text:"Tune"
            color:"White"
            font.pointSize: 15
            font.bold: true
        }
        MouseArea
        {anchors.fill: parent
            onClicked: {
                app.screenChange("AutoDirectTune.qml")
            }
        }


    }
    Image
    {
        anchors.top:tuneBtn.top
        anchors.right: tuneBtn.left
        anchors.rightMargin: 10
        source: leftseekArea.containsMouse ?
                    "images/leftseek_highlight.png" : "images/leftseek_normal.png"

        MouseArea {
            id: leftseekArea
            anchors.fill: parent
            onClicked: {

            }
        }




    }

    Image
    {
        anchors.top:tuneBtn.top
        anchors.left:  tuneBtn.right
        anchors.leftMargin:  10
        source: rightseekArea.containsMouse ?
                    "images/rightseek_highlight.png" : "images/rightseek_normal.png"


        MouseArea {
            id: rightseekArea
            anchors.fill: parent
            onClicked: {

            }
        }





    }
}
