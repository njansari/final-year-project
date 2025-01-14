//
//  Settings.swift
//  FinalYearProject
//

import SwiftUI

struct Setting<Value> {
    let key: String
    let defaultValue: Value
}

extension AppStorage {
    init(_ setting: Setting<Value>) where Value == Bool {
        self.init(wrappedValue: setting.defaultValue, setting.key)
    }
}

extension AppStorage where Value: RawRepresentable {
    init(_ setting: Setting<Value>) where Value.RawValue == Int {
        self.init(wrappedValue: setting.defaultValue, setting.key)
    }
}
