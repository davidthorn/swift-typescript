import SwiftDOM

extension  HTMLDocument {

    public func getTextNodeChangedEventChanges() -> String {
        var t: [String] = []

        self.getTextNodeChangedEvents().forEach { change in
            t.append("document.getElementById('\(change.id)').innerHTML = '\(change.to ?? "")';")
        }

        return t.joined(separator: "\n\t")
    }
    
}