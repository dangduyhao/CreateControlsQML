import QtQuick 2.6
import QtQuick.Controls 2.2
import QtQuick.Window 2.0
import "Constants.js" as Constants


    Item {
        id : favorites
        visible: true
        signal screenChange(string event)
        Item{
            id : topmain


       ListModel{
           id:home
           ListElement{name:"Favorites"}
           ListElement{name:"Keypad"}
           ListElement{name:"Recents"}
           ListElement{name:"Contacts"}
           ListElement{name:"Phones"}
       }
       Row{
           id:rowhome
           Repeater{
               id : rc12
               model: home
               Rectangle{
                   id:recthome
                   color: "black"
                   width: Constants.screen_width/5
                   height: Constants.status_bar_height
                   Text {
                       id: texthome
                       width: parent.width
                       height: parent.height
                       text: model.name
                       x:38
                       y: 15
                       font.pointSize: 17
                       color: "white"
                   }
                   MouseArea{
                       anchors.fill: parent
                       onClicked:
                       { if( index == 0)
                           {
                             app.screenChange("Favorites.qml")
                               lightwork.x = 0}
                           if(index == 1)
                           {   app.screenChange("KeyPad.qml")
                               lightwork.x = Constants.screen_width/5}
                           if(index == 2)
                               app.screenChange("Recents.qml")
                               lightwork.x = Constants.screen_width*2/5
                           if(index == 3)
                               app.screenChange("Contacts.qml")
                               lightwork.x = Constants.screen_width*3/5
                           if(index == 4)
                               app.screenChange("Phone.qml")
                               lightwork.x = Constants.screen_width*4/5
                       }
                   }
               }
           }

       }

       Row {
           id:rowhome2
           spacing: 158
           x : 158
           Repeater{
               model: 4
               Image {
                   id: image1
                   y: 20
                   source: "images/statusbar_timetemp_separator.png"
               }
           }
       }

       Image {
           id: image2
           source: "images/function_separator_phone.png"
           y : Constants.status_bar_height
           x:4
       }
       Rectangle{
           id:lightwork
           width: 160
           height: 2
           color: "blue"
           anchors.top: image2.top


       }
        }

        Item {
            id: favorite_main

                Text {
                    id: name
                    text: "Favorite"
                    color: "white"
                    font.pointSize: 25
                    x : 350
                    y : 250
                }
            }

    }
