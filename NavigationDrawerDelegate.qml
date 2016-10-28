import QtQml.Models 2.2
import QtQuick 2.5
import Material 0.3
import QtQuick.Window 2.0
import QtQuick.Layouts 1.2
import Material.ListItems 0.1 as ListItem

Rectangle{

    Image{
        id: sidebar_rct

        height:  parent.height/3
        //clip:true
        source:"qrc:/Mplayer/flat,800x800,075,f.jpg"
        anchors{
            top: parent.top
            left: parent.left
            right: parent.right
        }
        Label {
            id: accountName

            style: "title"
            color : "white"
            text:"Version 0.1 Beta"
            anchors{
                verticalCenter:  sidebar_rct.verticalCenter
                left: sidebar_rct.left
                leftMargin: sidebar_rct.width*0.1
            }
        }

        Label {
            id:version

            style: "body2"
            color : "white"
            text:"en cours d'amelioration \nstay tunned."
            width: sidebar_rct.width
            wrapMode: Text.WordWrap

            anchors{
                bottom: sidebar_rct.bottom
                bottomMargin: Units.dp*10
                left: parent.left
                leftMargin: Units.dp*5
            }
        }
    }

    View {
        anchors{
            top:sidebar_rct.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }

        ListView {
            anchors.fill: parent
            clip: true
            model:sideBarModel
            //footer: disconnectComponent
        }
    }
    /*
    Component{
        id:disconnectComponent
        ListItem.Standard {
            id: disconnectListItem

            text: qsTr("Déconnexion")
            action: Icon {
                anchors.centerIn: parent
                name: "action/logout"
                //size: dp(Defines_values.Default_iconsize)
            }

            onClicked:{
            }
        }
    }
*/
    ObjectModel{
        id:sideBarModel
        ListItem.Standard {
            id: commingsoon

            text: qsTr("Coming Soon ...")


            action: Icon {
                anchors.centerIn: parent
                //qname: "av/fiber_smart_record"
                //size: dp(Defines_values.Default_iconsize)
            }

            onClicked:{
            }
        }
        ListItem.Standard {
            id: ambListItem

            text: qsTr("Enregistrement")


            action: Icon {
                anchors.centerIn: parent
                name: "av/fiber_smart_record"
                //size: dp(Defines_values.Default_iconsize)
            }

            onClicked:{
            }
        }
        ListItem.Standard {
            id: accountListItem

            text: qsTr("radios International")
            action: Icon {
                anchors.centerIn: parent
                name: "av/radio"
                //size: dp(Defines_values.Default_iconsize)
            }

            onClicked:{
            }
        }
    }

    Component.onCompleted: {

    }
}
