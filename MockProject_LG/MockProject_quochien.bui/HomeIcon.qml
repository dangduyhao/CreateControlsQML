import QtQuick 2.3
import QtPositioning 5.3
//implement template app
Item {
    id: appIcon
    width: homeCellWidth
    height: homeCellHeight
    z: 1
    scale: 0.8

    property string iconImageSource_Normal: ""
    property string iconImageSource_Focus: ""
    property string txtButton_Text: ""
    property bool isTextVisible: true
    property bool isXChange: false
    property int homeCellWidth: 191
    property int homeCellHeight: 186
    property int screenWidth: 800
    property int screenHeight: 480
    property int homeStandardPaddingLeft: 6
    property int homeStandardPaddingTop: 16
    property int changePageZoneWidth: 30
    property int appCountPerRow: 4
    property int rowCount: 2
    property int animationDuration: 300
    property int countIndex: 0
    property int appId: -1
    property int firstIndex: -1
    property var aParent: null
    property string textColor: "#FFFFFF"
    property int cellIndex: -1
    property int newCellIndex: -1
    property int pageIndex: -1
    property bool isInStatusBarArea: false
    property real startX: 0
    property real startY: 0
    property bool isMoved: false
    property int withImg: 180
    property int heightImg: 180


    function startZoomAnimationFromZero() {
        scaleAnimation.to = 1;
        scaleAnimation.start();
    }
    onIconImageSource_NormalChanged:
        iconImage.source = iconImageSource_Normal;
    Image {
        id: iconImage
        source: iconImageSource_Normal
        x: 0
        y: 0
        width: withImg
        height: heightImg
        asynchronous: true
        MouseArea {
            id: buttonMouseArea
            anchors.fill: parent
            function stopEditting() {
                if (changePageDelayTimer.running) {
                    changePageDelayTimer.running = false;
                }

                //Re-change parent to flickable view
                appIcon.parent = aParent.contentItem;

                //Re-set coordinate of this icon to the Axis of new parent (flickable view)
                appIcon.x = appIcon.x + pageIndex * screenWidth - homeStandardPaddingLeft;
                appIcon.y = appIcon.y - homeStandardPaddingTop;

                //Enable the interaction of flickable view
                aParent.interactive = true;

                //Set Z of app icon to 1
                appIcon.z = 1;

                if (isMoved) {
                    //Really set cell index to new value
                    appIcon.cellIndex = appIcon.newCellIndex;
                    moveToNewIndexAnimation.stop();
                    moveToNewIndexAnimation.start();
                    isMoved = false;
                }
                aParent.movingAppId = -1;
                //Change mode from Editting to Normal
                aParent.isEditting = false;
            }
            //is app icon contain mouse
            function isContainsMouse() {
                var x1 = iconImage.width/2;
                var y1 = iconImage.height /2;
                var x2 = buttonMouseArea.mouseX
                var y2 = buttonMouseArea.mouseY
                var distanceFromCenter = Math.pow(x1 - x2, 2) + Math.pow(y1 - y2, 2);
                var radiusSquared = Math.pow(Math.min(iconImage.width, iconImage.height) / 4, 2);
                var isWithinOurRadius = distanceFromCenter < radiusSquared;
                return isWithinOurRadius;
            }

            function positionChanged(direction) {
                var currentIsIn = isInStatusBarArea;
                if (aParent.isEditting) {
                    isMoved = true;
                    appIcon.z = 9999999;
                    if (direction === "x") {
                        //Move the app icon following the mouse
                        appIcon.x = appIcon.x + (mouseX - appIcon.startX);
                    } else if (direction === "y") {
                        //Move the app icon following the mouse
                        appIcon.y = appIcon.y + (mouseY - appIcon.startY);
                    }
                    if (appIcon.x + mouseX > screenWidth - changePageZoneWidth) {
                        var isOk = true;
                        if (!changePageDelayTimer.running && aParent.currentPageIndex < aParent.maxPageCount - 1 && isOk) {
                            changePageDelayTimer.changeDirection = 1;
                            changePageDelayTimer.running = true;
                        }
                    } else if (appIcon.x + mouseX < changePageZoneWidth) {
                        if (!changePageDelayTimer.running && aParent.currentPageIndex > 1) {
                            changePageDelayTimer.changeDirection = 0;
                            changePageDelayTimer.running = true;
                        }
                    } else if (changePageDelayTimer.running) {
                        changePageDelayTimer.running = false;
                    } else if (isInStatusBarArea) {
                        var currentIndex = Math.round(((appIcon.x +  35)/70)) - 1;
                        if (currentIndex != firstIndex) {
                            firstIndex = currentIndex;
                        }
                    }
                    var horizontal = appIcon.x >= 0 ? appIcon.x : 0;
                    var vertical = appIcon.y >= 0 ? appIcon.y : 0;
                    var virtualCellIndex = Math.round(horizontal / homeCellWidth);
                    var aIndex;
                    if (virtualCellIndex >= appCountPerRow) {
                        aIndex = 8 - 1;
                    } else {
                        var virtualRowIndex = Math.round(vertical / homeCellHeight);
                        aIndex = virtualRowIndex * appCountPerRow + virtualCellIndex;
                        if (aIndex >= 8)
                            aIndex = 8 - 1;
                    }
                    appIcon.newCellIndex = aIndex;
                }
            }
            //display app screen after click
            onClicked: {
                switch (appIcon.appId) {
                case 0:
                    app.screenChange("AudioNowPlaying.qml");
                    break;
                case 1:
                    app.screenChange("PhoneKeypad.qml");
                    break;
                case 2:
                    app.screenChange("ClimateFront.qml");
                    break;
                case 3:
                    app.screenChange("SettingSystem.qml")
                    break;
                case 6:
                    app.screenChange("OnstarTBT.qml");
                    break;
                default:
                    break;
                }
            }
            onPressed: {
                if(isContainsMouse()) {
                    //changing displayed icon when you press
                    iconImage.source = iconImageSource_Focus;
                }
            }
            onPressAndHold: {
                if(isContainsMouse()) {
                    //disable mouse event of Flickable
                    aParent.interactive = false;
                    //Set Z of this item higher than Z of Status Bar
                    appIcon.z = 99999;
                    //Re-calculate the coordinate of this item after changing parent
                    appIcon.x = homeStandardPaddingLeft + appIcon.x - pageIndex * screenWidth;
                    appIcon.y = homeStandardPaddingTop + appIcon.y;

                    //Change to mode Editting
                    aParent.isEditting = true;
                    //Save the info of editting item
                    aParent.movingAppId = appId;
                    startX = mouseX;
                    startY = mouseY;
                }
            }
            //after press and hold, then release app icon
            onReleased: {
                isXChange = false;
                isTextVisible = true;
                iconImage.source = iconImageSource_Normal;
                if (aParent.isEditting) {
                    stopEditting();
                }
                countIndex = 0;
                if (isInStatusBarArea) {
                    isInStatusBarArea = false;
                }
            }
            onCanceled: {
                isXChange = false;
                isTextVisible = true;
                iconImage.source = iconImageSource_Normal;
                if (aParent.isEditting) {
                    stopEditting();
                }
                countIndex = 0;
            }
            onMouseXChanged: {
                isXChange = true;
                positionChanged("x");
            }
            onMouseYChanged: {
                positionChanged("y");
            }
        }

        Text {
            id: txtButton
            text: txtButton_Text
            x: 0
            y: 148
            width: 180
            height: 32
            visible: isTextVisible
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 23
            color: textColor
            opacity: 100
        }

        Connections {
            target: flickable
            onIsEdittingChanged: {
                if (aParent.isEditting) {
                    //Make zoom in animation
                    scaleAnimation.stop();
                    scaleAnimation.to = 0.8;
                    scaleAnimation.start();
                } else {
                    //Make zoom out animation
                    scaleAnimation.stop();
                    scaleAnimation.to = 1;
                    scaleAnimation.start();
                    //update new cell index when moving end
                    if (appIcon.newCellIndex >= 0){
                        appIcon.cellIndex = appIcon.newCellIndex;
                    }
                }
            }

            onAppOrderChanged: {
                if (aParent.movingAppId !== appId ) {
                    if (appIcon.cellIndex >= aParent.getNewCellIndexOfMovingApp() && appIcon.cellIndex < aParent.getCellIndexOfMovingApp()) {
                        appIcon.newCellIndex = appIcon.cellIndex + 1;
                    } else if (appIcon.cellIndex <= aParent.getNewCellIndexOfMovingApp() && appIcon.cellIndex > aParent.getCellIndexOfMovingApp()) {
                        appIcon.newCellIndex = appIcon.cellIndex - 1;
                    } else {
                        appIcon.newCellIndex = appIcon.cellIndex;
                    }
                    moveToNewIndexAnimation.stop();
                    moveToNewIndexAnimation.start();
                }
            }
        }

        //Make animation for scale property
        //Currently, use this for make effect when change mode from Normal to Editting and via versa
        //And this item is also used for zoom animation when opening Home page
        PropertyAnimation {
            id: scaleAnimation
            target: appIcon
            properties: "scale"
            duration: 150
            easing.type: Easing.OutQuad
        }

        //Animation to move to new index
        ParallelAnimation {
            id: moveToNewIndexAnimation
            SmoothedAnimation {
                target: appIcon
                properties: "x"
                duration: appIcon.animationDuration
                easing.type: Easing.OutQuad
                to: aParent.calculateX(pageIndex, appIcon.newCellIndex)
            }
            SmoothedAnimation {
                target: appIcon
                properties: "y"
                duration: appIcon.animationDuration
                easing.type: Easing.OutQuad
                to: aParent.calculateY(pageIndex, appIcon.newCellIndex)
            }
        }

        Timer {
            id: changePageDelayTimer
            interval: 600
            running: false
            repeat: false
            triggeredOnStart: false
            property int changeDirection: 0 // 0 = Move to previous page; 1 = move to next page

            onTriggered: {
                var oldPageIndex = appIcon.pageIndex;
                var oldCellIndex = appIcon.cellIndex;
                var availablePageIndex = -1;
                var i;

                if (changeDirection == 1) {
                    if (8 === appCountPerRow * rowCount) {
                        for (i = pageIndex + 2; i < aParent.maxPageCount; i++) {
                            if (8 < appCountPerRow * rowCount) {
                                availablePageIndex = i;
                                break;
                            }
                        }
                        if (availablePageIndex < 0) {
                            for (i = 1; i < pageIndex; i++) {
                                if (8 < appCountPerRow * rowCount) {
                                    availablePageIndex = i;
                                    break;
                                }
                            }
                        }
                        if (availablePageIndex > 0) {
                            if (availablePageIndex >= aParent.pageCount)
                                aParent.pageCount++;
                            aParent.moveAnAppToPage(aParent.getLastAppOfPage(pageIndex + 1), availablePageIndex);
                        }
                    }

                    pageIndex++;
                    aParent.currentPageIndex++;
                    appIcon.cellIndex = 8 - 1;
                    appIcon.newCellIndex = appIcon.cellIndex;
                    aParent.movingToNextPage();
                } else {
                    if (8 === appCountPerRow * rowCount) {
                        availablePageIndex = -1;
                        for (i = pageIndex - 2; i >= 1; i --) {
                            if (8 < appCountPerRow * rowCount) {
                                availablePageIndex = i;
                                break;
                            }
                        }
                        if (availablePageIndex < 0) {
                            for (i = pageIndex; i < aParent.maxPageCount; i ++) {
                                if (8 < appCountPerRow * rowCount) {
                                    availablePageIndex = i;
                                    break;
                                }
                            }
                        }
                        if (availablePageIndex > 0) {
                            if (availablePageIndex >= aParent.pageCount)
                                aParent.pageCount++;
                            aParent.moveAnAppToPage(aParent.getLastAppOfPage(pageIndex - 1), availablePageIndex);
                        }
                    }
                    pageIndex--;
                    aParent.currentPageIndex--;
                    appIcon.cellIndex = 8 - 1;
                    appIcon.newCellIndex = appIcon.cellIndex;
                    aParent.movingToPreviousPage();
                }
                aParent.reorganizeAppAfterRemovingAnApp(oldCellIndex, oldPageIndex);
            }
        }
    }
}
