import Foundation

public typealias EventName = String

public typealias DOMClickEventHandler = () -> Void

public typealias DOMEventHandler = (id: String , eventName: EventName , target: HTMLElement , handler: () -> Void )

public class HTMLElement: HTMLTag {

    public var nodes: [HTMLElement]

    public var parent: HTMLElement?

    internal var eventHandlers: [String:[DOMEventHandler]]

    public func getEventHandlers() -> [String:[DOMEventHandler]] {
        return self.eventHandlers
    }

    public func addEventHandler(handler: DOMEventHandler ) {
        if self.eventHandlers[handler.eventName] == nil {
            self.eventHandlers[handler.eventName] = []
        }
        
        self.eventHandlers[handler.eventName]!.append(handler)
                                            
        document.add(eventHandler:handler)
    }

    public override init(name: String , id: String? = nil) {
        self.nodes = []
        self.eventHandlers = [:]
        super.init(name: name, id: id)
    }

    public override func render(_ textNode: String? = nil) -> String {

        let childNodes = self.nodes.reduce("" , { (prev, node) -> String in
            var mod = prev
             mod.append("\n\t\(node.render())\n")
             return mod
        }) 

        let innerText = textNode ?? "" 
        return super.render("\(innerText)\(childNodes)")
    }

    public func add(node: HTMLElement) {
        node.parent = self
        document.add(node: node)
        self.nodes.append(node)
    }

    public func node(n: (_ parent: HTMLElement) -> HTMLElement ) {
        self.add(node: n(self))
    }

    public func child( _ id: String? = nil , n: (_ childNode: HTMLElement) -> Void ) {
        let child_node = div(id) { $0 } // create new 
        self.add(node: child_node)
        n(child_node)
    }

    public func h1(_ text: String , _ id: String? = nil , n: ((_ childNode: HTMLH1Element) -> Void)? = nil ) {
        let child_node = h1Tag(text, id) { $0 } // create new 
        self.add(node: child_node)
        n?(child_node)
    }

    public func p(_ text: String , _ id: String? = nil , n: ((_ childNode: HTMLParagraphElement) -> Void)? = nil ) {
        let child_node = pTag(text, id) { $0 } // create new 
        self.add(node: child_node)
        n?(child_node)
    }

    

}