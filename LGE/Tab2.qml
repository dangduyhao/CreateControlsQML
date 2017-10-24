import QtQuick 2.6

Rectangle {
    id: screenTab2
    width: 480
    height: 580
    color: "#95a5a6"

    ListView {
        id: listContact
        anchors.fill: parent
        anchors.left: parent.left; anchors.leftMargin: 10
        anchors.right: parent.right; anchors.rightMargin: 20
        anchors.top: parent.top; anchors.topMargin: 10
        anchors.bottom: parent.bottom; anchors.bottomMargin: 10
        snapMode: ListView.SnapOneItem
        highlightRangeMode: ListView.StrictlyEnforceRange
        highlightMoveVelocity: 2000
        clip: true

        model: contact

        delegate: contactDelegate
    }

    Component {
        id: contactDelegate

        Rectangle {
            width: ListView.view.width
            height: 20
            color: bgColor

            Text {
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                anchors.leftMargin: 20
                font.pixelSize: 18
                text: name
                color: "#2c3e50"
            }
        }
    }

    ListModel {
        id: contact

        ListElement { name: "A"; bgColor: "#1abc9c" } // Index = 0
        ListElement { name: "Sparkle Abel"; bgColor: "Transparent" }
        ListElement { name: "Abdul Ahad"; bgColor: "Transparent" }
        ListElement { name: "Alexandar Panayotov Alexandrov"; bgColor: "Transparent" }
        ListElement { name: "Alton Alphin"; bgColor: "Transparent" }
        ListElement { name: "B"; bgColor: "#1abc9c" } // Index = 5
        ListElement { name: "Karoline Beane"; bgColor: "Transparent" }
        ListElement { name: "Meta Begum"; bgColor: "Transparent" }
        ListElement { name: "Roberta Bondar"; bgColor: "Transparent" }
        ListElement { name: "Gertha Braz"; bgColor: "Transparent" }
        ListElement { name: "Dee Brunell"; bgColor: "Transparent" }
        ListElement { name: "C"; bgColor: "#1abc9c" } // Index = 11
        ListElement { name: "Graham Corbell"; bgColor: "Transparent" }
        ListElement { name: "D"; bgColor: "#1abc9c" } // Index = 13
        ListElement { name: "Matt Dansie"; bgColor: "Transparent" }
        ListElement { name: "E"; bgColor: "#1abc9c" } // Index = 15
        ListElement { name: "Erlene Estill"; bgColor: "Transparent" }
        ListElement { name: "F"; bgColor: "#1abc9c" } // Index = 17
        ListElement { name: "Pamula Fazzino"; bgColor: "Transparent" }
        ListElement { name: "G"; bgColor: "#1abc9c" } // Index = 19
        ListElement { name: "Kiesha Gallien"; bgColor: "Transparent" }
        ListElement { name: "Marc Garneau"; bgColor: "Transparent" }
        ListElement { name: "Floria Gilchrist"; bgColor: "Transparent" }
        ListElement { name: "H"; bgColor: "#1abc9c" } // Index = 23
        ListElement { name: "Chris Hadfield"; bgColor: "Transparent" }
        ListElement { name: "Thersa Heinrichs"; bgColor: "Transparent" }
        ListElement { name: "I"; bgColor: "#1abc9c" } // Index = 26
        ListElement { name: "Georgi Ivanov"; bgColor: "Transparent" }
        ListElement { name: "J"; bgColor: "#1abc9c" } // Index = 28
        ListElement { name: "Andera Jinkins"; bgColor: "Transparent" }
        ListElement { name: "K"; bgColor: "#1abc9c" } // Index = 30
        ListElement { name: "Kassandra Knotts"; bgColor: "Transparent" }
        ListElement { name: "L"; bgColor: "#1abc9c" } // Index = 32
        ListElement { name: "Guy Laliberte"; bgColor: "Transparent" }
        ListElement { name: "Carli Lowther"; bgColor: "Transparent" }
        ListElement { name: "M"; bgColor: "#1abc9c" } // Index = 35
        ListElement { name: "Steven MacLean"; bgColor: "Transparent" }
        ListElement { name: "Rolf Marcinek"; bgColor: "Transparent" }
        ListElement { name: "N"; bgColor: "#1abc9c" } // Index = 38
        ListElement { name: "Sonja Nuckols"; bgColor: "Transparent" }
        ListElement { name: "Sudie Null"; bgColor: "Transparent" }
        ListElement { name: "O"; bgColor: "#1abc9c" } // Index = 41
        ListElement { name: "Beatris Orban"; bgColor: "Transparent" }
        ListElement { name: "P"; bgColor: "#1abc9c" } // Index = 43
        ListElement { name: "Vincent Parent"; bgColor: "Transparent" }
        ListElement { name: "Julie Payette"; bgColor: "Transparent" }
        ListElement { name: "Marcos Pontes"; bgColor: "Transparent" }
        ListElement { name: "Q"; bgColor: "#1abc9c" } // Index = 47
        ListElement { name: "R"; bgColor: "#1abc9c" } // Index = 48
        ListElement { name: "Marianela Ritacco"; bgColor: "Transparent" }
        ListElement { name: "Rashida Royal"; bgColor: "Transparent" }
        ListElement { name: "Patricia Ruark"; bgColor: "Transparent" }
        ListElement { name: "S"; bgColor: "#1abc9c" } // Index = 52
        ListElement { name: "T"; bgColor: "#1abc9c" } // Index = 53
        ListElement { name: "Robert Thirsk"; bgColor: "Transparent" }
        ListElement { name: "Rosalba Thurgood"; bgColor: "Transparent" }
        ListElement { name: "Bjarni Tryggvason"; bgColor: "Transparent" }
        ListElement { name: "U"; bgColor: "#1abc9c" } // Index = 57
        ListElement { name: "Bronwyn Uyehara"; bgColor: "Transparent" }
        ListElement { name: "V"; bgColor: "#1abc9c" } // Index = 59
        ListElement { name: "Loreen Vila"; bgColor: "Transparent" }
        ListElement { name: "W"; bgColor: "#1abc9c" } // Index = 61
        ListElement { name: "Dafydd Williams"; bgColor: "Transparent" }
        ListElement { name: "Felica Woolfolk"; bgColor: "Transparent" }
        ListElement { name: "X"; bgColor: "#1abc9c" } // Index = 64
        ListElement { name: "Y"; bgColor: "#1abc9c" } // Index = 65
        ListElement { name: "Alane Yanez"; bgColor: "Transparent" }
        ListElement { name: "Bibi Yamaguchi"; bgColor: "Transparent" }
        ListElement { name: "Z"; bgColor: "#1abc9c" } // Index = 68
    }

    ListView {
        id: listLetter
        anchors.right: parent.right; anchors.rightMargin: 15
        anchors.top: parent.top; anchors.topMargin: 10
        anchors.bottom: parent.bottom; anchors.bottomMargin: 10
        model: sortLetter

        delegate: Rectangle {
            width: 10
            height: (screenTab2.height - 20) / 26
            color: "Transparent"

            Text {
                anchors.centerIn: parent
                font.pixelSize: 18
                text: letter
                color: "#2c3e50"
            }

            Rectangle {
                id: popup
                width: 100
                height: 30
                anchors.right: parent.right; anchors.rightMargin: 15
                anchors.verticalCenter: parent.verticalCenter
                color: "Black"
                opacity: 0

                Text {
                    anchors.left: parent.left; anchors.leftMargin: 10
                    font.pixelSize: 24
                    text: letter
                    color: "White"
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    listContact.currentIndex = indexNumber
                }

                hoverEnabled: true
                onEntered: {
                    popup.opacity = 0.7
                }
                onExited: {
                    popup.opacity = 0
                }
            }
        }
    }

    ListModel {
        id: sortLetter

        ListElement { letter: "A"; indexNumber: 0 } // Index = 0
        ListElement { letter: "B"; indexNumber: 5 } // Index = 5
        ListElement { letter: "C"; indexNumber: 11 } // Index = 11
        ListElement { letter: "D"; indexNumber: 13 } // Index = 13
        ListElement { letter: "E"; indexNumber: 15 } // Index = 15
        ListElement { letter: "F"; indexNumber: 17 } // Index = 17
        ListElement { letter: "G"; indexNumber: 19 } // Index = 19
        ListElement { letter: "H"; indexNumber: 23 } // Index = 23
        ListElement { letter: "I"; indexNumber: 26 } // Index = 26
        ListElement { letter: "J"; indexNumber: 28 } // Index = 28
        ListElement { letter: "K"; indexNumber: 30 } // Index = 30
        ListElement { letter: "L"; indexNumber: 32 } // Index = 32
        ListElement { letter: "M"; indexNumber: 35 } // Index = 35
        ListElement { letter: "N"; indexNumber: 38 } // Index = 38
        ListElement { letter: "O"; indexNumber: 41 } // Index = 41
        ListElement { letter: "P"; indexNumber: 43 } // Index = 43
        ListElement { letter: "Q"; indexNumber: 47 } // Index = 47
        ListElement { letter: "R"; indexNumber: 48 } // Index = 48
        ListElement { letter: "S"; indexNumber: 52 } // Index = 52
        ListElement { letter: "T"; indexNumber: 53 } // Index = 53
        ListElement { letter: "U"; indexNumber: 57 } // Index = 57
        ListElement { letter: "V"; indexNumber: 59 } // Index = 59
        ListElement { letter: "W"; indexNumber: 61 } // Index = 61
        ListElement { letter: "X"; indexNumber: 64 } // Index = 64
        ListElement { letter: "Y"; indexNumber: 65 } // Index = 65
        ListElement { letter: "Z"; indexNumber: 68 } // Index = 68
    }
}
