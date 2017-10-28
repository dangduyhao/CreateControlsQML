import QtQuick 2.0
import "Constants.js" as Constants

Item {

    Item {
        x: 10; y: 100
        width: 70; height: 300
        Rectangle {
            id: placeOfMyScroll
            x: 33; y: 0
            width: 10; height: 170
            color: "#262626"
            Rectangle {
                id: myScroll
                x: 2.5; y: 0
                width: 5; height: 50
                color: "white"
                onYChanged: {
                    if(mouse.drag.active){
                        var d = myScroll.y * (listModelInPhoneKeyPad.count - 1) / (placeOfMyScroll.height - myScroll.height)
                        listViewInPhoneKeyPad.contentY =  Math.round(d) * 80
                        console.log(listViewInPhoneKeyPad.contentY)
                    }
                }
                MouseArea {
                    id: mouse
                    anchors.fill: parent
                    drag.target: parent
                    drag.axis: Drag.YAxis
                    drag.minimumY: 0
                    drag.maximumY: placeOfMyScroll.height - myScroll.height
                }
            }
        }
        Image {
            id: moveDown
            x: 0; y: 235
            source: Constants.move_down_active
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (listViewInPhoneKeyPad.contentY != 0)
                        listViewInPhoneKeyPad.contentY -= 80
                }
            }
        }
        Image {
            id: moveUp
            x: 0; y: 170
            source: Constants.move_up_active
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (listViewInPhoneKeyPad.contentY != 80*(listModelInPhoneKeyPad.count - 1))
                        listViewInPhoneKeyPad.contentY += 80
                }
            }
        }
    }

    ListModel {
        id: listModelInPhoneKeyPad
        ListElement { name: "AChristopher Armstrong"; numberphone: "628-754-3456" }
        ListElement { name: "BMichelle Roy-Flamand"; numberphone: "247-654-8348" }
        ListElement { name: "CKerri-Lynne Chalmers"; numberphone: "247-534-2346" }
        ListElement { name: "DWill Lau"; numberphone: "628-247-3433" }
        ListElement { name: "EBill Gate"; numberphone: "123-342-2234" }
        ListElement { name: "FChristopher Armstrong"; numberphone: "628-754-3456" }
        ListElement { name: "GMichelle Roy-Flamand"; numberphone: "247-654-8348" }
        ListElement { name: "HKerri-Lynne Chalmers"; numberphone: "247-534-2346" }
        ListElement { name: "JWill Lau"; numberphone: "628-247-3433" }
        ListElement { name: "Bill Gate"; numberphone: "123-342-2234" }
        ListElement { name: "1Christopher Armstrong"; numberphone: "628-754-3456" }
        ListElement { name: "2Michelle Roy-Flamand"; numberphone: "247-654-8348" }
        ListElement { name: "3Kerri-Lynne Chalmers"; numberphone: "247-534-2346" }
        ListElement { name: "4Will Lau"; numberphone: "628-247-3433" }
        ListElement { name: "Bill Gate"; numberphone: "123-342-2234" }
        ListElement { name: "Christopher Armstrong"; numberphone: "628-754-3456" }
        ListElement { name: "Michelle Roy-Flamand"; numberphone: "247-654-8348" }
        ListElement { name: "Kerri-Lynne Chalmers"; numberphone: "247-534-2346" }
        ListElement { name: "Will Lau"; numberphone: "628-247-3433" }
        ListElement { name: "Bill Gate"; numberphone: "123-342-2234" }
    }

    ListView {
        id: listViewInPhoneKeyPad
        x: 100; y: 150
        model: listModelInPhoneKeyPad
        width: 700
        height: 3 * 80
        clip: true
        delegate: Item {
            width: 700; height: 80
            Image {
                source: Constants.function_separator
            }
            Text {
                x: 0; y: 10
                font.pixelSize: 25
                text: name
                color: "red"
            }
            Image {
                x: 0; y:50
                source: Constants.missed_call
            }
            Image {
                x: 600; y: 0
                source: Constants.favorite_inactive
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    onClicked: app.screenChange("PhoneActiveCall.qml")
                }
            }
        }
        onContentYChanged: {
            var d = (placeOfMyScroll.height - myScroll.height) / ((listModelInPhoneKeyPad.count - 1) * 80)
            myScroll.y = listViewInPhoneKeyPad.contentY * d
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
         MouseArea {
             anchors.fill: parent
             onClicked: app.screenChange("PhoneContact.qml")
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
