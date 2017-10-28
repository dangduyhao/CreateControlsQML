import QtQuick 2.0
import "Constants.js" as Constants
//phone active call
Item {
//    id: root
//    Component.onCompleted: {
//        app.screenChange("PhoneActive.qml")
//    }

   //loading
     Rectangle{
         x:100
         y:100
         width: 100
         height: 100
         color : click?"steelblue":"#2c3e50"
         radius:50
         MouseArea{
             id: click
             anchors.fill: parent
             onClicked: app.screenChange("PhoneActive.qml")
         }
     }

}
