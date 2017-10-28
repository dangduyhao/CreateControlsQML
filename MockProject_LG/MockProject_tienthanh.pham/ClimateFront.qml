import QtQuick 2.6
import "Constants.js" as Constants
Item{
    property bool hasStatusBar: true
    Image{
        id:frontbar
        source: "images/climate_non_nav_bg.png"
        width:parent.width/2
        x:0;y:0
        Text{
            text:"Front"
            font.pixelSize: 25
            color: "white"
            anchors.centerIn: parent

        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                loader.setSource("ClimateFrontScreen.qml")
            }

            onPressed:  {
                yellowline.visible=true

            }
            onReleased: {
                yellowline.visible=false
            }
        }

    }
    Image{
        id:rearbar
        source: "images/climate_non_nav_bg.png"
        width:parent.width/2
        anchors.left: frontbar.right
        Text{
            text:"Rear"
            font.pixelSize: 25
            color: "white"
            anchors.centerIn: parent

        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                loader.setSource("ClimateRear.qml")
            }

            onPressed:  {
                indicateline.visible=true

            }
            onReleased: {
                indicateline.visible=false
            }
        }
    }
    Image{
        id:lineBoder
        source: "images/statusbar_timetemp_separator.png"
        anchors.left: frontbar.right
        height: frontbar.height
    }

    Image{
        id:redline
        source:"images/function_separator_climate.png"
        anchors.top: frontbar.bottom
    }
    Image{
        id:yellowline
        source: "images/nav_climate_progress_fill.png"
        visible: false
        height:2
        width:frontbar.width
        anchors.top: frontbar.bottom
        anchors.left: frontbar.left
    }
    Image{
        id:indicateline
        source: "images/nav_climate_progress_fill.png"
        visible: false
        height:2
        width:rearbar.width
        anchors.top: rearbar.bottom
        anchors.left: rearbar.left
    }
    Loader{
        id:loader
        source: "ClimateFrontScreen.qml"
        Item {
            property bool hasStatusBar: true

            Text {
                width: Constants.screen_width
                height: Constants.screen_height
                font.pixelSize: 50
                color: "white"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }
    }
}
