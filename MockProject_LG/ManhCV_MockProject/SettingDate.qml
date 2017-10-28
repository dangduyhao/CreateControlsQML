import QtQuick 2.0
import "Constants.js" as Constants

Item {
    property bool hasStatusBar: true
    property int time_day: 1;
    property var time_month: ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"];
    property int index_month: 0;
    property int time_year: 2017;
    property int max_day: 0;
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
                    app.screenChange("SettingTime.qml")
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
            text: "Set Date"
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
                    app.screenChange("SettingSystem.qml")
                }
            }
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
                        onClicked: index_month === 0 ? index_month = 11 : index_month -=1;
                    }
                }
                Image{
                    id: move_up2
                    source: mouse_move_up2.containsMouse?"images/move_up_active.png":"images/move_up_inactive.png"
                    MouseArea{
                        id: mouse_move_up2
                        anchors.fill: parent
                        onClicked: {
                            if(index_month ==1){
                                if((time_year%4==0 && time_year%100!=0)|| time_year%400==0) max_day = 29;
                                else max_day = 28
                            }else if (index_month == 4|| index_month==6 || index_month==9||index_month==11) max_day= 30
                            else max_day = 31

                            if(time_day == 1) time_day = max_day; else time_day -=1;
                        }
                    }
                }
                    Image{
                        id: move_up3
                        source: mouse_move_up3.containsMouse?"images/move_up_active.png":"images/move_up_inactive.png"
                        MouseArea{
                            id: mouse_move_up3
                            anchors.fill: parent
                            onClicked: time_year === 0 ? time_year = 2017: time_year -= 1;
                        }
                    }
                    Text{
                        id: txt_month
                        text: time_month[index_month]
                        color:"white"
                        font.pointSize: 32
                        anchors.centerIn: parent.Center
                        //x : 250
                    }
                    Text{
                        id: txt_date
                        text: time_day < 10? "0"+time_day : time_day
                        color:"white"
                        font.pointSize: 32
                        anchors.centerIn: parent.Center
                    }
                    Text {
                        id: txt_year
                        text: time_year
                        color:"white"
                        font.pointSize: 32
                        anchors.centerIn: parent.Center
                    }
                    Image{
                        id: move_down1
                        source: mouse_move_down1.containsMouse?"images/move_down_active1.png":"images/move_down_inactive.png"
                        MouseArea{
                            id: mouse_move_down1
                            anchors.fill: parent
                            onClicked: index_month === 11 ? index_month = 0 : index_month +=1;
                        }
                    }
                    Image{
                        id: move_down2
                        source: mouse_move_down2.containsMouse?"images/move_down_active1.png":"images/move_down_inactive.png"
                        MouseArea{
                            id: mouse_move_down2
                            anchors.fill: parent
                            onClicked: time_day === max_day? time_day = 1 : time_day +=1;
                        }
                    }
                    Image{
                        id: move_down3
                        source: mouse_move_down3.containsMouse?"images/move_down_active1.png":"images/move_down_inactive.png"
                        MouseArea{
                            id: mouse_move_down3
                            anchors.fill: parent
                            onClicked: time_year +=1
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
                        text:"Set Date allows you to manually set the date. Use the controls to adjust the date"
                        color: "white"
                        font.pointSize: 16
                    }
                }
            }
        }
    }
