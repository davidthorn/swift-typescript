public class HTMLBodyElement: HTMLElement {

    public init() {
        super.init(name: "body")
    }

    public override func render(_ textNode: String? = nil) -> String {
        let result = super.render(textNode)
        return result
    }

}