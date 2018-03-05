import QtQuick 2.0

QtObject {
    id: root
    property var touchPoints
    property bool horizontal: targetComponet.horizontal
    property int size: horizontal ? targetComponet.width : targetComponet.height
    property int sizeV: horizontal ? 0 : size
    property double from: targetComponet.from
    property double to: targetComponet.to
    property double range: to - from

    onTouchPointsChanged:{
        for (var i = 0; i < touchPoints.length; i++)
            if (touchPoints[i].objectName === "t1") {
                targetComponet.value = from + (range * ((horizontal ? touchPoints[i].x : sizeV - touchPoints[i].y) / size))
                break;
            }
    }
}
