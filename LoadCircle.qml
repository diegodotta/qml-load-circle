import QtQuick 1.0

Row{
    id: circle

    property int loadtimer: 4000
    property color circleColor: "transparent"
    property color borderColor: "red"
    property int borderWidth: 10
    property alias running: initCircle.running
    property bool finished: false;

    function start(){
        part1.rotation = 180
        part2.rotation = 180
        initCircle.start()
    }

    function stop(){
        initCircle.stop()
        //part1.rotation = 180
        //part2.rotation = 180
    }

    width: 100
    height: width

    property real progress: (part1.rotation+part2.rotation-360)/36/10

    Item{
        width: parent.width/2
        height: parent.height
        clip: true

        Item{
            id: part1
            width: parent.width
            height: parent.height
            clip: true
            rotation: 180
            transformOrigin: Item.Right
//            visible: false;

            Rectangle{
                width: circle.width-(borderWidth*2)
                height: circle.height-(borderWidth*2)
                radius: width/2
                x:borderWidth
                y:borderWidth
                color: circleColor
                border.color: borderColor
                border.width: borderWidth
                smooth: true
            }
        }
    }

    Item{
        width: parent.width/2
        height: parent.height
        clip: true

        Item{
            id: part2
            width: parent.width
            height: parent.height
            clip: true

            rotation: 180
            transformOrigin: Item.Left
//            visible: false;

            Rectangle{
                width: circle.width-(borderWidth*2)
                height: circle.height-(borderWidth*2)
                radius: width/2
                x: -width/2
                y: borderWidth
                color: circleColor
                border.color: borderColor
                border.width: borderWidth
                smooth: true
            }
        }
    }
    SequentialAnimation{
        id: initCircle
//        PropertyAnimation{ targets: [part1,part2]; property: "visible"; to:false; duration:0 }
//        PropertyAnimation{ target: part2; property: "visible"; to:true; duration:0 }
        PropertyAnimation{ target: part2; property: "rotation"; to:360; duration:loadtimer/2 }
//        PropertyAnimation{ target: part1; property: "visible"; to:true; duration:0 }
        PropertyAnimation{ target: part1; property: "rotation"; to:360; duration:loadtimer/2 }
        ScriptAction { script: finished = true; }
    }
}



