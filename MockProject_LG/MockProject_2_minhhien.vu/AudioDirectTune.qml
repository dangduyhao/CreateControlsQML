import QtQuick 2.0
import "Constants.js" as Constants
Item {
    width: parent.width
    height: parent.height
    Item{
        x:0; y: 66
        Image {
            id:header
            source: Constants.function_separator_audio
        }
    }
    Item{
        x:50; y: 0
        Image {
            id:separateHeader
           // source: Constants.scrollbar_indicator_long
        }
    }
    Item{
        x:0; y: 0
        Image {
            id:backHeader
            source: Constants.back_normal
        }
    }
    Item{
        x:710; y: 0
        Image {
            id: deleteHeader
            source: Constants.close_normal
        }
    }
    Rectangle{
        id: rect2
        x: 100
        y: 100
        height: 50
        width: 300
        color: "#ffffdd"
        border.color: "black"
        TextInput{
            id: txtIn
            height: rect2.height
            width: rect2.width
            anchors.centerIn: parent
            anchors.fill: parent
            font.pixelSize: 20
            font.bold: false
            font.italic: true
            font.family: "Helvetica"
            text: "Input range of FM"
            MouseArea {
                id: txtMouseArea
                anchors.fill: parent
                onClicked: {
                    txtIn.clear()
                }
            }
        }
    }
    Item {
        id:num1It
        x: 100
        y: 155
//        height: 40; width: 100
        Image {
            id: num1Img
            source: Constants.shortbutton_highlight
        }
        Text {
            id: num1
            text: "1"
            anchors.centerIn: num1Img
            color: "White"
            font.pixelSize: 25
        }
         height: 40; width: 100
        MouseArea{
            id: mouse1
            anchors.fill: parent
            onClicked: {
                txtIn.text += num1.text
                console.log("1")
            }
        }
    }
    Item {
        id:num2It
        x: 200
        y: 155
        height: 40; width: 100
       MouseArea{
           id: mouse2
           anchors.fill: parent
           onClicked: {
               txtIn.text += num2.text
               console.log("2")

           }
       }
        Image {
            id: num2Img
            source: Constants.shortbutton_highlight
        }
        Text {
            id: num2
            text: "2"
            anchors.centerIn: num2Img
            color: "White"
            font.pixelSize: 25
        }
    }
    Item {
        id:num3It
        x: 300
        y: 155
        height: 40; width: 100
       MouseArea{
           id: mouse3
           anchors.fill: parent
           onClicked: {
               txtIn.text += num3.text

           }
       }
        Image {
            id: num3Img
            source: Constants.shortbutton_highlight
        }
        Text {
            id: num3
            text: "3"
            anchors.centerIn: num3Img
            color: "White"
            font.pixelSize: 25
        }
    }
    Item {
        id:num4It
        x: 100
        y: 155+65
        height: 40; width: 100
       MouseArea{
           id: mouse4
           anchors.fill: parent
           onClicked: {
               txtIn.text += num4.text

           }
       }
        Image {
            id: num4Img
            source: Constants.shortbutton_highlight
        }
        Text {
            id: num4
            text: "4"
            anchors.centerIn: num4Img
            color: "White"
            font.pixelSize: 25
        }
    }
    Item {
        id:num5It
        x: 200
        y: 155+65
        height: 40; width: 100
       MouseArea{
           id: mouse5
           anchors.fill: parent
           onClicked: {
               txtIn.text += num5.text

           }
       }
        Image {
            id: num5Img
            source: Constants.shortbutton_highlight
        }
        Text {
            id: num5
            text: "5"
            anchors.centerIn: num5Img
            color: "White"
            font.pixelSize: 25
        }
    }
    Item {
        id:num6It
        x: 300
        y: 155+65
        height: 40; width: 100
       MouseArea{
           id: mouse6
           anchors.fill: parent
           onClicked: {
               txtIn.text += num6.text
           }
       }
        Image {
            id: num6Img
            source: Constants.shortbutton_highlight
        }
        Text {
            id: num6
            text: "6"
            anchors.centerIn: num6Img
            color: "White"
            font.pixelSize: 25
        }
    }
    Item {
        id:num7It
        x: 100
        y: 155+65+65
        height: 40; width: 100
       MouseArea{
           id: mouse7
           anchors.fill: parent
           onClicked: {
               txtIn.text += num7.text
           }
       }
        Image {
            id: num7Img
            source: Constants.shortbutton_highlight
        }
        Text {
            id: num7
            text: "7"
            anchors.centerIn: num7Img
            color: "White"
            font.pixelSize: 25
        }
    }
    Item {
        id:num8It
        x: 200
        y: 155+65+65
        height: 40; width: 100
       MouseArea{
           id: mouse8
           anchors.fill: parent
           onClicked: {
               txtIn.text += num8.text
           }
       }
        Image {
            id: num8Img
            source: Constants.shortbutton_highlight
        }
        Text {
            id: num8
            text: "8"
            anchors.centerIn: num8Img
            color: "White"
            font.pixelSize: 25
        }
    }
    Item {
        id:num9It
        x: 300
        y: 155+65+65
        height: 40; width: 100
       MouseArea{
           id: mouse9
           anchors.fill: parent
           onClicked: {
               txtIn.text += num9.text

           }
       }
        Image {
            id: num9Img
            source: Constants.shortbutton_highlight
        }
        Text {
            id: num9
            text: "9"
            anchors.centerIn: num9Img
            color: "White"
            font.pixelSize: 25
        }
    }
    Item {
        id:num0It
        x: 200
        y: 155+65+65+65
        height: 40; width: 100
       MouseArea{
           id: mouse0
           anchors.fill: parent
           onClicked: {
               txtIn.text += num0.text

           }
       }
        Image {
            id: num0Img
            source: Constants.shortbutton_highlight
        }
        Text {
            id: num0
            text: "0"
            anchors.centerIn: num0Img
            color: "White"
            font.pixelSize: 25
        }
    }
    Item {
        id:dotIt
        x: 100
        y: 155+65+65+65
        height: 40; width: 100
       MouseArea{
           id: mousedot
           anchors.fill: parent
           onClicked: {
               txtIn.text += dot.text
           }
       }
        Image {
            id: dotImg
            source: Constants.shortbutton_highlight
        }
        Text {
            id: dot
            text: "."
            anchors.centerIn: dotImg
            color: "White"
            font.pixelSize: 25
        }
    }
    Item {
        id:bspIt
        x: 300
        y: 155+65+65+65
        height: 40; width: 100
       MouseArea{
           id: mouseESC
           anchors.fill: parent
           onClicked: {
               txtIn.remove(txtIn.length -1, txtIn.length )
           }
       }
        Image {
            id: bspImg
            source: Constants.shortbutton_highlight
        }
        Text {
            id: backSpace
            text: "ESC"
            anchors.centerIn: bspImg
            color: "White"
            font.pixelSize: 25
        }
    }
    Item {
        id:leftIt
        x: 500
        y: 155+65+65+10
        Image {
            id: leftImg
            source: Constants.leftseek_highlight
        }

    }
    Item {
        id:rightIt
        x: 600
        y: 155+65+65+10
        Image {
            id: rightImg
            source: Constants.rightseek_highlight
        }

    }
    Item {
        x: 700
        y: 60
        Image {
            id: favorite
            source: Constants.favorite_inactive
        }

    }
    Item {
        x: 460
        y: 220
        Text {
            id: directSong
            font.pixelSize: 25
            color: "White"
            text: qsTr("VOV_Giaothong_91MHz")
            AnimatedSprite{

            }
        }

    }

    Rectangle{
        id: rect4
        x: 400
        y: 100
        height: 50
        width: 50
        color: "#ffffdd"
        border.color: "black"
        Image {
            id: img1
            height: rect4.height
            width: rect4.width
            source: Constants.kb_backspace_highlight
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    txtIn.text = txtIn.getText(0, txtIn.text.length - 1)
                }

            }
        }
    }
}
