<<<<<<< HEAD
import QtQuick 2.6
import QtQuick.Controls 2.2
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
            text:"FM stations"
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


    Rectangle
    {id:root
     x:0
     y:78
     width: Constants.screen_width
     height :400
     color:"transparent"





     Rectangle
     {id:popup
       width:150
         height:150
         radius:75
         anchors.centerIn: parent
         z:1

         color: "black"

         border.color: "yellow"
         border.width: 2
         visible: false
         Text {
             id:popuptext
             anchors.centerIn: parent

             text:"Tune"
             color:"White"
             font.pointSize: 30
             font.bold: true
         }

      }

     Rectangle{
         id: scrollbar
         Image {
             id: scrollbar_bg_long
             source: "images/scrollbar_bg_long.png"
             height: listContact.height/2
             x: 0
             y: 5
             Component.onCompleted: console.log(scrollbar_bg_long.y)
         }
         Image{
             id: scrollbar_indicator_long
             source: "images/scrollbar_indicator_long.png"
             x: scrollbar_bg_long.x+1
             y: 5
             //height: 55
             height: scrollbar_bg_long.height-127.5
             onYChanged: {
                 if(mouse_scrollbar.drag.active){
                     listContact.contentY = (scrollbar_indicator_long.y-20)/listContact.height*listContact.contentHeight
                 }
                 if(y < mouse_scrollbar.drag.minimumY) y = mouse_scrollbar.drag.minimumY
                 if(y>mouse_scrollbar.drag.maximumY) y = mouse_scrollbar.drag.maximumY
             }
             MouseArea{
                 id: mouse_scrollbar
                 anchors.fill: parent
                 drag.target: scrollbar_indicator_long
                 drag.axis: Drag.YAxis
                 drag.minimumY: scrollbar_bg_long.y
                 drag.maximumY: scrollbar_bg_long.y + scrollbar_bg_long.height - scrollbar_indicator_long.height
             }
         }


     }




     ListView {
              x:95
              y:78
              width: 700
              height :400
              anchors.top:parent.top


         id: listContact

         snapMode: ListView.SnapOneItem
         highlightMoveVelocity: 2000

         clip: true



         model: liststation

         delegate: contactDelegate


         highlight: highlightBar
         highlightFollowsCurrentItem: true

         onContentYChanged: {
             if(!mouse_scrollbar.drag.active)
                 scrollbar_indicator_long.y = listContact.visibleArea.yPosition*listContact.height+20;
             if(contentY < 0) contentY=0;
             if(contentY > contentHeight - listContact.height) contentY = contentHeight - listContact.height;
         }
     }

     Component {
         id: contactDelegate

         Item {
             id:wrapper

             width: ListView.view.width
             height: 70



             Text {
                 anchors.verticalCenter: parent.verticalCenter
                 font.pixelSize: 30
                 text: name
                 color: "white"
             }
             Rectangle
             {width: parent.width
              anchors.top: parent.bottom
              height :1
              color:"darkgrey"

             }


             MouseArea
             {
                 anchors.fill: parent
                 onPressed: {popup.visible=true
                     if (number==null) popup.visible=false
                     else {popuptext.text=number
                         timer.restart()


                     }
                     wrapper.ListView.view.currentIndex = index


                 }





             }
         }
     }

     Component {
         id: highlightBar
         Rectangle {
             width: ListView.width-50; height: 50
             radius: 10
             color: "lightsteelblue"
             opacity: 0.2
             y: listContact.currentItem.y;

         }
     }

     ListModel {
         id: liststation

         ListElement { name: "A" }
         ListElement { name: "Categories" }
         ListElement { name: "UpdateStationList" }
         ListElement { name: "95.5%       " ;number :"95.5"}
         ListElement { name: "97.7%      " ;number :"99.7"}
         ListElement { name: "100.3%      " ;number :"100.3"}
         ListElement { name: "101.5%      " ;number :"101.5"}
         ListElement { name: "108.5%      " ;number :"108.5"}
         ListElement { name: "95.5%       " ;number :"95.5"}
         ListElement { name: "97.7%      " ;number :"99.7"}
         ListElement { name: "100.3%      " ;number :"100.3"}
         ListElement { name: "101.5%      " ;number :"101.5"}
         ListElement { name: "108.5%      " ;number :"108.5"}
     }

     Timer{
         id:timer
         interval: 2000
         onTriggered:
         {popup.visible=false
//
         }
     }





    }

    Image {

        x: 0
        y: 395
        source: downArea.containsMouse ?
                    "images/scroll_down_highlight.png" : "images/scroll_down_normal.png"

        MouseArea {
            id: downArea
            anchors.fill: parent
            onClicked: {


                if (listContact.currentIndex >6) listContact.currentIndex=12
                else listContact.currentIndex = listContact.currentIndex+6


            }
        }

    }

    Image {

        x: 0
        y: 315
        source: upArea.containsMouse ?
                    "images/scroll_up_highlight.png" : "images/scroll_up_normal.png"

        MouseArea {
            id: upArea
            anchors.fill: parent
            onClicked: {
               if (listContact.currentIndex<5) listContact.currentIndex=0
               else listContact.currentIndex = listContact.currentIndex-6

            }
        }
    }

}
=======
import QtQuick 2.6
import QtQuick.Controls 2.2
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
            text:"FM stations"
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


    Rectangle
    {id:root
     x:0
     y:78
     width: Constants.screen_width
     height :400
     color:"transparent"





     Rectangle
     {id:popup
       width:150
         height:150
         radius:75
         anchors.centerIn: parent
         z:1

         color: "black"

         border.color: "yellow"
         border.width: 2
         visible: false
         Text {
             id:popuptext
             anchors.centerIn: parent

             text:"Tune"
             color:"White"
             font.pointSize: 30
             font.bold: true
         }

      }

     Rectangle{
         id: scrollbar
         Image {
             id: scrollbar_bg_long
             source: "images/scrollbar_bg_long.png"
             height: listContact.height/2
             x: 0
             y: 5
             Component.onCompleted: console.log(scrollbar_bg_long.y)
         }
         Image{
             id: scrollbar_indicator_long
             source: "images/scrollbar_indicator_long.png"
             x: scrollbar_bg_long.x+1
             y: 5
             //height: 55
             height: scrollbar_bg_long.height-127.5
             onYChanged: {
                 if(mouse_scrollbar.drag.active){
                     listContact.contentY = (scrollbar_indicator_long.y-20)/listContact.height*listContact.contentHeight
                 }
                 if(y < mouse_scrollbar.drag.minimumY) y = mouse_scrollbar.drag.minimumY
                 if(y>mouse_scrollbar.drag.maximumY) y = mouse_scrollbar.drag.maximumY
             }
             MouseArea{
                 id: mouse_scrollbar
                 anchors.fill: parent
                 drag.target: scrollbar_indicator_long
                 drag.axis: Drag.YAxis
                 drag.minimumY: scrollbar_bg_long.y
                 drag.maximumY: scrollbar_bg_long.y + scrollbar_bg_long.height - scrollbar_indicator_long.height
             }
         }


     }




     ListView {
              x:95
              y:78
              width: 700
              height :400
              anchors.top:parent.top


         id: listContact

         snapMode: ListView.SnapOneItem
         highlightMoveVelocity: 2000

         clip: true



         model: liststation

         delegate: contactDelegate


         highlight: highlightBar
         highlightFollowsCurrentItem: true

         onContentYChanged: {
             if(!mouse_scrollbar.drag.active)
                 scrollbar_indicator_long.y = listContact.visibleArea.yPosition*listContact.height+20;
             if(contentY < 0) contentY=0;
             if(contentY > contentHeight - listContact.height) contentY = contentHeight - listContact.height;
         }
     }

     Component {
         id: contactDelegate

         Item {
             id:wrapper

             width: ListView.view.width
             height: 70



             Text {
                 anchors.verticalCenter: parent.verticalCenter
                 font.pixelSize: 30
                 text: name
                 color: "white"
             }
             Rectangle
             {width: parent.width
              anchors.top: parent.bottom
              height :1
              color:"darkgrey"

             }


             MouseArea
             {
                 anchors.fill: parent
                 onPressed: {popup.visible=true
                     if (number==null) popup.visible=false
                     else {popuptext.text=number
                         timer.restart()


                     }
                     wrapper.ListView.view.currentIndex = index


                 }





             }
         }
     }

     Component {
         id: highlightBar
         Rectangle {
             width: ListView.width-50; height: 50
             radius: 10
             color: "lightsteelblue"
             opacity: 0.2
             y: listContact.currentItem.y;

         }
     }

     ListModel {
         id: liststation

         ListElement { name: "A" }
         ListElement { name: "Categories" }
         ListElement { name: "UpdateStationList" }
         ListElement { name: "95.5%       " ;number :"95.5"}
         ListElement { name: "97.7%      " ;number :"99.7"}
         ListElement { name: "100.3%      " ;number :"100.3"}
         ListElement { name: "101.5%      " ;number :"101.5"}
         ListElement { name: "108.5%      " ;number :"108.5"}
         ListElement { name: "95.5%       " ;number :"95.5"}
         ListElement { name: "97.7%      " ;number :"99.7"}
         ListElement { name: "100.3%      " ;number :"100.3"}
         ListElement { name: "101.5%      " ;number :"101.5"}
         ListElement { name: "108.5%      " ;number :"108.5"}
     }

     Timer{
         id:timer
         interval: 2000
         onTriggered:
         {popup.visible=false
//
         }
     }





    }

    Image {

        x: 0
        y: 395
        source: downArea.containsMouse ?
                    "images/scroll_down_highlight.png" : "images/scroll_down_normal.png"

        MouseArea {
            id: downArea
            anchors.fill: parent
            onClicked: {


                if (listContact.currentIndex >6) listContact.currentIndex=12
                else listContact.currentIndex = listContact.currentIndex+6


            }
        }

    }

    Image {

        x: 0
        y: 315
        source: upArea.containsMouse ?
                    "images/scroll_up_highlight.png" : "images/scroll_up_normal.png"

        MouseArea {
            id: upArea
            anchors.fill: parent
            onClicked: {
               if (listContact.currentIndex<5) listContact.currentIndex=0
               else listContact.currentIndex = listContact.currentIndex-6

            }
        }
    }

}
>>>>>>> ecb7edc6e0da9056c91e129ade6999f55e4d5a47
