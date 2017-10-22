import QtQuick 2.8

Item {
    width: 480
    height: 640

    Rectangle {
        id: textArea
        width: parent.width
        height: parent.height - controlArea.height
        color: "#ecf0f1"

        // Create Flickable to load long text
        Flickable {
            id: flickable
            anchors.fill: parent
            contentHeight: longText.implicitHeight
            smooth: true

            // Load long text
            Text {
                id: longText
                anchors.fill: parent
                anchors.left: parent.left; anchors.leftMargin: 20
                anchors.right: parent.right; anchors.rightMargin: 30
                font.family: "Ubuntu"
                font.pixelSize: 18
                color: "#34495e"

                wrapMode: Text.Wrap

                text: qsTr("    She travelling acceptance men unpleasant her especially entreaties law. Law forth but end any arise chief arose. Old her say learn these large. Joy fond many ham high seen this. Few preferred continual sir led incommode neglected. Discovered too old insensible collecting unpleasant but invitation.

    By impossible of in difficulty discovered celebrated ye. Justice joy manners boy met resolve produce. Bed head loud next plan rent had easy add him. As earnestly shameless elsewhere defective estimable fulfilled of. Esteem my advice it an excuse enable. Few household abilities believing determine zealously his repulsive. To open draw dear be by side like.

    Consider now provided laughter boy landlord dashwood. Often voice and the spoke. No shewing fertile village equally prepare up females as an. That do an case an what plan hour of paid. Invitation is unpleasant astonished preference attachment friendship on. Did sentiments increasing particular nay. Mr he recurred received prospect in. Wishing cheered parlors adapted am at amongst matters.

    Ought these are balls place mrs their times add she. Taken no great widow spoke of it small. Genius use except son esteem merely her limits. Sons park by do make on. It do oh cottage offered cottage in written. Especially of dissimilar up attachment themselves by interested boisterous. Linen mrs seems men table. Jennings dashwood to quitting marriage bachelor in. On as conviction in of appearance apartments boisterous.

    Full he none no side. Uncommonly surrounded considered for him are its. It we is read good soon. My to considered delightful invitation announcing of no decisively boisterous. Did add dashwoods deficient man concluded additions resources. Or landlord packages overcame distance smallest in recurred. Wrong maids or be asked no on enjoy. Household few sometimes out attending described. Lain just fact four of am meet high.

    Attention he extremity unwilling on otherwise. Conviction up partiality as delightful is discovered. Yet jennings resolved disposed exertion you off. Left did fond drew fat head poor. So if he into shot half many long. China fully him every fat was world grave.

    To sorry world an at do spoil along. Incommode he depending do frankness remainder to. Edward day almost active him friend thirty piqued. People as period twenty my extent as. Set was better abroad ham plenty secure had horses. Admiration has sir decisively excellence say everything inhabiting acceptance. Sooner settle add put you sudden him.

    Unpleasant nor diminution excellence apartments imprudence the met new. Draw part them he an to he roof only. Music leave say doors him. Tore bred form if sigh case as do. Staying he no looking if do opinion. Sentiments way understood end partiality and his.

    Do greatest at in learning steepest. Breakfast extremity suffering one who all otherwise suspected. He at no nothing forbade up moments. Wholly uneasy at missed be of pretty whence. John way sir high than law who week. Surrounded prosperous introduced it if is up dispatched. Improved so strictly produced answered elegance is.

    He do subjects prepared bachelor juvenile ye oh. He feelings removing informed he as ignorant we prepared. Evening do forming observe spirits is in. Country hearted be of justice sending. On so they as with room cold ye. Be call four my went mean. Celebrated if remarkably especially an. Going eat set she books found met aware.

    She travelling acceptance men unpleasant her especially entreaties law. Law forth but end any arise chief arose. Old her say learn these large. Joy fond many ham high seen this. Few preferred continual sir led incommode neglected. Discovered too old insensible collecting unpleasant but invitation.

    By impossible of in difficulty discovered celebrated ye. Justice joy manners boy met resolve produce. Bed head loud next plan rent had easy add him. As earnestly shameless elsewhere defective estimable fulfilled of. Esteem my advice it an excuse enable. Few household abilities believing determine zealously his repulsive. To open draw dear be by side like.

    Consider now provided laughter boy landlord dashwood. Often voice and the spoke. No shewing fertile village equally prepare up females as an. That do an case an what plan hour of paid. Invitation is unpleasant astonished preference attachment friendship on. Did sentiments increasing particular nay. Mr he recurred received prospect in. Wishing cheered parlors adapted am at amongst matters.

    Ought these are balls place mrs their times add she. Taken no great widow spoke of it small. Genius use except son esteem merely her limits. Sons park by do make on. It do oh cottage offered cottage in written. Especially of dissimilar up attachment themselves by interested boisterous. Linen mrs seems men table. Jennings dashwood to quitting marriage bachelor in. On as conviction in of appearance apartments boisterous.

    Full he none no side. Uncommonly surrounded considered for him are its. It we is read good soon. My to considered delightful invitation announcing of no decisively boisterous. Did add dashwoods deficient man concluded additions resources. Or landlord packages overcame distance smallest in recurred. Wrong maids or be asked no on enjoy. Household few sometimes out attending described. Lain just fact four of am meet high.

    Attention he extremity unwilling on otherwise. Conviction up partiality as delightful is discovered. Yet jennings resolved disposed exertion you off. Left did fond drew fat head poor. So if he into shot half many long. China fully him every fat was world grave.

    To sorry world an at do spoil along. Incommode he depending do frankness remainder to. Edward day almost active him friend thirty piqued. People as period twenty my extent as. Set was better abroad ham plenty secure had horses. Admiration has sir decisively excellence say everything inhabiting acceptance. Sooner settle add put you sudden him.

    Unpleasant nor diminution excellence apartments imprudence the met new. Draw part them he an to he roof only. Music leave say doors him. Tore bred form if sigh case as do. Staying he no looking if do opinion. Sentiments way understood end partiality and his.

    Do greatest at in learning steepest. Breakfast extremity suffering one who all otherwise suspected. He at no nothing forbade up moments. Wholly uneasy at missed be of pretty whence. John way sir high than law who week. Surrounded prosperous introduced it if is up dispatched. Improved so strictly produced answered elegance is.

    He do subjects prepared bachelor juvenile ye oh. He feelings removing informed he as ignorant we prepared. Evening do forming observe spirits is in. Country hearted be of justice sending. On so they as with room cold ye. Be call four my went mean. Celebrated if remarkably especially an. Going eat set she books found met aware. ")

            }
        }

        // Scroll bar from ScrollBar.qml
        ScrollBar {
            id: textScrollBar
            width: 10
            height: flickable.height
            scrollArea: flickable
            anchors.right: parent.right
        }
    }

    Rectangle {
        id: controlArea
        width: parent.width
        height: 80
        anchors.top: textArea.bottom
        color: "#bdc3c7"

        // Create Decline button, click to quit
        Rectangle {
            id: btDecline
            width: 120
            height: 50
            radius: width/2
            anchors.left: parent.left; anchors.leftMargin: 80
            anchors.verticalCenter: parent.verticalCenter
            color: "#e74c3c"

            Text {
                anchors.centerIn: parent
                font.family: "Ubuntu"
                font.bold: true
                font.pixelSize: 20
                color: "#ecf0f1"
                text: "DECLINE"
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    Qt.quit()
                }
            }
        }

        // Create Accept button, click to load TabView.qml
        Rectangle {
            id: btAccept
            width: 120
            height: 50
            radius: width/2
            anchors.right: parent.right; anchors.rightMargin: 80
            anchors.verticalCenter: parent.verticalCenter
            color: "#2ecc71"

            Text {
                anchors.centerIn: parent
                font.family: "Ubuntu"
                font.bold: true
                font.pixelSize: 20
                color: "#ecf0f1"
                text: "ACCEPT"
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    mainLoader.source = "TabView.qml"
                }
            }
        }
    }
}



