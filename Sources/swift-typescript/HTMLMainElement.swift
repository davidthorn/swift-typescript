public class HTMLMainElement: HTMLTag {

    public var head: HTMLHeadElement

    public var body: HTMLBodyElement

    public init() {
        self.head = HTMLHeadElement()
        self.body = HTMLBodyElement()
        super.init(name: "html", id: "html")
    }

    public override func render(_ textNode: String? = nil) -> String {

        var mutTextNode = textNode ?? ""

        mutTextNode.append(self.head.render())
        mutTextNode.append(self.body.render())
        

        let result = super.render(mutTextNode)
        return result
    }



}