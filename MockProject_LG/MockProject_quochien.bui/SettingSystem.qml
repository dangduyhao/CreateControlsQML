import QtQuick 2.6
import "Constants.js" as Constants
Item {
    property bool hasStatusBar: true

    Text {
        width: Constants.screen_width
        height: Constants.screen_height
        font.pixelSize: 50
        text: "Setting System"
        color: "white"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }
}
