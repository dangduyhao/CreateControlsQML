import QtQuick 2.0
import "Constants.js" as Constants

Rectangle {
    id: settingVehicle
    width: Constants.screen_width
    height: Constants.screen_height-140
    color:"transparent"
    visible: true
    Rectangle{
        height: 68
        width: parent.width
        color: "transparent"
        Image {
            source: "images/function_separator.png"
            anchors.bottom: parent.bottom
        }
        Text{
            text: "Setting Code"
            color: "white"
            font.pointSize: 18
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 5
        }
        MouseArea{
            anchors.fill: parent
            onClicked:{
                app.screenChange("SettingCode.qml")
            }
        }
    }
}

