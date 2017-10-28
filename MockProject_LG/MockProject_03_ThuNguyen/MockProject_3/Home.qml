import QtQuick 2.6
import "Constants.js" as Constants
Item {
    id: main_app
    visible: true
    property bool hasStatusBar: true

    HomeIndicatorObject{
    }

    //create all apps for home screen
    Flickable {
        id: flickable
        //init property for apps
        property int homeCellWidth: 191
        property int homeCellHeight: 186
        property int screenWidth: Constants.screen_width
        property int appCountPerRow: 4
        property bool isEditting: false
        property int movingAppId: -1
        property var apps: []
        property var xArray: Constants.xArray_Constant
        property var yArray: Constants.yArray_Constant
        property var textArray: Constants.textArray_Constant
        property var normalArray: Constants.normalArray_Constant
        property var focusArray: Constants.focusArray_Constant
        signal appOrderChanged(var changedPageIndex);

        //calculate coordinate for app icon from page index & cell index
        function calculateX(pageIndex, appIndex) {
            var offset = pageIndex * screenWidth;
            var rowIndex = appIndex % flickable.appCountPerRow;
            return offset + (flickable.homeCellWidth * rowIndex) % screenWidth;
        }

        function calculateY(pageIndex, appIndex) {
            var columnIndex = Math.floor(appIndex / flickable.appCountPerRow);
            return columnIndex * flickable.homeCellHeight;
        }
        function getCellIndexOfMovingApp() {
            return apps[movingAppId].cellIndex;
        }
        function getNewCellIndexOfMovingApp() {
            return apps[movingAppId].newCellIndex;
        }

        Component.onCompleted: {
            //create instance
            var contentComponent;
            contentComponent = Qt.createComponent("HomeIcon.qml");
            // load 8 apps
            if(contentComponent.status === Component.Ready) {
                for (var i = 0; i < 8; i++){
                    var contentObject = contentComponent.createObject(flickable.contentItem);
                    // set property for each instance of object.
                    contentObject.aParent = flickable;
                    //set default images which display
                    contentObject.iconImageSource_Normal = normalArray[i];
                    //set images when press or hold
                    contentObject.iconImageSource_Focus = focusArray[i];
                    //set text for each app
                    contentObject.txtButton_Text = textArray[i];
                    contentObject.cellIndex = i;
                    contentObject.pageIndex = 0;
                    contentObject.appId = i;
                    contentObject.width = 180;
                    contentObject.height= 180;
                    contentObject.y = yArray[i];
                    contentObject.x = xArray[i];
                    apps[i] = contentObject;
                    apps[i].startZoomAnimationFromZero();
                }
            }
        }
    }

    Connections {
        target: flickable.apps[flickable.movingAppId]
        onNewCellIndexChanged: {
            flickable.appOrderChanged(flickable.apps[flickable.movingAppId].pageIndex);
        }
    }
}
