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
                app.screenChange("TimeDate.qml")
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
        text: "Set Date"
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
        id: hour
        x: 100
        y: 100
        height: 200
        width: 100
        Image{
            id: moveup_1
            anchors.left: parent.left
            source: mousearea_1.containsMouse ? Constants.move_up_active: Constants.move_up_inactive
            MouseArea{
                id: mousearea_1
                anchors.fill: parent
                onClicked: {
                    listView_1.currentIndex -=1
                }
            }
        }

        Image{
            id: movedown_1
            anchors.bottom: parent.bottom
            source: mousearea_2.containsMouse ? Constants.scroll_down_highlight: Constants.scroll_down_normal
            MouseArea{
                id: mousearea_2
                anchors.fill: parent
                onClicked: {
                    listView_1.currentIndex +=1
                }
            }
        }
        Item{
            x: 0
            y: 81
            height: 38
            width: 75
            ListView{
                id: listView_1
                anchors.fill: parent
                clip: true
                model: hourData
                delegate: hourDelegate
            }
            ListModel{
                id: hourData
                ListElement{name:"1"}
                ListElement{name:"2"}
                ListElement{name:"3"}
                ListElement{name:"4"}
                ListElement{name:"5"}
                ListElement{name:"6"}
                ListElement{name:"7"}
                ListElement{name:"8"}
                ListElement{name:"9"}
                ListElement{name:"10"}
                ListElement{name:"11"}
                ListElement{name:"12"}
            }
            Component{
                id: hourDelegate
                Item{
                    width: ListView.view.width
                    height: 38
                    Text {
                        anchors.centerIn: parent
                        font.pointSize: 15
                        text: name
                        color: "white"
                    }
                }
            }
        }
    }
    Item{
        id: minute
        x: 250
        y: 100
        height: 200
        width: 100
        Image{
            id: moveup_2
            anchors.left: parent.left
            source: mousearea_12.containsMouse ? Constants.move_up_active: Constants.move_up_inactive
            MouseArea{
                id: mousearea_12
                anchors.fill: parent
                onClicked: {
                    listView_2.currentIndex -=1
                }
            }
        }
        Image{
            id: movedown_2
            anchors.bottom: parent.bottom
            source: mousearea_22.containsMouse ? Constants.scroll_down_highlight: Constants.scroll_down_normal
            MouseArea{
                id: mousearea_22
                anchors.fill: parent
                onClicked: {
                    listView_2.currentIndex +=1
                }
            }
        }

        Item {
            x: 0
            y: 81
            width: 75
            height: 38
            ListView{
                id: listView_2
                anchors.fill: parent
                clip: true
                keyNavigationWraps: true
                model: minuteData
                delegate: minuteDelegate
            }
            ListModel{
                id: minuteData
                ListElement{name:"1"}
                ListElement{name:"2"}
                ListElement{name:"3"}
                ListElement{name:"4"}
                ListElement{name:"5"}
                ListElement{name:"6"}
                ListElement{name:"7"}
                ListElement{name:"8"}
                ListElement{name:"9"}
                ListElement{name:"10"}
                ListElement{name:"11"}
                ListElement{name:"12"}
                ListElement{name:"13"}
                ListElement{name:"14"}
                ListElement{name:"15"}
                ListElement{name:"16"}
                ListElement{name:"17"}
                ListElement{name:"18"}
                ListElement{name:"19"}
                ListElement{name:"20"}
                ListElement{name:"21"}
                ListElement{name:"22"}
                ListElement{name:"23"}
                ListElement{name:"24"}
                ListElement{name:"25"}
                ListElement{name:"26"}
                ListElement{name:"27"}
                ListElement{name:"28"}
                ListElement{name:"29"}
                ListElement{name:"30"}
                ListElement{name:"31"}
                ListElement{name:"32"}
                ListElement{name:"33"}
                ListElement{name:"34"}
                ListElement{name:"35"}
                ListElement{name:"36"}
                ListElement{name:"37"}
                ListElement{name:"38"}
                ListElement{name:"39"}
                ListElement{name:"40"}
                ListElement{name:"41"}
                ListElement{name:"42"}
                ListElement{name:"43"}
                ListElement{name:"44"}
                ListElement{name:"45"}
                ListElement{name:"46"}
                ListElement{name:"47"}
                ListElement{name:"48"}
                ListElement{name:"49"}
                ListElement{name:"50"}
                ListElement{name:"51"}
                ListElement{name:"52"}
                ListElement{name:"53"}
                ListElement{name:"54"}
                ListElement{name:"55"}
                ListElement{name:"56"}
                ListElement{name:"57"}
                ListElement{name:"58"}
                ListElement{name:"59"}

            }
            Component{
                id: minuteDelegate
                Item{
                    width: ListView.view.width
                    height: 38
                    Text {
                        anchors.centerIn: parent
                        font.pointSize: 15
                        text: name
                        color: "white"
                    }
                }
            }
        }
    }
    Item{
        id: day
        x: 400
        y: 100
        height: 200
        width: 100
        Image{
            id: moveup_3
            anchors.left: parent.left
            source: mousearea_31.containsMouse ? Constants.move_up_active: Constants.move_up_inactive
            MouseArea{
                id: mousearea_31
                anchors.fill: parent
                onClicked: {
                    listView_3.currentIndex -=1
                }
            }
        }
        Image{
            id: movedown_3
            anchors.bottom: parent.bottom
            source: mousearea_32.containsMouse ? Constants.scroll_down_highlight: Constants.scroll_down_normal
            MouseArea{
                id: mousearea_32
                anchors.fill: parent
                onClicked: {
                    listView_3.currentIndex +=1
                }
            }
        }

        Item {
            x: 0
            y: 81
            width: 75
            height: 38
            ListView{
                id: listView_3
                anchors.fill: parent
                clip: true
                model: dayData
                delegate: dayDelegate
            }
            ListModel{
                id: dayData
                ListElement{name:"AM"}
                ListElement{name:"PM"}
            }
            Component{
                id: dayDelegate
                Item{
                    width: ListView.view.width
                    height: 38
                    Text {
                        anchors.centerIn: parent
                        font.pointSize: 15
                        text: name
                        color: "white"
                    }
                }
            }
        }

    }
    Image {
        x: 530
        y: 78
        width: 2
        height: 345
        source: Constants.separator
    }
    Item{
        x: 550
        y: 100
        width: 250
        height: 321
        Text {
            id: txt
            wrapMode: Text.Wrap
            font.pointSize: 15
            anchors.fill: parent
            color: "white"
            text: "Set Time allows you to manually set the time. Use the controls to adjust the time."
            anchors.bottomMargin: 0
        }
    }
}
