import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    visible: true
    width: 480
    height: 640
    maximumWidth: width
    maximumHeight: height
    minimumWidth: width
    minimumHeight: height

    title: qsTr("Advanced exercises")

    // Create main loader for LongText.qml
    Loader {
        id: mainLoader
        x: 0; y: 0
        source: "LongText.qml"
    }
}
