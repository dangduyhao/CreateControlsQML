import QtQuick 2.0
import "Constants.js" as Constants
Item {
    x:0
    width: Constants.screen_width
    height: 340

    ListView{
        x:0
        width: parent.width
        height: parent.height
        model: listcontact1
        delegate: Item{
            width: 800
            height: 80
            Column{

                width: 800
                height: 80
                Image{
                    width: parent.width
                    source: Constants.sidebar_divider
                }
                Text {
                    x:20
                    text: name + "         " + (favorites?"X":"")
                    font.pointSize: 20
                    color: "white"
                }
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    app.screenChange("PhoneActive.qml")
                }
            }
        }

    }
    ListModel{
        id: listcontact1
        ListElement{name:"Tran Van A" ; alpha:"0123-456-789"; favorites:true }
        ListElement{name:"Nguyen Van An" ; alpha:"0123-456-789"; favorites:false}
        ListElement{name:"Hoang Duc Anh" ; alpha:"0123-456-789"; favorites:true}
        ListElement{name:"Tran Trong Anh" ; alpha:"0123-456-789"; favorites:false}
        ListElement{name:"Tran Duc Anh" ; alpha:"0123-456-789"; favorites:true}
        ListElement{name:"Hoang Ngoc Bao" ; alpha:"0123-456-789"; favorites:false}
        ListElement{name:"Ho Van Ban" ; alpha:"0123-456-789"; favorites:true}
        ListElement{name:"Nguyen Ha Ba" ; alpha:"0123-456-789"; favorites:true}
        ListElement{name:"Cao Thi Bai" ; alpha:"0123-456-789"; favorites:true}
        ListElement{name:"Nguyen Quoc Cuong" ; alpha:"0123-456-789"; favorites:true}
        ListElement{name:"Ho Van Cuong" ; alpha:"C"; favorites:true}
        ListElement{name:"Tran Van Cuong" ; alpha:"C"; favorites:false}
        ListElement{name:"Hoang Ngoc Duc" ; alpha:"D"; favorites:true}
        ListElement{name:"Nguyen Dam Duc" ; alpha:"D"; favorites:true}
        ListElement{name:"Ngo Van Dong" ; alpha:"D"; favorites:true}
        ListElement{name:"Nguyen Van Do" ; alpha:"D"; favorites:true}
        ListElement{name:"Ho Van Doi" ; alpha:"D"; favorites:true}
        ListElement{name:"Nguyen Van Tai Em" ; alpha:"E"; favorites:false}
        ListElement{name:"Tran Thi Giang" ; alpha:"G"; favorites:true}
        ListElement{name:"Nguyen Thanh Giong" ; alpha:"G"; favorites:true}
        ListElement{name:"Ho Ngoc Hoang" ; alpha:"H"; favorites:true}
        ListElement{name:"Tran Van Hoang" ; alpha:"H"; favorites:true}
        ListElement{name:"Nong Van Hy" ; alpha:"H"; favorites:true}
        ListElement{name:"Tran Duc Ho" ; alpha:"H"; favorites:true}
        ListElement{name:"Luu Van Hoai" ; alpha:"H"; favorites:true}
        ListElement{name:"Lionel Messi" ; alpha:"M"; favorites:true}
        ListElement{name:"Lionel Jr Messi " ; alpha:"M"; favorites:true}
        ListElement{name:"Lionel Phan Van Messi" ; alpha:"M";favorites:true}

    }

}
