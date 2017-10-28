import QtQuick 2.0
import "Constants.js" as Constants

Item {
    property bool hasStatusBar: true
    property int time_hour: 12;
    property int time_minute: 0;
    property bool am: true;
    id: setting_time
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
            text: "Set Time"
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: statusbar_timetemp_separator.right
            anchors.margins: 10
            font.pointSize: 18
            color: "white"
        }
        Image {
            id: separator_next
            source: "images/statusbar_timetemp_separator.png"
            anchors.right: move_right.left
            anchors.verticalCenter: parent.verticalCenter
        }
        Image {
            id: move_right
            source: mouse_move_right.containsMouse?"images/next_highlight.png":"images/next_normal.png"
            anchors.right: parent.right
            MouseArea{
                id: mouse_move_right
                anchors.fill: parent
                onClicked: {
                    app.screenChange("SettingDate.qml")
                }
            }
        }
        Image{
            id: separator
            source: "images/function_separator_horizontal_plain_blue.png"
            anchors.bottom: parent.bottom
        }


    }
    Rectangle{
        id: window2
        width: Constants.screen_width
        height: Constants.screen_height-140
        anchors.top: topBar.bottom
        color: "transparent"
        Rectangle{
            id: time
            height: parent.height
            width: Constants.screen_width-280
            color: "transparent"
            Grid{
                id: row_up
                spacing: 40
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                rows:3; columns: 3
                Image{
                    id: move_up1
                    source: mouse_move_up1.containsMouse?"images/move_up_active.png":"images/move_up_inactive.png"
                    MouseArea{
                        id: mouse_move_up1
                        anchors.fill: parent
                        onClicked: time_hour === 1 ? time_hour = 12 : time_hour -=1;
                    }
                }
                Image{
                    id: move_up2
                    source: mouse_move_up2.containsMouse?"images/move_up_active.png":"images/move_up_inactive.png"
                    MouseArea{
                        id: mouse_move_up2
                        anchors.fill: parent
                        onClicked: time_minute === 0? time_minute = 59 : time_minute -=1;
                    }
                }
                Image{
                    id: move_up3
                    source: mouse_move_up3.containsMouse?"images/move_up_active.png":"images/move_up_inactive.png"
                    MouseArea{
                        id: mouse_move_up3
                        anchors.fill: parent
                        onClicked: am === true ? am = false: am = true
                    }
                }
                Text{
                    id: txt_hour
                    text: time_hour < 10? "0"+time_hour : time_hour
                    color:"white"
                    font.pointSize: 35
                    anchors.centerIn: parent.Center
                    //x : 250
                }
                Text{
                    id: txt_minute
                    text: time_minute < 10? "0"+time_minute : time_minute
                    color:"white"
                    font.pointSize: 35
                    anchors.centerIn: parent.Center
                }
                Text {
                    id: am_pm
                    text: if(am ==true) return "AM"; else return "PM"
                    color:"white"
                    font.pointSize: 35
                    anchors.centerIn: parent.Center
                }
                Image{
                    id: move_down1
                    source: mouse_move_down1.containsMouse?"images/move_down_active1.png":"images/move_down_inactive.png"
                    MouseArea{
                        id: mouse_move_down1
                        anchors.fill: parent
                        onClicked: time_hour === 12 ? time_hour = 1: time_hour +=1
                    }
                }
                Image{
                    id: move_down2
                    source: mouse_move_down2.containsMouse?"images/move_down_active1.png":"images/move_down_inactive.png"
                    MouseArea{
                        id: mouse_move_down2
                        anchors.fill: parent
                        onClicked: time_minute === 59? time_minute = 0 : time_minute +=1;
                    }
                }
                Image{
                    id: move_down3
                    source: mouse_move_down3.containsMouse?"images/move_down_active1.png":"images/move_down_inactive.png"
                    MouseArea{
                        id: mouse_move_down3
                        anchors.fill: parent
                        onClicked: am === true ? am = false: am = true
                    }
                }
            }
        }
        Rectangle{
            id: txt
            height: parent.height
            width: 280
            anchors.left: time.right
            color:"transparent"
            Image {
                id: separator_bar
                source: "images/separator.png"
                anchors.left: parent.left
                height: parent.height
            }
            Rectangle{
                height: parent.height
                width: 260
                anchors.left: separator_bar.right
                anchors.margins: 10
                anchors.top: parent.top
                color: "transparent"
                Text{
                    anchors.fill: parent
                    wrapMode: Text.WordWrap
                    text:"Set Time allows you to manually set the time. Use the controls to adjust the time"
                    color: "white"
                    font.pointSize: 16
                }
            }
        }
    }
}
