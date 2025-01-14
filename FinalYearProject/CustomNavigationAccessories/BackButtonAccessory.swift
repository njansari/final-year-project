//
//  BackButtonAccessory.swift
//  FinalYearProject
//

import NavigationAccessories
import SwiftUI

struct BackButtonAccessory: NavigationAccessory {
    let id = "BackButtonAccessory"

    let title: String?

    func update(in viewController: UIViewController, reason: NavigationAccessoryUpdateReason) {
        switch reason {
        case .added, .modified:
            viewController.navigationItem.backButtonTitle = title
        case .removed:
            viewController.navigationItem.backButtonTitle = nil
        }
    }
}

extension View {
    func navigationBackButtonTitle(_ title: String?) -> some View {
        navigationAccessory(BackButtonAccessory(title: title))
    }
}
