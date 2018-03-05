import QtQuick 2.0
import QtQuick.Controls 2.0
import "Private"

Item {
    anchors.fill: parent

    property bool debug: _.debug
    property alias touchArea: _touchArea
    property Item targetComponet: parent

    onTargetComponetChanged: {
        if(targetComponet instanceof Slider)
            loader.sourceComponent = multiTouchSlider;
    }

    QtObject {
        id: _
        property bool debug: false
    }

    Component { id: multiTouchSlider;       MultiTouchSlider {} }

    Loader { id: loader }

    MultiPointTouchArea {
        id: _touchArea
        anchors.fill: parent
        touchPoints: [
            TouchPoint { id: touch1; objectName: "t1" },
            TouchPoint { id: touch2; objectName: "t2" }
        ]
        Connections { onTouchUpdated: if (loader.status == Loader.Ready) loader.item.touchPoints = touchPoints; }

        // NOTE: debug touches report
        onTouchUpdated: {
            for (var i = 0; i < touchPoints.length; i++ )
                debugCtrl.set(touchPoints[i].objectName , "x:" + touchPoints[i].x + "\ny:" + touchPoints[i].y);
        }
    }

    Debug {  id: debugCtrl }
}
