extension HTMLElement {

    public func click(completion: @escaping DOMClickEventHandler ) {
        
        if self.eventHandlers["click"] == nil {
            self.eventHandlers["click"] = []
        }
        let handler = (id: self.id! ,
                        eventName:"click" , 
                        target: self , 
                        handler: completion )
        self.eventHandlers["click"]!.append(handler)
                                            
        document.add(eventHandler:handler )
    }

}