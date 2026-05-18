pragma ComponentBehavior: Bound

import QtQuick
import org.kde.kirigami as Kirigami
import org.kde.kirigamiaddons.formcard as FormCard

FormCard.FormCardPage {
    id: root
    title: i18nc("@title:window", "Settings")

    FormCard.FormHeader {
        title: i18nc("@title:group", "General")
    }

    FormCard.FormCard {
        FormCard.FormSwitchDelegate {
            id: autostartEnabled
            text: i18nc("@label:switch", "Automatically start application on login")
            checkable: true
            checked: frontendManager.autostartEnabled
            onToggled: frontendManager.autostartEnabled = checked
        }

        FormCard.FormSwitchDelegate {
            id: virtualSurroundAutoEnabled
            text: i18nc("@label:switch", "Automatically enable virtual surround sound")
            checkable: true
            checked: frontendManager.virtualSurroundAutoEnabled
            onToggled: frontendManager.virtualSurroundAutoEnabled = checked
        }

        FormCard.FormComboBoxDelegate {
            id: startupSetting
            text: i18nc("@label:combobox", "Application behavior")
            description: i18nc("@info:description", "How the application should start and run.")
            displayMode: FormCard.FormComboBoxDelegate.ComboBox
            editable: false
            textRole: "label"
            valueRole: "key"
            model: [
                {
                    label: i18nc("@option", "Default"),
                    key: "default"
                },
                {
                    label: i18nc("@option", "Show system tray icon"),
                    key: "showTray"
                },
                {
                    label: i18nc("@option", "Show system tray icon & hide window"),
                    key: "showTrayHideWindow"
                }
            ]
            Component.onCompleted: currentIndex = indexOfValue(frontendManager.startupSetting)
            onCurrentTextChanged: frontendManager.startupSetting = currentText
        }
    }
}
