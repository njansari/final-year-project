//
//  HeaderStyle.swift
//  FinalYearProject
//

import SwiftUI

enum HeaderStyle: Int {
    case `default`
    case serif
    case rounded
    case monospaced
    case expanded
    case condensed

    var fontDesign: Font.Design {
        switch self {
        case .serif:
            .serif
        case .rounded:
            .rounded
        case .monospaced:
            .monospaced
        default:
            .default
        }
    }

    var fontWidth: Font.Width {
        switch self {
        case .expanded:
            .expanded
        case .condensed:
            .condensed
        default:
            .standard
        }
    }

    var uiFontDesign: UIFontDescriptor.SystemDesign? {
        switch self {
        case .serif:
            .serif
        case .rounded:
            .rounded
        case .monospaced:
            .monospaced
        default:
            nil
        }
    }

    var uiFontWidth: UIFont.Width? {
        switch self {
        case .expanded:
            .expanded
        case .condensed:
            .condensed
        default:
            nil
        }
    }
}

extension Setting where Value == HeaderStyle {
    static var headerStyle: Setting {
        Setting(key: "Setting.headerStyle", defaultValue: .default)
    }
}
