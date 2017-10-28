import QtQuick 2.0

Row{//row Number
    id: root
    property var alphaKey: []
    property string kbNormalSource: "images/kb_alphanumkey_normal_8066.png"
    property string kbHighlightSource: "images/kb_alphanumkey_highlight_8066.png"
    property bool capLock: false
    signal shiftClick()
    signal keyPressAndHold(string keyName,int positionKeyX,int positionKeyY)
    signal keyReleased()
    signal mouseChange(int mousePosition)
    signal showNumClick()
    signal hideKeyboardClick()
    Repeater{
        model:alphaKey
        Image {
            id: imgKey
            source: {
                switch(alphaTextKey.text){
                case "Space": return "images/kb_space_key_normal_short_24058.png"
                case "Confirm": return "images/kb_greenbutton_normal.png"
                case "BackSpace":return "images/kb_backspace_normal.png"
                case "Shift":return "images/shift_inactive.png"
                case "Down":return "images/kb_minimize_normal.png"
                default: return kbNormalSource
                }
            }
            Text {
                id: alphaTextKey
                text:modelData
                anchors.centerIn: parent
                color: "white"
                font.pixelSize: 25
                font.capitalization: {
                    if(modelData != "BackSpace"&&modelData != "Shift"&&modelData != "Space"&&modelData != "Confirm")
                        return capLock?Font.AllUppercase:Font.AllLowercase
                    else return Font.Capitalize
                }
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    if (firstClick != true&&modelData != "BackSpace"&&modelData != "Shift"&&modelData != "Confirm"&&modelData != "?123"&&modelData != "Down"){
                        firstClick=true
                        inputText.text = ""
                    }
                    var cursorTempPosition = inputText.cursorPosition
                    switch(alphaTextKey.text){
                    case "Space":
                        inputText.text = inputText.text.slice(0,cursorTempPosition)+" "+inputText.text.slice(cursorTempPosition)
                        inputText.cursorPosition = cursorTempPosition+1
                        break;
                    case "Confirm":
                        break;
                    case "BackSpace":
                        if(firstClick===true)inputText.text = inputText.text.slice(0,cursorTempPosition-1)+inputText.text.slice(cursorTempPosition)
                        inputText.cursorPosition = cursorTempPosition-1
                        if (inputText.text === ""&&firstClick===true) {
                            firstClick = false
                            inputText.text = "network password"
                            inputText.cursorPosition = 0;
                        }
                        break;
                    case "Shift":
                        root.shiftClick()
                        break;
                    case "?123":
                        root.showNumClick()
                        break;
                    case "´`῀":
                        break;
                    case "Down":
                        root.hideKeyboardClick()
                        break;
                    default:
                        var ch = modelData
                        if (ch==="s"||ch==="f"||ch==="r"||ch==="x"||ch==="j"){
                            var selectSign;
                            switch(ch){
                            case "s":
                                selectSign = 0;
                                break;
                            case "f":
                                selectSign = 1;
                                break;
                            case "r":
                                selectSign = 2;
                                break;
                            case "x":
                                selectSign = 3;
                                break;
                            case "j":
                                selectSign = 4;
                                break;
                            }

                            for (var i=0;i<characterXample.length;i++){
                                if (characterXample[i]===inputText.text.slice(cursorTempPosition-1,cursorTempPosition)){
                                    ch = characterSign[i][selectSign]
                                    break;
                                }
                                else if (characterXample[i]===inputText.text.slice(cursorTempPosition-1,cursorTempPosition).toLowerCase())
                                {
                                    ch = characterSign[i][selectSign].toUpperCase()
                                    break;
                                }
                            }
                        }

                        if (ch==="a"||ch==="w"||ch==="e"||ch==="o"||ch==="d"){
                            switch(inputText.text.slice(cursorTempPosition-1,cursorTempPosition).toLowerCase()){
                            case "a":
                                if (ch==="a") ch = "â"
                                if (ch==="w") ch = "ă"
                                break;
                            case "e":
                                if (ch==="e") ch = "ê"
                                break;
                            case "o":
                                if (ch==="o") ch = "ô"
                                if (ch==="w") ch = "ơ"
                                break;
                            case "u":
                                if (ch==="w") ch = "ư"
                                break;
                            case "d":
                                if (ch==="d") ch = "đ"
                                break;
                            }
                            if(ch !=modelData&&inputText.text.slice(cursorTempPosition-1,cursorTempPosition).toLowerCase()!=inputText.text.slice(cursorTempPosition-1,cursorTempPosition)) ch = ch.toUpperCase()
                        }
                        if (ch !=modelData){
                            inputText.text = inputText.text.slice(0,cursorTempPosition-1)+inputText.text.slice(cursorTempPosition)
                            inputText.cursorPosition = cursorTempPosition-1
                        }
                        inputText.text = inputText.text.slice(0,cursorTempPosition)+(capLock?(ch.toUpperCase()):ch)+inputText.text.slice(cursorTempPosition)
                        inputText.cursorPosition = cursorTempPosition+1
                        break;
                    }
                }
                onPressAndHold: {
                    root.keyPressAndHold(modelData,root.x+index*80,root.y-50,mouseX)
                    if(modelData != "BackSpace"&&modelData != "Shift"&&modelData != "Space"&&modelData != "Confirm") parent.source = kbNormalSource
                }
                onMouseXChanged: {
                    root.mouseChange(mouseX)
                }

                onReleased: {
                    root.keyReleased()
                }

                onEntered: {
                    switch(alphaTextKey.text){
                    case "Space":
                        parent.source = "images/kb_space_key_highlight_short_24058.png"
                        break;
                    case "Confirm":
                        parent.source = "images/kb_greenbutton_highlight.png"
                        break;
                    case "BackSpace":
                        parent.source = "images/kb_backspace_highlight.png"
                        break;
                    case "Shift":
                        parent.source = capLock?"images/shift_active_press.png":"images/shift_active_press.png"
                        break;
                    case "Down":
                        parent.source = "images/kb_minimize_highlight.png"
                        break;
                    default:
                        parent.source = kbHighlightSource;
                        break;
                    }
                }
                onExited: {
                    switch(alphaTextKey.text){
                    case "Space":
                        parent.source = "images/kb_space_key_normal_short_24058.png"
                        break;
                    case "Confirm":
                        parent.source = "images/kb_greenbutton_normal.png"
                        break;
                    case "BackSpace":
                        parent.source = "images/kb_backspace_normal.png"
                        break;
                    case "Shift":
                        parent.source = capLock?"images/shift_activated.png":"images/shift_inactive.png"
                        break;
                    case "Down":
                        parent.source = "images/kb_minimize_normal.png"
                        break;
                    default:
                        parent.source = kbNormalSource;
                        break;
                    }
                }
            }
            Component.onCompleted: {
                if(modelData === "BackSpace"||modelData === "Shift"||modelData === "Down"){
                    alphaTextKey.visible = false
                }
                if(modelData === "BackSpace"||modelData === "Shift"||modelData === "Space"||modelData === "Confirm"||modelData === "Down"){
                    imgKey.anchors.bottom = root.bottom
                }
            }

        }
    }
}
