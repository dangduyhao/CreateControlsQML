import QtQuick 2.0

Rectangle
{
    property int count1: 0
    property int count2: 0
    property int count3: 0

    color: "transparent"

    Image {
        x : 5
        height: 280
        source: "images/separator.png"
    }

    Text {
        x : 50
        y : -25
        text: qsTr("Bass")
        color: "white"

        font.pointSize: 16
    }


    Image {
        x : 142
        height: 280
        source: "images/separator.png"
    }

    Text {
        x : 178
        y : -25
        text: qsTr("Midrage")
        color: "white"

        font.pointSize: 16
    }
    Image {
        x : 280
        height: 280
        source: "images/separator.png"
    }

    Text {
        x : 320
        y : -25
        text: qsTr("Treble")
        color: "white"

        font.pointSize: 16
    }

    Image {
        x : 410
        height: 280
        source: "images/separator.png"
    }


    Image{

        x : 38
        y :-5
        scale:0.7

        source:mouUp1.containsMouse? "images/move_up_active.png":"images/move_up_inactive.png"
        MouseArea{
            anchors.fill: parent
            id: mouUp1
            onClicked: {

                if(count1 < 12)
                    count1++ ;

            }

        }

    }

    Image{
        y : -5
        x : 175
        scale:0.7

        source:mouUp2.containsMouse? "images/move_up_active.png":"images/move_up_inactive.png"
        MouseArea{
            anchors.fill: parent
            id: mouUp2
            onClicked: {
                 if(count2 < 12)
                    count2 ++ ;

            }

        }

    }

    Image{
        y : -5
        x : 315
        scale:0.7

        source:mouUp3.containsMouse? "images/move_up_active.png":"images/move_up_inactive.png"
        MouseArea{
            anchors.fill: parent
            id: mouUp3
            onClicked: {
                 if(count3 < 12)
                    count3++ ;
            }

        }

    }


    Image {
        id:btndown1
        x : 38
        y : 230
        scale: 0.7
        source: mouDown1.containsMouse?"images/move_down_active.png":"images/move_down_inactive.png"
        MouseArea{
            anchors.fill: parent
            id: mouDown1
            onClicked: {

                if(count1 > -12 )
                    count1 -- ;
            }

        }
    }

    Image {
        id:btndown2
        x : 175
        y : 230
        scale: 0.7
        source: mouDown2.containsMouse?"images/move_down_active.png":"images/move_down_inactive.png"
        MouseArea{
            anchors.fill: parent
            id: mouDown2
            onClicked: {
                if(count2 > -12 )
                count2-- ;

            }

        }
    }

    Image {
        id:btndown3
        x : 315
        y : 230
        scale: 0.7
        source: mouDown3.containsMouse?"images/move_down_active.png":"images/move_down_inactive.png"
        MouseArea{
            anchors.fill: parent
            id: mouDown3
            onClicked: {
                if(count3 > -12 )
                count3-- ;
            }

        }
    }

    Text {
        x : 45
        y :135
        id: txtBass
        text: {
            if(count1 > 0 )
            {
                return " +" + count1 ;

            }
            if(count1 < 0 )
            {
                return " "+ count1 ;
            }
            else
                return "  0" ;

        }
        color: "white"
        font.pointSize: 18

    }

    Text {
        x : 185
        y :135
        id: txtMid
        text: {
            if(count2 > 0 )
            {
                return " +" + count2 ;

            }
            if(count2 < 0 )
            {
                return " "+ count2 ;
            }
            else
                return "  0" ;

        }
        color: "white"
        font.pointSize: 18

    }

    Text {
        x : 330
        y :135
        id: txtTre
        text: {
            if(count3 > 0 )
            {
                return "+" + count3 ;

            }
            if(count3 < 0 )
            {
                return " "+ count3 ;
            }
            else
                return " 0" ;

        }
        color: "white"
        font.pointSize: 18

    }

    Column{
        id:coltop1
        x : 43
        y : 68
        spacing: 3
        Repeater{

            model:12
            Image{

                source: "images/detent_inactive.png"



            }




        }








    }

    Column{

        x : 43
        y : 68
        spacing: 3
        Repeater{

            model:{
                if(count1 > 0 && count1 <= 12 )
                    return count1 ;

            }
            Image{

                source: "images/detent_active.png"

            }


        }


    }






    Column{

        x : 43
        y : 175
        spacing: 3
        Repeater{

            model:12
            Image{

                source: "images/detent_inactive.png"

            }


        }


    }

    Column{

        x : 43
        y : 175
        spacing: 3
        Repeater{

            model:{
                if(count1 < 0 && count1 >=-12)
                    return (count1 * -1) ;


            }
            Image{

                source: "images/detent_active.png"

            }


        }


    }


    // col Midrage

    Column{
        id:coltop2
        x : 180
        y : 68
        spacing: 3
        Repeater{

            model:12
            Image{

                source: "images/detent_inactive.png"

            }


        }



    }

    Column{

        x : 180
        y : 68
        spacing: 3
        Repeater{

            model:{
                if(count2 > 0 && count2 <= 12 )
                    return count2 ;

            }
            Image{

                source: "images/detent_active.png"

            }


        }


    }


    Column{

        x : 180
        y : 175
        spacing: 3
        Repeater{

            model:12
            Image{

                source: "images/detent_inactive.png"

            }


        }


    }

    Column{

        x : 180
        y : 175
        spacing: 3
        Repeater{

            model:{
                if(count2 < 0 && count2 >=-12)
                    return (count2 * -1) ;


            }
            Image{

                source: "images/detent_active.png"

            }


        }


    }


//Col Treble

    Column{
        id:coltop3
        x : 320
        y : 68
        spacing: 3
        Repeater{

            model:12
            Image{

                source: "images/detent_inactive.png"

            }


        }



    }

    Column{

        x : 320
        y : 68
        spacing: 3
        Repeater{

            model:{
                if(count3 > 0 && count3 <= 12 )
                    return count3 ;

            }
            Image{

                source: "images/detent_active.png"

            }


        }


    }


    Column{

        x : 320
        y : 175
        spacing: 3
        Repeater{

            model:12
            Image{

                source: "images/detent_inactive.png"

            }


        }


    }

    Column{

        x : 320
        y : 175
        spacing: 3
        Repeater{

            model:{
                if(count3 < 0 && count3 >=-12)
                    return (count3 * -1) ;


            }
            Image{

                source: "images/detent_active.png"

            }


        }


    }








}
