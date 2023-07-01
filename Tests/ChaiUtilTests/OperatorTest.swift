@testable import ChaiUtil
import XCTest

final class OperatorTest: XCTestCase {
    func testExponent() {
        XCTAssertEqual(2**3, 8)
        XCTAssertEqual(2**0, 1)
    }
}
