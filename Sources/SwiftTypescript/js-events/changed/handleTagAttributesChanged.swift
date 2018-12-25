import Foundation 

public func handleTagAttributesChanged() {

    print("handleTagAttributesChanged")
    document.tagAttributesChangedEvents.forEach { event in
        //print("event is happening here")
        //print(event)  

    }

}

