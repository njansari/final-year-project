//
//  DisplaySettingsView.swift
//  FinalYearProject
//

import SwiftUI

struct DisplaySettingsView: View {
    @AppStorage(.accent) private var accent
    @AppStorage(.appearance) private var appearance
    @AppStorage(.headerStyle) private var headerStyle

    var body: some View {
        Form {
            Section("Appearance") {
                NavigationLink {
                    Form {
                        Picker("Light/Dark Mode", selection: $appearance) {
                            Text("Match System")
                                .tag(Appearance.system)

                            Divider()

                            Text("Light")
                                .tag(Appearance.light)

                            Text("Dark")
                                .tag(Appearance.dark)
                        }

                        Picker("Accent", selection: $accent) {
                            ForEach(Accent.allCases, id: \.self) { accent in
                                Label {
                                    Text(accent.name())
                                } icon: {
                                    Circle()
                                        .fill(accent.color)
                                        .frame(width: 34, height: 34)
                                }
                                .padding(.vertical, 2)
                            }
                        }
                        .pickerStyle(.inline)
                    }
                    .detailScrollContentMargins()
                    .navigationTitle("Theme")
                    .navigationBarTitleDisplayMode(.inline)
                } label: {
                    Text("Theme")
                        .badge(accent.name(for: appearance))
                }
            }

            Picker("Header Style", selection: $headerStyle) {
                Text("Default")
                    .tag(HeaderStyle.default)

                Text("Serif")
                    .fontDesign(HeaderStyle.serif.fontDesign)
                    .tag(HeaderStyle.serif)

                Text("Rounded")
                    .fontDesign(HeaderStyle.rounded.fontDesign)
                    .tag(HeaderStyle.rounded)

                Text("Monospaced")
                    .fontDesign(HeaderStyle.monospaced.fontDesign)
                    .tag(HeaderStyle.monospaced)

                Text("Expanded")
                    .fontWidth(HeaderStyle.expanded.fontWidth)
                    .tag(HeaderStyle.expanded)

                Text("Condensed")
                    .fontWidth(HeaderStyle.condensed.fontWidth)
                    .tag(HeaderStyle.condensed)
            }
            .pickerStyle(.inline)
        }
        .navigationTitle("Display")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    DisplaySettingsView()
}
