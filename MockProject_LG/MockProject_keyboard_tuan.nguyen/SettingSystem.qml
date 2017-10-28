import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.3
import "Constants.js" as Constants
TabView {
    property int currentId: 0
    id: frame
    Image {
        height: 200
        width: 90
        x:0
        y:20
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
        y: 220
        id: up
        source: mouseareaup.containsMouse? Constants.scroll_up_highlight:Constants.scroll_up_normal
        MouseArea{
            id:mouseareaup
            anchors.fill: parent
            onClicked: {
                currentId = (currentId - 1 + (listView_1.count - 1)) % listViewLanguage_1.count + 1
                listView_1.currentIndex = currentId
            }
        }
    }

    Image {
        x:5
        y: 290
        id: down
        source: mouseareadown.containsMouse? Constants.scroll_down_highlight:Constants.scroll_down_normal
        MouseArea{
            id: mouseareadown
            anchors.fill: parent
            onClicked: {
                currentId = (currentId % listView_1.count)+1
                listView_1.currentIndex = currentId - 1
            }
        }
    }
    Tab {
        id: tab_1
        title: "System"
        Item{
            id: system
            x: 100
            y: 0

            ListView{
                id: listView_1
                clip: true
                width: 700
                height: 350
                model: systemData
                delegate: systemDelegate
                spacing: 5
            }
            ListModel{
                id: systemData
                ListElement{name:"Time / Date"; url:"TimeDate.qml"}
                ListElement{name:"Language"; url:"Language.qml"}
                ListElement{name:"Phone"; url:"PhoneKeypad.qml"}
                ListElement{name:"Wi-Fi Networks"; url:"Wifi.qml"}
                ListElement{name:"Onstar Vehicle Hotspot"; url:"OnstarTBT.qml"}
            }
            Component{
                id: systemDelegate
                Item{
                    width: ListView.view.width
                    height: 80
                    Text {
                        anchors.left: parent.left
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.leftMargin: 20
                        font.pointSize: 18
                        text: name
                        color: "white"
                    }
                    Image {
                        source: Constants.sidebar_divider
                        width: 700
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            app.screenChange(url)
                        }
                    }
                }
            }
        }
    }
    Tab {
        id: tab_2
        title: "Apps"
        Item{
            x: 100
            ListView{
                id: listView_2
                clip: true
                width: 700
                height: 350
                model: apps
                delegate: appsDelegate
                spacing: 5
            }
            ListModel{
                id: apps
                ListElement{name:"Connected by USB Only"; url:"ConnectUSB.qml"}
                ListElement{name:"Apple CarPlay"; url:"AplleCarplay.qml"}
                ListElement{name:"Audio"; url:"AudioNowPlaying.qml"}
                ListElement{name:"Phone"; url:"PhoneKeypad.qml"}
                ListElement{name:"Video"; url:"Video.qml"}
            }
            Component{
                id: appsDelegate
                Item{
                    width: ListView.view.width
                    height: 80
                    Text {
                        anchors.left: parent.left
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.leftMargin: 20
                        font.pointSize: 18
                        text: name
                        color: "white"
                    }
                    Image {
                        source: Constants.sidebar_divider
                        width: 700
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            listView_2.currentIndex = index
                        }
                    }
                }
            }
        }
    }

    Tab {
        id: tab_3
        title: "Vehicle"
        Item{
            x:100
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    app.screenChange("Settingcode.qml")
                }
            }

        }
    }


    style: TabViewStyle {
        frameOverlap: 1
        tab: Rectangle {
            color: styleData.selected ? "steelblue" :"black"
            border.color:  "white"
            implicitWidth: (800)/3
            implicitHeight: 50
            radius: 2
            Text {
                id: text
                anchors.centerIn: parent
                text: styleData.title
                font.pointSize: 20
                color: "white"
            }
        }
        frame: Item {}
    }
}

