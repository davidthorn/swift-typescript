public class HTMLHeadElement: HTMLElement {

    public var title: HTMLTextNodeElement

    public var baseTag: HTMLTag

    public var scriptTags: [HTMLScriptTag]

    public var linkTags: [HTMLLinkTag]

    public init() {
        self.baseTag = HTMLTag(name: "base")
        self.scriptTags = []
        self.linkTags = []
        self.title = HTMLTextNodeElement("" , name: "title" , id: "html-head-title")
        super.init(name: "head", id: "head")
        self.baseTag.add(attribute: (key: "href" , value: "."))
    }   

    public override func render(_ textNode: String? = nil) -> String {

        let scripts = self.scriptTags.reduce("" , { (prev, node) -> String in
            var mod = prev
            mod.append("\n\t\(node.render())\n")
            return mod
        }) 

        let links = self.linkTags.reduce("" , { (prev, node) -> String in
            var mod = prev
            mod.append("\n\t\(node.render())\n")
            return mod
        }) 

        let innerText = textNode ?? "" 
        return super.render("\(baseTag.render())\(scripts)\(links)\(innerText)")

    }

    public func add(script: HTMLScriptTag) {
        self.scriptTags.append(script)
    }

    public func add(scripts: [HTMLScriptTag]) {
        scripts.forEach{ self.add(script: $0) }
    }

     public func add(link: HTMLLinkTag) {
        self.linkTags.append(link)
    }

    public func script(src: String, n: ((_ childNode: HTMLScriptTag) -> Void)? = nil ) {
        let child_node = scriptTag(src) { $0 } // create new 
        n?(child_node)
    }

    public func link(href: String, rel: String = "stylesheet", n: ((_ childNode: HTMLLinkTag) -> Void)? = nil ) {
        let child_node = linkTag(href, rel) { $0 } // create new 
        n?(child_node)
    }

    public func links(href: [String], n: ((_ childNode: HTMLLinkTag) -> Void)? = nil ) {
        href.forEach { s in
            let child_node = linkTag(s , "stylesheet") { $0 } // create new 
            n?(child_node)
        }
    }

    public func scripts(src: [String], n: ((_ childNode: HTMLScriptTag) -> Void)? = nil ) {
        src.forEach { s in
            let child_node = scriptTag(s) { $0 } // create new 
            n?(child_node)
        }
       
    }

}