//
//  AlertsView.swift
//  FinalYearProject
//

import SwiftUI

struct AlertsView: View {
    var body: some View {
        NavigationSplitView {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .navigationTitle("Alerts")
                .toolbar(removing: .sidebarToggle)
        } detail: {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    AlertsView()
}
