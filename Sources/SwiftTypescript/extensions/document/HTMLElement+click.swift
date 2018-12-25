import SwiftDOM

extension HTMLElement {

    public func click(completion: @escaping DOMClickEventHandler ) {
        
        // if self.getEventHandlers()["click"] == nil {
        //     self.getEventHandlers()["click"] = []
        // }
        let handler = (id: self.id! ,
                        eventName:"click" , 
                        target: self , 
                        handler: completion )
        // self.getEventHandlers()["click"]!.append(handler)

        self.addEventHandler(handler: handler)   
        document.add(eventHandler:handler )
    }

}