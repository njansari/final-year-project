//
//  SettingsItem.swift
//  FinalYearProject
//

import struct SwiftUI.Color

enum SettingsItem: Int, Codable {
    case general
    case timetable
    case notifications
    case quickActions
    case widgets
    case appleWatch

    case display
    case appIcon

    case about
    case updates
    case labs

    var title: String {
        switch self {
        case .general:
            "General"
        case .timetable:
            "Timetable"
        case .notifications:
            "Notifications"
        case .quickActions:
            "Quick Actions"
        case .widgets:
            "Widgets"
        case .appleWatch:
            "Apple Watch"
        case .display:
            "Display"
        case .appIcon:
            "App Icon"
        case .about:
            "About"
        case .updates:
            "Updates"
        case .labs:
            "Labs"
        }
    }

    var icon: String! {
        switch self {
        case .general:
            "gear"
        case .timetable:
            "calendar.badge.clock"
        case .notifications:
            "bell.badge"
        case .quickActions:
            "bolt"
        case .widgets:
            "widget.small"
        case .appleWatch:
            "applewatch"
        case .display:
            "textformat.size"
        case .appIcon:
            nil
        case .about:
            "info.circle"
        case .updates:
            "arrow.2.circlepath"
        case .labs:
            "flask"
        }
    }

    var tint: Color {
        switch self {
        case .general:
            .gray
        case .timetable:
            .orange
        case .notifications:
            .red
        case .quickActions:
            .blue
        case .widgets:
            .teal
        case .appleWatch:
            .primary
        case .display:
            .pink
        case .appIcon:
            .clear
        case .about:
            .indigo
        case .updates:
            .green
        case .labs:
            .purple
        }
    }
}
