//
//  SearchView.swift
//  FinalYearProject
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""

    var body: some View {
        NavigationStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .navigationTitle("Search")
                .searchable(
                    text: $searchText,
                    placement: .navigationBarDrawer(displayMode: .always),
                    prompt: "Campus, Events, Resources and More"
                )
        }
    }
}

#Preview {
    SearchView()
}
