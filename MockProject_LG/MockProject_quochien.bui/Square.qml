import QtQuick 2.0

Row{
    id: row
    property var repeater: []
    property variant popup: [["ă","â"],["ê"],["ô","ơ"],["ư"],["đ"],[]]
    property int selIndex: 0
    property int valid: 0
    property bool isPress: false
    property bool lowCase: true
    signal sendMsg(string msg)

    signal shiftPress()
    spacing: 8
    Repeater{
        model: repeater
        Image {
            id: rec
            source: "images/tone_box.png"
            width: 70; height: 50
            Image {
                id: img1
                width: rec.width; height: rec.height
                source: {
                    if(modelData === "Backspace"){
                        text.text = ""
                        source:"images/kb_backspace_highlight.png"
                    }
                }
            }
            Image {
                id: img2
                width: rec.width; height: rec.height
                source: {
                    if(modelData === "Shift"){
                        text.text = ""
                        return "images/shift_inactive.png"
                    }

                }
            }
            Image {
                id: img3
                width: rec.width; height: rec.height
                source: {
                    if(modelData === "Space"){
                        lowCase = true
                        rec.width = 300
                        return "images/kb_space_key_normal_short_24058.png"
                    }
                }
            }
            Image {
                id: img4
                width: rec.width; height: rec.height
                source: {
                    if(modelData === "Confirm"){
                        lowCase = true
                        rec.width = 100
                        return "images/settings_button_green_highlight.png"
                    }
                }
            }
            Text{
                id: text
                font.pointSize: 15
                text: modelData
                color: "white"
                anchors.centerIn: rec
                font.capitalization: if(lowCase) Font.AllLowercase
                                     else Font.AllUppercase
            }
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onPressed: {
                    isPress=true
                    timer.running=true
                    switch(modelData)
                    {
                    case "a": selIndex=0;break;
                    case "e": selIndex=1;break;
                    case "o": selIndex=2;break;
                    case "u": selIndex=3;break;
                    case "d": selIndex=4;break;
                    default: selIndex=5;break;
                    }
                }
                onReleased: {
                    valid +=1
                    if(modelData === "Shift"){
                        if(valid%2 === 1){
                            img2.source = "images/shift_activated.png"
                            row.shiftPress()
                        }
                        else{
                            img2.source = "images/shift_inactive.png"
                            lowCaseBig = true
                        }
                    }
                    else if(modelData === "Backspace"){
                        input.text = input.text.substring(0,input.text.length-1)

                    }
                    else if(modelData === "Space"){

                        input.text = input.text + " "
                    }
                    else if(modelData === "?123"){
                        console.log(clicked)
                    }
                    else if(modelData === "Confirm"){
                        console.log(clicked)
                    }
                    else {
                        if(isPress===true) sendMsg(modelData);
                    }
                    timer.running=false
                }
                onPressAndHold: (modelData==="Backspace")? input.text = "": input.text
}
            Grid{
                id: grid
                rows: 2
                columns: 3
                spacing: 3
                visible: false
                anchors.bottom: rec.top
                anchors.left: rec.left
                Repeater{
                    model: popup[selIndex]
                    delegate: Rectangle{
                        width: 50; height: 50
                        color: "white"
                        Text{
                            text: modelData
                            color: "black"
                            font.pointSize: 15
                            anchors.centerIn: parent
                        }
                        MouseArea{
                            anchors.fill: parent
                            onClicked: {
                                sendMsg(modelData);
                                grid.visible=false
                                //lowCase=true
                            }
                            hoverEnabled: true

                        }
                    }
                }
            }
            Timer{
                id: timer
                interval: 500
                onTriggered: {
                    grid.visible=true
                    isPress=false
                }
            }
        }

    }
}

