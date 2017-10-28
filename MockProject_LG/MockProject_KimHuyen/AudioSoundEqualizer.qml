import QtQuick 2.6
import "Constants.js" as Constants
Item {

    Image {

        y : 50
        source: "images/function_separator_horizontal_plain_blue.png"

        Image {
            x : 720
            y : -57

            source: mouclose.containsMouse?"images/close_highlight.png":"images/close_normal.png"
            MouseArea{
                id: mouclose
                anchors.fill: parent
                onClicked: {
                    app.screenChange("AudioNowPlaying.qml")

                }


            }
        }
        Image {
            x : 720
            y : -40
            source: "images/statusbar_timetemp_separator.png"
        }
        Image{


            y : -57
            source: mouback.containsMouse? "images/back_highlight.png": "images/back_normal.png"
            MouseArea{
                id: mouback
                anchors.fill: parent
                onClicked: {
                    app.screenChange("AudioNowPlaying.qml")

                }


            }

        }

        Image {
            x : 80
            y : -40
            source: "images/statusbar_timetemp_separator.png"
        }

        Text {

            text: qsTr("Sound")
            color: "white"
            font.pointSize: 18
            font.bold: true
            x : 95
            y : -41
        }
    }

    Column{

        spacing: 20
        x : 20
        y : 120
        Rectangle{

            id: equalizer
            width: 120
            height: 50
            border.color: mou1.containsMouse?"#000099":"white"
            border.width: 2
            color: "black"
            Text {

                text: qsTr("Equalizer")
                color: "white"
                font.pointSize: 14

                anchors.centerIn: parent
            }

            MouseArea{
            anchors.fill: parent
            id:mou1
            onClicked: {

                load.source="Equalizer.qml"



            }


            }

        }

        Rectangle{

            id: fade
            width: 120
            height: 50
             border.color: mou2.containsMouse?"#000099":"white"
            border.width: 2
            color: "black"
            Text {

                text: qsTr("Fade/\nBalance")
                color: "white"
                font.pointSize: 14

                anchors.centerIn: parent
            }
            MouseArea{
            anchors.fill: parent
            id:mou2
            onClicked: {
                load.source="Fade.qml"

            }


            }

        }
        Rectangle{



            width: 120
            height: 50
            border.color: mou3.containsMouse?"#000099":"white"
            border.width: 2
            color: "black"
            Text {

                text: qsTr("Sound\nMode")
                color: "white"
                font.pointSize: 14

                anchors.centerIn: parent
            }
            MouseArea{
            anchors.fill: parent
            id:mou3


            }

        }


    }


    Rectangle{

        width: 500
        height: 350
        x : 200
        y : 100
        Image {

            source: "images/backgr.PNG"
        }

        Loader{

            id:load
        }





    }



}
