import QtQuick 2.6
import "Constants.js" as Constants
Item {

    property int curIndex: 3

    property string str: ""
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

            text: qsTr("FM Stations")
            color: "white"
            font.pointSize: 18
            font.bold: true
            x : 95
            y : -41
        }
    }


    Image {

        x : 7
        y: 70
        height: 185
        source: "images/scrollbar_bg_long.png"
        Image {
            height: 60
            id: scrollbar
            source: "images/scrollbar_indicator_long.png"

            MouseArea{
                id:mou1
                anchors.fill:parent
                drag.target: scrollbar
                drag.axis: Drag.YAxis
                drag.minimumY: 0
                drag.maximumY: 120


                onReleased: {

                    visible =  true
                    timer.restart()

                }



            }
            onYChanged:
            {
                imgtimer.visible = true
                if(mou1.drag.active)
                {
                    lst.contentY = scrollbar.y/lst.height*lst.contentHeight ;
                    timer.running = true ;


                }

                if(y < mou1.drag.minimumY)
                {
                    y = mou1.drag.minimumY ;

                }
                if(y > mou1.drag.maximumY)
                {
                    y = mou1.drag.maximumY ;

                }


            }
        }
    }

    Image {
        x : 7
        y : 260
        id: btnup
        source: mouUp.containsMouse?"images/scroll_up_highlight.png" : "images/scroll_up_normal.png"
        MouseArea{
            anchors.fill: parent
            id:mouUp
            onClicked: {
                if (lst.contentY >= 340 )
                    lst.contentY -= 340  ;

                timer.restart();

            }


        }
    }

    Image{
        x : 7
        y : 337
        id:btnDown
        source: mouDown.containsMouse?"images/scroll_down_highlight.png":"images/scroll_down_normal.png"

        MouseArea{
            id:mouDown
            anchors.fill: parent
            onClicked: {


                if (lst.contentY <= lst.height - 340  )
                    lst.contentY += 340  ;

                timer.restart();


            }


        }


    }

    Rectangle{
        id: listrect
        color: "transparent"
        height: Constants.screen_height-140
        width: Constants.screen_width- 100
        y : 70
        anchors.right: parent.right
        ListModel{
            id: datamodel
            ListElement{
                name:"Categories "
                urlVol:""
                urlFav:""

            }
            ListElement{
                name:"Update Station List "
                urlVol:""
                urlFav:""

            }

            ListElement{
                name:"95  %Tolent%%%%"
                urlVol:""
                urlFav:"images/favorite_inactive.png"


            }

            ListElement{
                name:"99  %Adult With Code %"
                urlVol:"images/now_playing_icon_active.png"
                urlFav:"images/favorite_inactive.png"


            }

            ListElement{
                name:"100 %Ann Abon Public Radio %"
                urlVol:""
                urlFav:"images/favorite_inactive.png"



            }

            ListElement{
                name:"101 % Religius % "
                urlVol:""
                urlFav:""


            }
            ListElement{
                name:"100 %Ann Abon Public Radio %"
                urlVol:""
                urlFav:""

            }
            ListElement{
                name:"102 %Ann Abon Public Radio % "
                urlVol:""
                urlFav:"images/favorite_inactive.png"



            }
            ListElement{
                name:"110 %Ann Abon Public Radio % "

                urlVol:""
                urlFav:""

            }

            ListElement{
                name:"95 %Tolent%%%%"
                urlVol:""
                urlFav:""


            }

            ListElement{
                name:"99 %Adult With Code %"
                urlVol:""
                urlFav:"images/favorite_inactive.png"


            }

            ListElement{
                name:"100 %Ann Abon Public Radio % "
                urlVol:""
                urlFav:""



            }
            ListElement{
                name:"105 %Ann Abon Public Radio % "
                urlVol:""
                urlFav:""



            }

        }


        ListView{

            id: lst
            clip: true
            model:datamodel
            anchors.fill: parent
            spacing:0.7
            delegate: Rectangle{
                height: 68
                width: parent.width
                color: "transparent"
                Image {
                    source: "images/function_separator.png"
                    anchors.bottom: parent.bottom
                }
                Text{
                    id : txtTime
                    text: model.name
                    color: "white"
                    font.pointSize: 18
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 5
                }

                Image {

                    source: model.urlVol
                    x : 540
                    y : 18

                }

                Image{


                    source: moufav.containsMouse?  "images/favorite_active.png" : model.urlFav

                    x : 610
                    y : 1

                    MouseArea{
                        anchors.fill: parent
                        id : moufav

                    }


                }


            }

            MouseArea{
                anchors.fill: parent
                onClicked: { timer.running = true


                }
            }
            onContentYChanged: {

                    if(curIndex <= 12 && curIndex >= 0 )
                         curIndex = lst.contentY/70 + 3 ;



                    str = model.get(curIndex).name
                    str = str.substring(0,3)

                if(! mou1.drag.active)
                {
                    scrollbar.y = lst.visibleArea.yPosition * lst.height ;
                }






            }
            onFlickEnded: {
                timer.running = true



            }


        }
    }


    Image {
        id: imgtimer
        source: "images/zoom_bubble.png"
        anchors.centerIn: parent
        scale: 0.7
        visible: false
        Text {

            text:str
            font.pointSize: 34

            anchors.centerIn: parent
            color: "white"
        }

    }

    Timer{
        id:timer
        interval: 2000
        running :false
        repeat: false
        onTriggered: {

            imgtimer.visible = false


        }


    }










}



