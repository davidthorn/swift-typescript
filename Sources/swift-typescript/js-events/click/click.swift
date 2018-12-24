import Foundation 

public func handleClickEvents() {

    _ = FileManager.default.createFile(atPath: "./events.js" , contents: result.data(using: .utf8))

    document.eventHandlers["click"]?.forEach { event in

        event.handler()

        var t: [String] = []

        document.textNodeChangedEvents.forEach { change in
            t.append("document.getElementById('\(change.id)').innerHTML = '\(change.to ?? "")';")
            print("changed \(change.id)")
        }

        let d = "document.getElementById('\(event.id)').addEventListener('click' , () => {\n\t\(t.joined(separator: "\n\t"))\n})"

        let onload = "window.addEventListener('load' , () => {\n\t\(d)\n});"

        print(d)

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

