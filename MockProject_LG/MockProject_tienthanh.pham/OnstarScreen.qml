import QtQuick 2.0
import "Constants.js" as Constants
Item{
    id:statusbar
        property bool hasStatusBar: false
    Image{
        id:topbar
        source:"images/statusbar_bg.png"
        x:0;y:0
    }
    Image{
        id:back
        source:"images/back_normal.png"
        anchors.left: parent.left
        MouseArea{
            anchors.fill: parent
            onClicked: {
                loader1.setSource("Home.qml")
//                app.onScreenChange("OnstarScreen.qml")
                statusbar.visible=false
            }

            onPressed:  {
                back.source="images/back_highlight.png"
            }
            onReleased: {
                back.source="images/back_normal.png"
            }
        }
    }
    Image{
        source: "images/statusbar_timetemp_separator.png"
        x:83;y:20

    }
    Image{
        source: "images/statusbar_timetemp_separator.png"
        x:714;y:20
    }
    Image{
        id:close
        source:"images/close_normal.png"
        anchors.right: topbar.right
        MouseArea{
            anchors.fill: parent
            onClicked: {
                loader1.setSource("Home.qml")
//                app.onScreenChange("OnstarScreen.qml")
                statusbar.visible=false
            }

            onPressed: {
                close.source="images/close_highlight.png"
            }
            onReleased: {
                close.source="images/close_normal.png"
            }
        }
    }
    Image{
        id:greenline
        source:"images/function_separator_tbt.png"
        anchors.top: back.bottom
    }
    TextInput{
        id:inputText
        text:"Add destination here"
        color:"white"
        font.pixelSize: 30
        anchors.verticalCenter: topbar.verticalCenter
        x:100;width:600
        focus:true
        onTextChanged: {

            if(inputText.text!=="Add destination here"){
                thanhScroll.visible=true
                listView.visible=true
            }

            if(inputText.text==""){
                thanhScroll.visible=false
                listView.visible=false
            }

        }

    }
        Item{
            id:thanhScroll
            visible: false
            anchors.top: statusbar.bottom
            Image{
                id:khungScroll
                source: "images/scrollbar_bg_long.png"
                scale:0.9
                x:30;y:100
                Image{
                    id:scrollbar
                    height:khungScroll.height*listView.visibleArea.heightRatio
                    source:"images/scrollbar_indicator_long.png"
                    property int yscrollmax: khungScroll.height-scrollbar.height
                    MouseArea{
                        anchors.fill: scrollbar
                        drag.minimumY: 0;drag.maximumY: scrollbar.yscrollmax
                        drag.target:scrollbar
                        drag.axis: Drag.YAxis
                        onPositionChanged: {
                            listView.contentY=scrollbar.y/scrollbar.yscrollmax*listView.height
                        }
                    }

                }
            }

            Image{
                id:scrollup_normal
                source:"images/scroll_up_normal.png"
                x:32;y:330
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        scrollbar.y-=scrollbar.yscrollmax/4
                        listView.contentY=scrollbar.y/scrollbar.yscrollmax*listView.height
                        if(scrollbar.y<0) scrollbar.y=0
                    }

                    onPressed:  {
                        scrollup_normal.source="images/scroll_up_highlight.png"
                    }
                    onReleased: {
                        scrollup_normal.source="images/scroll_up_normal.png"
                    }
                }
            }
            Image{
                id:scrolldown_normal
                source:"images/scroll_down_normal.png"
                x:32;y:400
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        scrollbar.y+=(khungScroll.height-scrollbar.height)/4
                        listView.contentY=scrollbar.y/scrollbar.yscrollmax*listView.height
                        if(scrollbar.y>scrollbar.yscrollmax) scrollbar.y=scrollbar.yscrollmax
                    }
                    onPressed:  {
                        scrolldown_normal.source="images/scroll_down_highlight.png"
                    }
                    onReleased: {
                        scrolldown_normal.source="images/scroll_down_normal.png"
                    }
                }
            }

        }
          ListModel{
                id:input
                ListElement{image:"images/icn_0_md.png";name:"Dai La Street";distance:"2 km"}
                ListElement{image:"images/icn_1_md.png";name:"Truong Chinh Street";distance:"1.5 km"}
                ListElement{image:"images/icn_10_md.png";name:"Lang Street";distance:"0.5 km"}
                ListElement{image:"images/icn_6_md.png";name:"Nguyen Ngoc Vu Street";distance:"1 km"}
                ListElement{image:"images/icn_3_md.png";name:"Tran Duy Hung Street";distance:"1.5 km"}
                ListElement{image:"images/icn_1_md.png";name:"Pham Hung Street";distance:"2 km"}
                ListElement{image:"images/icn_13_md.png";name:"Keangnam Landmark 72 Tower";distance:"1 km"}
            }
    ListView{
        x:120;y:73
        width: 650;height: 400
        id:listView
        visible: false
        model: input
        clip:true
        delegate: streetDelegate
        onContentYChanged: {
            scrollbar.y=listView.contentY*scrollbar.yscrollmax/(listView.contentHeight-listView.height)
            if(contentY < 0) contentY=0;
            if(contentY > contentHeight-listView.height)
                contentY=contentHeight-listView.height;

        }

    }
     Component{
                id:streetDelegate
                Item{
                    id:recDelegate
                    height:100
                    Image{
                        id:imageGuide
                        anchors.left: parent.left
                        source: model.image
                        height:parent.height
                    }
                    Text{
                        id:street
                        anchors.left: imageGuide.right
                        text:model.name
                        color:"white"
                        clip:true
                        font.pixelSize: 25
                    }
                    Text{
                        id:distan
                        anchors.top:street.bottom
                        anchors.left: imageGuide.right
                        text:model.distance
                        color:"white"
                        clip:true
                        font.pixelSize: 25
                    }
                    Image{
                        id:line
                        source:"images/function_separator.png"
                        anchors.top:  streetDelegate.bottom
                    }
                }
            }
}



