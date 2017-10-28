import QtQuick 2.6
import "Constants.js" as Constants
Item {
    id: root
    width: Constants.screen_width // 800
    height: Constants.screen_height // 480

    Loader {
        id: loaderView
        source: "System.qml"
        anchors.verticalCenter: root.verticalCenter
    }

    Grid {
        id: rowSelect
        columns: 3
        spacing: -1
        SelectSetting {text: "Setting system"; onSelectApp: loaderView.source = "System.qml"}
        SelectSetting {text: "Apps"; onSelectApp: loaderView.source = "Apps.qml"}
        SelectSetting {text: "Vehicle"; onSelectApp: app.screenChange("Vehicle.qml")}
    }
}
