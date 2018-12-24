public class HTMLMainElement: HTMLTag {

    public var headElement: HTMLHeadElement

    public var bodyElement: HTMLBodyElement

    public func head(completion: @escaping (HTMLHeadElement) -> Void) {
        completion(self.headElement)
    }

    public func body(completion: @escaping (HTMLBodyElement) -> Void) {
        completion(self.bodyElement)
    }

    public init() {
        self.headElement = HTMLHeadElement()
        self.bodyElement = HTMLBodyElement()
        super.init(name: "html", id: "html")
    }

    public override func render(_ textNode: String? = nil) -> String {

        var mutTextNode = textNode ?? ""

        mutTextNode.append(self.headElement.render())
        mutTextNode.append(self.bodyElement.render())
        

        let result = super.render(mutTextNode)
        return result
    }



}