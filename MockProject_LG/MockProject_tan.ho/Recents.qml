import QtQuick 2.0
import "Constants.js" as Constants
Item {
    width: Constants.screen_width
    height: Constants.screen_height-140 //340

    property date date: new Date()
    property var d: date.getDate()
    //left item
    Item{
        id: leftsidebar
        width: 100
        height: 320
        Image{
            y:10
            height: 150
            source: "images/scrollbar_bg_long.png"
            Image {
                id: indicatorImage
                height: 30
                source: "images/scrollbar_indicator_long.png"
                clip: true
                MouseArea{
                    anchors.fill: parent
                    onPositionChanged: {
                        drag.target = indicatorImage
                        drag.axis = Drag.YAxis
                        if (listviewrecents.contentY>1078) listviewrecents.contentY=1078
                        if (listviewrecents.contentY<0) listviewrecents.contentY=0
                        listviewrecents.contentY =  indicatorImage.y*9.06 // length of listview = count *width=16*85=1360 ; ratio = 1360/150=9,06 0,11

                        console.log(listviewrecents.contentY)

                    }
                }
            }

        }

        Column{
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 30
            width: parent.width
            height: 100
            Image{
                y:20
                source: mousearea.containsMouse ? "images/scroll_up_highlight.png": "images/scroll_up_normal.png"
                MouseArea{
                    id: mousearea
                    anchors.fill: parent
                    onClicked: {
                        if( listviewrecents.currentIndex<0)  listviewrecents.currentIndex=0
                        listviewrecents.currentIndex--
                    }
                }
            }



            Image{
                y:250
                source: mousearea1.containsMouse ? "images/scroll_down_highlight.png": "images/scroll_down_normal.png"
                MouseArea{
                    id: mousearea1
                    anchors.fill: parent
                    onClicked: {
                        if( listviewrecents.currentIndex>listviewrecents.count)  listviewrecents.currentIndex=listviewrecents.count
                        listviewrecents.currentIndex++
                    }
                }
            }
        }
    }
    //right item
    Item{
        anchors.left: leftsidebar.right
        width: parent.width-100
        height: parent.height
        Item{
            id:topbar
            width: parent.height
            height: parent.height/4
        }
        //recents infor- missed call - received
        ListView{
            id: listviewrecents
            anchors.top: topbar.bottom
            width: 700
            height: 240
            clip:true
            model:listrecents
            delegate: Rectangle{
                width: 700
                height: 80
                color: (listviewrecents.currentIndex===index)?"lightsteelblue" : "transparent"
                clip:true
                Image{
                    width: parent.width
                    source: Constants.sidebar_divider
                }

                Column {
                    anchors.verticalCenter : parent.verticalCenter
                    Text {
                        text: name
                        font.pointSize: 20
                        color: (status==="missed") ? "red" : "white"
                    }
                    Row{
                        spacing:5
                        Text {
                            text: qsTr("X")
                            font.pointSize: 12
                            color:(status==="missed") ? "red" : "white"
                        }
                        Text {
                            text: timerecent
                            color: "grey"
                            font.pointSize: 12
                        }
                    }
                }
                Image {
                    anchors.right: parent.right
                    source: "images/favorite_inactive.png"
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        app.screenChange("PhoneActive.qml")
                        //listviewrecents.currentIndex = index
                    }
                }
            }
            onContentYChanged: {
                indicatorImage.y = listviewrecents.contentY * 0.11
            }
        }


    }
    // Listrecent

    ListModel{
        id: listrecents
        ListElement{name:"Mike Hichme" ; timerecent: "9:42am"; status: "missed"}
        ListElement{name:"Mike Hichme" ; timerecent: "9:42am" ;status: "missed"}
        ListElement{name:"Mom" ; timerecent: "9:42am"; status: "called"}
        ListElement{name:"Mike Hichme" ; timerecent: "9:42am"; status: "received"}
        ListElement{name:"Mike Hichme" ; timerecent: "9:42am"; status: "missed"}
        ListElement{name:"Mike Hichme" ; timerecent: "9:42am" ;status: "missed"}
        ListElement{name:"Mom" ; timerecent: "9:42am"; status: "called"}
        ListElement{name:"Mike Hichme" ; timerecent: "9:42am"; status: "received"}
        ListElement{name:"Mike Hichme" ; timerecent: "9:42am"; status: "missed"}
        ListElement{name:"Mike Hichme" ; timerecent: "9:42am" ;status: "missed"}
        ListElement{name:"Mom" ; timerecent: "9:42am"; status: "called"}
        ListElement{name:"Mike Hichme" ; timerecent: "9:42am"; status: "received"}
        ListElement{name:"Mike Hichme" ; timerecent: "9:42am"; status: "missed"}
        ListElement{name:"Mike Hichme" ; timerecent: "9:42am" ;status: "missed"}
        ListElement{name:"Mom" ; timerecent: "9:42am"; status: "called"}
        ListElement{name:"Mike Hichme" ; timerecent: "9:42am"; status: "received"}

    }
}
