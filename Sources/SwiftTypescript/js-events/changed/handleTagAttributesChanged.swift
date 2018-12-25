import Foundation 
import SwiftDOM

public func handleTagAttributesChanged() {

    print("handleTagAttributesChanged")
    document.getTagAttributesChangedEvents().forEach { event in
        //print("event is happening here")
        //print(event)  

    }

}

