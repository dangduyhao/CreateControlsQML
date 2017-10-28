import QtQuick 2.6
import "Constants.js" as Constants
Item {
    id:root
    PhoneActive{id: loadPhoneActive ; visible: false}
    // main menu
    ListView{
        id: listviewcontains
        y: Constants.status_bar_height+1
        width: parent.width
        height: 340
        clip:true
        anchors.top : rectopbar.bottom
        orientation: ListView.Horizontal
        snapMode: ListView.SnapToItem
        highlightRangeMode: ListView.StrictlyEnforceRange
        highlightMoveVelocity: 2000
        model: listmodel
        delegate: Loader{
            width: 800
            height: 340
            source: url
        }
        onCurrentIndexChanged: {
            listviewtop.currentIndex = listviewcontains.currentIndex
        }
    }
    // top bar status
    Rectangle{
        id: rectopbar
        width: Constants.screen_width
        height:  Constants.status_bar_height
        color: "transparent"
        focus:true
        ListView{
            id: listviewtop
            width: parent.width
            height: parent.height
            orientation: ListView.Horizontal
            model: listmodel
            delegate: delegateTopbar
        }
    }
    Image {
        y: Constants.status_bar_height
        source: "images/function_separator_phone.png"
    }
    // delegate of topbar status
    Component{
        id: delegateTopbar
        Rectangle{
            id: recdelegate
            width: Constants.screen_width/5
            height: Constants.status_bar_height
            color: (listviewtop.currentIndex===index) ? "#2c3e50": "transparent"
            clip:true
            focus: true
            radius:15
            Text {
                anchors.centerIn: parent
                text: name
                color: "white"
                font.pointSize: 20
            }
            Image{
                anchors.right: parent.right
                y: parent.height/4
                height: parent.height/2
                source: "images/separator.png"
            }
            MouseArea{
                id: mousearea
                anchors.fill: parent
                onClicked: {
                    listviewcontains.contentX = Constants.screen_width*index
                    listviewtop.currentIndex = index
                    console.log( listviewcontains.contentX)
                }
            }
        }
    }
    ListModel{
        id: listmodel
        ListElement{name:"Favorites";url: "Favorites.qml"}
        ListElement{name:"Keypad";url: "Keypad.qml"}
        ListElement{name:"Recents";url: "Recents.qml"}
        ListElement{name:"Contacts";url: "Contacts.qml"}
        ListElement{name:"Phones";url: "Phones.qml"}
    }
}
