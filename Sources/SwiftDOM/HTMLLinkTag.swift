import Foundation

public class HTMLLinkTag: HTMLTag {

    public var href: String

    public init(href: String , rel: String = "stylesheet") {
        self.href = href
        super.init(name: "link")
        self.add(attribute: (key: "href" , value: href))
        self.add(attribute: (key: "rel" , value: rel))
    }

}