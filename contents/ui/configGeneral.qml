

import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import org.kde.kirigami 2.4 as Kirigami


Item {
    id: page
  
    
    property alias cfg_tempCheckbox: tempCheckbox.checked
    property alias cfg_preset1Checkbox: preset1Checkbox.checked
    property alias cfg_preset2Checkbox: preset2Checkbox.checked
    property alias cfg_preset1String: preset1String.text
    property alias cfg_preset2String: preset2String.text
    property alias cfg_preset1Name: preset1Name.text
    property alias cfg_preset2Name: preset2Name.text

    Kirigami.FormLayout {
        anchors.left: parent.left
        anchors.right: parent.right

        CheckBox {
            id: tempCheckbox
            Kirigami.FormData.label: i18n("Limit by temp:")           
        }


        CheckBox {
            id: preset1Checkbox
            Kirigami.FormData.label: i18n("Preset shortcut:")
        }
        ColumnLayout {
            visible: preset1Checkbox.checked
            
            TextField {
            id: preset1Name                     
            placeholderText: i18n("Your preset name...")          
            } 
            RowLayout {
            TextField {
            id: preset1String           
            placeholderText: i18n("--tctl-temp=80 --apu-slow-limit=15000")          
            }  
            Button {
            text: i18n("List")
            onClicked: usageDialog.open()
            }
            }  
        }


        CheckBox {
            visible: preset1Checkbox.checked
            id: preset2Checkbox
            Kirigami.FormData.label: i18n("Preset shortcut:")
        }
        ColumnLayout {
            visible: preset1Checkbox.checked && preset2Checkbox.checked
            TextField {
            id: preset2Name 
            placeholderText: i18n("Your preset name...")          
            }
            TextField {
            id: preset2String            
            placeholderText: i18n("--tctl-temp=80 --apu-slow-limit=15000")          
            }
        }

        
        
    }

    Dialog {
        id: usageDialog
        title: i18n("Settings")
        modal: true
        width: 700
        height: 400

        ScrollView {
            anchors.fill: parent
            // horizontalScrollBarPolicy: ScrollBar.AlwaysOn
            TextArea {
                id: settingsTextArea
                readOnly: true
                wrapMode: TextEdit.Wrap
                text: "Example: --tctl-temp=80 --apu-slow-limit=15000  \n" +
                      "    -a, --stapm-limit=<u32>               Sustained Power Limit         - STAPM LIMIT (mW)\n" +
                      "    -b, --fast-limit=<u32>                Actual Power Limit            - PPT LIMIT FAST (mW)\n" +
                      "    -c, --slow-limit=<u32>                Average Power Limit           - PPT LIMIT SLOW (mW)\n" +
                      "    -d, --slow-time=<u32>                 Slow PPT Constant Time (s)\n" +
                      "    -e, --stapm-time=<u32>                STAPM constant time (s)\n" +
                      "    -f, --tctl-temp=<u32>                 Tctl Temperature Limit (degree C)\n" +
                      "    -g, --vrm-current=<u32>               VRM Current Limit             - TDC LIMIT VDD (mA)\n" +
                      "    -j, --vrmsoc-current=<u32>            VRM SoC Current Limit         - TDC LIMIT SoC (mA)\n" +
                      "    -k, --vrmmax-current=<u32>            VRM Maximum Current Limit     - EDC LIMIT VDD (mA)\n" +
                      "    -l, --vrmsocmax-current=<u32>         VRM SoC Maximum Current Limit - EDC LIMIT SoC (mA)\n" +
                      "    -m, --psi0-current=<u32>              PSI0 VDD Current Limit (mA)\n" +
                      "    -n, --psi0soc-current=<u32>           PSI0 SoC Current Limit (mA)\n" +
                      "    -o, --max-socclk-frequency=<u32>      Maximum SoC Clock Frequency (MHz)\n" +
                      "    -p, --min-socclk-frequency=<u32>      Minimum SoC Clock Frequency (MHz)\n" +
                      "    -q, --max-fclk-frequency=<u32>        Maximum Transmission (CPU-GPU) Frequency (MHz)\n" +
                      "    -r, --min-fclk-frequency=<u32>        Minimum Transmission (CPU-GPU) Frequency (MHz)\n" +
                      "    -s, --max-vcn=<u32>                   Maximum Video Core Next (VCE - Video Coding Engine) (MHz)\n" +
                      "    -t, --min-vcn=<u32>                   Minimum Video Core Next (VCE - Video Coding Engine) (MHz)\n" +
                      "    -u, --max-lclk=<u32>                  Maximum Data Launch Clock (MHz)\n" +
                      "    -v, --min-lclk=<u32>                  Minimum Data Launch Clock (MHz)\n" +
                      "    -w, --max-gfxclk=<u32>                Maximum GFX Clock (MHz)\n" +
                      "    -x, --min-gfxclk=<u32>                Minimum GFX Clock (MHz)\n" +
                      "    -y, --prochot-deassertion-ramp=<u32>  Ramp Time After Prochot is Deasserted: limit power based on value, higher values does apply tighter limits after prochot is over\n" +
                      "    --apu-skin-temp=<u32>                 APU Skin Temperature Limit    - STT LIMIT APU (degree C)\n" +
                      "    --dgpu-skin-temp=<u32>                dGPU Skin Temperature Limit   - STT LIMIT dGPU (degree C)\n" +
                      "    --apu-slow-limit=<u32>                APU PPT Slow Power limit for A+A dGPU platform - PPT LIMIT APU (mW)\n" +
                      "    --skin-temp-limit=<u32>               Skin Temperature Power Limit (mW)\n" +
                      "    --power-saving                        Hidden options to improve power efficiency (is set when AC unplugged): behavior depends on CPU generation, Device and Manufacture\n" +
                      "    --max-performance                     Hidden options to improve performance (is set when AC plugged in): behavior depends on CPU generation, Device and Manufacture"
            }
        }
    }

}
