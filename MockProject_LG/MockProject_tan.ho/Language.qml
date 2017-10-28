import QtQuick 2.0
import "Constants.js" as Constants

Item {
    property int currentId: 0
    Image {
        x: 0
        y: 72
        width: 800
        height: 2
        source: Constants.detent_active
    }
    Image {
        height: 200
        width: 90
        x:0
        y:75
        id: scrollbar
        source: Constants.scrollbar_bg_long
        Rectangle{
            id: rec_scroll
            height: 50
            width: 14
            anchors.horizontalCenter: scrollbar.horizontalCenter
            color: "grey"
            MouseArea{
                anchors.fill: parent
            }
        }
    }
    Image {
        x:5
        y: 274
        id: up
        source: mouseareaup.containsMouse? Constants.scroll_up_highlight:Constants.scroll_up_normal
        MouseArea{
            id:mouseareaup
            anchors.rightMargin: 0
            anchors.bottomMargin: -4
            anchors.leftMargin: 0
            anchors.topMargin: 4
            anchors.fill: parent
            onClicked: {
                currentId = (currentId - 1 + (listViewLanguage_1.count - 1)) % listViewLanguage_1.count + 1
                listViewLanguage_1.currentIndex = currentId
            }
        }
    }

    Image {
        x:5
        y: 350
        id: down
        source: mouseareadown.containsMouse? Constants.scroll_down_highlight:Constants.scroll_down_normal
        MouseArea{
            id: mouseareadown
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0
            anchors.fill: parent
            onClicked: {
                currentId = (currentId % listViewLanguage_1.count)+1
                listViewLanguage_1.currentIndex = currentId - 1
            }
        }
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
        text: "Language"
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
                app.screenChange("SettingSystem.qml")
            }
        }
    }
    Image {
        anchors.right: close_normal.left
        anchors.verticalCenter: close_normal.verticalCenter
        source: Constants.statusbar_timetemp_separator
    }
    Item{
        id: language
        x: 100
        y: 75
        height: 345
        width: 400
        Item{
            x: 100
            y: 75
            height: 345
            width: 400
            anchors.fill: parent
            ListView{
                id: listViewLanguage_1
                anchors.rightMargin: 0
                anchors.bottomMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0
                anchors.fill: parent
                clip: true
                model: languageData
                delegate: languageDelegate
            }
            ListModel{
                id: languageData
                ListElement{name:"English"}
                ListElement{name:"Francais"}
                ListElement{name:"Korean"}
                ListElement{name:"Dutch"}
                ListElement{name:"Chinese"}
                ListElement{name:"Janpanese"}
                ListElement{name:"Brazil"}
                ListElement{name:"American"}
                ListElement{name:"Spanis"}
            }
            Component{
                id: languageDelegate
                Rectangle{
                    width: ListView.view.width
                    height: 80
                    color: listViewLanguage_1.currentIndex === index ? "steelblue":"transfer"
                    Text {
                        anchors.left: parent.left
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.leftMargin: 20
                        font.pointSize: 15
                        text: name
                        color: "white"
                    }
                    Image {
                        id: active
                        visible: false
                        anchors.right: parent.right
                        anchors.verticalCenter: parent.verticalCenter
                        source: Constants.radio_active
                    }
                    Image {
                        id: inactive
                        visible: true
                        anchors.right: parent.right
                        anchors.verticalCenter: parent.verticalCenter
                        source: Constants.radio_inactive
                    }
                    Image {
                        source: Constants.sidebar_divider
                        width: 400
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            listViewLanguage_1.currentIndex = index
                            if(inactive.visible == true){
                                inactive.visible = false
                                active.visible = true
                            }
                            else{
                                inactive.visible = true
                                active.visible = false
                            }
                        }
                    }
                }
            }
        }
    }
    Item{
        x: 506
        y: 76
        width: 250
        height: 321
        Text {
            id: txt
            wrapMode: Text.Wrap
            font.pointSize: 18
            anchors.fill: parent
            color: "white"
            text: "Language indicates the language displayed in the instrument cluster and radio displays. The system may also use the selected language for Voice Recognition and Audio Feedback"
            anchors.rightMargin: 1
            anchors.leftMargin: -1
            anchors.topMargin: 1
            anchors.bottomMargin: -1
        }
    }
}
