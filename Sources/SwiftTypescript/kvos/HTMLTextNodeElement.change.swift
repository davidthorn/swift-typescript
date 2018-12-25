extension HTMLTextNodeElement {

    public func changeEvent(from: String? , to: String?) {

        print("text Node text property changed from \(from!) to: \(to!)")
        let event = (id: self.id! , node: self , from: from , to: to )
        document.add(textNodeChangedEvent: event)
    }

}