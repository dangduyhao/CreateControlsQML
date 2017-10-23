import QtQuick 2.6

Rectangle {
    width: 480
    height: 580
    color: "#95a5a6"

    ListView {
        anchors.fill: parent
        anchors.left: parent.left; anchors.leftMargin: 10
        anchors.right: parent.right; anchors.rightMargin: 20

        clip: true

        model: contact

        delegate: contactDelegate

        section.property: "letter"
        section.delegate: sectionDelegate
    }

    Component {
        id: contactDelegate

        Item {
            width: ListView.view.width
            height: 20
            Text {
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                anchors.leftMargin: 10
                font.pixelSize: 18
                text: name
                color: '#1f1f1f'
            }
        }
    }

    Component {
        id: sectionDelegate

        Rectangle {
            width: ListView.view.width
            height: 30
            color: "#1abc9c"

            Text {
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                anchors.leftMargin: 5
                font.family: "Ubuntu"
                font.bold: true
                font.pixelSize: 24
                color: "White"
                text: section
            }
        }
    }


    ListModel {
        id: contact

        ListElement { name: "Sparkle Abel"; letter: "A"; }
        ListElement { name: "Abdul Ahad"; letter: "A"; }
        ListElement { name: "Alexandar Panayotov Alexandrov"; letter: "A"; }
        ListElement { name: "Alton Alphin"; letter: "A"; }
        ListElement { name: "Karoline Beane"; letter: "B"; }
        ListElement { name: "Meta Begum"; letter: "B"; }
        ListElement { name: "Roberta Bondar"; letter: "B"; }
        ListElement { name: "Gertha Braz"; letter: "B"; }
        ListElement { name: "Dee Brunell"; letter: "B"; }
        ListElement { name: "Graham Corbell"; letter: "C"; }
        ListElement { name: "Matt Dansie"; letter: "D"; }
        ListElement { name: "Erlene Estill"; letter: "E"; }
        ListElement { name: "Pamula Fazzino"; letter: "F"; }
        ListElement { name: "Kiesha Gallien"; letter: "G"; }
        ListElement { name: "Marc Garneau"; letter: "G"; }
        ListElement { name: "Floria Gilchrist"; letter: "G"; }
        ListElement { name: "Chris Hadfield"; letter: "H"; }
        ListElement { name: "Thersa Heinrichs"; letter: "H"; }
        ListElement { name: "Georgi Ivanov"; letter: "I"; }
        ListElement { name: "Andera Jinkins"; letter: "J"; }
        ListElement { name: "Kassandra Knotts"; letter: "K"; }
        ListElement { name: "Guy Laliberte"; letter: "L"; }
        ListElement { name: "Carli Lowther"; letter: "L"; }
        ListElement { name: "Steven MacLean"; letter: "M"; }
        ListElement { name: "Rolf Marcinek"; letter: "M"; }
        ListElement { name: "Sonja Nuckols"; letter: "N"; }
        ListElement { name: "Sudie Null"; letter: "N"; }
        ListElement { name: "Beatris Orban"; letter: "O"; }
        ListElement { name: "Vincent Parent"; letter: "P"; }
        ListElement { name: "Julie Payette"; letter: "P"; }
        ListElement { name: "Marcos Pontes"; letter: "P"; }
        ListElement { name: ""; letter: "Q"; }
        ListElement { name: "Marianela Ritacco"; letter: "R"; }
        ListElement { name: "Rashida Royal"; letter: "R"; }
        ListElement { name: "Patricia Ruark"; letter: "R"; }
        ListElement { name: ""; letter: "S"; }
        ListElement { name: "Robert Thirsk"; letter: "T"; }
        ListElement { name: "Rosalba Thurgood"; letter: "T"; }
        ListElement { name: "Bjarni Tryggvason"; letter: "T"; }
        ListElement { name: "Bronwyn Uyehara"; letter: "U"; }
        ListElement { name: "Loreen Vila"; letter: "V"; }
        ListElement { name: "Dafydd Williams"; letter: "W"; }
        ListElement { name: "Felica Woolfolk"; letter: "W"; }
        ListElement { name: ""; letter: "X"; }
        ListElement { name: "Alane Yanez"; letter: "Y"; }
        ListElement { name: "Bibi Yamaguchi"; letter: "Y"; }
        ListElement { name: ""; letter: "Z"; }
    }


}
