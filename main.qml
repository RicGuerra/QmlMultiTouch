import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Window 2.2

// import "path/to/QmlMultiTouch"
import "QmlMultiTouch"

Window {
    visible: true
    visibility: "Maximized"
    title: qsTr("Hello World")


    ColumnLayout {
        anchors.centerIn: parent

        Slider{
            Label{ text: parent.value; anchors.horizontalCenter: parent.horizontalCenter }
            MultiTouch {}
        }

        Slider{
            orientation: Qt.Vertical
            MultiTouch {}
        }

        Slider{
            Label{ text: parent.value; anchors.horizontalCenter: parent.horizontalCenter }
            MultiTouch {}
        }

    }
}
