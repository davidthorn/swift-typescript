import XCTest
@testable import SwiftElement
import SwiftDOM

final class SwiftElementTests: XCTestCase {
    
    func testAttributeChanged() {
        element.attributesChanged.removeAll()
        let tag = HTMLTag(name: "div")
        tag.add(attribute: (key: "rel" , value: "stylesheet"))
        
        XCTAssertEqual(element.attributesChanged.count , 3)
    }

    static var allTests = [
        ("Test that attributed changed is called", testAttributeChanged),
    ]
}
