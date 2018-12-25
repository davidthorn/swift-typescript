import Foundation
import SwiftDOM
import SwiftElement

_ = FileManager.default.createFile(atPath: "./events.js" , contents: "".data(using: .utf8))

document.head { headElement in
    
    headElement.scripts(src: [
        "./events.js"
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
                title.text = "Hi there"
                pn.text = "I am changed too"
                
            }
        }
    }
}

let prerender = document.render()
handleClickEvents() 
handleTagAttributesChanged()
let result = document.render()

_ = FileManager.default.createFile(atPath: "./index.html" , contents: prerender.data(using: .utf8))
print("we are here")