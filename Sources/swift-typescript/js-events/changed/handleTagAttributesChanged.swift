import Foundation 

public func handleTagAttributesChanged() {

    document.eventHandlers["click"]?.forEach { event in

        event.handler()

        let textNodeChanges = document.getTextNodeChangedEventChanges()
        let d = "document.getElementById('\(event.id)').addEventListener('click' , () => {\n\t\(textNodeChanges)\n})"
        let onload = "window.addEventListener('load' , () => {\n\t\(d)\n});"

        if let fileHandle = try? FileHandle(forWritingTo: URL(string: "./events.js")!) {
            defer {
                fileHandle.closeFile()
            }
            fileHandle.seekToEndOfFile()
            fileHandle.write(onload.data(using: .utf8)!)
        } 
       
        document.textNodeChangedEvents.removeAll()
    }

}

