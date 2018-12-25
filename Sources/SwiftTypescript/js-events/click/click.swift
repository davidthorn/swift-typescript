import Foundation 
import SwiftDOM

public func handleClickEvents() {

    document.getEventHandlers()["click"]?.forEach { event in

       
        event.handler()
        //element.events.click(on: event.id)
        let onload = document.getClickEventChanges(on: event.id)
         print(onload)
        if let fileHandle = try? FileHandle(forWritingTo: URL(string: "./events.js")!) {
            defer {
                fileHandle.closeFile()
            }
            fileHandle.seekToEndOfFile()
            fileHandle.write(onload.data(using: .utf8)!)
        } 
       
        document.removeAllTextNodeChangedEvents()
    }

}

