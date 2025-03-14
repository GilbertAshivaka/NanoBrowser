import QtQuick
import QtQuick.Controls.Fusion
import QtQuick.Layouts

Rectangle {
    id: root
    property int numberOfMatches: 0
    property int activeMatch: 0
    property alias text: findTextField.text

    function reset(){
        numberOfMatches = 0;
        activeMatch = 0;
        visible = false;
    }

    signal findNext()
    signal findPrevious()

    width: 250
    height: 35
    radius: 2

    border.width: 1
    border.color: "black"
    color: "white"

    onVisibleChanged: {
        if(visible)
            findTextField.forceActiveFocus();
    }

    RowLayout{
        anchors.fill: parent
        anchors.topMargin: 5
        anchors.bottomMargin: 5
        anchors.leftMargin: 10
        anchors.rightMargin: 10

        spacing: 5


        Rectangle{
            Layout.fillWidth: true
            Layout.fillHeight: true

            TextField{
                id: findTextField
                anchors.fill: parent
                color: "black"
                background: Rectangle{
                    color: "transparent"
                }

                onAccepted: root.findNext()
                onTextChanged: root.findNext()
                onActiveFocusChanged: activeFocus ? selectAll() : deselect()
            }
        }

        Label{
            text: activeMatch + "/"+ numberOfMatches
            visible: findTextField.text !== ""
            color: "black"
        }

        Rectangle{
            border.width: 1
            border.color: "#ddd"
            width: 2
            height: parent.height
            anchors.topMargin: 5
            anchors.bottomMargin: 5
        }

        ToolButton{
            text: "<"
            enabled: numberOfMatches > 0
            onClicked: root.findPrevious()
            contentItem: Text {
                color:  "black"
                text: parent.text
            }
        }

        ToolButton{
            text: ">"
            enabled: numberOfMatches > 0
            onClicked: root.findNext()
            contentItem: Text{
                color: "black"
                text: parent.text
            }
        }

        ToolButton{
            text: "x"
            onClicked: root.visible = false
            contentItem: Text{
                color: "black"
                text: parent.text
            }
        }
    }
}























