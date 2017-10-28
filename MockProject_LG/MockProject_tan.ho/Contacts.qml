import QtQuick 2.0
import "Constants.js" as Constants
Item {
    width: Constants.screen_width
    height: Constants.screen_height-140 //340

    property date date: new Date()


    //left item
    Item{
        id: leftsidebar
        width: 100
        height: 320

        Image{
            y:20
            source: mousearea.containsMouse ? "images/scroll_up_highlight.png": "images/scroll_up_normal.png"
            MouseArea{
                id: mousearea
                anchors.fill: parent
                onClicked: {
                    listviewcontact.currentIndex--
                    if (listviewcontact.currentIndex<0) listviewcontact.currentIndex=0;
                    console.log(listviewcontact.currentIndex)
                }
            }
        }



        Image{
            y:250
            source: mousearea1.containsMouse ? "images/scroll_down_highlight.png": "images/scroll_down_normal.png"
            MouseArea{
                id: mousearea1
                anchors.fill: parent
                onClicked: {
                    listviewcontact.currentIndex++
                    if (listviewcontact.currentIndex>listviewcontact.count)  listviewcontact.currentIndex=listviewcontact.count-1;

                    console.log( listviewcontact.currentIndex)
                }
            }
        }

    }
    //right item
    Item{
        anchors.left: leftsidebar.right
        width: parent.width-100
        height: parent.height-70

        Item{
            id:topbar
            width: parent.width
            height: parent.height/4
        }
        //Contacts information
        ListView{
            id:listviewcontact
            anchors.top: topbar.bottom
            width: parent.width
            height: parent.height
            clip: true

            section.property: "alpha"

            model:listcontact

            delegate: Rectangle{
                width: 700
                height: 70
                radius: 5
                color:(listviewcontact.currentIndex===index)?"lightsteelblue" : "transparent"
                Column{
                    anchors.verticalCenter: parent.verticalCenter
                    width: parent.width
                    height: parent.height
                    Image{
                        width: parent.width
                        source: Constants.sidebar_divider
                    }
                    Text {
                        text: name
                        font.pointSize: 20
                        color: "white"
                    }
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        listviewcontact.currentIndex = index
                        app.screenChange("PhoneActive.qml")
                    }
                }

            }
            onContentYChanged: {
                var arr =  ['A','B','C','D',  'E','F', 'G','H', 'K', 'L', 'M', 'N', 'P', 'Q', 'T', 'S', 'X', 'Y', 'Z']
                var posforward =   [0,5,9,10,17,-1,18,25,28,-1,35,-1,-1,-1,-1,-1,-1,35,-1] // check forward
                var posback  = [0,8,10,12,17,-1,18,25,28,-1,35,-1,-1,-1,-1,-1,-1,35,-1]  // check when back
                for (var i=0;i<posforward.length;i++)
                    if (posforward[i] === listviewcontact.currentIndex||posback[i] === listviewcontact.currentIndex){
                        txtBubble.text = arr[i]
                        console.log(i+"*")
                    }
            }

            onCurrentIndexChanged: {
                var arr =  ['A','B','C','D',  'E','F', 'G','H', 'K', 'L', 'M', 'N', 'P', 'Q', 'T', 'S', 'X', 'Y', 'Z']
                var posforward =   [0,5,9,10,17,-1,18,25,28,-1,35,-1,-1,-1,-1,-1,-1,35,-1] // check forward
                var posback  = [0,8,10,12,16,-1,18,25,28,-1,35,-1,-1,-1,-1,-1,-1,35,-1]  // check when back
                for (var i=0;i<posforward.length;i++)
                    if (posforward[i] === listviewcontact.currentIndex||posback[i] === listviewcontact.currentIndex){
                        txtBubble.text = arr[i]
                        console.log(i+"*")
                    }
            }

        }
        //bubble change
        Item{
            id: sectionDelegate
            anchors.centerIn: parent
            Image{
                scale: 0.5
                source: "images/zoom_bubble.png"
                Text{id:txtBubble;anchors.centerIn: parent;  color: "white"; font.pointSize: 40 }
            }
        }

        //list contacts
        ListModel{
            id: listcontact
            ListElement{name:"Tran Van A" ; phonenumber:"0123456789";details:"work" ; favorites:true;alpha:"A"}
            ListElement{name:"Nguyen Van An" ; phonenumber:"0123456789";details:"work"; favorites:true;alpha:"A"}
            ListElement{name:"Hoang Duc Anh" ; phonenumber:"0123456789";details:"work"; favorites:true;alpha:"A"}
            ListElement{name:"Tran Trong Anh" ; phonenumber:"0123456789";details:"work"; favorites:true;alpha:"A"}
            ListElement{name:"Tran Duc Anh" ; phonenumber:"0123456789";details:"work"; favorites:true;alpha:"A"}
            ListElement{name:"Hoang Ngoc Bao" ; phonenumber:"0123456789";details:"work"; favorites:true;alpha:"B"}
            ListElement{name:"Ho Van Ban" ; phonenumber:"0123456789";details:"work"; favorites:true;alpha:"B"}
            ListElement{name:"Nguyen Ha Ba" ; phonenumber:"0123456789";details:"work"; favorites:true;alpha:"B"}
            ListElement{name:"Cao Thi Bai" ; phonenumber:"0123456789";details:"work"; favorites:true;alpha:"B"}
            ListElement{name:"Nguyen Quoc Cuong" ; phonenumber:"0123456789";details:"work"; favorites:true;alpha:"C"}
            ListElement{name:"Ho Van Cuong" ; phonenumber:"0901111855";details:"work"; favorites:true;alpha:"D"}
            ListElement{name:"Ngo Van Dong" ; phonenumber:"0901111855"; favorites:true;alpha:"D"}
            ListElement{name:"Nguyen Van Do" ; phonenumber:"0933731855";details:"work"; favorites:true;alpha:"D"}
            ListElement{name:"Ho Van Doi" ; phonenumber:"0982191855";details:"work"; favorites:true;alpha:"E"}
            ListElement{name:"Nguyen Van Tai Em" ; phonenumber:"0941121855";details:"work"; favorites:true;alpha:"G"}
            ListElement{name:"Tran Thi Giang" ; phonenumber:"0942121855";details:"work"; favorites:true;alpha:"G"}
            ListElement{name:"Nguyen Thanh Giong" ; phonenumber:"0934911855";details:"work"; favorites:true;alpha:"H"}
            ListElement{name:"Ho Ngoc Hoang" ; phonenumber:"0931911855";details:"work"; favorites:true;alpha:"G"}
            ListElement{name:"Tran Van Hoang" ; phonenumber:"0899211855";details:"work"; favorites:true;alpha:"G"}
            ListElement{name:"Nong Van Hy" ; phonenumber:"01202611855";details:"work"; favorites:true;alpha:"G"}
            ListElement{name:"Tran Duc Ho" ; phonenumber:"01262511855";details:"work"; favorites:true;alpha:"G"}
            ListElement{name:"Luu Van Hoai" ; phonenumber:"01266611855";details:"work"; favorites:true;alpha:"G"}
            ListElement{name:"Hoang Trong Ha" ; phonenumber:"01229411855";details:"work"; favorites:true;alpha:"G"}
            ListElement{name:"Lo Van Kim" ; phonenumber:"01202411855";details:"work"; favorites:true;alpha:"K"}
            ListElement{name:"No Thi Kieu" ; phonenumber:"0967211855";details:"work"; favorites:true;alpha:"K"}
            ListElement{name:"Toure Koulou" ; phonenumber:"0898091855";details:"work"; favorites:true;alpha:"K"}
            ListElement{name:"Lionel Messi" ; phonenumber:"0967231855"; favorites:true;alpha:"M"}
            ListElement{name:"Lionel Jr Messi " ; phonenumber:"0967231855";details:"work"; favorites:true;alpha:"M"}
            ListElement{name:"Lionel F Messi" ; phonenumber:"0967231855";details:"work"; favorites:true;alpha:"M"}
            ListElement{name:"Lionel Phan Van Messi" ; phonenumber:"0967231855";details:"work"; favorites:true;alpha:"M"}
            ListElement{name:"Ho Thi Yen" ; phonenumber:"0967231855";details:"work"; favorites:true;alpha:"Y"}

        }

    }
}
