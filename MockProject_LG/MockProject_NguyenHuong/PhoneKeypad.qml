import QtQuick 2.6
import "Constants.js" as Constants

Item {
    id: rootKeypad
    signal activated(var a, var b, var c)
    property int checkPhoneKey: 0
    property var number: ["oo","ABC","DEF","GHI","JKL","MNO","PQRS","TUV","WXYZ"]

    Image {
        id: favorite
        x: 15; y: 80
        source: (checkPhoneKey !=0 )?
        Constants.favorite_active: Constants.favorite_inactive
    }

    Image {
        id: inputInKeyPhone
        x:100; y: 90
        source: Constants.keypad_input_bg
        Image {
            id: deleteButton
            anchors.right: parent.right
            source: Constants.delete_normal
            MouseArea {
                anchors.fill: parent
                onPressed: {
                    numberInput.text = numberInput.text.slice(0,-1)
                }
                onPressAndHold: {
                    numberInput.text = ""
                    deleteButton.source = Constants.delete_highlight
                }
                onReleased: {
                    deleteButton.source = Constants.delete_normal
                }
            }
        }
        Text {
            id: numberInput
            anchors.centerIn: parent
            color: "white"
            font.pixelSize: 30
            text: ""
        }
    }

    Image {
        id: makeCall
        x: 15; y: 270
        source: (checkPhoneKey != 0)?
        Constants.make_call_active: Constants.make_call_inactive
        MouseArea {
            anchors.fill: parent
            onClicked: {
                if(checkPhoneKey != 0) app.screenChange("PhoneActiveCall.qml")
            }
        }
    }

    Grid {
        id: checkNumber01
        x: 100
        anchors.top: inputInKeyPhone.bottom
        anchors.margins: 5
        spacing: 2
        columns: 3
        Repeater {
            model: 9
            Rectangle {
                id: test01
                width: (inputInKeyPhone.width-4)/3
                height: 60
                color: "#4d4d4d"
                Text {
                    anchors.left: parent.left
                    anchors.margins: 5
                    font.pixelSize: 45
                    text: index + 1
                    color: "white"
                }
                Text {
                    anchors.centerIn: parent
                    font.pixelSize: 15
                    text: number[index]
                    color: "white"
                }
                MouseArea {
                    anchors.fill: parent
                    onPressed: {
                        numberInput.text += index+1
                        test01.color = "blue"
                    }
                    onReleased: {
                        test01.color = "#4d4d4d"
                        if (numberInput.text.length === 3||numberInput.text.length === 7)
                            numberInput.text += "-"
                        if (numberInput.text.length === 4 && numberInput.text[3] !== "-")
                            numberInput.text = numberInput.text.slice(0,3)+"-"+numberInput.text.slice(3)
                        if (numberInput.text.length === 8 && numberInput.text[7] !== "-")
                            numberInput.text = numberInput.text.slice(0,7)+"-"+numberInput.text.slice(7)
                        for(var i = 0; i< listModelInPhoneKeyPad.count;i++) {
                            if(numberInput.text === listModelInPhoneKeyPad.get(i).numberphone){
                                listModelInPhoneKeyPad.move(i,0,1);
                                checkPhoneKey = 1;
                                listViewInPhoneKeyPad.currentIndex = 0;
                                listViewInPhoneKeyPad.highlightFollowsCurrentItem = true;
                            }
                        }
                        for (var i1 = 0; i1 < listModelInPhoneKeyPad.count; i1++) {
                            for( var j = 0; j < listModelInPhoneKeyPad.get(i1).numberphone.toString().length+1; j++) {
                                for (var k =0; k < j; k++) {
                                    if (numberInput.text === listModelInPhoneKeyPad.get(i1).numberphone.toString().slice(k,j)) {
                                         rootKeypad.activated(k,j,i1)
                                         listModelInPhoneKeyPad.move(i1,0,1)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    Row {
        id:checkNumber02
        x: 100
        anchors.top: checkNumber01.bottom
        anchors.margins: 2
        spacing: 2
        Rectangle {
            id: notCheck01
            width: (inputInKeyPhone.width-4)/3
            height: 60
            color: "#4d4d4d"
            Text {
                anchors.left: parent.left
                anchors.margins: 5
                font.pixelSize: 45
                text: "*"
                color: "white"
            }
            Text {
                anchors.centerIn: parent
                font.pixelSize: 15
                text: "."
                color: "white"
            }
            MouseArea {
                anchors.fill: parent
                onPressed: notCheck01.color = "red"
                onReleased: notCheck01.color = "#4d4d4d"
            }
        }
        Rectangle {
            id: test02
            width: (inputInKeyPhone.width-4)/3
            height: 60
            color: "#4d4d4d"
            Text {
                anchors.left: parent.left
                anchors.margins: 5
                font.pixelSize: 45
                text: "0"
                color: "white"
            }
            Text {
                anchors.centerIn: parent
                font.pixelSize: 15
                text: "+"
                color: "white"
            }
            MouseArea {
                anchors.fill: parent
                onPressed: {
                    numberInput.text += 0
                    test02.color = "blue"
                }
                onReleased: {
                    test02.color = "#4d4d4d"
                    if (numberInput.text.length === 3||numberInput.text.length === 7)
                        numberInput.text += "-"
                    if (numberInput.text.length === 4 && numberInput.text[3] !== "-")
                        numberInput.text = numberInput.text.slice(0,3)+"-"+numberInput.text.slice(3)
                    if (numberInput.text.length === 8 && numberInput.text[7] !== "-")
                        numberInput.text = numberInput.text.slice(0,7)+"-"+numberInput.text.slice(7)
                    for(var i = 0; i< listModelInPhoneKeyPad.count;i++) {
                        if(numberInput.text === listModelInPhoneKeyPad.get(i).numberphone){
                            listModelInPhoneKeyPad.move(i,0,1);
                            checkPhoneKey = 1;
                            listViewInPhoneKeyPad.currentIndex = 0;
                            listViewInPhoneKeyPad.highlightFollowsCurrentItem = true;
                        }
                    }
                    for (var i1 = 0; i1 < listModelInPhoneKeyPad.count; i1++) {
                        for( var j = 0; j < listModelInPhoneKeyPad.get(i1).numberphone.toString().length+1; j++) {
                            for (var k =0; k < j; k++) {
                                if (numberInput.text === listModelInPhoneKeyPad.get(i1).numberphone.toString().slice(k,j)) {
                                     rootKeypad.activated(k,j,i1)
                                     listModelInPhoneKeyPad.move(i1,0,1)
                                }
                            }
                        }
                    }
                }
            }
        }
        Rectangle {
            id: notCheck02
            width: (inputInKeyPhone.width-4)/3
            height: 60
            color: "#4d4d4d"
            Text {
                anchors.left: parent.left
                anchors.margins: 5
                font.pixelSize: 45
                text: "#"
                color: "white"
            }
            MouseArea {
                anchors.fill: parent
                onPressed: notCheck02.color = "red"
                onReleased: notCheck02.color = "#4d4d4d"
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
        ListElement { name: "Obama"; numberphone: "100-342-2234" }
        ListElement { name: "Meta Hiralen"; numberphone: "123-002-2234" }
    }

    ListView {
        id: listViewInPhoneKeyPad
        x: 450; y: 110
        visible: false
        model: listModelInPhoneKeyPad
        width: 350
        height: 4 * 75
        clip: true
        highlight: Rectangle {color: "red"}
        highlightFollowsCurrentItem: false
        Component.onCompleted: positionViewAtBeginning()
        delegate: Item {
            width: 400; height: 75
            Image {
                source: Constants.statusbar_separator
            }
            TextEdit {
                x: 0; y: 10
                font.pixelSize: 25
                text: name
                color: "white"
            }
            TextEdit {
                id: textnumber
                x: 0; y:50
                font.pixelSize: 20
                text: "Home|"+numberphone
                color: "#b3b3b3"
                Connections {
                   target: rootKeypad
                   onActivated: {
                      if(index === c) textnumber.select(a+5,b+5)
                   }
                }
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    onClicked: app.screenChange("PhoneActiveCall.qml")
                }
            }
        }
    }

    Image {
        id: loading
        x: 500; y: 160
        source: Constants.activity_indicator_large
        NumberAnimation on rotation {
            from: 0
            to: 360
            duration: 2000
            loops: Animation.Infinite
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                listViewInPhoneKeyPad.visible = true
                loading.visible = false
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
            text: "%1$d mins"
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

