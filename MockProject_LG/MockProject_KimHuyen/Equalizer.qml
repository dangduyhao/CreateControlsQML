import QtQuick 2.0

Item {


    Image {

        source: "images/separator.png"
    }

    Image{

        x : 195
        y : -40
        source:mou4.containsMouse? "images/move_up_active.png":"images/move_up_inactive.png"
        MouseArea{
            anchors.fill: parent
            id: mou4
            onClicked: {
                if(ball.y >= y + 20 )
                {
                     ball.y = ball.y - 24;
                }

            }

        }

    }

    Image {
        id:btndown
        x : 200
        y : 240
        source: mou3.containsMouse?"images/move_down_active.png":"images/move_down_inactive.png"
        MouseArea{
            anchors.fill: parent
            id: mou3
            onClicked: {
                if(ball.y + 110 <= btndown.y )
                {
                    ball.y += 24 ;

                }

            }

        }
    }

    Image {
        x : 150
        y : 40
        id: tone_box
        source: "images/tone_box.png"


        Image {

            source: "images/grid.png"
            Image{
                id:ball

                x : 65
                y : 74
                source: "images/ball.png"

                MouseArea
                {
                    id: dragArea
                    anchors.fill: parent

                    drag.minimumY: 0
                    drag.maximumY: tone_box.height - ball.height
                    drag.minimumX: 0
                    drag.maximumX: tone_box.width - ball.width
                    drag.target: ball

                }


            }

        }
    }



    Image {
        x: 50
        y : 100
        source: mou1.containsMouse?"images/move_left_active.png":"images/move_left_inactive.png"
        MouseArea{
            anchors.fill: parent
            id: mou1

            onClicked: {
                if(ball.x - 20 >= x )
                {
                     ball.x = ball.x - 20.5;
                }

            }

        }
    }

    Image {
        x : 340
        y : 100
        source: mou2.containsMouse?"images/move_right_active.png":"images/move_right_inactive.png"
        MouseArea{
            anchors.fill: parent
            id: mou2
            onClicked: {

                if(ball.x + 220 < 340 )

                     ball.x += 20.5

            }

        }
    }

    Image {
        x : 470
        source: "images/separator.png"
    }




}
