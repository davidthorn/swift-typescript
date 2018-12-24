extension HTMLTag {

    public func attributesChanged(from: [(key: String , value: String)] , to: [(key: String , value: String)]) {

        print("attributes from for \(self.id!)")
        // let event = (id: self.id! , node: self , from: from , to: to )
        // document.add(textNodeChangedEvent: event)
    }

}