public typealias HTMLTagAttribute = (key: String , value: String)

public protocol HTMLTagAttributeChanged {
    func attributesChanged(id: String ,from: [HTMLTagAttribute] , to: [HTMLTagAttribute])
}

extension HTMLTagAttributeChanged {

    public func attributesChanged(id: String , from: [HTMLTagAttribute] , to: [HTMLTagAttribute]) {
        guard from.count > 0 , to.count > 0  else { return }
        if element.attributesChanged[id] == nil {
            element.attributesChanged[id] = []
        }

        element.attributesChanged[id]!.append(contentsOf: to)
    }

}

public class element {

    public static var attributesChanged: [String:[HTMLTagAttribute]] = [:] {
        didSet {
            guard element.attributesChanged.count > 0 else { return }
            print(element.attributesChanged)
        }
    }

}