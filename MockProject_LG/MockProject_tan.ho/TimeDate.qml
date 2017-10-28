
import QtQuick 2.0
import "Constants.js" as Constants
Item {
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
        anchors.left: back_normal.right
        anchors.verticalCenter: back_normal.verticalCenter
        source: Constants.statusbar_timetemp_separator
    }
    ListView{
        id: listView_1
        x: 0
        y: 65
        height: 345
        width: 800
        spacing: 5
        clip: true
        model: datetimeData
        delegate: datetimeDelegate
    }
    ListModel{
        id: datetimeData
        ListElement{name:"Set Date"; url:"Setdate.qml"}
        ListElement{name:"Set Time"; url:"Settime.qml"}
    }
    Component{
        id: datetimeDelegate
        Rectangle{
            width: ListView.view.width
            height: 80
            color: "black"
            border.color: "grey"
            Text {
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                anchors.leftMargin: 20
                font.pointSize: 18
                text: name
                color: "white"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    app.screenChange(url)
                    listView_1.currentIndex = index
                    console.log(index)
                }
            }
        }
    }
}

