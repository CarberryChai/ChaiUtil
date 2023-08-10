//
//  Algo.swift
//
//
//  Created by changlin on 10/08/23.
//

public func insertSort<T: Comparable>(_ arr: inout [T]) {
    var j = 1
    repeat {
        let value = arr[j]
        var i = j - 1
        while i >= 0, arr[i] > value {
            arr[i + 1] = arr[i]
            i -= 1
        }
        arr[i + 1] = value
        j += 1
    } while j < arr.count
}

public func binarySerch<T: Comparable>(_ arr: [T], target: T) -> Int {
    var i = 0, j = arr.count - 1
    while i <= j {
        let m = i + (j - i) / 2
        if arr[m] < target {
            i = m + 1
        } else if arr[m] > target {
            j = m - 1
        } else {
            return m
        }
    }
    return -1
}
