import QtQuick 2.6
import "Constants.js" as Constants



Item {

    property var vol1 : 12
    property var vol2 : 12
    property var vol3 : 12


    Rectangle
    {
        Text {
            x:270
            y:260
            text: "Bass"
            color:"white"
            font.pixelSize: 18
        }

        Text {
            x:470
            y:260
            text: "Midrange"
            color:"white"
            font.pixelSize: 17
        }

        Text {
            x:690
            y:260
            text: "Treble"
            color:"white"
            font.pixelSize: 18
        }

        x:0
        y:0
        width:Constants.screen_width
        height:60
        color: "black"

        Image {

            x:0
            y:68
            source: "images/function_separator_audio.png"
        }
        Image {

            x:720
            y:0
            source: closeBtn.containsMouse ?
                        "images/close_highlight.png":"images/close_normal.png"

            MouseArea {
                id: closeBtn
                anchors.fill: parent
                onClicked: {
                    app.screenChange("AudioNowPlaying.qml")
                }
            }



        }
        Image {
            x: 719
            y: 15
            source: Constants.statusbar_timetemp_separator
        }
        Image {
            x: 85
            y: 15
            source: Constants.statusbar_timetemp_separator
        }
        Text {
            x:105
            y:13
            text:"Sound"
            font.family: "ubuntu"
            font.pixelSize: 30
            color: "white"
        }

        Image {

            x:0
            y:0
            source: backBtn.containsMouse ?
                        "images/back_highlight.png":"images/back_normal.png"

            MouseArea {
                id: backBtn
                anchors.fill: parent
                onClicked: {
                    app.screenChange("AudioNowPlaying.qml")
                }
            }
        }

    }
    Image {
        x: 10
        y: 108
        source: equazlierArea.containsMouse ?
                    Constants.audio_add_device_active : Constants.audio_add_device_inactive
        Text {
            anchors.fill: parent
            text: "Equalizer"
            color: "white"
            font.pixelSize: 25
            verticalAlignment:  Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WordWrap
            MouseArea {
                id: equazlierArea
                anchors.fill: parent
                onClicked: {

                }
            }
        }
    }

    Image {
        x: 10
        y: 188
        source: fadeArea.containsMouse ?
                    Constants.audio_add_device_active : Constants.audio_add_device_inactive
        Text {
            anchors.fill: parent
            text: "Fade/Balance"
            color: "white"
            font.pixelSize: 25
            verticalAlignment:  Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WordWrap
            MouseArea {
                id: fadeArea
                anchors.fill: parent
                onClicked: {
                    app.screenChange("AudioSoundFade.qml")

                }
            }
        }
    }


    Image {
        x: 10
        y: 268
        source: soundArea.containsMouse ?
                    Constants.audio_add_device_active : Constants.audio_add_device_inactive
        Text {
            anchors.fill: parent
            text: "Sound Mode"
            color: "white"
            font.pixelSize: 25
            verticalAlignment:  Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter

            wrapMode: Text.WordWrap
            MouseArea {
                id: soundArea
                anchors.fill: parent
                onClicked: {

                }
            }
        }
    }



    Image {
        x: 170
        y: 88
        source: "images/separator.png"
    }

    Image {

        x: 190
        y: 83
        source: upArea1.containsMouse ?
                    "images/scroll_up_highlight.png" : "images/scroll_up_normal.png"

        MouseArea {
            id: upArea1
            anchors.fill: parent
            onPressAndHold: {
                vol1 =24
                if (vol1>12)
                    (volume1.text="+"+(vol1-12)+"")
            }
            onClicked: {vol1 = vol1 +1
                if (vol1>24)
                    vol1=24
                if (vol1<0)
                    vol1=0
                if (vol1==12)
                    (volume1.text="0")

                if (vol1>12)
                    (volume1.text="+"+(vol1-12)+"")
                if (vol1<12)
                    (volume1.text="-"+(12-vol1)+"")


            }
        }
    }

    Grid
    {x:195
        y:165
        columns: 1
        spacing: 5
        rows :12

        Repeater {
                model: 24-vol1
                Rectangle {color : "white" ; width : 62 ; height :2;z:1 }

            }

        Repeater {
                model: 12
                Rectangle {color : "blue" ; width : 62 ; height :2 }

            }


    }

    Text {
        id:volume1
        x:203
        y:255
        color:"white"
        text:""+(vol1-12)+""
        font.pixelSize : 30
    }


    Grid

    {x:195
        y:305
        columns: 1
        spacing: 5
        rows :12

        Repeater {
                model: 12 -vol1
                Rectangle {color : "blue" ; width : 62 ; height :2;z:1 }

            }

        Repeater {
                model: 12
                Rectangle {color : "white" ; width : 62 ; height :2 }

            }




    }

    Image {

        x: 190
        y: 395
        source: downArea1.containsMouse ?
                    "images/scroll_down_highlight.png" : "images/scroll_down_normal.png"

        MouseArea {
            id: downArea1
            anchors.fill: parent
            onClicked:
            {vol1 = vol1 -1
                if (vol1>24)
                    vol1=24
                if (vol1<0)
                    vol1 =0
                if (vol1==12)
                            (volume1.text="0")

                if (vol1>12)
                    (volume1.text="+"+(vol1-12)+"")
                if (vol1<12)
                    (volume1.text="-"+(12-vol1)+"")


            }
            onPressAndHold:
            {vol1=0
                if (vol1<12)
                    (volume1.text="-"+(12-vol1)+"")
            }

        }

    }


    Image {
        x: 330
        y: 88
        source: "images/separator.png"
    }

///////2
    Image {

        x: 400
        y: 83
        source: upArea2.containsMouse ?
                    "images/scroll_up_highlight.png" : "images/scroll_up_normal.png"

        MouseArea {
            id: upArea2
            anchors.fill: parent
            onPressAndHold: {
                vol2 =24
                if (vol2>12)
                    (volume2.text="+"+(vol2-12)+"")
            }
            onClicked: {vol2 = vol2 +1
                if (vol2>24)
                    vol2=24
                if (vol2<0)
                    vol2=0
                if (vol2==12)
                    (volume2.text="0")

                if (vol2>12)
                    (volume2.text="+"+(vol2-12)+"")
                if (vol2<12)
                    (volume2.text="-"+(12-vol2)+"")


            }
        }
    }

    Grid
    {x:405
        y:165
        columns: 1
        spacing: 5
        rows :12

        Repeater {
                model: 24-vol2
                Rectangle {color : "white" ; width : 62 ; height :2;z:1 }

            }

        Repeater {
                model: 12
                Rectangle {color : "blue" ; width : 62 ; height :2 }

            }


    }

    Text {
        id:volume2
        x:413
        y:255
        color:"white"
        text:""+(vol2-12)+""
        font.pixelSize : 30
    }


    Grid

    {x:405
        y:305
        columns: 1
        spacing: 5
        rows :12

        Repeater {
                model: 12 -vol2
                Rectangle {color : "blue" ; width : 62 ; height :2;z:1 }

            }

        Repeater {
                model: 12
                Rectangle {color : "white" ; width : 62 ; height :2 }

            }




    }

    Image {

        x: 400
        y: 395
        source: downArea2.containsMouse ?
                    "images/scroll_down_highlight.png" : "images/scroll_down_normal.png"

        MouseArea {
            id: downArea2
            anchors.fill: parent
            onClicked:
            {vol2 = vol2 -1
                if (vol2>24)
                    vol2=24
                if (vol2<0)
                    vol2 =0
                if (vol2==12)
                            (volume2.text="0")

                if (vol2>12)
                    (volume2.text="+"+(vol2-12)+"")
                if (vol2<12)
                    (volume2.text="-"+(12-vol2)+"")


            }
            onPressAndHold:
            {vol2=0
                if (vol2<12)
                    (volume2.text="-"+(12-vol2)+"")
            }

        }

    }



    Image {
        x: 540
        y: 88
        source: "images/separator.png"
    }



//////////////////3



    Image {

        x: 610
        y: 83
        source: upArea3.containsMouse ?
                    "images/scroll_up_highlight.png" : "images/scroll_up_normal.png"

        MouseArea {
            id: upArea3
            anchors.fill: parent
            onPressAndHold: {
                vol3 =24
                if (vol3>12)
                    (volume3.text="+"+(vol3-12)+"")
            }
            onClicked: {vol3 = vol3 +1
                if (vol3>24)
                    vol3=24
                if (vol3<0)
                    vol3=0
                if (vol3==12)
                    (volume3.text="0")

                if (vol3>12)
                    (volume3.text="+"+(vol3-12)+"")
                if (vol3<12)
                    (volume3.text="-"+(12-vol3)+"")


            }
        }
    }


    Grid
    {x:615
        y:165
        columns: 1
        spacing: 5
        rows :12

        Repeater {
                model: 24-vol3
                Rectangle {color : "white" ; width : 62 ; height :2;z:1 }

            }

        Repeater {
                model: 12
                Rectangle {color : "blue" ; width : 62 ; height :2 }

            }


    }

    Text {
        id:volume3
        x:623
        y:255
        color:"white"
        text:""+(vol3-12)+""
        font.pixelSize : 30
    }


    Grid

    {x:615
        y:305
        columns: 1
        spacing: 5
        rows :12

        Repeater {
                model: 12 -vol3
                Rectangle {color : "blue" ; width : 62 ; height :2;z:1 }

            }

        Repeater {
                model: 12
                Rectangle {color : "white" ; width : 62 ; height :2 }

            }




    }

    Image {

        x: 610
        y: 395
        source: downArea.containsMouse ?
                    "images/scroll_down_highlight.png" : "images/scroll_down_normal.png"

        MouseArea {
            id: downArea
            anchors.fill: parent
            onClicked:
            {vol3 = vol3 -1
                if (vol3>24)
                    vol3=24
                if (vol3<0)
                    vol3 =0
                if (vol3==12)
                            (volume3.text="0")

                if (vol3>12)
                    (volume3.text="+"+(vol3-12)+"")
                if (vol3<12)
                    (volume3.text="-"+(12-vol3)+"")


            }
            onPressAndHold:
            {vol3=0
                if (vol3<12)
                    (volume3.text="-"+(12-vol3)+"")
            }

        }

    }




    Image {
        x: 750
        y: 88
        source: "images/separator.png"
    }











}
