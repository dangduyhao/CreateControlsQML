import QtQuick 2.0
import "Constants.js" as Constants

Item {

    Item {
        x: 10; y: 100
        width: 70; height: 280
        Image {
            id: moveUp
            x: 5; y: 0
            source: Constants.move_up_active
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    listModelInPhoneKeyPad.move(0,listModelInPhoneKeyPad.count - 1,1)
                }
            }
        }
        Rectangle {
            id: fromAtoZ
            x: 2; y: 110
            width: 80; height: 60
            color: "black"
            border.color: "white"
            Text {
                anchors.centerIn: parent
                text: "A-Z"
                font.pixelSize: 30
                color: "white"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    for (var i = 0; i < listModelInPhoneKeyPad.count;i++){
                        for (var j = 0; j< i; j++){
                            if (listModelInPhoneKeyPad.get(j).name>listModelInPhoneKeyPad.get(i).name){
                                var c = listModelInPhoneKeyPad.get(j).name;
                                listModelInPhoneKeyPad.get(j).name = listModelInPhoneKeyPad.get(i).name;
                                listModelInPhoneKeyPad.get(i).name = c;
                            }

                        }
                    }
                }
            }
        }
        Image {
            id: moveDown
            x: 5; y: 205
            source: Constants.move_down_active
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    listModelInPhoneKeyPad.move(listModelInPhoneKeyPad.count - 1,0,1)
                }
            }
        }
    }

    ListModel {
        id: listModelInPhoneKeyPad
        ListElement { name: "Christopher Armstrong"; numberphone: "628-754-3456" }
        ListElement { name: "Michelle Roy-Flamand"; numberphone: "247-654-8348" }
        ListElement { name: "Kerri-Lynne Chalmers"; numberphone: "247-534-2346" }
        ListElement { name: "Will Lau"; numberphone: "628-247-3433" }
        ListElement { name: "Bill Gate"; numberphone: "123-342-2234" }
        ListElement { name: "Christopher Armstrong"; numberphone: "628-754-3456" }
        ListElement { name: "Michelle Roy-Flamand"; numberphone: "247-654-8348" }
        ListElement { name: "Kerri-Lynne Chalmers"; numberphone: "247-534-2346" }
        ListElement { name: "Will Lau"; numberphone: "628-247-3433" }
        ListElement { name: "Bill Gate"; numberphone: "123-342-2234" }
        ListElement { name: "Christopher Armstrong"; numberphone: "628-754-3456" }
        ListElement { name: "Michelle Roy-Flamand"; numberphone: "247-654-8348" }
        ListElement { name: "Kerri-Lynne Chalmers"; numberphone: "247-534-2346" }
        ListElement { name: "Will Lau"; numberphone: "628-247-3433" }
        ListElement { name: "Bill Gate"; numberphone: "123-342-2234" }
    }

    ListView {
        id: listViewInPhoneKeyPad
        x: 100; y: 130
        model: listModelInPhoneKeyPad
        clip: true
        width: 700
        height: 4 * 75
        Component.onCompleted: positionViewAtEnd()
        delegate: Item {
            width: 700; height: 75
            Image {
                source: Constants.statusbar_separator
            }
            Text {
                x: 0; y: 10
                font.pixelSize: 25
                text: name
                color: "white"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    onClicked: app.screenChange("PhoneActiveCall.qml")
                }
            }
        }
    }

    Item {
        id: charge
        x: 450; y: 29
        width: 350; height: 80
        Text {
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            anchors.margins: 5
            text: "-- Matches"
            font.pixelSize: 20
            color: "#ffc266"
        }
        Image {
            id: battCharge
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.margins: 5
            source: Constants.bt_batt_charge5
        }
        Image {
            id: onstarSmall
            source: Constants.onstar_small
            anchors.right: battCharge.left
            anchors.rightMargin: 5
            anchors.bottom: parent.bottom
        }
        Text {
            anchors.right: onstarSmall.left
            anchors.bottom: parent.bottom
            anchors.margins: 5
            text: "Jarvis"
            font.pixelSize: 20
            color: "#ffc266"
        }
    }

    Row {
        id: selectInPhoneKeyPad
        Item {
         id: favoritesForm
         width:  Constants.screen_width/5
         height: Constants.status_bar_height
         Text {
             anchors.centerIn: parent
             color: "white"
             text: "Favorites"
             font.pixelSize: 20
         }
         Image {
             anchors.right: parent.right
             y: 20
             source: Constants.statusbar_timetemp_separator
         }
        }
        Item {
         id: keypadForm
         width:  Constants.screen_width/5
         height: Constants.status_bar_height
         Text {
             anchors.centerIn: parent
             color: "white"
             text: "Keypad"
             font.pixelSize: 20
         }
         Image {
             anchors.right: parent.right
             y: 20
             source: Constants.statusbar_timetemp_separator
         }
         MouseArea {
             anchors.fill: parent
             onClicked: app.screenChange("PhoneKeypad.qml")
         }
        }
        Item {
         id: recentsForm
         width:  Constants.screen_width/5
         height: Constants.status_bar_height
         Text {
             anchors.centerIn: parent
             color: "white"
             text: "Recents"
             font.pixelSize: 20
         }
         Image {
             anchors.right: parent.right
             y: 20
             source: Constants.statusbar_timetemp_separator
         }
         MouseArea {
             anchors.fill: parent
             onClicked: app.screenChange("PhoneRecent.qml")
         }
        }
        Item {
         id: contactsForm
         width:  Constants.screen_width/5
         height: Constants.status_bar_height
         Text {
             anchors.centerIn: parent
             color: "white"
             text: "Contacts"
             font.pixelSize: 20
         }
         Image {
             anchors.right: parent.right
             y: 20
             source: Constants.statusbar_timetemp_separator
         }
        }
        Item {
         id: phonesForm
         width:  Constants.screen_width/5
         height: Constants.status_bar_height
         Text {
             anchors.centerIn: parent
             color: "white"
             text: "Phones"
             font.pixelSize: 20
         }
        }
    }

    Image {
        y: 70
        source: Constants.function_separator_phone
    }

}
