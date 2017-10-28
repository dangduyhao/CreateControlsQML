import QtQuick 2.0
import "Constants.js" as Constants

Rectangle {
    id: settingApps
    width: Constants.screen_width
    height: Constants.screen_height-140
    color:"transparent"
    Rectangle{
        id: scrollbar
        Image {
            id: scrollbar_bg_long
            source: "images/scrollbar_bg_long.png"
            height: list_apps.height/2
            x: 15
            y: 20
        }
        Image{
            id: scrollbar_indicator_long
            source: "images/scrollbar_indicator_long.png"
            x: scrollbar_bg_long.x+1
            y: 20
            height: Math.pow(list_apps.height,2)/(list_apps.contentHeight*2)
            onYChanged: {
                if(mouse_scrollbar.drag.active){
                    list_apps.contentY = (scrollbar_indicator_long.y-20)*(list_apps.contentHeight-list_apps.height)/(list_apps.height/2-scrollbar_indicator_long.height)
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
                    list_apps.contentY>68?list_apps.contentY -=68:list_apps.contentY =0
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
                    if(list_apps.contentY<68*(list_apps.count-5)) list_apps.contentY +=68
                    else list_apps.contentY =68*(list_apps.count-5)
                }
            }
        }
    }
    Rectangle{
        id: window3
        color: "transparent"
        height: Constants.screen_height-140
        width: Constants.screen_width- 100
        anchors.right: parent.right
        ListModel{
            id: model_apps
            ListElement{name:"Connected USB Only"}
            ListElement{name:"Apple CarPlay"}
            ListElement{name:"Audio"}
            ListElement{name:"Phone"}
            ListElement{name:"Video"}
            ListElement{name:"6..."}
            ListElement{name:"7..."}
        }
        ListView{
            id: list_apps
            clip: true
            model:model_apps
            anchors.fill: parent
            delegate: Rectangle{
                height: 68
                width: parent.width
                color: "transparent"
                property bool state_toggle: false;
                Image {
                    source: "images/function_separator.png"
                    anchors.bottom: parent.bottom
                }
                Text{
                    text: model.name
                    color: "white"
                    font.pointSize: 18
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 5
                }
                Image {
                    id: toggle
                    anchors.right: parent.right
                    anchors.rightMargin: 10
                    source: if(index<=1)return "images/toggle_inactive_4.png";
                    MouseArea{
                        id: mouse_toggle
                        anchors.fill: parent
                        onClicked:{
                            if(index == 0 || index ==1){
                                if (state_toggle == false){
                                    state_toggle = true;
                                    toggle.source = "images/toggle_active_4.png"
                                }
                                else {
                                    state_toggle = false;
                                    toggle.source = "images/toggle_inactive_4.png"
                                }
                            }
                        }
                    }
                }
            }
            onContentYChanged: {
                if(!mouse_scrollbar.drag.active)
                    scrollbar_indicator_long.y = list_apps.contentY*(list_apps.height/2-scrollbar_indicator_long.height)/(list_apps.contentHeight-list_apps.height)+20;
                if(contentY < 0) contentY=0;
                if(contentY > contentHeight - list_apps.height) contentY = contentHeight - list_apps.height;
            }
        }
    }
}
