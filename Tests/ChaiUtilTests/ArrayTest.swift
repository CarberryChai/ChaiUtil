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
        XCTAssertFalse([].some(isOdd))
    }
}
