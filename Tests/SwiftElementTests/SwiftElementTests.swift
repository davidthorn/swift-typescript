import XCTest
@testable import SwiftElement

final class SwiftElementTests: XCTestCase {
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(element().text, "hello")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
