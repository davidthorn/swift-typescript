import XCTest
@testable import swift_typescript

final class swift_typescriptTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(swift_typescript().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
