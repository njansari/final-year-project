//
//  TabItem.swift
//  FinalYearProject
//

enum TabItem: Int {
    case home
    case resources
    case alerts
    case search
    case settings

    var name: String {
        switch self {
        case .home:
            "Home"
        case .resources:
            "Resources"
        case .alerts:
            "Alerts"
        case .search:
            "Search"
        case .settings:
            "Settings"
        }
    }

    var icon: String {
        switch self {
        case .home:
            "home"
        case .resources:
            "square.grid.2x2"
        case .alerts:
            "bell"
        case .search:
            "magnifyingglass"
        case .settings:
            "gear"
        }
    }
}
