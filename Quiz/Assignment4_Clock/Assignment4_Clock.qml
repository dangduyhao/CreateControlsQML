import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    id: app
    visible: true
    width: 1000
    height: 500
    maximumWidth: width
    maximumHeight: height
    minimumWidth: width
    minimumHeight: height

    title: qsTr("Clocks")

    Grid {
        id: gridClock
        x: (app.width - width)/2
        y: (app.height - height)/2 - 100
        rows: 1; columns: 4; spacing: 30

        Clock {cityName: "Hanoi - VN"; shift: +7}
        Clock {cityName: "New York - USA"; shift: -5}
        Clock {cityName: "Paris - France"; shift: 0}
        Clock {cityName: "Seoul - Korea"; shift: +9}
    }

    Text {
        anchors.top: gridClock.bottom; anchors.topMargin: 100
        anchors.horizontalCenter: gridClock.horizontalCenter
        font.family: "Ubuntu"
        font.pixelSize: 18
        color: "#34495e"
        text: qsTr("----------------------------------------\nBài tập hiển thị thời gian 4 khu vực\nBan ngày đồng hồ màu sáng\nBan đêm đồng hồ màu tối\n--- Đặng Duy Hảo ---")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }
}
