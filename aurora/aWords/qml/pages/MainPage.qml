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
import QtGraphicalEffects 1.0

Page {
    id: idMain
    objectName: "mainPage"
    allowedOrientations: Orientation.Portrait

    property int counter: 0

    SilicaFlickable {
        width: parent.width
        height: parent.height

        PullDownMenu {
            id: pullDownMenu
            topMargin: Theme.paddingLarge
            bottomMargin: Theme.paddingLarge

            MenuItem {
                text: "Increment Counter ("+idMain.counter+")"
                onClicked: idFlutterWebView.incrementCounter()
            }

            MenuItem {
                text: qsTr("Clear counter")
                onClicked: idFlutterWebView.clearCounter()
            }
        }

        FlutterWebView {
            id: idFlutterWebView
            width: parent.width - Theme.horizontalPageMargin * 2
            height: parent.height - Theme.horizontalPageMargin * 2
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            bgColor: Theme.highlightDimmerColor
            textColor: Theme.highlightColor
            onCounterChanged: idMain.counter = idFlutterWebView.counter
        }
    }
}
