//
//  EnvironmentObservable.swift
//  FinalYearProject
//

import SwiftUI

protocol RawValueRepresentable: RawRepresentable {}

@MainActor @propertyWrapper struct EnvironmentObservable<Value>: DynamicProperty {
    @Environment var wrappedValue: Value

    init(_ objectType: Value.Type = Value.self) where Value: AnyObject, Value: Observable {
        _wrappedValue = .init(objectType)
    }

    init<T>(_ objectType: T.Type = T.self) where Value == T?, T: AnyObject, T: Observable {
        _wrappedValue = .init(objectType)
    }

    @MainActor @dynamicMemberLookup struct Projection {
        private let value: Value

        fileprivate init(value: Value) {
            self.value = value
        }

        subscript<Subject>(
            dynamicMember keyPath: ReferenceWritableKeyPath<Value, Subject>
        ) -> Binding<Subject> where Value: AnyObject {
            .init {
                value[keyPath: keyPath]
            } set: {
                value[keyPath: keyPath] = $0
            }
        }

        subscript<Subject>(
            dynamicMember keyPath: ReferenceWritableKeyPath<Value, Subject>
        ) -> Binding<Subject.RawValue> where Value: AnyObject, Subject: RawValueRepresentable {
            .init {
                value[keyPath: keyPath].rawValue
            } set: {
                if let newValue = Subject(rawValue: $0) {
                    value[keyPath: keyPath] = newValue
                }
            }
        }
    }

    var projectedValue: Projection {
        Projection(value: wrappedValue)
    }
}
