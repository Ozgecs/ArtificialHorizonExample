import QtQuick 2.15
import QtPositioning 5.2

Item {
    id: arthor
    width: 1920
    height: 1080
    property int horizontime: 2000

    //Arka plan rengi
    Rectangle{
        id: kokpit
        anchors.fill: parent
        color:"grey"
        z:-1
    }

    Image {
        id: taban
        source: "pngwing.com (4).png"
        anchors{
            left: parent.left
            right: parent.right
            bottom: parent.bottom
            verticalCenter: parent.verticalCenter
            horizontalCenter: parent.horizontalCenter

        }
        height: parent.height
    }
    Image {
        id: cerceve
        source: "Dış çerçeve.png"
        width: taban.width*0.53
        height: width
        anchors{
            left: taban.left*3
            right: taban.right*3
            bottom: taban.bottom*3
            verticalCenter:parent.verticalCenter
            horizontalCenter: parent.horizontalCenter
        }
    }


    Image{
        id:ufuk
        source: "suni ufuk.png"
        width: cayo.width
        height: width

        anchors{
            left:taban.left*4
            right:taban.right*4
            bottom:taban.bottom*4
            verticalCenter: taban.verticalCenter
            horizontalCenter: taban.horizontalCenter
        }

        PropertyAnimation{
            id:right
            target:ufuk
            //loops: Animation.alwaysRunToEndChanged()
            property: "rotation"
            to: 360
            duration: horizontime

        }
        PropertyAnimation{
            id:left
            target: ufuk
            //loops: Animation.alwaysRunToEndChanged()
            property: "rotation"
            to:-360
            duration: horizontime

        }
        PropertyAnimation{
            id:bitir
            target:ufuk

            property: "rotation"
            to:0
            duration: 1000
        }

    }

    MouseArea{
        acceptedButtons: Qt.LeftButton | Qt.RightButton | Qt.MiddleButton
        anchors.fill: ufuk
        onClicked:{


            if(ufuk.rotation==0)
            {
                if(mouse.button==Qt.RightButton)
                {
                    right.start()
                }
                if(mouse.button==Qt.LeftButton)
                {
                    left.start()
                }
                else if(mouse.button==Qt.MiddleButton)
                {
                    bitir.start()
                }

            }
            if(ufuk.rotation>=1)
            {

                if(mouse.button==Qt.LeftButton)
                {
                    left.start()
                }
                else if(mouse.button==Qt.MiddleButton)
                {
                    bitir.start()
                }
            }
            else if(ufuk.rotation<=-1)
            {
                if(mouse.button==Qt.RightButton)
                {
                    right.start()
                }
                else if(mouse.button==Qt.MiddleButton)
                {
                    bitir.start()
                }
            }

        }

    }
    Image{
        id:cayo
        source: "pngwing.com (3).png"
        width: taban.width*0.47
        height: width
        anchors{
            left: taban.left*3
            right: taban.right*3
            bottom: taban.bottom*3
            verticalCenter:parent.verticalCenter
            horizontalCenter: parent.horizontalCenter
        }

    }




}
