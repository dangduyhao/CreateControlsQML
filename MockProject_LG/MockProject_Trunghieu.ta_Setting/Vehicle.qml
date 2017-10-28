import QtQuick 2.6

Item {
    id: root
    height: 410
    width: 800
    property var arr: ["", "", "", ""]
    Rectangle {
        id: recID
        height: 410
        width: 800
        color: "black"
        Image { id: arrLeft; source: "images/back_normal.png"
            MouseArea{
                anchors.fill: parent
                onClicked: app.screenChange("SettingSystem.qml")
            }
        }
        Image { id: backSetDate; anchors.right: parent.right; source: "images/close_normal.png"
            MouseArea{
                anchors.fill: parent
                onClicked: app.screenChange("Home.qml")
            }
        }

        Rectangle {
            height: 40; width: 2; anchors.left: arrLeft.right
            color: "gray"; y: 15
        }
        Rectangle {
            height: 40; width: 2; anchors.right: backSetDate.left;
            color: "gray"; y: 15
        }

        Rectangle {id: rectRow; height: 1;  width: 800;  color: "blue";  y: 68}

        Text {
            id: textID
            text: "Valet Mode - Enter Code to Lock"
            anchors.horizontalCenter: recID.horizontalCenter
            y: 15
            font.pointSize: 20
            color: "white"
        }

        Grid {
            id: grid
            columns: 3
            rows: 4
            spacing: 2
            anchors.top: rectRow.bottom
            anchors.horizontalCenter: rectRow.horizontalCenter
            anchors.topMargin: 70
            Repeater {
                model: 12
                Rectangle {
                    height: 50
                    width: 80
                    visible: (index == 11) ? false : true
                    color: (index == 9 || index == 11)?"black" : "#38332e"
                    Text {
                        id: textNumber
                        text: (index == 10)? 0 : index + 1;
                        color: (index == 9)? "black" : "white"
                        anchors.centerIn: parent; font.pointSize: 20
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            var array = arr
                            if(array[0] === "" && index != 9){
                                for(var i = 0; i < array.length - 1; i++)
                                    array[i] = array[i + 1]
                                array[3] = (index === 10)? 0 : (index + 1)
                                arr = array
                                //console.log("add")
                            }
                            //console.log("add :" + arr)
                        }
                    }
                }
            }
        }


        //----------------- password ----------------------
        Grid {
            id: gridDisp
            columns: 4
            spacing: 3
            anchors.bottom: grid.top
            anchors.left: grid.left
            anchors.bottomMargin: 8
            Repeater {
                model: 4
                Rectangle {
                    height: 40
                    width: 45
                    border.color: "gray"
                    border.width: 1
                    color: "black"
                    Text {
                        id: numberDisp
                        text: arr[index]
                        color: "white"
                        anchors.centerIn: parent; font.pointSize: 13
                    }
                }
            }
        }

        Image {
            source: "images/delete_normal.png"
            anchors.right: grid.right
            anchors.rightMargin: -8
            anchors.bottom:  grid.top
            //nchors.
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    var array = arr
                    if(array[array.leng - 1] !== ""){
                        for(var i = array.length - 1; i > 0; i--)
                            array[i] = array[i - 1]
                        array[0] = ""
                        arr = array
                        //console.log("delete")
                    }
                    //console.log("delete : " + arr)
                }
            }
        }


        //-----------Enter-------------
        Rectangle {
            id: rectEnter
            height: 50;  width: 100
            anchors.bottom: parent.bottom; anchors.bottomMargin: 10
            anchors.right: parent.right; anchors.rightMargin: 40
            color: "#009900"
            Text {
                text: "Enter"; color: "white"
                font.pointSize: 15
                anchors.centerIn: parent
            }
            MouseArea{
                anchors.fill: parent
                onClicked: app.screenChange("SettingSystem.qml")
            }
        }
    }
}
