//
//  File.swift
//
//
//  Created by changlin on 1/07/23.
//

import Foundation

public func isOdd(_ value: Int) -> Bool {
    return (value & 1) == 1
}

public extension Comparable {
    @inlinable
    func clamped(to limits: ClosedRange<Self>) -> Self {
        return min(max(self, limits.lowerBound), limits.upperBound)
    }

    @inlinable
    func clamped(to limits: PartialRangeFrom<Self>) -> Self {
        return max(self, limits.lowerBound)
    }

    @inlinable
    func clamped(to limits: PartialRangeThrough<Self>) -> Self {
        return min(self, limits.upperBound)
    }
}
