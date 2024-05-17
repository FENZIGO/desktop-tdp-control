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

    RowLayout {
        PlasmaComponents3.Label {
            id: tdp_label
            text: i18n("Set Max TDP:")
            
        }
        PlasmaComponents3.Slider {
            id: slider
            Layout.fillWidth: true
            from: 3
            to: 15
            value: 10
            stepSize: 1
            
        }
        PlasmaComponents3.Label {
            id: sliderValueLabel
            function formatText(value) {
                return i18n("%1W", value)
            }
            text: formatText(slider.value)
            Layout.minimumWidth: textMetrics.width
            
        }
        PlasmaComponents3.Button {
        text: i18n("Apply")
        
        onClicked: {
            runCommand1()
            }
        }
    }
     
    function runCommand1() {
        
            let value = slider.value;
            let command = `konsole -e sudo bash -c "$HOME/.local/share/plasma/plasmoids/metadata/contents/libs/ryzenadj --stapm-limit=${value}000 --fast-limit=${value}000 --slow-limit=${value}000; read -p 'Press any key to continue...'"`;
            execute.run(command);
            } 
            
            
}
    

