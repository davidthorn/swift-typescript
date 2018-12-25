import SwiftElement

public typealias HTMLTextNodeValueChanged = (id: String , node: HTMLTextNodeElement, from: String? , to: String?)
public typealias HTMLTagAttributesChanged = (id: String , node: HTMLTag, from: [HTMLTagAttribute] , to: [HTMLTagAttribute])


public class HTMLDocument {

    public var html: HTMLMainElement

    public var headElement: HTMLHeadElement {
        return self.html.headElement
    }

    public var title: HTMLTextNodeElement {
        return self.headElement.title
    }
 
    public var bodyElement: HTMLBodyElement {
        return self.html.bodyElement
    }

    public func head(completion: @escaping (HTMLHeadElement) -> Void) {
        completion(self.headElement)
    }

    public func body(completion: @escaping (HTMLBodyElement) -> Void) {
        completion(self.bodyElement)
    }

    internal static var _document: HTMLDocument! 

    internal var eventHandlers: [String:[DOMEventHandler]]

    internal var textNodeChangedEvents: [HTMLTextNodeValueChanged]
    internal var tagAttributesChangedEvents: [HTMLTagAttributesChanged]

    public func getTagAttributesChangedEvents() -> [HTMLTagAttributesChanged] {
        return self.tagAttributesChangedEvents
    }

    public func getTextNodeChangedEvents() -> [HTMLTextNodeValueChanged] {
        return self.textNodeChangedEvents
    }

    public func removeAllTextNodeChangedEvents() {
        self.textNodeChangedEvents.removeAll()
    }

    public func getEventHandlers() -> [String:[DOMEventHandler]] {
        return self.eventHandlers
    }

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
        self.tagAttributesChangedEvents = []
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

    public func add(tagAttributesChangedEvent: HTMLTagAttributesChanged) {
        self.tagAttributesChangedEvents.append(tagAttributesChangedEvent)
    }

    public func render() -> String {
        return self.html.render()
    }

}

public let document = HTMLDocument.instance