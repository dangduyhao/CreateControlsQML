import QtQuick 2.6
import "Constants.js" as Constants
Item {
    property bool hasStatusBar: false
    property int max_img_ball_x: grid.x - ball.width +grid.width
    property int max_img_ball_y: grid.y - ball.height +grid.height
    property int min_img_ball_x: grid.x
    property int min_img_ball_y: grid.y
    property int fadeBalanceRange: 24
    property double width_segment: 0.0
    property double height_segment: 0.0
    Item{
        x:0; y: 66
        Image {
            id:header
            source: Constants.function_separator_audio
        }
    }
    Text {
        id: soundBar
        x: 80
        y: 18
        color: "white"
        font.pixelSize: 30
        text: qsTr("Sound")
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
            source: Constants.close_normal
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
    Rectangle{
        id: equalizer
        x: 90
        y: 120
        width: 120
        height: 60
        color: "black"
        border.color: "white"
        Text {
            font.pixelSize: 20
            text: "Equalizer"
            color: "white"
            anchors.centerIn: equalizer
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        MouseArea{
            id: qualMouse
            anchors.fill: parent
            onClicked: {
                movedown.visible =true
                moveup.visible =true
                moveleft.visible = true
                moveright.visible = true
                separateHeaderEqualizer2.visible = true
                separateHeaderEqualizer1.visible =true
                ball.visible =true
                grid.visible =true
                gachduoi.visible =true
                gachtren.visible =true
                gachtrai.visible =true
                gachphai.visible =true
                recFade.visible =false

            }
        }
    }
    Rectangle{
        id: balance
        x: 90
        y: 220
        width: 120
        height: 60
        color: "black"
        border.color: "white"
        Text {
            id: fade
            x: 32
            font.pixelSize: 20
            text: "Fade/"
            color: "white"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        Text {
            x:22
            font.pixelSize: 20
            text: "Balance"
            color: "white"
            anchors.top: fade.bottom
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        MouseArea{
            id: fadeMouse
            anchors.fill: parent
            onClicked: {
                recFade.visible =true
                movedown.visible =false
                moveup.visible =false
                moveleft.visible = false
                moveright.visible = false
                separateHeaderEqualizer2.visible = false
                separateHeaderEqualizer1.visible =true
                ball.visible =false
                grid.visible =false
                gachduoi.visible =false
                gachtren.visible =false
                gachtrai.visible =false
                gachphai.visible =false
            }
        }
    }
    Rectangle{
        id: soundMode
        x: 90
        y: 320
        width: 120
        height: 60
        color: "black"
        border.color: "white"
        Text {
            id: sound
            x: 32
            font.pixelSize: 20
            text: "Sound"
            color: "white"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        Text {
            x:32
            font.pixelSize: 20
            text: "Mode"
            color: "white"
            anchors.top: sound.bottom
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }

    Item{
        x:250; y: 120
        Image {
            id:separateHeaderEqualizer1
            source: "images/separator.png"
        }
    }
    Item{
        x:750; y: 120
        Image {
            id:separateHeaderEqualizer2
            source: "images/separator.png"
        }
    }
    Item{
        id: gridIt
        x:420; y: 180
        Image {
            id:grid
            source: "images/grid2.png"
        }
        Image {
            id:gachtren
            x: 5
            y: 5
            width: 160
            source: "images/detent_inactive.png"
        }
        Image {
            id:gachduoi
            x: 5
            y: 185
            width: 160
            source: "images/detent_inactive.png"
        }
        Image {
            id:gachphai
            x: 75
            y: 95
            width: 180
            rotation: -90
            source: "images/detent_inactive.png"
        }
        Image {
            id:gachtrai
            x: -85
            y: 95
            width: 180
            rotation: -90
            source: "images/detent_inactive.png"
        }


    }
    Image {
        x: 708
        y: 20
        source: Constants.statusbar_timetemp_separator
    }
    Image {
        id: ball
        x: 485
        y: 255
        source: "images/ball.png"
        MouseArea{
            id: ballMou
            anchors.fill: parent
            drag.minimumX: 425
            drag.maximumX: 545
            drag.minimumY: 190
            drag.maximumY: 325
            drag.target: ball
        }
    }
    Item{
        id: leftMove
        x: 330
        y: 235
        Image {
            id:moveleft
            source: (!leftMouse.containsMouse) ? "images/move_left_inactive.png" : "images/move_left_active.png"
            MouseArea{
                id: leftMouse
                anchors.fill: moveleft
                onClicked: {
                    if(ball.x > 425)
                        ball.x -= 5;
                }
            }
        }
    }
    Item{
        id: rightMove
        x:600
        y: 235
        Image {
            id:moveright
            source: (!rightMouse.containsMouse) ? "images/move_right_inactive.png" : "images/move_right_active.png"
            MouseArea{
                id: rightMouse
                anchors.fill: moveright
                onClicked: {
                    if(ball.x < 545)
                        ball.x += 5;
                }
            }
        }
    }
    Item {
        id: upMove
        x:465
        y: 90
        Image {
            id:moveup
            source: (!upMouse.containsMouse) ? "images/move_up_inactive.png" : "images/move_up_active.png"
            MouseArea{
                id: upMouse
                anchors.fill: moveup
                onClicked: {
                    if(ball.y>185)
                        ball.y -= 5;
                }
            }
        }
    }
    Item{
        id: downMove
        x:465
        y: 390
        Image {
            id:movedown
            source: "images/move_up_inactive.png"
            rotation: -180
            MouseArea{
                anchors.fill: parent
                onPressed: {
                    parent.source = "images/move_up_active.png"
                }
                onReleased: {
                    parent.source = "images/move_up_inactive.png"
                }
                onClicked: {
                    if(ball.y < 325)
                        ball.y +=5;
                }
            }
        }
    }


    Rectangle{
        id: recFade
        x:280
        y: 80
        height: 380
        width: 440
        visible: false
        color: "transparent"
        Item{
            x:100; y: 40
            Image {
                id:separateHeaderEqualizer3
                source: "images/separator.png"
            }
        }
        Item{
            x:230; y: 40
            Image {
                id:separateHeaderEqualizer4
                source: "images/separator.png"
            }
        }
        Item{
            x:360; y: 40
            Image {
                id:separateHeaderEqualizer5
                source: "images/separator.png"
            }
        }
        Text{
            id: txtcot1
            x: 10; y: 20
            text: "Bass"
            color: "white"
            font.pixelSize: 25
        }
        Text{
            id: txtcot1_vol
            x: 10; y: 190
            text: "0"
            color: "white"
            font.pixelSize: 18
        }
        Rectangle{
            id: cot1
            x: 0
            y: 50
            width: 80
            height: 300
            color: "transparent"
            Image {
                id:upScroll1
                x:0; y: 0
                source: "images/scroll_up_normal.png"
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        if(Number(txtcot1_vol.text)<10)
                            txtcot1_vol.text = Number(txtcot1_vol.text)+1
                    }
                }
            }
            Image {
                id:downScroll1
                x: 0; y: 230
                source: "images/scroll_down_normal.png"
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        if(Number(txtcot1_vol.text)> -10)
                            txtcot1_vol.text = Number(txtcot1_vol.text)-1
                    }
                }
            }
            Column {
                id: colUp1
                x: 5
                y:82
                spacing: 3
                Repeater {
                    id: col1UpRpt
                    model: 10
                    Image {
                        source:!(Number(txtcot1_vol.text)-(-index+9) <=0)?"images/detent_active.png":"images/detent_inactive.png"
                    }
                }
            }
            Column {
                x: 5
                y:182
                spacing: 3
                Repeater {
                    model: 10
                    Image {
                        source: (Number(txtcot1_vol.text)+index+1  <= 0)?"images/detent_active.png":"images/detent_inactive.png"
                    }
                }
            }
        }
        Text{
            id: txtcot2
            x: 115; y: 20
            text: "Midrange"
            color: "white"
            font.pixelSize: 25
        }
        Text{
            id: txtcot2_vol
            x: 140; y: 190
            text: "0"
            color: "white"
            font.pixelSize: 18
        }
        Rectangle{
            id: cot2
            x: 130
            y: 50
            width: 80
            height: 300
            color: "transparent"
            Image {
                id:upScroll2
                x:0; y: 0
                source: "images/scroll_up_normal.png"
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        if(Number(txtcot2_vol.text)<10)
                            txtcot2_vol.text = Number(txtcot2_vol.text)+1

                    }
                }
            }
            Image {
                id:downScroll2
                x: 0; y: 230
                source: "images/scroll_down_normal.png"
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        if(Number(txtcot2_vol.text)> -10)
                            txtcot2_vol.text = Number(txtcot2_vol.text)-1
                    }
                }
            }
            Column {
                id: colUp2
                x: 5
                y:82
                spacing: 3
                Repeater {
                    id: col2UpRpt
                    model: 10
                    Image {
                        source:!(Number(txtcot2_vol.text)-(-index+9) <=0)?"images/detent_active.png":"images/detent_inactive.png"
                    }
                }
            }
            Column {
                x: 5
                y:182
                spacing: 3
                Repeater {
                    model: 10
                    Image {
                        source: (Number(txtcot2_vol.text)+index+1  <= 0)?"images/detent_active.png":"images/detent_inactive.png"
                    }
                }
            }
        }
        Text{
            id: txtcot3
            x: 260; y: 20
            text: "Treble"
            color: "white"
            font.pixelSize: 25
        }
        Text{
            id: txtcot3_vol
            x: 270; y: 190
            text: "0"
            color: "white"
            font.pixelSize: 18
        }

        Rectangle{
            id: cot3
            x: 260
            y: 50
            width: 80
            height: 300
            color: "transparent"
            Image {//up case
                id:upScroll3
                x:0; y: 0
                source: (!upScrollMouse3.containsMouse)?"images/scroll_up_normal.png":"images/scroll_up_highlight.png"
                MouseArea{
                    id: upScrollMouse3
                    anchors.fill: parent
                    onClicked: {
                        if(Number(txtcot3_vol.text)<10)
                            txtcot3_vol.text = Number(txtcot3_vol.text)+1
                    }
                }
            }
            Image {//down case
                id:downScroll3
                x:0; y: 230
                source: (!downScrollMouse3.containsMouse)?"images/scroll_down_normal.png":"images/scroll_down_highlight.png"
                MouseArea{
                    id: downScrollMouse3
                    anchors.fill: parent
                    onClicked: {
                        if(Number(txtcot3_vol.text)>-10)
                            txtcot3_vol.text = Number(txtcot3_vol.text)-1
                    }
                }
            }
            Image {
                id: vol1_Img_Colum3
                x: 5; y: 80
                source: (Number(txtcot3_vol.text)-10>=0)?"images/detent_active.png":"images/detent_inactive.png"
            }
            Image {
                id: vol2_Img_Colum3
                x: 5; y: 85
                source: (Number(txtcot3_vol.text)-9>=0)?"images/detent_active.png":"images/detent_inactive.png"
            }
            Image {
                id: vol3_Img_Colum3
                x: 5; y: 90
                source: (Number(txtcot3_vol.text)-8>=0)?"images/detent_active.png":"images/detent_inactive.png"
            }
            Image {
                id: vol4_Img_Colum3
                x: 5; y: 95
                source: (Number(txtcot3_vol.text)-7>=0)?"images/detent_active.png":"images/detent_inactive.png"
            }
            Image {
                id: vol5_Img_Colum3
                x: 5; y: 100
                source: (Number(txtcot3_vol.text)-6>=0)?"images/detent_active.png":"images/detent_inactive.png"
            }
            Image {
                id: vol6_Img_Colum3
                x: 5; y: 105
                source: (Number(txtcot3_vol.text)-5>=0)?"images/detent_active.png":"images/detent_inactive.png"
            }
            Image {
                id: vol7_Img_Colum3
                x: 5; y: 110
                source: (Number(txtcot3_vol.text)-4>=0)?"images/detent_active.png":"images/detent_inactive.png"
            }
            Image {
                id: vol8_Img_Colum3
                x: 5; y: 115
                source: (Number(txtcot3_vol.text)-3>=0)?"images/detent_active.png":"images/detent_inactive.png"
            }
            Image {
                id: vol9_Img_Colum3
                x: 5; y: 120
                source: (Number(txtcot3_vol.text)-2>=0)?"images/detent_active.png":"images/detent_inactive.png"
            }
            Image {
                id: vol10_Img_Colum3
                x: 5; y: 125
                source: (Number(txtcot3_vol.text)-1>=0)?"images/detent_active.png":"images/detent_inactive.png"
            }
            Image {
                id: vol11_Img_Colum3
                x: 5; y: 180
                source: (Number(txtcot3_vol.text)+1<=0)?"images/detent_active.png":"images/detent_inactive.png"
            }
            Image {
                id: vol1f2_Img_Colum3
                x: 5; y: 185
                source: (Number(txtcot3_vol.text)+2<=0)?"images/detent_active.png":"images/detent_inactive.png"
            }
            Image {
                id: vol13_Img_Colum3
                x: 5; y: 190
                source: (Number(txtcot3_vol.text)+3<=0)?"images/detent_active.png":"images/detent_inactive.png"
            }
            Image {
                id: vol14_Img_Colum3
                x: 5; y: 195
                source: (Number(txtcot3_vol.text)+4<=0)?"images/detent_active.png":"images/detent_inactive.png"
            }
            Image {
                id: vol15_Img_Colum3
                x: 5; y: 200
                source: (Number(txtcot3_vol.text)+5<=0)?"images/detent_active.png":"images/detent_inactive.png"
            }
            Image {
                id: vol16_Img_Colum3
                x: 5; y: 205
                source: (Number(txtcot3_vol.text)+6<=0)?"images/detent_active.png":"images/detent_inactive.png"
            }
            Image {
                id: vol17_Img_Colum3
                x: 5; y: 210
                source: (Number(txtcot3_vol.text)+7<=0)?"images/detent_active.png":"images/detent_inactive.png"
            }
            Image {
                id: vol18_Img_Colum3
                x: 5; y: 215
                source: (Number(txtcot3_vol.text)+8<=0)?"images/detent_active.png":"images/detent_inactive.png"
            }
            Image {
                id: vol19_Img_Colum3
                x: 5; y: 220
                source: (Number(txtcot3_vol.text)+9<=0)?"images/detent_active.png":"images/detent_inactive.png"
            }
            Image {
                id: vol20_Img_Colum3
                x: 5; y: 225
                source: (Number(txtcot3_vol.text)+10<=0)?"images/detent_active.png":"images/detent_inactive.png"
            }

        }



    }
}
