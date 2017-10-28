import QtQuick 2.0
import "Constants.js" as Constants

Item {
    property bool hasStatusBar: true
    property int count: 0;
    id: setting_code
    Image {
        id: background
        source: "images/bg_main.png"
    }
    Rectangle{
        id: topBar
        height: 70
        width: Constants.screen_width
        color: "transparent"
        Image {
            id: move_left
            source: mouse_move_left.containsMouse?"images/back_highlight.png":"images/back_normal.png"
            MouseArea{
                id: mouse_move_left
                anchors.fill: parent
                onClicked: {
                    app.screenChange("SettingSystem.qml")
                }
            }
        }
        Image {
            id: statusbar_timetemp_separator
            source: "images/statusbar_timetemp_separator.png"
            anchors.left: move_left.right
            anchors.verticalCenter: parent.verticalCenter
        }
        Text{
            text: "Valet Mode - Enter Code to Lock"
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: statusbar_timetemp_separator.right
            anchors.margins: 10
            font.pointSize: 18
            color: "white"
        }
        Image{
            id: separator
            source: "images/function_separator_horizontal_plain_blue.png"
            anchors.bottom: parent.bottom
        }
        Image {
            id: close
            source: mouse_close.containsMouse?"images/close_highlight.png":"images/close_normal.png"
            anchors.right: parent.right
            MouseArea{
                id: mouse_close
                anchors.fill: parent
                onClicked: {
                    app.screenChange("Home.qml")
                }
            }
        }
    }
    Rectangle{
        id: window2
        width: Constants.screen_width
        height: Constants.screen_height-140
        anchors.top: topBar.bottom
        color:"transparent"
        Row{
            id: row1
            anchors.horizontalCenter: parent.horizontalCenter
            Image {
                id: box1
                source: "images/pinpad_input_bg.png"
                Text {
                    id: num1
                    text: ""
                    color:"white"
                    font.pointSize: 16
                    anchors.centerIn: parent
                }
            }
            Image {
                id: box2
                source: "images/pinpad_input_bg.png"
                Text {
                    id: num2
                    text: ""
                    color:"white"
                    font.pointSize: 16
                    anchors.centerIn: parent
                }
            }
            Image {
                id: box3
                source: "images/pinpad_input_bg.png"
                Text {
                    id: num3
                    text: ""
                    color:"white"
                    font.pointSize: 16
                    anchors.centerIn: parent
                }
            }
            Image {
                id: box4
                source: "images/pinpad_input_bg.png"
                Text {
                    id: num4
                    text: ""
                    color:"white"
                    font.pointSize: 16
                    anchors.centerIn: parent
                }
            }
            Image {
                id: delete_btn
                source: mouse_delete.containsMouse?"images/delete_highlight.png":"images/delete_normal.png"
                MouseArea{
                    id: mouse_delete
                    anchors.fill: parent
                    onClicked: {
                        count==0 ? count=0 : count-=1;
                        num4.text = num3.text
                        num3.text = num2.text
                        num2.text = num1.text
                        num1.text = ""
                    }
                }
            }
        }
        Grid{
            id: grid
            anchors.top: row1.bottom
            rows: 4
            columns: 3
            spacing: 2
            anchors.horizontalCenter: parent.horizontalCenter
            Repeater{
                model: 9
                delegate: Image{
                    source: mouse_num.containsMouse?"images/short_button_highlight.png":"images/short_button_normal.png"
                    Text{
                        text: index+1
                        color: "white"
                        font.pointSize: 30
                        anchors.centerIn: parent
                    }
                    MouseArea{
                        id: mouse_num
                        anchors.fill: parent
                        onClicked: {
                            if(count<4){
                                count+=1
                                num1.text= num2.text
                                num2.text = num3.text
                                num3.text = num4.text
                                num4.text = index+1
                            }
                        }
                    }
                }
            }
        }
        Image {
            anchors.top: grid.bottom
            anchors.horizontalCenter: grid.horizontalCenter
            source: mouse_num0.containsMouse?"images/short_button_highlight.png":"images/short_button_normal.png"
            Text{
                text: "0"
                color: "white"
                font.pointSize: 30
                anchors.centerIn: parent
            }

            MouseArea{
                id: mouse_num0
                anchors.fill: parent
                onClicked: {
                    if(count<4){
                        count+=1
                        num1.text= num2.text
                        num2.text = num3.text
                        num3.text = num4.text
                        num4.text = "0"
                    }
                }
            }

        }
        Rectangle{
            id: enter
            height: 50
            width: 140
            anchors.bottom: parent.bottom
            anchors.margins: 20
            anchors.right: parent.right
            color:count==4?"green":"black"
            Text {
                anchors.centerIn: parent
                text: "Enter"
                color:"white"
                font.pointSize: 20
            }
            MouseArea{
                anchors.fill: parent
                onClicked: if(count==4) app.screenChange("SettingSystem.qml")
            }
        }
    }
}
