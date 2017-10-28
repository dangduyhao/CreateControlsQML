import QtQuick 2.6
import "Constants.js" as Constants
Item {
    Text{
        id:temparature
        property int nhietdo: 30
        text:nhietdo
        color:"white"
        font.pixelSize: 50
        x:60;y:90
    }
    Text{
        text:"o"
        color:"white"
        font.pixelSize: 30
        x:120;y:90
    }
    Image{
        id:tempUp
        source:"images/temp_up_normal.png"
        x:40
        anchors.top: temparature.bottom
        MouseArea{
            id:tempupArea
            anchors.fill: tempUp
            onClicked: {
                temparature.nhietdo=temparature.nhietdo+1
                temparature2.nhietdo=temparature2.nhietdo+1
            }
        }
    }
    Image{
        id:tempdown
        source: "images/temp_down_normal.png"
        x:40
        anchors.top: tempUp.bottom
        MouseArea{
            anchors.fill: parent
            onClicked: {
                temparature.nhietdo=temparature.nhietdo-1
                temparature2.nhietdo=temparature2.nhietdo-1
            }
        }
    }
    Text{
        id:temparature2
        property int nhietdo: 30
        text:nhietdo
        color:"white"
        font.pixelSize: 50
        x:670;y:90

    }
    Text{
        text:"o"
        color:"white"
        font.pixelSize: 30
        x:730;y:90
    }
    Image{
        id:tempUp2
        source:"images/temp_up_normal.png"
        x:670
        anchors.top: temparature.bottom
        MouseArea{
            anchors.fill: tempUp2
            onClicked: {
                temparature2.nhietdo=temparature2.nhietdo+1
                temparature.nhietdo=temparature.nhietdo+1
            }
        }
    }
    Image{
        id:tempdown2
        source: "images/temp_down_normal.png"
        x:670
        anchors.top: tempUp2.bottom
        MouseArea{
            anchors.fill: parent
            onClicked: {
                temparature2.nhietdo=temparature2.nhietdo-1
                temparature.nhietdo=temparature.nhietdo-1
            }
        }
    }
    Image{
        id:fanDown
        source: "images/fan_indicator_down_inactive.png"
        width:60;height: 60
        x:200;y:120
        MouseArea{
            anchors.fill: parent
            onPressed:  {
                fanDown.source="images/fan_indicator_down_active.png"
            }
            onReleased: {
                fanDown.source="images/fan_indicator_down_inactive.png"
                if(fill.width>0){
                    fill.width=fill.width-50
                }
                else
                    fill.width=0
            }

        }
    }
    Image{
        id:fanUp
        source: "images/fan_indicator_up_inactive.png"
        width:60;height: 60
        x:550;y:120
        MouseArea{
            anchors.fill: parent
            onPressed: {
                fanUp.source="images/fan_indicator_up_active.png"
            }
            onPressAndHold: {
                fanUp.source="images/fan_indicator_up_active.png"
            }
            onReleased: {
                fanUp.source="images/fan_indicator_up_inactive.png"
                if(fill.width<track.width){
                    fill.width=fill.width+50
                }
                else
                    fill.width=track.width

            }
        }
    }
    Item{
        id:indicateFan
        Image{
            id:track
            source:"images/climate_progress_track.png"
            width:200
            x:300;y:150
        }
        Image{
            id:fill
            source: "images/climate_progress_fill.png"
            y:150
            width:0
            anchors.left: track.left
        }
    }
    Item{
        id:airfaceright
        Image{
            id:airfacerightinactive
            source:"images/climate_airface_inactive_large.png"
            x:300;y:220
            MouseArea{
                anchors.fill: parent
                onPressed: {
                    airfacerightinactive.source="images/climate_airface_inactive_press_large.png"
                }
                onReleased: {
                    airfacerightinactive.visible=false
                    airfacerightactive.visible=true
                    airfacerightactive.source="images/climate_airface_activated_large.png"

                }
            }
        }
        Image{
            id:airfacerightactive
            visible: false
            source:"images/climate_airface_activated_large.png"
            x:300;y:220
            MouseArea{
                anchors.fill: parent
                onPressed: {
                    airfacerightactive.source="images/climate_airface_active_press_large.png"
                }
                onReleased: {
                    airfacerightactive.visible=false
                    airfacerightinactive.visible=true
                    airfacerightinactive.source="images/climate_airface_inactive_large.png"

                }
            }
        }
    }
    Item{
        id:tuachanright
        Image{
            id:tuachanrightinactive
            source:"images/climate_airfoot_inactive_large.png"
            x:400;y:220
            MouseArea{
                anchors.fill: parent
                onPressed: {
                    tuachanrightinactive.source="images/climate_airfoot_inactive_press_large.png"
                }
                onReleased: {
                    tuachanrightinactive.visible=false
                    tuachanrightactive.visible=true
                    tuachanrightactive.source="images/climate_airfoot_activated_large.png"

                }
            }
        }
        Image{
            id:tuachanrightactive
            visible: false
            source:"images/climate_airfoot_activated_large.png"
            x:400;y:220
            MouseArea{
                anchors.fill: parent
                onPressed: {
                    tuachanrightactive.source="images/climate_airfoot_active_press_large.png"
                }
                onReleased: {
                    tuachanrightactive.visible=false
                    tuachanrightinactive.visible=true
                    tuachanrightinactive.source="images/climate_airfoot_inactive_large.png"

                }
            }
        }
    }
    Item{
        Text{
            text:"On/Off"
            font.pixelSize: 35
            color:"white"
            anchors.centerIn: onOffbtn_inactive
        }
        Image{
            id:onOffbtn_inactive
            source:"images/climate_button_inactive.png"
            x:120;y:320
            MouseArea{
                anchors.fill: parent
                onPressed: {
                    onOffbtn_inactive.source="images/climate_button_inactive_press.png"
                }
                onReleased: {
                    onOffbtn_inactive.visible=false
                    onOffbtn_active.visible=true
                    onOffbtn_active.source="images/climate_button_active.png"
                }
            }
        }
        Image{
            id:onOffbtn_active
            source: "images/climate_button_active.png"
            x:120;y:320
            visible: false
            MouseArea{
                anchors.fill: parent
                onPressed: {
                    onOffbtn_active.source="images/climate_button_active_press.png"
                }
                onReleased: {
                    onOffbtn_active.visible=false
                    onOffbtn_inactive.visible=true
                    onOffbtn_inactive.source="images/climate_button_inactive.png"
                }
            }
        }
    }
    Item{
        Text{
            text:"Auto"
            font.pixelSize: 35
            color:"white"
            anchors.centerIn: autobtn_inactive
        }
        Image{
            id:autobtn_inactive
            source:"images/climate_button_inactive.png"
            x:270;y:320
            MouseArea{
                anchors.fill: parent
                onPressed: {
                    autobtn_inactive.source="images/climate_button_inactive_press.png"
                }
                onReleased: {
                    autobtn_inactive.visible=false
                    autobtn_active.visible=true
                    autobtn_active.source="images/climate_button_active.png"
                }
            }
        }
        Image{
            id:autobtn_active
            source: "images/climate_button_active.png"
            x:270;y:320
            visible: false
            MouseArea{
                anchors.fill: parent
                onPressed: {
                    autobtn_active.source="images/climate_button_active_press.png"
                }
                onReleased: {
                    autobtn_active.visible=false
                    autobtn_inactive.visible=true
                    autobtn_inactive.source="images/climate_button_inactive.png"
                }
            }
        }
    }
    Item{
        Image{
            source: "images/lock.png"
            anchors.centerIn: lockbtn_inactive
        }
        Image{
            id:lockbtn_inactive
            source:"images/climate_button_inactive.png"
            x:420;y:320
            MouseArea{
                anchors.fill: parent
                onPressed: {
                    lockbtn_inactive.source="images/climate_button_inactive_press.png"
                }
                onReleased: {
                    lockbtn_inactive.visible=false
                    lockbtn_active.visible=true
                    lockbtn_active.source="images/climate_button_active.png"
                }
            }
        }
        Image{
            id:lockbtn_active
            source: "images/climate_button_active.png"
            x:420;y:320
            visible: false
            MouseArea{
                anchors.fill: parent
                onPressed: {
                    lockbtn_active.source="images/climate_button_active_press.png"
                }
                onReleased: {
                    lockbtn_active.visible=false
                    lockbtn_inactive.visible=true
                    lockbtn_inactive.source="images/climate_button_inactive.png"
                }
            }
        }
    }
    Item{
        Text{
            text:"Sync"
            font.pixelSize: 35
            color:"white"
            anchors.centerIn: syncbtn_inactive
        }
        Image{
            id:syncbtn_inactive
            source:"images/climate_button_inactive.png"
            x:570;y:320
            MouseArea{
                anchors.fill: parent
                onPressed: {
                    syncbtn_inactive.source="images/climate_button_inactive_press.png"
                }
                onReleased: {
                    syncbtn_inactive.visible=false
                    syncbtn_active.visible=true
                    syncbtn_active.source="images/climate_button_active.png"
                }
            }
        }
        Image{
            id:syncbtn_active
            source:"images/climate_button_active.png"
            x:570;y:320
            visible:false
            MouseArea{
                anchors.fill: parent
                onPressed: {
                    syncbtn_active.source="images/climate_button_active_press.png"
                }
                onReleased: {
                    syncbtn_active.visible=false
                    syncbtn_inactive.visible=true
                    syncbtn_inactive.source="images/climate_button_inactive.png"
                }
            }
        }
    }

}
