import QtQuick 2.6
import QtQuick.Window 2.2
import "Constants.js" as Constants

Item {
    property string targetString: ""
    property string targetLeftString
    property string targetRightString
    property int cursorIndex: targetString.length
    property int tempCursor
    property bool cmdLowerCase: true
    property bool notShilfPress: true
    property int btnHeight: 58
    property variant dataRelative1:
        [["1"],["2"],["3"],["4"],["5"],["6"],["7"],["8"],["9"],["0"]]
    property variant dataRelative2:[
        ["Q"],["W"],
        ["E","E","Ê"],
        ["R"],["T"],["Y"],
        ["U","U","Ư"],
        ["I"],
        ["O","O","Ô","Ơ"],
        ["P"],
    ]
    property variant dataRelative3:[
        ["A","A","Ă","Â"],
        ["S"],
        ["D","Đ"],
        ["F"],["G"],["H"],["J"],["K"],["L"]
    ]
    property variant dataRelative4:[
        ["Z"],["X"],["C"],["V"],["B"],["N"],["M"]
    ]

    property variant vowel: ["A","E","O","U","I","Â","Ă","Ê","Ô","Ơ","Ư"]
    property variant sVowel: ["Á","É","Ó","Ú","Í","Ấ","Ắ","Ế","Ố","Ớ","Ứ"]
    property variant fVowel: ["À","È","Ò","Ù","Ì","Ầ","Ằ","Ề","Ồ","Ờ","Ừ"]
    property variant rVowel: ["Ả","Ẻ","Ỏ","Ủ","Ỉ","Ẩ","Ẳ","Ể","Ổ","Ở","Ử"]
    property variant xVowel: ["Ã","Ẽ","Õ","Ũ","Ĩ","Ẫ","Ẵ","Ễ","Ỗ","Ỡ","Ữ"]
    property variant jVowel: ["Ạ","Ẹ","Ọ","Ụ","Ị","Ậ","Ặ","Ệ","Ộ","Ợ","Ự"]
    property int vowelIndex
    property bool dbClickTimeout: true
    property bool isLowerCase: false
    property string lastMsg: ""
    function typeText(msg)
    {
        if(msg!=="clear")
        {
        targetLeftString=targetString.substring(0,cursorIndex)
        targetRightString=targetString.substring(cursorIndex,targetString.length)
        if(cmdLowerCase)
        targetLeftString+=msg.toLowerCase();
        else targetLeftString+=msg;
        tempCursor=cursorIndex+1;
        targetString=targetLeftString+targetRightString
        if(notShilfPress) cmdLowerCase=true;
        }
        else{
            targetLeftString=targetString.substring(0,cursorIndex-1)
            targetRightString=targetString.substring(cursorIndex,targetString.length)
            tempCursor=cursorIndex-1;
            targetString=targetLeftString+targetRightString
        }

    }
    function doubleClick(msg)
    {
        for(var i=0;i<vowel.length;i++)
        {
            if(msg===vowel[i]){
                doubleClickTimer.running=true
                dbClickTimeout=false
                lastMsg=vowel[i];
                vowelIndex=i;
                isLowerCase=cmdLowerCase;
                typeText(msg);
                console.log("vowel letter"+msg)
            }
        }
        if(dbClickTimeout)
        {
            typeText(msg);
        } else if(msg!=="A"&&msg!=="E"&&msg!=="O"&&msg!=="U"&&msg!=="I"&&msg!=="Â"&&msg!=="Ă"&&msg!=="Ê"&&msg!=="Ô"&&msg!=="Ơ"&&msg!=="Ư"){
            switch(msg)
            {
            case "S":typeText("clear");
                cmdLowerCase=isLowerCase;
//                console.log(isLowerCase);
                typeText(sVowel[vowelIndex])
                dbClickTimeout=true
                doubleClickTimer.running=false
                break;
            case "F":typeText("clear");
                cmdLowerCase=isLowerCase;
//                console.log(isLowerCase);
                typeText(fVowel[vowelIndex])
                dbClickTimeout=true
                doubleClickTimer.running=false
                break;
            case "R":typeText("clear");
                cmdLowerCase=isLowerCase;
//                console.log(isLowerCase);
                typeText(rVowel[vowelIndex])
                dbClickTimeout=true
                doubleClickTimer.running=false
                break;
            case "X":typeText("clear");
                cmdLowerCase=isLowerCase;
//                console.log(isLowerCase);
                typeText(xVowel[vowelIndex])
                dbClickTimeout=true
                doubleClickTimer.running=false
                break;
            case "J":typeText("clear");
                cmdLowerCase=isLowerCase;
//                console.log(isLowerCase);
                typeText(jVowel[vowelIndex])
                dbClickTimeout=true
                doubleClickTimer.running=false
                break;
            default:typeText(msg);
                dbClickTimeout=true
                doubleClickTimer.running=false
            }
        }
    }

    Timer{
        id:doubleClickTimer
        interval:2000
        running:false
        onTriggered: {
            dbClickTimeout=true
        }
    }

    Image{
        id:kp_bng
        source: "images/keyboard_bg.png"
        anchors.top: row1.top
    }

    Row{
        id:row1
        x:0
        y:row2.y-btnHeight
        spacing:0
        Repeater{
            id:row1rep
            model:dataRelative1
            delegate: SingleButton{
                relatives:modelData
                //                width:70;height: 70
                lowerCase: cmdLowerCase
                Component.onCompleted: sendLetter.connect(doubleClick)
            }
        }
    }
    Row{
        id:row2
        x:0
        y:row3.y-btnHeight
        spacing:0
        Repeater{
            id:row2rep
            model:dataRelative2
            delegate: SingleButton{
                id:theBtn
                lowerCase: cmdLowerCase
                relatives:modelData
                //                width:70;height: 70
                Component.onCompleted: sendLetter.connect(doubleClick)

            }
        }
    }
    Row{
        id:row3
        x:40
        y:row4.y-btnHeight
        spacing:0
        Repeater{
            id:row3rep
            model:dataRelative3
            delegate: SingleButton{
                relatives:modelData
                lowerCase: cmdLowerCase
                //                width:70;height: 70
                Component.onCompleted: sendLetter.connect(doubleClick)

            }
        }
    }
    Row{
        id:row4
        x:0
        y:row5.y-btnHeight
        spacing:0
        SingleButton{
            btn_source_nomal: "images/shift_inactive.png"
            btn_source_highlight: "images/shift_activated.png"
            relatives: [""]
            buttonY:6
            onSendCmdHold: {
                cmdLowerCase=false
                notShilfPress=false
                notPress=notShilfPress
            }
            onSendCmd: {
                cmdLowerCase^=1;
                notShilfPress=true;
                notPress=notShilfPress
            }

        }
        Repeater{
            id:row4rep
            model:dataRelative4
            delegate: SingleButton{
                relatives:modelData
                lowerCase:cmdLowerCase
                Component.onCompleted: sendLetter.connect(doubleClick)
            }
        }
        SingleButton{
            btn_source_nomal: "images/kb_backspace_normal.png"
            btn_source_highlight: "images/kb_backspace_highlight.png"
            relatives: [""]
            buttonY: 6
            onSendCmd:
            {
                typeText("clear");
            }
        }
    }
    Row{
        id:row5
        x:0
        y:480-btnHeight-10
        spacing:0
        SingleButton{
            //            btn_source_nomal: "images/short_button_normal.png"
            //            btn_source_highlight: "images/short_button_highlight.png"
            relatives: [""]
            buttonTextLabel:"?123"
        }
        SingleButton{
            btn_source_nomal: "images/kb_space_key_normal_short_24058.png"
            btn_source_highlight: "images/kb_space_key_normal_short_24058.png"
            relatives: [""]
            buttonTextLabel:"Space"
            buttonY: 7
            onSendCmd: typeText(" ")
        }
        SingleButton{
            relatives:["."]
            Component.onCompleted: sendLetter.connect(doubleClick)
        }

        SingleButton{
            btn_source_nomal: "images/kb_greenbutton_normal.png"
            btn_source_highlight: "images/kb_greenbutton_highlight.png"
            buttonTextLabel:"Comfirm"
            buttonY: 7
        }
    }
}
