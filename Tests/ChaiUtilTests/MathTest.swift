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
        XCTAssertTrue(isOdd(-1))
        XCTAssertTrue(isOdd(Int8(3)))
        XCTAssertTrue(isOdd(UInt64(5)))
    }

    func testClamp() {
        let a = 2.clamped(to: 3...10)
        let b = 15.clamped(to: 3...10)
        let c = 7.clamped(to: 3...10)

        let d = 3.clamped(to: 5...)
        let e = 10.clamped(to: ...7)
        let f = 8.clamped(to: 0...)
        XCTAssertEqual(a, 3)
        XCTAssertEqual(b, 10)
        XCTAssertEqual(c, 7)

        XCTAssertEqual(d, 5)
        XCTAssertEqual(e, 7)
        XCTAssertEqual(f, 8)
    }
}
