//
//  Algo.swift
//  
//
//  Created by changlin on 10/08/23.
//

import XCTest
@testable import ChaiUtil

final class Algo: XCTestCase {
    func testInsertSort() {
        var arr = [6, 3, 9, 2, 1, 16, 14, 20]
        insertSort(&arr)
        XCTAssertEqual(arr, [1, 2, 3, 6, 9, 14, 16, 20])
    }

    func testBinarySearch() {
        let arr = [6, 3, 9, 2, 1, 16, 14, 20]
        XCTAssertEqual(binarySerch(arr, target: 2), 3)
        XCTAssertEqual(binarySerch(arr, target: 23), -1)
    }

}
