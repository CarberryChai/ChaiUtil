//
//  File.swift
//  
//
//  Created by changlin on 2023/9/9.
//

import Foundation

extension URL:ExpressibleByStringLiteral {
    public init(stringLiteral value: StaticString) {
        self.init(string: value.description)!
    }
}
