import QtQuick 2.0
import "Constants.js" as Constants

Rectangle {
    id: settingSystem2
    width: Constants.screen_width
    height: Constants.screen_height-140
    color:"transparent"
    Rectangle{
        id: scrollbar
        Image {
            id: scrollbar_bg_long
            source: "images/scrollbar_bg_long.png"
            height: list_system.height/2
            x: 15
            y: 20
        }
        Image{
            id: scrollbar_indicator_long
            source: "images/scrollbar_indicator_long.png"
            x: scrollbar_bg_long.x+1
            y: 20
            height: Math.pow(list_system.height,2)/(list_system.contentHeight*2)
            onYChanged: {
                if(mouse_scrollbar.drag.active){
                    list_system.contentY = (scrollbar_indicator_long.y-20)*(list_system.contentHeight-list_system.height)/(list_system.height/2-scrollbar_indicator_long.height)
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
                    list_system.contentY>68?list_system.contentY -=68:list_system.contentY =0
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
                    if(list_system.contentY<68*(list_system.count-5)) list_system.contentY +=68
                    else list_system.contentY =68*(list_system.count-5)
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
            id: model_system
            ListElement{name: "Time / Date"; url:"SettingTime.qml"}
            ListElement{name: "Language"; url:"SettingLanguage.qml"}
            ListElement{name: "Phone"; url:""}
            ListElement{name: "Wi-Fi Networks"; url:""}
            ListElement{name: "OnStar Vehicle Hotspot"; url:""}
            ListElement{name: "..."; url:""}
            ListElement{name: "..."; url:""}
            ListElement{name: "..."; url:""}
        }

        ListView{
            id: list_system
            clip: true
            model:model_system
            anchors.fill: parent
            delegate: Rectangle{
                height: 68
                width: parent.width
                color: "transparent"
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

                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                        app.screenChange(model.url)
                    }
                }
            }
            onContentYChanged: {
                if(!mouse_scrollbar.drag.active)
                    scrollbar_indicator_long.y = list_system.contentY*(list_system.height/2-scrollbar_indicator_long.height)/(list_system.contentHeight-list_system.height)+20;
                if(contentY < 0) contentY=0;
                if(contentY > contentHeight - list_system.height) contentY = contentHeight - list_system.height;
            }
        }
    }
}
