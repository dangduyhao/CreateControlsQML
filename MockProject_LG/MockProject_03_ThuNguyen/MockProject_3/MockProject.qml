import QtQuick 2.6
import QtQuick.Window 2.2
import "Constants.js" as Constants

Window {
    id: app
    visible: true
    width: Constants.screen_width
    height: Constants.screen_height
    signal screenChange(string event)

    Image {
        objectName: "back_ground"
        source: Constants.bg_main
    }
    Loader {
        id: screen
        width: Constants.screen_width
        height: Constants.screen_height
        source: "SettingSystem.qml"
    }

    StatusBar {
        id: statusBar
    }
    onScreenChange: {
        screen.source = event
        if (screen.children[0].hasStatusBar)
            statusBar.y = Constants.status_bar_y
        else
             statusBar.y = Constants.screen_height
    }
}
