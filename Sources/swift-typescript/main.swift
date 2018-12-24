


let _bodyElement = body { p in

    p.child("wrapper") { e in

        e.h1("Main Title" , "main-title")
        e.p("my long text which I want to use") { pn in
            pn.click { 
                guard let title = document.getElementById("main-title") as? HTMLH1Element else { return }
                title.text = "Hi there"
            }
        }
    }

}

document.eventHandlers["click"]?.forEach { event in
    event.handler()
}

let result = _bodyElement.render()

print(result)