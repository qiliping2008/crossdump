import QtQuick 2.9
import QtQuick.Window 2.9
import QtLocation 5.11
import QtPositioning 5.11
import QtQuick.Controls 1.4
import com.crossdump.navigationsegment 1.0
import com.crossdump.zone 1.0
import com.crossdump.route 1.0

Box {
        headerIconSource: "qrc:/images/navigation-icon.png"
        headerText: "CURRENT ROUTE"

        footer: true

        leftButtonVisible: true
        leftButtonText: "Back"
        onLeftClicked: {visible = false}

        rightButtonVisible: true
        rightButtonText: "Exit route"
        rightButtonColor: "#d11a2a"
        onRightClicked: {
            currentRoute = null;
            menuButtons.isNavigating = false;
            visible = false;
        }

        Text {
            color: theme.text
            anchors.top: parent.top
            anchors.topMargin: 100
            anchors.left: parent.left
            anchors.leftMargin: 60
            text: currentRoute ? currentRoute.name : ""
            font.family: base.font
            font.pointSize: 14
            font.bold: true
        }

        Text {
            id: estimatedTime
            anchors.top: parent.top
            anchors.topMargin: 100
            anchors.right: parent.right
            anchors.rightMargin: 60
            font.pointSize: 14
            font.family: base.font
            textFormat: Text.StyledText
            color: theme.weakText

            text: "Estimated time:"
        }
        Text {
            anchors.top: parent.top
            anchors.topMargin: 120
            anchors.right: parent.right
            anchors.rightMargin: 65
            font.pointSize: 14
            font.family: base.font
            textFormat: Text.StyledText
            color: theme.weakText

            text: "180 min"


        }

        ListView {
            width: parent.width
            height: parent.height -300
            anchors.top: parent.top
            anchors.margins: 80
            anchors.topMargin: 180
            spacing: 0
            model: currentRoute ? currentRoute.zoneList : null
            visible: currentRoute !== null
            delegate: Row {
                width: parent.width
                height: (zone.height+units.height)*1.5
                spacing: 10

                Rectangle {
                    height: parent.height
                    width: parent.width
                    color: theme.background
                    Text {
                        id:zone
                        text: "\n" + modelData.name//zone name
                        wrapMode: Text.Wrap
                        width: parent.width*2/3
                        anchors.right: parent.right
                        anchors.top: parent.top
                        font.bold: true
                        font.pointSize: 16
                        font.family: base.font
                        color: theme.weakText
                        verticalAlignment: Text.AlignVCenter
                    }
                    Text {
                        id: units
                        text: modelData.coordinates.length + " units"
                        wrapMode: Text.Wrap
                        width: parent.width*2/3
                        anchors.right: parent.right
                        anchors.top: zone.bottom
                        font.pointSize: 14
                        font.family: base.font
                        color: theme.weakText
                        verticalAlignment: Text.AlignVCenter
                    }
                }
            }
        }
    }
