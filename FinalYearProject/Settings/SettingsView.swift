//
//  SettingsView.swift
//  FinalYearProject
//

import SwiftUI

struct SettingsView: View {
    @SceneStorage("SettingsView.selectedItem") private var selectedItem: SettingsItem?

    @State private var totalWidth = 0.0

    var body: some View {
        NavigationSplitView(columnVisibility: .constant(.all), preferredCompactColumn: .constant(.sidebar)) {
            List(selection: $selectedItem) {
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
            .toolbar(removing: .sidebarToggle)
            .navigationSplitViewColumnWidth(totalWidth * 1 / 3)
        } detail: {
            if let selectedItem {
                Form {
                    Text("Detail")
                        .foregroundStyle(selectedItem.tint)
                }
                .navigationTitle(selectedItem.title)
                .navigationBarTitleDisplayMode(.inline)
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

infix operator ??= : AssignmentPrecedence

extension Optional {
    static func ??= (lhs: inout Self, rhs: Wrapped) {
        if lhs == nil {
            lhs = rhs
        }
    }
}

#Preview {
    SettingsView()
}
