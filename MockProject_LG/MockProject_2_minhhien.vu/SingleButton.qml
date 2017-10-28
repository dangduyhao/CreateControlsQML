import QtQuick 2.0

Item {
    id:root
    width:buttonWidth;height:buttonHeight
    property bool lowerCase
    property bool notPress: true
    property int buttonWidth: thebutton.width
    property int buttonHeight: thebutton.height
    property int buttonX: 0
    property int buttonY: 0
    property string buttonTextLabel:"null"
    property string buttonText: relatives[0]
    property string colorBtn:"#2c3e50"
    property variant relatives: ["A","Á","À","Ă","Â"]
    property variant relatives_long: relatives.slice(1)
    signal sendLetter(string msg)
    signal sendCmd
    signal sendCmdHold
    property string btn_source_nomal: "images/kb_alphanumkey_normal_8066.png"
    property string btn_source_highlight: "images/kb_alphanumkey_highlight_8066.png"
    property int fontSize: 25
    property var positionInRoot
    property int relaIndex:4
    property int relativeWidth: 47
    property int relativeHeight: 54
    property bool relateDrag: false
    onPositionInRootChanged: {
        if(positionInRoot.x>0&&positionInRoot.x<theRelative.width&&positionInRoot.y>0&&positionInRoot.y<theRelative.height)
        relaIndex=Math.floor(positionInRoot.x/relativeWidth)+Math.floor(positionInRoot.y/relativeHeight)*4
//        console.log(relaIndex)
    }
    onRelaIndexChanged: {
        if(relaIndex>=0&&relaIndex<relatives_long.length) relateDrag=true;
        theRepeater.itemAt(relaIndex).source="images/longpress_highlight.png";
        for(var i=0;i<relatives_long.length;i++)
        {
            if(i!=relaIndex) theRepeater.itemAt(i).source="images/longpress_white.png";
        }
    }



    Image {
        id: thebutton
        source: btn_source_nomal
        property bool isPress: false
        x:buttonX;y:buttonY
//        anchors.fill: parent
        Text {
            id: textI
            text: {
                if(buttonTextLabel!="null") buttonTextLabel
                else buttonText
            }
            font.pixelSize: fontSize
            anchors.centerIn: parent
            color: "white"
            font.capitalization: {
                if(buttonTextLabel==="null")
                if(lowerCase)Font.AllLowercase;
                else Font.AllUppercase;
            }

        }
        MouseArea{
            anchors.fill: parent
            onPressed: {

                thebutton.source= btn_source_highlight
                theRelative.visible=false
                thebutton.isPress=true
                theTimer.running=true
            }
            onPressAndHold: {
                sendCmdHold()
            }

            onReleased: {
                if(thebutton.isPress) {sendLetter(textI.text)
                    sendCmd();
                }
                if(notPress) thebutton.source=btn_source_nomal
                theTimer.running=false
                if(relateDrag) {
                    theRelative.visible=false;
                    sendLetter(relatives_long[relaIndex]);
                    theRepeater.itemAt(relaIndex).source="images/longpress_white.png";
                    relateDrag=false
                    relaIndex=4;
                }
            }
            onPositionChanged: {
                positionInRoot = mapToItem(theRelative, mouse.x, mouse.y)
//                console.log(positionInRoot)
            }
        }
        Timer{
            id:theTimer
            interval:500
            onTriggered: {
                thebutton.isPress=false
                theRelative.visible=true
            }

        }

    }
    Grid{
        id:theRelative
        visible: false
        columns: 4
        anchors.bottom: thebutton.top
        anchors.bottomMargin: 0
        anchors.left: thebutton.left
        anchors.leftMargin: 5
        spacing:0
        Repeater{
            id:theRepeater
            model:relatives_long
            delegate: Image{
                id:theRelativeLetter
                source: "images/longpress_white.png"
                Text {
                    id: theRelativeText
                    text: modelData
                    anchors.centerIn: parent
                    font.pixelSize: fontSize
                    font.capitalization: {
                        if(buttonTextLabel==="null")
                        if(lowerCase)Font.AllLowercase;
                        else Font.AllUppercase;
                    }
                }
                MouseArea{
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: theRelativeLetter.source="images/longpress_highlight.png"
                    onExited: theRelativeLetter.source="images/longpress_white.png"
                    onClicked: {
                        sendLetter(relatives_long[index])
                        theRelative.visible=false
                    }
                }


            }
        }
    }
    TextInput{
        visible: false
        id:theOutput
        font.pixelSize: 20
        text: "type here"
        color: "red"
        y:400
    }
}
