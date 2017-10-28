import QtQuick 2.6
import "Constants.js" as Constants
Item {

    property string str: input.text
    property int n: str.length
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

            text: qsTr("Direc Tune")
            color: "white"
            font.pointSize: 18
            font.bold: true
            x : 95
            y : -41
        }
    }

    Image {

        x : 470
        y : 85
        source: "images/directext.PNG"
    }

    Rectangle{


        x : 100
        y : 110
        width: 240
        height: 50
        color: "black"
        border.color: "gray"
        clip: true

        Image {

            source: moudel.containsMouse?"images/delete_highlight.png" : "images/delete_normal.png"
            anchors.right: parent.right
            MouseArea{
                id:moudel
                anchors.fill: parent
                onPressAndHold: {
                    input.text = ""
                }
                onClicked: {

                    if(n == 0   )
                    {
                        str = input.text ;
                    }

                    if(n > 0)
                    {
                        str = str.substring(0,n-1);
                        input.text = str;
                    }




                }

            }
        }
        Text {
            id: input
            text: qsTr("")
            color: "white"
            font.pointSize: 12
            anchors.centerIn: parent

        }

    }

    Grid{

        height: parent.height
        width: 400
        rows:3
        columns: 3
        spacing: 4
        x: 120
        y : 170
        Repeater{
            model: 9
            Rectangle{
                width: 53
                height: 53

                color: "gray"
                Text {
                    id:inp
                    text: index + 1
                    font.pointSize: 19
                    color: mouGrid.containsMouse?"black":"white"
                    anchors.centerIn: parent
                    font.bold: true
                }
                MouseArea{
                    id:mouGrid
                    anchors.fill:parent
                    onClicked: {

                        input.text +=inp.text


                    }



                }
            }
        }
    }

    Rectangle{

        x : 177
        y : 341
        width: 53
        height: 53

        color: "gray"
        Text {
            id:input0
            text: "0"
            font.pointSize: 19
            color: mou0.containsMouse?"black":"white"
            anchors.centerIn: parent
            font.bold: true
        }
        MouseArea{
            id:mou0
            anchors.fill:parent
            onClicked: {

                input.text +=input0.text


            }



        }

    }

}
