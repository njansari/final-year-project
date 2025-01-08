//
//  SettingsView.swift
//  FinalYearProject
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationSplitView {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .navigationTitle("Settings")
                .toolbar(removing: .sidebarToggle)
        } detail: {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    SettingsView()
}
