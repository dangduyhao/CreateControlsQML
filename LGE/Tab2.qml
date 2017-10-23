import QtQuick 2.6

Rectangle {
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
        snapMode: ListView.SnapToItem
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

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log(index)
                }
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
        anchors.right: parent.right; anchors.rightMargin: 0
        anchors.top: parent.top; anchors.topMargin: 10
        anchors.bottom: parent.bottom; anchors.bottomMargin: 10
        model: sortLetter

        delegate: Rectangle {
            width: 10
            height: (parent.width - 20) / 26
            color: "Transparent"

            Text {
                anchors.centerIn: parent
                font.pixelSize: 18
                text: letter
                color: "#2c3e50"
            }
        }
    }

    ListModel {
        id: sortLetter

        ListElement { letter: "A" } // Index = 0
        ListElement { letter: "B" } // Index = 5
        ListElement { letter: "C" } // Index = 11
        ListElement { letter: "D" } // Index = 13
        ListElement { letter: "E" } // Index = 15
        ListElement { letter: "F" } // Index = 17
        ListElement { letter: "G" } // Index = 19
        ListElement { letter: "H" } // Index = 23
        ListElement { letter: "I" } // Index = 26
        ListElement { letter: "J" } // Index = 28
        ListElement { letter: "K" } // Index = 30
        ListElement { letter: "L" } // Index = 32
        ListElement { letter: "M" } // Index = 35
        ListElement { letter: "N" } // Index = 38
        ListElement { letter: "O" } // Index = 41
        ListElement { letter: "P" } // Index = 43
        ListElement { letter: "Q" } // Index = 47
        ListElement { letter: "R" } // Index = 48
        ListElement { letter: "S" } // Index = 52
        ListElement { letter: "T" } // Index = 53
        ListElement { letter: "U" } // Index = 57
        ListElement { letter: "V" } // Index = 59
        ListElement { letter: "W" } // Index = 61
        ListElement { letter: "X" } // Index = 64
        ListElement { letter: "Y" } // Index = 65
        ListElement { letter: "Z" } // Index = 68
    }
}
