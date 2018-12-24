public class HTMLHeadElement: HTMLElement {

    public var title: HTMLTextNodeElement

    public init() {
        self.title = HTMLTextNodeElement("" , name: "title" , id: "html-head-title")
        super.init(name: "head", id: "head")
    }

    public override func render(_ textNode: String? = nil) -> String {
        let result = super.render(textNode)
        return result
    }

}