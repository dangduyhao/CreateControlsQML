import QtQuick 2.0
import "Constants.js" as Constants

Item {
    Image {
        x: 0
        y: 75
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
        id: month
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
                model: monthData
                delegate: monthDelegate
            }
            ListModel{
                id: monthData
                ListElement{name:"Jan"}
                ListElement{name:"Feb"}
                ListElement{name:"Mar"}
                ListElement{name:"Apr"}
                ListElement{name:"May"}
                ListElement{name:"Jun"}
                ListElement{name:"Jul"}
                ListElement{name:"Aug"}
                ListElement{name:"Sep"}
                ListElement{name:"Oct"}
                ListElement{name:"Nov"}
                ListElement{name:"Dec"}
            }
            Component{
                id: monthDelegate
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
                focus: true
                keyNavigationWraps: true
                model: dayData
                delegate: dayDelegate
            }
            ListModel{
                id: dayData
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
    Item{
        id: year
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
                model: yearData
                delegate: yearDelegate
            }
            ListModel{
                id: yearData
                ListElement{name:"2011"}
                ListElement{name:"2012"}
                ListElement{name:"2013"}
                ListElement{name:"2014"}
                ListElement{name:"2015"}
                ListElement{name:"2016"}
                ListElement{name:"2017"}
                ListElement{name:"2018"}
                ListElement{name:"2019"}
                ListElement{name:"2020"}
                ListElement{name:"2021"}
            }
            Component{
                id: yearDelegate
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
            text: "Set Date allows you to manually set the date. Use the controls to adjust the date."
            anchors.bottomMargin: 0
        }
    }
}
