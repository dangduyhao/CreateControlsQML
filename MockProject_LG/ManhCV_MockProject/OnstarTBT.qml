import QtQuick 2.6
import "Constants.js" as Constants
Item {
    property bool hasStatusBar: false
    Loader{
        id:loader1
        source:"OnstarScreen.qml"
    }

}
