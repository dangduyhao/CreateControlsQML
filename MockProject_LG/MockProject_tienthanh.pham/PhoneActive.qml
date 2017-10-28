import QtQuick 2.6
import QtQuick.Controls 2.2
import QtQuick.Window 2.0
import "Constants.js" as Constants
import "Infor.js" as Textkey
Item {
    id : main2
    visible: true
    property string str: textin1.text
    property int hours: 0
    property int minutes: 0
    property int seconds: 0
    signal screenChange(string event)
    Item {
        id: topmain
        Text {
            id: topmain_text
            text: "Active Call"
            font.pixelSize: 30
            color: "white"
            x: 100
            y : 15
        }

        }
        Image {
            id: image2
            source: "images/function_separator_phone.png"
            y : Constants.status_bar_height
            x:4

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



    Item {
        id : phoneactive
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
                    onPressed:{
                        del.visible = true

                    }
                    onReleased: del.visible = false
                    onClicked:
                        textin1.text = str.substring(0,str.length - 1)

                    onPressAndHold:  textin1.text = str.substring(0,str.length = 0)
                }
            }

        }
        Image {
            id: call_end_inactive
            source: "images/call_end_inactive.png"
            x:15
            y:208
            Image {
                id: call_end_active
                visible: false
                source: "images/call_end_active.png"

            }
            MouseArea {
                anchors.fill: parent
                onPressed:
                    call_end_active.visible = true
                onReleased: {app.screenChange("PhoneKeypad.qml")
                for_call_time.restart()
                }

            }
        }

        Item {
            id: view_right_bottom
            ListModel {
                id : view_right_listmodel
                ListElement{name : "Mute"}
                ListElement{name : "Handset"}
                ListElement{name : "Add Call"}
            }
            Row{

                id:view_right_row
                spacing: 50
                x : 405
                y : 270
                Repeater{
                    id:view_right_repeat
                    model: view_right_listmodel

                    Item {
                        id: view_right_rect
                        width: 80
                        height: 50
                        Image {
                            id: view_right_image
                            source: "images/keypadview_toggle_inactive.png"

                            Image {
                                id: view_right_image_active
                                visible: false
                                source: "images/keypadview_toggle_activated.png"
                            }
                            Image {
                                id: view_right_image_activepress
                                visible: false
                                source: "images/keypadview_toggle_active_press.png"
                            }
                            Image {
                                id: view_right_image_inactivepress
                                visible: false
                                source: "images/keypadview_toggle_inactive_press.png"
                            }
                            Text {
                                id: view_right_text_rect
                                text: model.name
                                font.pointSize: 15
                                color: "white"
                                anchors.centerIn: parent
                            }
                            MouseArea {
                                anchors.fill: parent
                                onPressed: {view_right_image_inactivepress.visible = true
                                    if (view_right_image_active.visible == true)
                                    {view_right_image_activepress.visible = true
                                        view_right_image_inactivepress.visible = false
                                    }
                                }
                                onReleased: {view_right_image_inactivepress.visible = false

                                    view_right_image_active.visible = true
                                    if((view_right_image_activepress.visible == true)&&(view_right_image_active))
                                    {view_right_image_active.visible = false
                                        view_right_image_activepress.visible =false
                                    }

                                }
                            }

                        }
                    }
                }
            }
        }
        Item {
            id : view_right_top
            Item {
                id: call_name
                width: 380
                height: 80
                x : 430
                y : 70
               // color: "gray"
                Text {
                    id: call_name_text
                   text: Textkey.Contact_Name[Textkey.bientam]

                    color: "white"
                    font.pointSize:  22

                }
                  Text{
                      id:type_num
                      text: "Work"
                      color: "gray"
                      font.pixelSize: 18
                      y : 40

                  }
            }

            Text {
                id: text_call_time
                color: "white"
                font.pointSize: 20
                x : 430
                y : 220
            }

            Timer {
                id : for_call_time
                interval: 1000
                running: true
                repeat: true
                onTriggered: {
                     seconds ++
                    if (seconds == 60)
                    {
                        seconds = 0
                        minutes ++
                    }
                       if (minutes == 60)
                       {
                           minutes = 0
                           hours ++
                       }

                    text_call_time.text = hours.toString() +":"+minutes.toString()+":"+seconds.toString()
                }
            }


        }
    }
}
