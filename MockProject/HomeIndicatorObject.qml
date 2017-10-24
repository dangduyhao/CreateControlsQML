import QtQuick 2.3
import "Constants.js" as Constants

Image {
    y: 393
    x: Constants.screen_width/2
    width: 8
    height: 8
    opacity: 100
    source: Constants.page_indicator_active
    asynchronous: true
    visible:true
}
