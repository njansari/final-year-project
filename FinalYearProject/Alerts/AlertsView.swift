//
//  AlertsView.swift
//  FinalYearProject
//

import SwiftUI

struct AlertsView: View {
    @State private var totalWidth = 0.0

    var body: some View {
        NavigationSplitView(columnVisibility: .constant(.all), preferredCompactColumn: .constant(.sidebar)) {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .navigationTitle("Alerts")
                .toolbar(removing: .sidebarToggle)
                .navigationSplitViewColumnWidth(totalWidth * 1 / 3)
        } detail: {
            Text("Detail")
        }
        .navigationSplitViewStyle(.balanced)
        .onGeometryChange(for: Double.self) { geometry in
            geometry.size.width
        } action: { newValue in
            totalWidth = newValue
        }
    }
}

#Preview {
    AlertsView()
}
