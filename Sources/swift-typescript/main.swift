
document.head { headElement in
    
    headElement.scripts(src: [
        "./app.js"
    ])

    headElement.links(href: [
        "./layout.css"
    ])
}


document.body { p in
    
    p.child("wrapper") { e in

        e.h1("Main Title" , "main-title")
        e.p("my long text which I want to use") { pn in
            pn.click { 
                guard let title = document.getElementById("main-title") as? HTMLH1Element else { return }
                title.text = "Hi there you all"
            }
        }
    }
}

handleClickEvents()

let result = document.render()

print(result)