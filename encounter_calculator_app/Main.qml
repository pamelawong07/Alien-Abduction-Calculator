import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Basic


ApplicationWindow {
    id: window
    width: 900
    height: 600
    minimumWidth: 900
    minimumHeight: 600
    maximumWidth: 900
    maximumHeight: 600
    visible: true
    title: qsTr("Alien Encounter Calculator")
    property bool lightMode: Application.styleHints.colorScheme === Qt.Light
    property color aliengreen: "#6cc417"
    property color lightgreen: "#cfe6ca"
    property color lightgray: "#ebedeb"

    GridLayout {
        id: grid
        columns: 2
        rowSpacing: 0
        columnSpacing: 0
        anchors.fill: parent

        Rectangle {
            id: rectangle1
            color: "white"
            Layout.fillHeight: true
            //Layout.fillWidth: true
            Layout.preferredWidth: 600
            Layout.alignment: Qt.AlignLeft
            Image{
                id: map
                //Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
                anchors.fill: parent
                //picture sourced from https://inkpx.com/templates/6mde/printable-us-map-state-outline-with-names
                source: "United-States-Country-Outline.jpg"
                fillMode: Image.PreserveAspectFit
            }
        }

        Rectangle {
            id: rectangle2
            color: lightgreen
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignRight
            Layout.preferredWidth: 0.5

            ColumnLayout {
                anchors.fill: parent
                Layout.alignment: Qt.AlignHCenter | Qt.AlignTop

                // Button {
                //     id: button1
                //     text: window.lightMode ? qsTr("\u263D  Dark mode")
                //                            : qsTr("\u263C  Light mode")
                //     Layout.bottomMargin: 16
                //     Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom

                //     contentItem: Text {
                //         text: button1.text
                //         color: window.lightMode ? window.light : window.dark
                //         font: button1.font
                //         horizontalAlignment: Text.AlignHCenter
                //         verticalAlignment: Text.AlignVCenter
                //     }

                //     background: Rectangle {
                //         implicitWidth: 120
                //         implicitHeight: 36
                //         radius: 8
                //         color: window.lightMode ? window.dark : window.light
                //     }

                //     onClicked: window.lightMode = !window.lightMode
                // }
                Button{
                    id: submit_new
                    text: "Submit new sighting"
                    font.pointSize: 15
                    Layout.topMargin: 20
                    Layout.alignment: Qt.AlignHCenter| Qt.AlignTop
                    background: Rectangle{
                        color: aliengreen
                        implicitWidth: 100
                        implicitHeight: 36
                        radius: 8
                    }
                }
                Button{
                    id: query_city
                    text: "Probability of Abduction"
                    font.pointSize: 15
                    Layout.alignment: Qt.AlignHCenter
                    background: Rectangle{
                        implicitWidth: 150
                        implicitHeight: 36
                        radius: 8
                    }
                    onClicked: datatext.text = "hey"
                }

                Item{
                    id: switch_row
                    Layout.alignment: Qt.AlignLeft
                    Layout.topMargin: 60
                    Layout.leftMargin: 25

                    RowLayout {
                        anchors.fill: parent

                        Button{
                            id: switch_splay
                            text: "Splay Tree"
                            font.pointSize: 15
                            background: Rectangle{
                                implicitWidth: 100
                                implicitHeight: 30
                                radius: 6
                            }
                            onClicked: datatext.text = "im splay"
                        }
                        Button{
                            id: switch_minheap
                            text: "Minheap"
                            font.pointSize: 15
                            background: Rectangle{
                                implicitWidth: 100
                                implicitHeight: 30
                                radius: 6
                            }
                            onClicked: datatext.text = "im minheap"
                        }
                    }
                }
                ColumnLayout{
                    spacing: 0
                    Layout.topMargin: 10
                    Layout.alignment: Qt.AlignHCenter
                    Rectangle{
                        width: 250; height: 30
                        color: lightgray
                        id: time_box
                        MouseArea{
                            anchors.fill: parent
                        }
                        Text{
                            id: timetxt
                            font.pointSize: 15
                            text: "TIME: "
                        }
                    }

                    Rectangle{
                        width: 250; height: 300
                        color: "white"
                        id: container
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom
                        MouseArea{
                            anchors.fill: parent
                        }
                        Text{
                            id: datatext
                            font.pointSize: 12
                            text: "absdkfs"
                        }
                    }
                }
            }
        }
    }

}

