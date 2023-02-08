import QtQuick 2.0
import Sailfish.Silica 1.0
import QtGraphicalEffects 1.0
import Sailfish.WebView 1.0
import Sailfish.WebEngine 1.0

Rectangle {
    id: idMain
    color: 'transparent'

    property color bgColor: Theme.highlightDimmerColor
    property color textColor: Theme.highlightColor

    Rectangle {
        anchors.fill: parent
        color: 'transparent'

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
        opacity: 0.0

        property bool initialized: false

        Behavior on opacity {
            NumberAnimation {
                id: animation
                properties: "opacity";
                easing.type: Easing.InOutQuad;
                duration: 300
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
            // https://admx.help/?Category=FrontMotion&Policy=FrontMotion.Policies.Firefox::SECURITY_FILEURI_STRICT_ORIGIN_POLICY
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
