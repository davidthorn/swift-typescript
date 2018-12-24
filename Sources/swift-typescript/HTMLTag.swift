import Foundation

public class HTMLTag {

    public var name: String

    public var id: String?

    public var classNames: [String]

    public init(name: String , id: String? = nil) {
        self.name = name
        self.id = id ?? UUID().uuidString
        self.classNames = []
    }

    public func render(_ textNode: String? = nil) -> String {

        let classNamesRendered = self.classNames.joined(separator: " ")

        let classTag = classNamesRendered.count > 0 ? " class=\"\(classNamesRendered)\"" : ""

        let idAttr = id == nil ? "" : " id=\"\(id!)\""
        let innerText = textNode ?? "" 
        return "<\(name)\(idAttr)\(classTag)>\(innerText)</\(name)>"
    }

    public func add(className: String) {
        guard !self.classNames.contains(className) else { return }
        self.classNames.append(className)
    }

    public func add(classNames: [String]) {
        classNames.forEach { self.add(className: $0) }
    }

}