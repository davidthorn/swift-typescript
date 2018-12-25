import Foundation

public class HTMLScriptTag: HTMLTag {

    public var src: String

    public init(src: String) {
        self.src = src
        super.init(name: "script")
        self.add(attribute: (key: "src" , value: src))
        self.add(attribute: (key: "type" , value: "text/javascript"))
    }

}