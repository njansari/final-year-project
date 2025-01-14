//
//  Accent.swift
//  FinalYearProject
//

import struct SwiftUI.Color

enum Accent: Int, CaseIterable {
    case blue
    case gold
    case green
    case indigo
    case pink
    case primary
    case purple
    case red
    case tan
    case violet

    var color: Color {
        switch self {
        case .blue:
            .lboroBlue
        case .gold:
            .lboroGold
        case .green:
            .lboroGreen
        case .indigo:
            .lboroIndigo
        case .pink:
            .lboroPink
        case .primary:
            .lboroPrimary
        case .purple:
            .lboroPurple
        case .red:
            .lboroRed
        case .tan:
            .lboroTan
        case .violet:
            .lboroViolet
        }
    }

    func name(for appearance: Appearance? = nil) -> String {
        switch (self, appearance) {
        case (.blue, nil):
            "Cerulean"
        case (.blue, .system):
            "Standard Cerulean"
        case (.blue, .light):
            "Bright Cerulean"
        case (.blue, .dark):
            "Midnight Cerulean"

        case (.gold, nil):
            "Dazzle"
        case (.gold, .system):
            "Elegant Dazzle"
        case (.gold, .light):
            "Bright Dazzle"
        case (.gold, .dark):
            "Gleaming Dazzle"

        case (.green, nil):
            "Moss"
        case (.green, .system):
            "Classic Moss"
        case (.green, .light):
            "Vibrant Moss"
        case (.green, .dark):
            "Deep Moss"

        case (.indigo, nil):
            "Nightshade"
        case (.indigo, .system):
            "True Nightshade"
        case (.indigo, .light):
            "Vivid Nightshade"
        case (.indigo, .dark):
            "Rich Nightshade"

        case (.pink, nil):
            "Fuchsia"
        case (.pink, .system):
            "Classic Fuchsia"
        case (.pink, .light):
            "Bright Fuchsia"
        case (.pink, .dark):
            "Deep Fuchsia"

        case (.primary, nil):
            "Eclipse"
        case (.primary, .system):
            "Classic Eclipse"
        case (.primary, .light):
            "Shadow Eclipse"
        case (.primary, .dark):
            "Lumina Eclipse"

        case (.purple, nil):
            "Mystic"
        case (.purple, .system):
            "Classis Mystic"
        case (.purple, .light):
            "Luminous Mystic"
        case (.purple, .dark):
            "Shadow Mystic"

        case (.red, nil):
            "Crimson"
        case (.red, .system):
            "Standard Crimson"
        case (.red, .light):
            "Vivid Crimson"
        case (.red, .dark):
            "Bold Crimson"

        case (.tan, nil):
            "Biscuit"
        case (.tan, .system):
            "Netral Biscuit"
        case (.tan, .light):
            "Warm Biscuit"
        case (.tan, .dark):
            "Subtle Biscuit"

        case (.violet, nil):
            "Lavish"
        case (.violet, .system):
            "Timeless Lavish"
        case (.violet, .light):
            "Bright Lavish"
        case (.violet, .dark):
            "Deep Lavish"
        }
    }

    static let allCases: [Accent] = [
        .purple, .violet, .indigo, .blue, .green, .gold, .tan, .pink, .red, .primary
    ]
}

extension Setting where Value == Accent {
    static var accent: Setting {
        Setting(key: "Setting.accent", defaultValue: .purple)
    }
}
