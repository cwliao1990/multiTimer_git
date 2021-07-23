import QtQuick 2.0

Text {
    property int number: 0
    property bool bRunning: false;
    property var addNumberB
    property var minusNumber;
    color: "green"
    font.family: led16sgmnt.name
    FontLoader { id: led16sgmnt; source: "qrc:/fonts/Led16Segment-188L.ttf"; }
    //font.family: segment7.name
    //FontLoader { id: segment7; source: "qrc:/fonts/Segment7Standard.otf"; }
    text: ((number >= 10) ? String(number) : "0" + String(number))

}
