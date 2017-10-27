import QtQuick 2.6

Item {
    visible: true
    width: 1200
    height: 500

    Image {
        source: "images/bg.jpg"
        fillMode: Image.PreserveAspectFit
    }

    Grid {
        id: gridClock
        x: (parent.width - width)/2
        y: (parent.height - height)/2 - 100
        rows: 1; columns: 4; spacing: 50

        Clock {cityName: "Hanoi - VN"; shift: +7}
        Clock {cityName: "New York - USA"; shift: -5}
        Clock {cityName: "Paris - France"; shift: 0}
        Clock {cityName: "Seoul - Korea"; shift: +9}
    }

    Text {
        anchors.top: gridClock.bottom; anchors.topMargin: 100
        anchors.horizontalCenter: gridClock.horizontalCenter
        font.family: "Ubuntu"
        font.pixelSize: 24
        font.bold: true
        style: Text.Outline; styleColor: "#34495e"
        color: "#ecf0f1"
        text: qsTr("----------------------------------------\nHiển thị thời gian 4 khu vực\nBan ngày đồng hồ màu sáng\nBan đêm đồng hồ màu tối")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }
}
