//
//  ArrayTest.swift
//  
//
//  Created by changlin on 1/07/23.
//

import XCTest
@testable import ChaiUtil

final class ArrayTest: XCTestCase {
    func testSomeFunction() {
        XCTAssertTrue([1, 2, 4, 6].some(isOdd))
        XCTAssertTrue([1, 2, 4, 6].some(\.self == 2))
    }

    func testTotalProperty() {
        XCTAssertEqual(Array(1...10).total, 55)
        XCTAssertEqual([1.2, 3.4].total, 4.6)
    }
}
