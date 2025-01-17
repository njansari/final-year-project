//
//  NoSelectionView.swift
//  FinalYearProject
//

import SwiftUI

struct NoSelectionView: View {
    var body: some View {
        ContentUnavailableView {
            Text("No Selection")
                .appHeader()
        } description: {
            Text("Select an item from the list.")
        }
    }
}

#Preview {
    NoSelectionView()
}
