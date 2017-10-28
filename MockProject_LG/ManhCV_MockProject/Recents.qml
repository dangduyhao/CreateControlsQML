import QtQuick 2.6
import QtQuick.Controls 2.2
import QtQuick.Window 2.0
import "Constants.js" as Constants
import "Infor.js" as Textkey

Item {
    id : main2
    visible: true
    // width: 800
    //height: 400
    //color : "black"
    signal screenChange(string event)
    property int  move_button: 3
    Item {
        id: topmain

        ListModel{
            id:home
            ListElement{name:"Favorites"}
            ListElement{name:"Keypad"}
            ListElement{name:"Recents"}
            ListElement{name:"Contacts"}
            ListElement{name:"Phones"}
        }
        Row{
            id:rowhome
            Repeater{
                id : rc12
                model: home
                Rectangle{
                    id:recthome
                    color: "black"
                    width: Constants.screen_width/5
                    height: Constants.status_bar_height
                    Text {
                        id: texthome
                        width: parent.width
                        height: parent.height
                        text: model.name
                        x:38
                        y: 15
                        font.pointSize: 17
                        color: "white"
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked:
                        { if( index == 0)
                            {
                                app.screenChange("Favorites.qml")
                                lightwork.x = 0}
                            if(index == 1)
                            {   app.screenChange("KeyPad.qml")
                                lightwork.x = Constants.screen_width/5}
                            if(index == 2)
                                app.screenChange("Recents.qml")
                            lightwork.x = Constants.screen_width*2/5
                            if(index == 3)
                                app.screenChange("Contacts.qml")
                            lightwork.x = Constants.screen_width*3/5
                            if(index == 4)
                                app.screenChange("Phone.qml")
                            lightwork.x = Constants.screen_width*4/5
                        }
                    }
                }
            }

        }

        Row {
            id:rowhome2
            spacing: 158
            x : 158
            Repeater{
                model: 4
                Image {
                    id: image1
                    y: 20
                    source: "images/statusbar_timetemp_separator.png"
                }
            }
        }

        Image {
            id: image2
            source: "images/function_separator_phone.png"
            y : Constants.status_bar_height
            x:4
        }
        Rectangle{
            id:lightwork
            width: 160
            height: 2
            color: "blue"
            anchors.top: image2.top
            x : Constants.screen_width*2/5
        }
        Item{
            id : view_top_right
            Image {
                id: image3
                source: "images/onstar_small.png"
                scale: 0.8
                x: 730
                y: 75
            }
            Text {
                id : text1
                text : "-- Matches           Jarvis"
                color: "#dda525"
                font.pointSize: 18
                x : 470
                y : 75
            }
        }
    }



    Item {
        id : recents
        // width: Constants.screen_width
        //  height: Constants.screen_height -140
        //color: "black"
        Image {
            id: up
            source: "images/move_up_inactive.png"
            x:10
            y : 255
            Image {
                id: up2
                visible: false
                source: "images/move_up_active.png"

            }
            MouseArea{
                anchors.fill: parent
                onPressed : up2.visible = true
                onReleased: up2.visible = false
                onClicked: {
                    //if(listview1.currentIndex==6)
                    // {listview1.currentIndex = 4}

                    if(listview1.currentIndex<1)
                    {listview1.currentIndex=0}
                    listview1.currentIndex = listview1.currentIndex - 5

                    if(listview1.currentIndex<1)
                    {listview1.currentIndex=0}

                }

            }
        }
        Image {
            id: down
            source: "images/scroll_down_normal.png"
            x:10
            y : 325

            Image {
                id: down2
                visible: false
                source: "images/scroll_down_highlight.png"

            }
            MouseArea{
                anchors.fill: parent
                onPressed : down2.visible = true
                onClicked:{ if(listview1.currentIndex<0)
                    {
                        listview1.currentIndex =0
                    }

                    listview1.currentIndex =listview1.currentIndex+5
                    if(listview1.currentIndex>6)
                    {listview1.currentIndex=6}


                }
                onReleased: down2.visible = false

            }

        }

        ListModel {
            id: recents_contact
            ListElement {name:"Jonh"}
            ListElement {name: "Mom"}
            ListElement {name : "Pika Kun"}
            ListElement { name : "Boom"}
            ListElement {name : "Husky"}
            ListElement{name : "Pitbull"}
            ListElement {name : "Tumk Kiz"}
        }

        ListView {
            id : listview1
            model: recents_contact
            width: 680
            height: Constants.screen_height- 130-70
            x : 100
            y : 130
            clip: true
            delegate: forlistview
            onContentYChanged: {

                scroll.y  = listview1.visibleArea.yPosition*(listview1.height-100)
            }
            MouseArea {
                anchors.fill: parent
                onPressed: app.screenChange("PhoneActive.qml")
                // onClicked: console.log(2)
            }
        }

        Component {
            id : forlistview
            Item {
                id : rect1
                width: 700
                height: 100
                //color: "black"
                Text {
                    id: text1
                    text: model.name
                    font.pointSize:  25
                    color: (index <2) || (index>4) ? "red": "white"
                    y :10
                    x : 10
                }
                Text {
                    id : time_call
                    text : Textkey.Time_call[index]
                    font.pointSize: 18
                    color: "gray"
                    x :50
                    y :55
                }
                Image {
                    id: image1
                    source: "images/statusbar_separator.png"
                }
                Image {
                    id: fav2
                    source: "images/favorite_inactive.png"
                    anchors.verticalCenter: parent.verticalCenter
                    x: 620
                }
                Image {
                    id: status_call
                    source: "images/missed_call.png"
                    x : 20
                    y : 60
                }
            }
        }
        Rectangle {
            id :scroll_bg
            width: 8
            height: 160
            color: "#424242"
            x:45
            y:85
            Rectangle {
                id :scroll
                width: 8
                height: 50
                color: "white"
                radius: 4
                //                onYChanged: {
                //                    if(scroll_mouse.drag.active)
                //                      //  listview1.contentY = scroll.y/listview1.height*listview1.contentHeight
                //                }

            }
            MouseArea {
                id : scroll_mouse
                anchors.fill: parent
                drag.target: scroll
                drag.axis: Drag.YAxis
                drag.minimumY: 0
                drag.maximumY: scroll_bg.height - 50
                onPositionChanged: {
  listview1.contentY = scroll.y/listview1.height*listview1.contentHeight
                }
            }
        }
    }



}


