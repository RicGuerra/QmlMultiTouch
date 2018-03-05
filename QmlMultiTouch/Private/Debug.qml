import QtQuick 2.0

Item {
    enabled: _.debug
    property alias debug: debugLoader.item

    function clear() { if (debug) debug.modelShow.clear();  }
    function set(id, msg) {
        if (enabled)  {
            if (debug.modelShow.count === 0)
                debug.modelShow.set(0, {"id": id, "msg": msg});
            else
                for (var i = 0; i < debug.modelShow.count; i++ )
                    debug.modelShow.set(i, {"id": id, "msg": msg});
        }
    }

    Loader {
        id:debugLoader
        sourceComponent: if (enabled) debugC
    }

    Component {
        id: debugC
        Column {
            property alias modelShow: modelShow

            ListModel { id: modelShow  }

            ListView  {
                model: modelShow
                delegate: Row {
                    spacing: 20
                    Text {
                        text: id
                    }
                    Text {
                        text: msg
                    }
                }
            }
        }
    }
}
