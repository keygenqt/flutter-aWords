/*******************************************************************************
**
** Copyright 2022-2023 Vitaliy Zarubin
**
** Licensed under the Apache License, Version 2.0 (the "License");
** you may not use this file except in compliance with the License.
** You may obtain a copy of the License at
**
**     http://www.apache.org/licenses/LICENSE-2.0
**
** Unless required by applicable law or agreed to in writing, software
** distributed under the License is distributed on an "AS IS" BASIS,
** WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
** See the License for the specific language governing permissions and
** limitations under the License.
**
*******************************************************************************/

import QtQuick 2.0
import Sailfish.Silica 1.0
import Sailfish.WebView 1.0
import Sailfish.WebEngine 1.0
import QtGraphicalEffects 1.0

Page {
    id: idMain
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    property int counter: 0

    PageHeader {
        id: idPageHeader
        title: qsTr("aWords")
        extraContent.children: [
            IconButton {
                objectName: "aboutButton"
                icon.source: "image://theme/icon-m-about"
                anchors.verticalCenter: parent.verticalCenter

                onClicked: pageStack.push(Qt.resolvedUrl("AboutPage.qml"))
            }
        ]
    }

    Row {
        id: idRowQml
        height: idIconButton.height
        width: parent.width - Theme.paddingLarge * 2
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: idPageHeader.bottom
        spacing: 0

        Label {
            id: idLabel
            anchors.verticalCenter: parent.verticalCenter
            text: "Qml from flutter: " + counter
        }

        Rectangle {
            height: 1
            width: idRowQml.width - idLabel.width - idIconButton.width
            color: 'transparent'
        }

        IconButton {
            id: idIconButton
            anchors.verticalCenter: parent.verticalCenter
            icon.source: "image://theme/icon-m-send"
            onClicked: webview.runJavaScript("return incrementCounter()", function(result) {
                console.log(result)
            });
        }
    }


    Rectangle {
        width: parent.width
        anchors.top: idRowQml.bottom
        anchors.bottom: parent.bottom
        color: 'transparent'

        Rectangle {
            id: idBodyRectangle
            width: parent.width - Theme.paddingLarge * 2
            height: parent.height - Theme.paddingLarge
            anchors.horizontalCenter: parent.horizontalCenter
            radius: Theme.paddingLarge
            layer.enabled: true
            layer.effect: OpacityMask {
                maskSource: Item {
                    width: idBodyRectangle.width
                    height: idBodyRectangle.height
                    Rectangle {
                        anchors.fill: parent
                        radius: Theme.paddingMedium
                    }
                }
            }

            WebView {
                id: webview
                anchors.fill: parent
                url: Qt.resolvedUrl("../flutter/index.html")

                onViewInitialized: {
                    webview.loadFrameScript(Qt.resolvedUrl("../events/framescript.js"));
                    webview.addMessageListener("webview:action")
                }

                onRecvAsyncMessage: {
                    switch (message) {
                    case "webview:action":
                        idMain.counter = data.count
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
        }
    }
}
