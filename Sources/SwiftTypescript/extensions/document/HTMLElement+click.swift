import SwiftDOM

extension HTMLElement {

    public func click(completion: @escaping DOMClickEventHandler ) {
        
        let handler = (id: self.id! ,
                        eventName:"click" , 
                        target: self , 
                        handler: completion )
       
        self.addEventHandler(handler: handler)   
        document.add(eventHandler:handler )
    }

}