<<<<<<< HEAD
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
            text:"Direct Tune"
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

       Rectangle
       {id:pass
           x:180
           y:115
           height:56
           width: 252
           color:"black"
           Image {

               id:deleteArea
               anchors.right: parent.right
               anchors.top:parent.top


              anchors.verticalCenter: parent.Center
               source: deleteBtn.containsMouse ?
                           "images/delete_highlight.png":"images/delete_normal.png"

               MouseArea {
                   id:deleteBtn

                   anchors.fill: parent
                   onClicked: {
                      passShow.text = passShow.text.slice(0,(passShow.cursorPosition-1))
                   }
               }
           }

           TextInput {
               anchors.right :deleteArea.left
               anchors.rightMargin: 20

               id: passShow
               text: "  "
               color:"white"
               font.pixelSize: 35
           }


       }

        Grid
        {
            id:grid


            x:180
            y:180
            anchors.margins: 8
            spacing: 4
            columns: 3
            rows :3
            Repeater
            {
                model:9
                Rectangle
                {
                    height: 56
                    width:84
                    color:"#1B2631"

                    Text {
                        anchors.centerIn: parent
                        text: ""+index+""
                        color: "white"
                        font.pixelSize: 35
                    }

                    MouseArea
                    {
                        anchors.fill : parent
                        onClicked: {

                            if (passShow.cursorPosition<9) passShow.text= passShow.text+index
                            else passShow.text = passShow.text
                        }



                    }


                }


            }
        }





        Image
        {
            x:550
            y:300
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
           x:670
           y:300
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

}
=======
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
            text:"Direct Tune"
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

       Rectangle
       {id:pass
           x:180
           y:115
           height:56
           width: 252
           color:"black"
           Image {

               id:deleteArea
               anchors.right: parent.right
               anchors.top:parent.top


              anchors.verticalCenter: parent.Center
               source: deleteBtn.containsMouse ?
                           "images/delete_highlight.png":"images/delete_normal.png"

               MouseArea {
                   id:deleteBtn

                   anchors.fill: parent
                   onClicked: {
                      passShow.text = passShow.text.slice(0,(passShow.cursorPosition-1))
                   }
               }
           }

           TextInput {
               anchors.right :deleteArea.left
               anchors.rightMargin: 20

               id: passShow
               text: "  "
               color:"white"
               font.pixelSize: 35
           }


       }

        Grid
        {
            id:grid


            x:180
            y:180
            anchors.margins: 8
            spacing: 4
            columns: 3
            rows :3
            Repeater
            {
                model:9
                Rectangle
                {
                    height: 56
                    width:84
                    color:"#1B2631"

                    Text {
                        anchors.centerIn: parent
                        text: ""+index+""
                        color: "white"
                        font.pixelSize: 35
                    }

                    MouseArea
                    {
                        anchors.fill : parent
                        onClicked: {

                            if (passShow.cursorPosition<9) passShow.text= passShow.text+index
                            else passShow.text = passShow.text
                        }



                    }


                }


            }
        }





        Image
        {
            x:550
            y:300
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
           x:670
           y:300
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

}
>>>>>>> ecb7edc6e0da9056c91e129ade6999f55e4d5a47
