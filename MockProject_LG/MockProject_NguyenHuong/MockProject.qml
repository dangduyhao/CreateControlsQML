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
        source: "Home.qml"
    }

    StatusBar {

    }
    onScreenChange: {
        screen.source = event
    }
}
