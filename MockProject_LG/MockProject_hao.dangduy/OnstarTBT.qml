import QtQuick 2.6
import "Constants.js" as Constants

Item {
    width: Constants.screen_width
    height: Constants.screen_height

    property bool hasStatusBar: false

    Item {
        id: topBar
        x: 0; y: 0; z: 2
        width: imgTopBar.width
        height: imgTopBar.height

        Image {
            id: imgTopBar
            source: "images/climate_non_nav_bg.png"
        }

        Image {
            anchors.bottom: imgTopBar.bottom
            source: "images/function_separator_tbt.png"
        }

        Text {
            anchors.left: btBack.right; anchors.leftMargin: 25
            anchors.verticalCenter: btBack.verticalCenter
            font.pixelSize: 30
            color: "White"
            text: "Route Preview"
        }

        Image {
            id: btBack
            anchors.top: imgTopBar.top
            anchors.left: imgTopBar.left
            source: "images/back_normal.png"

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    app.screenChange("Home.qml")
                }
            }
        }

        Image {
            anchors.verticalCenter: btBack.verticalCenter
            anchors.left: btBack.right
            source: "images/statusbar_timetemp_separator.png"
        }

        Image {
            id: btClose
            anchors.right: imgTopBar.right
            anchors.top: imgTopBar.top
            source: "images/close_normal.png"

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    app.screenChange("Home.qml")
                }
            }
        }

        Image {
            anchors.verticalCenter: btClose.verticalCenter
            anchors.right: btClose.left
            source: "images/statusbar_timetemp_separator.png"
        }
    }

    ScrollBar {
        id: scrollBar
        width: 10
        height: 200
        scrollArea: listRoute
        anchors.left: parent.left; anchors.leftMargin: 40
        anchors.top: parent.top; anchors.topMargin: topBar.height + 40
    }

    Image {
        id: scrollUp
        anchors.horizontalCenter: scrollBar.horizontalCenter
        anchors.top: scrollBar.bottom; anchors.topMargin: 5
        source: "images/scroll_up_normal.png"

        MouseArea {
            anchors.fill: parent
            onClicked: {
                listRoute.currentIndex = listRoute.currentIndex - 1
            }
        }
    }

    Image {
        id: scrollDown
        anchors.horizontalCenter: scrollBar.horizontalCenter
        anchors.top: scrollUp.bottom; anchors.topMargin: 5
        source: "images/scroll_down_normal.png"

        MouseArea {
            anchors.fill: parent
            onClicked: {
                listRoute.currentIndex = listRoute.currentIndex + 1
            }
        }
    }

    ListModel {
        id: modelRoute
        ListElement { imgUrl: "images/icn_0_md.png"; name: "%1$s"; address: "Souther Aver"; detail: "Includes: %1$s" }
        ListElement { imgUrl: "images/icn_1_md.png"; name: "%1$s"; address: "Souther Aver"; detail: "Includes: %1$s" }
        ListElement { imgUrl: "images/icn_2_md.png"; name: "%1$s"; address: "Souther Aver"; detail: "Includes: %1$s" }
        ListElement { imgUrl: "images/icn_3_md.png"; name: "%1$s"; address: "Souther Aver"; detail: "Includes: %1$s" }
        ListElement { imgUrl: "images/icn_4_md.png"; name: "%1$s"; address: "Souther Aver"; detail: "Includes: %1$s" }
        ListElement { imgUrl: "images/icn_5_md.png"; name: "%1$s"; address: "Souther Aver"; detail: "Includes: %1$s" }
        ListElement { imgUrl: "images/icn_6_md.png"; name: "%1$s"; address: "Souther Aver"; detail: "Includes: %1$s" }
        ListElement { imgUrl: "images/icn_7_md.png"; name: "%1$s"; address: "Souther Aver"; detail: "Includes: %1$s" }
        ListElement { imgUrl: "images/icn_8_md.png"; name: "%1$s"; address: "Souther Aver"; detail: "Includes: %1$s" }
    }

    ListView {
        id: listRoute
        width: Constants.screen_width - 100
        height: Constants.screen_height - topBar.height
        anchors.top: topBar.bottom; anchors.topMargin: 5
        anchors.right: topBar.right; anchors.rightMargin: 0
        spacing: 100
        clip: true
        currentIndex: 0

        snapMode: ListView.SnapToItem
        highlightRangeMode: ListView.ApplyRange

        model: modelRoute

        delegate: Item {

            Image {
                id: imgRoute
                anchors.left: parent.left
                anchors.top: parent.top
                source: imgUrl
            }

            Item {
                anchors.left: imgRoute.right; anchors.leftMargin: 0
                width: imgRoute.width
                height: imgRoute.height

                Text {
                    anchors.centerIn: parent
                    font.pixelSize: 20
                    color: "White"
                    text: name
                }
            }

            Item {
                anchors.left: imgRoute.right; anchors.leftMargin: imgRoute.width
                anchors.top: imgRoute.top
                width: parent.width - 2 * imgRoute.width
                height: imgRoute.height / 2

                Text {
                    anchors.left: parent.left
                    horizontalAlignment: Text.AlignHCenter
                    font.pixelSize: 20
                    color: "White"
                    text: address
                }
            }

            Item {
                anchors.left: imgRoute.right; anchors.leftMargin: imgRoute.width
                anchors.bottom: imgRoute.bottom
                width: parent.width - 2 * imgRoute.width
                height: imgRoute.height / 2

                Text {
                    anchors.left: parent.left
                    horizontalAlignment: Text.AlignHCenter
                    font.pixelSize: 20
                    color: "White"
                    text: detail
                }
            }

            Image {
                source: "images/sidebar_divider.png"
                anchors.right: parent.right
                anchors.bottom: parent.bottom; anchors.bottomMargin: 5
                width: parent.width
            }
        }
    }
}

