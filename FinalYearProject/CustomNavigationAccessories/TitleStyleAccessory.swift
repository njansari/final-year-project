//
//  TitleStyleAccessory.swift
//  FinalYearProject
//

import NavigationAccessories
import SwiftUI

extension UIFont {
    class func titleFont(
        withTextStyle textStyle: TextStyle,
        design: UIFontDescriptor.SystemDesign?,
        weight: Weight,
        width: Width?
    ) -> UIFont {
        let fontSize = UIFontDescriptor.preferredFontDescriptor(withTextStyle: textStyle).pointSize
        var font = systemFont(ofSize: fontSize, weight: weight, width: width ?? .standard)

        if let design, let descriptor = font.fontDescriptor.withDesign(design) {
            font = .init(descriptor: descriptor, size: fontSize)
        }

        return font
    }
}

struct TitleStyleAccessory: NavigationAccessory {
    let id = "TitleStyleAccessory"
    let style: HeaderStyle

    func update(in viewController: UIViewController, reason: NavigationAccessoryUpdateReason) {
        let navigationBar = viewController.navigationController?.navigationBar

        switch reason {
        case .added, .modified:
            navigationBar?.standardAppearance.largeTitleTextAttributes = [
                .font: UIFont.titleFont(
                    withTextStyle: .largeTitle,
                    design: style.uiFontDesign,
                    weight: .bold,
                    width: style.uiFontWidth
                )
            ]

            navigationBar?.standardAppearance.titleTextAttributes = [
                .font: UIFont.titleFont(
                    withTextStyle: .headline,
                    design: style.uiFontDesign,
                    weight: .semibold,
                    width: style.uiFontWidth
                )
            ]

        case .removed:
            navigationBar?.standardAppearance.largeTitleTextAttributes = [:]
            navigationBar?.standardAppearance.titleTextAttributes = [:]
        }
    }
}

struct TitleStyleModifier: ViewModifier {
    @AppStorage(.headerStyle) private var headerStyle

    func body(content: Content) -> some View {
        content.navigationAccessory(TitleStyleAccessory(style: headerStyle))
    }
}

extension View {
    func navigationTitlesStyled() -> some View {
        modifier(TitleStyleModifier())
    }
}
