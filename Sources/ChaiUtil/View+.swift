//
//  SwiftUIView.swift
//
//
//  Created by changlin on 8/07/23.
//

import SwiftUI

/// View Extensions
@available(macOS 10.15, iOS 13.0, *)
public extension View {
    /// horizontal expanding box, it looks like block box in css
    func HBox(_ align: Alignment = .center) -> some View {
        self
            .frame(maxWidth: .infinity, alignment: align)
    }

    func VBox(_ align: Alignment = .center) -> some View {
        self
            .frame(maxHeight: .infinity, alignment: align)
    }
}
