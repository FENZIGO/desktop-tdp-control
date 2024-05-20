import QtQuick 2.6
import QtQuick.Layouts 1.1
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 3.0 as PlasmaComponents3



ColumnLayout {
    
  
    PlasmaCore.DataSource {
        id: execute
        engine: "executable"
        connectedSources: []
        onNewData: disconnectSource(sourceName)

        function run(command) {
            execute.connectSource(command)
        }
    }
   
// tdp
    RowLayout {
        PlasmaComponents3.Label {
            id: tdpLabel
            text: i18n("Set Max TDP:")
            
        }
        PlasmaComponents3.Slider {
            id: tdpSlider
            Layout.fillWidth: true
            from: 3
            to: 15
            value: 10
            stepSize: 1
            
        }
        PlasmaComponents3.Label {
            id: tdpSliderValueLabel
            function formatText(value) {
                return i18n("%1W", value)
            }
            text: formatText(tdpSlider.value)
            Layout.minimumWidth: textMetrics.width
            
        }
        
        PlasmaComponents3.Button {
        text: i18n("Apply")
        
        onClicked: {
            runCommand1()
            }
        }
    }

// temp
    RowLayout {
    visible: plasmoid.configuration.tempCheckbox

        PlasmaComponents3.Label {
            id: tempLabel
            text: i18n("Set Max Temp:")
            
        }
        PlasmaComponents3.Slider {
            id: tempSlider
            Layout.fillWidth: true
            from: 45
            to: 90
            value: 80
            stepSize: 5
            
        }
        PlasmaComponents3.Label {
            id: tempSliderValueLabel
            function formatText(value) {
                return i18n("%1°C", value)
            }
            text: formatText(tempSlider.value)
            Layout.minimumWidth: textMetrics.width
            
        }
        PlasmaComponents3.Button {
        text: i18n("Apply")
        
        onClicked: {
            runCommand2()
            }
        }
    }

// preset
    RowLayout {
        Layout.alignment: Qt.AlignHCenter
        anchors.horizontalCenter: parent.horizontalCenter

        PlasmaComponents3.Button {
        visible: plasmoid.configuration.preset1Checkbox    
        text: i18n(plasmoid.configuration.preset1Name)
        onClicked: {
            runCommand3()
            }
        }
        PlasmaComponents3.Button {
        visible: plasmoid.configuration.preset1Checkbox && plasmoid.configuration.preset2Checkbox 
        text: i18n(plasmoid.configuration.preset2Name)
        onClicked: {
            runCommand4()
            }
        }
    }

    function runCommand1() {
        
            let value = tdpSlider.value;
            let command = `konsole -e sudo bash -c "$HOME/.local/share/plasma/plasmoids/metadata/contents/libs/ryzenadj --stapm-limit=${value}000 --fast-limit=${value}000 --slow-limit=${value}000; read -p 'Press any key to continue...'"`;
            execute.run(command);
            } 
    function runCommand2() {
        
            let value = tempSlider.value;
            let command = `konsole -e sudo bash -c "$HOME/.local/share/plasma/plasmoids/metadata/contents/libs/ryzenadj --tctl-temp=${value}; read -p 'Press any key to continue...'"`;
            execute.run(command);
            }      
    function runCommand3() {
        
            let value = plasmoid.configuration.preset1String;
            let command = `konsole -e sudo bash -c "$HOME/.local/share/plasma/plasmoids/metadata/contents/libs/ryzenadj ${value}; read -p 'Press any key to continue...'"`;
            execute.run(command);
            }        
    function runCommand4() {
        
            let value = plasmoid.configuration.preset2String;
            let command = `konsole -e sudo bash -c "$HOME/.local/share/plasma/plasmoids/metadata/contents/libs/ryzenadj ${value}; read -p 'Press any key to continue...'"`;
            execute.run(command);
            }   
}
    

