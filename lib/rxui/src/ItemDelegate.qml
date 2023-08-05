import QtQuick
import QtQuick.Templates as T
import QtQuick.Controls.impl
import RxUI

T.ItemDelegate {
    id: control

    bottomPadding: padding + 1
    icon.color: Color.transparent(Style.palette.buttonText, enabled ? 1.0 : 0.2)
    icon.height: 16
    icon.width: 16
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset, implicitContentHeight + topPadding + bottomPadding, implicitIndicatorHeight + topPadding + bottomPadding)
    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset, implicitContentWidth + leftPadding + rightPadding)
    padding: 12
    spacing: 12
    topPadding: padding - 1

    background: Rectangle {
        color: !control.enabled ? Color.transparent(Style.palette.text, 0.2) : control.down ? Style.palette.dark : control.highlighted ? Style.palette.mid : "transparent"
        implicitHeight: 36
        implicitWidth: 200

        Behavior on color  {
            ColorAnimation {
                duration: 120
            }
        }

        Rectangle {
            color: Style.palette.highlight
            height: parent.height - 2
            opacity: 0.5
            visible: control.visualFocus
            width: parent.width - 2
            x: 1
            y: 1
        }
    }
    contentItem: IconLabel {
        readonly property real arrowPadding: control.subMenu && control.arrow ? control.arrow.width + control.spacing : 0
        readonly property real indicatorPadding: control.checkable && control.indicator ? control.indicator.width + control.spacing : 0

        alignment: Qt.AlignLeft
        color: !control.enabled ? Color.transparent(Style.palette.text, 0.6) : Style.palette.text
        display: control.display
        font: control.font
        icon: control.icon
        leftPadding: !control.mirrored ? indicatorPadding : arrowPadding
        mirrored: control.mirrored
        rightPadding: control.mirrored ? indicatorPadding : arrowPadding
        spacing: control.spacing
        text: control.text
    }
}