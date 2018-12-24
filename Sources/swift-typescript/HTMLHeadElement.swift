public class HTMLHeadElement: HTMLElement {

    public var title: HTMLTextNodeElement

    public var scriptTags: [HTMLScriptTag]

    public init() {
        self.scriptTags = []
        self.title = HTMLTextNodeElement("" , name: "title" , id: "html-head-title")
        super.init(name: "head", id: "head")
    }

    public override func render(_ textNode: String? = nil) -> String {

        let scripts = self.scriptTags.reduce("" , { (prev, node) -> String in
            var mod = prev
            mod.append("\n\t\(node.render())\n")
            return mod
        }) 

        let innerText = textNode ?? "" 
        return super.render("\(scripts)\(innerText)")

    }

    public func add(script: HTMLScriptTag) {
        self.scriptTags.append(script)
    }

    public func add(scripts: [HTMLScriptTag]) {
        scripts.forEach{ self.add(script: $0) }
    }

    public func script(src: String, n: ((_ childNode: HTMLScriptTag) -> Void)? = nil ) {
        let child_node = scriptTag(src) { $0 } // create new 
        n?(child_node)
    }

    public func scripts(src: [String], n: ((_ childNode: HTMLScriptTag) -> Void)? = nil ) {
        src.forEach { s in
            let child_node = scriptTag(s) { $0 } // create new 
            n?(child_node)
        }
       
    }

}