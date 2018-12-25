
public class element {

    public static var attributesChanged: [String:[HTMLTagAttribute]] = [:] {
        didSet {
            guard element.attributesChanged.count > 0 else { return }
            print(element.attributesChanged)
        }
    }

}