import QtQuick 2.6
import QtQuick.Controls 2.2
import QtQuick.Window 2.0
import "Constants.js" as Constants
import "Infor.js" as Textkey

Item {
    id : contact
    visible: true
    signal screenChange(string event)
    Item{
        id :topmain


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
            x : Constants.screen_width*3/5
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
        id: main_contact
        Item {
            id: view_left

            Image {
                id:up
                source: "images/scroll_up_normal.png"
                x : 10
                y : 100
                Image {
                    id:upactive
                    visible: false
                    source: "images/scroll_up_highlight.png"

                }
                MouseArea{
                    anchors.fill: parent
                    onPressed : upactive.visible = true
                    onReleased: upactive.visible = false
                    onClicked: {

                        listvie_main.currentIndex = listvie_main.currentIndex - 8
                        if(listvie_main.currentIndex<0)
                        {listvie_main.currentIndex = 0}


                    }
                }
            }

            Image {
                id:down
                source: "images/scroll_down_normal.png"
                x : 10
                y : 300
                Image {
                    id:downactive
                    visible: false
                    source: "images/scroll_down_highlight.png"

                }
                MouseArea{
                    anchors.fill: parent
                    onPressed : downactive.visible = true
                    onReleased: downactive.visible = false
                    onClicked: {

                        listvie_main.currentIndex = listvie_main.currentIndex +8
                        if(listvie_main.currentIndex>9)
                            listvie_main.currentIndex = 9


                    }
                }
            }
            Rectangle {
                id: view_cont
                width: 80
                height: 60
                color: mousefor_rec1.containsMouse?  "#565681" :"black"
                border.width: 1.5
                border.color: mousefor_rec1.containsMouse?  "#0745b7" : "gray"
                x : 5
                y : 210
                Text {
                    id: rect_text_view_left
                    text: "A-Z"
                    color: "white"
                    font.pointSize: 25
                    anchors.centerIn: parent
                }
                MouseArea {
                    id : mousefor_rec1
                    anchors.fill : parent
                }
            }

        }

        Item{
            id: main_view
            ListView {
                id : listvie_main

                model : 10
                width: 680
                height: 480-130
                x : 100
                y : 140
                clip : true
                delegate: for_contact
                MouseArea {
                    anchors.fill: parent
                    onPressed: {
                        app.screenChange("PhoneActive.qml")
                        //                        Textkey.bientam[Textkey.bientam.length] = Number(listvie_main.currentIndex)

                    }

                }
            }
            Component {
                id : for_contact
                Item {
                    width: 600
                    height: 70
                    Text {
                        id: text_for_contact
                        text: Textkey.Contact_Name[index]
                        font.pointSize: 20
                        color: "white"
                        anchors.verticalCenter: parent.verticalCenter
                        x : 5

                    }
                    Image {
                        id: image_4_contact
                        source: "images/statusbar_separator.png"
                    }

                }
            }
        }






    }
}
