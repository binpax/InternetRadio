import QtQuick 2.4
import Material 0.3
import Material.ListItems 0.1 as ListItem
import Qt.labs.settings 1.0

ApplicationWindow {
    id: demo

    title: "Material for QtQuick Demo"
    // Necessary when loading the window from C++
    visible: true

    theme {
        primaryColor: settings.primaryColor
        accentColor: settings.accentColor
        backgroundColor: settings.backgroundColor
    }

    initialPage: {"item": Qt.resolvedUrl("RadioList.qml"), "properties" : {"name" : "SigninPage"},"destroyOnPop":true}

    NavigationDrawer {
        id:navDrawer

        NavigationDrawerDelegate{
            id:navDelegateDrawer

            anchors.fill: parent
            objectName: "sidePanel"
        }
    }
    Settings {
        id: settings

        property string primaryColor: "blue"
        property string accentColor: "white"
        property string backgroundColor: "white"
    }
    Component.onDestruction: {
        settings.primaryColor = theme.primaryColor
        settings.accentColor = theme.accentColor
        settings.backgroundColor = theme.backgroundColor
    }
}
