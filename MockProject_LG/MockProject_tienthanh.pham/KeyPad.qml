import QtQuick 2.6
import QtQuick.Controls 2.2
import QtQuick.Window 2.0
import "Constants.js" as Constants
import "Infor.js" as Textkey
Item {
    id : main2
    visible: true
    property string str: textin1.text

    signal screenChange(string event)
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
            x : Constants.screen_width/5
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


        id : keypad
        width: Constants.screen_width
        height: Constants.screen_height -140
        visible: true
        y :70
        //color : "pink"
        Grid{
            id : grid1
            rows:4
            columns: 3
            spacing: 2
            x:95
            y : 75
            Repeater{
                model: 12
                Rectangle{
                    width: 98
                    height: 62
                    color: "#2b2b2b"

                    Text {
                        id:inp
                        text: Textkey.Keypad[index]
                        font.pointSize:40
                        color:  mouGrid.containsMouse?"black":"white"
                        anchors.verticalCenter: parent.verticalCenter
                        x :10
                        font.weight: Font.SmallCaps

                    }
                    Text {
                        id: txt2
                        text : Textkey.Keypad[index+12]
                        font.pointSize: 13
                        anchors.verticalCenter: parent.verticalCenter
                        color: mouGrid.containsMouse?"black":"white"
                        x : 45
                    }
                    MouseArea{
                        id:mouGrid
                        anchors.fill:parent
                        onClicked: {
                            textin1.text += inp.text
                            filtering.visible = true
                            time_filtering.restart()
                            lisview.visible = false

                        }

                    }
                }
            }
        }
        Rectangle{
            id : input1
            width: 298
            height: 50
            color: "black"
            border.color: "#2b2b2b"
            border.width: 1.5
            x: 95
            y : 15
            TextInput{
                id : textin1
                width: 296
                height: 50
                font.pointSize: 30
                color: "white"
                x : 20
                anchors.verticalCenter: parent.verticalCenter


            }
            Image {

                id: dele
                source: "images/delete_normal.png"
                anchors.verticalCenter: parent.verticalCenter
                x :242
                Image {
                    id: del
                    visible: false
                    source: "images/delete_highlight.png"
                }
                MouseArea{
                    anchors.fill: parent
                    onPressed: del.visible = true
                    onReleased: del.visible = false
                    onClicked:  textin1.text = str.substring(0,str.length - 1)
                    onPressAndHold:  textin1.text = str.substring(0,str.length = 0)
                }
            }
            Image {
                id: fav
                source: "images/favorite_inactive.png"
                anchors.verticalCenter: parent.verticalCenter
                x : -80
                Image {
                    id: favactive
                    visible: false
                    source: "images/favorite_active.png"
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked:{ if(favactive.visible == false)
                            favactive.visible = true
                        else {favactive.visible = false}

                    }
                }
            }
        }
        Image {
            id: callinactive
            source: "images/make_call_inactive.png"
            x:15
            y:208
            Image {
                id: callactive
                visible: false
                source: "images/make_call_active.png"

            }
            MouseArea {
                anchors.fill: parent
                onPressed:
                    callactive.visible = true
                onReleased: app.screenChange("PhoneActive.qml")
            }
        }
        Image {
            id: filtering
            visible: false
            source: "images/zoom_bubble.png"
            x : 500
            y : 80
        }
        Timer {
            id:time_filtering
            interval: 200
            running: true
            repeat: true
            onTriggered: {filtering.visible = false

                lisview.visible = true
            }

        }

        ListView {
            id : lisview
            model : 10
            visible: true
            width: 680
            height: 480-140
            x : 450
            y :35
            clip :true
            delegate: forlist
            MouseArea {
                anchors.fill: parent
                onPressed: app.screenChange("PhoneActive.qml")
            }
        }
        Component {
            id : forlist
            Item{
                id : rect1
                width: 350
                height: 78
                //color: "black"

                Text {
                    id: text1
                    text: Textkey.Contact_Name[index]
                    font.pointSize:  20
                    color: "white"

                    x:10
                    y:10
                }
                Text {
                    id: text2
                    text: Textkey.Contact_Num[index]
                    color: "gray"
                    font.pointSize: 18
                    x : 95
                    y : 45
                }
                Text {
                    id: text3
                    text: Textkey.Contact_Type[index]
                    color: "gray"
                    font.pointSize: 18
                    x : 10
                    y : 45
                }
                Image {
                    id: image1
                    source: "images/statusbar_separator.png"
                }
                Image {
                    id: image2
                    source: "images/statusbar_timetemp_separator.png"
                    x : 85
                    y: 45
                    scale: 0.8
                }
            }
        }

    }
}
