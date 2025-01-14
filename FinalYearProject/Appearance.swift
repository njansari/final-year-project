//
//  Appearance.swift
//  FinalYearProject
//

import enum UIKit.UIUserInterfaceStyle

enum Appearance: Int {
    case system
    case light
    case dark

    var interfaceStyle: UIUserInterfaceStyle {
        switch self {
        case .system:
            .unspecified
        case .light:
            .light
        case .dark:
            .dark
        }
    }
}

extension Setting where Value == Appearance {
    static var appearance: Setting {
        Setting(key: "Setting.appearance", defaultValue: .system)
    }
}
