public class HTMLDivElement: HTMLElement {

    public init(id: String? = nil) {
        super.init(name: "div" , id: id)
    }

    public override func render() {
        super.render()
        print("have rendered the div element")
    }

}