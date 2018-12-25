import Foundation 

public func handleClickEvents() {

    document.eventHandlers["click"]?.forEach { event in

        event.handler()
        element.events.click(on: event.id)
        // let onload = document.getClickEventChanges(on: event.id)

        // if let fileHandle = try? FileHandle(forWritingTo: URL(string: "./events.js")!) {
        //     defer {
        //         fileHandle.closeFile()
        //     }
        //     fileHandle.seekToEndOfFile()
        //     fileHandle.write(onload.data(using: .utf8)!)
        // } 
       
        // document.textNodeChangedEvents.removeAll()
    }

}

