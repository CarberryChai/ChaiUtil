//
//  MathTest.swift
//  
//
//  Created by changlin on 1/07/23.
//

import XCTest
@testable import ChaiUtil

final class MathTest: XCTestCase {
    func testOdd() {
        XCTAssertTrue(isOdd(1))
        XCTAssertTrue(isOdd(3))
        XCTAssertTrue(isOdd(101))
        XCTAssertTrue(isOdd(1001))
        XCTAssertTrue(isOdd(999))
    }
}
