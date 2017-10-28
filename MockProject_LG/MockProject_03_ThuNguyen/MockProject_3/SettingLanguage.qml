import QtQuick 2.0
import "Constants.js" as Constants

Item {
    property bool hasStatusBar: true

    property var model_language: ["English", "Tiếng Việt","Français","العربية","Deutsch","Nederlands",
        "한국어","日本語","中文"];
    property int curIndex: 0;
    id: setting_language
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
            text: "Language"
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
            id: scrollbar
            anchors.left: parent.left
            color: "transparent"
            Image {
                id: scrollbar_bg_long
                source: "images/scrollbar_bg_long.png"
                height: list_language.height/2
                x: 15
                y: 20
            }
            Image{
                id: scrollbar_indicator_long
                source: "images/scrollbar_indicator_long.png"
                x: scrollbar_bg_long.x+1
                y: 20
                height: Math.pow(list_language.height,2)/(list_language.contentHeight*2)
                onYChanged: {
                    if(mouse_scrollbar.drag.active){
                        list_language.contentY = (scrollbar_indicator_long.y-20)*(list_language.contentHeight-list_language.height)/(list_language.height/2-scrollbar_indicator_long.height)
                    }
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
            Image{
                id: move_up
                source:(mouse_move_up.containsMouse?"images/move_up_active.png":"images/move_up_inactive.png")
                y: scrollbar_bg_long.y + scrollbar_bg_long.height+5
                x: scrollbar_bg_long.x-2
                MouseArea{
                    id: mouse_move_up
                    anchors.fill:parent
                    onClicked: {
                        list_language.contentY>68?list_language.contentY -=68:list_language.contentY =0
                    }
                }
            }
            Image {
                id: move_down
                source: (mouse_move_down.containsMouse?"images/move_down_active1.png":"images/move_down_inactive.png")
                x: scrollbar_bg_long.x-2
                y: move_up.y + move_up.height-5
                MouseArea{
                    id: mouse_move_down
                    anchors.fill: parent
                    onClicked: {
                        if(list_language.contentY<68*(list_language.count-5)) list_language.contentY +=68
                        else list_language.contentY =68*(list_language.count-5)
                    }
                }
            }
        }
        Rectangle{
            id: language
            height: parent.height
            width: parent.width-100-txt.width
            anchors.right: txt.left
            color: "transparent"
            ListView{
                id: list_language
                model: model_language
                anchors.fill: parent
                clip: true
                delegate: Rectangle{
                    height: 68
                    width: parent.width
                    color: "transparent"
                    Image {
                        source: "images/function_separator.png"
                        anchors.bottom: parent.bottom
                        height: 0.5
                    }
                    Text{
                        text: modelData
                        color: "white"
                        font.pointSize: 18
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                    }
                    Image{
                        source: index==curIndex?"images/radio_active.png":"images/radio_inactive.png"
                        anchors.right: parent.right
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked:{
                            curIndex = index
                        }
                    }
                }
                onContentYChanged: {
                    if(!mouse_scrollbar.drag.active)
                        scrollbar_indicator_long.y = list_language.contentY*(list_language.height/2-scrollbar_indicator_long.height)/(list_language.contentHeight-list_language.height)+20;
                    if(contentY < 0) contentY=0;
                    if(contentY > contentHeight - list_language.height) contentY = contentHeight - list_language.height;
                }
            }
        }
        Rectangle{
            id: txt
            height: parent.height
            width: 250
            anchors.right: parent.right
            color:"transparent"
            Rectangle{
                anchors.left: parent.left
                anchors.margins: 10
                height: parent.height
                width: 240
                color: "transparent"
                Text{
                    anchors.fill: parent
                    wrapMode: Text.WordWrap
                    text:"Language indicates the language displayed in the instrument cluster and radio displays. The system may also use the selected language for Voice Recognition and Audio Feedback"
                    color: "white"
                    font.pointSize: 14
                }
            }
        }
    }
}
