//
//  File.swift
//
//
//  Created by changlin on 1/07/23.
//

extension Collection {
    /// if any evaluated element is true, the reuslt will be true.
    func some(_ callback: (Element) -> Bool) -> Bool {
        var result = false
        for item in self where callback(item) {
            result = true
        }
        return result
    }
}

extension Collection where Element: AdditiveArithmetic {
    /// If the element is Numberic(int, float), calculating the sum
    var total: Element {
        return self.reduce(Element.zero, +)
    }
}
