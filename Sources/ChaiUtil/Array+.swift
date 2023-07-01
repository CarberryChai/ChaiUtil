//
//  File.swift
//  
//
//  Created by changlin on 1/07/23.
//

import Foundation


extension Array {
    /// if any evaluated element is true, the reuslt will be true.
    public func some(_ callback: (Element) -> Bool) -> Bool {
        var result = false
        for item in self where callback(item) {
            result = true
        }
        return result
    }
}
