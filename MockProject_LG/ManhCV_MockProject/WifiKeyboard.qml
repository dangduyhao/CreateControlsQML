import QtQuick 2.6

Item {
    property bool hasStatusBar: false
    property var characterSign: [//array using to add sign for character
        ["á","à","ả","ã","ạ"],
        ["ắ","ằ","ẳ","ẵ","ạ"],
        ["ấ","ầ","ẩ","ẫ","ậ"],
        ["é","è","ẻ","ẽ","ẹ"],
        ["ế","ề","ể","ễ","ệ"],
        ["í","ì","ỉ","ĩ","ị"],
        ["ó","ò","ỏ","õ","ọ"],
        ["ố","ồ","ổ","ỗ","ộ"],
        ["ớ","ờ","ở","ỡ","ợ"],
        ["ú","ù","ủ","ũ","ụ"],
        ["ứ","ừ","ử","ữ","ự"],
        ["ý","ỳ","ỷ","ỹ","ỵ"]
    ]
    property var characterXample: ["a","ă","â","e","ê","i","o","ô","ơ","u","ư","y"]
    property bool firstClick: false
    Image {//Top bar
        id: topBar
        source: "images/actionbar_bg.png"
        Image {
            id: back
            source: "images/back_normal.png"
            MouseArea{
                anchors.fill: parent
                onEntered: parent.source = "images/back_highlight.png"
                onExited: parent.source = "images/back_normal.png"
                onClicked: console.log("click back to setting")
            }
        }
        Image {
            id: close
            source: "images/close_normal.png"
            anchors.right: parent.right
            MouseArea{
                anchors.fill: parent
                onEntered: parent.source = "images/close_highlight.png"
                onExited: parent.source = "images/close_normal.png"
                onClicked: console.log("click close to setting")
            }
        }
        Image {
            source: "images/statusbar_timetemp_separator.png"
            anchors.left: back.right
            anchors.verticalCenter: back.verticalCenter
        }
        Image {
            source: "images/statusbar_timetemp_separator.png"
            anchors.right: close.left
            anchors.verticalCenter: close.verticalCenter
        }
        Text {
            font.pixelSize: 30
            text: "Add Other Network - Password"
            color: "white"
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: back.right
            anchors.margins: 20
        }
    }
    Image {//separator blue
        source: "images/function_separator_horizontal_plain_blue.png"
        anchors.top: topBar.bottom
    }
    Image {
        id: inputTextBackground
        source: "images/keyboard_input_bg.png"
        clip:true
        x:20
        y:(keyboardBackground.y+topBar.height-inputTextBackground.height)/2
        TextInput{
            id: inputText
            color: firstClick?"white":"green"
            text: "network password"
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 10
            font.pixelSize: 20
            focus: true
            cursorVisible: true
            Component.onCompleted: {
                cursorPosition = 0
            }
        }
        MouseArea{
            visible: keyboardBackground.showKeyboard?false:true
            anchors.fill: parent
            onClicked: {
                keyboardBackground.showKeyboard = true
            }
        }
    }
    Image {//separator blue
        source: "images/function_separator_horizontal_plain_blue.png"
        anchors.bottom: keyboardBackground.top
    }
    Image {
        id: keyboardBackground
        property bool capLock: false
        property bool showNumKey: true
        property bool showKeyboard: true
        source: "images/keyboard_bg.png"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: showKeyboard?(showNumKey?0:-50):-keyboardBackground.height-2
        Column{
            anchors.fill: parent
            spacing: -8
            RowKeyboard{
                capLock:keyboardBackground.capLock
                alphaKey: keyboardBackground.showNumKey?["1","2","3","4","5","6","7","8","9","0"]:[]
            }
            RowKeyboard{
                capLock:keyboardBackground.capLock
                alphaKey: ["q","w","e","r","t","y","u","i","o","p"]
                Component.onCompleted: {
                    keyPressAndHold.connect(keyboardBackground.showPopupKeyPressAndHold)
                    mouseChange.connect(keyboardBackground.changKey)
                    keyReleased.connect(keyboardBackground.releaseKey)
                }
            }
            RowKeyboard{
                capLock:keyboardBackground.capLock
                alphaKey: ["a","s","d","f","g","h","j","k","l","´`῀"]
                Component.onCompleted: {
                    keyPressAndHold.connect(keyboardBackground.showPopupKeyPressAndHold)
                    mouseChange.connect(keyboardBackground.changKey)
                    keyReleased.connect(keyboardBackground.releaseKey)
                }
            }
            RowKeyboard{
                capLock:keyboardBackground.capLock
                alphaKey: ["Shift","z","x","c","v","b","n","m","BackSpace"]
                anchors.horizontalCenter: parent.horizontalCenter
                onShiftClick:{
                    keyboardBackground.capLock = keyboardBackground.capLock?false:true
                }
            }
            RowKeyboard{
                capLock:keyboardBackground.capLock
                alphaKey: ["?123","Space",".","Down","Confirm"]
                anchors.horizontalCenter: parent.horizontalCenter
                onShowNumClick: keyboardBackground.showNumKey = !keyboardBackground.showNumKey
                onHideKeyboardClick: keyboardBackground.showKeyboard = false
            }
        }
        function showPopupKeyPressAndHold(keyName, positionKeyX,positionKeyY){
            popupKey.alphabet = keyName
            popupKey.x = positionKeyX
            popupKey.y = positionKeyY
            popupKey.visible = true
            if (popupKey.alphabet==="´`῀") {popupKey.x = positionKeyX-160;popupKey.select = 4}
        }
        function changKey(mousePosion){
            if (repeaterPopup.count!=1)popupKey.select = (mousePosion<48)?0:1
            else popupKey.select = 0
            if (popupKey.alphabet==="´`῀") popupKey.select=(Math.round(mousePosion/48+3))
        }
        function releaseKey(){
            var cursorTempPosition = inputText.cursorPosition
            if (popupKey.alphabet==="´`῀"){
                var character = inputText.text.slice(cursorTempPosition-1,cursorTempPosition)
                for (var i=0;i<characterXample.length;i++){
                    if (characterXample[i]===character){
                        inputText.text = inputText.text.slice(0,cursorTempPosition-1)+characterSign[i][popupKey.select]+inputText.text.slice(cursorTempPosition)
                        break;
                    }
                    else if (characterXample[i]===character.toLowerCase())
                    {
                        inputText.text = inputText.text.slice(0,cursorTempPosition-1)+characterSign[i][popupKey.select].toUpperCase()+inputText.text.slice(cursorTempPosition)
                        break;
                    }
                }
                inputText.cursorPosition = cursorTempPosition
            }
            else
            {
                inputText.text = inputText.text.slice(0,cursorTempPosition)+(capLock?popupKey.popupTextSelect.toUpperCase():popupKey.popupTextSelect)+inputText.text.slice(cursorTempPosition)
                if(popupKey.popupTextSelect!="") inputText.cursorPosition = cursorTempPosition+1
            }
            popupKey.visible = false
            popupKey.select = 0
            popupKey.alphabet = ""
            popupKey.popupTextSelect = ""
        }
        Row{
            id: popupKey
            visible: false
            property string alphabet: ""
            property int select: 0
            property string popupTextSelect: ""
            spacing: 2
            Repeater{
                id: repeaterPopup
                model: {
                    if (popupKey.alphabet==="a") return ["ă","â"]
                    if (popupKey.alphabet==="d") return ["đ"]
                    if (popupKey.alphabet==="e") return ["ê"]
                    if (popupKey.alphabet==="u") return ["ư"]
                    if (popupKey.alphabet==="o") return ["ô","ơ"]
                    if (popupKey.alphabet==="´`῀") return ["´","`","?","῀","."]
                }
                Image {
                    source:{
                        if (popupKey.select === index) return "Images/longpress_highlight.png"
                        else return "Images/longpress_white.png"
                    }

                    focus: true
                    Text{
                        text: keyboardBackground.capLock?modelData.toUpperCase():modelData
                        anchors.centerIn: parent
                        color: "black"
                        font.pixelSize: 25
                    }
                    Component.onCompleted: {
                        if(popupKey.select === index) popupKey.popupTextSelect = modelData
                    }
                    onSourceChanged: {
                        if(popupKey.select === index) popupKey.popupTextSelect = modelData
                    }
                }
            }
        }
    }
}
