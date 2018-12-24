public typealias HTMLTextNodeValueChanged = (id: String , node: HTMLTextNodeElement, from: String? , to: String?)


public class HTMLDocument {

    public var html: HTMLMainElement

    public var head: HTMLHeadElement {
        return self.html.head
    }

    public var title: HTMLTextNodeElement {
        return self.head.title
    }

    public var body: HTMLBodyElement {
        return self.html.body
    }

    internal static var _document: HTMLDocument! 

    internal var eventHandlers: [String:[DOMEventHandler]]

    internal var textNodeChangedEvents: [HTMLTextNodeValueChanged]

    public static var instance: HTMLDocument {
        get{ 
            guard let doc = self._document else { 
                self._document = HTMLDocument()
                return self.instance
             }
            return doc
        }
    }

    public var nodes: [HTMLElement]

    public init() {
        self.html = HTMLMainElement()
        self.nodes = []
        self.eventHandlers = [:]
        self.textNodeChangedEvents = []
    }

    public func add(node: HTMLElement) {
        print("adding node with id: \(node.id!) in parent: \(node.parent?.id ?? "no id")")
        guard !self.nodes.contains(where: { $0.id == node.id }) else { return }
        self.nodes.append(node)
    } 

    public func getElementById(_ id: String) -> HTMLElement? {
        return self.nodes.filter{ $0.id == id }.first
    }

    public func add(eventHandler: DOMEventHandler) {
        if self.eventHandlers[eventHandler.eventName] == nil {
            self.eventHandlers[eventHandler.eventName] = []
        }
        self.eventHandlers[eventHandler.eventName]!.append(eventHandler)
    }

    public func add(textNodeChangedEvent: HTMLTextNodeValueChanged) {
        self.textNodeChangedEvents.append(textNodeChangedEvent)
    }

    public func render() -> String {
        print("document should render")
        return self.html.render()
    }

}

public let document = HTMLDocument.instance