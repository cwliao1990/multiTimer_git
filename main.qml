import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Window {
    width: 640
    height: 480
    visible: true
    color: "black"
    title: qsTr("MultiTimer")
    property int  recordCount: 0
    Rectangle {
        id: rec
        anchors.fill: parent
        color: "black"
        anchors.rightMargin: 20
        anchors.leftMargin: 20

        TimeDisplay {
            id: timeDisplay
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 10
            width: parent.width
            height: parent.height/4
        }

        Row {
            id: controlButtons
            //anchors.horizontalCenter: timeDisplay.horizontalCenter
            anchors.left: timeDisplay.left;
            anchors.top: timeDisplay.bottom
            width: rec.width
            height: 30
            spacing: width/11

            Button {
                id: startButton
                text: qsTr("Start")
                width: parent.width/5.5
                height: parent.height
                font.pointSize: 20
                //anchors.leftMargin: rec.width/6;
                onClicked: {
                    timer.start();
                }
            }

            Button {
                id: pauseButton
                text: qsTr("Pause")
                width: parent.width/5.5
                height: parent.height
                font.pointSize: 20
                onClicked: {
                    timer.stop();
                }
            }

            Button {
                id: newButton
                text: qsTr("New")
                width: parent.width/5.5
                height: parent.height
                font.pointSize: 20
                onClicked: {
                    recordTime();
                }
            }

            Button {
                id: resetButton
                text: qsTr("Reset")
                width: parent.width/5.5
                height: parent.height
                font.pointSize: 20
                onClicked: {
                    timeDisplay.reset();
                    timeDisplay1.visible = false;
                    timeDisplay2.visible = false;
                    timeDisplay3.visible = false;
                    recordCount = 0;
                }
            }
        }
        TimeDisplay {
            id: timeDisplay1
            anchors.top: controlButtons.bottom
            anchors.topMargin: 10
            width: parent.width
            height: parent.height/8
            visible: false
        }
        TimeDisplay {
            id: timeDisplay2
            anchors.top: timeDisplay1.bottom
            anchors.topMargin: 10
            width: parent.width
            height: parent.height/8
            visible: false
        }
        TimeDisplay {
            id: timeDisplay3
            anchors.top: timeDisplay2.bottom
            anchors.topMargin: 10
            width: parent.width
            height: parent.height/8
            visible: false
        }

    }

    Timer {
        id: timer
        interval: 10
        running: false
        repeat: true

        onTriggered: {
            timeDisplay.addMs();
        }
    }

    function recordTime() {
        if(recordCount >= 3) return;
        recordCount++;
        //var displayID = "timeDisplay" + toString(recordCount);
        //displayID
        switch(recordCount) {
        case 1:
            timeDisplay1.visible = true;
            timeDisplay1.hr = timeDisplay.hr;
            timeDisplay1.min = timeDisplay.min;
            timeDisplay1.sec = timeDisplay.sec;
            timeDisplay1.ms = timeDisplay.ms;
            break;
        case 2:
            timeDisplay2.visible = true;
            timeDisplay2.hr = timeDisplay.hr;
            timeDisplay2.min = timeDisplay.min;
            timeDisplay2.sec = timeDisplay.sec;
            timeDisplay2.ms = timeDisplay.ms;
            break;
        case 3:
            timeDisplay3.visible = true;
            timeDisplay3.hr = timeDisplay.hr;
            timeDisplay3.min = timeDisplay.min;
            timeDisplay3.sec = timeDisplay.sec;
            timeDisplay3.ms = timeDisplay.ms;
            break;
        }
    }


}
