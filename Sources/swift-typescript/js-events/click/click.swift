public func handleClickEvents() {

    document.eventHandlers["click"]?.forEach { event in

        event.handler()
        document.textNodeChangedEvents.forEach { change in
            print("changed \(change.id)")
        }

        document.textNodeChangedEvents.removeAll()
    }

}