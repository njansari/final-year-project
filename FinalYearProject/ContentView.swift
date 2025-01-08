//
//  ContentView.swift
//  FinalYearProject
//

import SwiftUI

struct ContentView: View {
    @SceneStorage("selectedTab") private var selectedTab: TabItem = .home

    var body: some View {
        TabView(selection: $selectedTab) {
            Tab(TabItem.home.name, image: TabItem.home.icon, value: TabItem.home) {
                HomeView()
            }

            Tab(TabItem.resources.name, systemImage: TabItem.resources.icon, value: TabItem.resources) {
                ResourcesView()
            }

            Tab(TabItem.alerts.name, systemImage: TabItem.alerts.icon, value: TabItem.alerts) {
                AlertsView()
            }

            Tab(TabItem.search.name, systemImage: TabItem.search.icon, value: TabItem.search, role: .search) {
                SearchView()
            }

            Tab(TabItem.settings.name, systemImage: TabItem.settings.icon, value: TabItem.settings) {
                SettingsView()
            }
        }
    }
}

#Preview {
    ContentView()
}
