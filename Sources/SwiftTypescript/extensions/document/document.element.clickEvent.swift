import SwiftDOM

extension  HTMLDocument {

    public func getClickEventChanges(on id: String) -> String {
        let textNodeChanges = document.getTextNodeChangedEventChanges()
        let d = "document.getElementById('\(id)').addEventListener('click' , () => {\n\t\(textNodeChanges)\n})"
        let onload = "window.addEventListener('load' , () => {\n\t\(d)\n});"
        return onload
    }

}