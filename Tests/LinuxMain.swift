import XCTest

import SwiftElementTests
import SwiftTypescriptTests

var tests = [XCTestCaseEntry]()
tests += SwiftElementTests.allTests()
tests += SwiftTypescriptTests.allTests()
XCTMain(tests)