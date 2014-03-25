import QtQuick 1.1

Rectangle {
    width: 300
    height: 300

    LoadCircle {
        anchors.centerIn: parent
        Component.onCompleted: start();
    }
}
