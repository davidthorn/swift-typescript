public class HTMLDivElement: HTMLElement {

    public init(id: String? = nil) {
        super.init(name: "div" , id: id)
    }

    public override func render(_ textNode: String? = nil) -> String {
        let result = super.render(textNode)
        return result
    }

}