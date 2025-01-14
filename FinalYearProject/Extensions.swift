//
//  Extensions.swift
//  FinalYearProject
//

import SwiftUI

infix operator ??= : AssignmentPrecedence

extension Optional {
    static func ??= (lhs: inout Self, rhs: Wrapped) {
        if lhs == nil {
            lhs = rhs
        }
    }
}

extension EnvironmentValues {
    var isCompactHorizontal: Bool {
        horizontalSizeClass == .compact
    }
}

struct HeaderStyleModifier: ViewModifier {
    @AppStorage(.headerStyle) private var headerStyle

    func body(content: Content) -> some View {
        content
            .fontDesign(headerStyle.fontDesign)
            .fontWidth(headerStyle.fontWidth)
    }
}

extension View {
    func appHeader() -> some View {
        modifier(HeaderStyleModifier())
    }
}

struct DetailMarginsModifier: ViewModifier {
    @Environment(\.isCompactHorizontal) private var isCompactHorizontal

    @State private var totalWidth = 0.0

    func body(content: Content) -> some View {
        content
            .contentMargins(.horizontal, isCompactHorizontal ? nil : max(totalWidth / 8, 16), for: .scrollContent)
            .onGeometryChange(for: Double.self) { geometry in
                geometry.size.width
            } action: { newValue in
                totalWidth = newValue
            }
    }
}

extension View {
    func detailScrollContentMargins() -> some View {
        modifier(DetailMarginsModifier())
    }
}

extension Color {
    func associatedForeground(in environment: EnvironmentValues) -> Color {
        let resolved = resolve(in: environment)
        let luminance = 0.299 * resolved.red + 0.587 * resolved.green + 0.114 * resolved.blue
        return luminance > 0.5 ? .black : .white
    }
}
