import QtQuick 2.6
import "Constants.js" as Constants

Item {
    id: window1
    property bool hasStatusBar: true
    property int currentIndex: 0;
    property var tab_model: ["System","Apps","Vehicle"]
    Image {
        id: background
        source: "images/bg_main.png"
    }
//    Loader{
//        id: load_window1
//        anchors.fill: parent
//    }
    Rectangle{
        id: topBar
        height: 70
        width: Constants.screen_width
        color: "transparent"
        Row{
            anchors.fill: parent
            spacing: 0.5
            Repeater{
                model: tab_model
                anchors.fill: parent
                delegate: Rectangle{
                    id: wrapper
                    height: parent.height
                    width: parent.width/3
                    color: (currentIndex === model.index? "dodgerblue":"transparent")
                    border.color: "white"
                    Text{
                        text: modelData
                        anchors.fill: parent
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        //color: (mouse_tab.containsMouse? "black":"white")
                        color: "white"
                        font.pointSize: 16
                    }
                    MouseArea{
                        id: mouse_tab
                        anchors.fill: parent
                        onClicked: {
                            flickable.state = 'system'
                            currentIndex = index;
                            flickable.state = 'tab'
                        }
                    }
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
        color:"transparent"
        Flickable{
            id: flickable
            anchors.fill: parent
            height: Constants.screen_height-140
            contentWidth: Constants.screen_width*tab_model.count
            onContentXChanged: {
                currentIndex = Math.round(contentX/Constants.screen_width)
            }
            onMovementEnded: { //When movement end, we will move to a screen nearest
                flickable.state = 'system'
                flickable.state = 'tab'
            }
            states: [
                State { //This is current state when stop movement
                    name: "system"
                    PropertyChanges {
                        target: flickable
                    }
                },
                State {//This is state we need to move
                    name: "tab"
                    PropertyChanges {
                        target: flickable
                        contentX: currentIndex*Constants.screen_width
                    }
                }
            ]
            transitions: Transition {//Control animation of contentX
                NumberAnimation{
                    properties: "contentX"
                    duration: 200
                }
            }
            Rectangle{
                id: rect
                width: Constants.screen_width*tab_model.count
                height: parent.height
                SettingSystem2{
                    id: system
                    anchors.left: parent.left
                }

                SettingApps{
                    id: apps
                    anchors.left: system.right
                }
                SettingVehicle{
                    id: vehicle
                    anchors.left: apps.right
                }

            }
        }
    }
}
//    Text {
//        width: Constants.screen_width
//        height: Constants.screen_height
//        font.pixelSize: 50
//        text: "Setting System"
//        color: "white"
//        horizontalAlignment: Text.AlignHCenter
//        verticalAlignment: Text.AlignVCenter
//    }

