public class HTMLTextNodeElement: HTMLElement {

    public var text: String {
        didSet {
            self.changeEvent(from: oldValue , to: self.text)
        }
    }

    public init(_ text: String, name: String , id: String? = nil) {
        self.text = text
        super.init(name: name , id: id)
    }

    public override func render(_ textNode: String? = nil) -> String {
        let result = super.render(self.text)
        return result
    }

}