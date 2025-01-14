//
//  ContentView.swift
//  FinalYearProject
//

import SwiftUI

struct ContentView: View {
    @AppStorage(.accent) private var accent
    @AppStorage(.appearance) private var appearance

    @SceneStorage("ContentView.selectedTab") private var selectedTab: TabItem = .home

    @Environment(\.horizontalSizeClass) private var horizontalSizeClass

    var body: some View {
        TabView(selection: $selectedTab) {
            Tab(TabItem.home.name, image: TabItem.home.icon, value: TabItem.home) {
                HomeView()
                    .environment(\.horizontalSizeClass, horizontalSizeClass)
            }

            Tab(TabItem.resources.name, systemImage: TabItem.resources.icon, value: TabItem.resources) {
                ResourcesView()
                    .environment(\.horizontalSizeClass, horizontalSizeClass)
            }

            Tab(TabItem.alerts.name, systemImage: TabItem.alerts.icon, value: TabItem.alerts) {
                AlertsView()
                    .environment(\.horizontalSizeClass, horizontalSizeClass)
            }

            Tab(TabItem.search.name, systemImage: TabItem.search.icon, value: TabItem.search, role: .search) {
                SearchView()
                    .environment(\.horizontalSizeClass, horizontalSizeClass)
            }

            Tab(TabItem.settings.name, systemImage: TabItem.settings.icon, value: TabItem.settings) {
                SettingsView()
                    .environment(\.horizontalSizeClass, horizontalSizeClass)
            }
        }
        .tint(accent.color)
        .preferredColorScheme(.init(appearance.interfaceStyle))
        .environment(\.horizontalSizeClass, .compact)
    }
}

#Preview {
    ContentView()
}
