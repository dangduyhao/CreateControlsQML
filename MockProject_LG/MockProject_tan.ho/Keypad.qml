import QtQuick 2.0
import "Constants.js" as Constants

Item {
    id: rootKeypad
    property var main_height:  Constants.screen_height - 140
    property var check: false
    // property alias takeindex : listNew.index
    signal thisIndex




    function getTxt(){
        var str = inputnumber.text
        var strnew =""
        for (var i=0;i<str.length;i++){
            strnew += str[i];
            if((i%3===2)&&(i!==str.length-1)) strnew +="-"
        }
        return strnew
    }

    function getListView(){
        for (var i = 0;i<listcontact.count; i++){
            var a = listcontact.get(i)
            var str = a.phonenumber
            var str2 = a.name
            if (str.indexOf(inputnumber.text)>=0) listNew.append({"name":a.name, "phonenumber":a.phonenumber,"details":a.details})
        }
    }

    width: Constants.screen_width
    height: main_height

    //left bar
    //left PhoneKeypad
    Item{
        id:leftItem
        width: 400
        height: 340
        //star and phone active call
        Item{
            id: phoneActive
            width: parent.width/4
            height: parent.height

            Image {
                id: starImage
                anchors.top: parent.top

                anchors.horizontalCenter: parent.horizontalCenter
                source: check? "images/favorite_active.png":"images/favorite_inactive.png"
                MouseArea{
                    id: mouseareastar
                    anchors.fill: parent
                    onClicked: {
                        //console.log(check)
                        if (check===true) {
                            check = false
                            starImage.source = "images/favorite_inactive.png"
                        }
                        else{
                            check = true
                            starImage.source = "images/favorite_active.png"
                        }
                    }
                }
            }
            Image {
                id: callImage
                anchors.bottom : parent.bottom
                anchors.bottomMargin: 10
                anchors.horizontalCenter: parent.horizontalCenter
                source: mousecall1.containsMouse ?"images/make_call_active.png":"images/make_call_inactive.png"
                MouseArea{
                    id: mousecall1
                    anchors.fill: parent
                    onClicked: {
                        if (callImage.source === "images/make_call_active.png" )app.screenChange("PhoneActive.qml")
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
                            loading.visible = false
                            var str = inputnumber.text
                            if (str!=="")
                                str = str.substring(0,str.length-1)
                            inputnumber.text = str

                            listNew.clear()
                            rootKeypad.getListView()

                            //active on off
                            if (listNew.count>0) callImage.source = "images/make_call_active.png"
                            else callImage.source = "images/make_call_inactive.png"

                            //set loading and list view
                            if (listNew.count>0) {
                                listnewcontact.visible = true
                                loading.visible = false
                                rotationLoading.running = false
                            }
                            else {
                                rotationLoading.running = true
                                loading.visible = true
                            }
                        }
                    }
                }
                Item{

                    anchors.left: parent.left
                    width: 300
                    height: 30
                    TextInput{
                        id: inputshow
                        focus: true
                        maximumLength: 15
                        text: rootKeypad.getTxt()
                        anchors.centerIn: parent
                        color: "white"
                        font.pointSize: 18
                    }
                    TextInput{
                        id: inputnumber
                        visible: false
                        maximumLength: 11
                        anchors.centerIn: parent
                        color: "white"
                        font.pointSize: 18
                    }
                }

            }

            // loading
            Rectangle {
                id: loading
                x:350

                width: 300
                height: 400

                color: "transparent"

                Image {

                    width: 100
                    height: 100
                    anchors.centerIn: parent
                    source: "images/activity_indicator_large.png"
                }
                RotationAnimation {
                    id: rotationLoading
                    target: loading;
                    from: 0;
                    to: 360;
                    duration: 10000
                    running: true
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
                        id: mousecallactive
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: recKey.color = "lightsteelblue"
                        onExited: recKey.color = "#34495e"
                        onClicked: {
                            loading.visible = false
                            inputnumber.text += symbol
                            listNew.clear()
                            rootKeypad.getListView()
                            listnewcontact.visible = true
                            if (listNew.count>0) {
                                callImage.source = "images/make_call_active.png"
                                listnewcontact.visible = true
                                loading.visible = false
                                rotationLoading.running = false
                            }
                            else {
                                 callImage.source = "images/make_call_inactive.png"
                                loading.visible = true
                                rotationLoading.running = true
                            }
                            console.log(symbol)
                        }

                    }
                }

            }


        }

    }
    //top right bar
    Item{
        y: Constants.status_bar_height
        width: 300
        height: 50

    }
    //right bar
    Item{
        width: parent.width/2
        height: parent.height
        anchors.top: parent.top
        anchors.topMargin: 20
        anchors.left: leftItem.right
        anchors.leftMargin: 10
        clip:true

        //list Contacts
        Item{
            width: parent.width
            height: parent.height-30
            Item{
                width: parent.width-20
                height: 30

            }

            ListView{
                id: listnewcontact
                width: parent.width
                height: parent.height
                model: listNew
                visible: false
                delegate: Rectangle{
                    width: 300
                    height: 80
                    color:mouseclickcall.containsMouse? "#2c3e50":"transparent"
                    border.color: "transparent"
                    border.width: 2
                    radius:5
                    Image {
                        width: parent.width
                        source: "images/sidebar_divider.png"
                    }
                    Column{

                        Text{text: name; font.pointSize: 20;color: "white"}
                        Text{text:"Home |" + phonenumber; font.pointSize: 10;color:"white"}
                    }
                    MouseArea{
                        id: mouseclickcall
                        anchors.fill: parent
                        onClicked: {
                            //rootKeypad.thisIndex = phonenumber
                            app.screenChange("PhoneActive.qml")
                        }
                    }
                }
            }
        }


    }
    // capture pokemon



    ListModel{
        id:listNew
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
    ListModel{
        id: listcontact
        ListElement{name:"Tran Van A" ; phonenumber:"0123456789";details:"work" ; favorites:true}
        ListElement{name:"Nguyen Van An" ; phonenumber:"0123456789";details:"work"; favorites:true}
        ListElement{name:"Hoang Duc Anh" ; phonenumber:"0123456789";details:"work"; favorites:true}
        ListElement{name:"Tran Trong Anh" ; phonenumber:"0123456789";details:"work"; favorites:true}
        ListElement{name:"Tran Duc Anh" ; phonenumber:"0123456789";details:"work"; favorites:true}
        ListElement{name:"Hoang Ngoc Bao" ; phonenumber:"0123456789";details:"work"; favorites:true}
        ListElement{name:"Ho Van Ban" ; phonenumber:"0123456789";details:"work"; favorites:true}
        ListElement{name:"Nguyen Ha Ba" ; phonenumber:"0123456789";details:"work"; favorites:true}
        ListElement{name:"Cao Thi Bai" ; phonenumber:"0123456789";details:"work"; favorites:true}
        ListElement{name:"Nguyen Quoc Cuong" ; phonenumber:"0123456789";details:"work"; favorites:true}
        ListElement{name:"Ho Van Cuong" ; phonenumber:"0901111855";details:"work"; favorites:true}
        ListElement{name:"Ngo Van Dong" ; phonenumber:"0901111855"; favorites:true}
        ListElement{name:"Nguyen Van Do" ; phonenumber:"0933731855";details:"work"; favorites:true}
        ListElement{name:"Ho Van Doi" ; phonenumber:"0982191855";details:"work"; favorites:true}
        ListElement{name:"Nguyen Van Tai Em" ; phonenumber:"0941121855";details:"work"; favorites:true}
        ListElement{name:"Tran Thi Giang" ; phonenumber:"0942121855";details:"work"; favorites:true}
        ListElement{name:"Nguyen Thanh Giong" ; phonenumber:"0934911855";details:"work"; favorites:true}
        ListElement{name:"Ho Ngoc Hoang" ; phonenumber:"0931911855";details:"work"; favorites:true}
        ListElement{name:"Tran Van Hoang" ; phonenumber:"0899211855";details:"work"; favorites:true}
        ListElement{name:"Nong Van Hy" ; phonenumber:"01202611855";details:"work"; favorites:true}
        ListElement{name:"Tran Duc Ho" ; phonenumber:"01262511855";details:"work"; favorites:true}
        ListElement{name:"Luu Van Hoai" ; phonenumber:"01266611855";details:"work"; favorites:true}
        ListElement{name:"Hoang Trong Ha" ; phonenumber:"01229411855";details:"work"; favorites:true}
        ListElement{name:"Lo Van Kim" ; phonenumber:"01202411855";details:"work"; favorites:true}
        ListElement{name:"No Thi Kieu" ; phonenumber:"0967211855";details:"work"; favorites:true}
        ListElement{name:"Toure Koulou" ; phonenumber:"0898091855";details:"work"; favorites:true}
        ListElement{name:"Lionel Messi" ; phonenumber:"0967231855"; favorites:true}
        ListElement{name:"Lionel Jr Messi " ; phonenumber:"0967231855";details:"work"; favorites:true}
        ListElement{name:"Lionel F Messi" ; phonenumber:"0967231855";details:"work"; favorites:true}
        ListElement{name:"Lionel Phan Van Messi" ; phonenumber:"0967231855";details:"work"; favorites:true}
        ListElement{name:"Ho Thi Yen" ; phonenumber:"0967231855";details:"work"; favorites:true}

    }

}
