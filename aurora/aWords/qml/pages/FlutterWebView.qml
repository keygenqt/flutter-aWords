import QtQuick 2.0
import Sailfish.Silica 1.0
import QtGraphicalEffects 1.0
import Sailfish.WebView 1.0
import Sailfish.WebEngine 1.0

Rectangle {
    id: idMain
    layer.enabled: true
    layer.effect: OpacityMask {
        maskSource: Item {
            width: idMain.width
            height: idMain.height
            Rectangle {
                anchors.fill: parent
                radius: Theme.paddingMedium
            }
        }
    }
    color: 'white'

    property int counter: 0
    property color bgColor: '#ffffff'
    property color textColor: '#000000'

    function incrementCounter() {
        webview.runJavaScript("incrementCounter()")
    }

    function clearCounter() {
        webview.runJavaScript("clearCounter()")
    }

    Rectangle {
        anchors.fill: parent
        color: bgColor
        opacity: 0.5

        BusyIndicator {
            size: BusyIndicatorSize.Medium
            anchors.centerIn: parent
            running: webview.opacity === 0.0
        }
    }

    WebView {
        id: webview
        anchors.fill: parent
        url: Qt.resolvedUrl("../flutter/index.html")

        property bool initialized: false

        Behavior on opacity {
            NumberAnimation {
                id: animation
                properties: "opacity";
                easing.type: Easing.InOutQuad;
                duration: 0
                onRunningChanged: {
                    if (!animation.running) {
                        console.log('end')
                    }
                }
            }
        }

        onViewInitialized: {
            webview.loadFrameScript(Qt.resolvedUrl("../events/framescript.js"));
            webview.addMessageListener("webview:action")
        }

        onRecvAsyncMessage: {
            switch (message) {
            case "webview:action":
                if (data.action === 'init') {
                    console.log(idMain.bgColor)
                    webview.initialized = true
                    webview.runJavaScript("setColor('"+idMain.bgColor+"', '"+idMain.textColor+"')")
                }
                else if (data.action === 'counter') {
                    idMain.counter = data.data.counter
                }
                else if (data.action === 'setColor') {
                    animation.duration = 300
                    webview.opacity = 1.0
                }
                console.log(JSON.stringify(data))
                break
            }
        }

        Component.onCompleted: {
            // disable cors checks
            WebEngineSettings.setPreference("security.disable_cors_checks",
                                            true,
                                            WebEngineSettings.BoolPref)
            // disable strict origin policy
            WebEngineSettings.setPreference("security.fileuri.strict_origin_policy",
                                                         false,
                                                         WebEngineSettings.BoolPref)
        }
    }

    onBgColorChanged: {
        animation.duration = 0
        webview.opacity = 0.0
        if (webview.initialized) {
            webview.runJavaScript("setColor('"+idMain.bgColor+"', '"+idMain.textColor+"')")
        }
    }
}
