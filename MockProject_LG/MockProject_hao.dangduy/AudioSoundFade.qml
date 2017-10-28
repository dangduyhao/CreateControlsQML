import QtQuick 2.6
import "Constants.js" as Constants
Item {
    Rectangle
    {

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
                        app.screenChange("AudioSoundEqualizer.qml")

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

    Rectangle
    {
        id:dArea
        height:180
        width: 180
        x:350
        y:160
        color:"transparent"
        border.color:"gray"
        border.width: 1

        Image {
            anchors.centerIn: parent
            source: "images/grid.png"
        }

        Image {
            id:ball
            x:71
            y:71
            source: "images/ball.png"

            MouseArea
            {
                id:ballArea
                anchors.fill:parent
                onClicked:{
                    ballArea.drag.target=ball
                    ballArea.drag.maximumX=141
                    ballArea.drag.maximumY=141
                    ballArea.drag.minimumX=1
                    ballArea.drag.minimumY=1


                }
                onPressAndHold:
                {
                    ball.x=71
                    ball.y=71
                }

            }


        }


    }

    Image {


       anchors.top : dArea.bottom
       anchors.topMargin: 20
       x:405


        source: downArea.containsMouse ?
                    "images/scroll_down_highlight.png" : "images/scroll_down_normal.png"

        MouseArea {
            id: downArea
            anchors.fill: parent
            onClicked:   {
                if (ball.y+2<=141) ball.y = ball.y +2
                else ball.y =141

            }

            onPressAndHold:
            {
                ball.y =141
            }
        }

    }

    Image {


       anchors.bottom : dArea.top
       anchors.bottomMargin:  20
       x:405


        source: upArea.containsMouse ?
                    "images/scroll_up_highlight.png" : "images/scroll_up_normal.png"

        MouseArea {
            id: upArea
            anchors.fill: parent
            onClicked:   {
                if (ball.y-2>=1) ball.y = ball.y -2
                else ball.y =1

            }

            onPressAndHold:
            {
                ball.y =1
            }
        }

    }

    Image {


       anchors.left : dArea.right
       anchors.leftMargin: 20
       y:215


        source: rightArea.containsMouse ?
                    "images/move_right_active.png" : "images/move_right_inactive.png"

        MouseArea {
            id: rightArea
            anchors.fill: parent
            onClicked:   {
                if (ball.x+2<=141) ball.x = ball.x +2
                else ball.x =141

            }

            onPressAndHold:
            {
                ball.x =141
            }
        }

    }

    Image {


       anchors.right : dArea.left
       anchors.rightMargin: 20
       y:215


        source: leftArea.containsMouse ?
                    "images/move_left_active.png" : "images/move_left_inactive.png"

        MouseArea {
            id: leftArea
            anchors.fill: parent
            onClicked:   {
                if (ball.x-2>=1) ball.x = ball.x -2
                else ball.x =1

            }

            onPressAndHold:
            {
                ball.x =1
            }

        }

    }






    Image {
        x: 710
        y: 88
        source: "images/separator.png"
    }





}
