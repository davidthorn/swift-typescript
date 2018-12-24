public class HTMLDivElement: HTMLElement {

    public init(id: String? = nil) {
        super.init(name: "div" , id: id)
    }

    public override func render(_ textNode: String? = nil) -> String {
        let result = super.render(textNode)
        return result
    }

}

public class HTMLTextNodeElement: HTMLElement {

    public var text: String

    public init(_ text: String, name: String , id: String? = nil) {
        self.text = text
        super.init(name: name , id: id)
    }

    public override func render(_ textNode: String? = nil) -> String {
        let result = super.render(self.text)
        return result
    }

}

public class HTMLH1Element: HTMLTextNodeElement {

    public init(_ text: String , id: String? = nil) {
        super.init(text , name: "h1" , id: id)
    }

}

public class HTMLParagraphElement: HTMLTextNodeElement {

    public init(_ text: String , id: String? = nil) {
        super.init(text , name: "p" , id: id)
    }

}

