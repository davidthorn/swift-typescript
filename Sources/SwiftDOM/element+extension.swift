import SwiftElement

extension element {

    public static func with(id: String) -> HTMLElement? {
        return document.getElementById(id)
    }
    

}