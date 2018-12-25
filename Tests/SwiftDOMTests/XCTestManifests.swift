import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
       // testCase(SwiftDOMTests.allTests),
        testCase(HTMLTagTests.allTests),
    ]
}
#endif