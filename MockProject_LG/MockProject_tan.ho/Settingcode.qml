import QtQuick 2.0
import "Constants.js" as Constants

Item {
    Image {
        x: 0
        y: 76
        width: 800
        height: 2
        source: Constants.detent_active
    }

    Image {
        id: back_normal
        anchors.left: parent.left
        source: Constants.back_normal
        MouseArea{
            anchors.fill: parent
            onClicked: {
                app.screenChange("SettingSystem.qml")
            }
        }
    }
    Image {
        id: statusbar_timetemp_separator1
        anchors.left: back_normal.right
        anchors.verticalCenter: back_normal.verticalCenter
        source: Constants.statusbar_timetemp_separator
    }
    Text{
        anchors.left: statusbar_timetemp_separator1.right
        anchors.verticalCenter: statusbar_timetemp_separator1.verticalCenter
        text: "Valet Mode - Enter Code to Lock"
        anchors.verticalCenterOffset: 1
        anchors.leftMargin: 19
        font.pointSize: 18
        color: "white"
    }
    Image {
        id: close_normal
        anchors.right: parent.right
        source: Constants.close_normal
        MouseArea{
            anchors.fill: parent
            onClicked: {
                app.screenChange("Home.qml")
            }
        }
    }
    Image {
        anchors.right: close_normal.left
        anchors.verticalCenter: close_normal.verticalCenter
        source: Constants.statusbar_timetemp_separator
    }
    Item{
        x: 100
        Image {
            x: 392
            y: 320
            width: 130
            height: 60
            id:settings_button_green_normal
            source: Constants.settings_button_green_normal
            Text{
                anchors.centerIn: parent
                text:"Enter"
                font.pointSize: 18
                color: "white"
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    app.screenChange("SettingSystem.qml")
                }
            }
        }
        Image {
            id: delete_highlight
            visible: false
            x: 411
            y: 76
            anchors.rightMargin: -467
            anchors.right : parent.right
            source: Constants.delete_highlight
        }
        Image {
            id: delete_normal
            visible: true
            x: 411
            y: 76
            anchors.rightMargin: -467
            anchors.right : parent.right
            source: Constants.delete_normal
            MouseArea{
                anchors.fill: parent
                onPressed: {
                    var str = txt_1.text
                    if(str !==""){
                        delete_normal.visible = false
                        str = str.substring(0,str.length-1)
                    }
                    txt_1.text = str
                    delete_highlight.visible = true
                }
                onReleased: {
                    delete_normal.visible = true
                    delete_highlight.visible = false
                }
            }
        }
        Rectangle{
            x: 172
            y: 80
            Text{
                id: txt_1
                width: 220
                height: 32
                text:""
                layer.enabled: true
                anchors.centerIn: parent
                font.pointSize: 18
                anchors.verticalCenterOffset: 21
                anchors.horizontalCenterOffset: 110
                color: "white"
            }
        }
        Grid {
            x: 172
            y: 123
            columns: 3
            spacing: 2
            Rectangle { id: rec_1;border.color: "grey";color: "grey"; width: 70; height:50; Text{anchors.centerIn: parent;color: "white"; text: "1";font.pointSize: 18}MouseArea{hoverEnabled: true; anchors.fill: parent;onClicked: {txt_1.text += "1"}onEntered: {rec_1.color="steelblue"}onExited: {rec_1.color="grey"}}}
            Rectangle { id: rec_2;border.color: "grey";color: "grey"; width: 70; height:50; Text{anchors.centerIn: parent;color: "white"; text: "2";font.pointSize: 18}MouseArea{hoverEnabled: true; anchors.fill: parent;onClicked: {txt_1.text += "2"}onEntered: {rec_2.color="steelblue"}onExited: {rec_2.color="grey"}}}
            Rectangle { id: rec_3;border.color: "grey";color: "grey"; width: 70; height:50; Text{anchors.centerIn: parent;color: "white"; text: "3";font.pointSize: 18}MouseArea{hoverEnabled: true; anchors.fill: parent;onClicked: {txt_1.text += "3"}onEntered: {rec_3.color="steelblue"}onExited: {rec_3.color="grey"}}}
            Rectangle { id: rec_4;border.color: "grey";color: "grey"; width: 70; height:50; Text{anchors.centerIn: parent;color: "white"; text: "4";font.pointSize: 18}MouseArea{hoverEnabled: true; anchors.fill: parent;onClicked: {txt_1.text += "4"}onEntered: {rec_4.color="steelblue"}onExited: {rec_4.color="grey"}}}
            Rectangle { id: rec_5;border.color: "grey";color: "grey"; width: 70; height:50; Text{anchors.centerIn: parent;color: "white"; text: "5";font.pointSize: 18}MouseArea{hoverEnabled: true; anchors.fill: parent;onClicked: {txt_1.text += "5"}onEntered: {rec_5.color="steelblue"}onExited: {rec_5.color="grey"}}}
            Rectangle { id: rec_6;border.color: "grey";color: "grey"; width: 70; height:50; Text{anchors.centerIn: parent;color: "white"; text: "6";font.pointSize: 18}MouseArea{hoverEnabled: true; anchors.fill: parent;onClicked: {txt_1.text += "6"}onEntered: {rec_6.color="steelblue"}onExited: {rec_6.color="grey"}}}
            Rectangle { id: rec_7;border.color: "grey";color: "grey"; width: 70; height:50; Text{anchors.centerIn: parent;color: "white"; text: "7";font.pointSize: 18}MouseArea{hoverEnabled: true; anchors.fill: parent;onClicked: {txt_1.text += "7"}onEntered: {rec_7.color="steelblue"}onExited: {rec_7.color="grey"}}}
            Rectangle { id: rec_8;border.color: "grey";color: "grey"; width: 70; height:50; Text{anchors.centerIn: parent;color: "white"; text: "8";font.pointSize: 18}MouseArea{hoverEnabled: true; anchors.fill: parent;onClicked: {txt_1.text += "8"}onEntered: {rec_8.color="steelblue"}onExited: {rec_8.color="grey"}}}
            Rectangle { id: rec_9;border.color: "grey";color: "grey"; width: 70; height:50; Text{anchors.centerIn: parent;color: "white"; text: "9";font.pointSize: 18}MouseArea{hoverEnabled: true; anchors.fill: parent;onClicked: {txt_1.text += "9"}onEntered: {rec_9.color="steelblue"}onExited: {rec_9.color="grey"}}}
            Rectangle { color: "black"; width: 50; height:50; Text{anchors.centerIn: parent;color: "white"; text: ""}}
            Rectangle { id: rec_0;border.color: "grey";color: "grey"; width: 70; height:50; Text{anchors.centerIn: parent;color: "white"; text: "0";font.pointSize: 18}MouseArea{hoverEnabled: true; anchors.fill: parent;onClicked: {txt_1.text += "0"}onEntered: {rec_0.color="steelblue"}onExited: {rec_0.color="grey"}}}
            Rectangle { color: "black"; width: 70; height:50; Text{anchors.centerIn: parent;color: "white"; text: ""}}
        }
    }
}
