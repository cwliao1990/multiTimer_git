import QtQuick 2.0

Item {
    property int hr: 0
    property int min: 0
    property int sec: 0
    property int ms: 0
    property int spacing: 0
    property int fontSize: 50

    Row {
        id: row
        spacing: 5
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        TimeText {
            id: hrText
            number: hr
            font.pointSize: fontSize
        }
        Text {
            text: ":"
            font.pointSize: fontSize/1.5
            color: "green"
        }
        TimeText {
            id: minText
            number: min
            font.pointSize: fontSize
        }
        Text {
            text: ":"
            font.pointSize: fontSize/1.5
            color: "green"
        }
        TimeText {
            id: secText
            number: sec
            font.pointSize: fontSize
        }
        Text {
            text: "."
            font.pointSize: fontSize/1.5
            anchors.verticalCenterOffset: fontSize
            color: "green"
        }
        TimeText {
            id: msText
            number: ms
            font.pointSize: fontSize
        }
    }

    function reset() {
        ms = 0;
        sec = 0;
        min = 0;
        hr = 0;
    }

    function addMs() {
        if (ms == 59) {
            ms = 0;
            addSec();
        }
        else ms += 1;
    }

    function addSec() {
        if (sec == 59) {
            sec = 0;
            addMin();
        }
        else
            sec += 1;
    }

    function addMin() {
        if (min == 59) {
            min = 0;
            addHour();
        }
        else
            min += 1;
    }

    function addHour() {
        hr += 1;
    }
}
