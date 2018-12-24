public class HTMLElement {

    public var name: String

    public var id: String?

    public var classNames: [String]

    public init(name: String , id: String? = nil) {
        self.name = name
        self.id = id
        self.classNames = []
    }

    public func render() -> String {

        var classNamesRenders = self.classNames.joined(separator: " ")

        var tag = """
            <\(name)></\(name)>
        """



        print("rendering \(self.name) element")

        if let i = id {
            print("id = \(i)")
        }

        self.classNames.forEach { className in
            print("element has className of \(className)")
        }

        return tag
    }

    public func add(className: String) {
        guard !self.classNames.contains(className) else { return }
        self.classNames.append(className)
    }

}