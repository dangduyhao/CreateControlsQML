import QtQuick 2.6
import "Constants.js" as Constants
Item {

    id: rootPhoneActive
    property alias setName: nameContact.text
    property alias setDetails: nameDetails.text
    property var second: 00
    property var minutes: 00
    property var hours: 00

    Component.onCompleted: {
        console.log(setName)
    }

    // top bar status
    Item{
        id: rectopbar
        width: Constants.screen_width
        height:  Constants.status_bar_height
        Text{
            text: "Phone Active Call"
            font.pointSize: 30
            color: "white"
        }
        Image{
            anchors.right : parent.right
            source: mousearea.containsMouse ? "images/close_highlight.png":"images/close_normal.png"
            MouseArea{
                id: mousearea
                anchors.fill: parent
                onClicked: app.screenChange("PhoneKeypad.qml")
            }
        }
    }
    Image {
        y: Constants.status_bar_height
        source: "images/function_separator_phone.png"
    }
    // main
    //left PhoneKeypad
    Item{
        id:leftItem
        width: 400
        height: 340
        y: Constants.status_bar_height
        property alias calling: callImage.source
        //star and phone active call
        Item{
            id: phoneActive
            width: parent.width/4
            height: parent.height

            Image {
                id: starImage
                anchors.top: parent.top

                anchors.horizontalCenter: parent.horizontalCenter
                source: "images/favorite_inactive.png"
                MouseArea{
                    id: mouseareastar
                    anchors.fill: parent
                    onClicked: {
                        if (starImage.source === "images/favorite_active.png") starImage.source = "images/favorite_inactive.png"
                        else
                            starImage.source = "images/favorite_active.png"
                    }
                }
            }
            //calling button
            Image {
                id: callImage
                anchors.bottom : parent.bottom
                anchors.bottomMargin: 10
                anchors.horizontalCenter: parent.horizontalCenter
                source:mousecancel.containsMouse? "images/call_end_inactive.png": "images/call_end_active.png"
                MouseArea{
                    id: mousecancel
                    anchors.fill: parent
                    onClicked: {
                        app.screenChange("PhoneKeypad.qml")
                    }
                }
            }
        }


        //key pad
        Item{
            id:keypad
            width: parent.width*3/4
            height: parent.height
            anchors.left : phoneActive.right

            // input number bar
            Rectangle{
                id: numberinput
                anchors.top : parent.top
                anchors.topMargin: 20
                width: parent.width
                height: 40
                color: "black"
                border.width: 1
                border.color: "#95a5a6"
                radius: 1

                Image{
                    id: backImage
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    source: !mouseareaDelete.containsMouse? "images/delete_normal.png" :"images/delete_highlight.png"
                    MouseArea{
                        id: mouseareaDelete
                        anchors.fill: parent
                        onClicked: {
                            var str = inputnumber.text
                            if (str!=="")
                                str = str.substring(0,str.length-1)
                            inputnumber.text = str
                        }
                    }
                }
                Item{

                    anchors.left: parent.left
                    width: 300
                    height: 30
                    TextInput{
                        id: inputnumber
                        focus: true
                        maximumLength: 15
                        anchors.centerIn: parent
                        color: "white"
                        font.pointSize: 18
                    }
                }

            }
            //gridview keypad
            GridView{
                anchors.top: numberinput.bottom
                anchors.topMargin: 5
                width: parent.width
                height: parent.height
                cellWidth: 100
                cellHeight: 68
                model:listkeypad
                delegate: Rectangle{
                    id: recKey
                    width: 100
                    height: 68
                    color: "#34495e"
                    border.width: 2
                    border.color: "black"
                    Row{
                        anchors.centerIn: parent
                        width: parent.width-20
                        height: parent.height-10
                        spacing: 5
                        Text{
                            color: "white"
                            font.pixelSize: 40
                            text: symbol
                        }
                        Text{
                            color: "white"
                            font.pixelSize: 15
                            text: tag
                        }
                    }
                    MouseArea{
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: recKey.color = "lightsteelblue"
                        onExited: recKey.color = "#34495e"
                        onClicked: {
                            inputnumber.text += symbol
                            console.log(symbol)
                        }

                    }
                }

            }


        }

        // listmodel
        ListModel{
            id: listkeypad
            ListElement{symbol: "1"; tag:"oo"}
            ListElement{symbol: "2" ; tag:"ABC"}
            ListElement{symbol: "3" ; tag:"DEF"}
            ListElement{symbol: "4" ; tag:"GHI"}
            ListElement{symbol: "5" ; tag:"JKL"}
            ListElement{symbol: "6" ; tag:"MNO"}
            ListElement{symbol: "7" ; tag:"QPRS"}
            ListElement{symbol: "8" ; tag:"TUV"}
            ListElement{symbol: "9" ; tag:"WXYZ"}
            ListElement{symbol: "*" ; tag:"."}
            ListElement{symbol: "0" ; tag:"+"}
            ListElement{symbol: "#" ; tag:""}
        }
    }
    //right bar  take inform from keypad button
    Item{
        anchors.right: parent.right
        width: Constants.screen_width/2
        height: parent.height
        Column{
            x:10
            y:100
            Text {
                id: nameContact
                font.pointSize: 30
                color: "white"
                text: "name"

            }
            Text {
                id: nameDetails
                color: "white"
                font.pointSize: 15
                text: "details"

            }
        }
        //timer
        Text{
            x:10
            y:280
            text: hours+":"+minutes+":"+second
            font.pointSize: 20
            color: "white"
        }

        // mute handset handcall
        Row{
                y:320
                Image {
                    Text {
                        anchors.centerIn: parent
                        font.pointSize: 15
                        color: "white"
                        text: qsTr("Mute")
                    }
                    source: "images/keypadview_toggle_inactive.png"
                }
                Image {
                    Text {
                        anchors.centerIn: parent
                        font.pointSize: 15
                        color: "white"
                        text: qsTr("Handset")
                    }
                    source: "images/keypadview_toggle_inactive.png"
                }
                Image {
                    Text {
                        anchors.centerIn: parent
                        font.pointSize: 15
                        color: "white"
                        text: qsTr("Add Call")
                    }
                    source: "images/keypadview_toggle_inactive.png"
                }


        }
    }


    //timer
    Timer{
        interval: 1000
        repeat: true
        running: true
        onTriggered: {
            second++
            if (second>60) {
                second=0;
                minutes++
            }
            if (minutes>60){
                minutes = 0;
                hours++
            }
        }
   }
        ListModel{
        id: listcontact
        ListElement{name:"Tran Van A" ; phonenumber:"0123456789";details:"work" }
        ListElement{name:"Nguyen Van An" ; phonenumber:"0123456789";details:"work"}
        ListElement{name:"Hoang Duc Anh" ; phonenumber:"0123456789";details:"work"}
        ListElement{name:"Tran Trong Anh" ; phonenumber:"0123456789";details:"work"}
        ListElement{name:"Tran Duc Anh" ; phonenumber:"0123456789";details:"work"}
        ListElement{name:"Hoang Ngoc Bao" ; phonenumber:"0123456789";details:"work"}
        ListElement{name:"Ho Van Ban" ; phonenumber:"0123456789";details:"work"}
        ListElement{name:"Nguyen Ha Ba" ; phonenumber:"0123456789";details:"work"}
        ListElement{name:"Cao Thi Bai" ; phonenumber:"0123456789";details:"work"}
        ListElement{name:"Nguyen Quoc Cuong" ; phonenumber:"0123456789";details:"work"}
        ListElement{name:"Ho Van Cuong" ; phonenumber:"090.1111.855";details:"work"}
        ListElement{name:"Ngo Van Dong" ; phonenumber:"090.1111.855"}
        ListElement{name:"Nguyen Van Do" ; phonenumber:"0933.731.855";details:"work"}
        ListElement{name:"Ho Van Doi" ; phonenumber:"0982.191.855";details:"work"}
        ListElement{name:"Nguyen Van Tai Em" ; phonenumber:"0941.121.855";details:"work"}
        ListElement{name:"Tran Thi Giang" ; phonenumber:"0942.121.855";details:"work"}
        ListElement{name:"Nguyen Thanh Giong" ; phonenumber:"0934911855";details:"work"}
        ListElement{name:"Ho Ngoc Hoang" ; phonenumber:"0931911855";details:"work"}
        ListElement{name:"Tran Van Hoang" ; phonenumber:"0899211855";details:"work"}
        ListElement{name:"Nong Van Hy" ; phonenumber:"01202611855";details:"work"}
        ListElement{name:"Tran Duc Ho" ; phonenumber:"01262511855";details:"work"}
        ListElement{name:"Luu Van Hoai" ; phonenumber:"01266611855";details:"work"}
        ListElement{name:"Hoang Trong Ha" ; phonenumber:"01229411855";details:"work"}
        ListElement{name:"Lo Van Kim" ; phonenumber:"01202411855";details:"work"}
        ListElement{name:"No Thi Kieu" ; phonenumber:"0967.211.855";details:"work"}
        ListElement{name:"Toure Koulou" ; phonenumber:"0898091855";details:"work"}
        ListElement{name:"Lionel Messi" ; phonenumber:"0967.231.855"}
        ListElement{name:"Lionel Jr Messi " ; phonenumber:"0967.231.855";details:"work"}
        ListElement{name:"Lionel F Messi" ; phonenumber:"0967.231.855";details:"work"}
        ListElement{name:"Lionel Phan Van Messi" ; phonenumber:"0967.231.855";details:"work"}
        ListElement{name:"Ho Thi Yen" ; phonenumber:"0967.231.855";details:"work"}

    }
}
