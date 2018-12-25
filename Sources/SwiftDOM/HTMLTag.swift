import Foundation

public typealias HTMLTagAttribute = (key: String , value: String)

public class HTMLTag {

    public let name: String

    public var id: String? {
        return self.get(attribute: "id")?.value
    }

    public var classNames: [String] {
        guard let classes = self.attributes.filter({ $0.key == "class" }).first else { return [] }
        return classes.value.components(separatedBy: " ") 
    }

    public var attributes: [HTMLTagAttribute] {
        didSet {
            //self.attributesChanged(from: oldValue , to: attributes)
        }
    }

    public init(name: String , id: String? = nil) {
        self.name = name
        self.attributes = []
        self.add(attribute: (key: "id" , value: id ?? UUID().uuidString))
    }

    public func render(_ textNode: String? = nil) -> String {

        let attrs = self.attributes.reduce("" , { (prev, attr) -> String in
             var mod = prev
             mod.append(" \(attr.key)=\"\(attr.value)\"")
             return mod
        }) 

        let innerText = textNode ?? "" 
        return "<\(name)\(attrs)>\(innerText)</\(name)>"
    }

    public func add(className: String) {
        var _classNames = self.classNames
        if(!_classNames.contains(className)) {
            _classNames.append(className)
        }
        self.remove(attribute: "class")
        self.add(attribute: (key: "class" , value: _classNames.joined(separator: " ")))
    }

    public func add(classNames: [String]) {
        classNames.forEach { self.add(className: $0) }
    }

    public func add(attribute: (key: String , value: String)) {
        guard var attr = self.get(attribute: attribute.key) else {
            return self.attributes.append(attribute)
        } 
        attr.value = attribute.value
        self.attributes = self.attributes.map{ $0.key == attribute.key ? attr : $0 }
    }

    public func remove(attribute key: String) {
        self.attributes = self.attributes.filter{ $0.key != key }
    }

    public func get(attribute key: String) -> HTMLTagAttribute? {
        return self.attributes.filter{ $0.key == key }.first
    }


}