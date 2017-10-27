import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    visible: true
    width: 610; height: 381
    title: qsTr("Test")

    Image {
        source: "images/bg.jpg"

        Image {
            id: rocket
            x: 205 - width/2; y: 190.5 - height/2
            source: "images/rocket.png"

            MouseArea {
                id: area
                anchors.fill: parent
                onClicked: {
                    rot.start()
                    tran.start()
                }
            }

            NumberAnimation {
                id: rot
                target: rocket
                property: "rotation"
                from: 0; to: 360
                duration: tran.duration*4
                loops: Animation.Infinite
            }

            SequentialAnimation {
                id: tran
                property int duration: 1000
                loops: Animation.Infinite

                ParallelAnimation {
                    NumberAnimation {
                        target: rocket
                        property: "x"
                        to: 305 - rocket.width/2
                        duration: tran.duration
                    }

                    NumberAnimation {
                        target: rocket
                        property: "y"
                        to: 90.5 - rocket.height/2
                        duration: tran.duration
                    }
                }

                ParallelAnimation {
                    NumberAnimation {
                        target: rocket
                        property: "x"
                        to: 405 - rocket.width/2
                        duration: tran.duration
                    }

                    NumberAnimation {
                        target: rocket
                        property: "y"
                        to: 190.5 - rocket.height/2
                        duration: tran.duration
                    }
                }

                ParallelAnimation {
                    NumberAnimation {
                        target: rocket
                        property: "x"
                        to: 305 - rocket.width/2
                        duration: tran.duration
                    }

                    NumberAnimation {
                        target: rocket
                        property: "y"
                        to: 290.5 - rocket.height/2
                        duration: tran.duration
                    }
                }

                ParallelAnimation {
                    NumberAnimation {
                        target: rocket
                        property: "x"
                        to: 205 - rocket.width/2
                        duration: tran.duration
                    }

                    NumberAnimation {
                        target: rocket
                        property: "y"
                        to: 190.5 - rocket.height/2
                        duration: tran.duration
                    }
                }
            }
        }
    }
}
