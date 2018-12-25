import Foundation
import SwiftDOM

public class element {

    public static let fileName: String = "./events.js"

    public class  events {

        public static func click(on id: String) {
            let onload = document.getClickEventChanges(on: id)
            element.write(data: onload.data(using: .utf8)!)
            document.removeAllTextNodeChangedEvents()
        }

    }

    public static func write(data: Data) {
        if let fileHandle = try? FileHandle(forWritingTo: URL(string: self.fileName)!) {
            defer {
                fileHandle.closeFile()
            }
            fileHandle.seekToEndOfFile()
            fileHandle.write(data)
        } 
    }
    

}