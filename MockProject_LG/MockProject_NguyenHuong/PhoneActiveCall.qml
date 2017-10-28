import QtQuick 2.6
import "Constants.js" as Constants

Item {
    property int hour: 0
    property int min: 0
    property int sec: 0
    property int checkPhoneActiveCall: 1
    property var number: ["oo","ABC","DEF","GHI","JKL","MNO","PQRS","TUV","WXYZ"]

    Image {
        id: callEnd
        x: 15; y: 270
        source: (checkPhoneActiveCall != 0)?
        Constants.call_end_active: Constants.call_end_inactive
        MouseArea {
            anchors.fill: parent
            onClicked: {
                if(checkPhoneActiveCall != 0) app.screenChange("PhoneKeypad.qml")
            }
        }
    }

    Image {
        id: inputInKeyPhone
        x:100; y: 90
        source: Constants.keypad_input_bg
        Image {
            id: deleteButton
            anchors.right: parent.right
            source: Constants.delete_normal
        }
        Text {
            id: numberInput
            anchors.centerIn: parent
            color: "white"
            font.pixelSize: 30
            text: ""
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
        visible: false
        x: 450; y: 110
        clip: true
        model: listModelInPhoneKeyPad
        width: 350
        height: 1200
        delegate: Item {
            width: 400; height: 75
            Image {
                source: Constants.statusbar_separator
            }
            Text {
                x: 0; y: 10
                font.pixelSize: 25
                text: name
                color: "white"
            }
            Text {
                x: 0; y:50
                font.pixelSize: 20
                text: "Home|"+numberphone
                color: "#b3b3b3"
            }
        }
    }

    Item {
        id: personInCall
        x: 450; y:110
        width: 350; height: 70
        Text {
          x: 0; y:0
          text: "Christopher Armstrong"
          font.pixelSize: 30
          color: "white"
        }
        Text {
            x: 0; y: 50
            text: "work"
            color: "#b3b3b3"
            font.pixelSize: 20
        }
    }

    Timer {
            id: timer
            interval: 1000; running: true; repeat: true
            onTriggered: {
                sec = sec + 1;
                if (sec === 60) {
                    sec = 0; min = min + 1;
                }
                if (min === 60) {
                    min = 0; hour = hour + 1;
                }
            }
        }

    Text {
        x: 430; y: 300
        text: ((hour < 10)? ("0" + hour) : hour)
              + ":" + ((min < 10)? ("0"+ min): min)
              + ":" + ((sec < 10)? ("0" + sec): sec)
        font.pixelSize: 20
        color: "white"
    }

    Image {
        id: mute
        x:410; y:335
        source: Constants.keypadview_toggle_inactive
        Text {
            anchors.centerIn: parent
            text: "Mute"
            font.pixelSize: 20
            color: "white"
        }
        MouseArea {
            anchors.fill: parent
            onPressed: mute.source = Constants.keypadview_toggle_active
            onReleased: mute.source = Constants.keypadview_toggle_inactive
        }
    }

    Image {
        id: handset
        x: 540; y: 335
        source: Constants.keypadview_toggle_inactive
        Text {
            anchors.centerIn: parent
            text: "Handset"
            font.pixelSize: 20
            color: "white"
        }
        MouseArea {
            anchors.fill: parent
            onPressed: handset.source = Constants.keypadview_toggle_active
            onReleased: handset.source = Constants.keypadview_toggle_inactive
        }
    }

    Image {
        id: addCall
        x: 670; y: 335
        source: Constants.keypadview_toggle_inactive
        Text {
            anchors.centerIn: parent
            text: "Add Call"
            font.pixelSize: 20
            color: "white"
        }
        MouseArea {
            anchors.fill: parent
            onPressed: {
                addCall.source = Constants.keypadview_toggle_active
                timer.running = false
            }
            onReleased: addCall.source = Constants.keypadview_toggle_inactive
        }
    }

    Text {
        id: activeCallName
        x: 30; y: 20
        text: "Active Call"
        color: "white"
        font.pixelSize: 25
    }

    Image {
        y: 70
        anchors.margins: 10
        source: Constants.function_separator_phone
    }

}
