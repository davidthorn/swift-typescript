import Foundation

public typealias HTMLTagAttribute = (key: String , value: String)

public class HTMLTag {

    public var name: String

    public var id: String?

    public var classNames: [String]

    public var attributes: [HTMLTagAttribute] {
        didSet {
            print("attributes has been set")
            self.attributesChanged(from: oldValue , to: attributes)
        }
    }

    public init(name: String , id: String? = nil) {
        self.name = name
        self.id = id ?? UUID().uuidString
        self.classNames = []
        self.attributes = []
    }

    public func render(_ textNode: String? = nil) -> String {

        let classNamesRendered = self.classNames.joined(separator: " ")

        let classTag = classNamesRendered.count > 0 ? " class=\"\(classNamesRendered)\"" : ""

        let attrs = self.attributes.reduce("" , { (prev, attr) -> String in
             var mod = prev
             mod.append(" \(attr.key)=\"\(attr.value)\"")
             return mod
        }) 

        let idAttr = id == nil ? "" : " id=\"\(id!)\""
        let innerText = textNode ?? "" 
        return "<\(name)\(idAttr)\(classTag)\(attrs)>\(innerText)</\(name)>"
    }

    public func add(className: String) {
        guard !self.classNames.contains(className) else { return }
        self.classNames.append(className)
    }

    public func add(classNames: [String]) {
        classNames.forEach { self.add(className: $0) }
    }

    public func add(attribute: (key: String , value: String)) {
        self.attributes.append(attribute)
    }

}