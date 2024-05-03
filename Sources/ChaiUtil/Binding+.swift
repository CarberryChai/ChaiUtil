//
//  SwiftUIView.swift
//  
//
//  Created by changlin on 2024/5/3.
//

import SwiftUI

extension Binding {
    public func withDefault<T>(_ defaultValue: T) -> Binding<T> where Value == T? {
        Binding<T>(
            get: { self.wrappedValue ?? defaultValue },
            set: { self.wrappedValue = $0 }
        )
    }
}

