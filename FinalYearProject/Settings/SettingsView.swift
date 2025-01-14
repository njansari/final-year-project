//
//  SettingsView.swift
//  FinalYearProject
//

import NavigationAccessories
import SwiftUI

struct SettingsView: View {
    @Environment(\.isCompactHorizontal) private var isCompactHorizontal

    @SceneStorage("SettingsView.selectedItem") private var selectedItem: SettingsItem?

    @State private var totalWidth = 0.0

    var settingsList: some View {
        List(selection: isCompactHorizontal ? nil : $selectedItem) {
            Section {
                NavigationLink(value: SettingsItem.general) {
                    SettingsLinkLabel(SettingsItem.general.title, systemImage: SettingsItem.general.icon)
                }
                .tint(SettingsItem.general.tint)

                NavigationLink(value: SettingsItem.timetable) {
                    SettingsLinkLabel(SettingsItem.timetable.title, systemImage: SettingsItem.timetable.icon)
                }
                .tint(SettingsItem.timetable.tint)

                NavigationLink(value: SettingsItem.notifications) {
                    SettingsLinkLabel(SettingsItem.notifications.title, systemImage: SettingsItem.notifications.icon)
                }
                .tint(SettingsItem.notifications.tint)

                NavigationLink(value: SettingsItem.quickActions) {
                    SettingsLinkLabel(SettingsItem.quickActions.title, systemImage: SettingsItem.quickActions.icon)
                }
                .tint(SettingsItem.quickActions.tint)

                NavigationLink(value: SettingsItem.widgets) {
                    SettingsLinkLabel(SettingsItem.widgets.title, systemImage: SettingsItem.widgets.icon)
                }
                .tint(SettingsItem.widgets.tint)

                NavigationLink(value: SettingsItem.appleWatch) {
                    SettingsLinkLabel(SettingsItem.appleWatch.title, systemImage: SettingsItem.appleWatch.icon)
                }
                .tint(SettingsItem.appleWatch.tint)
            }

            Section {
                NavigationLink(value: SettingsItem.display) {
                    SettingsLinkLabel(SettingsItem.display.title, systemImage: SettingsItem.display.icon)
                }
                .tint(SettingsItem.display.tint)

                NavigationLink(value: SettingsItem.appIcon) {
                    SettingsLinkLabel(SettingsItem.appIcon.title, prefersStrokeBorder: true) {
                        Image(systemName: "hand.wave")
                            .resizable()
                            .scaledToFit()
                    }
                }
                .tint(SettingsItem.appIcon.tint)
            }

            Section {
                NavigationLink(value: SettingsItem.about) {
                    SettingsLinkLabel(SettingsItem.about.title, systemImage: SettingsItem.about.icon)
                }
                .tint(SettingsItem.about.tint)

                NavigationLink(value: SettingsItem.updates) {
                    SettingsLinkLabel(SettingsItem.updates.title, systemImage: SettingsItem.updates.icon)
                }
                .tint(SettingsItem.updates.tint)

                NavigationLink(value: SettingsItem.labs) {
                    SettingsLinkLabel(SettingsItem.labs.title, systemImage: SettingsItem.labs.icon)
                }
                .tint(SettingsItem.labs.tint)
            }

            Button("Sign Out", role: .destructive) {

            }
        }
        .listStyle(.insetGrouped)
        .navigationTitle("Settings")
        .navigationTitlesStyled()
        .navigationLargeTitleAccessoryView(alignsToBaseline: false) {
            Button("Show Profile", systemImage: "person.crop.circle") {

            }
            .font(.largeTitle)
            .labelStyle(.iconOnly)
        }
        .navigationAccessoriesTarget()
    }

    var body: some View {
        if isCompactHorizontal {
            NavigationStack {
                settingsList
                    .navigationDestination(for: SettingsItem.self) { item in
                        destination(for: item)
                    }
            }
        } else {
            NavigationSplitView(columnVisibility: .constant(.all), preferredCompactColumn: .constant(.sidebar)) {
                settingsList
                    .toolbar(removing: .sidebarToggle)
                    .navigationSplitViewColumnWidth(max(totalWidth * 1 / 3, 300))
            } detail: {
                if let selectedItem {
                    NavigationStack {
                        destination(for: selectedItem)
                            .detailScrollContentMargins()
                            .navigationTitlesStyled()
                            .navigationAccessoriesTarget()
                    }
                } else {
                    NoSelectionView()
                }
            }
            .navigationSplitViewStyle(.balanced)
            .onGeometryChange(for: Double.self) { geometry in
                geometry.size.width
            } action: { newValue in
                totalWidth = newValue
            }
            .onAppear {
                selectedItem ??= .general
            }
        }
    }

    @ViewBuilder func destination(for settingsItem: SettingsItem) -> some View {
        switch settingsItem {
        case .general:
            GeneralSettingsView()
        case .timetable:
            TimetableSettingsView()
        case .notifications:
            NotificationsSettingsView()
        case .quickActions:
            QuickActionsSettingsView()
        case .widgets:
            WidgetsSettingsView()
        case .appleWatch:
            AppleWatchSettingsView()
        case .display:
            DisplaySettingsView()
        case .appIcon:
            AppIconSettingsView()
        case .about:
            AboutSettingsView()
        case .updates:
            UpdatesSettingsView()
        case .labs:
            LabsSettingsView()
        }
    }
}

#Preview {
    SettingsView()
}
