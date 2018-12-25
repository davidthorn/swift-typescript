import XCTest
@testable import SwiftDOM

final class HTMLTagTests: XCTestCase {
    
    var tag: HTMLTag!
    var tagWithUUID: HTMLTag!

    override func setUp() {
        super.setUp()
        tag = HTMLTag(name: "div" , id: "123")
        tagWithUUID = HTMLTag(name: "div")
    }

    func testExample() {
    
        XCTAssertEqual(tag.name, "div")
        XCTAssertEqual(tag.id, "123")

        XCTAssertEqual(tagWithUUID.name, "div")
        XCTAssertNotNil(tagWithUUID.id)
    }

    func testRenderBasicTag() {
        let data = tag.render()
        XCTAssertEqual(data , "<div id=\"123\"></div>")

        let uiddata = tagWithUUID.render()
        XCTAssertEqual(uiddata , "<div id=\"\(tagWithUUID.id!)\"></div>")
    }

    func testIDAttributeHasBeenSet() {
        let tagId = tag.get(attribute: "id")
        XCTAssertNotNil(tagId , "The attribute id cannot be nil")
        XCTAssertEqual(tag.attributes.count ,  1 , "Attributes should have 0 attribute now")
    }

    func testAmendAttribute() {
        tag.add(attribute: (key: "width" , value: "00" ))
        var attr = tag.get(attribute: "width")
        XCTAssertNotNil(attr)
        attr!.value = "150"
        tag.add(attribute: attr!)
        let amendedAttr = tag.get(attribute: "width")
        XCTAssertNotNil(amendedAttr)
        XCTAssertEqual(attr!.value , "150")
        XCTAssertEqual(amendedAttr!.value , "150")
    }

    func testAddRemoveAddtributes() {
        tag.add(attribute: (key: "class" , value: "box"))
        XCTAssertEqual(tag.classNames.count ,  1 , "Class Names should have 1 class now")
        XCTAssertEqual(tag.attributes.count ,  2 , "Attributes should have 1 attribute now")
        tag.remove(attribute: "class")
        XCTAssertEqual(tag.attributes.count ,  1 , "Attributes should have 0 attribute now")
        XCTAssertEqual(tag.classNames.count ,  0)
    }

    func testRenderBasicTagWithASingleClass() {
        tag.add(className: "box")
        tagWithUUID.add(className: "box")

        let data = tag.render()
        XCTAssertEqual(data , "<div id=\"123\" class=\"box\"></div>")

        let uiddata = tagWithUUID.render()
        XCTAssertEqual(uiddata , "<div id=\"\(tagWithUUID.id!)\" class=\"box\"></div>")
    }

    func testRenderBasicTagMultipleClassNames() {
        tag.add(className: "box")
        tag.add(className: "box1")
        
        tagWithUUID.add(className: "box")
        tagWithUUID.add(className: "box1")

        let data = tag.render()
        XCTAssertEqual(data , "<div id=\"123\" class=\"box box1\"></div>")

        let uiddata = tagWithUUID.render()
        XCTAssertEqual(uiddata , "<div id=\"\(tagWithUUID.id!)\" class=\"box box1\"></div>")
    }

    func testAddClassNameRestrictsDuplicates() {
        tag.add(className: "box")
        tag.add(className: "box1")
        tag.add(className: "box")
        
        XCTAssertEqual(tag.classNames.count , 2)
    }

    static var allTests = [
        ("testExample", testExample),
        ("Test that the id attribute has been set" , testIDAttributeHasBeenSet),
        ("Test Amend Attribute" , testAmendAttribute),
        ("Test that the tag can render a basic tag without any attributes or text node" , testRenderBasicTag),
        ("Test adding an attribute and then removing it" , testAddRemoveAddtributes),
        ("Test that the tag can render with a class name" , testRenderBasicTagWithASingleClass),
        ("Test that the tag can render with multiple class names" , testRenderBasicTagMultipleClassNames),
        ("Test add Class Name does not allow duplicated" , testAddClassNameRestrictsDuplicates)

    ]
}
