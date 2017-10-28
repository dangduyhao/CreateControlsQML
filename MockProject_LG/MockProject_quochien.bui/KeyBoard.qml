import QtQuick 2.0
import "Constants.js" as Constants

Item {
    property variant vowel: ["u","e","o","a","i","ư","ê","ô","ơ","ă","â"]
    property variant sVowel:["ú","é","ó","á","í","ứ","ế","ố","ớ","ắ","ấ"]
    property variant fVowel:["ù","è","ò","à","ì","ừ","ề","ồ","ờ","ằ","ầ"]
    property variant rVowel:["ủ","ẻ","ỏ","ả","ỉ","ử","ể","ổ","ở","ẳ","ẩ"]
    property variant xVowel:["ũ","ẽ","õ","ã","ĩ","ữ","ễ","ỗ","ỡ","ẵ","ẫ"]
    property variant jVowel:["ụ","ẹ","ọ","ạ","ị","ự","ệ","ộ","ợ","ặ","ậ"]
    property int vowelIndex
    property bool timeOut: true
    property string str: ""
    property bool lowCaseBig: true
    function typeText(msg)
    {
//        if(isPress===true)
            if(lowCaseBig)input.text += msg
            else input.text += msg.toUpperCase()
    }
    function doubleType(msg)
    {
        for(var i=0; i<vowel.length;i++)
        {
            if(msg===vowel[i]){
                console.log(vowel[i])
                timeOut = false
                str=vowel[i];
                vowelIndex=i;
                dbClickTimer.running = true
                typeText(msg);
                break;
            }
        }
        if(timeOut){

            typeText(msg);
        }
        else if(msg!=="u"&&msg!=="e"&&msg!=="o"&&msg!=="a"&&msg!=="i"&&msg!=="ư"&&msg!=="ê"&&msg!=="ô"&&msg!=="ơ"&&msg!=="ă"&&msg!=="â")
        {
            switch(msg)
            {
            case "x":
                input.text = input.text.substring(0,input.text.length-1);
                typeText(xVowel[vowelIndex]);
                dbClickTimer.running=false
                timeOut=true
                break;
            case "f":
                input.text = input.text.substring(0,input.text.length-1);
                typeText(fVowel[vowelIndex]);
                dbClickTimer.running=false
                timeOut=true
                break;
            case "r":
                input.text = input.text.substring(0,input.text.length-1);
                typeText(rVowel[vowelIndex]);
                dbClickTimer.running=false
                timeOut=true
                break;
            case "s":
                input.text = input.text.substring(0,input.text.length-1);
                typeText(sVowel[vowelIndex]);
                dbClickTimer.running=false
                timeOut=true
                break;
            case "j":
                input.text = input.text.substring(0,input.text.length-1);
                typeText(jVowel[vowelIndex]);
                dbClickTimer.running=false
                timeOut=true
                break;
            default: typeText(msg);
                timeOut = true
                dbClickTimer.running=false
            }
        }
    }

    Timer{
        id:dbClickTimer
        interval: 2000
        onTriggered: {
            timeOut=true
        }
    }
    Rectangle{
        id: rect1
        width: Constants.screen_width
        height: 50
        color: "#000000"
        border.color: "blue"
        Image{
            id: back_highlight
            source: "images/back_highlight.png"
            width: 50; height: 50
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    app.screenChange("SettingSystem.qml")
                    console.log(clicked)
                }
            }
        }
        Image{
            id: close_highlight
            source: "images/close_highlight.png"
            width: 50; height: 50
            anchors.right: rect1.right
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    app.screenChange("SettingSystem.qml")
                    console.log(clicked)
                }
            }
        }
        Text{
            text: "Add Other Network - Password"
            color: "white"
            font.pointSize: 20
            font.bold: true
            anchors.left: back_highlight.right
            anchors.centerIn: parent
        }
    }
    Rectangle{
        id: rect2
        x: 30; y: 70
        width: 600; height: 40
        color: "#000000"
        border.color: "#F5BCA9"
        TextInput{
            id: input
            x: 35
            width: 500; height: 40
            focus: true
            font.pointSize: 20
            color: "#FF8000"
        }
    }

    Rectangle{
        id: rect3
        width: Constants.screen_width
        height: 350
        border.color: "blue"
        color: "#000000"
        anchors.bottom: parent.bottom
        Column{
            id: column
            spacing: 8
            Square{lowCase:lowCaseBig;repeater: ["1","2","3","4","5","6","7","8","9","0"]
                Component.onCompleted: sendMsg.connect(doubleType)
            }
            Square{lowCase:lowCaseBig;repeater: ["q","w","e","r","t","y","u","i","o","p"]
                Component.onCompleted: sendMsg.connect(doubleType)
            }
            Square{lowCase:lowCaseBig;repeater: ["a","s","d","f","g","h","j","k","l"]; anchors.horizontalCenter: column.horizontalCenter
                Component.onCompleted: sendMsg.connect(doubleType)
            }
            Square{lowCase:lowCaseBig;repeater: ["Shift","z","x","c","v","b","n","m","Backspace"]; anchors.horizontalCenter: column.horizontalCenter
            onShiftPress: lowCaseBig = false
            Component.onCompleted: sendMsg.connect(doubleType)
            }
            Square{lowCase:lowCaseBig;repeater: ["?123","Space",".","Confirm"]; anchors.horizontalCenter: column.horizontalCenter
                Component.onCompleted: sendMsg.connect(doubleType)
            }

            anchors.verticalCenter: rect3.verticalCenter
            anchors.horizontalCenter: rect3.horizontalCenter
        }
    }
}
