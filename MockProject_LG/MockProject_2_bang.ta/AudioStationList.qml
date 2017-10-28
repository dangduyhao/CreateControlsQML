import QtQuick 2.6
import QtQuick.Controls 2.2
import "Constants.js" as Constants
Item {
    id: fmTab
    Item{
        x:0; y: 66
        Image {
            id:header
            source: Constants.function_separator_audio
        }
    }
    Image {
        x: 708
        y: 20
        source: Constants.statusbar_timetemp_separator
    }
    Image {
        x: 70
        y: 20
        source: Constants.statusbar_timetemp_separator
    }
    Item{
        x:0; y: 0
        Image {
            id:backHeader
            source:  Constants.back_normal
            MouseArea{
                id: backHeaderMouse
                anchors.fill: parent
                onPressed:  {
                    backHeader.source = Constants.back_highlight
                }
                onReleased: {
                    app.screenChange("AudioNowPlaying.qml")
                }
            }
        }
    }
    Item{
        x:710; y: 0
        Image {
            id: deleteHeader
            source: "images/close_normal.png"
            MouseArea{
                id: deleteHeaderMouse
                anchors.fill: parent
                onPressed:  {
                    deleteHeader.source = Constants.close_highlight
                }
                onReleased: {
                    app.screenChange("AudioNowPlaying.qml")
                }
            }
        }
    }
    property int i: 0
    Rectangle{
        id: rect1
        x: 100
        y: 80
        width: 700
        height: 400
        color: "transparent"
        ListModel {
            id: dataModel
            ListElement { name: "Categories"; letter: "A"; favorite: false }
            ListElement { name: "Update List"; letter: "B";favorite: false}
            ListElement { name: "95.5 "; letter: "C"; favorite: false }
            ListElement { name: "99.7"; letter: "B"; favorite: false}
            ListElement { name: "99.9"; letter: "D"; favorite: false}
            ListElement { name: "100.2 "; letter: "F";favorite: false }
            ListElement { name: "123 "; letter: "I"; favorite: false}
            ListElement { name: "122.9"; letter: "E";favorite: false}
            ListElement { name: "124.7"; letter: "G"; favorite: false}
            ListElement { name: "145.8 "; letter: "H";favorite: false }
            ListElement { name: "150.9 "; letter: "M";favorite: false }
            ListElement { name: " 155.8"; letter: "N"; favorite: false}
            ListElement { name: "160.8"; letter: "O"; favorite: false}
            ListElement { name: "165.8"; letter: "P"; favorite: false}
            ListElement { name: "187"; letter: "Q"; favorite: false}
            ListElement { name: "188"; letter: "T"; favorite: false}
            ListElement { name: "190"; letter: "Z"; favorite: false}
        }
        ListView{
            id: lV
            model: dataModel
            anchors.fill: parent
            anchors.margins: 20
            clip: true
            focus: true
            delegate:spaceManDelegate
            section.property: "letter"
            section.delegate: sectionDelegate
            highlight: Rectangle {width: 100; color: "green"; opacity: 0.9}
            onCurrentIndexChanged: showPopup()
            onContentYChanged:  {
                currentIndex = Math.round(lV.contentY/40)
//                scroll3.y = lV.contentY/rect1.contentHeight*lV.height
                if(!mou1.drag.active)
                {
                    scroll3.y = lV.visibleArea.yPosition*lV.height
                }

            }
        }
        Component {
            id: spaceManDelegate
            Item {
                width: ListView.view.width
                height: 20
                Text {
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.leftMargin: 8
                    font.pixelSize: 25
                    color: "white"
                    text: name
                    MouseArea {
                        anchors.fill: parent
                        onClicked: lV.currentIndex = index
                    }
                }
                Image {
                    id:imgIcon
                    x: 600
                    y: 0
                    source: (favorite == false ) ? "Images/favorite_inactive.png":"Images/favorite_active.png"
                    MouseArea{
                        id: imgMou
                        anchors.fill: parent
                        onClicked: {
                            if(favorite ===true)
                                dataModel.set(index, {"favorite": false})
                            else
                                dataModel.set(index, {"favorite": true})
                        }
                    }
                }
            }
        }
        Component {
            id: sectionDelegate
            Rectangle {
                width: ListView.view.width
                height: 20
                Image {
                    id: txt
                    source: "images/function_separator.png"
                }
                color: "transparent"
            }
        }
    }
        function getIndex(data) {
            for(i = 0; i < dataModel.count; i++) {
                if (data === dataModel.get(i).letter)
                    lV.currentIndex = i;
            }
        }
    Rectangle{
        id: popUp
        anchors.centerIn: parent
        height: 150
        width: 150
        radius: 75
        color: "black"
        border.width: 5
        border.color: "orange"
        visible: false
        Text {
            id: popUpContent
            anchors.centerIn: parent
            text: qsTr("text")
            color: "white"
            font.pixelSize: 20
        }
    }
    Timer {
        id: timer
        repeat: false
        onTriggered: popUp.visible = false
    }
    function showPopup() {
        timer.interval = 2000
        popUp.visible = true
        popUpContent.text = lV.model.get(lV.currentIndex).name
        timer.start()
    }
    Image {
        id: scroll1
        x: 10; y: 80
        source: "images/scrollbar_bg_long.png"
    }
    Image {
        id: scroll3
        x:10; y: 80
        height: 60
        source: "images/scrollbar_indicator_long.png"
        MouseArea{
            id: mou1
            anchors.fill: parent
            drag.axis: Drag.YAxis
            drag.minimumY: 80
            drag.maximumY: 260
            drag.target : scroll3
        }
        onYChanged: {
            timer.running = true
            if(mou1.drag.active)
            {
                lV.contentY = scroll3.y/lV.height*lV.contentHeight ;
                timer.running = true ;
            }
            if(y < mou1.drag.minimumY)
            {
                y = mou1.drag.minimumY ;
            }
            if(y > mou1.drag.maximumY)
            {
                y = mou1.drag.maximumY ;
            }
        }
    }
    Image {
        id:upScroll
        x:10; y: 320
        source: !(upMou.containsMouse)?"images/scroll_up_normal.png":"images/scroll_up_highlight.png"
        MouseArea{
            id: upMou
            anchors.fill: parent
            onClicked: {
                scroll3.y = 250
                lV.currentIndex = 0
            }
        }
    }
    Image {
        id:downScroll
        x:10; y: 400
        source:!(downMou.containsMouse)? "images/scroll_down_normal.png":"images/scroll_down_highlight.png"
        MouseArea{
            id:downMou
            anchors.fill: parent
            onClicked:   {
                scroll3.y = 250
                lV.currentIndex = 10
            }
        }
    }




}
