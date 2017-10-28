import QtQuick 2.0

Item {
    id:root
    Loader{
        id:keyPadLoader
    }
    Image {
        id: backArrow
        source: "images/back_normal.png"
        MouseArea{
            anchors.fill: parent
            onPressed: backArrow.source="images/back_highlight.png"
            onReleased: backArrow.source="images/back_normal.png"
        }
    }
    Image {
        id: close
        source: "images/close_normal.png"
        anchors.right: root.right
        MouseArea{
            anchors.fill: parent
            onPressed: close.source="images/close_highlight.png"
            onReleased: close.source="images/close_normal.png"
        }

    }
    Image {
        id: separator1
        source: "images/alphapaging_scroll_separator.png"
        anchors.left: backArrow.right
        rotation: -90
        y:35
    }
    Text {
        id: title
        text: "Add Other Network - Password"
        anchors.left: separator1.right
        color:"white"
        font.pixelSize: 30
        y:15
    }
    Image {
        id: aboveLine
        source: "images/function_separator_horizontal_plain_blue.png"
        anchors.top: backArrow.bottom
    }
    Image {
        id: typeBar
        source: "images/keyboard_input_bg.png"
        anchors.top: aboveLine.bottom
        anchors.topMargin: 40
        anchors.left: backArrow.left
        anchors.leftMargin: 20
        property alias passWifi: content.text
        TextInput {
            id: content
            color:"green"
//            text:"network password"
            font.pixelSize: 20
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 20
            focus: true
            property string wifiType: keyPadLoader.item.targetString
            property int cursorPoCur:5
            onWifiTypeChanged: {
                content.text=wifiType;
                if(wifiType!=""){
                    hideText.visible=false

                }
                else {hideText.visible=true
                    console.log(wifiType)
                }
                cursorPosition=keyPadLoader.item.tempCursor
            }
            onCursorPositionChanged:
            {
                keyPadLoader.item.cursorIndex=cursorPosition;
            }

        }
        Text{
            id:hideText
            text:"network password"
            color:"green"
            visible: true
            font.pixelSize: 20
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 20
        }
    }


    Image {
        id: belowLine
        source: "images/function_separator_horizontal_plain_blue.png"
        anchors.top: aboveLine.bottom
        anchors.topMargin: 110
    }

    Component.onCompleted: {
        keyPadLoader.setSource("Keyboard.qml")
    }


}
