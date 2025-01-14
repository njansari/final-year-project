//
//  HomeView.swift
//  FinalYearProject
//

import NavigationAccessories
import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            NavigationLink(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/) {

            }
            .navigationTitle("Home")
            .navigationTitlesStyled()
            .navigationWeeTitle(Date.now.formatted(.dateTime.day().weekday(.wide).month()))
            .navigationLargeTitleAccessoryView(alignsToBaseline: false) {
                Button("Show Profile", systemImage: "person.crop.circle") {

                }
                .font(.largeTitle)
                .labelStyle(.iconOnly)
            }
            .navigationAccessoriesTarget()
        }
    }
}

#Preview {
    HomeView()
}
