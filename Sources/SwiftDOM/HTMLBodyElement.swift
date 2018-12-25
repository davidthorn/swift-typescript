public class HTMLBodyElement: HTMLElement {

    public init() {
        super.init(name: "body", id: "body")
    }

    public override func render(_ textNode: String? = nil) -> String {
        let result = super.render(textNode)
        return result
    }

}