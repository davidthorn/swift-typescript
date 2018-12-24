public class HTMLElement {

    public var name: String

    public var id: String?

    public var classNames: [String]

    public var nodes: [HTMLElement]

    public init(name: String , id: String? = nil) {
        self.name = name
        self.id = id
        self.classNames = []
        self.nodes = []
    }

    public func render(_ textNode: String? = nil) -> String {

        let classNamesRendered = self.classNames.joined(separator: " ")

        let classTag = classNamesRendered.count > 0 ? " class=\"\(classNamesRendered)\"" : ""

        let childNodes = self.nodes.reduce("" , { (prev, node) -> String in
            var mod = prev
             mod.append("\n\t\(node.render())\n")
             return mod
        }) 

        let idAttr = id == nil ? "" : " id=\"\(id!)\""
        let innerText = textNode ?? "" 
        return "<\(name)\(idAttr)\(classTag)>\(innerText)\(childNodes)</\(name)>"
    }

    public func add(className: String) {
        guard !self.classNames.contains(className) else { return }
        self.classNames.append(className)
    }

    public func add(classNames: [String]) {
        classNames.forEach { self.add(className: $0) }
    }

    public func add(node: HTMLElement) {
        self.nodes.append(node)
    }

    public func node(n: (_ parent: HTMLElement) -> HTMLElement ) {
        self.add(node: n(self))
    }

    public func child( _ id: String? = nil , n: (_ childNode: HTMLElement) -> Void ) {
        let child_node = div(id) { $0 } // create new 
        self.add(node: child_node)
        n(child_node)
    }

    public func h1(_ text: String , _ id: String? = nil , n: ((_ childNode: HTMLH1Element) -> Void)? = nil ) {
        let child_node = h1Tag(text, id) { $0 } // create new 
        self.add(node: child_node)
        n?(child_node)
    }

    public func p(_ text: String , _ id: String? = nil , n: ((_ childNode: HTMLParagraphElement) -> Void)? = nil ) {
        let child_node = pTag(text, id) { $0 } // create new 
        self.add(node: child_node)
        n?(child_node)
    }

}