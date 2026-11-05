import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Basic
import frontend_functions

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
    property color lightergreen: "#e7f5e4"
    property color lightgray: "#ebedeb"
    property color lightgreengray: "#e0e6df"

    Frontend_functions{
        id: fe_functions
    }

    RowLayout {
        id: ui_row
        spacing: 0
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
                anchors.fill: parent
                //picture sourced from https://inkpx.com/templates/6mde/printable-us-map-state-outline-with-names
                source: "qrc:/img/images/United-States-Country-OutlineONLY.png"
                //source: "qrc:/img/images/test_stockimg.jpg"
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

                Button{
                    id: credits_button
                    Layout.alignment: Qt.AlignRight
                    text: "Credits"
                    x:parent.width-20
                    y:parent.height-20
                    background: Rectangle{
                        color:"white"
                    }
                    onClicked: credits_window.show()
                }
                Button{
                    id: submit_new
                    text: "Submit new sighting"
                    font.pointSize: 15
                    font.bold: true
                    Layout.topMargin: 10
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
                    text: "Calculate Probability"
                    font.pointSize: 15
                    font.bold: true
                    Layout.alignment: Qt.AlignHCenter
                    background: Rectangle{
                        implicitWidth: 150
                        implicitHeight: 36
                        radius: 8
                    }
                    onClicked: {
                        fe_functions.getData();
                        datatext.text = fe_functions.getText();
                        timetxt.text = fe_functions.getTime();
                    }
                }
                ComboBox{
                    id: city_picker
                    Layout.alignment: Qt.AlignHCenter
                    model: ListModel{
                        id: city_list
                        ListElement{text:"Select a state to choose a city..."}
                    }
                    background: Rectangle{
                        color: "white"
                        implicitWidth: 220
                    }

                }
                ColumnLayout{
                    spacing: 0
                    Layout.alignment: Qt.AlignHCenter
                    ButtonGroup{
                        id: switch_button_group
                        buttons: button_row.children
                        exclusive: true
                    }
                    Row {
                        id: button_row
                        //anchors.fill: parent
                        Layout.alignment: Qt.AlignHCenter

                        Button{
                            id: switch_splay
                            Text{
                                color: "black"
                                text: "Splay Tree"
                                leftPadding: 5
                                font.pointSize: 12
                                font.bold: true
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                            }
                            checkable: true
                            checked: true
                            background: Rectangle{
                                color: switch_splay.checked ? lightergreen : "white"
                                implicitWidth: 125
                                implicitHeight: 25
                            }
                            onClicked:{
                                fe_functions.toggleSplay()
                                datatext.text = fe_functions.getText();
                                timetxt.text = fe_functions.getTime();
                            }
                        }
                        Button{
                            id: switch_minheap
                            Text{
                                color: "black"
                                text: "Minheap"
                                leftPadding: 5
                                font.pointSize: 12
                                font.bold: true
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                            }
                            onClicked: {
                                fe_functions.toggleMin()
                                datatext.text = fe_functions.getText();
                                timetxt.text = fe_functions.getTime();
                            }

                            checkable: true
                            background: Rectangle{
                                color: switch_minheap.checked ? lightergreen : "white"
                                implicitWidth: switch_splay.implicitWidth
                                implicitHeight: switch_splay.implicitHeight
                            }
                        }
                    }

                    Rectangle{
                        width: 250; height: 30
                        color: lightgray
                        id: time_box
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom
                        MouseArea{
                            anchors.fill: parent
                        }
                        Text{
                            id: timetxt
                            leftPadding: 5
                            font.pointSize: 15
                            font.bold: true
                            text: fe_functions.getTime();
                        }
                    }

                    Rectangle{
                        height: 320
                        width: time_box.width
                        color: "white"
                        id: container
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom
                        MouseArea{
                            anchors.fill: parent
                        }
                        Text{
                            id: datatext
                            width: parent.width
                            rightPadding: 5
                            leftPadding: 5
                            topPadding: 5
                            font.pointSize: 12
                            text: fe_functions.getText()
                            wrapMode: Text.WordWrap
                        }
                    }
                    Row{
                        Button{
                            id: toggle_left
                            width:container.width/2
                            text: "<<"
                            font.bold: true
                            background: Rectangle{
                                color: lightgray
                            }
                            onClicked: {
                                fe_functions.toggleCounter(0);
                                datatext.text = fe_functions.getText();
                            }
                        }
                        Button{
                            id: toggle_right
                            width:container.width/2
                            text: ">>"
                            font.bold: true
                            background: Rectangle{
                                color: lightgray
                            }
                            onClicked: {
                                fe_functions.toggleCounter(1);
                                datatext.text = fe_functions.getText();
                            }
                        }
                    }
                }
            }
        }
    }

    Window{
        id: credits_window
        title: "Credits"
        visible: false
        width: 400
        height: 400
        minimumWidth: 400
        minimumHeight: 400
        maximumWidth: 400
        maximumHeight: 400
        TextArea{
            width: parent.width
            leftPadding: 5
                text: "Sources for all non-original resources are credited below.\n" +
                      "\nApp icon: \ncosmin4000/Getty Images/Alien\n" +
                      "\nUS Map clipart/buttons: \nGisGeography (https://gisgeography.com/state-outlines-blank-maps-united-states/)\n" +
                      "\nCity dataset (population, location data):\nSimpleMaps (https://simplemaps.com/data/us-cities)\n" +
                      "\nAlien encounter dataset: CORGIS (https://corgis-edu.github.io/corgis/json/ufo_sightings/)\n" +
                      "\n\nMade by: \n" +
                      "Pamela Wong (Frontend)\n" +
                      "Miaohan Lin (Data management, backend (minheap))\n" +
                      "Orion Borrell-Jones (Backend (splay tree))"
            selectByMouse: true
            readOnly: true
            wrapMode: Text.Wrap
        }
    }
}
