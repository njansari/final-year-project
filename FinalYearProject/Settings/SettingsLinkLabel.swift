//
//  SettingsLinkLabel.swift
//  FinalYearProject
//

import SwiftUI

struct SettingsLinkLabel<Icon: View>: View {
    @Environment(\.colorScheme) private var colorScheme

    let title: String
    let icon: Icon

    let strokeBorder: Bool?

    init(_ title: String, systemImage: String, prefersStrokeBorder: Bool? = nil) where Icon == Image {
        self.title = title
        self.icon = Image(systemName: systemImage)
        self.strokeBorder = prefersStrokeBorder
    }

    init(_ title: String, image: String, prefersStrokeBorder: Bool? = nil) where Icon == Image {
        self.title = title
        self.icon = Image(image)
        self.strokeBorder = prefersStrokeBorder
    }

    init(_ title: String, prefersStrokeBorder: Bool? = nil, icon: () -> Icon) {
        self.title = title
        self.icon = icon()
        self.strokeBorder = prefersStrokeBorder
    }

    var foregroundStyle: some ShapeStyle {
        switch colorScheme {
        case .dark:
            AnyShapeStyle(.tint)
        default:
            AnyShapeStyle(.white)
        }
    }

    var background: some ShapeStyle {
        switch colorScheme {
        case .dark:
            AnyShapeStyle(
                .linearGradient(
                    colors: [
                        Color(red: 49 / 255, green: 49 / 255, blue: 49 / 255),
                        Color(red: 21 / 255, green: 21 / 255, blue: 21 / 255)
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
        default:
            AnyShapeStyle(.tint)
        }
    }

    var body: some View {
        Label {
            Text(title)
        } icon: {
            ZStack {
                Rectangle()
                    .fill(background)

                icon
                    .symbolVariant(.fill)
                    .font(.system(size: 12, weight: .medium))
                    .foregroundStyle(foregroundStyle)
            }
            .frame(width: 28, height: 28)
            .clipShape(.rect(cornerRadius: 5))
            .overlay(
                .gray.secondary.opacity(strokeBorder ?? (colorScheme == .dark) ? 1 : 0),
                in: .rect(cornerRadius: 5).stroke(lineWidth: 0.5)
            )
            .accessibilityHidden(true)
        }
    }
}

#Preview {
    SettingsLinkLabel("Title", systemImage: "hand.wave")
}
