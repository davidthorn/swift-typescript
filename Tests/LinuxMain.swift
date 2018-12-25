import XCTest

import SwiftElementTests
import SwiftTypescriptTests
import SwiftDOMTests

var tests = [XCTestCaseEntry]()
tests += SwiftElementTests.allTests()
tests += SwiftTypescriptTests.allTests()
tests += SwiftDOMTests.allTests()
XCTMain(tests)